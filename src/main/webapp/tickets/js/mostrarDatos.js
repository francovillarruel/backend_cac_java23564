document.addEventListener("DOMContentLoaded", function() {
        // Manejar el envío del formulario
        document.querySelector("form").addEventListener("submit", function(event) {
            event.preventDefault(); // Evitar la recarga de la página

            // Obtener los datos del formulario (puedes usar Java para procesar esto)
            var nombre = document.getElementById("nombre").value;
            var apellido = document.getElementById("apellido").value;
            var cantidad = document.getElementById("cant").value;
            var descuento = document.getElementById("desc").value;
            var total = document.getElementById("total").textContent;

            // Crear el mensaje de resultado
            var mensaje = `
                <div class="alert alert-success" role="alert">
                    Compra realizada exitosamente.<br>
                    Nombre: ${nombre}<br>
                    Apellido: ${apellido}<br>
                    Cantidad de Tickets: ${cantidad}<br>
                    Descuento: ${descuento}%<br>
                    Total a pagar: $${total}
                </div>
            `;

            // Mostrar el mensaje en el contenedor
            var resultadoContainer = document.getElementById("resultadoContainer");
            resultadoContainer.innerHTML = mensaje;

            // Hacer visible el contenedor
            resultadoContainer.classList.add("resultado-visible");

            // Ocultar el contenedor después de 5 segundos
            setTimeout(function() {
                resultadoContainer.classList.remove("resultado-visible");
            }, 5000);
        });
    });