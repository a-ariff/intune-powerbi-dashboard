// Professional Intune Dashboard Interactive Demo
let currentDemoTab = 'overview';
let demoCharts = {};

document.addEventListener('DOMContentLoaded', function() {
    initializeAllCharts();
    setupInteractivity();
});

function initializeAllCharts() {
    // Wait for Chart.js to load
    if (typeof Chart === 'undefined') {
        setTimeout(initializeAllCharts, 100);
        return;
    }
    
    // Initialize feature charts
    createComplianceChart();
    createSoftwareChart(); 
    createSecurityChart();
    createAnalyticsChart();
    
    // Initialize demo charts
    createOverviewChart();
}

function setupInteractivity() {
    // Smooth scrolling for navigation
    document.querySelectorAll('a[href^="#"]').forEach(link => {
        link.addEventListener('click', (e) => {
            e.preventDefault();
            const target = document.querySelector(link.getAttribute('href'));
            if (target) {
                target.scrollIntoView({ behavior: 'smooth' });
            }
        });
    });

    // Animated counters
    const animateMetrics = () => {
        const metrics = document.querySelectorAll('.metric-value');
        metrics.forEach(metric => {
            const target = parseFloat(metric.textContent);
            let current = 0;
            const increment = target / 50;
            const timer = setInterval(() => {
                current += increment;
                if (current >= target) {
                    current = target;
                    clearInterval(timer);
                }
                metric.textContent = current % 1 === 0 ? current.toString() : current.toFixed(1);
                if (metric.textContent.includes('.')) {
                    metric.textContent += '%';
                }
            }, 20);
        });
    };

    // Trigger animations when demo section is visible
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                animateMetrics();
                observer.unobserve(entry.target);
            }
        });
    });

    const demoSection = document.querySelector('.demo-section');
    if (demoSection) {
        observer.observe(demoSection);
    }
}

// Demo tab switching function
function switchDemoTab(tabName) {
    // Update tab buttons
    document.querySelectorAll('.demo-tab').forEach(tab => {
        tab.classList.remove('active');
    });
    document.querySelector(`[data-tab="${tabName}"]`).classList.add('active');

    // Update panels
    document.querySelectorAll('.demo-panel').forEach(panel => {
        panel.classList.remove('active');
    });
    document.getElementById(`${tabName}-panel`).classList.add('active');

    currentDemoTab = tabName;
    
    // Initialize specific charts for the tab
    setTimeout(() => {
        initializeDemoChart(tabName);
    }, 100);
}

function initializeDemoChart(tabName) {
    switch(tabName) {
        case 'compliance':
            createComplianceDetailChart();
            break;
        case 'security':
            createSecurityDetailChart();
            break;
        case 'devices':
            createDeviceDetailChart();
            break;
    }
}

// Chart creation functions
function createComplianceChart() {
    const canvas = document.getElementById('complianceChart');
    if (!canvas) return;

    new Chart(canvas, {
        type: 'doughnut',
        data: {
            labels: ['Compliant', 'Non-Compliant', 'Unknown'],
            datasets: [{
                data: [75, 20, 5],
                backgroundColor: ['#10b981', '#ef4444', '#f59e0b'],
                borderWidth: 2,
                borderColor: '#ffffff'
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'bottom',
                    labels: { padding: 15, font: { size: 11 } }
                }
            }
        }
    });
}

function createSoftwareChart() {
    const canvas = document.getElementById('softwareChart');
    if (!canvas) return;

    new Chart(canvas, {
        type: 'bar',
        data: {
            labels: ['Office', 'Chrome', 'Teams', 'Adobe', 'Others'],
            datasets: [{
                data: [45, 35, 30, 20, 25],
                backgroundColor: ['#3b82f6', '#10b981', '#f59e0b', '#8b5cf6', '#6b7280'],
                borderRadius: 4
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: { legend: { display: false } },
            scales: {
                y: { beginAtZero: true, grid: { display: false } },
                x: { grid: { display: false } }
            }
        }
    });
}

function createSecurityChart() {
    const canvas = document.getElementById('securityChart');
    if (!canvas) return;

    new Chart(canvas, {
        type: 'line',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
            datasets: [{
                label: 'Security Score',
                data: [82, 85, 87, 89, 91, 94],
                borderColor: '#10b981',
                backgroundColor: 'rgba(16, 185, 129, 0.1)',
                fill: true,
                tension: 0.4
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: { legend: { display: false } },
            scales: {
                y: { beginAtZero: true, max: 100 },
                x: { grid: { display: false } }
            }
        }
    });
}

function createAnalyticsChart() {
    const canvas = document.getElementById('analyticsChart');
    if (!canvas) return;

    new Chart(canvas, {
        type: 'polarArea',
        data: {
            labels: ['Windows', 'iOS', 'Android', 'macOS'],
            datasets: [{
                data: [40, 25, 20, 15],
                backgroundColor: ['#3b82f6', '#10b981', '#f59e0b', '#8b5cf6']
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: { position: 'bottom', labels: { font: { size: 10 } } }
            }
        }
    });
}

function createOverviewChart() {
    const canvas = document.getElementById('overviewChart');
    if (!canvas) return;

    new Chart(canvas, {
        type: 'line',
        data: {
            labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            datasets: [
                {
                    label: 'Compliance Rate (%)',
                    data: [94, 95, 93, 96, 94, 95, 94],
                    borderColor: '#10b981',
                    backgroundColor: 'rgba(16, 185, 129, 0.1)',
                    fill: true,
                    tension: 0.4
                },
                {
                    label: 'Active Devices',
                    data: [1820, 1835, 1840, 1847, 1850, 1845, 1847],
                    borderColor: '#3b82f6',
                    backgroundColor: 'rgba(59, 130, 246, 0.1)',
                    fill: true,
                    tension: 0.4,
                    yAxisID: 'y1'
                }
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: { legend: { position: 'top' } },
            scales: {
                y: { 
                    type: 'linear', 
                    position: 'left', 
                    max: 100,
                    title: { display: true, text: 'Compliance Rate (%)' }
                },
                y1: { 
                    type: 'linear', 
                    position: 'right',
                    title: { display: true, text: 'Device Count' },
                    grid: { drawOnChartArea: false }
                }
            }
        }
    });
}

function createComplianceDetailChart() {
    const canvas = document.getElementById('complianceDetailChart');
    if (!canvas || demoCharts.compliance) return;

    demoCharts.compliance = new Chart(canvas, {
        type: 'bar',
        data: {
            labels: ['Password Policy', 'Encryption', 'OS Version', 'App Protection', 'Device Lock'],
            datasets: [{
                label: 'Violations',
                data: [45, 23, 67, 12, 34],
                backgroundColor: ['#ef4444', '#f59e0b', '#ef4444', '#10b981', '#f59e0b']
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: { legend: { display: false } },
            scales: {
                y: { beginAtZero: true, title: { display: true, text: 'Number of Violations' } }
            }
        }
    });
}

function createSecurityDetailChart() {
    const canvas = document.getElementById('securityDetailChart');
    if (!canvas || demoCharts.security) return;

    demoCharts.security = new Chart(canvas, {
        type: 'radar',
        data: {
            labels: ['Encryption', 'Antivirus', 'Firewall', 'Updates', 'Authentication', 'Compliance'],
            datasets: [{
                label: 'Security Score',
                data: [95, 87, 92, 89, 94, 91],
                borderColor: '#3b82f6',
                backgroundColor: 'rgba(59, 130, 246, 0.2)'
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: { r: { beginAtZero: true, max: 100 } }
        }
    });
}

function createDeviceDetailChart() {
    const canvas = document.getElementById('deviceDetailChart');
    if (!canvas || demoCharts.devices) return;

    demoCharts.devices = new Chart(canvas, {
        type: 'doughnut',
        data: {
            labels: ['Windows', 'iOS', 'Android', 'macOS'],
            datasets: [{
                data: [65, 18, 12, 5],
                backgroundColor: ['#3b82f6', '#10b981', '#f59e0b', '#8b5cf6']
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: { legend: { position: 'bottom' } }
        }
    });
}
