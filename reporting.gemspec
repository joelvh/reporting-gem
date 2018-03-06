
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "reporting/version"

Gem::Specification.new do |spec|
  spec.name          = 'reporting'
  spec.version       = Reporting::VERSION
  spec.authors       = ['Joel Van Horn']
  spec.email         = ['joel@joelvanhorn.com']

  spec.summary       = %q{Utilities for importing and exporting data in handy ways.}
  spec.description   = %q{Utilities for importing and exporting data in handy ways.}
  spec.homepage      = 'https://github.com/joelvh/reporting'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "http://mygemserver.com"
  # else
  #   raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'dry-container'
  spec.add_dependency 'dry-transaction'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-kickstarter'

  # Utilities
  spec.add_dependency 'dry-core' # cache, class attributes, class builder, constants, deprecations, extensions
  spec.add_dependency 'dry-equalizer' # add equality checks to value objects based on specific attributes
  spec.add_dependency 'dry-events' # pub/sub
  spec.add_dependency 'dry-inflector' # adds inflection helpers for pluralize/camelize/classify/etc
  spec.add_dependency 'dry-initializer' # specify args/attributes and options with types/defaults to objects
  spec.add_dependency 'dry-logic' # programmatically build predicates and operations (AND/OR boolean logic)
  spec.add_dependency 'dry-matcher' # build success/failure case logic with handlers to react to success/fail
  spec.add_dependency 'dry-monads' # "railway programming" using a result object for method success/failure
  spec.add_dependency 'dry-struct' # define typed attributes for "frozen" data ojbects or value objects
  spec.add_dependency 'dry-system'
  spec.add_dependency 'dry-transaction' # execute operations step by step

  # Export
  spec.add_development_dependency 'batch-loader'

  # ETL
  spec.add_development_dependency 'kiba' # ETL pipeline framework
  spec.add_development_dependency 'mapreduce' # Ruby distributed Map/Reduce using ZeroMQ

  # Transformers
  spec.add_development_dependency 'transproc' # Transform Ruby objects in functional style (basis for ROM)
  spec.add_development_dependency 'hm' # Idomatic Ruby hash transformations
  spec.add_development_dependency 'daru' # for storage, analysis, manipulation and visualization of data
  spec.add_development_dependency 'piperator' # Composable pipelines for Enumerators

  # Formats
  spec.add_development_dependency 'saxlsx' # XLSX
  spec.add_development_dependency 'xport' # XLSX, CSV
  spec.add_development_dependency 'axlsx'
  spec.add_development_dependency 'roo' # Spreadsheet interface
  spec.add_development_dependency 'spreadsheet' # XLSX
  spec.add_development_dependency 'rubyXL' # read/write/modify .xlsx and .xlsm files
  spec.add_development_dependency 'google-spreadsheet-ruby' # Google sheets
  spec.add_development_dependency 'remote_table' # Open local/remote XLSX, XLS, ODS, CSV, TSV/Google Docs

  # Frameworks & Web
  spec.add_development_dependency 'axlsx_rails'
  spec.add_development_dependency 'datashift' # Import/Export XLSX/CSV/Paperclip
  spec.add_development_dependency 'reports_kit' # Rails Reporting UI with charts, etc
  spec.add_development_dependency 'ruport' # Easily reformat data to various outputs (e.g. PDF, HTML, etc)
  spec.add_development_dependency 'thinreports' # Report generator
  spec.add_development_dependency 'compendium' # Rails reporting framework
  spec.add_development_dependency 'active_reporting' # ActiveRecord w/ ROLAP DSL

  # Detectors
  spec.add_development_dependency 'bugspots' # code bug prediction hotspot heuristic (based on git history)
  spec.add_development_dependency 'linguist' # detect programming languages in repo
  spec.add_development_dependency 'charlock_holmes' # character encoding detection
  spec.add_development_dependency 'swot' # Determine if email address domains belong to academic institutions
  spec.add_development_dependency 'rubrowser' # a ruby code dependency graph interactive visualizer
end
