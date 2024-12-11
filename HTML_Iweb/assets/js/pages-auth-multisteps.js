"use strict";
$(function () {
  var e = $(".select2");
  e.length &&
    e.each(function () {
      var e = $(this);
      e.wrap('<div class="position-relative"></div>'),
        e.select2({
          placeholder: "Select an country",
          dropdownParent: e.parent(),
        });
    });
}),
  document.addEventListener("DOMContentLoaded", function (e) {
    var n = document.querySelector("#multiStepsValidation");
    if (null !== n) {
      var a = n.querySelector("#multiStepsForm");
      const c = a.querySelector("#accountDetailsValidation");
      var i = a.querySelector("#personalInfoValidation"),
        s = a.querySelector("#billingLinksValidation"),
        r = [].slice.call(a.querySelectorAll(".btn-next")),
        a = [].slice.call(a.querySelectorAll(".btn-prev")),
        o = document.querySelector(".multi-steps-exp-date"),
        l = document.querySelector(".multi-steps-cvv"),
        m = document.querySelector(".multi-steps-mobile"),
        u = document.querySelector(".multi-steps-pincode"),
        d = document.querySelector(".multi-steps-card");
      o && new Cleave(o, { date: !0, delimiter: "/", datePattern: ["m", "y"] }),
        l && new Cleave(l, { numeral: !0, numeralPositiveOnly: !0 }),
        m && new Cleave(m, { phone: !0, phoneRegionCode: "US" }),
        u && new Cleave(u, { delimiter: "", numeral: !0 }),
        d &&
          new Cleave(d, {
            creditCard: !0,
            onCreditCardTypeChanged: function (e) {
              document.querySelector(".card-type").innerHTML =
                "" != e && "unknown" != e
                  ? '<img src="' +
                    assetsPath +
                    "img/icons/payments/" +
                    e +
                    '-cc.png" height="28"/>'
                  : "";
            },
          });
      let t = new Stepper(n, { linear: !0 });
      const p = FormValidation.formValidation(c, {
          fields: {
            multiStepsUsername: {
              validators: {
                notEmpty: { message: "Por favor ingresa tu nombre de usuario" },
                stringLength: {
                  min: 6,
                  max: 30,
                  message:
                    "El nombre debe tener entre 6 a 30 caracteres",
                },
                regexp: {
                  regexp: /^[a-zA-Z0-9._-]+$/,
                  message: "El nombre de usuario solo puede contener letras, números, puntos, guiones y guiones bajos",
                },
              },
            },
            multiStepsEmail: {
              validators: {
                notEmpty: { message: "Por favor ingresa un correo electrónico" },
                emailAddress: {
                  message: "El correo ingresado no es válido",
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
                    return c.querySelector('[name="multiStepsPass"]').value;
                  },
                  message: "Las contraseñas no coinciden",
                },
              },
            },
          },
          plugins: {
            trigger: new FormValidation.plugins.Trigger(),
            bootstrap5: new FormValidation.plugins.Bootstrap5({
              eleValidClass: "",
              rowSelector: ".col-sm-6",
            }),
            autoFocus: new FormValidation.plugins.AutoFocus(),
            submitButton: new FormValidation.plugins.SubmitButton(),
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
        }).on("core.form.valid", function () {
          t.next();
        }),
        g = FormValidation.formValidation(i, {
          fields: {
            multiStepsFirstName: {
              validators: { 
                notEmpty: { message: "Por favor ingresa tu nombre" },
                regexp: {
                    regexp: /^[a-zA-Z\s]+$/,
                    message: "El nombre sólo puede contener letras",
                },
              },
            },
            multiStepsLastName: {
                validators: {
                  notEmpty: { message: "Por favor ingresa tu apellido" },
                  regexp: {
                    regexp: /^[a-zA-Z\s]+$/,
                    message: "El apellido solo puede contener letras",
                  },
                },
            },
            multiStepsAddress: {
              validators: {
                notEmpty: { message: "Por favor ingresa tu dirección" },
              },
            },
          },
          plugins: {
            trigger: new FormValidation.plugins.Trigger(),
            bootstrap5: new FormValidation.plugins.Bootstrap5({
              eleValidClass: "",
              rowSelector: function (e, t) {
                switch (e) {
                  case "multiStepsFirstName":
                    return ".col-sm-6";
                  case "multiStepsAddress":
                    return ".col-md-12";
                  default:
                    return ".row";
                }
              },
            }),
            autoFocus: new FormValidation.plugins.AutoFocus(),
            submitButton: new FormValidation.plugins.SubmitButton(),
          },
        }).on("core.form.valid", function () {
            // Muestra el popup de SweetAlert2
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
                  window.location.href = '';
              }
          });
        });
      r.forEach((e) => {
        e.addEventListener("click", (e) => {
          switch (t._currentIndex) {
            case 0:
              p.validate();
              break;
            case 1:
              g.validate();
              break;
            case 2:
              v.validate();
          }
        });
      }),
        a.forEach((e) => {
          e.addEventListener("click", (e) => {
            switch (t._currentIndex) {
              case 2:
              case 1:
                t.previous();
            }
          });
        });
    }
  });
  