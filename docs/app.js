document.addEventListener('DOMContentLoaded', function() {
    // Initialize demo chart
    const ctx = document.getElementById('demoChart');
    if (ctx) {
        new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: ['Compliant', 'Non-Compliant', 'Unknown'],
                datasets: [{
                    data: [75, 20, 5],
                    backgroundColor: [
                        '#28a745',
                        '#dc3545', 
                        '#ffc107'
                    ],
                    borderWidth: 0
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'bottom'
                    },
                    title: {
                        display: true,
                        text: 'Device Compliance Overview'
                    }
                }
            }
        });
    }
});
