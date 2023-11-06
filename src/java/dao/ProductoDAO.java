
package dao;

import conexion.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import modelo.Producto;

public class ProductoDAO {
    
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;
    
    public Producto listarId(int id){
        String sql = "SELECT * FROM productos WHERE idProducto=" + id;
        Producto p = new Producto();
        try {
            con=cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setDescripcion(rs.getString(3));
                p.setPrecio(rs.getDouble(4));
                p.setStock(rs.getInt(5));
                p.setImagen(rs.getString(6));
            }
        } catch (Exception e) {
        
        }
        return p;
    }
    
    public int agregar(Producto p){
        String sql = "INSERT INTO productos (Nombre, Descripcion, Precio, Stock, Imagen) values (?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getNombre());
            ps.setString(2, p.getDescripcion());
            ps.setDouble(3, p.getPrecio());
            ps.setInt(4, p.getStock());
            ps.setString(5, p.getImagen());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error agregar dao: " + e.getMessage());
        }
        return r;
    }
    
    public List<Producto> listar(){
        String sql = "SELECT * FROM productos";
        List<Producto> lista = new ArrayList<>();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {                
                Producto p = new Producto();
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setDescripcion(rs.getString(3));
                p.setPrecio(rs.getDouble(4));
                p.setStock(rs.getInt(5));
                p.setImagen(rs.getString(6));
                lista.add(p);
            }
        } catch (Exception e) {
            System.out.println("Error listar dao: " + e.getMessage());
        }
        return lista;
    }
    
    public boolean actualizar(Producto p){
        String sql = "UPDATE productos set Nombre=?, Descripcion=?, Precio=?, Stock=? WHERE idProducto=?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getNombre());
            ps.setString(2, p.getDescripcion());
            ps.setDouble(3, p.getPrecio());
            ps.setInt(4, p.getStock());
            ps.setInt(5, p.getId());    
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error actualizar dao: " + e.getMessage());
            return false;
        }
    }
    
    public boolean eliminar(int id){
        String sql = "DELETE FROM productos WHERE idProducto=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error elimnar dao: " + e.getMessage());
            return false;
        }
    }

    public Producto mostrarProducto(int id) {
        String sql = "SELECT idProducto, Nombre, Descripcion, Precio, Stock, Imagen FROM productos WHERE idProducto = ?";
        Producto producto = null;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {                
                Producto p = new Producto();
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setDescripcion(rs.getString(3));
                p.setPrecio(rs.getDouble(4));
                p.setStock(rs.getInt(5));
                p.setImagen(rs.getString(6));
            }
        } catch (Exception e) {
            System.out.println("Error mostrarProducto dao: " + e.getMessage());
        }
        return producto;
    }
    
}
