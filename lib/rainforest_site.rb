class RainforestSite

  attr_accessor :name, :test_states

  def initialize(name, test_states)
    @name = name
    @test_states = test_states || []
  end

  def passed
    @test_states.size > 0 ? @test_states.all? { |state| state == 'passed' } : false
  end

  def failed
    @test_states.any? {|state| state == 'failed' }
  end

  def in_progress
    @test_states.any? {|state| state == 'no_result' }
  end

  def to_json(options = {})
    { 
      name: @name, 
      passed: passed,
      failed: failed,
      in_progress: in_progress
    }.to_json
  end

end