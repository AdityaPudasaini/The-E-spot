<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The_E_Spot | Buy, Sell & Auction</title>
    <style>
        /* Basic Reset & Fonts */
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        body { background-color: #f0f2f5; color: #333; }

        /* Navigation */
        nav {
            background: #fff;
            padding: 1rem 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        .logo { font-size: 1.5rem; font-weight: bold; color: #007bff; text-decoration: none; }
        .search-bar { flex-grow: 1; margin: 0 2rem; }
        .search-bar input { width: 100%; padding: 10px; border-radius: 20px; border: 1px solid #ddd; background: #f0f2f5; }
        .nav-links a { margin-left: 20px; text-decoration: none; color: #555; font-weight: 500; }
        .btn-post { background: #007bff; color: white !important; padding: 8px 15px; border-radius: 5px; }

        /* Hero / Categories */
        .container { max-width: 1200px; margin: auto; padding: 20px; }
        .categories { display: flex; gap: 10px; margin-bottom: 30px; overflow-x: auto; padding-bottom: 10px; }
        .cat-card { background: white; padding: 10px 20px; border-radius: 20px; white-space: nowrap; cursor: pointer; border: 1px solid #ddd; transition: 0.3s; }
        .cat-card:hover { background: #007bff; color: white; }

        /* Product Grid */
        .grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(230px, 1fr)); gap: 20px; }
        
        /* Item Cards */
        .item-card { background: white; border-radius: 8px; overflow: hidden; transition: transform 0.2s; cursor: pointer; border: 1px solid #ddd; }
        .item-card:hover { transform: translateY(-5px); box-shadow: 0 5px 15px rgba(0,0,0,0.1); }
        .item-img { width: 100%; height: 200px; background: #ddd; object-fit: cover; }
        .item-info { padding: 12px; }
        .price { font-size: 1.2rem; font-weight: bold; color: #1c1e21; }
        .title { font-size: 0.95rem; color: #444; margin: 5px 0; }
        .location { font-size: 0.8rem; color: #777; }

        /* Badge for Auction vs Sale */
        .badge { display: inline-block; padding: 3px 8px; border-radius: 4px; font-size: 0.7rem; font-weight: bold; text-transform: uppercase; margin-bottom: 5px; }
        .badge-sale { background: #e7f3ff; color: #007bff; }
        .badge-auction { background: #fff3cd; color: #856404; }

        /* Responsive */
        @media (max-width: 768px) {
            .search-bar { display: none; }
            .nav-links { font-size: 0.8rem; }
        }
    </style>
</head>
<body>

<nav>
    <a href="#" class="logo">The E Spot</a>
    <div class="search-bar">
        <input type="text" placeholder="Search The E Spot...">
    </div>
    <div class="nav-links">
        <a href="#">Auctions</a>
        <a href="#">Inbox</a>
        <a href="#" class="btn-post">+ Sell Something</a>
    </div>
</nav>

<div class="container">
    <!-- Categories -->
    <div class="categories">
        <div class="cat-card">electronics</div>
        <div class="cat-card">vehicles</div>
        <div class="cat-card">home & Garden</div>
        <div class="cat-card">fashion</div>
        <div class="cat-card">toys & Hobbies</div>
        <div class="cat-card">collectibles</div>
    </div>

    <h2>Today's Picks</h2>
    <br>

    <!-- Marketplace Grid -->
    <div class="grid">
        
        <!-- Item 1 (Sale) -->
        <div class="item-card">
            <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400" alt="Headphones" class="item-img">
            <div class="item-info">
                <span class="badge badge-sale">For Sale</span>
                <div class="price">$120.00</div>
                <div class="title">Wireless Noise Cancelling Headphones</div>
                <div class="location">New York, NY</div>
            </div>
        </div>

        <!-- Item 2 (Auction) -->
        <div class="item-card">
            <img src="https://images.unsplash.com/photo-1585123334904-845d60e97b29?w=400" alt="Watch" class="item-img">
            <div class="item-info">
                <span class="badge badge-auction">Auction: 2h left</span>
                <div class="price">Current Bid: $450.00</div>
                <div class="title">Vintage Gold Mechanical Watch</div>
                <div class="location">Los Angeles, CA</div>
            </div>
        </div>

        <!-- Item 3 (Sale) -->
        <div class="item-card">
            <img src="https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400" alt="Smartwatch" class="item-img">
            <div class="item-info">
                <span class="badge badge-sale">For Sale</span>
                <div class="price">$199.00</div>
                <div class="title">Brand New Smart Series 7</div>
                <div class="location">Chicago, IL</div>
            </div>
        </div>

        <!-- Item 4 (Auction) -->
        <div class="item-card">
            <img src="https://images.unsplash.com/photo-1550152706-9ac6a3ee5b6c?w=400" alt="Camera" class="item-img">
            <div class="item-info">
                <span class="badge badge-auction">Auction: 1d left</span>
                <div class="price">Current Bid: $1,200.00</div>
                <div class="title">Professional DSLR Camera Body</div>
                <div class="location">Miami, FL</div>
            </div>
        </div>

    </div>
</div>

</body>
</html>