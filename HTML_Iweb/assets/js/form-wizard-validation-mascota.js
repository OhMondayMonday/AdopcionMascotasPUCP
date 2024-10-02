"use strict";
!function () {
    var wizardElement = document.querySelector("#wizard-validation");
    if (wizardElement) {
        var form = wizardElement.querySelector("#wizard-validation-form");
        const step1 = form.querySelector("#datos-publicacion"),
            step2 = form.querySelector("#datos-mascota"),
            nextButtons = [].slice.call(form.querySelectorAll(".btn-next")),
            prevButtons = [].slice.call(form.querySelectorAll(".btn-prev")),
            btnEncontrada = document.getElementById("btn-encontrada");

        const stepper = new Stepper(wizardElement, { linear: true });

        // Validación del paso 1
        const validateStep1 = FormValidation.formValidation(step1, {
            fields: {
                formValidationDescripcion: {
                    validators: {
                        notEmpty: {
                            message: "La descripción es obligatoria"
                        },
                        stringLength: {
                            min: 10,
                            max: 400,
                            message: "La descripción debe tener entre 10 y 400 caracteres"
                        }
                    }
                }
            },
            plugins: {
                trigger: new FormValidation.plugins.Trigger(),
                bootstrap5: new FormValidation.plugins.Bootstrap5({
                    rowSelector: ".mb-3"
                }),
                autoFocus: new FormValidation.plugins.AutoFocus(),
                submitButton: new FormValidation.plugins.SubmitButton(),
            }
        }).on("core.form.valid", function () {
            stepper.next();
        });

        // Validación del paso 2
        const validateStep2 = FormValidation.formValidation(step2, {
            fields: {
                formValidationNombre: {
                    validators: {
                        notEmpty: {
                            message: "Debe ingresar el nombre de la mascota"
                        }
                    }
                },
                formValidationEdad: {
                    validators: {
                        notEmpty: {
                            message: "Debe ingresar la edad de la mascota"
                        }
                    }
                },
                formValidationRaza: {
                    validators: {
                        notEmpty: {
                            message: "Debe indicar la raza"
                        }
                    }
                },
                formValidationTamaño: {
                    validators: {
                        notEmpty: {
                            message: "Debe especificar el tamaño"
                        }
                    }
                },
                formValidationDistintivo: {
                    validators: {
                        notEmpty: {
                            message: "Debe indicar un distintivo"
                        }
                    }
                },
                formValidationLugar: {
                    validators: {
                        notEmpty: {
                            message: "Debe especificar el lugar de pérdida"
                        }
                    }
                },
                formValidationTelefono: {
                    validators: {
                        notEmpty: {
                            message: "Debe ingresar un número de teléfono"
                        },
                        regexp: {
                            regexp: /^[0-9]{9}$/,
                            message: "Debe ser un número válido de 9 dígitos"
                        }
                    }
                },
                formValidationNombreContacto: {
                    validators: {
                        notEmpty: {
                            message: "Debe ingresar el nombre de contacto"
                        }
                    }
                }
            },
            plugins: {
                trigger: new FormValidation.plugins.Trigger(),
                bootstrap5: new FormValidation.plugins.Bootstrap5({
                    rowSelector: ".col"
                }),
                autoFocus: new FormValidation.plugins.AutoFocus(),
                submitButton: new FormValidation.plugins.SubmitButton()
            }
        }).on("core.form.valid", function () {
            alert("¡Publicación confirmada!");
        });

        // Manejo de botones de siguiente
        nextButtons.forEach(function (button) {
            button.addEventListener("click", function () {
                switch (stepper._currentIndex) {
                    case 0:
                        validateStep1.validate();
                        break;
                    case 1:
                        validateStep2.validate();
                        break;
                }
            });
        });

        // Manejo de botones de anterior
        prevButtons.forEach(function (button) {
            button.addEventListener("click", function () {
                stepper.previous();
            });
        });

        // Botón de Mascota Encontrada
        btnEncontrada.addEventListener("click", function () {
            alert('¡Mascota encontrada! La publicación se ha actualizado.');
            // Aquí puedes cambiar el estado de la publicación o añadir una bandera visual en el frontend.
        });
    }
}();
