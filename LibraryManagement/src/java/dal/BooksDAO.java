
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Model.Book;

public class BooksDAO extends DBContext {

    public List<Book> getAllBooks() {
        List<Book> books = new ArrayList<>();

        try {
            String query = "SELECT * FROM Books";
            try (PreparedStatement statement = connection.prepareStatement(query);
                    ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String title = resultSet.getString("title");
                    String isbn = resultSet.getString("isbn");
                    int publisherId = resultSet.getInt("publisherId");
                    int publicationYear = resultSet.getInt("publicationYear");
                    int categoryId = resultSet.getInt("categoryId");
                    int totalCopies = resultSet.getInt("totalCopies");
                    int availableCopies = resultSet.getInt("availableCopies");

                    Book book = new Book(id, title, isbn, publisherId, publicationYear, categoryId, totalCopies,
                            availableCopies);
                    books.add(book);
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return books;
    }

    public void addBook(Book book) {
        try {
            String query = "INSERT INTO Books (title, isbn, publisherId, publicationYear, categoryId, totalCopies, availableCopies) VALUES (?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, book.getTitle());
                statement.setString(2, book.getIsbn());
                statement.setInt(3, book.getPublisherId());
                statement.setInt(4, book.getPublicationYear());
                statement.setInt(5, book.getCategoryId());
                statement.setInt(6, book.getTotalCopies());
                statement.setInt(7, book.getAvailableCopies());
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Book getBookById(int id) {
        Book book = null;
        try {
            String query = "SELECT * FROM Books WHERE id = ?";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, id);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        String title = resultSet.getString("title");
                        String isbn = resultSet.getString("isbn");
                        int publisherId = resultSet.getInt("publisherId");
                        int publicationYear = resultSet.getInt("publicationYear");
                        int categoryId = resultSet
                                .getInt("categoryId");
                        int totalCopies = resultSet.getInt("totalCopies");
                        int availableCopies = resultSet.getInt("availableCopies");

                        book = new Book(id, title, isbn, publisherId, publicationYear, categoryId, totalCopies,
                                availableCopies);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book;
    }

    // Add other methods for updating, deleting, etc.

}