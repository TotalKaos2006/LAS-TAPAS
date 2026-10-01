// Accordion
const accordion = document.querySelector(".accordion");

const panel = document.querySelector(".accordion-content");

accordion.addEventListener("click", () => {
    panel.classList.toggle("open");
});

document.querySelectorAll(".accordion-title").forEach(button => {
    button.addEventListener("click", () => {
        button.classList.toggle("active");
        button.nextElementSibling.classList.toggle("show");
    });
});

// Login
document.getElementById("loginForm").addEventListener("submit", (e) => {
    e.preventDefault();

    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;

    // Simpele controle (alleen voor demonstratie)
    if (username === "admin" && password === "1234") {
        alert("Succesvol ingelogd!");
    } else {
        alert("Onjuiste gegevens.");
    }
});