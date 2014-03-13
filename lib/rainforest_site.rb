class RainforestSite

  attr_accessor :name, :test_states

  def initialize(name, test_states)
    @name = name
    @test_states = test_states || []
  end

  def passed
    if @test_states.size > 0
      @test_states.all? { |state| state == 'passed' }
    else
      false
    end
  end

  def failed
    index = @test_states.index('failed') 
    index ? index >= 0 : false
  end

  def in_progress
    index = @test_states.index('no_result') 
    index ? index >= 0 : false
  end

  def unknown_status
    [passed, failed, in_progress].all? {|state| state == false }
  end

  def to_json(options = {})
    { 
      name: @name, 
      passed: passed,
      failed: failed,
      in_progress: in_progress,
      unknown: unknown_status
    }.to_json
  end

end