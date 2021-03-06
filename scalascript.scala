package jdbc

import java.sql.DriverManager
import java.sql.Connection

/**
 * A Scala JDBC connection example by Alvin Alexander,
 * https://alvinalexander.com
 */
object ScalaJdbcConnectSelect {

  def main(args: Array[String]) {
    // connect to the database named "mysql" on the localhost
    val driver = "com.mysql.jdbc.Driver"
    val url = "jdbc:mysql://<database-instance>:3306/<database-name>?zeroDateTimeBehavior=convertToNull&useSSL=false&characterEncoding=utf8"
    val username = "<username>"
    val password = "<password>"

    // there's probably a better way to do this
    var connection:Connection = null

    try {
      // make the connection
      Class.forName(driver)
      connection = DriverManager.getConnection(url, username, password)

      // create the statement, and run the select query
      val statement = connection.createStatement()
      val resultSet = statement.executeQuery("SELECT * FROM mwp_orders WHERE store_id= "1071945"")
      while ( resultSet.next() ) {
        val host = resultSet.getString("host")
        val user = resultSet.getString("user")
        println("host, user = " + host + ", " + user)
      }
    } catch {
      case e => e.printStackTrace
    }
    connection.close()
  }

}
