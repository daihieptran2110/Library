package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;
import Model.*;
import java.sql.SQLException;

public class AccountDAO extends DBContext {

    // Method to get all accounts from the database
    public Map<Integer, Account> getAllAccounts() {
        Map<Integer, Account> listAccount = new HashMap<>();
        try {
            String sql = "SELECT * FROM Account";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setAccountId(rs.getInt("account_id"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                a.setRole(rs.getString("role"));
                a.setInformationStatus(rs.getString("information_status"));
                listAccount.put(a.getAccountId(), a);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listAccount;
    }

    // Method to get an account by username and password
    public Account getByUsernamePassword(String username, String password) {
        try {
            String sql = "SELECT * FROM Account WHERE username = ? AND password = ?";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                Account a = new Account();
                a.setAccountId(rs.getInt("account_id"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                a.setRole(rs.getString("role"));
                a.setInformationStatus(rs.getString("information_status"));
                return a;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Method regist account 
public boolean registerAccount(String username, String password, String firstName, String lastName,
         String email, String phone, String address) {
     boolean success = false;
     try {
         // Query để chèn một tài khoản mới vào bảng Account và lấy account_id đã tự động tạo
         String sql = "INSERT INTO Account (username, password, role) VALUES (?, ?, 'Members')";
         PreparedStatement pstmt = connection.prepareStatement(sql);
         pstmt.setString(1, username);
         pstmt.setString(2, password);

         int rowsAffectedAccount = pstmt.executeUpdate(); // Thực thi câu lệnh INSERT vào bảng Account
         System.out.println(rowsAffectedAccount);

         if (rowsAffectedAccount > 0) {
             // Nếu chèn thành công vào bảng Account, tiếp tục chèn vào bảng Members
             String sqlMembers = "INSERT INTO Members (username, password, first_name, last_name, email, phone, address, membership_date) "
                     + "VALUES (?, ?, ?, ?, ?, ?, ?, GETDATE())";
             PreparedStatement pstMember = connection.prepareStatement(sqlMembers);
             pstMember.setString(1, username); // Thêm tham số username vào câu SQL
             pstMember.setString(2, password);
             pstMember.setString(3, firstName);
             pstMember.setString(4, lastName);
             pstMember.setString(5, email);
             pstMember.setString(6, phone);
             pstMember.setString(7, address);

             int rowsAffectedMembers = pstMember.executeUpdate(); // Thực thi câu lệnh INSERT vào bảng Members
             System.out.println(rowsAffectedMembers);

             if (rowsAffectedMembers > 0) {
                 success = true; // Đánh dấu thành công nếu cả hai câu lệnh INSERT đều thành công
             }
         }
     } catch (SQLException e) {
         e.printStackTrace();
     }
     return success;
 }


//Method get Members by username
    public Members getMembersByUsername(String username) {
        Members m = new Members();
        try {

            String sql = "SELECT * FROM Members WHERE TRIM(username)= ?";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                m.setMemberId(rs.getInt("member_id"));
                m.setUsername(rs.getString("username"));
                m.setPassword(rs.getString("password"));
                m.setFirstName(rs.getString("first_name"));
                m.setLastName(rs.getString("last_name"));
                m.setEmail(rs.getString("email"));
                m.setPhone(rs.getString("phone"));
                m.setAddress(rs.getString("address"));
                m.setMembershipDate(rs.getDate("membership_date"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return m;

    }

    //Method createStaffAccount
    public boolean createStaff(Staff staff, String username, String password) {
        boolean success = false;
        try {
            String sql = "INSERT INTO Account (username, password, role) "
                    + "VALUES (?, ?, 'Staff')";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.executeQuery();
            String sqlt = "INSERT INTO Staff (username, password, first_name, last_name, email, phone, position, hire_date) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pt = connection.prepareStatement(sqlt);
            pt.setString(1, staff.getUsername());
            pt.setString(2, staff.getPassword());
            pt.setString(3, staff.getFirstName());
            pt.setString(4, staff.getLastName());
            pt.setString(5, staff.getEmail());
            pt.setString(6, staff.getPhone());
            pt.setString(7, staff.getPosition());
            pt.setDate(8, new java.sql.Date(staff.getHireDate().getTime()));

            int rowsAffected = pt.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }
//Method get Staff by Username

    public Staff getStaffByUsername(String username) {
        Staff staff = null;
        try {
            String sql = "SELECT * FROM Staff WHERE TRIM(username) = ?";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                staff = new Staff();
                staff.setStaffId(rs.getInt("staff_id"));
                staff.setUsername(rs.getString("username"));
                staff.setPassword(rs.getString("password"));
                staff.setFirstName(rs.getString("first_name"));
                staff.setLastName(rs.getString("last_name"));
                staff.setEmail(rs.getString("email"));
                staff.setPhone(rs.getString("phone"));
                staff.setPosition(rs.getString("position"));
                staff.setHireDate(rs.getDate("hire_date"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return staff;
    }

    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();

// Lấy thông tin Staff có username là "DucNH"
        Staff s = dao.getStaffByUsername("DucNH");
        if (s != null) {
            System.out.println("Staff found: " + s);
        } else {
            System.out.println("Staff with username DucNH not found.");
        }

// Lấy thông tin Members có username là "HiepTD"
        // Test data for registering an account
        String username = "testUser";
        String password = "testPassword";
        String firstName = "John";
        String lastName = "Doe";
        String email = "john.doe@example.com";
        String phone = "1234567890";
        String address = "123 Main St, Anytown, USA";

        // Call the registerAccount method with the test data
        boolean isRegistered = dao.registerAccount(username, password, firstName, lastName, email, phone, address);

        // Print the result
        if (isRegistered) {
            System.out.println("Account registered successfully!");
        } else {
            System.out.println("Failed to register account.");
        }
    }
        

    }

