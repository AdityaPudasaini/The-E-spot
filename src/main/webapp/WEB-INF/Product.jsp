<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Browse Products</title>
  <link rel="stylesheet" href="css/styles.css" type="text/css">
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { font-family: system-ui, sans-serif; background: #f9fafb; }

    /* Banner */
    .banner {
      background: #0C2C55;
      margin: 16px;
      border-radius: 8px;
      padding: 32px 24px;
      justify-content: center;
      
    }
    .banner h1 { font-size: 28px; font-weight: 600; color: #fff; }
    .banner p  { font-size: 22px; color: rgba(255,255,255,0.8); margin-top: 4px; }

    /* Products Grid */
    .products-section { padding: 32px 16px; }
    .grid {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 24px;
    }

    /* Product Card */
    .card {
      background: #fff;
      border-radius: 8px;
      border: 1px solid #e5e7eb;
      overflow: hidden;
    }
    .card img {
      width: 100%;
      height: 180px;
      object-fit: cover;
      background: #f3f4f6;
    }
    .card-body { padding: 12px; }
    .card-body h3 { font-size: 15px; font-weight: 600; color: #111827; }
    .card-body .price { font-size: 16px; font-weight: 700; color: #16a34a; margin-top: 6px; }
    .card-body .condition { font-size: 12px; color: #6b7280; margin-top: 4px; }

    /* Load More */
    .load-more { padding: 0 16px 32px; display: flex; justify-content: center; }
    .load-more button {
      padding: 12px 32px;
      background: #0C2C55;
      color: #fff;
      border: none;
      border-radius: 8px;
      font-size: 15px;
      font-weight: 500;
      cursor: pointer;
    }
    .load-more button:hover { background: #000; }
  </style>
</head>
<body>
<%@ include file="../components/header.jsp"%>
  <!-- Banner -->
  <div class="banner">
    <h1>Browse Products</h1>
    <p>Discover great deals on quality pre-owned items</p>
  </div>

  <!-- Products Grid -->
  <div class="products-section">
    <div class="grid">

      <div class="card">
        <img src="images/product1.jpg" alt="Product" />
        <div class="card-body">
          <h3>Product Name</h3>
          <div class="price">Rs. 1,500</div>
          <div class="condition">Good Condition</div>
        </div>
      </div>

      <div class="card">
        <img src="images/product2.jpg" alt="Product" />
        <div class="card-body">
          <h3>Product Name</h3>
          <div class="price">Rs. 2,000</div>
          <div class="condition">Like New</div>
        </div>
      </div>

      <div class="card">
        <img src="images/product3.jpg" alt="Product" />
        <div class="card-body">
          <h3>Product Name</h3>
          <div class="price">Rs. 800</div>
          <div class="condition">Fair Condition</div>
        </div>
      </div>

     

    </div>
  </div>

  <!-- Load More -->
  <div class="load-more">
    <button>Load More Products</button>
  </div>
  <%@ include file="../components/footer.jsp"%>

</body>
</html>