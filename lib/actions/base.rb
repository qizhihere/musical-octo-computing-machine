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
      @err = erro
      @data = data
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
