# Web Resume | Персональный сайт Ruby on Rails-разработчика

[Русский](#русский) · [English](#english)

> **Status / Статус:** legacy personal portfolio (2023), restoration and bilingual modernization in progress. Screenshots and deployed demo have not been verified. This is not a production-ready security claim.

## Русский

Персональное Rails-приложение с профилем разработчика, опытом работы, разделами проектов и сертификатов. Главный экран содержит две панели, а переключение разделов реализовано с использованием Turbo Stream. Для визуализации карьерной истории используется Chartkick и Groupdate.

**Подтверждённые по исходникам возможности:** страницы «Резюме», «Обо мне», «Проекты», «Учебные проекты», «Сертификаты», «Опыт», «Timeline graph»; модели `Experience`, `Certificate`, `Message`; график CPE и круговая диаграмма опыта. Некоторые ссылки и текстовые данные исторические и должны обновляться перед публикацией.

**Стек:** Ruby 3.1.2, Rails 7.0.x, PostgreSQL, Turbo, Stimulus, importmap, Bootstrap 5, Chartkick, Groupdate.

### Локальная установка

```bash
git clone https://github.com/TheGor-365/web_resume.git
cd web_resume
# Проект рассчитан на Ruby 3.1.2. Используйте подходящую версию Ruby.
bundle install
bin/rails db:prepare
bin/rails db:seed
bin/rails server
```

Нужен локальный PostgreSQL и разрешение на создание БД. Конфигурация подключения находится в `config/database.yml`. **Не добавляйте реальные пароли в репозиторий.**

Если приложение уже запускалось, а графики показывают `No data`, сначала сделайте резервную копию актуальной базы, затем проверьте:

```bash
bin/rails runner 'puts "Experiences: #{Experience.count}; Certificates: #{Certificate.count}"'
```

В ветке `career/portfolio-rebuild-20261021` сиды сделаны повторяемыми: они добавляют отсутствующие записи по идентифицирующим полям без перезаписи уже существующих. Исходный `main` содержит обычные `create`; многократный `db:seed` из `main` способен создать дубли. Записи из сидов — исторические сведения, требующие проверки владельцем.

Изображения сертификатов находятся в `app/assets/images`; их наличие в исходниках **не заменяет** проверки подлинности и разрешения на публикацию. Некоторые картинки могут потребовать коррекции путей при изменении asset pipeline.

### Проверка

```bash
bin/rails test
```

Отдельно проверьте работу страниц, Turbo Stream, мобильную вёрстку и графики. **Состояние тестов и публичного деплоя в данном аудите не подтверждено.**

### Безопасность и дальнейшие работы

- Роуты `resources :experiences` и `resources :messages` включают операции изменения данных; до публичного деплоя необходимо ограничить административные действия, проверить авторизацию и CSRF.
- Заменить устаревшие биографию, контакты, локацию и демонстрационные ссылки **только подтверждёнными** данными.
- Перевести публичный интерфейс RU/EN с локализацией, не смешивая языки в шаблонах.
- Заменить устаревшую панель CPE и пустые графики корректной презентацией истории; добавить реальные кейсы, скриншоты, видео и брендовый визуал.
- Обновить версии зависимостей и провести регрессионные и security-тесты перед деплоем.

## English

A personal Ruby on Rails portfolio built as a two-panel site. It presents résumé, work experience, project and certificate sections, with Turbo Stream navigation and Chartkick/Groupdate experience charts.

**Source-verified stack:** Ruby 3.1.2, Rails 7.0.x, PostgreSQL, Turbo, Stimulus, importmap, Bootstrap 5, Chartkick and Groupdate.

**Run locally:** install compatible Ruby and PostgreSQL, run `bundle install`, `bin/rails db:prepare`, `bin/rails db:seed`, and `bin/rails server`. Read the database restoration notes above before seeding an existing installation.

**Known limitations:** legacy copy and contact details, unverified demo links, no confirmed production deployment, potential unauthorized CRUD endpoints, and incomplete localization. Screenshots, multilingual redesign, and security hardening are planned, not yet delivered.

## Assets and evidence

Production media planning and project fact checks are maintained separately in the owner's private Google Drive portfolio workspace. Do not commit identity documents, tokens, private client data or original KYC materials to this repository.

**Repository:** https://github.com/TheGor-365/web_resume
