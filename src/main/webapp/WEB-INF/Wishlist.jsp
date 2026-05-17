<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Wishlist – The E-Spot</title>
  <link rel="stylesheet" href="css/styles.css" type="text/css">
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { font-family: system-ui, sans-serif; background: #f9fafb; }
 
    /* BANNER */
    .banner {
      background: #0C2C55;
      margin: 16px;
      border-radius: 8px;
      padding: 16px 24px;
    }
    .banner h1 {
      font-size: 22px;
      font-weight: 600;
      color: #fff;
      display: flex;
      align-items: center;
      gap: 8px;
    }
    .banner h1 svg { width: 24px; height: 24px; fill: #fff; }
    .banner p { font-size: 14px; color: rgba(255,255,255,0.8); margin-top: 4px; }
 
    /* EMPTY STATE */
    .empty {
      text-align: center;
      padding: 80px 16px;
    }
    .empty svg { width: 64px; height: 64px; color: #d1d5db; margin: 0 auto 16px; display: block; }
    .empty h2 { font-size: 22px; font-weight: 600; color: #111827; margin-bottom: 8px; }
    .empty p  { font-size: 15px; color: #6b7280; margin-bottom: 24px; }
    .empty a {
      display: inline-block;
      padding: 10px 24px;
      background: #0C2C55;
      color: #fff;
      border-radius: 8px;
      text-decoration: none;
      font-weight: 500;
    }
 
    /* GRID */
    .products-section { padding: 32px 16px; }
    .grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 24px;
    }
    @media (max-width: 900px) { .grid { grid-template-columns: repeat(2, 1fr); } }
    @media (max-width: 580px) { .grid { grid-template-columns: 1fr; } }
 
    /* CARD */
    .card {
      background: #fff;
      border-radius: 8px;
      border: 2px dashed #3b82f6;
      overflow: hidden;
      transition: box-shadow 0.2s;
    }
    .card:hover { box-shadow: 0 8px 24px rgba(0,0,0,0.1); }
 
    /* IMAGE */
    .card-img {
      position: relative;
      height: 192px;
      overflow: hidden;
      background: #f3f4f6;
    }
    .card-img img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      transition: transform 0.3s;
    }
    .card-img:hover img { transform: scale(1.1); }
    .savings-badge {
      position: absolute;
      top: 12px;
      right: 12px;
      background: #ef4444;
      color: #fff;
      font-size: 11px;
      font-weight: 600;
      padding: 4px 8px;
      border-radius: 4px;
    }
 
    /* CARD BODY */
    .card-body { padding: 16px; }
    .card-body h3 {
      font-size: 15px;
      font-weight: 600;
      color: #111827;
      margin-bottom: 8px;
      display: -webkit-box;
      -webkit-line-clamp: 2;
      -webkit-box-orient: vertical;
      overflow: hidden;
    }
 
    /* CONDITION BADGE */
    .badge {
      display: inline-block;
      font-size: 11px;
      font-weight: 500;
      padding: 3px 8px;
      border-radius: 4px;
      margin-bottom: 12px;
    }
    .badge-green  { background: #dcfce7; color: #16a34a; }
    .badge-yellow { background: #fef9c3; color: #ca8a04; }
    .badge-red    { background: #fee2e2; color: #dc2626; }
 
    /* SELLER INFO */
    .seller-info {
      margin-bottom: 12px;
      padding-bottom: 12px;
      border-bottom: 1px solid #e5e7eb;
    }
    .seller-info p { font-size: 12px; color: #6b7280; }
 
    /* PRICE */
    .price-block { margin-bottom: 16px; }
    .price-row { display: flex; align-items: baseline; gap: 8px; }
    .price-now  { font-size: 18px; font-weight: 700; color: #0C2C55; }
    .price-old  { font-size: 14px; color: #9ca3af; text-decoration: line-through; }
    .discount   { font-size: 12px; color: #16a34a; font-weight: 500; margin-top: 4px; }
 
    /* BUTTONS */
    .btn-row { display: flex; gap: 8px; }
    .btn-cart {
      flex: 1;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 6px;
      padding: 9px 0;
      background: #3b82f6;
      color: #fff;
      border: none;
      border-radius: 6px;
      font-size: 14px;
      font-weight: 500;
      cursor: pointer;
    }
    .btn-cart svg { width: 16px; height: 16px; }
    .btn-cart:hover { background: #2563eb; }
 
    .btn-remove {
      width: 36px;
      height: 36px;
      display: flex;
      align-items: center;
      justify-content: center;
      background: #fff;
      border: 2px solid #ef4444;
      border-radius: 6px;
      cursor: pointer;
      color: #ef4444;
    }
    .btn-remove svg { width: 16px; height: 16px; }
    .btn-remove:hover { background: #fee2e2; }
  </style>
</head>
<body>
 <%@ include file="../components/header.jsp"%>
  <!-- Banner -->
  <div class="banner">
    <h1>
      <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
        <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
      </svg>
      Your Wishlist
    </h1>
    <p>3 items saved for later</p>
  </div>
 
  <!-- Products Grid -->
  <div class="products-section">
    <div class="grid">
 
      
 
    </div>
  </div>
 
</body>
</html>