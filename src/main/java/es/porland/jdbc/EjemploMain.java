package es.porland.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.logging.log4j.*;

public class EjemploMain {

	private static final Logger logger = LogManager.getLogger(EjemploMain.class);
	private Connection conexion = null;

	public EjemploMain() throws SQLException {
		try {
			conectar();
			logger.trace("Conexión con el servidor de BBDD establecida");
			consulta("Torre");
		} finally {
			cerrar();
			logger.trace("Conexión con el servidor de BBDD cerrada.");
		}
	}

	private void consulta(String apellido) throws SQLException {
		String query = "SELECT * FROM alumnos WHERE apellidos = ?";
		PreparedStatement stmt = conexion.prepareStatement(query);
		stmt.setString(1, apellido);
		ResultSet set = stmt.executeQuery();
		while(set.next()) {
			int idAlumno = set.getInt("id_alumno");
			String nombre = set.getString("nombre");
			String apellidos = set.getString("apellidos");
			System.out.println("Alumno: " + idAlumno + " - " + nombre + " " + apellidos);
		}
		set.close();
	}
	
	public void conectar() throws SQLException {
		String jdbc = "jdbc:mysql://localhost:3306/ejemplo?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		conexion = DriverManager.getConnection(jdbc, "ejemplo", "ejemplo");
	}

	public void cerrar() throws SQLException {
		if (conexion != null)
			conexion.close();
	}

	public static void main(String[] args) {
		try {
			new EjemploMain();
		} catch (SQLException e) {
			logger.error("Error al establecer la conexion");
		}
	}

}
