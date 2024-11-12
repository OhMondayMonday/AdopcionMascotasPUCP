"use strict";

// Procesa los datos de eventos y asigna a window.events
window.events = window.eventosData.map(evento => {
    // Usa evento.fechaEvento directamente como un objeto Date
    let start = new Date(evento.fechaEvento);
    let end = new Date(start); // Clona la fecha de inicio

    // Ajusta la fecha de fin si el evento dura un día
    end.setDate(end.getDate() + 1); // Suma 1 día para la fecha de fin

    return {
        id: evento.eventId,
        title: evento.nombreEvento,
        start: start, // Fecha de inicio en el formato adecuado
        end: end,     // Fecha de fin en el formato adecuado
        allDay: false,
        extendedProps: {
            calendar: "Inscritos"
        }
    };
});

console.log("Eventos formateados para el calendario:", window.events);

//     id: 12,
//     url: "",
//     title: "Reunión Trabajo",
//     start: new Date(date.getFullYear(), date.getMonth() + 1, -22),
//     end: new Date(date.getFullYear(), date.getMonth() + 1, -21),
//     extendedProps: {calendar: "Personal"}
