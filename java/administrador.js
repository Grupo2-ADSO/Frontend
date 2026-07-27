function cambiarAmbiente() {

    const ambiente = document.getElementById("ambiente").value;
    const opciones = document.getElementById("opcionesAmbiente");
    const pisoSelect = document.getElementById("piso");

    if (ambiente === "habitacion") {

        opciones.style.display = "block";
        pisoSelect.innerHTML = '<option value="">Seleccione piso</option>';

        for (let i = 6; i <= 17; i++) {
            pisoSelect.innerHTML += `<option value="${i}">Piso ${i}</option>`;
        }

    } else {
        opciones.style.display = "none";
    }
}

function cargarHabitaciones() {

    const piso = document.getElementById("piso").value;
    const habitacionSelect = document.getElementById("habitacion");

    habitacionSelect.innerHTML =
        '<option value="">Seleccione habitación</option>';

    const habitacionesPorPiso = {
        6: generarHabitaciones(6, 1, 16),
        7: generarHabitaciones(7, 1, 16),
        8: generarHabitaciones(8, 1, 16),
        9: generarHabitaciones(9, 1, 16),
        10: generarHabitaciones(10, 1, 16),
        11: generarHabitaciones(11, 1, 16),
        12: generarHabitaciones(12, 1, 16),
        13: generarHabitaciones(13, 1, 16),
        14: generarHabitaciones(14, 1, 16),
        15: generarHabitaciones(15, 1, 16),
        16: generarHabitaciones(16, 3, 13),
        17: generarHabitaciones(17, 1, 18)
    };

    if (habitacionesPorPiso[piso]) {

        habitacionesPorPiso[piso].forEach(hab => {
            habitacionSelect.innerHTML +=
                `<option value="${hab}">Hab ${hab}</option>`;
        });
    }
}

function generarHabitaciones(piso, inicio, fin) {

    let lista = [];

    for (let i = inicio; i <= fin; i++) {

        let numero = i < 10 ? "0" + i : i;
        lista.push(`${piso}${numero}`);
    }

    return lista;
}