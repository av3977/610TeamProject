<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Student Home</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="http://localhost:4567/professorDashboard">MyPLS</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav mr-auto"></div>
			<div class="navbar-nav ml-auto">
				
				<form class="form-inline" method="get" action="/createGroup">
					<button type="submit" class="btn btn-info" style="margin:5px;">Create Group</button>
				</form>
				<form class="form-inline" method="get" action="/viewGroups">
					<button type="submit" class="btn btn-info" style="margin:5px;">View Group</button>
				</form>
				<a class="navbar-brand" href="http://localhost:4567/">
					<button type="submit" class="btn btn-info" style="margin:5px;">Logout</button>
				</a>
			</div>
		</div>
	</nav>
	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<h1 class="display-4">
				Welcome Student!
			</h1>
			<p class="lead">Quiz List</p>
		</div>
	</div>

	<div class="container">
		<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<th scope="col">Quiz</th>
					<th scope="col">Description</th>
					<th scope="col">Take Quiz</th>
					<th scope="col">Score</th>
					<th scope="col">Answer Key</th>
				</tr>
			</thead>
			<tbody>
				<#list quizzes as quiz>
				<tr>
                <td>${quiz.quizID}</td>
                <td>${quiz.getQuizTopic()}</td>
				<#--  <td>
				<a class="navbar-brand" href="http://localhost:4567/quizAnswerKey/${quiz.quizID}">
					<button type="submit" class="btn btn-info">View Quiz</button>
				</a>
				</td>  -->
				<td>
					<form class="form-inline" method="POST" action="/takeQuiz">
					<button type="submit" class="btn btn-info">take quiz</button>
					<input id="courseID" name="courseID" type="hidden" value="${quiz.courseID}"/>
                    <input id="quizID" name="quizID" type="hidden" value="${quiz.quizID}"/>
					<input id="lectureId" name="lectureId" type="hidden" value="${quiz.lectureId}"/>
					</form>
				</td>
				<#if grades??>
					<#list grades as g>
						<#if g.quizID == quiz.quizID>
							<td>${g.pointSecured}/${g.totalPoints}</td>
						</#if>
					</#list>
				<#else>
					<td>-/-</td>
				</#if>
				</tr>
				</#list>
			</tbody>
			
		</table>
	</div>
</body>
</html>