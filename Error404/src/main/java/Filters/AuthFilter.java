package Filters;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter({"/Dashboard", "/crearLugares", "/lugares-eventos", "/gestionUsuarios", "/gestionDonaciones", "/crearCoordinador", "/crearUsuarios", "/crearAlbergues", "/Dashboard"})
public class AuthFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Verificar si hay sesión activa
        if (httpRequest.getSession(false) == null || httpRequest.getSession(false).getAttribute("usuariosession") == null) {
            // Guardar la URL original en la sesión
            String originalURL = httpRequest.getRequestURI();
            if (httpRequest.getQueryString() != null) {
                originalURL += "?" + httpRequest.getQueryString();
            }
            httpRequest.getSession(true).setAttribute("redirect", originalURL);

            // Redirigir al login
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
            return;
        }

        // Continuar con la solicitud
        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void destroy() {
    }
}
