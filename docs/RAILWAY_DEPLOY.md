# Web Resume — Railway deployment runbook (23 October 2026)

## Release gate — do not expose publicly until passed

The website currently pins **Ruby 3.1.2** and **Rails 7.0.4.3**. Both
release lines are beyond security maintenance. Upgrade Ruby / Rails in a
separate, tested PR before publicly promoting the deployment:
https://rubyonrails.org/maintenance and
https://www.ruby-lang.org/en/downloads/branches/.

Also check and harden the email/contact form. It currently uses a process-local
rate-limit store and checks attachment extension/client MIME type only: those
are not a durable production anti-abuse/malware strategy. Prefer a verified
challenge, a persistent rate limit and server-side upload validation before
enabling SMTP on an internet-facing site. Do not advertise mail delivery until
an actual message and attachment has been received.

## Scope

* Create a **new** project `gor-web-resume` in the owner's existing Railway
  workspace. Do not reuse `first` or `mellow-stillness`.
* `first` currently shows two pending removal changes for unrelated
  services. **Do not** click its "Apply 2 changes / Deploy" button as part
  of this site deployment.
* The old `mellow-stillness` PostgreSQL volume has a deletion warning
  dated 2026-10-23. Do not claim the warning has been cancelled simply
  because the service is shown as online.
* Start with a separate PostgreSQL service in the new project.
* Connect `TheGor-365/web_resume`, branch `main`, only after the reviewed
  readiness PR has been merged.

## App service configuration

Railpack reads Ruby 3.1.2 from the Gemfile and Bundler 2.4.7 from the lockfile.
No Dockerfile is assumed. `railway.json` configures:

* Pre-deploy: `bin/rails db:prepare`, then
  `bin/rails career:seed_portfolio`
* Start: `bin/rails server -b 0.0.0.0`
* Healthcheck: `GET /up`, HTTP 200 `ok`

Note: fresh `db:prepare` runs the application's existing `db/seeds.rb`;
those legacy historical employment rows remain excluded from the public
portfolio by `Experience.portfolio_milestones`. The second task inserts
seven curated, source-dated technical milestones plus RU/EN Hexlet
certificates idempotently. The dates mean repository creation/certificate
issue, not verified client work.

Railway service variables (enter them in **Variables** within Railway):

```text
RAILS_ENV=production
RAILS_SERVE_STATIC_FILES=1
RAILS_LOG_TO_STDOUT=1
WEB_CONCURRENCY=1
RAILS_MAX_THREADS=3
DATABASE_URL=${{Postgres.DATABASE_URL}}
SECRET_KEY_BASE=<GENERATE WITH: bin/rails secret — ENTER INTO RAILWAY ONLY>
```

If the Postgres service is not named `Postgres`, use its actual Railway
reference name. `RAILS_MASTER_KEY` is optional only if the application uses
the encrypted Rails credentials; supply it via Railway Variables, never a
committed file or chat message. Do not set a secret in the GitHub repository.

Email remains **unconfigured** until separately tested:

```text
CAREER_GMAIL_APP_PASSWORD=<GMAIL APP PASSWORD — ENTER INTO RAILWAY ONLY>
```

Do not enable this variable on a public instance until the contact endpoint is
hardened as described in the release gate. No WhatsApp password/API is needed
for the existing wa.me button; its number/link must be checked in production.

## Manual Railway dashboard steps

1. From the Railway dashboard, click **New Project** (not on `first`), name
   it `gor-web-resume`, and add a **PostgreSQL** database.
2. Add a service from GitHub repo `TheGor-365/web_resume` on approved
   `main`. Railway may trigger an initial failed build until variables
   are entered; use build/deploy logs to investigate rather than modifying
   existing projects.
3. Set the variables above. Confirm the `railway.json` build, pre-deploy
   and start commands are effective. Redeploy, then under Networking choose
   **Generate Domain**. Keep the initial domain private from promotional
   posts until smoke tests pass.

## Verification checklist

* GET `/up` returns HTTP 200 with `ok`.
* GET `/ru`, `/en`, `/hy` load correct, stable localized content.
* Turbo works on all tabs in desktop and mobile; mobile locale controls
  operate without an obscured dropdown.
* Seven technical timeline events are present. Two Hexlet RU/EN certificate
  cards plus the original sixteen (if seeded) display correctly.
* Images, stylesheet, JS, favicon and both MP4s load (not missing assets).
* Public POST/PATCH/DELETE legacy resources are **404 / not routable**.
* GitHub API preview degrades gracefully when the API is unavailable.
* Contact form handles malformed input without exposing SMTP credentials;
  only mark actual sending/attachments working after a real received mail.
* Review deployment logs for DB, asset, memory, and worker errors.
* Check Railway usage and cost alerts before continued operation.

## References

* https://docs.railway.com/guides/rails
* https://docs.railway.com/deployments/pre-deploy-command
* https://docs.railway.com/pricing/plans
* https://railpack.com/languages/ruby/
