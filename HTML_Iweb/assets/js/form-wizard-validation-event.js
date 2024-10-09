"use strict";
!function () {
    var e = $(".select2"), a = $(".selectpicker"), i = document.querySelector("#wizard-validation");
    if (null !== i) {
        var t = i.querySelector("#wizard-validation-form");
        const s = t.querySelector("#datos-publicacion");
        var o = t.querySelector("#datos-mascota"), n = t.querySelector("#datos-recepcion"),
            r = [].slice.call(t.querySelectorAll(".btn-next")), t = [].slice.call(t.querySelectorAll(".btn-prev"));
        const l = new Stepper(i, {linear: !0}),
            d = FormValidation.formValidation(s, {
                fields: {
                    formValidationTitulo: {
                        validators: {
                            notEmpty: {
                                message: "Se requiere un título"
                            },
                            stringLength: {
                                min: 6,
                                max: 30,
                                message: "El título debe tener entre 6 y 30 caracteres"
                            },
                            regexp: {
                                regexp: /^[a-zA-Z0-9 ]+$/,
                                message: "El título solo puede contener letras, números y espacios"
                            }
                        }
                    },
                    formValidationFecha: {
                        validators: {
                            notEmpty: {
                                message: "Se requiere una Fecha"
                            },
                        }
                    },
                    formValidationLugar: {
                        validators: {
                            notEmpty: {
                                message: "Debe indicar un Lugar"
                            },
                            stringLength: {
                                min: 6,
                                max: 30,
                                message: "Debe tener entre 6 y 30 caracteres"
                            },
                            regexp: {
                                regexp: /^[a-zA-Z0-9 ]+$/,
                                message: "Solo puede contener letras, números y espacios"
                            }
                        }
                    },
                    formValidationDescripcion: {
                        validators: {
                            stringLength: {
                                min: 10,
                                max: 400,
                                message: "La descripcion debe contener entre 10 y 255 caracteres"
                            },
                            notEmpty: {
                                message: 'La descripción es obligatoria'
                            },
                        }
                    }
                },
                plugins: {
                    trigger: new FormValidation.plugins.Trigger(),
                    bootstrap5: new FormValidation.plugins.Bootstrap5({
                        eleValidClass: "",
                        rowSelector: ".mb-3"
                    }),
                    autoFocus: new FormValidation.plugins.AutoFocus(),
                    submitButton: new FormValidation.plugins.SubmitButton(),
                },
                init: function (e) {
                    e.on("plugins.message.placed", function (e) {
                        if (e.element.parentElement.classList.contains("input-group")) {
                            e.element.parentElement.insertAdjacentElement("afterend", e.messageElement);
                        }
                    });
                }

        }).on("core.form.valid", function () {
            l.next()
        }), m = FormValidation.formValidation(o, {
            fields: {
                formValidationNombre: {validators: {notEmpty: {message: "Debe ingresar un nombre"}}},
                formValidationAforo: {validators: {notEmpty: {message: "Debe indicar el aforo"}}},
                formValidationRazon: {validators: {notEmpty: {message: "Debe indicar la razón del evento"}}},
            },
            plugins: {
                trigger: new FormValidation.plugins.Trigger,
                bootstrap5: new FormValidation.plugins.Bootstrap5({eleValidClass: "", rowSelector: ".col"}),
                autoFocus: new FormValidation.plugins.AutoFocus,
                submitButton: new FormValidation.plugins.SubmitButton
            }
        }).on("core.form.valid", function () {
            l.next()
        })
        r.forEach(e => {
            e.addEventListener("click", e => {
                switch (l._currentIndex) {
                    case 0:
                        d.validate();
                        break;
                    case 1:
                        m.validate();
                        break;
                }
            })
        }), t.forEach(e => {
            e.addEventListener("click", e => {
                switch (l._currentIndex) {
                    case 2:
                    case 1:
                        l.previous()
                }
            })
        })
    }
}();