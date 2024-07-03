package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Model.Category;

public class CategoriesDAO extends DBContext {
    public List<Category> getAllCategories() {
        List<Category> categories = new ArrayList<>();

        try {
            String query = "SELECT * FROM Categories";
            try (PreparedStatement statement = getConnection().prepareStatement(query);
                    ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {
                    int categoryId = resultSet.getInt("CategoryId");
                    String categoryName = resultSet.getString("CategoryName");
                    String categoryDescription = resultSet.getString("CategoryDescription");

                    Category category = new Category(categoryId, categoryName, categoryDescription);
                    categories.add(category);
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categories;
    }

    public String getCategoryNameById(int categoryId) {
        try {
            String query = "SELECT CategoryName FROM Categories WHERE CategoryId = ?";
            try (PreparedStatement statement = getConnection().prepareStatement(query)) {
                statement.setInt(1, categoryId);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        return resultSet.getString("CategoryName");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();  
}       return null;
    }
}
