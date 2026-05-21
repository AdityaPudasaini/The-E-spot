# Introduction

The E-Spot is a Java-based web application that combines e-commerce functionality with an online auction system. Developed as a coursework project, the application aims to simulate a real-world digital marketplace where users can buy and sell products either at fixed prices or through competitive bidding.

The platform is inspired by established marketplaces such as eBay and Facebook Marketplace, where buyers and sellers interact within a shared environment. It integrates the convenience of traditional online shopping with the dynamic nature of auction-based transactions, allowing users to experience both purchasing methods within a single system.

The application is built using Java technologies including Servlets, JSP, and JDBC, developed within the Eclipse IDE. Apache Tomcat is used as the web server, while XAMPP provides the MySQL database environment. This technology stack reflects industry-standard practices in Java web development.

The primary motivation behind The E-Spot was to bridge the gap between theoretical knowledge and practical implementation. While concepts such as MVC architecture, session management, and database connectivity are introduced in academic settings, this project provided hands-on experience in applying those concepts to a real system. It involved debugging, system design decisions, and handling real-world development challenges, resulting in a deeper and more practical understanding of software development.

## Purpose

The purpose of The E-Spot is to create a secure and dynamic online marketplace where users can trade goods either through fixed pricing or auction-based bidding.

The auction feature addresses a common challenge faced by sellers—determining the appropriate value of unique or rare items. By allowing buyers to place competitive bids, the system helps establish a fair market price organically.

Additionally, the platform includes an Admin Dashboard that enables administrators to manage users, monitor listings, and maintain a safe, fair, and professional marketplace environment.

## Audience

The system is designed for two primary user groups:

General Users (Buyers/Sellers): Individuals who wish to buy or sell products either through direct purchase or auction bidding.
Administrators: Users responsible for managing the platform, monitoring activities, and ensuring the system operates smoothly and securely.

## Feature List

The E-Spot includes the following key features:

Authentication:
Secure user registration and login system with password hashing using BCrypt. Users are redirected based on their roles (admin or member).
Product Browsing and Listing Management:
Users can browse products with detailed descriptions, images, and pricing. Administrators can manage listings by adding, updating, or deleting products.
Cart System:
Users can add products to a shopping cart to enhance the purchasing experience.
Wishlist:
Users can save out-of-stock products to a wishlist and receive updates when they become available.
Admin Dashboard:
Provides administrators with insights such as revenue tracking, user activity, and control over product listings.
Review System:
Users can provide feedback and rate the platform to suggest improvements.

## Tools Used

Developing a professional web application involves more than just writing code. It requires a combination of tools that work together to support development, design, database management, and documentation. The E-Spot was developed using a set of industry-standard tools, each selected for its specific advantages.

### Eclipse IDE

Eclipse IDE served as the primary development environment for this project. It is a powerful Integrated Development Environment specifically designed for Java development and widely used in professional and enterprise settings.

The Enterprise Edition of Eclipse was used due to its built-in support for web development, including seamless integration with Apache Tomcat. This allowed the application to be deployed and tested directly within the IDE without requiring complex external configurations.

Eclipse provides features such as real-time syntax error detection, code auto-completion, structured project management, and integration with version control systems like Git. Its built-in debugger was particularly useful for identifying and resolving issues by allowing step-by-step code execution and analysis.

### XAMPP

XAMPP is an open-source server solution that bundles essential tools required for web development. In this project, it was primarily used to manage the MySQL database.

It also includes phpMyAdmin, a web-based interface that simplifies database management tasks such as executing SQL queries, managing tables, and verifying stored data.

MySQL was chosen due to its ability to efficiently manage relational data. It supports structured relationships such as users, products, and transactions using foreign keys, making it ideal for this application. XAMPP provided a convenient local development environment without requiring remote server access.

### Figma

Figma was used as the primary design tool for the project. It is a cloud-based platform that allows teams to collaboratively design user interfaces in real time.

The design process began with wireframes to outline the layout of each page, followed by high-fidelity designs that included colors, typography, and UI components. This approach ensured that all interface elements were planned before development began, reducing the need for redesign during implementation.

### Draw.io

Draw.io is a diagramming tool used to design the database structure before implementation. It was used to create Entity Relationship Diagrams (ERDs), which visually represent the relationships between database tables.

Creating these diagrams early in the process helped identify potential design issues such as missing relationships or redundant data. This planning step significantly reduced errors and saved time during database development.
