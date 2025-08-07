# Homecenter test app

Home Center development app.

## Architecture

This project follows **Clean Architecture** using the following structure:

```
lib/
├── core/                        # Core files
│   ├── dependency_injection/    # Dependency injection Files
│   ├── theme/                   # Theme for visual colors
│   ├── utils/                   # Utility files (handlers)
│   └── widgets/                 # Repository implementations
├── features/                    # Features Folder (The features follows the next structure)
│   ├── data/                   # Data Layer
│   │     ├── datasources/             # Remote (API) and Local (Database) data sources
│   │     ├── models/                  # DTOs and data models
│   │     └── repositories/            # Repository implementations
│   ├── domain/                      # Business logic layer
│   │   ├── entities/                # Core business entities
│   │   ├── repositories/            # Repository interfaces
│   │   └── usecases/                # Business use cases
│   ├──presentation/                # UI layer
│   │   ├── blocs/                   # State management (BLoC pattern)
│   │   ├── pages/                   # Screen widgets
│   │   ├── widgets/                 # Reusable UI components
└── main.dart                    # App entry point
```

## Getting Started

### Prerequisites
- Flutter 3.24+ installed
- Dart 3.5+
- Android Studio / VS Code with Flutter extensions
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/euro-explorer.git
   cd euro-explorer
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code** (for DTOs and database)
   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```