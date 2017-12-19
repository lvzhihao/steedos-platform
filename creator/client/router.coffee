FlowRouter.route '/',
	action: (params, queryParams)->
		if !Meteor.userId()
			FlowRouter.go '/steedos/sign-in?redirect=' + context.path;
		else
			FlowRouter.go '/app/creator'


Meteor.startup ->
	db.apps.INTERNAL_APPS = ["/app/crm", "/app/creator"]
	Session.set("apps", ["crm", "creator"]);
	Session.set("app_objects", ["customers", "contacts", "flow_roles"]);