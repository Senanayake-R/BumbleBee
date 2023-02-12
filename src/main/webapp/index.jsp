<%
	if(session.getAttribute("name")==null){
		response.sendRedirect("login.jsp");
	}
%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>BumbleBee - Loan Service</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index-styles.css" rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet">
</head>
<body id="page-top">

<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top">BumbleBee</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#about">About</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#contact">Loans</a></li>
					<li class="nav-item mx-0 mx-lg-1 bg-danger"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout">Logout</a></li>	
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#about"><%= session.getAttribute("name") %></a></li>
					
				</ul>
			</div>
		</div>
	</nav>
	<!-- Masthead-->
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">

			<!-- Masthead Heading-->
			<h1 class="masthead-heading text-uppercase mb-0">Welcome To BumbleBee Loan Service</h1>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Masthead Subheading-->
			<p class="masthead-subheading font-weight-light mb-0">cis6003 advanced-programming</p>
		</div>
	</header>

	<!-- About Section-->
	<section class="page-section bg-primary text-white mb-0" id="about">
		<div class="container">
			<!-- About Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-white">About</h2>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- About Section Content-->
			<div class="row">
				<div class="col-lg-15">
					<p>"Bumble bee: Buy first and pay later" is a well reputed online loan providing application. This application lets any person above age 18 to make purchases online within the maximum entry budget up to 15,000LKR.The loan can be paid basically in 3 interest free installments. </p>
				</div>
			</div>
		
		</div>
	</section>
	<!-- Contact Section-->
	<section class="page-section" id="contact">
		<div class="container">
			<!-- Loan application Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">Apply for a Loan</h2>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Contact Section Form-->
			<div class="row justify-content-center">
				<div class="col-lg-8 col-xl-7">
					<form id="loanForm" method="post" action="loanForm" >
						<!-- Name input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="name" type="text" name="fname"
								placeholder="Enter your name..." data-sb-validations="required" />
							<label for="name">Full name</label>
							<div class="invalid-feedback" data-sb-feedback="name:required">A
								name is required.</div>
						</div>
						<!-- Email address input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="id" type="text" name="nid"
								placeholder="199823978V"
							/> <label for="email">ID Number</label>
							<div class="invalid-feedback" data-sb-feedback="id:required">An
								ID is required.</div>
							<div class="invalid-feedback" data-sb-feedback="id:id">ID
								is not valid.</div>
						</div>
						<!-- Phone number input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="sdate" type="text" name="sdate"
								placeholder="2023/01/25" data-sb-validations="required" />
							<label for="sdate">Start date</label>
							<div class="invalid-feedback" data-sb-feedback="sdate:required">A
								Start date is required.</div>
						</div>
						<!-- DOB input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="dob" type="text" name="dob"
								placeholder="1997/12/12" data-sb-validations="required" />
							<label for="phone">Date of Birth</label>
							<div class="invalid-feedback" data-sb-feedback="dob:required">Date of Birth is required.</div>
						</div>
						<!-- Loan Balance: input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="bal" type="number" name="bal"
								placeholder="1997/12/12" data-sb-validations="required" step=".01"/>
							<label for="phone">Loan Balance</label>
							<div class="invalid-feedback" data-sb-feedback="phone:required">Loan Balance is required.</div>
						</div>
						<!-- Message input-->
						<div class="form-floating mb-3">
							<textarea class="form-control" id="message" name="msg"
								placeholder="Enter your message here..." style="height: 10rem"
								data-sb-validations="required"></textarea>
							<label for="message">Message</label>
							<div class="invalid-feedback" data-sb-feedback="message:required">A
								message is required.</div>
						</div>
						<!-- Submit Button-->
						<div class="form-group form-button">
							<input type="submit" name="loan" id="loan"
									class="form-submit lbtn" value="Submit" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>cis6003 advanced-programming</small>
		</div>
	</div>
	

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if(status == "balErr"){
			swal("Sorry", "Loan balance should be less than 15000", "error");
		}
		else if(status == "success"){
			swal("Done", "Loan requested successfully submitted", "success");
		}
		else if(status == "failsave"){
			swal("Sorry", "Loan request not submitted", "error");
		}
		
	</script>
	
</body>
</html>
