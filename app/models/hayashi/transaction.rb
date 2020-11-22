class Hayashi::Transaction < Hayashi::Base
  self.table_name  = "txhistory"
  self.primary_key = "txid"

  belongs_to :ledger_header, {
    class_name: "Hayashi::LedgerHeader",
    foreign_key: :ledgerseq,
    primary_key: :ledgerseq,
  }

  delegate :tx,          to: :envelope
  delegate :result,      to: :result_pair
  delegate :max_fee,     to: :tx
  delegate :min_ledger,  to: :tx
  delegate :max_ledger,  to: :tx
  delegate :operations,  to: :tx

  def envelope
    raw_envelope = Convert.from_base64(self.txbody)
    Payshares::TransactionEnvelope.from_xdr(raw_envelope)
  end
  memoize :envelope

  def result_pair
    raw_result = Convert.from_base64(self.txresult)
    Payshares::TransactionResultPair.from_xdr(raw_result)
  end
  memoize :result_pair

  def meta
    raw_meta = Convert.from_base64(self.txmeta)
    Payshares::TransactionMeta.from_xdr(raw_meta)
  end
  memoize :meta

  def submitting_account
    self.envelope.tx.source_account
  end

  def submitting_address
    Convert.base58.check_encode(:account_id, submitting_account)
  end

  def submitting_sequence
    tx.seq_num
  end

  def fee_paid
    result.fee_charged
  end

  def result_code
    result.result.switch
  end

  def result_code_s
    result_code.name
  end

  def participants
    # get all entries with type of "account"
    account_entries = meta.entries.
      select{|e| e.value.type == Payshares::LedgerEntryType.account }

    # extract the account id from each (both live and dead
    # entries expose it through `account_id`)
    account_entries
      .map{|e| e.value.account!.account_id}
      .uniq
  end
  memoize :participants


  def participant_addresses
    participants.map{|a| Convert.base58.check_encode(:account_id, a)}
  end
  memoize :participant_addresses

end
