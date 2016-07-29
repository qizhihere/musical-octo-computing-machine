module Actions
  class Base
    attr_reader :data, :errors, :error_type, :params

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

    def error(errors = [], type: :default, data: nil)
      @errors = errors
      @error_type = type
      @data = data
    end

    def set(attr, val)
      @data ||= {}
      @data[attr] = val
    end

    def set_data(data)
      @data = data
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
