Before do

end

After do
  
end

Before('@wip, @ci') do
  # This will only run before scenarios tagged
  # with @wip OR @ci.
end

AfterStep('@wip', '@ci') do
  # This will only run after steps within scenarios tagged
  # with @wip AND @ci.
end
