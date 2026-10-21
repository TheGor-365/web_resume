# Web Resume — Ruby on Rails Developer Portfolio

[Русский](#русский) | [English](#english)

Personal Ruby on Rails portfolio: résumé, about, public code projects, certificate archive, and a timeline of software-development milestones.

> **Content-only rebuild.** This branch is based directly on the original `main` and preserves its HTML structure, Bootstrap 5 layout, navbar, CSS, dark background, independent two-column scroll panels, and 100px circular profile photo. The previous visual redesign is intentionally not included.

## Русский

### Что находится в приложении

- Исходный двухколоночный Rails-сайт с Turbo Stream переключением секций.
- Обновлённое резюме: Ruby on Rails, PostgreSQL, CRUD, формы, REST API, тестирование, Git.
- Карточки подтверждённых **учебных и личных** проектов: GitHub Quality, Classifieds, Web Resume, Property Finder.
- Открытый GitHub-профиль с другими упражнениями и репозиториями.
- История технических проектов, основанная на **датах создания GitHub-репозиториев**, а не на предполагаемых годах коммерческого стажа.
- Хронология обучения с подтверждённой датой сертификата Hexlet: **19 мая 2026**.
- Архив сертификатов. Оригинальные изображения шестнадцати исторических сертификатов лежат в `app/assets/images`.

**Стек данного приложения:** Ruby 3.1.2, Rails 7.0.x, PostgreSQL, Turbo, Stimulus, Bootstrap 5, Chartkick, Groupdate, importmap.

### Запуск на Linux

Нужны совместимая версия Ruby, Bundler и PostgreSQL. В существующем локальном клоне:

```bash
git fetch origin
git switch --track origin/career/content-only-from-main-20261021
bundle install
bin/rails db:prepare
bin/rails db:seed
bin/rails test
bin/rails server
```

Если ветка уже существует локально, используйте `git switch career/content-only-from-main-20261021`.

**Не выполняйте `db:reset`, `db:drop` или `git reset --hard` для обновления приложения.** Перед любыми операциями с данными стоит сохранить бэкап существующей PostgreSQL-базы.

`db/seeds.rb` переработан так, чтобы повторный запуск не дублировал известные записи и не перезаписывал исправленные вручную поля. Ранее восстановленные пять не-IT записей опыта **не удаляются**. В публичных разделах фильтруются только технические проекты/обучение. Создание репозитория на GitHub не означает оплаченный заказ.

### Добавление Hexlet RU/EN

Владелец уже располагает файлами:
- `~/Загрузки/ип/serts/hexlet_ru.jpg`
- `~/Загрузки/ип/serts/hexlet_en.jpg`

Выполнить из корня проекта:

```bash
cp -nv "$HOME/Загрузки/ип/serts/hexlet_ru.jpg" "$HOME/Загрузки/ип/serts/hexlet_en.jpg" app/assets/images/
# Проверить изображения, отсутствие персональной информации и право на публикацию.
git add app/assets/images/hexlet_ru.jpg app/assets/images/hexlet_en.jpg
git commit -m "Add approved Hexlet certificate images (RU/EN)"
git push origin career/content-only-from-main-20261021
bin/rails db:seed
```

Сиды добавляют до двух отдельных записей Hexlet **только при наличии соответствующего JPG** в `app/assets/images`. Существующие сертификаты не перезаписываются. Даты остальных старых сертификатов не установлены, поэтому мы их не выдумываем.

### Прозрачность данных

| Год | Событие | Источник |
| --- | --- | --- |
| 2020 | Property Finder | Создание GitHub-репозитория 25.08.2020 |
| 2023 | Web Resume | Создание GitHub-репозитория 11.03.2023 |
| 2025 | Classifieds | Создание GitHub-репозитория 13.09.2025 |
| 2025 | GitHub Quality | Создание GitHub-репозитория 02.12.2025 |
| 2026 | Hexlet, Ruby on Rails | Сертификат 19.05.2026 |
| 2026 | AI Course Actions Runner | Создание GitHub-репозитория 09.07.2026 |

Инфраструктурный runner — только открытая часть; сведения о приватной AI-платформе не публикуются. Учебные и личные проекты не выдаются за коммерческую работу.

### Безопасность и ограничения

- **Не коммитить** `config/master.key`, `config/credentials/*.key`, `.env`, оригиналы KYC, личные документы и клиентские данные.
- В исходном `main` остаются публичные CRUD-маршруты `messages` и `experiences` без подтверждённой авторизации. В этой ветке маршруты **не менялись**, чтобы избежать структурных изменений. Публичный деплой блокируется до security review.
- Bootstrap подключается оригинальным способом через jsDelivr CDN. Если стили не загружаются, проверьте Network/Console браузера и доступность CDN; не переписывайте страницы ради маскировки этой проблемы.
- **Переключателя RU/EN пока нет** — требование сохранить исходную HTML-структуру имеет приоритет. Полноценную локализацию надо внедрять отдельно, после стабилизации.
- Исходный README `main` был шаблонным. Эта инструкция обновлена только в отдельной ветке.
- Не заявлять, что live demo работает, пока он не проверен.

### Проверка

```bash
bin/rails test
bin/rails runner 'puts "Developer milestones: #{Experience.public_technical.count}; Certificates: #{Certificate.count}"'
```

Далее визуально проверить главную страницу, переключение разделов, скролл внутри колонок, графики и изображения сертификатов. Верстка должна выглядеть точно как первоначальный Bootstrap-сайт с обновлёнными данными.

## English

This branch is a **content-only update of the original Rails layout**, not a redesign. The original Bootstrap/HTML/CSS and routes remain unchanged. It updates developer-oriented résumé text, source-backed public project links, technical milestones, and the repeatable seed process.

The portfolio draws on Ruby on Rails, PostgreSQL, CRUD, APIs, tests, and verified GitHub educational/personal repositories. Project dates represent **repository creation dates**, not paid employment. Previous non-IT entries are retained in the database but hidden from the public developer timeline.

**Setup:** Ruby 3.1.2, Rails 7.0.x, PostgreSQL, run `bundle install`, `bin/rails db:prepare`, `bin/rails db:seed`, `bin/rails test`, `bin/rails server`.

**Certificate images:** add the owner's `hexlet_ru.jpg` and `hexlet_en.jpg` files to `app/assets/images` and rerun `db:seed`. The date May 19, 2026 is explicitly confirmed; other certificate dates are unknown.

**Security:** the legacy public write routes have not been hardened in this content-only branch. Do not deploy publicly until authorization and dependency checks are completed. No RU/EN UI toggle is claimed here.

Repo: https://github.com/TheGor-365/web_resume
