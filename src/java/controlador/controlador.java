
package controlador;

import dao.ProductoDAO;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Producto;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


@WebServlet(name = "controlador", urlPatterns = {"/controlador"})
public class controlador extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion = request.getParameter("accion");
        Producto p = new Producto();
        ProductoDAO pDao = new ProductoDAO();
        
        switch (accion) {
            case "agregar" -> {
                ArrayList<String> lista = new ArrayList<>();
                try {
                    FileItemFactory file = new DiskFileItemFactory();
                    ServletFileUpload fileUpload = new ServletFileUpload(file);
                    List items = fileUpload.parseRequest(request);
                    for (int i = 0; i < items.size(); i++) {
                        FileItem fileItem = (FileItem) items.get(i);
                        if(!fileItem.isFormField()){
                            File f = new File("C:\\xampp\\htdocs\\img\\" + fileItem.getName());
                            fileItem.write(f);
                            p.setImagen("http://localhost/img/" + fileItem.getName());
                        } else {
                            lista.add(fileItem.getString());
                        }
                    }
                    p.setNombre(lista.get(0));
                    p.setDescripcion(lista.get(1));
                    String precioString = lista.get(2);
                    String stockString = lista.get(3);
                    double precio = Double.parseDouble(precioString);
                    int stock = Integer.parseInt(stockString);
                    p.setPrecio(precio);
                    p.setStock(stock);
                    pDao.agregar(p);
                } catch (Exception e) {
                    System.out.println("ERROR controlador " + e.getMessage());
                }
                request.getRequestDispatcher("controlador?accion=listar").forward(request, response);
            }
            case "listar" -> {
                List<Producto> lista = pDao.listar();
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("agregar.jsp").forward(request, response);
            }
            case "inicio" -> {
                List<Producto> lista = pDao.listar();
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            case "eliminar" -> {
                int id = Integer.parseInt(request.getParameter("id"));
                pDao.eliminar(id);
                List<Producto> lista =  pDao.listar();
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("controlador?accion=listar").forward(request, response);
            }
            case "actualizar" -> {
                ArrayList<String> lista = new ArrayList<>();
                try {
                    FileItemFactory file = new DiskFileItemFactory();
                    ServletFileUpload fileUpload = new ServletFileUpload(file);
                    List items = fileUpload.parseRequest(request);
                    for (int i = 0; i < items.size(); i++) {
                        FileItem fileItem = (FileItem) items.get(i);
                        if (!fileItem.isFormField()) {
                            File f = new File("C:\\xampp\\htdocs\\img\\" + fileItem.getName());
                            fileItem.write(f);
                            p.setImagen("http://localhost/img/" + fileItem.getName());
                        } else {
                            lista.add(fileItem.getString());
                        }
                    }
                    // Si el campo de imagen está vacío, no lo actualizamos
                    if (p.getImagen() == null || p.getImagen().isEmpty()) {
                        p.setImagen(null);
                    }
                    p.setNombre(lista.get(0));
                    p.setDescripcion(lista.get(1));
                    String precioString = lista.get(2);
                    String stockString = lista.get(3);
                    double precio = Double.parseDouble(precioString);
                    int stock = Integer.parseInt(stockString);
                    p.setPrecio(precio);
                    p.setStock(stock);
                    pDao.actualizar(p);
                } catch (Exception e) {
                    System.out.println("ERROR controlador " + e.getMessage());
                }
                request.getRequestDispatcher("controlador?accion=listar").forward(request, response);
            }
            default -> {
                System.out.println("Error en el controlador");
                request.getRequestDispatcher("agregar.jsp").forward(request, response);
            }
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
