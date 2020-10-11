# frozen_string_literal: true

require 'yaml'

# Module that can be included (mixin) to take and output yaml data
module YamlBuddy
  # take_yaml: converts a String with yaml data into @data
  # parameter: yaml - a String in yaml format
  def take_yaml(yaml)
    return unless yaml

    @data = YAML.parse(yaml).to_ruby
  end

  # to_yaml: converts @data into yaml string
  # returns: String in yaml format
  def to_yaml
    @data.to_yaml
  end
end
