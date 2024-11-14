"use strict";

function convertTo24HourFormat(time) {
    let [timePart, modifier] = time.split(" ");
    let [hours, minutes, seconds] = timePart.split(":").map(Number);

    if (modifier.toLowerCase() === "p. m." && hours < 12) {
        hours += 12;
    }
    if (modifier.toLowerCase() === "a. m." && hours === 12) {
        hours = 0;
    }

    return `${String(hours).padStart(2, "0")}:${String(minutes).padStart(2, "0")}:${String(seconds).padStart(2, "0")}`;
}

let eventosInscritos = window.eventosInscritos.map(evento => {

    let horaFin24Horas = convertTo24HourFormat(evento.horaFin);
    let horaEvento24Horas = convertTo24HourFormat(evento.horaEvento);

    let start = new Date(`${evento.fechaEvento.split("T")[0]}T${horaEvento24Horas}`);
    let end = new Date(`${evento.fechaFin.split("T")[0]}T${horaFin24Horas}`);

    console.log("Hora de Fin:" + start);

    return {
        id: evento.eventId,
        title: evento.nombreEvento,
        start: start,
        end: end,
        allDay: false,
        extendedProps: {
            calendar: "Holiday"
        }
    };
});

let eventosNoInscritos = window.eventosNoInscritos.map(evento => {

    let horaFin24Horas = convertTo24HourFormat(evento.horaFin);
    let horaEvento24Horas = convertTo24HourFormat(evento.horaEvento);

    let start = new Date(`${evento.fechaEvento.split("T")[0]}T${horaEvento24Horas}`);
    let end = new Date(`${evento.fechaFin.split("T")[0]}T${horaFin24Horas}`);

    console.log("Hora de Fin:" + start);

    return {
        id: evento.eventId,
        title: evento.nombreEvento,
        start: start,
        end: end,
        allDay: false,
        extendedProps: {
            calendar: "Business"
        }
    };
});

window.events = [...eventosInscritos, ...eventosNoInscritos];

console.log("Eventos formateados para el calendario:", window.events);

//     id: 12,
//     url: "",
//     title: "Reunión Trabajo",
//     start: new Date(date.getFullYear(), date.getMonth() + 1, -22),
//     end: new Date(date.getFullYear(), date.getMonth() + 1, -21),
//     extendedProps: {calendar: "Personal"}
