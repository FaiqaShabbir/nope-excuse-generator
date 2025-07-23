# Nope! - Excuse Generator 🚫

A viral micro-app that generates hilarious excuses for skipping plans, work, or anything else you want to avoid!

## ✨ Features

- **🎲 Random Excuse Generator** - Tap to get a new, funny excuse
- **📁 Category Filtering** - Filter by Work, Gym, Family, Dating, Social, Money, or General
- **❤️ Save Favorites** - Heart your favorite excuses to save them
- **📤 Share & Copy** - Share excuses to social media or copy to clipboard
- **🎨 Modern UI** - Beautiful, meme-worthy design with smooth animations
- **📱 Cross-Platform** - Works on both iOS and Android

## 🚀 Quick Start

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd nope_excuse_generator
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📱 App Structure

```
lib/
├── main.dart                 # App entry point
├── models/
│   └── excuse.dart          # Data models
├── services/
│   ├── excuse_service.dart  # Excuse management
│   └── favorites_service.dart # Favorites storage
├── screens/
│   ├── home_screen.dart     # Main screen
│   └── favorites_screen.dart # Favorites screen
├── widgets/
│   ├── excuse_card.dart     # Excuse display card
│   └── category_selector.dart # Category filter
└── assets/
    └── excuses.json         # Excuse database
```

## 🎯 Core Features Explained

### Excuse Generation
- Loads 50+ hand-curated excuses from JSON
- Random selection with category filtering
- Smooth animations and transitions

### Category System
- **General** 🤷‍♂️ - Universal excuses
- **Work** 💼 - Office and professional excuses
- **Gym** 💪 - Fitness and workout excuses
- **Family** 👨‍👩‍👧‍👦 - Family-related excuses
- **Dating** 💕 - Relationship excuses
- **Social** 🎉 - Social event excuses
- **Money** 💰 - Financial excuses

### Favorites System
- Local storage using SharedPreferences
- Add/remove favorites with heart button
- Dedicated favorites screen
- Clear all favorites option

### Sharing Features
- Native share to social platforms
- Copy to clipboard functionality
- Custom share text with app branding

## 🎨 UI/UX Design

- **Color Scheme**: Modern purple/indigo theme
- **Typography**: Inter font family
- **Animations**: Smooth fade and slide transitions
- **Layout**: Card-based design with shadows
- **Responsive**: Adapts to different screen sizes

## 📊 Sample Excuses

- "I can't come, my cat just started therapy."
- "I'm currently in a staring contest with my ceiling fan."
- "My plants are emotionally dependent on me today."
- "I got trapped under my blanket and it's a trust issue now."
- "Mercury is in reverse gear again."

## 🔧 Dependencies

- `flutter_animate` - Smooth animations
- `google_fonts` - Custom typography
- `shared_preferences` - Local storage
- `share_plus` - Social sharing

## 🚀 Deployment

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## 🎯 Future Enhancements

- [ ] User-generated excuses
- [ ] Voice excuse generation
- [ ] Premium excuse packs
- [ ] Analytics and insights
- [ ] Dark mode support
- [ ] Custom excuse builder

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---

**Made with ❤️ for people who need creative excuses!** 