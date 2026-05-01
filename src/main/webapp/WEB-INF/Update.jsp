<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Your Profile</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen', 'Ubuntu', 'Cantarell', sans-serif;
            background-color: #f3f4f6;
        }

        .heading {
            background-color: #1e293b;
            color: white;
            padding: 1rem 0;
        }

        .heading-text {
            max-width: 1.5rem;
            margin: 0 auto;
            padding: 0 1rem;
        }

        .heading h1 {
            font-size: 1.25rem;
            font-weight: 600;
        }

        .main-container {
            max-width: 56rem;
            margin: 3rem auto;
            padding: 0 1rem;
        }

        .card {
            background-color: white;
            border: 2px dashed #d1d5db;
            border-radius: 0.5rem;
            padding: 2rem;
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .card-title {
            font-size: 1.125rem;
            font-weight: 600;
            color: #111827;
        }

        .edit-btn {
            padding: 0.375rem 1rem;
            border: 1px solid #d1d5db;
            background-color: white;
            color: #374151;
            font-size: 0.875rem;
            font-weight: 500;
            border-radius: 0.375rem;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .edit-btn:hover {
            background-color: #f9fafb;
        }

        .profile-photo-section {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
            padding-bottom: 2rem;
            border-bottom: 1px solid #e5e7eb;
        }

        .avatar {
            width: 4rem;
            height: 4rem;
            border-radius: 50%;
            background: linear-gradient(135deg, #bfef45 0%, #9acd32 100%);
            border: 2px solid #a4e804;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .avatar-text {
            color: #374151;
            font-weight: bold;
            font-size: 1.125rem;
        }

        .photo-info h3 {
            font-weight: 600;
            color: #111827;
            margin-bottom: 0.25rem;
        }

        .photo-info p {
            font-size: 0.875rem;
            color: #4b5563;
            margin-bottom: 0.75rem;
        }

        .photo-buttons {
            display: flex;
            gap: 0.5rem;
        }

        .btn-small {
            padding: 0.375rem 0.75rem;
            font-size: 0.75rem;
            font-weight: 500;
            border-radius: 0.375rem;
            border: none;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .btn-upload {
            background-color: #e5e7eb;
            color: #374151;
        }

        .btn-upload:hover {
            background-color: #d1d5db;
        }

        .btn-remove {
            background-color: #fee2e2;
            color: #b91c1c;
        }

        .btn-remove:hover {
            background-color: #fecaca;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .form-column {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-label {
            font-size: 0.875rem;
            font-weight: 500;
            color: #374151;
            margin-bottom: 0.25rem;
        }

        .form-hint {
            font-size: 0.75rem;
            color: #6b7280;
            margin-bottom: 0.25rem;
        }

        .form-input {
            padding: 0.5rem 0.75rem;
            border: 1px solid #d1d5db;
            border-radius: 0.375rem;
            font-size: 0.875rem;
            color: #6b7280;
            background-color: #f9fafb;
            font-family: inherit;
        }

        .form-input:disabled {
            cursor: not-allowed;
        }

        .account-settings {
            padding-top: 2rem;
            border-top: 1px solid #e5e7eb;
        }

        .account-settings h3 {
            font-weight: 600;
            color: #111827;
            margin-bottom: 1rem;
        }

        .settings-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
        }

        .settings-btn {
            padding: 0.625rem 1rem;
            border-radius: 0.375rem;
            font-size: 0.875rem;
            font-weight: 500;
            border: 1px solid;
            background-color: white;
            cursor: pointer;
            transition: background-color 0.2s;
            font-family: inherit;
        }

        .btn-blue {
            border-color: #bfdbfe;
            color: #1e40af;
        }

        .btn-blue:hover {
            background-color: #eff6ff;
        }

        .btn-orange {
            border-color: #fed7aa;
            color: #b45309;
        }

        .btn-orange:hover {
            background-color: #fffbeb;
        }

        .btn-purple {
            border-color: #ddd6fe;
            color: #6d28d9;
        }

        .btn-purple:hover {
            background-color: #f5f3ff;
        }

        .btn-red {
            border-color: #fecaca;
            color: #b91c1c;
        }

        .btn-red:hover {
            background-color: #fef2f2;
        }

        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }

            .settings-grid {
                grid-template-columns: 1fr;
            }

            .profile-photo-section {
                flex-direction: column;
            }

            .card {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="heading">
        <div class="heading-text">
            <h1>Update Your Profile</h1>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-container">
        <div class="card">
            <!-- Card Header -->
            <div class="card-header">
                <h2 class="card-title">Update Profile</h2>
                <button class="edit-btn">Edit Profile</button>
            </div>

            <!-- Profile Photo Section -->
            <div class="profile-photo-section">
                <div class="avatar">
                    <span class="avatar-text">JM</span>
                </div>
                <div class="photo-info">
                    <h3>Profile Photo</h3>
                    <p>Upload a new photo to update your profile picture</p>
                    <div class="photo-buttons">
                        <button class="btn-small btn-upload">Upload Photo</button>
                        <button class="btn-small btn-remove">Remove</button>
                    </div>
                </div>
            </div>

            <!-- Form Fields -->
            <div class="form-grid">
                <!-- Left Column -->
                <div class="form-column">
                    <!-- Full Name -->
                    <div class="form-group">
                        <label class="form-label">👤 Full Name</label>
                        
                        <input type="text" class="form-input">
                    </div>

                    <!-- Phone Number -->
                    <div class="form-group">
                        <label class="form-label">📱 Phone Number</label>
                        
                        <input type="tel" class="form-input">
                    </div>

                    <!-- Bio -->
                    <div class="form-group">
                        <label class="form-label">💬 Bio</label>
                        <input type="text" class="form-input">
                    </div>
                </div>

                <!-- Right Column -->
                <div class="form-column">
                    <!-- Email Address -->
                    <div class="form-group">
                        <label class="form-label">📧 Email Address</label>
                        
                        <input type="email" class="form-input" >
                    </div>

                    <!-- Address -->
                    <div class="form-group">
                        <label class="form-label">📍 Address</label>
                        
                        <input type="text" class="form-input" >
                    </div>
                </div>
            </div>

            <!-- Account Settings -->
            <div class="account-settings">
                <h3>Account Settings</h3>
                <div class="settings-grid">
                    <button class="settings-btn btn-blue">Change Password</button>
                    <button class="settings-btn btn-orange">Notification Preferences</button>
                    <button class="settings-btn btn-purple">Privacy Settings</button>
                    <button class="settings-btn btn-red">Delete Account</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
