class RainforestSite

  attr_accessor :name, :test_states

  def initialize(name, test_states)
    @name = name
    @test_states = test_states || []
  end

  def passed
    uniq_test_states = @test_states.uniq
    # there are enumerables like detect? and all?
    # but this seems more efficient
    uniq_test_states.size && uniq_test_states.index('passed') + 1
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
    [passed, failed, in_progress].all?(false)
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