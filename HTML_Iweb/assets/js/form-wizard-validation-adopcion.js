"use strict";
!function () {
    var quill = new Quill('#ecommerce-category-description', {
        theme: 'snow'
    });
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
                        notEmpty: {message: "Se requiere un título"},
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: "El titulo debe tener entre 6 y 30 caracteres de largo"
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9 ]+$/,
                            message: "El nombre solo puede contener letras, números y espacios"
                        }
                    }
                },
                formValidationDescripcion: {
                    validators: {
                        notEmpty: {
                            message: 'La descripción es obligatoria'
                        },
                        callback: {
                            message: 'La descripción no puede estar vacía',
                            callback: function(value, validator, $field) {
                                var descripcion = quill.getText().trim();
                                return descripcion.length > 0;
                            }
                        }
                    }
                }
            },
            plugins: {
                trigger: new FormValidation.plugins.Trigger,
                bootstrap5: new FormValidation.plugins.Bootstrap5({eleValidClass: "", rowSelector: ".col-sm-6"}),
                autoFocus: new FormValidation.plugins.AutoFocus,
                submitButton: new FormValidation.plugins.SubmitButton,
                bootstrap: new FormValidation.plugins.Bootstrap()
            },
            init: e => {
                e.on("plugins.message.placed", function (e) {
                    e.element.parentElement.classList.contains("input-group") && e.element.parentElement.insertAdjacentElement("afterend", e.messageElement)
                })
            }

        }).on("core.form.valid", function () {
            l.next()
        }), m = FormValidation.formValidation(o, {
            fields: {
                formValidationFirstName: {validators: {notEmpty: {message: "The first name is required"}}},
                formValidationLastName: {validators: {notEmpty: {message: "The last name is required"}}},
                formValidationCountry: {validators: {notEmpty: {message: "The Country is required"}}},
                formValidationLanguage: {validators: {notEmpty: {message: "The Languages is required"}}}
            },
            plugins: {
                trigger: new FormValidation.plugins.Trigger,
                bootstrap5: new FormValidation.plugins.Bootstrap5({eleValidClass: "", rowSelector: ".col-sm-6"}),
                autoFocus: new FormValidation.plugins.AutoFocus,
                submitButton: new FormValidation.plugins.SubmitButton
            }
        }).on("core.form.valid", function () {
            l.next()
        }), u = (a.length && a.each(function () {
            $(this).selectpicker().on("change", function () {
                m.revalidateField("formValidationLanguage")
            })
        }), e.length && e.each(function () {
            var e = $(this);
            e.wrap('<div class="position-relative"></div>'), e.select2({
                placeholder: "Select an country",
                dropdownParent: e.parent()
            }).on("change", function () {
                m.revalidateField("formValidationCountry")
            })
        }), FormValidation.formValidation(n, {
            fields: {
                formValidationTwitter: {
                    validators: {
                        notEmpty: {message: "The Twitter URL is required"},
                        uri: {message: "The URL is not proper"}
                    }
                },
                formValidationFacebook: {
                    validators: {
                        notEmpty: {message: "The Facebook URL is required"},
                        uri: {message: "The URL is not proper"}
                    }
                },
                formValidationGoogle: {
                    validators: {
                        notEmpty: {message: "The Google URL is required"},
                        uri: {message: "The URL is not proper"}
                    }
                },
                formValidationLinkedIn: {
                    validators: {
                        notEmpty: {message: "The LinkedIn URL is required"},
                        uri: {message: "The URL is not proper"}
                    }
                }
            },
            plugins: {
                trigger: new FormValidation.plugins.Trigger,
                bootstrap5: new FormValidation.plugins.Bootstrap5({eleValidClass: "", rowSelector: ".col-sm-6"}),
                autoFocus: new FormValidation.plugins.AutoFocus,
                submitButton: new FormValidation.plugins.SubmitButton
            }
        }).on("core.form.valid", function () {
            alert("Submitted..!!")
        }));
        r.forEach(e => {
            e.addEventListener("click", e => {
                switch (l._currentIndex) {
                    case 0:
                        d.validate();
                        break;
                    case 1:
                        m.validate();
                        break;
                    case 2:
                        u.validate()
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