<!DOCTYPE html>
<html lang="en-US">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<title>Person CRUD</title>
</head>
<body ng-app="myApp">
	<div class="container-fluid">
		<div class="jumbotron">
			<h3>Person CRUD</h3>
			<h4>This application is built using Spring MVC4 (Rest), Spring Boot, Hibernate 4 and AngularJS 1.4</h3>
		</div>
		<div ng-controller="PersonController as personCtrl">
			<form name="personForm" method="POST">
			<div class="table-responsive">
				<table class="table">
					<tr>
						<td colspan="2">
							<div ng-if="personCtrl.flag != 'edit'">
								<h3>Add New Person</h3>
							</div>
							<div ng-if="personCtrl.flag == 'edit'">
								<h3>Update Person for ID: {{ personCtrl.person.pid }}</h3>
							</div>
						</td>
					</tr>
					<tr>
						<td><label class="control-label">Name: </label></td>
						<td><input type="text" class="form-control" name="name"
							ng-model="personCtrl.person.name" required /> <span 
							ng-show="personForm.name.$error.required" class="msg-val control-label">Name
								is required.</span></td>
					</tr>
					<tr>
						<td><label class="control-label">Location: </label></td>
						<td><input type="text" class="form-control" name="location"
							ng-model="personCtrl.person.location" required /> <span 
							ng-show="personForm.location.$error.required" class="msg-val control-label">Location
								is required.</span></td>
					</tr>
					<tr>
						<td colspan="2"><span ng-if="personCtrl.flag=='created'"
							class="msg-success">Person successfully added.</span> <span 
							ng-if="personCtrl.flag=='failed'" class="msg-val control-label">Person
								already exists.</span></td>
					</tr>
					<tr>
						<td colspan="2">
							<div ng-if="personCtrl.flag != 'edit'">
								<input type="submit" class="btn btn-primary sharp"
									ng-click="personCtrl.addPerson()" value="Add Person" /> <input
									type="button" class="btn btn-primary sharp"
									ng-click="personCtrl.reset()" value="Reset" />
							</div>
							<div ng-if="personCtrl.flag == 'edit'">
								<input type="submit" class="btn btn-primary sharp"
									ng-click="personCtrl.updatePersonDetail()"
									value="Update Person" /> <input type="button"
									class="btn btn-primary sharp"
									ng-click="personCtrl.cancelUpdate()" value="Cancel" />
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2"><span ng-if="personCtrl.flag=='deleted'" 
							class="msg-success control-label">Person successfully deleted.</span>
					</tr>
				</table>
				</div>
			</form>
			<div class="table-responsive">
				<table class="table table-hover">
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Location</th>
						<th>Actions</th>
					</tr>
					<tr ng-repeat="row in personCtrl.persons">
						<td><span ng-bind="row.pid"></span></td>
						<td><span ng-bind="row.name"></span></td>
						<td><span ng-bind="row.location"></span></td>
						<td><input type="button" class="btn btn-link"
							ng-click="personCtrl.deletePerson(row.pid)" value="Delete" /> <input
							type="button" class="btn btn-link"
							ng-click="personCtrl.editPerson(row.pid)" value="Edit" /> <span
							ng-if="personCtrl.flag=='updated' && row.pid==personCtrl.updatedId"
							class="msg-success">Person successfully updated.</span></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/app-resources/js/lib/angular.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/app-resources/js/lib/angular-resource.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/app-resources/js/app.js"></script>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/app-resources/css/style.css" />
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/app-resources/css/bootstrap.min.css">
</body>
</html>
