# Flutter-Starter-Inator (Firebase Auth Template)

A reusable Flutter template with:
- Feature-based architecture (`core`, `shared`, `features`)
- Firebase Authentication (Email/Password + Google)
- Auth guard flow: Splash → AuthGuard → Login / Dashboard placeholder
- Secure-by-default UI code (no password logging/storage, safe error messages) 

> ⚠️ This template is **Firebase-ready** but intentionally **not connected to any Firebase project**.
> You must create your own Firebase project and run `flutterfire configure` to generate the required per-platform configuration files.

---

## 1) Prerequisites

- Flutter SDK installed
- Firebase project created (Authentication enabled)
- Google Sign-In enabled (for Google auth)

---

## 2) Install dependencies

```bash
flutter pub get
```

---

## 3) Create and configure Firebase (your project)

### 3.1 Create a Firebase project
1. Go to https://console.firebase.google.com/
2. Click **Add project**
3. Register your app for **Android** and/or **iOS**

### 3.2 Enable Firebase Authentication
In Firebase Console:
1. Navigate to **Authentication** → **Sign-in method**
2. Enable:
   - **Email/Password**
3. Save

### 3.3 Enable Google Sign-In (for Google login)
1. Firebase Console → **Authentication** → **Sign-in method**
2. Enable **Google**
3. Follow prompts to set up OAuth client configuration

---

## 4) Generate Firebase configuration files

This template intentionally does **not** include any of the generated Firebase config files.

After you create your Firebase project and register your apps, run:

```bash
flutterfire configure
```

This command generates:
- `android/app/google-services.json`
- `ios/Runner/GoogleService-Info.plist`
- (and/or other generated files depending on platform)

Those generated files are intentionally ignored by git (see `.gitignore`).

> ✅ After `flutterfire configure`, the template becomes functional without code changes.

---

## 5) Run the app

```bash
flutter run
```

---

## 6) How auth flow works (template behavior)

- On app start, `lib/main.dart` initializes Firebase:
  - `await Firebase.initializeApp();`
- Then `SplashPage` renders `AuthGuard`.
- `AuthGuard` listens to `FirebaseAuth.instance.authStateChanges()`:
  - **If user is logged out** → navigates to **Login**
  - **If user is logged in** → navigates to **Dashboard placeholder**

Auth screens included:
- Email & Password Sign Up
- Email & Password Sign In
- Forgot Password (sends reset email)
- Google Sign-In
- Logout (service exists; UI can call it from your pages)

---

## 7) Code locations (for customization)

### Routing
- `lib/core/routes/app_routes.dart`
- `lib/core/routes/app_router.dart`

### Auth service (Firebase integration)
- `lib/core/services/auth/auth_service.dart`

### Auth guard
- `lib/features/auth/auth_guard.dart`

### Auth UI pages
- `lib/features/auth/splash/splash_page.dart`
- `lib/features/auth/login/login_page.dart`
- `lib/features/auth/register/register_page.dart`
- `lib/features/auth/forgot_password/forgot_password_page.dart`

### Dashboard placeholder
- `lib/features/home/dashboard/dashboard_placeholder_page.dart`

### Reusable widgets
- `lib/shared/widgets/primary_button.dart`
- `lib/shared/widgets/secondary_button.dart`
- `lib/shared/widgets/app_text_field.dart`
- `lib/shared/widgets/password_text_field.dart`
- `lib/shared/widgets/loading_indicator.dart`
- `lib/shared/widgets/error_dialog.dart`
- `lib/shared/widgets/confirm_dialog.dart`

---

## 8) Security and best practices

The template’s auth code follows these principles:
- **Never stores passwords locally**
- **Never logs passwords**
- **Never hardcodes** Firebase API keys / project IDs / secrets
- Uses Firebase’s auth state stream for reliable session handling
- Converts common FirebaseAuthException codes into safe, user-friendly messages

---

## 9) GitHub safety (secrets & generated config)

This template updates `.gitignore` to prevent committing secrets/config.

Ignored examples:
- `.env` and `.env.*`
- `*.keystore`, `*.jks`
- Firebase generated platform files (google-services / plist)

> Do not commit any Firebase configuration files or OAuth secrets.

---

## 10) Common troubleshooting

### App crashes with “No Firebase App '[DEFAULT]'”
- Make sure you ran:
  - `flutterfire configure`
- Ensure your app can load generated Firebase config

### Google sign-in fails
- Verify Google Sign-In is enabled in Firebase Console
- Verify OAuth client setup for your app’s package name / bundle id

---

## Suggested README sections (if you maintain the template repo)

If you plan to publish this template, consider keeping the following sections:
1. Overview
2. Prerequisites
3. Firebase setup steps
4. `flutterfire configure` instructions
5. Auth flow description
6. File locations
7. Security / secrets policy
8. Troubleshooting

---

### Done
Once you run `flutterfire configure` in the consuming project, the template becomes functional.

