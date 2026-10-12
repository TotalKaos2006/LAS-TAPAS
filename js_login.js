const gebruikers = [
    { naam: "kok", wachtwoord: "pizza123" },
    { naam: "ober", wachtwoord: "tafel456" },
    { naam: "manager", wachtwoord: "baas789" }
];
 
const loginDeel = document.getElementById("loginDeel");
const bestelDeel = document.getElementById("bestelDeel");
const formulier = document.getElementById("loginForm");
 
// Laat de bestelpagina zien en verberg het inloggen
function toonBestellen() {
    loginDeel.style.display = "none";
    bestelDeel.style.display = "block";
}
 
// Laat het inloggen zien en verberg de bestelpagina
function toonLogin() {
    bestelDeel.style.display = "none";
    loginDeel.style.display = "block";
}
 
// Inloggen
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
        toonBestellen();
    } else {
        alert("Gebruikersnaam of wachtwoord is fout.");
    }
});
 
// Uitloggen
// We luisteren op de hele pagina, zodat de knop altijd werkt,
// ook als je de knop later verplaatst of aanpast.
document.addEventListener("click", function (event) {
    if (event.target.closest("#uitlogKnop")) {
        sessionStorage.removeItem("ingelogd"); // vergeet de inlog
        formulier.reset();                     // maak de velden leeg
        toonLogin();
    }
});
 
// Als je de pagina ververst en al was ingelogd, blijf je ingelogd
if (sessionStorage.getItem("ingelogd")) {
    toonBestellen();
}