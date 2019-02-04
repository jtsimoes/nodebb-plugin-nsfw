<form role="form" class="nsfw-settings">

	<div class="row">
		<div class="col-sm-2 col-xs-12 settings-header">
			NSFW Categories Plugin Settings
		</div>

		<div class="col-sm-10 col-xs-12">
			<div class="form-group">
				<label for="categories">NSFW categories selection:</label>
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
				<label for="title">Confirm title:</label>
				<input type="text" id="title" name="title" data-key="title" title="Title" class="form-control" placeholder="Default: Are you sure you want to continue?">
			</div>

			<div class="form-group">
				<label for="message">Confirm message:</label>
				<textarea rows="3" id="message" name="message" data-key="message" title="Message" class="form-control" placeholder="Default: This section contains <b>material that may be offensive to most sensitive people</b> and is not suitable to be seen in public places."></textarea>
			</div>

			<div class="form-group">
				<label for="cancel">Confirm 'Cancel' button text:</label>
				<input type="text" id="cancel" name="cancel" data-key="cancel" title="Cancel button text" class="form-control" placeholder="Default: <i class="fa fa-times-circle"></i> Cancel">
			</div>

			<div class="form-group">
				<label for="confirm">Confirm 'Confirm' button text:</label>
				<input type="text" id="confirm" name="confirm" data-key="confirm" title="Confirm button text" class="form-control" placeholder="Default: <i class="fa fa-arrow-circle-right"></i> Enter">
			</div>

			<div class="form-group">
				<label for="redirect">Link to redirect when clicking 'Cancel':</label>
				<input type="text" id="redirect" name="redirect" data-key="redirect" title="Redirect" class="form-control" placeholder="Default: /">
				<small class="form-text text-muted">Use '/' if you want to redirect the user to your forum home page</small>
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