# 📱 assignment_01 – Flutter API Search App

This is a Flutter application demonstrating API data fetching using **Clean Architecture** and the **BLoC pattern** for state management. It fetches posts from the JSONPlaceholder API and includes real-time search, recent search history, pull-to-refresh, and loaders.

---

## 📄 Features

- ✅ **Fetches posts** from [Fake API](https://fakestoreapi.com/products)
- 🔍 **Real-time search bar** for filtering posts by title or content
- 🕓 **Recent search history** maintained and displayed in a horizontally scrollable list
- 🔄 **Pull-to-refresh** functionality for reloading the posts list
- ⏳ **Loading indicator** while fetching data
- 📱 Responsive UI optimized for various screen sizes

---

## 🛠️ Tech Stack

- Flutter
- Dart
- BLoC (`flutter_bloc`)
- Dio Package
- Clean Architecture Principles

---

## 📦 API Used

**URL:** [[https://fakestoreapi.com/products](https://fakestoreapi.com/products)]  
This public REST API returns a list of dummy posts in the following format:

```json
[
  {
        "id": 1,
        "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
        "price": 109.95,
        "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
        "category": "men's clothing",
        "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        "rating": {
            "rate": 3.9,
            "count": 120
        }
    }
]
```

## 📸 Screenshots

| Home Page                                                                                          |
| -------------------------------------------------------------------------------------------------- |
| <img src="assets/screenshots/Screenshot_1752493881.png" alt="Home Page" width="300" height="600"/> |

---

## 🚀 Getting Started

1. Clone the repository

```bash
git clone https://github.com/aviekhande/assignment_api_fetch
cd assignment_api_fetch
```

2. Install dependencies
```bash
flutter pub get 
```
3. Run the app
```bash
flutter run
```
## 🔍 How Search & History Works

The search bar updates the results in real-time as you type.

Each non-empty search query is saved to recent searches.

The recent searches are shown as horizontal chips which can be tapped to re-trigger the search.

The list refreshes automatically with pull-to-refresh gesture.

## 👤 Author

Avinash Ekhande
💼 Flutter Developer
