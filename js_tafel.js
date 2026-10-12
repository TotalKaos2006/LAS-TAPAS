const beganeGrond = document.getElementById("beganeGrond");
const eersteVerdieping = document.getElementById("eersteVerdieping");

const popupAchtergrond = document.getElementById("popupAchtergrond");
const tafelFormulier = document.getElementById("tafelFormulier");
const veldNummer = document.getElementById("veldNummer");
const veldNaam = document.getElementById("veldNaam");
const veldArrangement = document.getElementById("veldArrangement");
const veldStatus = document.getElementById("status");
const veldPlaats = document.getElementById("veldPlaats");
const veldPersonen = document.getElementById("veldPersonen");

const beginStatus = {
    1: "vrij", 2: "bezet", 3: "vrij", 4: "vrij", 5: "vrij", 6: "bezet", 7: "bezet",
    8: "gereserveerd", 9: "vrij", 10: "vrij", 11: "vrij", 12: "bezet", 13: "vrij",
    14: "vrij", 15: "vrij", 16: "vrij", 17: "bezet", 18: "bezet", 19: "bezet",
    20: "bezet", 21: "gereserveerd", 22: "bezet", 23: "vrij", 24: "vrij",
    25: "vrij", 26: "vrij"
};

const OPSLAG_SLEUTEL = "tafelGegevens";
let tafels = {};
let huidigeTafel = null;

function plaatsVan(nummer) {
    return nummer <= 10 ? "Begane grond" : "Eerste verdieping";
}

function laadTafels() {
    try {
        const opgeslagen = JSON.parse(localStorage.getItem(OPSLAG_SLEUTEL));
        if (opgeslagen) return opgeslagen;
    } catch (e) { }

    const nieuw = {};
    for (let i = 1; i <= 26; i++) {
        nieuw[i] = {
            status: beginStatus[i],
            naam: "",
            arrangement: "",
            personen: 0
        };
    }
    return nieuw;
}

function bewaarTafels() {
    try {
        localStorage.setItem(OPSLAG_SLEUTEL, JSON.stringify(tafels));
    } catch (e) { }
}

function tafelFoto(nummer) {
    if (tafels[nummer].status === "bezet") {
        return "img_tafelbezet.png";
    }
    if (tafels[nummer].status === "gereserveerd") {
        return "img_tafelgereserveerd.png";
    }
    return "img_tafelbeschikbaar.png";
}

function tafelHtml(nummer) {
    return `
        <div class="TafelBox">
            <img src="${tafelFoto(nummer)}" data-tafel="${nummer}" alt="Tafel ${nummer}">
            <p>Tafel ${nummer}</p>
        </div>
    `;
}

function tekenTafels() {
    beganeGrond.innerHTML = "";
    eersteVerdieping.innerHTML = "";

    for (let i = 1; i <= 10; i++) {
        beganeGrond.innerHTML += tafelHtml(i);
    }
    for (let i = 11; i <= 26; i++) {
        eersteVerdieping.innerHTML += tafelHtml(i);
    }
}

function openPopup(nummer) {
    huidigeTafel = nummer;
    const tafel = tafels[nummer];

    veldNummer.textContent = nummer;
    veldNaam.value = tafel.naam;
    veldArrangement.value = tafel.arrangement;
    veldStatus.value = tafel.status;
    veldPlaats.textContent = plaatsVan(nummer);
    veldPersonen.value = tafel.personen;

    popupAchtergrond.hidden = false;
}

function sluitPopup() {
    popupAchtergrond.hidden = true;
    huidigeTafel = null;
}

// Klik op een tafelfoto -> popup openen
document.addEventListener("click", function (e) {
    const foto = e.target.closest("img[data-tafel]");
    if (foto) {
        openPopup(Number(foto.dataset.tafel));
    }
});

// Opslaan
tafelFormulier.addEventListener("submit", function (e) {
    e.preventDefault();
    if (huidigeTafel === null) return;

    tafels[huidigeTafel] = {
        status: veldStatus.value,
        naam: veldNaam.value.trim(),
        arrangement: veldArrangement.value.trim(),
        personen: Number(veldPersonen.value) || 0
    };

    bewaarTafels();
    tekenTafels();
    sluitPopup();
});

// Sluiten: kruisje, annuleren, buiten de popup klikken, Escape
document.getElementById("sluitKnop").addEventListener("click", sluitPopup);
document.getElementById("annuleerKnop").addEventListener("click", sluitPopup);
popupAchtergrond.addEventListener("click", function (e) {
    if (e.target === popupAchtergrond) sluitPopup();
});
document.addEventListener("keydown", function (e) {
    if (e.key === "Escape" && !popupAchtergrond.hidden) sluitPopup();
});

tafels = laadTafels();
tekenTafels();