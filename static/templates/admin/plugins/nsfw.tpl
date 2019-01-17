<div class="row">

	<div class="col-lg-9">
		<div class="panel panel-default">
			<div class="panel-heading">NSFW (Not Safe For Work) Categories</div>
			<div class="panel-body">
				<form role="form" id="nsfw">

					<div class="form-group">
						<label for="categories">Categories IDs</label>
						<input type="text" id="categories" data-key="categories" title="Categories IDs" class="form-control" placeholder="Default: 28">
						<small class="form-text text-muted">Use comma to separate multiple IDs if you want more than one NSFW category (e.g.: 1,2,3)</small>
					</div>

					<div class="form-group">
						<label for="title">Confirm title</label>
						<input type="text" id="title" data-key="title" title="Title" class="form-control" placeholder="Default: Are you sure you want to continue?">
					</div>

					<div class="form-group">
						<label for="message">Confirm message</label>
						<input type="text" id="message" data-key="message" title="Message" class="form-control" placeholder="Default: This section contains <b>material that may be offensive to most sensitive people</b> and is not suitable to be seen in public places.">
					</div>

					<div class="form-group">
						<label for="redirect">Page to redirect when clicking 'Cancel'</label>
						<input type="text" id="redirect" data-key="redirect" title="Redirect" class="form-control" placeholder="Default: /">
						<small class="form-text text-muted">Use '/' if you want to redirect the user to your forum home page</small>
					</div>

				</form>
			</div>
		</div>
	</div>

	<div class="col-lg-3">
		<div class="panel panel-default">
			<div class="panel-heading">Control Panel</div>
			<div class="panel-body">
				<button class="btn btn-primary" id="save">Save settings</button>
			</div>
		</div>
	</div>

</div>

<script>
	require(['settings'], function(settings) {

		settings.sync('nsfw', $('#nsfw'));

		$('#save').click( function (event) {
			settings.persist('nsfw', $('#nsfw'), function(){
				socket.emit('admin.settings.syncNSFW');
				app.alertSuccess('Please restart your forum for changes to fully take effect.');
			});
		});
	});
</script>