# Changelog

All notable changes to this project are recorded here.
Dates are the date of the commit, not of a release.

## 2026-08-31

- The line counts in the README are now checked by countdrift on every push.
  A number typed next to a file that changes is wrong in advance.
- The claims file uses the `lines` source: nothing executes.

## v1.1.0 - 2026-08-30

- Add `api_failure.dart`: six distinct failure outcomes for a call to a server,
  and no text inside them. Collapsing them into one generic error leaves the
  person unable to act; `rateLimited` in particular is a defence that worked,
  not a mistake.
- README and description no longer say "four": a fixed count next to a folder
  that grows is wrong in advance.

## v1.0.0 - 2026-08-30

First release: four widgets pulled out of a production app and de-coupled.
