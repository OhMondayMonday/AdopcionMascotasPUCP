"use strict";
const formAuthentication = document.querySelector("#formAuthentication");
document.addEventListener("DOMContentLoaded", function (e) {
  var t;
  formAuthentication &&
    FormValidation.formValidation(formAuthentication, {
      fields: {
        username: {
          validators: {
            notEmpty: { message: "Please enter username" },
            stringLength: {
              min: 6,
              message: "Username must be more than 6 characters",
            },
          },
        },
        email: {
          validators: {
            notEmpty: { message: "Por favor ingresa tu correo electrónico" },
            emailAddress: { message: "Por favor ingresa un correo válido" },
          },
        },
        "email-username": {
          validators: {
            notEmpty: { message: "Por favor ingresa tu correo electrónico" },
            emailAddress: { message: "Por favor ingresa un correo válido" },
          },
        },
        password: {
          validators: {
            notEmpty: { message: "Por favor ingresa tu contraseña" },
            stringLength: {
              min: 6,
              message: "Las contraseñas deben tener más de 6 caracteres",
            },
          },
        },
        "confirm-password": {
          validators: {
            notEmpty: { message: "Por favor confirma tu contraseña" },
            identical: {
              compare: function () {
                return formAuthentication.querySelector('[name="password"]')
                  .value;
              },
              message: "Las contraseñas no coinciden",
            },
            stringLength: {
              min: 6,
              message: "Las contraseñas deben tener más de 6 caracteres",
            },
          },
        },
        terms: {
          validators: {
            notEmpty: { message: "Por favor acepta los términos y condiciones" },
          },
        },
      },
      plugins: {
        trigger: new FormValidation.plugins.Trigger(),
        bootstrap5: new FormValidation.plugins.Bootstrap5({
          eleValidClass: "",
          rowSelector: ".mb-3",
        }),
        submitButton: new FormValidation.plugins.SubmitButton(),
        defaultSubmit: new FormValidation.plugins.DefaultSubmit(),
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
    }),
    (t = document.querySelectorAll(".numeral-mask")).length &&
      t.forEach((e) => {
        new Cleave(e, { numeral: !0 });
      });
});
