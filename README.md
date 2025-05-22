# FinEase

**FinEase** is a cross-platform personal finance manager built for the official Barclays banking app in Southeast Asia (developed during the official Barclays Fintech Hackathon), designed to help users track expenses, plan budgets, and visualize spending habits with rich, interactive charts. Leveraging Flutter on the front end and a Node.js/Express backend, FinEase seamlessly integrates with Barclays’ APIs to deliver a secure, intuitive experience on any device.

---

## 🚀 Key Features

- **Expense & Income Tracking**  
  Create, edit, and categorize transactions in real time, with data synced directly to your Barclays account.

- **Budget Planning**  
  Set monthly budgets by category and receive alerts when you’re close to your limit, all within the Barclays mobile app.

- **Data Visualization**  
  Interactive pie, bar, and line charts to analyze spending trends and income vs. expense patterns.

- **Multi-Platform Support**  
  Flutter-powered iOS & Android apps and a responsive web client embedded in the Barclays portal.

- **Secure Authentication**  
  OAuth2 integration with Barclays’ identity platform, JWT-backed sessions, and secure password reset flows.

- **Offline Mode**  
  Cached transactions are stored locally and automatically synced to Barclays’ servers once connectivity is restored.

---

## 🛠️ Tech Stack

| Layer       | Technology                           |
| ----------- | ------------------------------------ |
| Frontend    | Flutter & Dart                       |
| Backend API | Node.js, Express.js                  |
| Database    | MongoDB (Mongoose ORM)               |
| Auth        | Barclays OAuth2, JWT, bcrypt         |
| Deployment  | Docker, GitHub Actions CI, AWS ECS   |
| Integration | Barclays Open Banking APIs           |

---

## 📦 Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev) (>= 3.0)  
- [Node.js](https://nodejs.org) (>= 18) & npm  
- Barclays developer credentials and API access

### Clone the Repo

```
git clone https://github.com/aritra1804/FinEase.git
cd FinEase
```

## ⚙️ Running Locally

### 1. Backend

````
# Navigate to the backend folder
cd backend

# Install dependencies
npm install

# Copy and edit environment variables
cp .env.example .env
# → open .env and set:
#    MONGODB_URI=<your MongoDB connection string>
#    BARCLAYS_API_KEY=<your Barclays Open Banking API key>
#    JWT_SECRET=<your JWT secret>

# Start the development server
npm run dev
````

### 2. Frontend(Mobile & Web)
````
# Navigate to the Flutter app folder
cd ../app

# Install Flutter dependencies
flutter pub get

# To run on an emulator or device:
flutter run

# To build for web:
flutter build web
````

## 🎨 Usage
- Authenticate via OAuth2 with your Barclays credentials.

- Add a new transaction—choose “Expense” or “Income,” set amount, date, category.

- Navigate to Budgets to create monthly spending limits.

- View Analytics for interactive charts showing your spending patterns.

- Go offline? FinEase caches entries locally and syncs automatically when you’re back online.



