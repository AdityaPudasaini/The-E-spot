<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- The E-spot Version 1.0.12 - Grid Card Implementation --%>
<!DOCTYPE html><html><head><style>
body { background: #e2e8f0; font-family: "Helvetica", Arial; padding: 20px; }
.header { font-size: 24px; font-weight: bold; margin-bottom: 20px; color: #0f172a; }
.grid { display: flex; flex-wrap: wrap; gap: 25px; }
.card { width: 300px; background: #fff; padding: 20px; border-radius: 20px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); }
.btn { display: inline-block; padding: 10px 20px; background: #000; color: #fff; text-decoration: none; border-radius: 5px; margin-top: 15px; }
</style></head><body>
<div class="header">The E-spot Dashboard v12</div>
<div class="grid">
    <div class="card"><h3>Revenue Stats</h3><p>Total: $15,000</p><a href="#" class="btn">View Details</a></div>
    <div class="card"><h3>Inventory</h3><p>Items: 4,200</p><a href="#" class="btn">Manage</a></div>
</div>
</body></html>