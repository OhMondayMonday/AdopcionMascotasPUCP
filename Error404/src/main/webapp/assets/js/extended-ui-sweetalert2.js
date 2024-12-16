"use strict";
!(function () {
    var t = document.querySelector("#basic-alert"),
        n = document.querySelector("#with-title"),
        o = document.querySelector("#footer-alert"),
        e = document.querySelector("#html-alert"),
        i = document.querySelector("#position-top-start"),
        c = document.querySelector("#position-top-end"),
        s = document.querySelector("#position-bottom-start"),
        r = document.querySelector("#position-bottom-end"),
        a = document.querySelector("#bounce-in-animation"),
        u = document.querySelector("#fade-in-animation"),
        l = document.querySelector("#flip-x-animation"),
        m = document.querySelector("#tada-animation"),
        f = document.querySelector("#shake-animation"),
        b = document.querySelector("#type-success"),
        d = document.querySelector("#type-info"),
        S = document.querySelector("#type-warning"),
        y = document.querySelector("#type-error"),
        p = document.querySelector("#type-question"),
        w = document.querySelector("#custom-image"),
        h = document.querySelector("#auto-close"),
        g = document.querySelector("#outside-click"),
        C = document.querySelector("#progress-steps"),
        B = document.querySelector("#ajax-request"),
        k = document.querySelector("#confirm-text"),
        x = document.querySelector("#confirm-color");

        t &&
        (t.onclick = function () {
            Swal.fire({
                title: "Any fool can use a computer",
                customClass: { confirmButton: "btn btn-primary" },
                buttonsStyling: !1,
            });
        }),
        n &&
        (n.onclick = function () {
            Swal.fire({
                title: "The Internet?,",
                text: "That thing is still around?",
                customClass: { confirmButton: "btn btn-primary" },
                buttonsStyling: !1,
            });
        }),
        o &&
        (o.onclick = function () {
            Swal.fire({
                icon: "error",
                title: "Oops...",
                text: "Something went wrong!",
                footer: "<a href>Why do I have this issue?</a>",
                customClass: { confirmButton: "btn btn-primary" },
                buttonsStyling: !1,
            });
        }),
        e &&
        (e.onclick = function () {
            Swal.fire({
                title: "<strong>HTML <u>example</u></strong>",
                icon: "info",
                html: 'You can use <b>bold text</b>, <a href="https://pixinvent.com/" target="_blank">links</a> and other HTML tags',
                showCloseButton: !0,
                showCancelButton: !0,
                focusConfirm: !1,
                confirmButtonText: '<i class="fa fa-thumbs-up"></i> Great!',
                confirmButtonAriaLabel: "Thumbs up, great!",
                cancelButtonText: '<i class="fa fa-thumbs-down"></i>',
                cancelButtonAriaLabel: "Thumbs down",
                customClass: {
                    confirmButton: "btn btn-primary me-3",
                    cancelButton: "btn btn-label-secondary",
                },
                buttonsStyling: !1,
            });
        }),
        i &&
        (i.onclick = function () {
            Swal.fire({
                position: "top-start",
                icon: "success",
                title: "Your work has been saved",
                showConfirmButton: !1,
                timer: 1500,
                customClass: { confirmButton: "btn btn-primary" },
                buttonsStyling: !1,
            });
        }),
        c &&
        (c.onclick = function () {
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "Your work has been saved",
                showConfirmButton: !1,
                timer: 1500,
                customClass: { confirmButton: "btn btn-primary" },
                buttonsStyling: !1,
            });
        }),
        s &&
        (s.onclick = function () {
            Swal.fire({
                position: "bottom-start",
                icon: "success",
                title: "Your work has been saved",
                showConfirmButton: !1,
                timer: 1500,
                customClass: { confirmButton: "btn btn-primary" },
                buttonsStyling: !1,
            });
        }),
        r &&
        (r.onclick = function () {
            Swal.fire({
                position: "bottom-end",
                icon: "success",
                title: "Your work has been saved",
                showConfirmButton: !1,
                timer: 1500,
                customClass: { confirmButton: "btn btn-primary" },
                buttonsStyling: !1,
            });
        }),
        a &&
        (a.onclick = function () {
            Swal.fire({
                title: "Bounce In Animation",
                showClass: { popup: "animate__animated animate__bounceIn" },
                customClass: { confirmButton: "btn btn-primary" },
                buttonsStyling: !1,
            });
        }),
        u &&
        (u.onclick = function () {
            Swal.fire({
                title: "Fade In Animation",
                showClass: { popup: "animate__animated animate__fadeIn" },
                customClass: { confirmButton: "btn btn-primary" },
                buttonsStyling: !1,
            });
        }),
        l &&
        (l.onclick = function () {
            Swal.fire({
                title: "Flip In Animation",
                showClass: { popup: "animate__animated animate__flipInX" },
                customClass: { confirmButton: "btn btn-primary" },
                buttonsStyling: !1,
            });
        }),
        m &&
        (m.onclick = function () {
            Swal.fire({
                title: "Tada Animation",
                showClass: { popup: "animate__animated animate__tada" },
                customClass: { confirmButton: "btn btn-primary" },
                buttonsStyling: !1,
            });
        }),
        f &&
        (f.onclick = function () {
            Swal.fire({
                title: "Shake Animation",
                showClass: { popup: "animate__animated animate__shakeX" },
                customClass: { confirmButton: "btn btn-primary" },
                buttonsStyling: !1,
            });
        }),
        b &&
        (b.onclick = function () {
            Swal.fire({
                title: "Good job!",
                text: "You clicked the button!",
                icon: "success",
                customClass: { confirmButton: "btn btn-primary" },
                buttonsStyling: !1,
            });
        }),
        d &&
        (d.onclick = function () {
            Swal.fire({
                title: "Info!",
                text: "You clicked the button!",
                icon: "info",
                customClass: { confirmButton: "btn btn-primary" },
                buttonsStyling: !1,
            });
        }),
        S &&
        (S.onclick = function () {
            Swal.fire({
                title: "Warning!",
                text: " You clicked the button!",
                icon: "warning",
                customClass: { confirmButton: "btn btn-primary" },
                buttonsStyling: !1,
            });
        }),
        y &&
        (y.onclick = function () {
            Swal.fire({
                title: "Error!",
                text: " You clicked the button!",
                icon: "error",
                customClass: { confirmButton: "btn btn-primary" },
                buttonsStyling: !1,
            });
        }),
        p &&
        (p.onclick = function () {
            Swal.fire({
                title: "Question!",
                text: " You clicked the button!",
                icon: "question",
                customClass: { confirmButton: "btn btn-primary" },
                buttonsStyling: !1,
            });
        }),
        w &&
        (w.onclick = function () {
            Swal.fire({
                title: "Sweet!",
                text: "Modal with a custom image.",
                imageUrl: assetsPath + "img/backgrounds/15.jpg",
                imageWidth: 400,
                imageAlt: "Custom image",
                customClass: { confirmButton: "btn btn-primary" },
                buttonsStyling: !1,
            });
        }),
        h &&
        (h.onclick = function () {
            var t;
            Swal.fire({
                title: "Auto close alert!",
                html: "I will close in <strong></strong> seconds.",
                timer: 2e3,
                customClass: { confirmButton: "btn btn-primary" },
                buttonsStyling: !1,
                willOpen: function () {
                    Swal.showLoading(),
                        (t = setInterval(function () {
                            Swal.getHtmlContainer().querySelector("strong").textContent =
                                Swal.getTimerLeft();
                        }, 100));
                },
                willClose: function () {
                    clearInterval(t);
                },
            }).then(function (t) {
                t.dismiss === Swal.DismissReason.timer &&
                    console.log("I was closed by the timer");
            });
        }),
        g &&
        (g.onclick = function () {
            Swal.fire({
                title: "Click outside to close!",
                text: "This is a cool message!",
                backdrop: !0,
                allowOutsideClick: !0,
                customClass: { confirmButton: "btn btn-primary" },
                buttonsStyling: !1,
            });
        }),
        C &&
        (C.onclick = function () {
            const e = ["1", "2", "3"],
                i = Swal.mixin({
                    confirmButtonText: "Forward",
                    cancelButtonText: "Back",
                    progressSteps: e,
                    input: "text",
                    inputAttributes: { required: !0 },
                    validationMessage: "This field is required",
                });
            !(async function () {
                var t = [];
                let n;
                for (n = 0; n < e.length;) {
                    var o = await new i({
                        title: "Question " + e[n],
                        showCancelButton: 0 < n,
                        currentProgressStep: n,
                    });
                    o.value ? ((t[n] = o.value), n++) : "cancel" === o.dismiss && n--;
                }
                Swal.fire(JSON.stringify(t));
            })();
        }),
        B &&
        (B.onclick = function () {
            Swal.fire({
                title: "Submit your Github username",
                input: "text",
                inputAttributes: { autocapitalize: "off" },
                showCancelButton: !0,
                confirmButtonText: "Look up",
                showLoaderOnConfirm: !0,
                customClass: {
                    confirmButton: "btn btn-primary me-3",
                    cancelButton: "btn btn-label-danger",
                },
                preConfirm: (t) =>
                    fetch("//api.github.com/users/" + t)
                        .then((t) => {
                            if (t.ok) return t.json();
                            throw new Error(t.statusText);
                        })
                        .catch((t) => {
                            Swal.showValidationMessage("Request failed:" + t);
                        }),
                backdrop: !0,
                allowOutsideClick: () => !Swal.isLoading(),
            }).then((t) => {
                t.isConfirmed &&
                    Swal.fire({
                        title: t.value.login + "'s avatar",
                        imageUrl: t.value.avatar_url,
                        customClass: {
                            confirmButtonText: "Close me!",
                            confirmButton: "btn btn-primary",
                        },
                    });
            });
        }),
        k &&
        (k.onclick = function () {
            Swal.fire({
                title: "¿Estás seguro?",
                text: "Confirmarás los cambios hechos",
                icon: "warning",
                showCancelButton: !0,
                confirmButtonText: "Sí, confirmar cambios",
                customClass: {
                    confirmButton: "btn btn-primary me-3",
                    cancelButton: "btn btn-label-secondary",
                },
                buttonsStyling: !1,
            }).then(function (t) {
                t.value &&
                    Swal.fire({
                        icon: "success",
                        title: "¡Hecho!",
                        text: "Tu perfil ha sido actualizado.",
                        customClass: { confirmButton: "btn btn-success" },
                    });
            });
        }),
        x &&
        (x.onclick = function () {
            Swal.fire({
                title: "Are you sure?",
                text: "You won't be able to revert this!",
                icon: "warning",
                showCancelButton: !0,
                confirmButtonText: "Yes, delete it!",
                customClass: {
                    confirmButton: "btn btn-primary me-3",
                    cancelButton: "btn btn-label-secondary",
                },
                buttonsStyling: !1,
            }).then(function (t) {
                t.value
                    ? Swal.fire({
                        icon: "success",
                        title: "Deleted!",
                        text: "Your file has been deleted.",
                        customClass: { confirmButton: "btn btn-success" },
                    })
                    : t.dismiss === Swal.DismissReason.cancel &&
                    Swal.fire({
                        title: "Cancelled",
                        text: "Your imaginary file is safe :)",
                        icon: "error",
                        customClass: { confirmButton: "btn btn-success" },
                    });
            });
        });
        // Espera a que el documento esté completamente cargado
        document.addEventListener('DOMContentLoaded', function () {
            // Selecciona todos los botones de eliminar en caso de que haya múltiples
            var deleteButtons = document.querySelectorAll('.btn-delete');
            
            deleteButtons.forEach(function(button) {
                button.addEventListener('click', function (event) {
                    event.preventDefault(); // Evita que el botón recargue la página si es un enlace
        
                    // Alerta de confirmación con SweetAlert2
                    Swal.fire({
                        title: "¿Estás seguro de eliminar esta solicitud?",
                        text: "Esta acción es irreversible. La solicitud será eliminada.",
                        icon: "warning",
                        showCancelButton: true,
                        confirmButtonText: "Sí, eliminar",
                        cancelButtonText: "Cancelar",
                        customClass: {
                            confirmButton: "btn btn-primary me-3",
                            cancelButton: "btn btn-label-secondary",
                        },
                        buttonsStyling: false,
                    }).then(function (result) {
                        if (result.isConfirmed) {
                            // Acción cuando el usuario confirma
                            Swal.fire({
                                icon: "success",
                                title: "¡Eliminado!",
                                text: "La solicitud ha sido eliminada.",
                                customClass: { confirmButton: "btn btn-success" },
                            });
                        } else if (result.dismiss === Swal.DismissReason.cancel) {
                            // Acción cuando el usuario cancela
                            Swal.fire({
                                title: "Cancelado",
                                text: "La solicitud no ha sido eliminada.",
                                icon: "error",
                                customClass: { confirmButton: "btn btn-success" },
                            });
                        }
                    });
                });
            });
        });

        document.addEventListener('DOMContentLoaded', function () {
            // Selecciona todos los botones de aceptar con la clase 'btn-accept'
            var acceptButtons = document.querySelectorAll('.btn-accept');
            
            // Recorre cada botón de aceptar y agrega el evento de clic
            acceptButtons.forEach(function(button) {
                button.addEventListener('click', function (event) {
                    event.preventDefault(); // Evita que el enlace haga su comportamiento predeterminado
        
                    // Alerta de confirmación con SweetAlert2 para aceptar la solicitud
                    Swal.fire({
                        title: "¿Quieres aceptar esta solicitud?",
                        text: "La solicitud será aprobada.",
                        icon: "question",
                        showCancelButton: true,
                        confirmButtonText: "Sí, aceptarla",
                        cancelButtonText: "Cancelar",
                        customClass: {
                            confirmButton: "btn btn-primary me-3",
                            cancelButton: "btn btn-label-secondary",
                        },
                        buttonsStyling: false,
                    }).then(function (result) {
                        if (result.isConfirmed) {
                            // Si el usuario confirma, muestra la alerta de éxito
                            Swal.fire({
                                icon: "success",
                                title: "¡Solicitud aceptada!",
                                text: "La solicitud ha sido aprobada.",
                                customClass: { confirmButton: "btn btn-success" },
                            });
        
                            // Aquí puedes agregar la lógica para hacer la acción real de aceptación
                            // Por ejemplo, una solicitud AJAX para actualizar el estado de la solicitud en el servidor
                        } else if (result.dismiss === Swal.DismissReason.cancel) {
                            // Si el usuario cancela, muestra una alerta opcional o simplemente no hacer nada
                            Swal.fire({
                                title: "Acción cancelada",
                                text: "La solicitud no fue aprobada.",
                                icon: "info",
                                customClass: { confirmButton: "btn btn-info" },
                            });
                        }
                    });
                });
            });
        });
        


        

        document.querySelectorAll('.btn-inscripcion').forEach(button => {
            button.addEventListener('click', function () {
              const eventId = this.getAttribute('data-event-id');
              const userType = this.getAttribute('user-type');
              const postType = this.getAttribute('post-type');
              let eventLink = ''; 

              // Configura el enlace basado en el tipo de usuario

              switch (userType) {

                case 'usuario':

                    switch (postType) {

                        case 'publi':
                            eventLink = 'ver-publicaciones-detalles-usuario.html';
                        break;

                        case 'event':
                            eventLink = 'EventosServlet?action=verDetallesEvento&event_id='+eventId;
                            break;
                    }
                    break;

                case 'albergue':
                    
                    switch (postType) {

                        case 'publi':
                            // Configura el enlace de detalles basado en el ID del evento
                            switch (eventId) {
                                case '1':
                                    eventLink = 'albergue-ver-publicaciones-detalles.html'; // Cambia esto por el enlace real
                                    break;
                                case '2':
                                    eventLink = 'albergue-ver-publicaciones-detalles.html';
                                    break;
                                case '3':
                                    eventLink = 'albergue-ver-publicaciones-detalles.html';
                                    break;
                                case '4':
                                    eventLink = 'albergue-ver-publicaciones-detalles.html';
                                    break;
                                case '5':
                                    eventLink = 'albergue-ver-publicaciones-detalles.html';
                                    break;
                                case '6':
                                    eventLink = 'albergue-ver-publicaciones-detalles.html';
                                    break;
                                default:
                                    eventLink = '#'; // O enlace por defecto
                            }
                            break;

                        case 'event':
                            // Configura el enlace de detalles basado en el ID del evento
                            switch (eventId) {
                                case '1':
                                    eventLink = 'albergue-ver-eventos-detalles.html'; // Cambia esto por el enlace real
                                    break;
                                case '2':
                                    eventLink = 'albergue-ver-eventos-detalles.html';
                                    break;
                                case '3':
                                    eventLink = 'albergue-ver-eventos-detalles.html';
                                    break;
                                case '4':
                                    eventLink = 'albergue-ver-eventos-detalles.html';
                                    break;
                                case '5':
                                    eventLink = 'albergue-ver-eventos-detalles.html';
                                    break;
                                case '6':
                                    eventLink = 'albergue-ver-eventos-detalles.html';
                                    break;
                                default:
                                    eventLink = '#'; // O enlace por defecto
                            }
                            break;

                    }
                    break;

                case 'coordinador':
                    eventLink = 'coordinador-ver-publicaciones.html';
                    break;
                default:
                    eventLink = '#'; // O enlace por defecto


              }
          
          
              Swal.fire({
                title: "¿Te quieres inscribir?",
                icon: "warning",
                html: `Puedes ver más detalles de la actividad <a href="${eventLink}" target="_blank">aquí</a>`,
                showCancelButton: true,
                confirmButtonText: "Sí, inscribirme",
                cancelButtonText: "Cancelar",
                customClass: {
                  confirmButton: "btn btn-primary me-2",
                  cancelButton: "btn btn-label-secondary",
                },
                buttonsStyling: false
              }).then((result) => {
                if (result.isConfirmed) {
                  Swal.fire({
                    icon: "success",
                    title: "¡Inscrito!",
                    text: "Te has inscrito al evento exitosamente.",
                    confirmButtonText: "Hecho", 
                    customClass: {confirmButton: "btn btn-success" },
                  });
                  window.location.href = `EventosServlet?action=inscribirEvento&event_id=${eventId}`;
                }
              });
            });
          });

          
          
})();
