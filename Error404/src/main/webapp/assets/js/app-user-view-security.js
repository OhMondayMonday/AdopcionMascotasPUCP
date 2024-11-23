"use strict";
!(function () {
    const e = document.querySelector("#formChangePassword");
    if (e) {
        const validation = FormValidation.formValidation(e, {
            fields: {
                newPassword: {
                    validators: {
                        notEmpty: { message: "Por favor ingresa una nueva contraseña" },
                        stringLength: {
                            min: 8,
                            message: "La contraseña debe contener más de 8 caracteres",
                        },
                    },
                },
                confirmPassword: {
                    validators: {
                        notEmpty: { message: "Por favor confirma tu contraseña" },
                        identical: {
                            compare: function () {
                                return e.querySelector('[name="newPassword"]').value;
                            },
                            message: "Las contraseñas no son iguales",
                        },
                        stringLength: {
                            min: 8,
                            message: "La contraseña debe tener más de 8 caracteres",
                        },
                    },
                },
            },
            plugins: {
                trigger: new FormValidation.plugins.Trigger(),
                submitButton: new FormValidation.plugins.SubmitButton(),
                autoFocus: new FormValidation.plugins.AutoFocus(),
            },
        });

        // Controlar el evento de envío del formulario
        e.addEventListener("submit", function (event) {
            event.preventDefault(); // Detener el envío para validar
            validation.validate().then(function (status) {
                if (status === "Valid") {
                    e.submit(); // Enviar el formulario si es válido
                }
            });
        });
    }
})();
