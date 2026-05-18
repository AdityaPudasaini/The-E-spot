<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
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
  <div style="background: #0C2C55; margin: 16px; border-radius: 8px;">
  <div style="padding: 16px 24px; display: flex; justify-content: space-between; align-items: center;">
    
    <div>
      <h1 style="font-size: 22px; font-weight: 600; color: #fff;">Browse Products</h1>
      <p style="font-size: 14px; color: rgba(255,255,255,0.8); margin-top: 4px;">
        Discover great deals on quality pre-owned items
      </p>
    </div>

    <!-- Trigger Button (put this in your banner) -->
<button onclick="openModal()" style="
  padding: 8px 24px;
  background: #f59e0b;
  color: #fff;
  border: none;
  border-radius: 8px;
  font-size: 15px;
  font-weight: 500;
  cursor: pointer;
">+ Add Product</button>

<!-- Overlay -->
<div id="modal-overlay" onclick="closeModal()" style="
  display: none;
  position: fixed;
  inset: 0;
  background: rgba(0,0,0,0.5);
  z-index: 50;
"></div>

<!-- Modal -->
<div id="modal" style="
  display: none;
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 100;
  width: 100%;
  max-width: 620px;
  max-height: 90vh;
  overflow-y: auto;
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 8px 32px rgba(0,0,0,0.2);
">

  <!-- Modal Header -->
  <div style="
    position: sticky;
    top: 0;
    background: #0C2C55;
    color: #fff;
    padding: 20px 24px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-radius: 8px 8px 0 0;
  ">
    <h2 style="font-size: 20px; font-weight: 600;">Add Your Product</h2>
    <button onclick="closeModal()" style="
      background: none;
      border: none;
      color: #fff;
      font-size: 24px;
      cursor: pointer;
      line-height: 1;
    ">&times;</button>
  </div>

  <!-- Form -->
  <form action="${pageContext.request.contextPath}/product" method="post" style="padding: 24px; display: flex; flex-direction: column; gap: 16px;">

    <!-- Product Name -->
    <div>
      <label style="display: block; font-size: 14px; font-weight: 500; margin-bottom: 6px;">Product Name *</label>
      <input type="text" name="name" placeholder="Enter product name" required style="
        width: 100%;
        padding: 8px 16px;
        border: 2px dashed #d1d5eb;
        border-radius: 8px;
        font-size: 14px;
        outline: none;
      " />
    </div>

    <!-- Category & Condition -->
    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px;">
      <div>
        <label style="display: block; font-size: 14px; font-weight: 500; margin-bottom: 6px;">Category *</label>
        <select name="category" style="
          width: 100%;
          padding: 8px 16px;
          border: 2px dashed #d1d5eb;
          border-radius: 8px;
          font-size: 14px;
          outline: none;
          background: #fff;
        ">
          <option>Electronics</option>
          <option>Clothing</option>
          <option>Footwear</option>
          <option>Accessories</option>
        </select>
      </div>
      <div>
        <label style="display: block; font-size: 14px; font-weight: 500; margin-bottom: 6px;">Condition *</label>
        <select name="condition" style="
          width: 100%;
          padding: 8px 16px;
          border: 2px dashed #d1d5eb;
          border-radius: 8px;
          font-size: 14px;
          outline: none;
          background: #fff;
        ">
          <option>Excellent</option>
          <option>Like New</option>
          <option>Good</option>
          <option>Fair</option>
        </select>
      </div>
    </div>

    <!-- Original Price & Selling Price -->
    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px;">
      <div>
        <label style="display: block; font-size: 14px; font-weight: 500; margin-bottom: 6px;">Original Price (Rs) *</label>
        <input type="number" name="originalPrice" placeholder="e.g. 10000" required style="
          width: 100%;
          padding: 8px 16px;
          border: 2px dashed #d1d5eb;
          border-radius: 8px;
          font-size: 14px;
          outline: none;
        " />
      </div>
      <div>
        <label style="display: block; font-size: 14px; font-weight: 500; margin-bottom: 6px;">Selling Price (Rs) *</label>
        <input type="number" name="sellingPrice" placeholder="e.g. 7000" required style="
          width: 100%;
          padding: 8px 16px;
          border: 2px dashed #d1d5eb;
          border-radius: 8px;
          font-size: 14px;
          outline: none;
        " />
      </div>
    </div>

    <!-- Image URL -->
    <div>
      <label style="display: block; font-size: 14px; font-weight: 500; margin-bottom: 6px;">Image URL</label>
      <input type="url" name="imageUrl" placeholder="https://example.com/image.jpg" style="
        width: 100%;
        padding: 8px 16px;
        border: 2px dashed #d1d5eb;
        border-radius: 8px;
        font-size: 14px;
        outline: none;
      " />
    </div>

    <!-- Description -->
    <div>
      <label style="display: block; font-size: 14px; font-weight: 500; margin-bottom: 6px;">Description *</label>
      <textarea name="description" rows="4" placeholder="Describe your product condition, features, and any defects..." required style="
        width: 100%;
        padding: 8px 16px;
        border: 2px dashed #d1d5eb;
        border-radius: 8px;
        font-size: 14px;
        outline: none;
        resize: none;
      "></textarea>
    </div>

    <!-- Buttons -->
    <div style="display: flex; gap: 16px; padding-top: 8px;">
      <button type="button" onclick="closeModal()" style="
        flex: 1;
        padding: 10px;
        border: 2px dashed #3b82f6;
        color: #3b82f6;
        background: #fff;
        border-radius: 8px;
        font-size: 15px;
        font-weight: 500;
        cursor: pointer;
      ">Cancel</button>
      <button type="submit" style="
        flex: 1;
        padding: 10px;
        background: #f59e0b;
        color: #fff;
        border: none;
        border-radius: 8px;
        font-size: 15px;
        font-weight: 500;
        cursor: pointer;
      ">List Product</button>
    </div>

</form>

    
</div>

<!-- JavaScript -->
<script>
  function openModal() {
    document.getElementById('modal').style.display = 'block';
    document.getElementById('modal-overlay').style.display = 'block';
    document.body.style.overflow = 'hidden';
  }

  function closeModal() {
    document.getElementById('modal').style.display = 'none';
    document.getElementById('modal-overlay').style.display = 'none';
    document.body.style.overflow = 'auto';
  }
</script>

  </div>
</div>

  <!-- Products Grid -->
  <div class="products-section">
    <div class="grid">

      <c:forEach var="product" items="${products}">
  <div class="card">
    <div class="card-body">
      <h3>${product.productName}</h3>
      <div class="price">Rs. ${product.productPrice}</div>
      <div class="condition">${product.activeStatus}</div>
      <p>${product.productDescription}</p>
    </div>
  </div>
</c:forEach>

     

    </div>
  </div>

  <!-- Load More -->
  <div class="load-more">
    <button>Load More Products</button>
  </div>
  <%@ include file="../components/footer.jsp"%>

</body>
</html>