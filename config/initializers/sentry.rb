Sentry.init do |config|
	config.dsn = 'http://590efda89ba449b59c28fbf8f1e6f44b@rancher.ilibrary.me:8080/4'
	config.breadcrumbs_logger = [:active_support_logger, :http_logger]

	# Set tracesSampleRate to 1.0 to capture 100%
	# of transactions for performance monitoring.
	# We recommend adjusting this value in production
	config.traces_sample_rate = 1.0
	# or
	config.traces_sampler = lambda do |context|
	  true
	end
end
