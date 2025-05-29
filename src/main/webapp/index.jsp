<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Management | Hotel Booking Platform</title>
    <style>
        /* Reset & Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --primary-color: #0f172a;
            --primary-light: #1e293b;
            --secondary-color: #f8fafc;
            --accent-color: #3b82f6;
            --light-accent: #e0f2fe;
            --text-primary: #0f172a;
            --text-secondary: #475569;
            --border-color: #cbd5e1;
            --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.04);
            --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.08);
            --shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1);
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background-color: #ffffff;
            color: var(--text-primary);
            line-height: 1.6;
        }

        header {
            background: var(--primary-light);
            color: white;
            border-bottom: 1px solid var(--border-color);
            position: sticky;
            top: 0;
            z-index: 50;
        }

        .header-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 1.75rem;
            font-weight: 700;
            color: white;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .logo-flower {
            font-size: 2rem;
            animation: bloom 3s ease-in-out infinite;
            filter: drop-shadow(0 0 8px rgba(255, 182, 193, 0.6));
        }

        @keyframes bloom {
            0%, 100% { transform: scale(1) rotate(0deg); }
            25% { transform: scale(1.1) rotate(5deg); }
            50% { transform: scale(1.05) rotate(-3deg); }
            75% { transform: scale(1.08) rotate(2deg); }
        }

        .nav-links {
            display: flex;
            gap: 2rem;
            list-style: none;
            align-items: center;
        }

        .nav-links a {
            color: #cbd5e1;
            text-decoration: none;
            font-weight: 500;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            transition: all 0.2s ease;
        }

        .nav-links a:hover {
            color: white;
            background-color: rgba(255, 255, 255, 0.1);
        }

        /* Gallery Modal Styles */
        .gallery-trigger {
            background: var(--accent-color);
            color: white;
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.2s ease;
        }

        .gallery-trigger:hover {
            background: #2563eb;
        }

        .gallery-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.9);
            z-index: 1000;
            overflow-y: auto;
        }

        .gallery-modal.active {
            display: block;
        }

        .gallery-content {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 2rem;
            color: white;
        }

        .gallery-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            padding-bottom: 1rem;
        }

        .gallery-title {
            font-size: 2rem;
            font-weight: 700;
        }

        .gallery-close {
            background: none;
            border: none;
            color: white;
            font-size: 2rem;
            cursor: pointer;
            padding: 0.5rem;
            border-radius: 4px;
            transition: background 0.2s ease;
        }

        .gallery-close:hover {
            background: rgba(255, 255, 255, 0.1);
        }

        /* Upload Section in Gallery */
        .gallery-upload-section {
            margin-bottom: 3rem;
            background: rgba(255, 255, 255, 0.05);
            padding: 2rem;
            border-radius: 12px;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .upload-area {
            border: 2px dashed rgba(255, 255, 255, 0.3);
            border-radius: 12px;
            padding: 2rem;
            background: rgba(255, 255, 255, 0.02);
            transition: all 0.3s ease;
            text-align: center;
        }

        .upload-area:hover {
            border-color: var(--accent-color);
            background: rgba(59, 130, 246, 0.1);
        }

        .upload-input {
            display: none;
        }

        .upload-button {
            background: var(--accent-color);
            color: white;
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 500;
            transition: 0.2s ease;
            margin-top: 1rem;
        }

        .upload-button:hover {
            background: #2563eb;
        }

        /* Gallery Grid */
        .gallery-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 1rem;
        }

        .gallery-item {
            position: relative;
            aspect-ratio: 16/10;
            border-radius: 8px;
            overflow: hidden;
            cursor: pointer;
            transition: transform 0.2s ease;
        }

        .gallery-item:hover {
            transform: scale(1.02);
        }

        .gallery-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .gallery-item-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(to bottom, transparent, rgba(0,0,0,0.7));
            display: flex;
            align-items: flex-end;
            padding: 1rem;
            opacity: 0;
            transition: opacity 0.2s ease;
        }

        .gallery-item:hover .gallery-item-overlay {
            opacity: 1;
        }

        .gallery-item-title {
            color: white;
            font-weight: 500;
        }

        /* Image Viewer */
        .image-viewer {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.95);
            z-index: 1001;
            align-items: center;
            justify-content: center;
        }

        .image-viewer.active {
            display: flex;
        }

        .viewer-content {
            max-width: 90%;
            max-height: 90%;
            position: relative;
        }

        .viewer-image {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
        }

        .viewer-close {
            position: absolute;
            top: -40px;
            right: 0;
            background: none;
            border: none;
            color: white;
            font-size: 2rem;
            cursor: pointer;
        }

        .main-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
        }

        .hero-section {
            position: relative;
            color: white;
            padding: 5rem 0;
            text-align: center;
            height: 80vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        /* Image Slider Styles */
        .slider-container {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -2;
        }

        .slider-image {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0;
            transition: opacity 1.5s ease-in-out;
        }

        .slider-image.active {
            opacity: 1;
        }

        .hero-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, rgba(0,0,0,0.6), rgba(0,0,0,0.3));
            z-index: -1;
        }

        .hero-content {
            position: relative;
            z-index: 1;
        }

        .hero-content h1 {
            font-size: 3rem;
            font-weight: 800;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.7);
        }

        .hero-content p {
            font-size: 1.25rem;
            max-width: 600px;
            margin: 0 auto 2rem auto;
            line-height: 1.7;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.7);
        }

        .cta-button {
            display: inline-block;
            background: white;
            color: #1d4ed8;
            padding: 0.875rem 2rem;
            border-radius: 8px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.2s ease;
            box-shadow: var(--shadow-md);
        }

        .cta-button:hover {
            background: #f1f5f9;
            transform: translateY(-2px);
        }

        .services-section {
            background: linear-gradient(135deg, #f1f5f9 0%, #e2e8f0 100%);
            padding: 4rem 0;
            position: relative;
            overflow: hidden;
        }

        .services-section::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(59, 130, 246, 0.03) 0%, transparent 70%);
            animation: float 20s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translate(0, 0) rotate(0deg); }
            33% { transform: translate(30px, -30px) rotate(120deg); }
            66% { transform: translate(-20px, 20px) rotate(240deg); }
        }

        .section-title {
            text-align: center;
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 3rem;
            background: linear-gradient(135deg, #1e293b, #3b82f6);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            animation: titleGlow 2s ease-in-out infinite alternate;
        }

        @keyframes titleGlow {
            0% { filter: drop-shadow(0 0 5px rgba(59, 130, 246, 0.3)); }
            100% { filter: drop-shadow(0 0 15px rgba(59, 130, 246, 0.6)); }
        }

        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            position: relative;
            z-index: 1;
        }

        .service-card {
            background: rgba(255, 255, 255, 0.95);
            padding: 2rem;
            border-radius: 20px;
            text-align: center;
            border: 1px solid rgba(59, 130, 246, 0.1);
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            position: relative;
            overflow: hidden;
            backdrop-filter: blur(10px);
        }

        .service-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(59, 130, 246, 0.1), transparent);
            transition: left 0.8s ease;
        }

        .service-card:hover::before {
            left: 100%;
        }

        .service-card:hover {
            transform: translateY(-15px) scale(1.02);
            box-shadow: 0 15px 40px rgba(59, 130, 246, 0.2);
            border-color: var(--accent-color);
        }

        .service-icon {
            font-size: 4rem;
            margin-bottom: 1rem;
            display: inline-block;
            animation: bounce 2s ease-in-out infinite;
            filter: drop-shadow(0 4px 8px rgba(0, 0, 0, 0.1));
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
            40% { transform: translateY(-10px); }
            60% { transform: translateY(-5px); }
        }

        .service-card:nth-child(1) .service-icon { animation-delay: 0s; }
        .service-card:nth-child(2) .service-icon { animation-delay: 0.3s; }
        .service-card:nth-child(3) .service-icon { animation-delay: 0.6s; }

        .service-card h3 {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: #1e293b;
            transition: color 0.3s ease;
        }

        .service-card:hover h3 {
            color: var(--accent-color);
        }

        .service-card p {
            color: var(--text-secondary);
            margin-bottom: 1.5rem;
            line-height: 1.6;
            transition: color 0.3s ease;
        }

        .service-card:hover p {
            color: #334155;
        }

        .service-button {
            background: linear-gradient(135deg, var(--accent-color), #2563eb);
            color: white;
            padding: 0.875rem 2rem;
            border-radius: 25px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            display: inline-block;
            position: relative;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(59, 130, 246, 0.3);
        }

        .service-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s ease;
        }

        .service-button:hover::before {
            left: 100%;
        }

        .service-button:hover {
            background: linear-gradient(135deg, #2563eb, #1d4ed8);
            transform: translateY(-2px);
            box-shadow: 0 6px 25px rgba(59, 130, 246, 0.4);
        }

        .service-button:active {
            transform: translateY(0);
        }

        footer {
            background: var(--primary-color);
            color: #cbd5e1;
            text-align: center;
            padding: 1.5rem;
            margin-top: 3rem;
        }

        /* Toast Notification */
        .toast {
            position: fixed;
            top: 20px;
            right: 20px;
            background: #ffffff;
            border: 1px solid var(--border-color);
            border-left: 4px solid var(--accent-color);
            border-radius: 8px;
            padding: 1rem 1.5rem;
            box-shadow: var(--shadow-lg);
            z-index: 1000;
            max-width: 400px;
            animation: slideIn 0.3s ease;
        }

        .toast-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 0.5rem;
        }

        .toast-title {
            font-weight: 600;
        }

        .toast-close {
            background: none;
            border: none;
            color: var(--text-secondary);
            font-size: 1.2rem;
            cursor: pointer;
        }

        .toast-message {
            color: var(--text-secondary);
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateX(100%);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .toast.slide-out {
            animation: slideOut 0.3s ease forwards;
        }

        @keyframes slideOut {
            from {
                opacity: 1;
                transform: translateX(0);
            }
            to {
                opacity: 0;
                transform: translateX(100%);
            }
        }

        @media (max-width: 768px) {
            .hero-content h1 {
                font-size: 2.2rem;
            }

            .nav-links {
                flex-direction: column;
                gap: 1rem;
            }

            .services-grid {
                grid-template-columns: 1fr;
            }

            .toast {
                right: 10px;
                left: 10px;
                max-width: none;
            }

            .hero-section {
                height: 60vh;
            }

            .gallery-content {
                padding: 1rem;
                margin: 1rem auto;
            }

            .gallery-grid {
                grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            }
        }
    </style>
</head>
<body>

<%
    String status = request.getParameter("status");
    String toastMessage = "";
    String toastTitle = "";

    if ("success".equals(status)) {
        toastTitle = "Success!";
        toastMessage = "Your reservation has been successfully created.";
    } else if ("deleted".equals(status)) {
        toastTitle = "Success!";
        toastMessage = "Your reservation has been successfully deleted.";
    } else if ("done".equals(status)) {
        toastTitle = "Success!";
        toastMessage = "Your reservation has been successfully updated.";
    }

    if (!toastMessage.isEmpty()) {
%>
    <div id="toast" class="toast success">
        <div class="toast-header">
            <span class="toast-title"><%= toastTitle %></span>
            <button class="toast-close" onclick="closeToast()">×</button>
        </div>
        <div class="toast-message"><%= toastMessage %></div>
    </div>
    <script>
        function closeToast() {
            const toast = document.getElementById('toast');
            toast.classList.add('slide-out');
            setTimeout(() => toast.style.display = 'none', 300);
        }

        window.onload = function () {
            setTimeout(() => closeToast(), 5000);
            if (window.history.replaceState) {
                window.history.replaceState(null, null, window.location.pathname);
            }
        };
    </script>
<% } %>

<header>
    <div class="header-container">
        <div class="logo">
            <span class="logo-flower">🌸</span>
           Hotel Management
        </div>
        <nav>
            <ul class="nav-links">
                <li><a href="#home">Home</a></li>
                <li><a href="#services">Services</a></li>
                <li><button class="gallery-trigger" onclick="openGallery()">📸 Photo Gallery</button></li>
                <li><a href="#contact">Contact Us</a></li>
            </ul>
        </nav>
    </div>
</header>

<!-- Photo Gallery Modal -->
<div id="galleryModal" class="gallery-modal">
    <div class="gallery-content">
        <div class="gallery-header">
            <h2 class="gallery-title">Hotel Photo Gallery</h2>
            <button class="gallery-close" onclick="closeGallery()">×</button>
        </div>
        
        <!-- Upload Section -->
        <div class="gallery-upload-section">
            <h3 style="margin-bottom: 1rem; color: white;">Upload New Images</h3>
            <p style="color: rgba(255, 255, 255, 0.7); margin-bottom: 1.5rem;">Add beautiful images of your hotel to showcase in the gallery</p>
            <div class="upload-area" onclick="document.getElementById('imageInput').click()">
                <div style="font-size: 3rem; margin-bottom: 1rem;">📸</div>
                <p style="color: white;"><strong>Click here to upload images</strong></p>
                <p style="color: rgba(255, 255, 255, 0.7); font-size: 0.9rem;">Supports JPG, PNG, WebP formats</p>
                <input type="file" id="imageInput" class="upload-input" multiple accept="image/*" onchange="handleImageUpload(event)">
                <button type="button" class="upload-button">Choose Images</button>
            </div>
            <div id="uploadedThumbnails" style="margin-top: 1rem; display: flex; flex-wrap: wrap; gap: 1rem; justify-content: center;"></div>
        </div>
        
        <!-- Gallery Grid -->
        <div id="galleryGrid" class="gallery-grid">
            <!-- Default images will be populated here -->
        </div>
    </div>
</div>

<!-- Image Viewer Modal -->
<div id="imageViewer" class="image-viewer">
    <div class="viewer-content">
        <button class="viewer-close" onclick="closeImageViewer()">×</button>
        <img id="viewerImage" src="" alt="Gallery Image" class="viewer-image">
    </div>
</div>

<section class="hero-section" id="home">
    <div class="slider-container">
        <!-- Default hotel images - replace these URLs with your uploaded images -->
        <img src="https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80" alt="Luxury Hotel Exterior" class="slider-image active">
        <img src="https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80" alt="Hotel Room Interior" class="slider-image">
        <img src="https://images.unsplash.com/photo-1571896349842-33c89424de2d?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80" alt="Hotel Lobby" class="slider-image">
        <img src="https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80" alt="Hotel Pool Area" class="slider-image">
    </div>
    <div class="hero-overlay"></div>
    <div class="main-container">
        <div class="hero-content">
            <h1>Welcome to Hotel Management</h1>
            <p>Experience luxury and comfort at our premium resort destination. Professional service, elegant accommodations, and unforgettable memories await you.</p>
            <a href="#services" class="cta-button">Explore Services</a>
        </div>
    </div>
</section>

<section class="services-section" id="services">
    <div class="main-container">
        <h2 class="section-title">Reservation Management</h2>
        <div class="services-grid">
            <div class="service-card">
                <span class="service-icon">📝</span>
                <h3>Create Reservation</h3>
                <p>Start a new hotel booking with our streamlined form. Quick, secure, and efficient.</p>
                <a href="reservationadd.jsp" class="service-button">New Booking</a>
            </div>

            <div class="service-card">
                <span class="service-icon">📋</span>
                <h3>Manage Bookings</h3>
                <p>View, edit, or cancel your current reservations all in one place with ease.</p>
                <a href="reservationdisplay" class="service-button">View Bookings</a>
            </div>

            <div class="service-card">
                <span class="service-icon">📊</span>
                <h3>Reports & Analytics</h3>
                <p>Get insights into booking trends and performance with easy-to-read reports.</p>
                <a href="reports.jsp" class="service-button">View Reports</a>
            </div>
        </div>
    </div>
</section>

<section id="contact" style="background: white; padding: 4rem 0;">
    <div class="main-container">
        <h2 class="section-title">Contact Us</h2>
        <div style="max-width: 800px; margin: 0 auto; text-align: center;">
            <div style="display: flex; justify-content: space-between; align-items: center; gap: 2rem; margin-bottom: 2rem; flex-wrap: wrap;">
                <div style="flex: 1; min-width: 200px;">
                    <h4 style="margin-bottom: 0.5rem; color: var(--accent-color);">📍 Address</h4>
                    <p style="color: var(--text-secondary);">123 Resort Boulevard<br>Paradise City, PC 12345</p>
                </div>
                <div style="flex: 1; min-width: 200px;">
                    <h4 style="margin-bottom: 0.5rem; color: var(--accent-color);">📞 Phone</h4>
                    <p style="color: var(--text-secondary);">+1 (555) 123-4567</p>
                </div>
                <div style="flex: 1; min-width: 200px;">
                    <h4 style="margin-bottom: 0.5rem; color: var(--accent-color);">✉️ Email</h4>
                    <p style="color: var(--text-secondary);">advithpoojary15@gmail.com</p>
                </div>
            </div>
            <p style="color: var(--text-secondary);">We're available 24/7 to assist you with your reservations and inquiries.</p>
        </div>
    </div>
</section>
<footer>
    &copy; 2025 Hotel Managment. All Rights Reserved.
</footer>

<script>
    // Gallery and image management
    let galleryImages = [
        {
            src: "https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80",
            title: "Luxury Hotel Exterior"
        },
        {
            src: "https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80",
            title: "Hotel Room Interior"
        },
        {
            src: "https://images.unsplash.com/photo-1571896349842-33c89424de2d?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80",
            title: "Hotel Lobby"
        },
        {
            src: "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80",
            title: "Hotel Pool Area"
        }
    ];

    // Gallery Modal Functions
    function openGallery() {
        document.getElementById('galleryModal').classList.add('active');
        document.body.style.overflow = 'hidden';
        populateGallery();
    }

    function closeGallery() {
        document.getElementById('galleryModal').classList.remove('active');
        document.body.style.overflow = 'auto';
    }

    function populateGallery() {
        const galleryGrid = document.getElementById('galleryGrid');
        galleryGrid.innerHTML = '';
        
        galleryImages.forEach((image, index) => {
            const galleryItem = document.createElement('div');
            galleryItem.className = 'gallery-item';
            galleryItem.onclick = () => openImageViewer(image.src, image.title);
            
            galleryItem.innerHTML = `
                <img src="${image.src}" alt="${image.title}">
                <div class="gallery-item-overlay">
                    <div class="gallery-item-title">${image.title}</div>
                </div>
            `;
            
            galleryGrid.appendChild(galleryItem);
        });
    }

    // Image Viewer Functions
    function openImageViewer(src, title) {
        document.getElementById('viewerImage').src = src;
        document.getElementById('viewerImage').alt = title;
        document.getElementById('imageViewer').classList.add('active');
    }

    function closeImageViewer() {
        document.getElementById('imageViewer').classList.remove('active');
    }

    // Image Upload Functionality
    function handleImageUpload(event) {
        const files = event.target.files;
        const uploadedThumbnailsContainer = document.getElementById('uploadedThumbnails');
        const sliderContainer = document.querySelector('.slider-container');
        
        for (let i = 0; i < files.length; i++) {
            const file = files[i];
            const reader = new FileReader();
            
            reader.onload = function(e) {
                const imageData = {
                    src: e.target.result,
                    title: `Uploaded Image ${galleryImages.length + 1}`
                };
                
                // Add to gallery images array
                galleryImages.push(imageData);
                
                // Create preview thumbnail
                const thumbnail = document.createElement('img');
                thumbnail.src = e.target.result;
                thumbnail.style.cssText = 'width: 100px; height: 60px; object-fit: cover; border-radius: 4px; border: 2px solid rgba(255,255,255,0.3);';
                uploadedThumbnailsContainer.appendChild(thumbnail);
                
                // Add to slider
                const sliderImg = document.createElement('img');
                sliderImg.src = e.target.result;
                sliderImg.className = 'slider-image';
                sliderImg.alt = imageData.title;
                sliderContainer.appendChild(sliderImg);
                
                // Refresh gallery
                populateGallery();
            };
            
            reader.readAsDataURL(file);
        }
        
        // Show success message
        const successMsg = document.createElement('p');
        successMsg.textContent = `${files.length} image(s) uploaded successfully!`;
        successMsg.style.cssText = 'color: #10b981; font-weight: 500; margin-top: 1rem;';
        uploadedThumbnailsContainer.appendChild(successMsg);
        
        setTimeout(() => successMsg.remove(), 3000);
    }

    // Image Slider Functionality
    let currentImageIndex = 0;
    const images = document.querySelectorAll('.slider-image');
    let totalImages = images.length;

    function showNextImage() {
        const currentImages = document.querySelectorAll('.slider-image');
        if (currentImages.length === 0) return;
        
        currentImages[currentImageIndex].classList.remove('active');
        currentImageIndex = (currentImageIndex + 1) % currentImages.length;
        currentImages[currentImageIndex].classList.add('active');
    }

    // Auto-slide every 4 seconds
    setInterval(showNextImage, 4000);

    // Close modals when clicking outside
    document.getElementById('galleryModal').addEventListener('click', function(e) {
        if (e.target === this) {
            closeGallery();
        }
    });

    document.getElementById('imageViewer').addEventListener('click', function(e) {
        if (e.target === this) {
            closeImageViewer();
        }
    });

    // Close modals with Escape key
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape') {
            closeGallery();
            closeImageViewer();
        }
    });

    // Smooth scrolling for navigation links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();uus
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });

    // Initialize gallery on page load
    document.addEventListener('DOMContentLoaded', function() {
        populateGallery();
    });
</script>

</body>
</html>