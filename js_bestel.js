const standaardLoginPagina = "html_bestel.html";
 
const loginPagina = sessionStorage.getItem("loginPagina") || standaardLoginPagina;
 
if (!sessionStorage.getItem("ingelogd")) {
    window.location.href = loginPagina;
}
 
const uitlogKnop = document.getElementById("uitlogKnop");
 
uitlogKnop.addEventListener("click", function () {
    sessionStorage.removeItem("ingelogd"); 
    window.location.href = loginPagina;    
});
 