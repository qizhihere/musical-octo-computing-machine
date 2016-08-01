module Actions
  class Base
    attr_reader :data, :errors, :error_type

    def initialize(params = {})
      @errors = []
      @params = params
    end

    def success?
      (@errors.nil? || @errors.empty?) && @error_type == nil
    end

    def error?
      !success?
    end

    def fail?
      error?
    end

    def error(type, errors = [])
      @error_type = type
      @errors = errors
    end

    def set(attr, val)
      @data ||= {}
      @data[attr] = val
    end

    def get(attr)
      @data && @attr[attr]
    end

    def run
      raise NotImplementedError
    end

    def call(*args, &block)
      run(*args, &block)
      self
    end
  end
end
