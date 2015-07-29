module Rstreamor
  class Request

    def initialize(request, file)
      self.request = request
      self.file = file
    end

    def ranges
      self.request.headers['HTTP_RANGE'].gsub('bytes=', '').split('-')
    end

    def upper_bound
      ranges[0] ? ranges[0] : 0
    end

    def lower_bound
      ranges[1] ? ranges[1] : self.file.data.size
    end

  end
end