module Inatra
  class << self
    @@routes = {}

    def routes(&block)
      raise 'No ruote given' unless block_given?
      instance_eval(&block)
    end

    def method_missing(name, path)
      @@routes[name.to_s.upcase] = { path => yield }
    end

    def call(env)
      @@routes[env['REQUEST_METHOD']][env['PATH_INFO']]
    end
  end
end
