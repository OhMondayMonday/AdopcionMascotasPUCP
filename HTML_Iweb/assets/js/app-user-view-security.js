"use strict";
!(function () {
  const e = document.querySelector("#formChangePassword");
  e &&
    FormValidation.formValidation(e, {
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
        bootstrap5: new FormValidation.plugins.Bootstrap5({
          eleValidClass: "",
          rowSelector: ".form-password-toggle",
        }),
        submitButton: new FormValidation.plugins.SubmitButton(),
        autoFocus: new FormValidation.plugins.AutoFocus(),
      },
      init: (e) => {
        e.on("plugins.message.placed", function (e) {
          e.element.parentElement.classList.contains("input-group") &&
            e.element.parentElement.insertAdjacentElement(
              "afterend",
              e.messageElement
            );
        });
      },
    });
})();
