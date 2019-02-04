"use strict";

var plugin = {};
var async = require.main.require('async');
var topics = require.main.require('./src/topics');
var posts = require.main.require('./src/posts');
var categories = require.main.require('./src/categories');
var meta = require.main.require('./src/meta');
var privileges = require.main.require('./src/privileges');
var rewards = require.main.require('./src/rewards');
var user = require.main.require('./src/user');
var helpers = require.main.require('./src/controllers/helpers');
var db = require.main.require('./src/database');
var plugins = require.main.require('./src/plugins');
var SocketPlugins = require.main.require('./src/socket.io/plugins');
var pagination = require.main.require('./src/pagination');

plugin.init = function (params, callback) {
	var app = params.router;
	var middleware = params.middleware;

	app.get('/admin/plugins/nsfw', middleware.admin.buildHeader, renderAdmin);
	app.get('/api/admin/plugins/nsfw', renderAdmin);

	handleSocketIO();

	meta.settings.get('nsfw', function (err, settings) {
		if (err) {
			return callback(err);
		}

		plugin._settings = settings;
		callback();
	});
};

plugin.appendConfig = function (config, callback) {
	config['nsfw'] = plugin._settings;
	setImmediate(callback, null, config);
};

plugin.addAdminNavigation = function (header, callback) {
	header.plugins.push({
		route: '/plugins/nsfw',
		icon: 'fa-minus-circle',
		name: 'NSFW Categories',
	});

	callback(null, header);
};

function renderAdmin(req, res, next) {
	async.waterfall([
		async.apply(db.getSortedSetRange, 'categories:cid', 0, -1),
		function (cids, next) {
			categories.getCategoriesFields(cids, ['cid', 'name'], next);
		},
	], function (err, data) {
		if (err) {
			return next(err);
		}

		res.render('admin/plugins/nsfw', {
			categories: data,
		});
	});
}

module.exports = plugin;