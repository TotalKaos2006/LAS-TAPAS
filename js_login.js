const gebruikers = [
    { naam: "kok", wachtwoord: "pizza123" },
    { naam: "ober", wachtwoord: "tafel456" },
    { naam: "manager", wachtwoord: "baas789" }
];
 
const formulier = document.getElementById("loginForm");
 
formulier.addEventListener("submit", function (event) {
    event.preventDefault(); // pagina niet opnieuw laden
 
    const naam = document.getElementById("username").value;
    const wachtwoord = document.getElementById("password").value;
 
    let gevonden = false;
 
    for (const gebruiker of gebruikers) {
        if (gebruiker.naam === naam && gebruiker.wachtwoord === wachtwoord) {
            gevonden = true;
        }
    }
 
    if (gevonden) {
        sessionStorage.setItem("ingelogd", naam); // onthoud dat je bent ingelogd
        sessionStorage.setItem("loginPagina", window.location.href); // onthoud deze loginpagina
        window.location.href = "bestel.html";     // ga naar de bestelpagina
    } else {
        alert("Gebruikersnaam of wachtwoord is fout.");
    }
});
 