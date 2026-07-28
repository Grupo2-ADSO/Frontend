// ==========================================
// JAVASCRIPT - PANEL DEL OPERARIO
// ==========================================

document.addEventListener("DOMContentLoaded", function () {
    iniciarPagina();
});

function iniciarPagina() {
    marcarPaginaActual();
    iniciarBuscador();
    mostrarFechaActual();
    iniciarMenuResponsive();
    iniciarEvidencias();
}


// ==========================================
// 1. MARCAR PÁGINA ACTUAL
// ==========================================

function marcarPaginaActual() {
    const paginaActual = window.location.pathname.split("/").pop();
    const enlaces = document.querySelectorAll("[data-nav]");

    enlaces.forEach(function (enlace) {
        const paginaEnlace = enlace.getAttribute("href");

        if (paginaEnlace === paginaActual) {
            enlace.classList.add("active");
        }
    });
}


// ==========================================
// 2. BUSCADOR DE TABLAS
// ==========================================

function iniciarBuscador() {
    const buscadores = document.querySelectorAll("[data-filter]");

    buscadores.forEach(function (buscador) {
        buscador.addEventListener("input", function () {
            filtrarTabla(buscador);
        });
    });
}

function filtrarTabla(buscador) {
    const selector = buscador.getAttribute("data-filter");
    const tabla = document.querySelector(selector);

    if (!tabla) {
        return;
    }

    const texto = buscador.value.toLowerCase();
    const filas = tabla.querySelectorAll("tbody tr");

    filas.forEach(function (fila) {
        const contenido = fila.textContent.toLowerCase();

        if (contenido.includes(texto)) {
            fila.style.display = "";
        } else {
            fila.style.display = "none";
        }
    });
}


// ==========================================
// 3. FECHA ACTUAL
// ==========================================

function mostrarFechaActual() {
    const elementosFecha = document.querySelectorAll("[data-today]");

    const fecha = new Date();

    const opciones = {
        day: "2-digit",
        month: "2-digit",
        year: "numeric"
    };

    const fechaActual = fecha.toLocaleDateString("es-CO", opciones);

    elementosFecha.forEach(function (elemento) {
        elemento.textContent = fechaActual;
    });
}


// ==========================================
// 4. MENÚ RESPONSIVE
// ==========================================

function iniciarMenuResponsive() {
    const botonMenu = document.querySelector("[data-menu-toggle]");
    const sidebar = document.querySelector(".sidebar");
    const overlay = document.querySelector("[data-overlay]");

    if (!botonMenu || !sidebar || !overlay) {
        return;
    }

    botonMenu.addEventListener("click", function () {
        sidebar.classList.toggle("sidebar--open");
        overlay.classList.toggle("overlay--visible");
    });

    overlay.addEventListener("click", function () {
        cerrarMenu();
    });
}

function cerrarMenu() {
    const sidebar = document.querySelector(".sidebar");
    const overlay = document.querySelector("[data-overlay]");

    if (sidebar) {
        sidebar.classList.remove("sidebar--open");
    }

    if (overlay) {
        overlay.classList.remove("overlay--visible");
    }
}


// ==========================================
// 5. EVIDENCIAS
// ==========================================

function iniciarEvidencias() {
    const botonGuardar = document.querySelector(".save-evidences");

    if (!botonGuardar) {
        return;
    }

    botonGuardar.addEventListener("click", function () {
        const archivos = document.querySelectorAll('input[type="file"]');
        let cantidad = 0;

        archivos.forEach(function (archivo) {
            if (archivo.files.length > 0) {
                cantidad++;
            }
        });

        if (cantidad > 0) {
            mostrarMensaje(
                "Se seleccionaron " + cantidad + " evidencia(s) correctamente."
            );
        } else {
            mostrarMensaje(
                "Seleccione al menos un archivo antes de guardar."
            );
        }
    });
}

function mostrarMensaje(mensaje) {
    alert(mensaje);
}
