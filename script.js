function incrementId() {
  const id = document.getElementById("question-id");
  console.log(id);
  id.value = id + 1;
  console.log(id);
}

// Modal Animation Start
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal
if (btn != undefined) {
  btn.onclick = function () {
    modal.style.display = "block";
  };
}

// When the user clicks on <span> (x), close the modal

if (span != undefined) {
  span.onclick = function () {
    modal.style.display = "none";
  };
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
};

// Modal Animation End

// Input Lable animation Start
let labels = document.querySelectorAll("label");

labels.forEach((e) => e.addEventListener("click", changeColor));

function changeColor() {
  let color = this.style.backgroundColor;
  console.log(this.style.backgroundColor);
  if (this.style.backgroundColor == "black") {
    this.style.backgroundColor = "red";
    console.log("changed color");
  } else if (this.style.backgroundColor == "red") {
    this.style.backgroundColor = "black";
  }

  //   this.style.backgroundColor = "red";
}

// Input Lable animation Start
