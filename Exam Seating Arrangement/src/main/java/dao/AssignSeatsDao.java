package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import model.Room;

public class AssignSeatsDao {

	public static String addNewRoom(String scheduleDate) {
		String returnResult = null;
		try {
			Connection con = ConnectionProvider.getCon();
//			if (scheduleDate != null)
//				throw new IllegalArgumentException("imessage");
			Statement st = con.createStatement();
			ResultSet rs100 = st.executeQuery("select * from roomstudentmapping where date= '"+scheduleDate+"'");
			if (rs100.next())
				throw new IllegalArgumentException("already");

			List<Integer> studentIdList = new ArrayList<>();
			ResultSet rs = st.executeQuery("select student_pk from student");
			while (rs.next()) {
				studentIdList.add(rs.getInt("student_pk"));
			}

			System.out.println(studentIdList);

			Collections.shuffle(studentIdList);
			System.out.println(studentIdList);

			List<List<Integer>> studentSubList = new ArrayList<>();
			int size = studentIdList.size() / 10 + 1; // Per room 10 students
			for (int i = 0; i < size; i++) {
				List<Integer> temp = new ArrayList<>();
				for (int j = 0; studentIdList.size() > j && j < 10; j++) {
					temp.add(studentIdList.get(j));
				}
				if (!temp.isEmpty())
					studentSubList.add(temp);
				studentIdList.removeAll(temp);
			}

			System.out.println(studentSubList);

			List<Integer> roomList = new ArrayList<>();
			ResultSet rs1 = st.executeQuery("select room_pk from room");
			while (rs1.next()) {
				roomList.add(rs1.getInt("room_pk"));
			}

			System.out.println("Room List: " + roomList);

			Map<Integer, Object> roomMapping = new HashMap<>();
			if (roomList.size() >= studentSubList.size()) {
				System.out.println("===== INSIDE FOR======");
				for (int i = 0; i < studentSubList.size(); i++) {
					roomMapping.put(roomList.get(i), studentSubList.get(i));
				}
			} else {
				throw new IllegalArgumentException("insufficientRoom");
//				return "Insufficient Space for students. Please add rooms.";
			}

			List<Integer> teacherIdList = new ArrayList<>();
			ResultSet teacherRs = st.executeQuery("select teacher_pk from teacher");
			while (teacherRs.next()) {
				teacherIdList.add(teacherRs.getInt("teacher_pk"));
			}
			if (roomList.size() < teacherIdList.size()) {
				throw new IllegalArgumentException("insufficientTeacher");
//				return "Add More Teacher. To Schedule exam.";
			}

			for (Entry<Integer, Object> s : roomMapping.entrySet()) {
				Integer roomId = s.getKey();
				List<Integer> studentIds = (List<Integer>) s.getValue();
				for (int i = 0; i < studentIds.size(); i++) {
					PreparedStatement ps = con
							.prepareStatement("insert into roomstudentmapping (room_fk,student_fk,date) values(?,?,?)");
					ps.setInt(1, roomId);
					ps.setInt(2, studentIds.get(i));
					ps.setString(3, scheduleDate);
					ps.executeUpdate();
				}
			}

//			List<Integer> newRoomList = new ArrayList<>();
//			ResultSet rs2 = st.executeQuery("select distinct room_fk from roomstudentmapping");
//			while (rs2.next()) {
//				newRoomList.add(rs2.getInt("room_fk"));
//			}
			Collections.shuffle(teacherIdList);
			System.out.println("New Room size=" + roomList.size() + " " + teacherIdList.size());
			for (int i = 0; i < roomList.size() && i<teacherIdList.size(); i++) {
				System.out.println("New Room " + roomList.get(i));
				PreparedStatement ps = con
						.prepareStatement("insert into roomteachermapping (troom_fk,teacher_fk,date) values(?,?,?)");
				ps.setInt(1, roomList.get(i));
				ps.setInt(2, teacherIdList.get(i));
				ps.setString(3, scheduleDate);
				ps.executeUpdate();
			}
			returnResult = "success";


		} catch (

		Exception e) {
			System.out.println(e);
			returnResult = e.getMessage();
		}
		return returnResult;
	}

	public static String getAllStudentForViewAdmin(String tid, String scheduleDate) {
		try {
			System.out.println(tid + " " + scheduleDate);
			return "";
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}