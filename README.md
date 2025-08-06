# Doctor Assistant System 🩺✨  
**AI-Powered Healthcare Platform for Doctors and Patients**  
*Graduation Project 2024 - Medical Informatics Program, FCI-ZU*

[![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter)](https://flutter.dev)
[![Django](https://img.shields.io/badge/Django-092E20?logo=django)](https://www.djangoproject.com)
[![Firebase](https://img.shields.io/badge/Firebase-FFCA28?logo=firebase)](https://firebase.google.com)

## 🌟 Overview
**Doctor Assistant** is a full-stack healthcare solution designed to:
- Empower doctors with AI diagnostic tools while retaining clinical decision authority
- Streamline patient access to healthcare services through telemedicine
- Bridge communication gaps between medical professionals and patients
- Modernize clinic management and appointment systems

> *"Technology revolutionizing healthcare – one diagnosis at a time"*

---

## 👥 Team
| Role | Members |
|------|---------|
| **Supervisors** | Dr. Hanaa Hamza • Eng. Aliaa Ahmed |
| **Team Lead** | Ahmed Saber (Backend, Database) |
| **Backend/Database** | Ebrahim Mohamed |
| **Machine Learning** | Ahmed Mohamed • Aya Rabee |
| **Flutter Development** | Yahya Shapan • Heba Ramzy • Aya Rabee |
| **UI/UX & Systems Analysis** | Mostafa Abdelhamed |

---

## ✨ Key Features
### 👨‍⚕️ **For Doctors**
- **AI Disease Detection**: Lung disease diagnosis via X-ray analysis
- **Clinic Management**: Add/update clinics, manage schedules
- **Telemedicine**: Real-time chat with patients
- **Report Generation**: Create medical reports with AI assistance
- **Appointment Oversight**: Finalize patient reservations
- **Fee Management**: Payment processing for services

### 👩‍⚕️ **For Patients**
- **Doctor Discovery**: Search specialists by field/location
- **Appointment Booking**: Schedule in-clinic or online sessions
- **Medical Data Upload**: Share X-rays for diagnosis
- **Favorites System**: Save preferred doctors
- **Rating System**: Review healthcare experiences
- **Secure Payments**: Integrated payment gateway

### 👑 **Admin Dashboard**
- Doctor registration approval/rejection
- Activity monitoring (appointments, diagnostics)
- User management tools
- System analytics

---

## 🛠️ Technology Stack
| Layer | Technologies |
|-------|--------------|
| **Frontend** | Flutter (Mobile) • React.js (Web Admin) |
| **Backend** | Django REST Framework • Firebase |
| **AI/ML** | TensorFlow • Custom CNN Models (Pneumonia Detection) |
| **Database** | Firebase Firestore • PostgreSQL |
| **DevOps** | Docker • GitHub Actions |
| **Design** | Figma (Prototyping) • Draw.io (Diagrams) |

---

## 📦 Installation
```bash
# Clone repository
git clone https://github.com/yourusername/doctor-assistant.git

# Mobile app (Flutter)
cd mobile_app
flutter pub get
flutter run

# Backend setup (Django)
cd backend
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python manage.py runserver

# Admin dashboard
cd admin_dashboard
npm install
npm start
