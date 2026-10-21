# Web Resume — Gor Rails

[Русский](#русский) | [English](#english)

A bilingual personal portfolio built with Ruby on Rails.

> **Work in progress.** The `career/portfolio-rebuild-20261021` branch contains a new responsive design, RU/EN copy, source-backed projects and a technical timeline. Production deployment and tests still need verification.

## Русский

Это персональный сайт Rails-разработчика: профиль, направления услуг, реальные учебные и личные проекты с открытым кодом, сертификаты и хронология технических проектов.

### Стек

Ruby 3.1.2 · Rails 7.0.x · PostgreSQL · Turbo/Hotwire · importmap · Bootstrap 5 · Chartkick · Groupdate · I18n.

### Установка

Нужны Ruby версии проекта, Bundler и локальный PostgreSQL. Не публикуйте реальные пароли и `config/credentials/*.key`.

```bash
git clone https://github.com/TheGor-365/web_resume.git
cd web_resume
# Для обновлённой версии выберите ветку до запуска миграций:
git switch career/portfolio-rebuild-20261021
bundle install
bin/rails db:prepare
bin/rails db:seed
bin/rails server
```

`db:prepare` для новой базы применяет схему; на существующей базе явно запустите `bin/rails db:migrate` **до** `db:seed`. В ветке есть миграция, добавляющая `certificates.issued_on`. Сиды повторяемые и сохраняют существующие пользовательские изменения. Исходные 16 изображений находятся в `app/assets/images`.

### Добавление двух сертификатов Hexlet

Владелец хранит исходники как `hexlet_ru.jpg` и `hexlet_en.jpg`. Они **не включены в GitHub автоматически**, а добавляются владельцем после проверки данных на изображениях. Из каталога репозитория:

```bash
cp -nv "$HOME/Загрузки/ип/serts/hexlet_ru.jpg" "$HOME/Загрузки/ип/serts/hexlet_en.jpg" app/assets/images/
git add app/assets/images/hexlet_ru.jpg app/assets/images/hexlet_en.jpg
git commit -m "Add approved Hexlet certificates in RU and EN"
git push origin career/portfolio-rebuild-20261021
bin/rails db:migrate
bin/rails db:seed
```

`db:seed` добавляет записи Hexlet только если оба соответствующих JPG присутствуют локально. Дата выдачи записана как 19 мая 2026 на основании ранее подтверждённой документации. Для старых сертификатов даты неизвестны и не придуманы.

### Языки

Русский по умолчанию: `/?locale=ru`. Английский: `/?locale=en`. Навигация передаёт параметр locale в Turbo Stream запросы.

### Источники и точность

Хронология разработчика основана на датах **создания репозиториев**, а не на возрасте пользователя, количестве лет коммерческого стажа или неподтверждённых заявках. 2020: Property Finder, 2023: Web Resume, 2025: Classifieds и GitHub Quality, 2026: Hexlet certificate и public AI Actions Runner. Не все проекты являются коммерческими. Приватные репозитории намеренно не отображаются.

### Проверка после обновления

```bash
bin/rails db:migrate
bin/rails test
bin/rails runner 'puts "Experiences: #{Experience.count}; Certificates: #{Certificate.count}"'
bin/rails server
```

Проверить вручную: RU/EN, переходы по вкладкам, проекты, изображения сертификатов, график, ширина 390px и ошибки браузера. Публикация живого сайта и актуальные персональные контакты требуют отдельного подтверждения владельцем.

### Безопасность

- Публичные CRUD-маршруты `messages` и `experiences` в ветке удалены; модели и старые записи базы сохранены. Если понадобится редактор, нужен отдельный защищённый интерфейс.
- Не коммитить `production.key`, `master.key`, .env и приватные документы.
- В истории старых коммитов есть устаревшие личные контакты: замена в новой ветке не стирает Git-историю.
- Актуализация зависимостей, дополнительные тесты и проверка развертывания остаются задачами перед публичным запуском.

## English

Personal, bilingual Ruby on Rails portfolio with a developer profile, selected real repositories, educational credentials and an evidence-based technical timeline.

**Stack:** Ruby 3.1.2, Rails 7.0.x, PostgreSQL, Turbo/Hotwire, Bootstrap, Chartkick, Groupdate and Rails I18n.

**Local setup:** install compatible Ruby and PostgreSQL, check out `career/portfolio-rebuild-20261021`, run `bundle install`, `bin/rails db:prepare` for new databases or `bin/rails db:migrate` for existing ones, then `bin/rails db:seed` and `bin/rails server`.

The latest migration tracks the known certificate issue date. Historic certificate dates remain unknown. Two Hexlet JPG files must be added manually by the owner; no certificates are invented.

**Links:** [Repository](https://github.com/TheGor-365/web_resume) · [GitHub profile](https://github.com/TheGor-365). Production demo and automated test status have not been verified in this update.
