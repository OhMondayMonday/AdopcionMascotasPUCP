"use strict";
$(function () {
    var e = $(".select2");
    e.length && e.each(function () {
        var e = $(this);
        e.wrap('<div class="position-relative"></div>'), e.select2({
            placeholder: "Select an country",
            dropdownParent: e.parent()
        })
    })
}), document.addEventListener("DOMContentLoaded", function (e) {
    var n = document.querySelector("#multiStepsValidation");
    if (null !== n) {
        var a = n.querySelector("#multiStepsForm");
        const c = a.querySelector("#accountDetailsValidation");
        var i = a.querySelector("#personalInfoValidation"), s = a.querySelector("#billingLinksValidation"),
            r = [].slice.call(a.querySelectorAll(".btn-next")), a = [].slice.call(a.querySelectorAll(".btn-prev")),
            o = document.querySelector(".multi-steps-exp-date"), l = document.querySelector(".multi-steps-cvv"),
            m = document.querySelector(".multi-steps-mobile"), u = document.querySelector(".multi-steps-pincode"),
            d = document.querySelector(".multi-steps-card");
        o && new Cleave(o, {date: !0, delimiter: "/", datePattern: ["m", "y"]}), l && new Cleave(l, {
            numeral: !0,
            numeralPositiveOnly: !0
        }), m && new Cleave(m, {phone: !0, phoneRegionCode: "US"}), u && new Cleave(u, {
            delimiter: "",
            numeral: !0
        }), d && new Cleave(d, {
            creditCard: !0, onCreditCardTypeChanged: function (e) {
                document.querySelector(".card-type").innerHTML = "" != e && "unknown" != e ? '<img src="' + assetsPath + "img/icons/payments/" + e + '-cc.png" height="28"/>' : ""
            }
        });
        let t = new Stepper(n, {linear: !0});
        const p = FormValidation.formValidation(c, {
            fields: {
                multiStepsUsername: {
                    validators: {
                        notEmpty: {message: "Por favor, ingrese un nombre de usuario"},
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: "Debe tener entre 6 y 30 caracteres"
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9]+$/,
                            message: "Solo puede contener caracteres alfanuméricos sin espacios"
                        },
                        remote: {
                            message: "El usuario ya existe",
                            method: "POST",
                            url: "register",
                            data: function () {
                                return {
                                    action: "validateUsername",
                                    username: c.querySelector('[name = "multiStepsUsername"]').value
                                };
                            },
                            dataType: "json",
                            delay: 500,
                            validKey: "valid",
                            onError: function () {
                                alert("Error al conectar con el servidor. Intente nuevamente");
                            }
                        }
                    }
                },
                multiStepsEmail: {
                    validators: {
                        notEmpty: { message: "Por favor, ingrese un correo electrónico" },
                        emailAddress: { message: "El valor ingresado no es un correo válido" },
                        remote: {
                            message: "El correo ya está registrado",
                            method: "POST",
                            url: "register",
                            data: function () {
                                return {
                                    action: "validateEmail",
                                    email: c.querySelector('[name="multiStepsEmail"]').value
                                };
                            },
                            dataType: "json",
                            delay: 500,
                            validKey: "valid",
                            onError: function () {
                                alert("Error al conectar con el servidor. Intente nuevamente.");
                            }
                        }
                    }
                }
            },
            plugins: {
                trigger: new FormValidation.plugins.Trigger,
                bootstrap5: new FormValidation.plugins.Bootstrap5({eleValidClass: "", rowSelector: ".col-sm-6"}),
                autoFocus: new FormValidation.plugins.AutoFocus,
                submitButton: new FormValidation.plugins.SubmitButton
            },
            init: e => {
                e.on("plugins.message.placed", function (e) {
                    e.element.parentElement.classList.contains("input-group") && e.element.parentElement.insertAdjacentElement("afterend", e.messageElement)
                })
            }
        }).on("core.form.valid", function () {
            t.next();
        }), g = FormValidation.formValidation(i, {
            fields: {
                multiStepsFirstName: {
                    validators: {
                        notEmpty: { message: "Por favor ingresa tu nombre" },
                        regexp: {
                            regexp: /^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ ]+$/,
                            message: "El nombre sólo puede contener caracteres alfabeticos",
                        },
                    },
                },
                multiStepsLastName: {
                    validators: {
                        notEmpty: { message: "Por favor ingresa tu apellido" },
                        regexp: {
                            regexp: /^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ ]+$/,
                            message: "El apellido solo puede contener caracteres alfabeticos",
                        },
                    },
                },
                multiStepsPass: {
                    validators: { notEmpty: { message: "Por favor ingresa una contraseña" } },
                },
                multiStepsConfirmPass: {
                    validators: {
                        notEmpty: { message: "Debes confirmar tu contraseña" },
                        identical: {
                            compare: function () {
                                return i.querySelector('[name="multiStepsPass"]').value;
                            },
                            message: "Las contraseñas no coinciden",
                        },
                    },
                },
                multiStepsAddress: {
                    validators: {
                        notEmpty: {message: "Por favor, ingresa tu dirección"}
                    },
                    regexp: {
                        regexp: /^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ0-9 ,.#\-\/]+$/,
                        message: "La dirección no admite este tipo de caracteres",
                    }
                },
                multiStepsDocument: {
                    validators: {
                        notEmpty: {
                            message: "Por favor, ingresa el número de tu documento"
                        },
                        regexp: {
                            regexp: /^[0-9]+$/,
                            message: "Solo puedes ingresar números"
                        },
                        stringLength: {
                            min: 8,
                            max: 8,
                            message: "Debe tener 8 números"
                        },
                        remote: {
                            message: "Esta persona ya se encuentra registrada",
                            method: "POST",
                            url: "register",
                            data: function () {
                                return {
                                    action: "validateDNI",
                                    dni: i.querySelector('[name="multiStepsDocument"]').value
                                };
                            },
                            dataType: "json",
                            delay: 500,
                            validKey: "valid",
                            onError: function () {
                                alert("Error al conectar con el servidor. Intente nuevamente.");
                            }
                        }
                    }
                }
            },
            plugins: {
                trigger: new FormValidation.plugins.Trigger,
                bootstrap5: new FormValidation.plugins.Bootstrap5({
                    eleValidClass: "", rowSelector: function (e, t) {
                        switch (e) {
                            case"multiStepsFirstName":
                                return ".col-sm-6";
                            case"multiStepsAddress":
                                return ".col-md-12";
                            default:
                                return ".col-sm-6"
                        }
                    }
                }),
                autoFocus: new FormValidation.plugins.AutoFocus,
                submitButton: new FormValidation.plugins.SubmitButton
            },
        }).on("core.form.valid", function () {
            Swal.fire({
                title: '¡Solicitud enviada!',
                text: 'Tus datos han sido enviados y serán revisados por un administrador. Te enviaremos un correo de confirmación lo más pronto posible.',
                icon: 'success',
                confirmButtonText: 'Aceptar',
                customClass: {
                    confirmButton: 'btn btn-primary'
                },
                buttonsStyling: false
            }).then((result) => {
                if (result.isConfirmed) {
                    // Antes de redirigir, hacemos la solicitud AJAX para enviar los datos al servlet
                    $.ajax({
                        url: 'register',  // La URL del servlet
                        type: 'POST',
                        data: {
                            action: 'registerUser',
                            multiStepsUsername: $('#multiStepsUsername').val(),
                            multiStepsPass: $('#multiStepsPass').val(),
                            multiStepsEmail: $('#multiStepsEmail').val(),
                            multiStepsFirstName: $('#multiStepsFirstName').val(),
                            multiStepsLastName: $('#multiStepsLastName').val(),
                            multiStepsAddress: $('#multiStepsAddress').val(),
                            multiStepsDocument: $('#multiStepsDocument').val(),
                            multiStepsState: $('#multiStepsState').val()
                        },
                        success: function(response) {
                            if (response.status === "success") {
                                Swal.fire({
                                    title: '¡Registro exitoso!',
                                    text: response.message,
                                    icon: 'success',
                                    confirmButtonText: 'Aceptar',
                                    customClass: {
                                        confirmButton: 'btn btn-primary'
                                    },
                                    buttonsStyling: false
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        window.location.href = "login"; // Redirigir a la página de inicio de sesión
                                    }
                                });
                            } else {
                                Swal.fire({
                                    title: '¡Error!',
                                    text: response.message,
                                    icon: 'error',
                                    confirmButtonText: 'Aceptar',
                                    customClass: {
                                        confirmButton: 'btn btn-danger'
                                    },
                                    buttonsStyling: false
                                });
                            }
                        },
                        error: function() {
                            Swal.fire({
                                title: '¡Error!',
                                text: 'Hubo un problema al enviar los datos. Intenta nuevamente.',
                                icon: 'error',
                                confirmButtonText: 'Aceptar',
                                customClass: {
                                    confirmButton: 'btn btn-danger'
                                },
                                buttonsStyling: false
                            });
                        }
                    });
                }
            });
        });
        r.forEach(e => {
            e.addEventListener("click", e => {
                switch (t._currentIndex) {
                    case 0:
                        p.validate();
                        break;
                    case 1:
                        g.validate();
                        break;
                    case 2:
                        v.validate()
                }
            })
        }), a.forEach(e => {
            e.addEventListener("click", e => {
                switch (t._currentIndex) {
                    case 2:
                    case 1:
                        t.previous()
                }
            })
        })
    }
});