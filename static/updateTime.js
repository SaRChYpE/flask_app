
function updateTime() {
    const now = new Date();
    const dateString = now.getFullYear() + '-' +
        ('0' + (now.getMonth() + 1)).slice(-2) + '-' +
        ('0' + now.getDate()).slice(-2) + ' ' +
        ('0' + now.getHours()).slice(-2) + ':' +
        ('0' + now.getMinutes()).slice(-2) + ':' +
        ('0' + now.getSeconds()).slice(-2);
    document.getElementById('current-time').innerText = dateString;
}
setInterval(updateTime, 1000);
window.onload = updateTime;
