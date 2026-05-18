<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>The E Spot | Buy & Sell</title>
    <style>
        body { background-color: #0b0e14; color: white; font-family: sans-serif; margin: 0; display: flex; }
        aside { width: 200px; background: #1a1d24; height: 100vh; padding: 20px; position: fixed; }
        main { margin-left: 240px; padding: 20px; width: 100%; }
        .logo { font-size: 24px; color: #8a2be2; font-weight: bold; text-decoration: none; }
        .nav-link { display: block; color: #aaa; padding: 10px 0; text-decoration: none; }
        .nav-link:hover { color: #8a2be2; }
        .card { background: #1a1d24; border: 1px solid #333; border-radius: 10px; padding: 15px; width: 250px; display: inline-block; margin: 10px; }
        .price { color: #00f2ff; font-size: 1.2em; font-weight: bold; }
        .btn { background: #8a2be2; color: white; border: none; padding: 10px; width: 100%; border-radius: 5px; cursor: pointer; margin-top: 10px; }
    </style>
</head>
<body>
    <aside>
        <a href="#" class="logo">The E Spot</a>
        <nav>
            <a href="#" class="nav-link">Home</a>
            <a href="#" class="nav-link">Auctions</a>
            <a href="#" class="nav-link">Settings</a>
        </nav>
    </aside>
    <main>
        <h1>Marketplace</h1>
        <div class="card">
            <div class="price">$120.00</div>
            <p>Smart Watch Series X</p>
            <button class="btn">View Item</button>
        </div>
        <div class="card">
            <div class="price">$450.00</div>
            <p>Gaming Console</p>
            <button class="btn">Place Bid</button>
        </div>
    </main>
</body>
</html>