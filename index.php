<?php
require_once  'navbar.php';
?>

<!doctype html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
  <link rel="stylesheet" href="bootstrap.css">
  <link rel="stylesheet" href="style.css">

  <title>File management</title>
</head>

<body>
  <div class="form-group">
  </div>
  <div class="container py-5 mt-5" style="width: 1000px;">


    <table class="table">
      <thead class="thead">
        <tr>
          <th scope="col">File</th>
          <th scope="col">File Name</th>
          <th scope="col">File Type</th>
          <th scope="col">Category</th>
          <th scope="col">File Date Added</th>
          <th scope="col">File Last Update</th>
          <th scope="col">Downloads</th>
          <th scope="col">Actions</th>



        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">1</th>
          <td>Mark</td>
          <td>Otto</td>
          <td>@mdo</td>
          <td>Mark</td>
          <td>Otto</td>
          <td>@mdo</td>
          <td>@mdo</td>
        </tr>

      </tbody>
    </table>
  </div>


  <center>
    <div class="form-group" style="width: 300px;">
      <form action="" method="POST">
        <input type="text" name="fileName" id="fileName" placeholder="Enter file name" class="form-control m-3 py-3">
        <select name="category" id="category" class="form-control m-3 ">
          <option value="0">Select file category </option>

        </select>
        <div class="file-select" id="src-file1">
          <input type="file" name="src-file1" aria-label="Select..." class="form-control m-0">
        </div>
        <br><br>
        <button type="submit" class="btn btn-primary">File save</button>
      </form>
    </div>
  </center>



  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

</body>

</html>