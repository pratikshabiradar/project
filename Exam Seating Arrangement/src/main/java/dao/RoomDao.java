package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.Room;
import model.Student;

public class RoomDao {
	
	public static String addNewRoom(Room room) {
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement ps = con.prepareStatement("insert into room (roomno) values(?)");
			ps.setString(1, room.getRoomno());
			ps.executeUpdate();
			ps.close();
			con.close();
			return "success";
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	public static ArrayList<Room> getAllRooms() {
		ArrayList<Room> arrayList = new ArrayList<Room>();
		try {
	    	   Connection con=ConnectionProvider.getCon();
	    	   Statement st=con.createStatement();
	    	   ResultSet rs=st.executeQuery("select *from room");
	            while (rs.next()) {
	            	Room room = new Room();
	            	room.setRoom_pk((rs.getInt("room_pk")));;
	            	room.setRoomno(rs.getString("roomno"));;
	                arrayList.add(room);
	            }
				rs.close();
				st.close();
				con.close();
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		return arrayList;
	}

}
