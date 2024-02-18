const hamburgerMenu = document.getElementById("hamburger-icon");
console.log(hamburgerMenu);
let navbarHamburger = document.getElementById("navbar-hamburger");
let bars = hamburgerMenu.getElementsByTagName("span");
let barArr = Array.from(bars);

barArr.forEach((e) => {
  e.style.transition = "all ease-in-out 0.25s";
});

hamburgerMenu.addEventListener("click", toogleHamburgerMenue);

hamburgerMenu.addEventListener("click", animateDrop);

function toogleHamburgerMenue() {
  let style = navbarHamburger.style;

  if (style.display == "none") {
    style.display = "flex";

    bars[1].style.opacity = "0";
    bars[0].style.position = "absolute";
    bars[0].style.top = "50%";

    bars[0].style.transform = "rotate(45deg)";
    bars[2].style.position = "absolute";
    bars[2].style.top = "50%";

    bars[2].style.transform = "rotate(-45deg)";
    console.log(bars);
  } else if (style.display == "flex") {
    style.display = "none";

    bars[1].style.opacity = "1";
    bars[0].style.position = "auto";
    bars[0].style.top = "-200%";
    bars[0].style.transform = "none";

    bars[2].style.position = "auto";
    bars[2].style.top = "200%";
    bars[2].style.transform = "rotate(0deg)";
  }
}

function animateDrop() {
  let dropItems = navbarHamburger.querySelectorAll("li");
  // navbarHamburger.style.display = "flex";
  navbarHamburger.style.flexDirection = "column";
  navbarHamburger.style.paddingLeft = "40%";
  // navbarHamburger.style.alignItems = "center";
  dropItems[0].classList.add("nav_hamburger_dropdown_1");
  dropItems[1].classList.add("nav_hamburger_dropdown_2");
  dropItems[2].classList.add("nav_hamburger_dropdown_3");
}
