"use strict";
let date = new Date, nextDay = new Date((new Date).getTime() + 864e5),
    nextMonth = 11 === date.getMonth() ? new Date(date.getFullYear() + 1, 0, 1) : new Date(date.getFullYear(), date.getMonth() + 1, 1),
    prevMonth = 11 === date.getMonth() ? new Date(date.getFullYear() - 1, 0, 1) : new Date(date.getFullYear(), date.getMonth() - 1, 1);
window.events = [{
    id: 1,
    url: "",
    title: "Concierto Benéfico",
    start: date,
    end: nextDay,
    allDay: !1,
    extendedProps: {calendar: "Business"}
}, {
    id: 2,
    url: "",
    title: "Perrolatada",
    start: new Date(date.getFullYear(), date.getMonth() + 1, -11),
    end: new Date(date.getFullYear(), date.getMonth() + 1, -10),
    allDay: !0,
    extendedProps: {calendar: "Business"}
}, {
    id: 3,
    url: "",
    title: "Primavera Perruna",
    allDay: !0,
    start: new Date(date.getFullYear(), date.getMonth() + 1, -9),
    end: new Date(date.getFullYear(), date.getMonth() + 1, -7),
    extendedProps: {calendar: "Holiday"}
}, {
    id: 4,
    url: "",
    title: "Cita médica",
    start: new Date(date.getFullYear(), date.getMonth() + 1, -11),
    end: new Date(date.getFullYear(), date.getMonth() + 1, -10),
    extendedProps: {calendar: "Personal"}
}, {
    id: 5,
    url: "",
    title: "Concierto",
    start: new Date(date.getFullYear(), date.getMonth() + 1, -13),
    end: new Date(date.getFullYear(), date.getMonth() + 1, -12),
    allDay: !0,
    extendedProps: {calendar: "ETC"}
}, {
    id: 6,
    url: "",
    title: "Meditación",
    start: new Date(date.getFullYear(), date.getMonth() + 1, -13),
    end: new Date(date.getFullYear(), date.getMonth() + 1, -12),
    allDay: !0,
    extendedProps: {calendar: "Personal"}
}, {
    id: 7,
    url: "",
    title: "Bobby Donación",
    start: new Date(date.getFullYear(), date.getMonth() + 1, -26),
    end: new Date(date.getFullYear(), date.getMonth() + 1, -24),
    extendedProps: {calendar: "Family"}
}, {
    id: 8,
    url: "",
    title: "Acopio Víveres",
    start: new Date(date.getFullYear(), date.getMonth() + 1, -13),
    end: new Date(date.getFullYear(), date.getMonth() + 1, -12),
    allDay: !0,
    extendedProps: {calendar: "Business"}
}, {
    id: 9,
    url: "",
    title: "Reunión Mensual",
    start: nextMonth,
    end: nextMonth,
    allDay: !0,
    extendedProps: {calendar: "Business"}
}, {
    id: 10,
    url: "",
    title: "Monthly Checkup",
    start: prevMonth,
    end: prevMonth,
    allDay: !0,
    extendedProps: {calendar: "Personal"}
}, {
    id: 11,
    url: "",
    title: "Juice Donación",
    start: new Date(date.getFullYear(), date.getMonth() + 1, -28),
    end: new Date(date.getFullYear(), date.getMonth() + 1, -27),
    extendedProps: {calendar: "Family"}
}, {
    id: 12,
    url: "",
    title: "Reunión Trabajo",
    start: new Date(date.getFullYear(), date.getMonth() + 1, -22),
    end: new Date(date.getFullYear(), date.getMonth() + 1, -21),
    extendedProps: {calendar: "Personal"}
}];