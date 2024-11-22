document.addEventListener('DOMContentLoaded', () => {
    const barChart = document.getElementById('activeUsersChart').getContext('2d');
    new Chart(barChart, {
        type: 'bar',
        data: {
            labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
            datasets: [{
                label: 'Active Users',
                data: [12000, 18000, 5000, 10000, 15000, 20000, 22000],
                backgroundColor: [
                    '#4B6CB7', // Blue for Monday
                    '#4B6CB7', // Blue for Tuesday
                    '#4B6CB7', // Blue for Wednesday
                    '#4B6CB7', // Blue for Thursday
                    '#4B6CB7', // Blue for Friday
                    '#4B6CB7', // Blue for Saturday
                    '#4B6CB7'  // Blue for Sunday
                ],
                borderColor: '#354A9F', // Darker blue border
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: true,
            plugins: {
                legend: {
                    display: true,
                    labels: {
                        color: '#4B5563' // Neutral gray for the legend text
                    }
                }
            },
            scales: {
                x: {
                    ticks: {
                        color: '#4B5563' // Neutral gray for x-axis labels
                    }
                },
                y: {
                    beginAtZero: true,
                    ticks: {
                        color: '#4B5563' // Neutral gray for y-axis labels
                    }
                }
            }
        }
    });

    // Circular chart configuration
    const circleChart = document.querySelector('.circle-chart');
    const percentageSpan = circleChart.querySelector('span');
    const percentage = 80; // Example percentage value

    circleChart.style.background = `conic-gradient(#4B6CB7 ${percentage}%, #F7F9FF ${percentage}%)`;
    percentageSpan.textContent = `${percentage}%`;
});
``
