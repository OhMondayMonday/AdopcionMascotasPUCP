package Controllers;

import Beans.*;
import Daos.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@MultipartConfig
@WebServlet("/PublicacionesServlet")
public class PublicacionesServlet extends HttpServlet {
    private PublicacionesDAO publicacionesDAO;
    private TiposPublicacionesDAO tiposPublicacionesDAO;
    private AdopcionDAO publicacionAdopcionDAO;
    private MascotaPerdidaDAO mascotaPerdidaDAO;
    private DonacionesDAO donacionesDAO;
    private ComentariosDAO comentariosDAO;
    private DenunciaMaltratoDAO denunciaMaltratoDAO;
    private FotosDAO fotosDAO;

    @Override
    public void init() throws ServletException {
        publicacionesDAO = new PublicacionesDAO();
        tiposPublicacionesDAO = new TiposPublicacionesDAO();
        publicacionAdopcionDAO = new AdopcionDAO();
        mascotaPerdidaDAO = new MascotaPerdidaDAO();
        donacionesDAO = new DonacionesDAO();
        comentariosDAO = new ComentariosDAO();
        denunciaMaltratoDAO = new DenunciaMaltratoDAO();
        fotosDAO = new FotosDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "verTodasPublicaciones";
        }

        Comentarios comentario = new Comentarios();

        if(request.getParameter("comentario") != null) {
            comentario.setUsuarioId(Integer.parseInt(request.getParameter("user_id")));
            comentario.setPublicacionId(Integer.parseInt(request.getParameter("publicacion_id")));
            comentario.setComentario(request.getParameter("comentario"));
        }

        switch (action) {
            case "verTodasPublicaciones":
                verTodasPublicaciones(request, response);
                break;
            case "mostrar":
                mostrarDetallesPublicacion(request, response);
                break;
            case "agregar":
                agregarPublicacion(request, response);
                break;
            case "agregarComentario":
                comentariosDAO.agregarComentario(comentario);
                mostrarDetallesPublicacion(request, response);
                break;
            case "agregarDenuncia":
                agregarDenuncia(request, response);
                break;
            case "agregarMascotaPerdida":
                agregarMascotaPerdida(request, response);
                break;
            case "agregarDonacion":
                agregarDonacion(request, response);
                break;
            case "agregarAdopcion":
                agregarAdopcion(request, response);
                break;

        }
    }

    private void verTodasPublicaciones(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tipoPublicacionIdParam = request.getParameter("tipoPublicacionId");
        String fechaInicioParam = request.getParameter("fechaInicio");
        String fechaFinParam = request.getParameter("fechaFin");

        Integer tipoPublicacionId = (tipoPublicacionIdParam != null && !tipoPublicacionIdParam.isEmpty())
                ? Integer.parseInt(tipoPublicacionIdParam)
                : null;
        Date fechaInicio = (fechaInicioParam != null && !fechaInicioParam.isEmpty())
                ? Date.valueOf(fechaInicioParam)
                :null;
        Date fechaFin = (fechaFinParam != null && !fechaFinParam.isEmpty())
                ? Date.valueOf(fechaFinParam)
                :null;

        int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        int recordsPerPage = 6;

        int totalRecords;

        List<Publicaciones> publicaciones;
        if (tipoPublicacionId != null || fechaInicio != null || fechaFin != null) {
            totalRecords = publicacionesDAO.contarPublicacionesActivasConFiltros(tipoPublicacionId, fechaInicio, fechaFin);
            publicaciones = publicacionesDAO.verPublicacionesActivos(tipoPublicacionId, fechaInicio, fechaFin, page, recordsPerPage);
        } else {
            totalRecords = publicacionesDAO.contarPublicacionesActivas();
            publicaciones = publicacionesDAO.obtenerPublicacionesActivasConPaginacion(page, recordsPerPage);
        }

            int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
            List<TiposPublicaciones> tiposPublicaciones = tiposPublicacionesDAO.obtenerTiposPublicaciones();

            request.setAttribute("totalPages", totalPages);
            request.setAttribute("page", page);
            request.setAttribute("totalRecords", totalRecords);
            request.setAttribute("publicaciones", publicaciones);
            request.setAttribute("tiposPublicaciones", tiposPublicaciones);

            request.setAttribute("filtros", new HashMap<String, Object>(){{
                put("tipoPublicacionId", tipoPublicacionId);
                put("fechaInicio", fechaInicioParam);
                put("fechaFin", fechaFinParam);
            }});
            request.getRequestDispatcher("/WEB-INF/UsuarioFinal/ver-publicaciones-usuario.jsp").forward(request, response);

    }

    private void mostrarDetallesPublicacion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("id") != null) {
            String idString = request.getParameter("id");
            int id = 0;
            try {
                id = Integer.parseInt(idString);
            } catch (NumberFormatException e) {
                response.sendRedirect("PublicacionesServlet");
            }
            Publicaciones publicacion = publicacionesDAO.obtenerDetallesPublicacion(id);
            if(publicacion != null) {
                request.setAttribute("publicacion", publicacion);

                PublicacionesAdopcion publicacionAdopcion = publicacionAdopcionDAO.obtenerPublicacionAdopcion(id);
                PublicacionesMascotaPerdida publicacionMascotaPerdida = mascotaPerdidaDAO.obtenerPublicacionMascotaPerdida(id);
                PublicacionesDonaciones publicacionDonacion = donacionesDAO.obtenerPublicacionDonacion(id);
                DenunciasMaltratoAnimal denunciaMaltratoAnimal = denunciaMaltratoDAO.obtenerDenunciaMaltratoAnimal(id);
                List<Comentarios> comentarios = comentariosDAO.obtenerComentariosPublis(id);
                request.setAttribute("adopcion", publicacionAdopcion);
                request.setAttribute("mascotaPerdida", publicacionMascotaPerdida);
                request.setAttribute("donacion",publicacionDonacion);
                request.setAttribute("denunciaMaltrato", denunciaMaltratoAnimal);
                request.setAttribute("comentarios", comentarios);

                request.getRequestDispatcher("/WEB-INF/UsuarioFinal/ver-publicaciones-detalles-usuario.jsp").forward(request, response);
            }else {
                response.sendRedirect("PublicacionesServlet");
            }
        }else{
            response.sendRedirect("PublicacionesServlet");
        }
    }

    private void agregarPublicacion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("user_id") != null) {
            String user_idString = request.getParameter("user_id");
            int user_id = 0;
            try {
                user_id = Integer.parseInt(user_idString);
            } catch (NumberFormatException e) {
                response.sendRedirect("PublicacionesServlet");
            }
            UsuarioFinalDAO usuarioFinalDAO = new UsuarioFinalDAO();
            Usuarios usuario = usuarioFinalDAO.obtenerInformacionUsuario(user_id);
            request.setAttribute("usuario", usuario);
            request.getRequestDispatcher("/WEB-INF/UsuarioFinal/crear-publicacion-usuariofinal-normal.jsp").forward(request, response);
        } else {
            response.sendRedirect("PublicacionesServlet");
        }
    }

    private void agregarDenuncia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("user_id") != null) {
            String user_idString = request.getParameter("user_id");
            int user_id = 0;
            try {
                user_id = Integer.parseInt(user_idString);
            } catch (NumberFormatException e) {
                response.sendRedirect("PublicacionesServlet");
            }
            UsuarioFinalDAO usuarioFinalDAO = new UsuarioFinalDAO();
            Usuarios usuario = usuarioFinalDAO.obtenerInformacionUsuario(user_id);
            request.setAttribute("usuario", usuario);
            RazasDao razasDao = new RazasDao();
            ArrayList<Razas> listaRazas = razasDao.listarRazas();
            request.setAttribute("listaRazas", listaRazas);
            request.getRequestDispatcher("/WEB-INF/UsuarioFinal/crear-publicacion-usuariofinal-denunciamaltrato.jsp").forward(request, response);
        } else {
            response.sendRedirect("PublicacionesServlet");
        }
    }

    private void agregarMascotaPerdida(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("user_id") != null) {
            String user_idString = request.getParameter("user_id");
            int user_id = 0;
            try {
                user_id = Integer.parseInt(user_idString);
            } catch (NumberFormatException e) {
                response.sendRedirect("PublicacionesServlet");
            }
            UsuarioFinalDAO usuarioFinalDAO = new UsuarioFinalDAO();
            Usuarios usuario = usuarioFinalDAO.obtenerInformacionUsuario(user_id);
            request.setAttribute("usuario", usuario);
            RazasDao razasDao = new RazasDao();
            ArrayList<Razas> listaRazas = razasDao.listarRazas();
            request.setAttribute("listaRazas", listaRazas);
            request.getRequestDispatcher("/WEB-INF/UsuarioFinal/crear-publicacion-usuariofinal-mascotaperdida.jsp").forward(request, response);
        } else {
            response.sendRedirect("PublicacionesServlet");
        }
    }

    private void agregarDonacion(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException{
        if (request.getParameter("user_id") != null) {
            String user_idString = request.getParameter("user_id");
            int user_id = 0;
            try {
                user_id = Integer.parseInt(user_idString);
            } catch (NumberFormatException e) {
                response.sendRedirect("PublicacionesServlet");
            }
            UsuarioFinalDAO usuarioFinalDAO = new UsuarioFinalDAO();
            Usuarios usuario = usuarioFinalDAO.obtenerInformacionUsuario(user_id);
            request.setAttribute("usuario", usuario);
            request.getRequestDispatcher("/WEB-INF/UsuarioFinal/crear-publicacion-albergue-donacion-activo.jsp").forward(request, response);
        } else {
            response.sendRedirect("PublicacionesServlet");
        }
    }

    private void agregarAdopcion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("user_id") != null) {
            String user_idString = request.getParameter("user_id");
            int user_id = 0;
            try {
                user_id = Integer.parseInt(user_idString);
            } catch (NumberFormatException e) {
                response.sendRedirect("PublicacionesServlet");
            }
            UsuarioFinalDAO usuarioFinalDAO = new UsuarioFinalDAO();
            Usuarios usuario = usuarioFinalDAO.obtenerInformacionUsuario(user_id);
            request.setAttribute("usuario", usuario);
            RazasDao razasDao = new RazasDao();
            ArrayList<Razas> listaRazas = razasDao.listarRazas();
            request.setAttribute("listaRazas", listaRazas);
            request.getRequestDispatcher("/WEB-INF/UsuarioFinal/crear-publicacion-usuariofinal-adopcion.jsp").forward(request, response);
        } else {
            response.sendRedirect("PublicacionesServlet");
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");

        PublicacionesDAO publicacionesDAO = new PublicacionesDAO();
        switch (action) {
            case "guardar":
                guardarPublicacion(request, response);
                response.sendRedirect("PublicacionesServlet");
                break;
            case "guardarDenuncia":
                guardarDenuncia(request, response);
                response.sendRedirect("PublicacionesServlet");
                break;
            case "guardarMascotaPerdida":
                guardarMascotaPerdida(request, response);
                response.sendRedirect("PublicacionesServlet");
                break;
            case "guardarDonacion":
                guardarDonacion(request, response);
                response.sendRedirect("PublicacionesServlet");
                break;
            case "guardarAdopcion":
                guardarAdopcion(request,response);
                response.sendRedirect("PublicacionesServlet");
                break;
            case "actualizar":
                break;
        }

    }

    private void guardarPublicacion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Publicaciones publicacion = new Publicaciones();
        Usuarios usuario = new Usuarios();
        usuario.setUserId(Integer.parseInt(request.getParameter("user_id")));

        publicacion.setUsuario(usuario);
        publicacion.setTitulo(request.getParameter("titulo"));
        publicacion.setDescripcion(request.getParameter("descripcion"));

        TiposPublicaciones tiposPublicacion = new TiposPublicaciones();
        if(request.getParameter("tipo_publicacion_id") != null) {
            tiposPublicacion.setTipoPublicacionId(Integer.parseInt(request.getParameter("tipo_publicacion_id")));
            publicacion.setTipoPublicacion(tiposPublicacion);
        }
        Part fotoPart = request.getPart("foto");
        if (fotoPart != null && fotoPart.getSize() > 0) {
            // Ruta de almacenamiento
            String nombreArchivo = Paths.get(fotoPart.getSubmittedFileName()).getFileName().toString();
            String rutaSubida = getServletContext().getRealPath("") + File.separator + "assets" + File.separator + "img" + File.separator + "Publis" + File.separator + nombreArchivo;

            // Guardar la imagen en el servidor
            File uploadsDir = new File(getServletContext().getRealPath("") + File.separator + "assets" + File.separator + "img" + File.separator + "Publis");
            if (!uploadsDir.exists()) {
                uploadsDir.mkdirs();
            }
            fotoPart.write(rutaSubida);
            // Actualizar en el objeto HogaresTemporales
            publicacion.setFoto(new Fotos("assets/img/Publis/" + nombreArchivo));
            System.out.println("URL de la foto almacenada: " + publicacion.getFoto().getUrlFoto());
        }else{
            System.err.println("No se recibió ninguna imagen o el archivo está vacío.");
            return;
        }

        publicacionesDAO.agregarPublicacion(publicacion);
    }

    private void guardarDenuncia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Publicaciones publicacion = new Publicaciones();
        Usuarios usuario = new Usuarios();
        usuario.setUserId(Integer.parseInt(request.getParameter("user_id")));

        publicacion.setUsuario(usuario);
        publicacion.setTitulo(request.getParameter("titulo"));
        publicacion.setDescripcion(request.getParameter("descripcion"));

        TiposPublicaciones tiposPublicacion = new TiposPublicaciones();

        if(request.getParameter("tipo_publicacion") != null) {
            tiposPublicacion.setTipoPublicacionId(Integer.parseInt(request.getParameter("tipo_publicacion")));
            publicacion.setTipoPublicacion(tiposPublicacion);
            System.out.println("Si llega a guardar los tipos de publis");
        }

        Mascotas mascota = new Mascotas();
        mascota.setNombre(request.getParameter("mascota_nombre"));
        mascota.setTamanio(request.getParameter("mascota_tamanio"));

        Razas razas = new Razas();
        razas.setRazaId(Integer.parseInt(request.getParameter("mascota_raza_id")));
        mascota.setRaza(razas);

        DenunciasMaltratoAnimal denunciasMaltratoAnimal = new DenunciasMaltratoAnimal();
        denunciasMaltratoAnimal.setUserId(Integer.parseInt(request.getParameter("user_id")));
        denunciasMaltratoAnimal.setMascota(mascota);
        denunciasMaltratoAnimal.setNombreMaltratador(request.getParameter("maltratador_nombre"));
        denunciasMaltratoAnimal.setTipoMaltrato(request.getParameter("maltrato_tipo"));
        denunciasMaltratoAnimal.setDireccionMaltrato(request.getParameter("direccion_maltrato"));

        switch (request.getParameter("denuncia_policial")){
            case "SI":
                denunciasMaltratoAnimal.setDenunciaPolicial(true);
                break;
            case "NO":
                denunciasMaltratoAnimal.setDenunciaPolicial(false);
                break;
        }
        Part fotoPart = request.getPart("foto");
        if (fotoPart != null && fotoPart.getSize() > 0) {
            // Ruta de almacenamiento
            String nombreArchivo = Paths.get(fotoPart.getSubmittedFileName()).getFileName().toString();
            String rutaSubida = getServletContext().getRealPath("") + File.separator + "assets" + File.separator + "img" + File.separator + "Publis" + File.separator + nombreArchivo;

            // Guardar la imagen en el servidor
            File uploadsDir = new File(getServletContext().getRealPath("") + File.separator + "assets" + File.separator + "img" + File.separator + "Publis");
            if (!uploadsDir.exists()) {
                uploadsDir.mkdirs();
            }
            fotoPart.write(rutaSubida);
            // Actualizar en el objeto HogaresTemporales
            publicacion.setFoto(new Fotos("assets/img/Publis/" + nombreArchivo));
            System.out.println("URL de la foto almacenada: " + publicacion.getFoto().getUrlFoto());
        }else{
            System.err.println("No se recibió ninguna imagen o el archivo está vacío.");
            publicacion.setFoto(new Fotos(""));
        }
        publicacionesDAO.agregarPublicacion(publicacion);
        denunciasMaltratoAnimal.setReportId(publicacionesDAO.obtenerIdUltimaPublicacion());
        denunciasMaltratoAnimal.getMascota().setFoto(fotosDAO.obtenerIdPorUrl(publicacion.getFoto().getUrlFoto()));
        denunciaMaltratoDAO.agregarDenunciaMaltrato(denunciasMaltratoAnimal);
    }

    private void guardarMascotaPerdida (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Publicaciones publicacion = new Publicaciones();
        Usuarios usuario = new Usuarios();
        usuario.setUserId(Integer.parseInt(request.getParameter("user_id")));

        publicacion.setUsuario(usuario);
        publicacion.setTitulo(request.getParameter("titulo"));
        publicacion.setDescripcion(request.getParameter("descripcion"));

        TiposPublicaciones tiposPublicacion = new TiposPublicaciones();

        if(request.getParameter("tipo_publicacion") != null) {
            tiposPublicacion.setTipoPublicacionId(Integer.parseInt(request.getParameter("tipo_publicacion")));
            publicacion.setTipoPublicacion(tiposPublicacion);
            System.out.println("Si llega a guardar los tipos de publis");
        }

        Mascotas mascota = new Mascotas();
        mascota.setNombre(request.getParameter("mascota_nombre"));
        mascota.setEdadAproximada(Integer.parseInt(request.getParameter("mascota_edad")));
        mascota.setTamanio(request.getParameter("mascota_tamanio"));
        mascota.setDistintivo(request.getParameter("mascota_distintivo"));

        Razas razas = new Razas();
        razas.setRazaId(Integer.parseInt(request.getParameter("mascota_raza_id")));
        mascota.setRaza(razas);

        PublicacionesMascotaPerdida mascotaPerdida = new PublicacionesMascotaPerdida();
        mascotaPerdida.setMascota(mascota);

        if(request.getParameter("descripcion_adicional") != null) {
            mascotaPerdida.setDescripcionAdicional(request.getParameter("descripcion_adicional"));
        }
        mascotaPerdida.setNombreContacto(request.getParameter("contacto_nombre"));
        mascotaPerdida.setTelefonoContacto(Integer.parseInt(request.getParameter("contacto_numero")));
        mascotaPerdida.setLugarPerdida(request.getParameter("lugar_perdida"));

        String fecha_perdida = request.getParameter("fecha_perdida");
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date fecha_perdida_date = null;
        try{
            fecha_perdida_date = formato.parse(fecha_perdida);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        mascotaPerdida.setFechaPerdida(fecha_perdida_date);
        if(request.getParameter("recompensa")!= null) {
            mascotaPerdida.setRecompensa(request.getParameter("recompensa"));
        }

        Part fotoPart = request.getPart("foto");
        if (fotoPart != null && fotoPart.getSize() > 0) {
            // Ruta de almacenamiento
            String nombreArchivo = Paths.get(fotoPart.getSubmittedFileName()).getFileName().toString();
            String rutaSubida = getServletContext().getRealPath("") + File.separator + "assets" + File.separator + "img" + File.separator + "Publis" + File.separator + nombreArchivo;

            // Guardar la imagen en el servidor
            File uploadsDir = new File(getServletContext().getRealPath("") + File.separator + "assets" + File.separator + "img" + File.separator + "Publis");
            if (!uploadsDir.exists()) {
                uploadsDir.mkdirs();
            }
            fotoPart.write(rutaSubida);
            // Actualizar en el objeto HogaresTemporales
            publicacion.setFoto(new Fotos("assets/img/Publis/" + nombreArchivo));
            System.out.println("URL de la foto almacenada: " + publicacion.getFoto().getUrlFoto());
        }else{
            System.err.println("No se recibió ninguna imagen o el archivo está vacío.");
            publicacion.setFoto(new Fotos(""));
        }

        publicacionesDAO.agregarPublicacion(publicacion);
        mascotaPerdida.setPublicacion_id(publicacionesDAO.obtenerIdUltimaPublicacion());
        mascotaPerdida.getMascota().setFoto(fotosDAO.obtenerIdPorUrl(publicacion.getFoto().getUrlFoto()));
        mascotaPerdidaDAO.agregarMascotaPerdida(mascotaPerdida);

    }

    private void guardarDonacion (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Publicaciones publicacion = new Publicaciones();
        Usuarios usuario = new Usuarios();
        usuario.setUserId(Integer.parseInt(request.getParameter("user_id")));

        publicacion.setUsuario(usuario);
        publicacion.setTitulo(request.getParameter("titulo"));
        publicacion.setDescripcion(request.getParameter("descripcion"));

        TiposPublicaciones tiposPublicacion = new TiposPublicaciones();

        if(request.getParameter("tipo_publicacion") != null) {
            tiposPublicacion.setTipoPublicacionId(Integer.parseInt(request.getParameter("tipo_publicacion")));
            publicacion.setTipoPublicacion(tiposPublicacion);
            System.out.println("Si llega a guardar los tipos de publis");
        }

        PublicacionesDonaciones donacion = new PublicacionesDonaciones();
        donacion.setPuntoAcopio(request.getParameter("punto_de_acopio"));

        TiposDonaciones tiposDonacion = new TiposDonaciones();
        tiposDonacion.setTipoDonacionId(Integer.parseInt(request.getParameter("tipo_donacion")));
        donacion.setTipoDonacion(tiposDonacion);

        if(request.getParameter("cantidad")!= null) {
            donacion.setCantidad(Integer.parseInt(request.getParameter("cantidad")));
        }

        if(request.getParameter("marca")!= null) {
            donacion.setMarca(request.getParameter("marca"));
        }

        //Convertir String a Date
        String fecha_recepcion_inicio = request.getParameter("fecha_recepcion_inicio");
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date fecha_recepcion_inicio_date = null;

        try{
            fecha_recepcion_inicio_date = formato.parse(fecha_recepcion_inicio);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        donacion.setFechaRecepcionInicio(fecha_recepcion_inicio_date);

        //Convertir String a Date
        String fecha_recepcion_fin = request.getParameter("fecha_recepcion_final");
        java.util.Date fecha_recepcion_fin_date = null;
        try{
            fecha_recepcion_fin_date = formato.parse(fecha_recepcion_fin);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        donacion.setFechaRecepcionFin(fecha_recepcion_fin_date);

        //Convertir String a Time
        String hora_recepcion = request.getParameter("hora_recepcion");
        LocalTime localTime = LocalTime.parse(hora_recepcion, DateTimeFormatter.ofPattern("HH:mm"));
        Time hora_recepcion_time = Time.valueOf(localTime);
        donacion.setHoraRecepcion(hora_recepcion_time);
        donacion.setTelefonoContacto(Integer.parseInt(request.getParameter("contacto_numero")));

        donacion.setNombreContacto(request.getParameter("contacto_nombre"));
        if(request.getParameter("motivo_donacion")!= null) {
            donacion.setMotivoDonacion(request.getParameter("motivo_donacion"));
        }

        Part fotoPart = request.getPart("foto");
        if (fotoPart != null && fotoPart.getSize() > 0) {
            // Ruta de almacenamiento
            String nombreArchivo = Paths.get(fotoPart.getSubmittedFileName()).getFileName().toString();
            String rutaSubida = getServletContext().getRealPath("") + File.separator + "assets" + File.separator + "img" + File.separator + "Publis" + File.separator + nombreArchivo;

            // Guardar la imagen en el servidor
            File uploadsDir = new File(getServletContext().getRealPath("") + File.separator + "assets" + File.separator + "img" + File.separator + "Publis");
            if (!uploadsDir.exists()) {
                uploadsDir.mkdirs();
            }
            fotoPart.write(rutaSubida);
            // Actualizar en el objeto HogaresTemporales
            publicacion.setFoto(new Fotos("assets/img/Publis/" + nombreArchivo));
            System.out.println("URL de la foto almacenada: " + publicacion.getFoto().getUrlFoto());
        }else{
            System.err.println("No se recibió ninguna imagen o el archivo está vacío.");
            publicacion.setFoto(new Fotos(""));
        }

        publicacionesDAO.agregarPublicacion(publicacion);
        donacion.setPublicacion_id(publicacionesDAO.obtenerIdUltimaPublicacion());
        donacionesDAO.agregarPublicacion(donacion);

    }

    private void guardarAdopcion (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Publicaciones publicacion = new Publicaciones();
        Usuarios usuario = new Usuarios();
        usuario.setUserId(Integer.parseInt(request.getParameter("user_id")));

        publicacion.setUsuario(usuario);
        publicacion.setTitulo(request.getParameter("titulo"));
        publicacion.setDescripcion(request.getParameter("descripcion"));

        TiposPublicaciones tiposPublicacion = new TiposPublicaciones();

        if(request.getParameter("tipo_publicacion") != null) {
            tiposPublicacion.setTipoPublicacionId(Integer.parseInt(request.getParameter("tipo_publicacion")));
            publicacion.setTipoPublicacion(tiposPublicacion);
            System.out.println("Si llega a guardar los tipos de publis");
        }
        PublicacionesAdopcion adopcion = new PublicacionesAdopcion();

        Mascotas mascota = new Mascotas();
        mascota.setNombre(request.getParameter("mascota_nombre"));
        mascota.setEdadAproximada(Integer.parseInt(request.getParameter("mascota_edad")));
        mascota.setGenero(request.getParameter("mascota_genero"));

        Razas raza = new Razas();
        raza.setRazaId(Integer.parseInt(request.getParameter("mascota_raza_id")));
        mascota.setRaza(raza);

        adopcion.setMascota(mascota);

        adopcion.setCondicionesAdopcion(request.getParameter("condiciones_adopcion"));
        adopcion.setLugarEncontrado(request.getParameter("lugar_encontrado"));

        Part fotoPart = request.getPart("foto");
        if (fotoPart != null && fotoPart.getSize() > 0) {
            // Ruta de almacenamiento
            String nombreArchivo = Paths.get(fotoPart.getSubmittedFileName()).getFileName().toString();
            String rutaSubida = getServletContext().getRealPath("") + File.separator + "assets" + File.separator + "img" + File.separator + "Publis" + File.separator + nombreArchivo;

            // Guardar la imagen en el servidor
            File uploadsDir = new File(getServletContext().getRealPath("") + File.separator + "assets" + File.separator + "img" + File.separator + "Publis");
            if (!uploadsDir.exists()) {
                uploadsDir.mkdirs();
            }
            fotoPart.write(rutaSubida);
            // Actualizar en el objeto HogaresTemporales
            publicacion.setFoto(new Fotos("assets/img/Publis/" + nombreArchivo));
            System.out.println("URL de la foto almacenada: " + publicacion.getFoto().getUrlFoto());
        }else{
            System.err.println("No se recibió ninguna imagen o el archivo está vacío.");
            publicacion.setFoto(new Fotos(""));
        }

        publicacionesDAO.agregarPublicacion(publicacion);
        adopcion.setPublicacion_id(publicacionesDAO.obtenerIdUltimaPublicacion());
        adopcion.getMascota().setFoto(fotosDAO.obtenerIdPorUrl(publicacion.getFoto().getUrlFoto()));
        publicacionAdopcionDAO.agregarAdopcion(adopcion);
    }
}


