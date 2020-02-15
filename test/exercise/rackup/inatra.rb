module Inatra
  class << self
    @@routes = {}

    def routes(&block)
      raise 'No route given' unless block_given?
      instance_eval(&block)
    end

    def method_missing(verb, path)
      raise 'What to do?' unless block_given?
      @@routes[verb.to_s.upcase] = { path => yield }
    end

    def call(env)
      @@routes[env['REQUEST_METHOD']][env['PATH_INFO']]
    end
  end
end
