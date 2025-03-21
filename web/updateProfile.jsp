<%-- 
    Document   : updateProfile
    Created on : 28 Jun 2024, 11:02:06 PM
    Author     : Acer
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <style>
        .avatar {
            width: 150px;
            height: 150px;
            object-fit: cover;
        }
        .personal-info {
            padding-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1 class="mb-4">Edit Profile</h1>
        <hr>
        <div class="row">
            <!-- left column -->
            <div class="col-md-3">
                <div class="text-center">
                    <img src="https://png.pngitem.com/pimgs/s/150-1503945_transparent-user-png-default-user-image-png-png.png" class="avatar img-fluid rounded-circle mb-3" alt="avatar">
                    
                    <c:if test="${not empty sessionScope.user}">
                    <a href="updateProfile.jsp">
                        <h6>Hye ${sessionScope.user.username}!</h6>
                        <span><strong>You can Update Your Profile</strong></span>
                    </a>
                    </c:if>
                </div>
            </div>

            <!-- edit form column -->
            <div class="col-md-9 personal-info">
                <div class="alert alert-info alert-dismissible fade show" role="alert">
                    <i class="fas fa-info-circle"></i>
                    <strong>Alert</strong>. Please fill all boxes to complete the form.
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <h3>Personal info</h3>

                <form action="userServlet?action=updateProfile" method="post" class="mt-4">
                    <input type="hidden" id="id" name="id" value="${user.id}"> <!-- Replace with actual user ID -->
                    <div class="form-group row">
                        <label for="username" class="col-md-3 col-form-label">Username:</label>
                        <div class="col-md-8">
                            <input id="username" name="username" class="form-control" type="text" value="${user.username}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="email" class="col-md-3 col-form-label">Email:</label>
                        <div class="col-md-8">
                            <input id="email" name="email" class="form-control" type="email" value="${user.email}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="phoneNumber" class="col-md-3 col-form-label">Phone Number:</label>
                        <div class="col-md-8">
                            <input id="phoneNumber" name="phoneNumber" class="form-control" type="tel" value="${user.phoneNumber}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="password" class="col-md-3 col-form-label">Password:</label>
                        <div class="col-md-8">
                            <input id="password" name="password" class="form-control" type="password" value="${user.password}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="confirm-password" class="col-md-3 col-form-label">Confirm password:</label>
                        <div class="col-md-8">
                            <input id="confirm-password" class="form-control" type="password" value="${user.password}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-9 offset-md-3">
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                            <button type="reset" class="btn btn-secondary ml-2  onclick="document.location='userhome.jsp'">Reset</button>
                            <button onclick="document.location='userhome.jsp'">Go To Homepage</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>


