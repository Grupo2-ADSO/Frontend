function iniciarSesion() {
    let correo = document.getElementById("correo").value;
    let clave = document.getElementById("clave").value
    if (correo === "admin@correo.com" && clave === "123") {
        window.location.href = "administrador.html";
    }
    else if (correo === "operario@correo.com" && clave === "123") {
        window.location.href = "operario.html";
    }
    else if (correo === "sup@correo.com" && clave === "123") {
        window.location.href = "supervisor.html";
    }
    else {
        alert("Correo o Contraseña incorrecta")
    }
}