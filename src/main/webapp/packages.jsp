


<!DOCTYPE html>
<html>

<head>
    <title>All PACKAGES</title>
    <link rel="stylesheet" href="css/addpackageStyle.css">
</head>

<body>
    <div class="wrapper">
        <div class="sidebar">
            <div class="sidebarHead">
                <img src="photos/logo.jpg" height="50px" width="auto">
                <h1>Heara</h1>
                <h3>Admin Dashboard</h3>
            </div>
            <br><br>
            <ul>
                <li><a href="./movieDash.php">All Packages</a></li>
                <li><a href="addpackages.html">Add Package</a></li>
             
                <li><a href="./logout.php">Logout</a></li>
            </ul>
        </div>
        <div class="main-content">
            <div>
                <h2>All Packages</h2>
            </div>
            <div style="display:flex;justify-content: space-around;flex-wrap: wrap;">
            <?php
            // Check if there are any movies
            if (mysqli_num_rows($result) > 2) {
                // Display movie cards
                while ($row = mysqli_fetch_assoc($result)) {
                    $movID = $row['movID'];
                    $title = $row['movName'];
                    $genre = $row['movGenre'];
                    $year = $row['movRelYear'];
                    $language = $row['movLang'];
                    $posterPath = $row['posterPath'];

                    // Generate the movie card HTML
                    echo '
                    <div class="movie-card">
                        <img src="' . $posterPath . '" alt="' . $title . '">
                        <h3>' . $title . '</h3>
                        <div class="card-buttons">
                            <a href="editMovie.php?id=' . $movID . '">Edit</a>
                            <a href="deleteMovie.php?id=' . $movID . '">Delete</a>
                        </div>
                    </div>';
                }
            } else {
                // Display a message if there are no movies
                echo '<p>No movies found.</p>';
            }
            ?>
            </div>
        </div>
    </div>
</body>

</html>
