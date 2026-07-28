// =========================
// CAMBIO DE SECCIONES
// =========================

function mostrarSeccion(id, boton) {
    const secciones = document.querySelectorAll(".seccion");
    const botones = document.querySelectorAll(".menu-item");

    // Ocultar todas las secciones
    secciones.forEach(function(seccion) {
        seccion.classList.remove("activa");
    });

    // Quitar el estado activo de los botones
    botones.forEach(function(item) {
        item.classList.remove("active");
    });

    // Mostrar la sección seleccionada
    const seccionSeleccionada = document.getElementById(id);

    if (seccionSeleccionada) {
        seccionSeleccionada.classList.add("activa");
    }

    // Marcar el botón seleccionado
    if (boton) {
        boton.classList.add("active");
    }
}


// =========================
// SELECCIÓN DE AMBIENTE
// =========================

const ambiente = document.getElementById("ambiente");

if (ambiente) {
    ambiente.addEventListener("change", cambiarAmbiente);
}

function cambiarAmbiente() {
    const ambienteSeleccionado = document.getElementById("ambiente").value;
    const opcionesHabitacion = document.getElementById("opcionesHabitacion");
    const campoHabitacion = document.getElementById("campoHabitacion");

    if (ambienteSeleccionado === "habitacion") {
        opcionesHabitacion.classList.remove("oculto");
        campoHabitacion.classList.remove("oculto");
        cargarPisos();
    } else {
        opcionesHabitacion.classList.add("oculto");
        campoHabitacion.classList.add("oculto");
        limpiarHabitaciones();
    }
}


// =========================
// GENERACIÓN DE PISOS
// =========================

function cargarPisos() {
    const pisoSelect = document.getElementById("piso");

    // Evita agregar los pisos más de una vez
    if (pisoSelect.options.length > 1) {
        return;
    }

    for (let piso = 6; piso <= 17; piso++) {
        const opcion = document.createElement("option");

        opcion.value = piso;
        opcion.textContent = "Piso " + piso;

        pisoSelect.appendChild(opcion);
    }
}


// =========================
// GENERACIÓN DE HABITACIONES
// =========================

const piso = document.getElementById("piso");

if (piso) {
    piso.addEventListener("change", cargarHabitaciones);
}

function cargarHabitaciones() {
    const pisoSeleccionado = document.getElementById("piso").value;
    const habitacionSelect = document.getElementById("habitacion");

    limpiarHabitaciones();

    if (pisoSeleccionado === "") {
        return;
    }

    let inicio = 1;
    let fin = 16;

    // El piso 16 tiene una distribución diferente
    if (pisoSeleccionado == 16) {
        inicio = 3;
        fin = 13;
    }

    // El piso 17 tiene más habitaciones
    if (pisoSeleccionado == 17) {
        inicio = 1;
        fin = 18;
    }

    for (let numero = inicio; numero <= fin; numero++) {
        let numeroHabitacion = numero;

        if (numero < 10) {
            numeroHabitacion = "0" + numero;
        }

        const habitacion = pisoSeleccionado + numeroHabitacion;
        const opcion = document.createElement("option");

        opcion.value = habitacion;
        opcion.textContent = "Hab. " + habitacion;

        habitacionSelect.appendChild(opcion);
    }
}

function limpiarHabitaciones() {
    const habitacionSelect = document.getElementById("habitacion");

    habitacionSelect.innerHTML =
        '<option value="">Seleccione una habitación</option>';
}


// =========================
// CREAR ORDEN
// =========================

const formulario = document.getElementById("formOrden");

if (formulario) {
    formulario.addEventListener("submit", function(evento) {
        evento.preventDefault();

        const ambienteSeleccionado = document.getElementById("ambiente").value;
        const habitacionSeleccionada = document.getElementById("habitacion").value;

        // Si se selecciona una habitación, debe tener una habitación válida
        if (ambienteSeleccionado === "habitacion" && habitacionSeleccionada === "") {
            mostrarMensaje("Seleccione una habitación antes de crear la orden.");
            return;
        }

        document.getElementById("mensajeOrden").classList.remove("oculto");

        mostrarMensaje("La orden se creó correctamente.");

        formulario.reset();
        document.getElementById("opcionesHabitacion").classList.add("oculto");
        document.getElementById("campoHabitacion").classList.add("oculto");
        limpiarHabitaciones();
    });
}


// =========================
// BUSCAR ÓRDENES
// =========================

const buscador = document.getElementById("buscarOrden");

if (buscador) {
    buscador.addEventListener("input", buscarOrden);
}

function buscarOrden() {
    const texto = document.getElementById("buscarOrden").value.toLowerCase();
    const filas = document.querySelectorAll("#tablaOrdenes tr");

    filas.forEach(function(fila) {
        const contenido = fila.textContent.toLowerCase();

        if (contenido.includes(texto)) {
            fila.style.display = "";
        } else {
            fila.style.display = "none";
        }
    });
}


// =========================
// NOTIFICACIONES
// =========================

function mostrarMensaje(mensaje) {
    const notificacion = document.getElementById("notificacion");

    notificacion.textContent = mensaje;
    notificacion.classList.add("mostrar");

    setTimeout(function() {
        notificacion.classList.remove("mostrar");
    }, 2500);
}


// =========================
// CERRAR SESIÓN
// =========================

function cerrarSesion() {
    const confirmar = confirm("¿Desea cerrar la sesión?");

    if (confirmar) {
        window.location.href = "../html/pagina.html";
    }
}
