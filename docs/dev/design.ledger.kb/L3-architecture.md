# L3 — Architecture

How the ledger meets a host proof engine. The one level that makes an encoding
commitment (`HYP_FIAT`); everything above it is substrate-free by construction.

- HOST_DB: "Claim S has status P" is always encodable as further host declarations; the host environment is already a persistent claim database
- DELEGATE: All proving is delegated to the host engine; the system never evaluates entailment -- authority: user
- FIAT_FORMS <- STIP: Stipulations admit two host encodings — global (environment-level fiat) and hypothetical (context-level: telescopes, sections, locales, frames); hypothetical fiat makes TRUST_BASE kernel-visible in the claim itself
- HYP_FIAT <- FIAT_FORMS, HASH_ID: Hypothetical fiat is the sole encoding for ledger-authored stipulations, all substrates; host-library global axioms are boundary conditions in TRUST_BASE, out of scope -- authority: user
- LEDGER_BESIDE <- DELEGATE, HOST_DB, HASH_ID: The system is a ledger beside the engine: persistent claim-keyed bookkeeping over host declarations
- ENC_CHOICE <- HOST_DB: An unforced encoding choice selects which experiment runs; it must be explicit and recorded with an author
