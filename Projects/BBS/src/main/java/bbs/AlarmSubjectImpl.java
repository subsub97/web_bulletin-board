package bbs;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class AlarmSubjectImpl implements AlarmSubject{
	private List<AlarmObserver> observers = new ArrayList<>();

    @Override
    public void registerObserver(AlarmObserver observer) {
        observers.add(observer);
    }

    @Override
    public void removeObserver(AlarmObserver observer) {
        observers.remove(observer);
    }

	private Connection conn;
	private ResultSet rs;
	
    @Override
    public void notifyObservers(String message) {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);

        for (AlarmObserver observer : observers) {
            observer.update(message);
            String userID = observer.getUserID();
			String SQL = "UPDATE user SET alarmPoint = 1 WHERE userID = ?";
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.executeUpdate();
        }
        }
        catch (Exception e) {
			e.printStackTrace();
		}
        
    }

}
