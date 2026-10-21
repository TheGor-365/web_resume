# Web Resume — Gor Web Development

A personal, bilingual (RU/EN) Ruby on Rails portfolio featuring selected projects, certificates, and a historical career timeline.

Личный двуязычный сайт разработчика Ruby on Rails: проекты, сертификаты, профиль и карьерная хронология.

> **Status / Статус:** personal portfolio under active revision. The screenshots currently available from the previous design show a local development server; a working public deployment has **not** been verified. The timeline and certificate gallery depend on database seed records. Historical work entries originate in the previous repository and should be reviewed before a public launch.

## What it demonstrates / Что демонстрирует

- Rails MVC structure with server-rendered templates and Turbo Stream panel navigation.
- PostgreSQL models for historical experience, certificates, and archived data.
- Career charts based on actual Experience records, not arbitrary growth claims.
- RU/EN presentation with a language switch; readable responsive layout.
- Selected public GitHub projects, with educational/personal status disclosed.
- Branded image and short video, supplied by the project owner.
- Public read-only site: legacy unauthenticated write routes have been removed.

## Tech stack / Стек

The *repository* targets Ruby **3.1.2**, Rails **7.0.x**, PostgreSQL, Turbo, Stimulus/importmap, Bootstrap 5, Chartkick and Groupdate. These are **legacy pinned versions** and are not claimed to be up to date. A dependency upgrade and fresh security review should be performed before production deployment. Your system Ruby/Rails versions do not replace the versions pinned in this repository automatically.

## Local setup / Локальный запуск

Prerequisites: compatible Ruby and Bundler, running PostgreSQL, Node only if dependencies require it. Never commit secrets or production credentials.

~~~bash
git clone https://github.com/TheGor-365/web_resume.git
cd web_resume
# Use the Ruby version from .ruby-version (currently 3.1.2).
bundle install
# Adjust config/database.yml to match your *local* PostgreSQL role if needed.
bin/rails db:prepare
bin/rails db:seed
bin/rails server
~~~

Then open http://localhost:3000/ or http://localhost:3000/?locale=en .

**Existing database:** run only \`bin/rails db:seed\` after creating an independent backup if existing records matter. The seeds are intended to be repeatable and insert missing archived entries without dropping tables or replacing records. Never run \`db:reset\` on a database containing valuable data.

Check seed results with:

~~~bash
bin/rails runner 'puts "Experience: #{Experience.count}; Certificates: #{Certificate.count}"'
~~~

The original archived experience timeline in \`db/seeds.rb\` ends in 2023; it is historical content, not a claim about the developer’s entire 2026 employment history. The Hexlet Ruby on Rails certificate was issued on May 19, 2026. Some earlier archived course certificates are only as documented in the existing repository; verify each before highlighting it commercially.

## Locales / Языки

- Russian (default): \`/?locale=ru\`
- English: \`/?locale=en\`

Labels and current presentation copy are translated. Historical source records are preserved in the original language; the legacy experience items have approximate English descriptions for display. Edits to professional facts require the owner's approval.

## Project links / Портфолио

| Project | Public source | Type |
| --- | --- | --- |
| Web Resume | [Source](https://github.com/TheGor-365/web_resume) | Personal |
| GitHub Quality | [Source](https://github.com/TheGor-365/rails-project-66) | Educational |
| Classifieds | [Source](https://github.com/TheGor-365/rails-project-65) | Educational |
| Property Finder | [Source](https://github.com/TheGor-365/property_finder) | Educational, older code |
| AI Course Actions Runner | [Source](https://github.com/TheGor-365/ai-course-actions-runner) | Public automation component |

Links to hosted demonstrations are deliberately omitted until verified.

## Site images and video / Медиа

Public media under \`app/assets/images\` and \`app/assets/videos\` are copies of files provided by the site owner. They are not permission to redistribute the original brand assets, photographs or certificates as reusable template stock.

- Brand: \`app/assets/images/gor_brand_logo.png\`
- Short intro: \`app/assets/videos/gor_logo_intro_reel.mp4\`
- Certificates: \`app/assets/images/hexlet_rails_certificate_ru.jpg\` and \`hexlet_rails_certificate_en.jpg\`
- Legacy certificates: assets already present in the repository.

The original personal photograph is part of the existing repository. No KYC, passport or payment scans should be added.

## Safety / Безопасность

**Public-facing CRUD is disabled by routing.** The original project exposed \`messages\` and writable \`experiences\` controllers without authentication. This refresh removes those routes and keeps only read-only pages. Code for the legacy controllers remains in the repository for historical reference; do not re-enable mutations without proper authentication and authorization.

Before deploying publicly:

1. Test all links, Ruby dependencies, mobile breakpoints, charts, and seed restore on a disposable database.
2. Review archival job-history content, certificates, images, contact links, Rails credentials and browser security headers.
3. Run \`bin/rails test\`, \`bundle audit\` (when installed), \`bin/rails assets:precompile\`, and a credential/secrets scan.
4. Set real production environment variables and correct PostgreSQL configuration; do not use a production DB for demo or tests.
5. Check privacy and reuse rights for all displayed media and work samples.

## Roadmap / Дальнейшие задачи

- Validate a current live deployment and replace unverified demo URLs with working links.
- Get owner approval for up-to-date professional timeline and dedicated public contact email.
- Add authentic UI screenshots, 30-second product walkthrough and alt descriptions.
- Upgrade legacy dependencies with regression tests and deployment validation.
- Audit historical controllers and remove obsolete, unused code after confirmation.

## Contact / Связь

[GitHub](https://github.com/TheGor-365) · [Gor Web Development on Facebook](https://www.facebook.com/gor.webdevelopment/) · [Kwork](https://kwork.com/user/thegor-365)

No orders, testimonials, or successful payments are claimed by this README.
