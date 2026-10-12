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