"use strict";
!(function () {
  var n = document.querySelector(".suspend-user"),
    n =
      (n &&
        (n.onclick = function () {
          Swal.fire({
            title: "¿Estás seguro?",
            text: "El usuario será suspendido",
            icon: "warning",
            showCancelButton: !0,
            confirmButtonText: "Sí, ¡suspender usuario!",
            customClass: {
              confirmButton: "btn btn-primary me-2",
              cancelButton: "btn btn-label-secondary",
            },
            buttonsStyling: !1,
          }).then(function (n) {
            n.value
              ? Swal.fire({
                  icon: "success",
                  title: "¡Suspendido!",
                  text: "El Usuario ha sido suspendido.",
                  customClass: { confirmButton: "btn btn-success" },
                })
              : n.dismiss === Swal.DismissReason.cancel &&
                Swal.fire({
                  title: "Cancelado",
                  text: "Suspensión cancelada :)",
                  icon: "error",
                  customClass: { confirmButton: "btn btn-success" },
                });
          });
        }),
      document.querySelectorAll(".cancel-subscription"));
  n &&
    n.forEach((n) => {
      n.onclick = function () {
        Swal.fire({
          title: "¿Estás seguro?",
          text: "Descartarás la información ingresada",
          icon: "warning",
          showCancelButton: !0,
          confirmButtonText: "Sí, descartar cambios",
          cancelButtonText: "Cancelar",
          customClass: {
            confirmButton: "btn btn-primary me-2",
            cancelButton: "btn btn-label-secondary",
          },
          buttonsStyling: !1,
        }).then(function (n) {
          n.value
            ? Swal.fire({
                icon: "success",
                title: "¡Cambios descartados!",
                text: "Los cambios fueron descartados exitosamente.",
                customClass: { confirmButton: "btn btn-success" },
              })
            : n.dismiss === Swal.DismissReason.cancel &&
              Swal.fire({
                title: "Cancelado",
                text: "Puedes seguir editando",
                icon: "error",
                customClass: { confirmButton: "btn btn-success" },
              });
        });
      };
    });
    document.querySelectorAll("#publish-button").forEach((button) => {
        button.onclick = function () {
          // Muestra la alerta de confirmación inicial
          Swal.fire({
            title: "¿Estás seguro?",
            text: "¿Deseas realizar la publicación?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: "Sí, publicar",
            cancelButtonText: "Cancelar",
            customClass: {
              confirmButton: "btn btn-primary me-2",
              cancelButton: "btn btn-label-secondary",
            },
            buttonsStyling: false,
          }).then(function (result) {
            if (result.isConfirmed) {
              // Aquí simulas la publicación
              // Después de la publicación, muestra otra alerta para ver la publicación
              Swal.fire({
                title: "¡Publicación exitosa!",
                text: "Tu publicación ha sido realizada con éxito.",
                icon: "success",
                showCancelButton: true,
                confirmButtonText: "Ver publicación",
                cancelButtonText: "Hecho",
                customClass: {
                  confirmButton: "btn btn-success me-2",
                  cancelButton: "btn btn-label-secondary",
                },
                buttonsStyling: false,
              }).then(function (result) {
                if (result.isConfirmed) {
                  // Redirige al usuario a la URL de la publicación recién creada
                  window.location.href = "ver-publicaciones-detalles-usuario.html"; // Cambia esta URL con la correcta
                }
              });
            }
          });
        };
      });

      document.querySelectorAll("#delete-button").forEach((button) => {
        button.onclick = function () {
          // Muestra la alerta de confirmación inicial
          Swal.fire({
            title: "¿Estás seguro?",
            text: "Esta acción eliminará la publicación de forma permanente.",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: "Sí, borrar",
            cancelButtonText: "Cancelar",
            customClass: {
              confirmButton: "btn btn-danger me-2",
              cancelButton: "btn btn-label-secondary",
            },
            buttonsStyling: false,
          }).then(function (result) {
            if (result.isConfirmed) {
              // Aquí simulas la eliminación de la publicación
              // Por ejemplo, puedes hacer una llamada AJAX para borrar la publicación en el backend
      
              Swal.fire({
                title: "¡Eliminada!",
                text: "La publicación ha sido eliminada con éxito.",
                icon: "success",
                confirmButtonText: "Hecho",
                customClass: {
                  confirmButton: "btn btn-success",
                },
              }).then(function () {
                // Redirigir o actualizar la página después de la eliminación
                window.location.href = "ver-mispublicaciones-usuario.html"; // Cambia la URL a la lista de publicaciones
              });
            }
          });
        };
      });
      
      
      
})();
