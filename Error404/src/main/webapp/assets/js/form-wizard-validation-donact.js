"use strict";
!function () {
    var e = $(".select2"), a = $(".selectpicker"), i = document.querySelector("#wizard-validation");
    if (null !== i) {
        var t = i.querySelector("#wizard-validation-form");
        const s = t.querySelector("#datos-publicacion");
        var o = t.querySelector("#datos-donacion"),
            r = [].slice.call(t.querySelectorAll(".btn-next")),
            t = [].slice.call(t.querySelectorAll(".btn-prev"));

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
                    formValidationDescripcion: {
                        validators: {
                            stringLength: {
                                min: 10,
                                max: 400,
                                message: "La descripción debe contener entre 10 y 400 caracteres"
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
                l.next();
            }),
            m = FormValidation.formValidation(o, {
                fields: {
                    puntoAcopio: {validators: {notEmpty: {message: "Debe ingresar un punto de acopio"}}},
                    tipoDonacion: {validators: {notEmpty: {message: "Debe seleccionar un tipo de donación"}}}
                },
                plugins: {
                    trigger: new FormValidation.plugins.Trigger(),
                    bootstrap5: new FormValidation.plugins.Bootstrap5({
                        eleValidClass: "",
                        rowSelector: ".col"
                    }),
                    autoFocus: new FormValidation.plugins.AutoFocus(),
                    submitButton: new FormValidation.plugins.SubmitButton()
                }
            }).on("core.form.valid", function () {
                alert("¡Donación registrada exitosamente!");
            });

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
        });

        t.forEach(e => {
            e.addEventListener("click", e => {
                switch (l._currentIndex) {
                    case 1:
                    case 0:
                        l.previous();
                        break;
                }
            });
        });
    }
}();
