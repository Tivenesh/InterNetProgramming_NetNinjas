# NetNinjas TVPSS Project

This project, "TvpssApp," is a comprehensive web application designed to manage the TVPSS (Program TV Pusat Sumber Sekolah) activities for schools in Malaysia. It provides a multi-user environment with distinct roles and functionalities for Super Admins, State Admins, PPD Admins, School Admins, and Students. The application is built using a robust backend with Java, Spring, and Hibernate, and a dynamic front end with JSP.

---

## Table of Contents

- [Overview](#overview)
- [Goals](#goals)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Prerequisites](#prerequisites)
- [Installation and Setup](#installation-and-setup)
  - [Database Setup](#database-setup)
  - [Project Setup](#project-setup)
- [Running the Project](#running-the-project)
- [Folder Structure](#folder-structure)
- [User Roles & Credentials](#user-roles--credentials)
- [License](#license)
- [Contact](#contact)
- [Acknowledgments](#acknowledgments)

---

## Overview

The TVPSS App is designed to streamline the administration and participation in the TV-PSS program. It allows different stakeholders to interact with the system based on their roles:

-   **Java Spring Backend:** Powers the application with RESTful principles, manages business logic, and ensures secure data handling with Spring Security.
-   **JSP Frontend:** Delivers a user interface for different roles to interact with the system, from managing users to submitting applications.
-   **Database Integration:** Uses Hibernate to interact with a MySQL database for all data persistence.

---

## Goals

1.  **Centralized Management:** To provide a single platform for managing all TV-PSS related activities.
2.  **Role-Based Access:** To ensure that users only have access to the functionalities relevant to their roles, enforced by Spring Security.
3.  **Efficient Workflow:** To streamline processes like school validation, student applications, and achievement tracking.
4.  **Scalability:** To build a system that can support a growing number of schools and users across different states.

---

## Features

-   **User Management:** Super Admins can create, read, update, and delete users for all roles.
-   **Role-Based Dashboards:** Each user role has a unique dashboard displaying relevant statistics and actions.
-   **School Information System:** School Admins can manage their school's profile, including logo and contact details.
-   **TV-PSS Versioning:** A system for PPD and State Admins to validate and approve a school's TV-PSS version based on its facilities and activities.
-   **Student Achievement Tracking:** School Admins can submit and manage student achievements.
-   **Crew Application System:** Students can apply for crew positions, and School Admins can manage these applications.
-   **Certificate Management:** State Admins can view applications and generate certificates for achievements.

---

## Technologies Used

-   **Backend:**
    -   Java 11
    -   Spring MVC 5.3.30
    -   Spring Security 5.7.3
    -   Hibernate 5.6.15.Final
-   **Frontend:**
    -   JSP (JavaServer Pages)
    -   JSTL (JSP Standard Tag Library)
    -   HTML, CSS, JavaScript
-   **Database:**
    -   MySQL 8.0.33
-   **Build & Dependency Management:**
    -   Apache Maven
-   **Server:**
    -   Apache Tomcat or any other Servlet Container.

---

## Prerequisites

-   JDK 11 or higher.
-   Apache Maven installed and configured.
-   MySQL database server.
-   An IDE like Eclipse or IntelliJ IDEA with web development tools.
-   A web server like Apache Tomcat.

---

## Installation and Setup

### Database Setup

1.  **Create the Database:**
    -   Open your MySQL client and create a new database named `tvpss_db`.
        ```sql
        CREATE DATABASE tvpss_db;
        ```

2.  **Configure Connection:**
    -   The database connection properties are configured in `src/main/java/com/tvpss/config/HibernateConfig.java`.
    -   By default, the application uses the following credentials. If needed, update them to match your MySQL setup:
        -   **Username:** `NetNinjas`
        -   **Password:** `NetNinjas123`
    -   The application is configured with `hibernate.hbm2ddl.auto` set to `update`, so Hibernate will automatically create the necessary tables when the application starts for the first time.

### Project Setup

1.  **Clone the Repository:**
    ```bash
    git clone <your-repository-url>
    cd TvpssApp
    ```

2.  **Import as a Maven Project:**
    -   Open your IDE (Eclipse, IntelliJ, etc.).
    -   Choose "Import Project from existing sources" and select the cloned repository.
    -   Import it as a Maven project. The IDE will automatically download the dependencies listed in the `pom.xml` file.

---

## Running the Project

1.  **Build the Project:**
    -   Using your IDE, build the project to generate the `.war` file. Alternatively, you can run from the command line in the project's root directory:
        ```bash
        mvn clean install
        ```
    -   This will create a `TvpssApp.war` file in the `target/` directory.

2.  **Deploy to Server:**
    -   Deploy the generated `TvpssApp.war` file to your Apache Tomcat server (or any other servlet container). You can usually do this by copying the `.war` file to the `webapps` directory of your Tomcat installation.
    -   Start the Tomcat server.

3.  **Access the Application:**
    -   Open your web browser and navigate to:
        ```
        http://localhost:8080/TvpssApp/
        ```
    -   You should be redirected to the login page.

---

## Folder Structure
