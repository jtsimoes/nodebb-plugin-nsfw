<form role="form" class="nsfw-settings">

	<div class="row">
		<div class="col-lg-9">
			<div class="panel panel-default">
				<div class="panel-heading">NSFW (Not Safe For Work) Categories</div>
				<div class="panel-body">
					<form role="form" id="nsfw">

						<div class="form-group">
							<label for="categories">NSFW categories selection</label>

							<!-- <input type="text" id="categories" data-key="categories" title="Categories IDs" class="form-control" placeholder="Default: 28">
							<small class="form-text text-muted">Use comma to separate multiple IDs if you want more than one NSFW category (e.g.: 1,2,3)</small> -->
						
							<!-- BEGIN categories -->
							<div class="checkbox">
								<label>
									<input type="checkbox" name="defaultCid_{../cid}">
									{../name}
								</label>
							</div>
							<!-- END categories -->

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
	</div>

</form>

<button id="save" class="floating-button mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
	<i class="material-icons">save</i>
</button>


<script>
	require(['settings'], function(Settings) {
		Settings.load('nsfw', $('.nsfw-settings'));
		$('#save').on('click', function() {
			Settings.save('nsfw', $('.nsfw-settings'), function() {
				app.alert({
					type: 'success',
					alert_id: 'nsfw-saved',
					title: 'Settings saved!',
					message: 'Please reload your NodeBB to fully apply these settings.',
					clickfn: function() {
						socket.emit('admin.reload');
					}
				})
			});
		});
	});
</script>