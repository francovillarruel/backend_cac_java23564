const deleteModal = document.getElementById('deleteModal')
if (deleteModal) {
  deleteModal.addEventListener('show.bs.modal', event => {
    // Button that triggered the modal
    const button = event.relatedTarget
    // Extract info from data-bs-* attributes
    const recipient = button.getAttribute('idDel')
    // If necessary, you could initiate an Ajax request here
    // and then do the updating in a callback.

    // Update the modal's content.
    const modalTitle = deleteModal.querySelector('.modal-title')
    const modalBodyInput = deleteModal.querySelector('.modal-body input')

    modalBodyInput.value = recipient
  })
}
const updateModal = document.getElementById('updateModal');
if (updateModal) {
  updateModal.addEventListener('show.bs.modal', event => {
    // Button that triggered the modal
    const button = event.relatedTarget;
    // Extract info from data-bs-* attributes
    let idUpd = button.getAttribute('idUpd');
    let nombre = button.getAttribute('nombre');
    let apellido = button.getAttribute('apellido');
    let email = button.getAttribute('email');
    let profesion = button.getAttribute('profesion');
    let fotoperfil = button.getAttribute('fotoperfil');
    let dni = button.getAttribute('dni');
    let temas = button.getAttribute('temas'); // Agregado para recuperar el valor de temas

    // Update the modal's content.
    document.getElementById("idUpd").value = idUpd;
    document.getElementById("nom").value = nombre;
    document.getElementById("ape").value = apellido;
    document.getElementById("email").value = email;
    document.getElementById("profesion").value = profesion;
    document.getElementById("fotoperfil").value = fotoperfil;
    document.getElementById("dni").value = dni;
    document.getElementById("temas").value = temas; // Agregado para establecer el valor de temas
  });
}
