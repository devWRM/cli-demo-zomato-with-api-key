# primary job of the CLI class is to provide the user interface - `gets` and `puts`
class CLI
  attr_reader :api

  def initialize
    @api = API.new
  end

  def start
    self # what is self? in an instance method, it's an instance - the instance used to call the method
    api.get_info
  end
end
