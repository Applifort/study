module Inatra
  class << self
    attr_accessor :route

    def routes(&block)
      raise 'No route given' unless block_given?
      instance_eval(&block)
    end

    def method_missing(method, path)
      raise 'What are you doing bro?? Empty retry..' unless block_given?
      verb = method.to_s.upcase
      # пока не понял как правильно это делается. в JS вставлял подобное
      # через дистракчеринг хэша.
      @route = {} if @route.nil?
      if @route.key?(verb)
        @route[verb][path] = yield
      else
        @route[verb] = { path => yield }
      end
    end

    def call(env)
      @route[env['REQUEST_METHOD']][env['PATH_INFO']]
    end
  end
end
