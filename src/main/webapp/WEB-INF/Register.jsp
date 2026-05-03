<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/styles.css" type="text/css">
<style>
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

body {
  background-color: #fff;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  font-family: "Inter", Arial, sans-serif;
}

.page-wrapper {
  flex-grow: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 16px;
}

.registration-card {
justify-content:center;
align-items:center;
max-width:1152px;
  background: white;
  border-radius: 12px;
  overflow: hidden;
  width: 100%;
  display: flex;
  flex-direction: column;
  margin:10px;
  ackground: #F9E4D1;
background: linear-gradient(90deg,rgba(249, 228, 209, 1) 0%, rgba(236, 211, 189, 1) 51%, rgba(235, 235, 235, 1) 100%);
}

.info-panel {
  width: 100%;
  padding: 32px;
  display: flex;
  flex-direction: column;
}

.info-header h2 {
  font-size: 20px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 1px;
  display: flex;
  align-items: center;
  gap: 16px;
  margin-bottom: 32px;
}

.divider-line {
  height: 1px;
  background: #d1d5db;
  flex-grow: 1;
  display: block;
}

.illustration {
  display: flex;
  justify-content: center;
  margin-bottom: 32px;
}

.illustration img {
  max-width: 100%;
  height: auto;
  object-fit: contain;
}

.info-description {
  font-size: 14px;
  color: #6b7280;
  line-height: 22px;
  margin-bottom: 32px;
}

.benefits-list {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 16px 8px;
}

.benefit-item {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 14px;
  font-weight: 600;
  color: #374151;
}

.check-icon {
  color: #81A6C6;
  font-size: 16px;
  font-weight: 700;
}

.vertical-divider {
  display: none;
}

.form-panel {
  width: 100%;
  padding: 32px;
}

.form-title {
  font-size: 28px;
  font-weight: 700;
  color: #111827;
  border-left: 4px solid #81A6C6;
  padding-left: 12px;
  line-height: 28px;
  margin-bottom: 32px;
}

form {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.field-row {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 16px;
}

.field-group {
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.field-group label {
  font-size: 14px;
  font-weight: 500;
  color: #4b5563;
}

.field-group input,
.field-group select {
  padding: 8px 12px;
  border: 1px solid #d1d5db;
  border-radius: 6px;
  font-size: 14px;
  outline: none;
}

.field-group input:focus {
  border-color: #81A6C6;
  box-shadow: 0 0 0 1px #81A6C6;
}

.phone-input {
  display: flex;
}

.phone-input select {
  padding: 8px;
  border-radius: 6px 0 0 6px;
  background: #f9fafb;
  border-right: none;
}

.phone-input input {
  border-radius: 0 6px 6px 0;
  width: 100%;
}

.submit-row {
  padding-top: 16px;
}

.btn-register {
  width: 100%;
  background: #81A6C6;
  color: white;
  font-weight: 700;
  padding: 12px 16px;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  font-size: 15px;
  transition: background 0.2s;
}

.btn-register:hover {
  background: #6a92b5;
}

@media (min-width: 768px) {
  .registration-card {
    flex-direction: row;
  }

  .info-panel,
  .form-panel {
    width: 50%;
    padding: 48px;
  }

  .vertical-divider {
    display: block;
    width: 1px;
    background: #e5e7eb;
    margin: 48px 0;
  }
}
</style>
</head>
<body>
<%@include file="../components/header.jsp" %>
<div class="page-wrapper">
  <div class="registration-card">

    <div class="info-panel">
      <div class="info-header">
        <h2>Join Us Today <span class="divider-line"></span></h2>
      </div>

      <div class="illustration">
        <img src="images/shop.jpg" alt="Donation and Community Illustration" />
      </div>

      <p class="info-description">
  The E-Spot is your go-to marketplace for buying and reselling products at the best prices. 
  Create an account to list your items, reach thousands of buyers, and manage your sales all in one place.
</p>
<div class="benefits-list">
  <div class="benefit-item"><span class="check-icon">&#10003;</span> List & Sell Items</div>
  <div class="benefit-item"><span class="check-icon">&#10003;</span> Browse Deals</div>
  <div class="benefit-item"><span class="check-icon">&#10003;</span> Secure Payments</div>
  <div class="benefit-item"><span class="check-icon">&#10003;</span> Track Orders</div>
</div>

      
    </div>

    <div class="vertical-divider"></div>

    <div class="form-panel">
      <h2 class="form-title">Create Your Account</h2>

      <form action="#" method="POST" enctype="multipart/form-data">
        <div class="field-row">
          <div class="field-group">
            <label for="first-name">First name *</label>
            <input id="first-name" name="first-name" type="text" required />
          </div>
          <div class="field-group">
            <label for="last-name">Last name</label>
            <input id="last-name" name="last-name" type="text" />
          </div>
        </div>

        <div class="field-group">
          <label for="email">Email Address *</label>
          <input id="email" name="email" type="email" required />
        </div>

        <div class="field-row">
          <div class="field-group">
            <label for="dob">Date of Birth</label>
            <input id="dob" name="dob" type="date" />
          </div>
          <div class="field-group">
            <label for="phone">Phone number</label>
            <div class="phone-input">
              <select>
                <option>NP</option>
                
              </select>
              <input id="phone" name="phone" type="tel" placeholder="+977" />
            </div>
          </div>
        </div>

        <div class="field-group">
          <label for="password">Password</label>
          <input id="password" name="password" type="password" required />
        </div>

        <div class="field-group">
          <label for="confirm-password">Confirm Password</label>
          <input id="confirm-password" name="confirm-password" type="password" required />
        </div>
        <div class="field-group">
        <label for="photo">Insert Photo</label>
        <input type="file" name="image" accept="image/+" required>
        </div>

        <div class="submit-row">
          <button type="submit" class="btn-register">Register</button>
        </div>
      </form>
    </div>

  </div>
  </div>
  <%@include file="../components/footer.jsp" %>
</body>
</html>