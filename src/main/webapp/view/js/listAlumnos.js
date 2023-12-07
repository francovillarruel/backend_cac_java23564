
// agregar un alumno a la tabla con datos ejemplo
let contador=1
function addAlumno() {
    console.log(contador)
    contador++

    let tbody=document.getElementById("tbody")

    let tr=document.createElement("tr")
    tr.setAttribute("id",contador)

    let tdId=document.createElement("td")
    tdId.innerHTML=contador
    tr.appendChild(tdId)

    let tdNom=document.createElement("td")
    tdNom.innerHTML="Nombre"
    tr.appendChild(tdNom)

    let tdApe=document.createElement("td")
    tdApe.innerHTML="Apellido"
    tr.appendChild(tdApe       )

    let tdMail=document.createElement("td")
    tdMail.innerHTML="email@gmail.com"
    tr.appendChild(tdMail)

    let tdOpe=document.createElement("td")
    let a=document.createElement("a")
    a.setAttribute("href","#")
    a.innerHTML=`<i class="bi bi-trash3-fill" onclick="delAlumno('${contador}')"></i>`
    tdOpe.appendChild(a)
    tr.appendChild(tdOpe)

    tbody.appendChild(tr)
}

function delAlumno(idTr) {
    document.querySelector("#tbody")
    document.querySelector(".table")
    let tbody=document.getElementById("tbody")
    let tr=document.getElementById(idTr)

    tbody.removeChild(tr)
    
}


 
const deleteModal = document.getElementById('deleteModal');
if (deleteModal) {
  deleteModal.addEventListener('show.bs.modal', event => {
    // Button that triggered the modal
    const button = event.relatedTarget;
    // Extract info from data-bs-* attributes
    const recipient = button.getAttribute('idDel');
    
    // Print the ID to the console
    console.log("ID: " + recipient);

    // If necessary, you could initiate an Ajax request here
    // and then do the updating in a callback.

    // Update the modal's content.
    const modalBodyInput = deleteModal.querySelector('.modal-body input');
    modalBodyInput.value = recipient;
  });
}


 

const updateModal = document.getElementById('updateModal');
if (updateModal) {
    updateModal.addEventListener('show.bs.modal', event => {
        // Button that triggered the modal
        const button = event.relatedTarget;
        // Extract info from data-bs-* attributes
        const idUpd = button.getAttribute('idUpd');
        const user = button.getAttribute('user');
        const pass = button.getAttribute('pass');
        // If necessary, you could initiate an Ajax request here
        // and then do the updating in a callback.

        // Update the modal's content.
        document.getElementById('idUpd').value = idUpd;
        document.getElementById('userUpd').value = user;
        document.getElementById('passUpd').value = pass;
    });
}
 
