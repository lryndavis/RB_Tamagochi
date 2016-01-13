class Tamagotchi
  @@name = "none"
  @@is_alive = true
  @@food_level = 100
  @@sleep_level = 100
  @@activity_level = 100

  def initialize(name)
    @@name = name
    @@is_alive = true
    @@food_level = 100
    @@sleep_level = 100
    @@activity_level = 100
  end

  define_singleton_method(:name) do
    @@name
  end

  define_singleton_method(:is_alive) do
    @@is_alive
  end

  define_singleton_method(:food_level) do
    @@food_level
  end

  define_singleton_method(:sleep_level) do
    @@sleep_level
  end

  define_singleton_method(:activity_level) do
    @@activity_level
  end

  define_singleton_method(:play) do
    @@activity_level += 5
  end

  define_singleton_method(:feed) do
    @@food_level += 5
  end

  define_singleton_method(:sleep) do
    @@sleep_level += 10
  end

  define_singleton_method(:resurrect) do
    @@is_alive = true
    @@food_level = 100
    @@sleep_level = 100
    @@activity_level = 100
  end

  define_singleton_method(:set_food_level) do |level|
    if level = 0
      @@is_alive = false
    end
    @@food_level = level
  end

  define_singleton_method(:set_activity_level) do |level|
    if level = 0
      @@is_alive = false
    end
    @@activity_level = level
  end

  define_singleton_method(:set_sleep_level) do |level|
    if level = 0
      @@is_alive = false
    end
    @@sleep_level = level
  end

  define_singleton_method(:time_passes) do
    @@food_level -= 2
    @@sleep_level -= 1
    @@activity_level -= 1
  end
end
