# Catch situations that are dangerous, like no admin user/pass
logger = Logger.new(STDOUT)

if ENV["ADMIN_USER"].blank?
  logger.fatal "No ADMIN_USER set, terminating!"
  exit 1
end

if ENV["ADMIN_PASS"].blank?
  logger.fatal "No ADMIN_PASS set, terminating!"
  exit 1
end
