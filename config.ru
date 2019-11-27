require_relative './config/environment'

begin
	fi_check_migration

	use Rack::MethodOverride

	run App # or whatever the app controller module/class name you want eg. ApplicationController
rescue ActiveRecord::PendingMigrationError => err
	STDERR.puts err
	exit 1
end
