class PendingTransaction < ActiveRecord::Base
  include AASM
  include Instrumentation

  instrument :perform_submit

  enum state: { 
    pending:   0, 
    submitted: 1,
    confirmed: 2,
    dead:      3,
    errored:   4,
  }

  aasm :column => :state do
    # upon initial submission to the api server, a PendingTransaction is `:pending`
    state :pending, :initial => true

    # after submission to a stellard node, a pending tx is `:submitted` meaning we
    # will revisit your state at each ledger close
    state :submitted, :before_enter => :perform_submit

    # after we see a transaction in a validated ledger, it transitions to `:confirmed`
    # and we can the safely report to requesters that the transaction was successfully
    # submitted
    state :confirmed

    # a transaction transitions to dead when we _know_ that is can never succeed. this
    # will happen, for example, when the max_ledger has elapsed and the transaction hasn't
    # been successfully included in a ledger, or if the tx itself is malformed
    state :dead

    # A transaction transitions to errored when the most recent submission was
    # met with an error response from the hayashi core.  Note: this is not `dead`,
    # an error transaction will be retried in the future.
    # 
    state :errored

    # This submit event will 
    event :submit do
      transitions to: :submitted, from: [:errored, :pending]
    end
  end

  private
  def perform_submit
    # TODO
  end


end