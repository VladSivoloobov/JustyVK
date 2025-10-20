# JustyVK (Весточка)

<p align="center">
  <img src="JustyVK/Assets.xcassets/AppIcon.appiconset/Иконка.png" alt="JustyVK Logo" width="120"/>
</p>

Современный iOS клиент для мессенджера ВКонтакте, написанный на Swift с использованием SwiftUI.

> **⚠️ ВНИМАНИЕ:** Проект находится в активной разработке и еще не завершен.

## 🚀 Особенности

- 💬 **Мессенджер** - Полноценный функционал обмена сообщениями с поддержкой Long Polling
- 👥 **Друзья** - Просмотр списка друзей и их профилей
- 🎨 **Современный UI** - Красивый интерфейс на SwiftUI
- 🔔 **Уведомления** - Счетчик непрочитанных сообщений
- 📸 **Медиа** - Поддержка фотографий, стикеров и других вложений
- 👤 **Профили** - Просмотр профилей пользователей
- ⚙️ **Настройки** - Кастомизация приложения

## 📋 Требования

- iOS 15.0+
- Xcode 14.0+
- Swift 5.0+
- CocoaPods

## 🛠 Установка

1. Клонируйте репозиторий:

```bash
git clone https://github.com/yourusername/JustyVK.git
cd JustyVK
```

2. Установите зависимости через CocoaPods:

```bash
pod install
```

3. Откройте проект в Xcode:

```bash
open Весточка.xcworkspace
```

4. Выберите схему сборки и запустите проект

## 🏗 Архитектура

Проект следует архитектуре MVVM (Model-View-ViewModel):

### Структура проекта

```
JustyVK/
├── Models/              # Модели данных
│   ├── Messages/        # Сообщения и Long Polling
│   ├── Friends/         # Друзья
│   ├── Users/           # Пользователи
│   ├── Groups/          # Группы
│   ├── Photos/          # Фотографии
│   └── Chat/            # Чаты
├── Views/               # SwiftUI представления
│   ├── Auth/            # Авторизация
│   ├── Messenger/       # Мессенджер
│   ├── Friends/         # Друзья
│   ├── UserProfile/     # Профиль пользователя
│   └── Settings/        # Настройки
├── ViewModels/          # View Models
├── SwiftVK/             # Обертка VK API
│   ├── SwiftVK.swift
│   ├── SwiftVKMessages.swift
│   ├── SwiftVKFriends.swift
│   ├── SwiftVKUsers.swift
│   ├── SwiftVKPhotos.swift
│   └── SwiftVKGroups.swift
└── Utils/               # Утилиты
    ├── Extensions.swift
    ├── FileSystemInteractions.swift
    ├── Global.swift
    └── WebInteractions.swift
```

## 🔧 Технологии

- **SwiftUI** - Декларативный фреймворк для UI
- **Alamofire** - HTTP networking библиотека
- **VK API** - API ВКонтакте для работы с сообщениями, друзьями и профилями
- **Long Polling** - Получение событий в реальном времени
- **CocoaPods** - Менеджер зависимостей

## 📱 Функциональность

### Авторизация

- OAuth авторизация через VK WebView
- Безопасное хранение токена

### Мессенджер

- Просмотр диалогов
- Отправка и получение сообщений
- Поддержка вложений (фото, стикеры, видео)
- Long Polling для мгновенного получения сообщений
- Счетчик непрочитанных сообщений
- Закрепленные сообщения

### Друзья

- Список друзей
- Поиск по друзьям
- Статус онлайн/оффлайн
- Просмотр профилей

### Профиль пользователя

- Информация о пользователе
- Фотографии профиля
- Последняя активность

## 🔌 VK API Обертка (SwiftVK)

Проект включает собственную обертку для работы с VK API:

```swift
// Инициализация
let vk = SwiftVK(token: "your_access_token")

// Получение сообщений
vk.messages.getConversations { conversations in
    // Обработка диалогов
}

// Получение друзей
vk.friends.get { friends in
    // Обработка списка друзей
}

// Long Polling
vk.messages.longPoll.startLongPolling()
```

## 📝 TODO

- [ ] Кастомный таббар
- [ ] Поддержка голосовых сообщений
- [ ] Групповые чаты
- [ ] Темная тема
- [ ] Push уведомления
- [ ] Истории

## 🤝 Вклад в проект

Если вы хотите внести вклад в проект:

1. Сделайте Fork репозитория
2. Создайте ветку для новой функции (`git checkout -b feature/AmazingFeature`)
3. Закоммитьте изменения (`git commit -m 'Add some AmazingFeature'`)
4. Запушьте в ветку (`git push origin feature/AmazingFeature`)
5. Откройте Pull Request

## 📄 Лицензия

Этот проект создан в образовательных целях.

## 👤 Автор

**Vladislav**

## 🙏 Благодарности

- Команде ВКонтакте за API
- Сообществу Swift разработчиков
- Разработчикам Alamofire

---

⭐️ Если вам понравился проект, поставьте звездочку!
