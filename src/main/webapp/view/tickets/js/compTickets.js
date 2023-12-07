

// Example starter JavaScript for disabling form submissions if there are invalid fields
(() => {
    'use strict'
  
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    const forms = document.querySelectorAll('.needs-validation')
  
    // Loop over them and prevent submission
    Array.from(forms).forEach(form => {
      form.addEventListener('submit', event => {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }
  
        form.classList.add('was-validated')
      }, false)
    })
  })()

function calcTotal() {
    const precio=1000
    console.log("ingreso a calcTotal")

    let cant=document.getElementById("cant").value
    document.getElementsByClassName("form-control")
    document.getElementsByTagName("input")
    document.querySelector("#cant")
    document.querySelectorAll("input.form-control, div.row")
    document.querySelector("input")
    document.querySelector("#cant")
    document.querySelectorAll(".form-control")
    document.forms
    console.log("cant=" + cant)
    
    // if (Number.isNaN(cant)) {
    //     console.log("no es nro")
    // } else {
    //     console.log("si es nro")
    // }

    if (cant>=1) {
        let total=cant*precio
        console.log("total=" + total)

        let desc=document.getElementById("desc").value 
        console.log("desc="+desc)

        total=total - (total*desc/100)
        console.log("total con desc="+total)
    
        document.getElementById("total").innerHTML=total     
        document.getElementById("total").className="bg-info p-1"
    } else {
        document.getElementById("total").innerHTML="Debe ingresar una cantidad mayor o igual a 1"
        document.getElementById("total").className="bg-danger p-1"
    }
    

}

function changeSel(valor) {
  document.getElementById("desc").value=valor
}



function submitForm() {
    // Aquí puedes agregar lógica adicional antes de enviar el formulario, si es necesario.
    // ...

    // Simulación de compra exitosa. Puedes adaptar esta lógica según tus necesidades.
    const cantidadComprada = document.getElementById("cant").value;
    showSuccess(cantidadComprada);
}

function showSuccess(cantidad) {
    var resultadoContainer = document.getElementById("resultadoContainer");
    resultadoContainer.innerHTML = `
        <div class="alert alert-success" role="alert">
            Compra realizada exitosamente.<br>
            Cantidad de Tickets comprados: ${cantidad}<br>
            Total a pagar: $${document.getElementById("total").textContent}
        </div>
    `;
    resultadoContainer.classList.add("resultado-visible");
    setTimeout(function () {
        resultadoContainer.classList.remove("resultado-visible");
    }, 5000);
}
