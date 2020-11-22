# Transaction Submission

*NOTE (from Scott): this document is very incomplete.  It is mostly personal notes to help me think through the submission model and error handling, etc.*

---


In this document we will discuss several issues around getting your transactions into the payshares network.  We will discuss:

- the general architecture of how transactions are submitted to horizon and relayed to the payshares network.
- How to reliably send high volumes of transactions into the payshares network from a single account


## Transaction Lifetime

The rough lifetime of a successful transaction is as follows:

- Client generates transaction, signs it and wraps it in a transaction envelope
- Client submits envelope to horizon
- Horizon performs "pre-submission" validations:
  - Ensure the envelope is well formed
  - Ensure all signatures on the envelope are valid
  - Ensure the transaction's "ledger validity window" is not past
  - Ensure submitting account exists and is funded enough to pay `maxFee`
  - Ensure the transaction's sequence number is correct for the submitting account
- Horizon records transaction in local database
- Horizon submits envelope to the Payshares Core
- Payshares Core validates transaction, adds transaction to internal set, responds to
Horizon with the "submission response"
- Horizon returns submission response to client
- Payshares Core performs consensus
- Payshares Core applies and commits transaction to ledger database
- Horizon notices a new ledger has closed
- Horizon records final transaction result that was saved to the Payshares Core database
- Client checks Horizon for final transaction result

## Reliably sending high volumes of transaction

For most users of the payshares network, special care need not be taken for transaction submission.  They may simply sign and submit transactions to any of the public horizon servers and have confidence that their transaction will eventually get applied to the network.

Higher volume accounts must however take some more care to reliably interact with the Payshares network.  What differentiates a high volume account from a low volume account?  Whether or not your account will need to submit multiple transactions concurrently.  Most end users will make a payment, wait for the payment to finish, then make another payment.  When this is not the case, you should follow the procedures described below.

Let's first look at an overview of the principles involved in submitting many concurrent transactions to the Payshares network:

1.  For a given *submitting account*, submit transactions to a single Horizon node
2.  Use multiple submitting accounts to submit transactions across a set of Horizon instances in the case that your volume is greater than a single Horizon node.
3.  Use a separate *payment account* from the submitting accounts to create the payment operations contained within each transaction, allowing you to simplify balance management

Now we can define a few terms:

- The _submitting account_ is the account that pays the fee for the transaction as well as consumes a sequence number.
- 

Now let's dive into the details:

TODO (sorry about that)



