Sentry.init do |config|
	config.dsn = 'https://cfdaa94a7cc04a528600db6661b3b84a@o1041910.ingest.sentry.io/6063586'
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
