# MyBlog - Secure Blogging Platform 🛡️📝

MyBlog is a secure blogging platform built using **Java EE**, **JSP**, and **Servlets**, following the **Zero Trust Security Model** to ensure safe user interactions and data protection.

---

## 🚀 Features

### 🛡️ Security & Authentication
- ✅ **Zero Trust Architecture** (JWT Authentication, Role-Based Access Control)
- ✅ **Strong Password Policies** (8+ characters, special characters, and numbers)
- ✅ **Session Expiry & Token-Based Access**
- ✅ **CSRF & CORS Protection**
- 🔐 **OAuth Integration (Google Sign-In)**

### 📝 Blogging System
- 🖊️ Create, edit, and delete blog posts
- 📌 Like, comment, and share blogs
- 🔖 Save favorite blogs for later

### ⚙️ Admin Panel
- 👥 Manage users and their access levels
- 📚 Categorize and organize blogs
- 🗑️ Moderate and delete inappropriate content

### ⛓️ Blockchain Integration
- 🧾 **Blockchain-based Donation Logging** using **Solidity smart contracts**
- 🪙 Donations stored securely on an Ethereum-compatible testnet
- 🔗 Integrated with **Web3j** and **Ganache** for contract deployment and interaction

---

## 🏗️ Tech Stack

- **Backend:** Java EE (Servlets, JSP), MySQL, JDBC
- **Frontend:** HTML, CSS (Bootstrap), JavaScript
- **Security:** JWT Authentication, BCrypt Hashing, OAuth 2.0
- **Blockchain:** Solidity, Web3j, Ganache
- **APIs:** ipapi (IP Geolocation API)
- **Tools:** Tomcat, Eclipse/IntelliJ, GitHub

---

## 🔧 Installation & Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/myblog.git
   cd myblog
   ```

2. **Import into Eclipse/IntelliJ (as a Maven/Java EE project)**

3. **Set up the database**
   - Import the provided SQL file into MySQL
   - Update `db.properties` with your database credentials

4. **Configure Blockchain Environment**
   - Install [Ganache](https://trufflesuite.com/ganache/)
   - Start a local blockchain workspace
   - Compile and deploy the Solidity smart contract
   - Update Web3j configuration and contract address in your Java project

5. **Enable Google OAuth**
   - Create a project on [Google Cloud Console](https://console.cloud.google.com/)
   - Set OAuth 2.0 Client ID & redirect URI
   - Add credentials to `oauth.properties` or the servlet

6. **Set up IP Geolocation (ipapi)**
   - Register at [ipapi.com](https://ipapi.com/)
   - Add your API key to your servlet or helper class
   - Use it to track and log IP geolocation on login

7. **Run the project on Tomcat**

---

## 🙌 Related Repo
- [MyBlogAPI](https://github.com/farid-kheli/MyBlogAPI) service is a backed that searve the website blogs
- [SmartContract](#) the SmartContract used for Tiping ather withe eth  
---
## 📷 overview
![Screenshot_2025-05-23_17_30_30](https://github.com/user-attachments/assets/f7ebb596-bc36-404c-a696-12c563ba9e11)
![Screenshot_2025-07-08_16-26-10](https://github.com/user-attachments/assets/005d2355-eae4-4994-8a85-5745a85e1fbe)
![Screenshot_2025-07-08_16-26-22](https://github.com/user-attachments/assets/51bd1cfe-b459-4fb2-81e2-284f7816ada1)
![Screenshot_2025-07-08_16-27-59](https://github.com/user-attachments/assets/30775c97-8602-4f0a-ae70-54cc93c98c74)
![Screenshot_2025-07-08_16-28-52](https://github.com/user-attachments/assets/be9e83b6-734b-4c5c-a155-52fa6ec168a2)

## 📜 License

This project is open-source under the [MIT License](LICENSE).



