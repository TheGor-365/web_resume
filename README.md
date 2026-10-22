# Web Resume — Ruby on Rails developer portfolio

> Status: personal portfolio under revision. The original two-column Bootstrap UI has been preserved. Current content and technical milestones are **local, uncommitted improvements** until the owner reviews and commits them. No verified public deployment is claimed.

[Русский](#русский) · [English](#english)

## Русский

### О проекте

Web Resume — персональный сайт Ruby on Rails-разработчика с резюме, информацией о проектах, архивом сертификатов и визуализацией этапов разработки. Исходный интерфейс 2023 года использует **две независимо прокручиваемые карточки**, Bootstrap 5 и Turbo Stream для переключения содержимого. Навигация, классы разметки и исходная сетка намеренно сохранены.

**Технологии этого приложения:** Ruby 3.1.2, Rails 7.0.x, PostgreSQL, Bootstrap 5 через CDN, Turbo, Stimulus, importmap, Chartkick и Groupdate.

### Основные разделы

- **Резюме:** специализация Rails, PostgreSQL, CRUD, API, отладка и тестирование.
- **Сопроводительное письмо:** задачи, инструменты и примеры кода, подтверждаемые репозиториями.
- **Проекты:** отдельные учебные и личные работы с исходными кодами (обновление ссылок — отдельный этап).
- **Сертификаты:** 16 исходных изображений из `app/assets/images`. Дополнительные файлы Hexlet на русском и английском владелец подготовил отдельно; их публикация пока не подтверждена.
- **Путь в разработке:** подтверждённые вехи по датам создания GitHub-репозиториев и обучения. Дата создания репозитория **не означает** дату завершения проекта, коммерческий контракт или непрерывный трудовой стаж.
- **Графики:** количество подтверждённых технических событий по годам и распределение по категориям через Chartkick/Groupdate.

### Подтверждённые точки портфолио

| Дата | Событие | Источник |
| --- | --- | --- |
| 2020-08-25 | Property Finder, учебное Rails-приложение | [GitHub](https://github.com/TheGor-365/property_finder) |
| 2023-03-11 | Web Resume, личный сайт | [GitHub](https://github.com/TheGor-365/web_resume) |
| 2024-07-08 | Rails Project 64, коллективный блог | [GitHub](https://github.com/TheGor-365/rails-project-64) |
| 2025-09-13 | Classifieds, учебная доска объявлений | [GitHub](https://github.com/TheGor-365/rails-project-65) |
| 2025-12-02 | GitHub Quality, учебные проверки кода | [GitHub](https://github.com/TheGor-365/rails-project-66) |
| 2026-05-19 | Hexlet, сертификат Ruby on Rails | Документ владельца, RU/EN |
| 2026-07-09 | AI Course Actions Runner, публичный workflow runner | [GitHub](https://github.com/TheGor-365/ai-course-actions-runner) |

### Установка и запуск

Требуются совместимая Ruby 3.1.2, PostgreSQL и Bundler. Имя development-базы — `web_resume`, тестовой — `web_resume_test`. Настройки расположены в `config/database.yml`; реальные пароли и ключи не должны попадать в репозиторий.

```bash
git clone https://github.com/TheGor-365/web_resume.git
cd web_resume
bundle install
bin/rails db:prepare
bin/rails server
```

Адрес: `http://localhost:3000`.

**Внимание:** в исходном `main` файл `db/seeds.rb` использует обычные `create`. Повторный запуск `bin/rails db:seed` на уже заполненной базе создаёт дубликаты. Не запускайте его повторно без проверки или использования идемпотентного загрузчика. Для локальной модернизации в октябре 2026 года добавлены технические события **отдельным локальным Rails runner**, при этом пять архивных записей о не-IT опыте сохранены в базе.

### Проверка

```bash
bin/rails test
bin/rails runner 'puts "Milestones: #{Experience.portfolio_milestones.count}"'
git diff --check
```

Если модель `Experience.portfolio_milestones` отсутствует, значит локальный патч данных ещё не применён. В исходном `main` соответствующего scope нет. Последний локальный прогон `bin/rails test`, переданный владельцем, не содержал тестов (**0 runs**). Успешное завершение такого прогона **не означает наличия покрытия**; нужны отдельные автоматические и ручные проверки.

Проверять вручную: две карточки, прокрутку каждой, переключение вкладок через Turbo, обе диаграммы, сертификаты, Bootstrap CSS и ссылки на GitHub. Новые зелёные ссылки открываются в отдельной вкладке без подчёркивания.

### Безопасность и ограничения

- Не коммитить `config/credentials/*.key`, `config/master.key`, токены, `.env`, документы KYC и клиентские сведения.
- В исходном `main` открыты маршруты `resources :experiences` и `resources :messages`; перед публичным деплоем требуется аудит авторизации и ограничение операций изменения данных.
- Оригинальные шаблоны и активы сохранены, состояние публичного сервера **не проверено**.
- Переключение RU/EN по сайту **пока не внедрено**. Двуязычный README не означает двуязычный пользовательский интерфейс.
- Старые ссылки и контент остальных разделов требуют отдельной проверки и актуализации.

### Контакты и профессиональные профили

- [GitHub — исходный код](https://github.com/TheGor-365)
- [Kwork — профиль исполнителя](https://kwork.com/user/thegor-365)
- [FL.ru — портфолио](https://www.fl.ru/users/7495500/portfolio/)
- [FreelanceJob — профиль исполнителя](https://www.freelancejob.ru/users/GorRailsDev/)
- [Facebook — Gor Web Development](https://www.facebook.com/gor.webdevelopment/)
- [Instagram — thatgorfromvan](https://www.instagram.com/thatgorfromvan/)
- **ВКонтакте:** сообщество Gor Web Development существует, но точный публичный URL не зафиксирован в текущем checkpoint. Footer показывает название неактивным, пока владелец не задаст `CAREER_VK_URL=https://vk.com/<точный_адрес>`. Неподтверждённый адрес не публикуется.

## English

Web Resume is a personal Ruby on Rails portfolio. It uses the original Bootstrap 5 two-card layout, Turbo Stream navigation, PostgreSQL, and Chartkick/Groupdate charts. The local working copy includes an updated résumé and a developer timeline based on actual GitHub repository creation dates and a confirmed Hexlet certificate date. These milestones are **not evidence of paid employment**.

**Stack:** Ruby 3.1.2, Rails 7.0.x, PostgreSQL, Bootstrap 5, Turbo, Stimulus, Chartkick, Groupdate.

**Local setup:** install compatible Ruby and PostgreSQL; run `bundle install`, `bin/rails db:prepare` for a fresh database, and `bin/rails server`. Do not repeatedly run the original non-idempotent `db/seeds.rb` against an existing database.

**Known limitations:** legacy public write routes need an authorization audit, the RU/EN UI toggle is not implemented, and a production deployment and automated test coverage have not been verified. Legacy career records are retained locally but excluded from the public technical milestone display by a local model scope. Do not publish secrets or private credentials.

**Repository:** https://github.com/TheGor-365/web_resume

## Gor Web Development — media assets

<!-- CAREER_GOR_BRAND_DOCS_V1 -->

The navbar and favicon use the owner's **G** mark. Optimized local assets are stored in `public/media/gor/` and served under `/media/gor/`; they do not depend on private Google Drive sharing or tokens. Promotional images and short videos appear in the Services and Projects Turbo sections. They are **illustrations**, not screenshots proving the functionality of the applications. Actual project behavior should be verified in source code/tests or separate screenshots.

The motion effects are scoped to `.career-*` elements and respect `prefers-reduced-motion`. Videos play on demand with browser controls and do not autoplay with audio. Original owner-controlled source files are catalogued in the patch's `MEDIA_SOURCES.md`. Verify rights before republishing material that includes third-party trademarks.
