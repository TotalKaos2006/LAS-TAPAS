const standaardLoginPagina = "index.html";
 
const loginPagina = sessionStorage.getItem("loginPagina") || standaardLoginPagina;
 
// Niet ingelogd? Dan terug naar de loginpagina.
if (!sessionStorage.getItem("ingelogd")) {
    window.location.href = loginPagina;
}
 
// Uitloggen
const uitlogKnop = document.getElementById("uitlogKnop");
 
uitlogKnop.addEventListener("click", function () {
    sessionStorage.removeItem("ingelogd"); // vergeet de inlog
    window.location.href = loginPagina;    // terug naar de loginpagina
});
 