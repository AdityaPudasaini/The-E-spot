<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- The E-spot Version 1.0.11 - Navy Theme Refactor --%>
<!DOCTYPE html><html><head><title>Admin - The E-spot</title><style>
body { margin: 0; background-color: #f1f5f9; font-family: "Segoe UI", Tahoma, sans-serif; }
.topPart { background: #1e3a8a; color: white; height: 80px; display: flex; align-items: center; padding: 0 50px; }
.dashboardCard { background: white; margin: 40px; padding: 30px; border-radius: 12px; border-top: 8px solid #1e3a8a; box-shadow: 0 10px 15px -3px rgba(0,0,0,0.1); }
.statGrid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; }
.statItem { background: #eff6ff; padding: 20px; border-radius: 8px; text-align: center; }
</style></head><body>
<div class="topPart"><h1>The E-spot Administration</h1></div>
<div class="dashboardCard">
    <h2>Performance Overview</h2>
    <div class="statGrid">
        <div class="statItem"><b>Revenue:</b> $12,400</div>
        <div class="statItem"><b>Users:</b> 1,024</div>
        <div class="statItem"><b>Active:</b> 850</div>
        <div class="statItem"><b>Flagged:</b> 12</div>
    </div>
</div>
</body></html>