module Actions
  class Base
    attr_reader :data, :err, :params

    def initialize(params = {})
      @errors = []
      @params = params
    end

    def success?
      @err == nil
    end

    def error?
      !success?
    end

    def fail?
      error?
    end

    def error(erro, data = nil)
      @data = data
      @err = erro
    end

    def set_data(val)
      @data = val
    end

    def set(attr, val)
      @data ||= {}
      @data[attr] = val
    end

    def get(attr)
      @data && @data[attr]
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
