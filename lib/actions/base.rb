module Actions
  class Base
    attr_reader :data, :errors, :error_type, :params

    def initialize(params)
      @params = params
      @success = true
      @errors = {}
    end

    def success?
      @success
    end

    def has_errors?
      !@errors.empty?
    end

    def error(errors = nil, type: nil, data: nil)
      @errors = errors if errors
      @error_type = type if type
      @data = data if data
      @success = false
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
