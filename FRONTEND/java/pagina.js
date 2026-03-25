function iniciarSesion() {
    let correo = document.getElementById("correo").value;
    let clave = document.getElementById("clave").value
    if (correo === "admin@correo.com" && clave === "123") {
        window.location.href = "administrador.html";
    }
    else if (correo === "operario@correo.com" && clave === "123") {
        window.location.href = "Proyecto-Electivo.html";
    }
    else if (correo === "func@correo.com" && clave === "123") {
        window.location.href = ".html";
    }
    else {
        alert("Correo o Contraseña incorrecta")
    }
}