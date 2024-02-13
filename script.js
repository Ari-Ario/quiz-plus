
function incrementId(){
    const id = document.getElementById('question-id');
    console.log(id)
    id.value= id+1
    console.log(id)
}

function openPopup() {
    let popup = document.getElementById("popup");
    popup.style.display = "block";
}

function closePopup() {
    let popup = document.getElementById("popup");
    popup.style.display = "none";
}