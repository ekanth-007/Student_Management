<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            color: #333;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            border-radius: 15px;
            margin-bottom: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        
        .header h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .header p {
            font-size: 1.1rem;
            opacity: 0.9;
            margin-bottom: 20px;
        }
        
        .user-info {
            background: rgba(255,255,255,0.1);
            padding: 15px;
            border-radius: 10px;
            display: inline-block;
            backdrop-filter: blur(10px);
        }
        
        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
            margin-bottom: 40px;
        }
        
        .stat-card {
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            cursor: pointer;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }
        
        .stat-icon {
            font-size: 2.5rem;
            margin-bottom: 15px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f0f2ff;
        }
        
        .stat-number {
            font-size: 2.2rem;
            font-weight: bold;
            color: #333;
            margin: 10px 0;
        }
        
        .stat-label {
            color: #666;
            font-size: 1rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .actions-container {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            margin-bottom: 40px;
        }
        
        .actions-container h2 {
            color: #333;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 2px solid #f0f2ff;
        }
        
        .action-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
        }
        
        .action-btn {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 25px;
            background: #f8f9ff;
            border-radius: 10px;
            text-decoration: none;
            color: #333;
            transition: all 0.3s ease;
            border: 2px solid transparent;
        }
        
        .action-btn:hover {
            background: white;
            border-color: #667eea;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.2);
        }
        
        .action-icon {
            font-size: 2rem;
            margin-bottom: 15px;
            color: #667eea;
        }
        
        .action-label {
            font-weight: 600;
            text-align: center;
        }
        
        .recent-activity {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
        }
        
        .recent-activity h2 {
            color: #333;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 2px solid #f0f2ff;
        }
        
        .activity-list {
            list-style: none;
        }
        
        .activity-item {
            display: flex;
            align-items: center;
            padding: 15px;
            border-bottom: 1px solid #eee;
            transition: background-color 0.3s ease;
        }
        
        .activity-item:hover {
            background-color: #f9f9f9;
        }
        
        .activity-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #f0f2ff;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            color: #667eea;
        }
        
        .activity-content {
            flex: 1;
        }
        
        .activity-time {
            color: #888;
            font-size: 0.9rem;
        }
        
        .nav-links {
            display: flex;
            justify-content: flex-end;
            gap: 15px;
            margin-top: 20px;
        }
        
        .nav-btn {
            padding: 10px 25px;
            background: white;
            color: #667eea;
            border: 2px solid #667eea;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .nav-btn:hover {
            background: #667eea;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.3);
        }
        
        .logout-btn {
            background: #ff6b6b;
            border-color: #ff6b6b;
            color: white;
        }
        
        .logout-btn:hover {
            background: #ff5252;
            border-color: #ff5252;
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }
            
            .header {
                padding: 20px;
            }
            
            .header h1 {
                font-size: 2rem;
            }
            
            .action-grid {
                grid-template-columns: 1fr;
            }
            
            .stats-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>👨‍💼 Admin Dashboard</h1>
            <p>Welcome to the administration panel. Manage all aspects of the Student Management System from here.</p>
            
            <div class="user-info">
                <p><strong>Logged in as:</strong> ${pageContext.request.userPrincipal.name}</p>
                <p><strong>Role:</strong> Administrator</p>
                <p><strong>Last login:</strong> Today</p>
            </div>
            
            <div class="nav-links">
                <a href="/students" class="nav-btn">Student Management</a>
                <a href="/" class="nav-btn">Home</a>
                <a href="/logout" class="nav-btn logout-btn">Logout</a>
            </div>
        </div>
        
        <div class="stats-container">
            <div class="stat-card">
                <div class="stat-icon">👥</div>
                <div class="stat-number">${studentCount != null ? studentCount : '0'}</div>
                <div class="stat-label">Total Students</div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon">📚</div>
                <div class="stat-number">5</div>
                <div class="stat-label">Active Courses</div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon">👤</div>
                <div class="stat-number">${userCount != null ? userCount : '0'}</div>
                <div class="stat-label">System Users</div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon">📊</div>
                <div class="stat-number">98%</div>
                <div class="stat-label">System Uptime</div>
            </div>
        </div>
        
        <div class="actions-container">
            <h2>Quick Actions</h2>
            <div class="action-grid">
                <a href="/students/add" class="action-btn">
                    <div class="action-icon">➕</div>
                    <div class="action-label">Add New Student</div>
                </a>
                
                <a href="/students" class="action-btn">
                    <div class="action-icon">📋</div>
                    <div class="action-label">View All Students</div>
                </a>
                
                <a href="#" class="action-btn">
                    <div class="action-icon">📊</div>
                    <div class="action-label">View Reports</div>
                </a>
                
                <a href="#" class="action-btn">
                    <div class="action-icon">⚙️</div>
                    <div class="action-label">System Settings</div>
                </a>
                
                <a href="#" class="action-btn">
                    <div class="action-icon">👥</div>
                    <div class="action-label">Manage Users</div>
                </a>
                
                <a href="#" class="action-btn">
                    <div class="action-icon">🔒</div>
                    <div class="action-label">Security Settings</div>
                </a>
            </div>
        </div>
        
        <div class="recent-activity">
            <h2>Recent Activity</h2>
            <ul class="activity-list">
                <li class="activity-item">
                    <div class="activity-icon">➕</div>
                    <div class="activity-content">
                        <strong>New student added</strong>
                        <p>John Doe was added to the system</p>
                    </div>
                    <div class="activity-time">10 mins ago</div>
                </li>
                
                <li class="activity-item">
                    <div class="activity-icon">✏️</div>
                    <div class="activity-content">
                        <strong>Student updated</strong>
                        <p>Jane Smith's information was updated</p>
                    </div>
                    <div class="activity-time">1 hour ago</div>
                </li>
                
                <li class="activity-item">
                    <div class="activity-icon">👤</div>
                    <div class="activity-content">
                        <strong>New user registered</strong>
                        <p>New teacher account created</p>
                    </div>
                    <div class="activity-time">3 hours ago</div>
                </li>
                
                <li class="activity-item">
                    <div class="activity-icon">📊</div>
                    <div class="activity-content">
                        <strong>Report generated</strong>
                        <p>Monthly student report created</p>
                    </div>
                    <div class="activity-time">Yesterday</div>
                </li>
            </ul>
        </div>
    </div>
</body>
</html>