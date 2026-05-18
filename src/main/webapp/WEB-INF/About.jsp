<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>About – The E-Spot</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/lucide/0.383.0/umd/lucide.min.js"></script>
  <link rel="stylesheet" href="css/styles.css" type="text/css">
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }

    body {
      font-family: system-ui, sans-serif;
      color: #111827;
      background: #ffffff;
    }

    
    /* CONTAINER */
    .container {
      width: 100%;
      max-width: 1100px;
      margin: 0 auto;
      padding: 0 20px;
    }

    /* HERO */
    .hero-section {
      background: #0C2C55;
      color: #ffffff;
      padding: 96px 0;
      text-align: center;
    }
    .hero-section h1 {
      font-size: 48px;
      font-weight: 800;
      margin-bottom: 24px;
    }
    .hero-section p {
      font-size: 20px;
      opacity: 0.9;
      max-width: 640px;
      margin: 0 auto;
      line-height: 1.7;
    }

    /* MISSION & VISION */
    .mission-section {
      background: #ffffff;
      padding: 96px 0;
    }
    .grid-2 {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 48px;
      max-width: 896px;
      margin: 0 auto;
    }
    .card {
      background: #ffffff;
      border-radius: 12px;
      padding: 32px;
    }
    .card-info    { border: 2px dashed #0ea5e9; }
    .card-success { border: 2px dashed #22c55e; }
    .card-warning { border: 2px dashed #f59e0b; }
    .card-purple  { border: 2px dashed #8b5cf6; }

    .card h2 {
      font-size: 22px;
      font-weight: 700;
      color: #0C2C55;
      margin-bottom: 16px;
    }
    .card p {
      color: #374151;
      line-height: 1.7;
      font-size: 15px;
    }

    /* WHY CHOOSE US */
    .why-section {
      background: #f1f5f9;
      padding: 96px 0;
    }
    .section-title {
      font-size: 36px;
      font-weight: 800;
      color: #0C2C55;
      text-align: center;
      margin-bottom: 48px;
    }
    .grid-2-why {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 32px;
      max-width: 896px;
      margin: 0 auto;
    }
    .feature-card {
      border-radius: 12px;
      padding: 32px;
      display: flex;
      gap: 16px;
      background: #ffffff;
    }
    .icon-box {
      flex-shrink: 0;
      width: 48px;
      height: 48px;
      border-radius: 8px;
      display: flex;
      align-items: center;
      justify-content: center;
      color: #ffffff;
    }
    .icon-box i { width: 20px; height: 20px; }
    .bg-warning { background: #f59e0b; }
    .bg-info    { background: #0ea5e9; }
    .bg-success { background: #22c55e; }
    .bg-purple  { background: #8b5cf6; }

    .feature-text h3 {
      font-size: 16px;
      font-weight: 600;
      color: #0C2C55;
      margin-bottom: 8px;
    }
    .feature-text p {
      font-size: 14px;
      color: #374151;
      line-height: 1.6;
    }

    /* OUR STORY */
    .story-section {
      background: #ffffff;
      padding: 96px 0;
    }
    .story-inner {
      max-width: 768px;
      margin: 0 auto;
    }
    .story-inner h2 {
      font-size: 36px;
      font-weight: 800;
      color: #0C2C55;
      text-align: center;
      margin-bottom: 32px;
    }
    .story-card {
      background: #ffffff;
      border: 2px dashed #0ea5e9;
      border-radius: 12px;
      padding: 48px;
    }
    .story-card p {
      color: #374151;
      line-height: 1.8;
      font-size: 15px;
      margin-bottom: 24px;
    }
    .story-card p:last-child { margin-bottom: 0; }

    /* CORE VALUES */
    .values-section {
      background: #f1f5f9;
      padding: 96px 0;
    }
    .grid-3 {
      display: grid;
      grid-template-columns: 1fr 1fr 1fr;
      gap: 32px;
      max-width: 1024px;
      margin: 0 auto;
    }
    .value {
      text-align: center;
    }
    .value-icon {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      width: 64px;
      height: 64px;
      border-radius: 9999px;
      color: #ffffff;
      margin-bottom: 16px;
    }
    .value-icon i { width: 32px; height: 32px; }
    .value h3 {
      font-size: 18px;
      font-weight: 600;
      color: #16a34a;
      margin-bottom: 12px;
    }
    .value p {
      color: #374151;
      font-size: 15px;
      line-height: 1.7;
    }

    /* CTA */
    .cta-section {
      background: #0C2C55;
      color: #ffffff;
      padding: 96px 0;
      text-align: center;
    }
    .cta-section h2 {
      font-size: 36px;
      font-weight: 800;
      margin-bottom: 24px;
    }
    .cta-section p {
      font-size: 17px;
      opacity: 0.9;
      max-width: 640px;
      margin: 0 auto 32px;
      line-height: 1.7;
    }
    .btn-group {
      display: flex;
      gap: 16px;
      justify-content: center;
      flex-wrap: wrap;
    }
    .btn {
      padding: 12px 32px;
      border-radius: 8px;
      font-weight: 600;
      font-size: 16px;
      border: none;
      cursor: pointer;
      text-decoration: none;
      display: inline-block;
    }
    .btn-green { background: #22c55e; color: #ffffff; }
    .btn-green:hover { background: #16a34a; }
    .btn-white { background: #ffffff; color: #16a34a; }
    .btn-white:hover { background: #f1f5f9; }
  </style>
</head>
<body>

<%@ include file="../components/header.jsp"%>
  <!-- HERO -->
  <section class="hero-section">
    <div class="container">
      <h1>About The E-Spot</h1>
      <p>Empowering Nepal's digital marketplace through sustainable reselling and community-driven commerce</p>
    </div>
  </section>

  <!-- MISSION & VISION -->
  <section class="mission-section">
    <div class="container">
      <div class="grid-2">
        <div class="card card-info">
          <h2>Our Mission</h2>
          <p>To revolutionize the reselling market in Nepal by creating a trusted, accessible platform where quality products find new homes. We believe in giving every item a second life and empowering sellers and buyers with fair prices and transparent transactions.</p>
        </div>
        <div class="card card-success">
          <h2>Our Vision</h2>
          <p>To become Nepal's most trusted reselling platform, fostering a circular economy that benefits individuals, businesses, and the environment. We envision a community where buying and selling secondhand items is the norm, not the exception.</p>
        </div>
      </div>
    </div>
  </section>

  <!-- WHY CHOOSE US -->
  <section class="why-section">
    <div class="container">
      <h2 class="section-title">Why Choose The E-Spot?</h2>
      <div class="grid-2-why">

        <div class="feature-card card-warning">
          <div class="icon-box bg-warning">
            <i data-lucide="heart"></i>
          </div>
          <div class="feature-text">
            <h3>Sustainable Shopping</h3>
            <p>Give products a second life while reducing environmental impact. Every purchase contributes to a more sustainable future for Nepal.</p>
          </div>
        </div>

        <div class="feature-card card-info">
          <div class="icon-box bg-info">
            <i data-lucide="trending-up"></i>
          </div>
          <div class="feature-text">
            <h3>Best Value Deals</h3>
            <p>Find quality items at unbeatable prices. Our platform connects you with verified sellers offering genuine products at discounted rates.</p>
          </div>
        </div>

        <div class="feature-card card-success">
          <div class="icon-box bg-success">
            <i data-lucide="users"></i>
          </div>
          <div class="feature-text">
            <h3>Trusted Community</h3>
            <p>Join thousands of Nepali buyers and sellers who trust The E-Spot. Our secure platform ensures safe transactions and peace of mind.</p>
          </div>
        </div>

        <div class="feature-card card-purple">
          <div class="icon-box bg-purple">
            <i data-lucide="globe"></i>
          </div>
          <div class="feature-text">
            <h3>Local First</h3>
            <p>Built for Nepal, by Nepali entrepreneurs. We understand local needs and support the growth of our community's economy.</p>
          </div>
        </div>

      </div>
    </div>
  </section>

  <!-- OUR STORY -->
  <section class="story-section">
    <div class="container">
      <div class="story-inner">
        <h2>Our Story</h2>
        <div class="story-card">
          <p>The E-Spot was born from a simple observation: many quality products in Nepal end up discarded or unused, while people search endlessly for affordable alternatives. We saw an opportunity to bridge this gap and create something meaningful.</p>
          <p>What started as a conversation between friends passionate about sustainability and commerce has evolved into a vibrant marketplace connecting thousands of buyers and sellers across Nepal. We're committed to making reselling accessible, trustworthy, and rewarding for everyone.</p>
          <p>Today, The E-Spot stands as a testament to Nepali entrepreneurship and innovation, proving that business with purpose can drive real change in our communities.</p>
        </div>
      </div>
    </div>
  </section>

  <!-- CORE VALUES -->
  <section class="values-section">
    <div class="container">
      <h2 class="section-title">Our Core Values</h2>
      <div class="grid-3">

        <div class="value">
          <div class="value-icon bg-success">
            <i data-lucide="heart"></i>
          </div>
          <h3>Integrity</h3>
          <p>We operate with transparency and honesty in every transaction, building trust with our community one interaction at a time.</p>
        </div>

        <div class="value">
          <div class="value-icon bg-info">
            <i data-lucide="globe"></i>
          </div>
          <h3>Sustainability</h3>
          <p>Every resale is a step toward a more sustainable Nepal. We're dedicated to reducing waste and promoting circular commerce.</p>
        </div>

        <div class="value">
          <div class="value-icon bg-warning">
            <i data-lucide="users"></i>
          </div>
          <h3>Community</h3>
          <p>We believe in the power of community and are committed to supporting local sellers and empowering buyers across Nepal.</p>
        </div>

      </div>
    </div>
  </section>

  <!-- CTA -->
  <section class="cta-section">
    <div class="container">
      <h2>Join The E-Spot Community</h2>
      <p>Whether you're looking for great deals or want to declutter by selling, The E-Spot is your trusted marketplace.</p>
      <div class="btn-group">
        <a href="product" class="btn btn-green">Start Shopping</a>
        <a href="user" class="btn btn-white">Become a Seller</a>
      </div>
    </div>
  </section>

  
</body>
</html>