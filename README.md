# Fliq Dating App

A Flutter dating app with modern UI design and MVC architecture, built based on provided UI mockups.

## Features

- **Splash Screen**: Welcome screen with social login options
- **Phone Authentication**: Phone number entry and OTP verification
- **Messages**: Chat list with user profiles and online status
- **Chat**: Individual chat screen with message bubbles
- **Clean Architecture**: Separation of concerns with services layer
- **Service Layer**: Dedicated services for API calls and business logic
- **State Management**: Provider for reactive UI updates
- **Dependency Injection**: Service locator pattern for loose coupling
- **Custom Theme**: Pink/coral color scheme matching the design

## Project Structure

```
lib/
├── core/
│   ├── constants/
│   │   └── app_constants.dart     # App-wide constants
│   ├── network/
│   │   └── dio_client.dart        # HTTP client setup
│   ├── routes/
│   │   └── app_router.dart        # Navigation routes
│   └── theme/
│       └── app_theme.dart         # App theme configuration
├── controllers/
│   ├── auth_controller.dart       # Authentication state management
│   └── chat_controller.dart       # Chat state management
├── services/
│   ├── api_endpoints.dart         # API endpoint definitions
│   ├── auth_service.dart          # Authentication API calls
│   ├── chat_service.dart          # Chat API calls
│   └── service_locator.dart       # Dependency injection
├── models/
│   ├── user_model.dart           # User data model
│   ├── message_model.dart        # Message data model
│   └── chat_model.dart           # Chat data model
├── views/
│   ├── auth/
│   │   ├── phone_screen.dart     # Phone number entry
│   │   └── otp_screen.dart       # OTP verification
│   ├── chat/
│   │   ├── messages_screen.dart  # Chat list
│   │   └── chat_screen.dart      # Individual chat
│   └── splash/
│       └── splash_screen.dart    # Welcome screen
├── widgets/
│   └── common/
│       ├── app_buttons.dart      # Reusable button components
│       ├── app_text_field.dart   # Reusable text field components
│       ├── chat_item.dart        # Chat list item widget
│       ├── gaps.dart             # Spacing widgets (VGap, HGap)
│       └── message_bubble.dart   # Message bubble widget
└── main.dart                     # App entry point
```

## Dependencies

- **provider**: State management
- **dio**: HTTP client for API calls  
- **go_router**: Navigation and routing
- **google_fonts**: Custom fonts
- **intl_phone_field**: Phone number input
- **pin_code_fields**: OTP input

## Getting Started

1. **Install dependencies:**
   ```bash
   flutter pub get
   ```

2. **Run the app:**
   ```bash
   flutter run
   ```

## Demo Features

- The app includes mock data for demonstration
- OTP verification accepts `123456` as valid code
- Chat functionality with real-time UI updates
- Responsive design following Material Design 3

## Service Architecture

The app follows a clean architecture pattern:

### **Services Layer:**
- **AuthService**: Handles authentication API calls (OTP, verification, user profile)
- **ChatService**: Manages chat operations (load chats, send messages, search users)
- **ServiceLocator**: Dependency injection container for service instances

### **Controllers Layer:**
- **AuthController**: Manages authentication state and UI updates
- **ChatController**: Manages chat state and UI updates
- Controllers only handle state management, all API logic is in services

### **API Integration:**
- Authentication endpoints (`/auth/registration-otp-codes/actions/phone/*`)
- Chat endpoints (`/chat/chat-messages/queries/*`)
- Proper error handling and loading states
- Mock implementations for demo purposes

## Design

The UI closely follows the provided mockups with:
- Custom pink/coral color scheme (#E91F7B)
- Modern card-based layout
- Smooth animations and transitions
- Material Design 3 components

## Common Components

The app includes reusable components for consistent UI:
- **VGap/HGap**: Consistent spacing widgets (`VGap(16)`, `HGap(8)`, `Gaps.v24`)
- **AppElevatedButton**: Themed elevated button with loading states
- **AppOutlinedButton**: Themed outlined button with loading states
- **AppTextButton**: Themed text button for secondary actions
- **SocialButton**: Social media login buttons (Google, Facebook, Phone)
- **AppTextField**: Enhanced text field with app theming
- **AppSearchField**: Search field with filter icon
- **AppPasswordField**: Password field with visibility toggle
- **AppEmailField**: Email field with validation

## Testing

Run analysis to check code quality:
```bash
flutter analyze
```

Build the app:
```bash
flutter build apk
```