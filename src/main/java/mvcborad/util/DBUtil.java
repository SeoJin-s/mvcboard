package mvcborad.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
    // 메서드마다 중복된 DB 연결 코드를 하나로 추출
    public static Connection getConnection() throws Exception {
        // 1. JDBC 드라이버 로딩
        Class.forName("com.mysql.cj.jdbc.Driver");

        // 2. 연결 객체 생성
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/mvcboard",
            "root",
            "java1234"
        );

        return conn; // ✅ 올바르게 리턴
    }
}