require 'yaml'
require 'ostruct'

class Image < OpenStruct
  def self.all
    directory = File.join(File.dirname(__FILE__), '..', '..')
    YAML.load_file(File.join(directory, '/images.yml')).map do |h|
      Image.new(h)
    end
  end

  def tag
    tags.first
  end

  def aliases
    tags[1..-1]
  end

  def version
    case branch
    when /emacs-(\d+\.\d+)/
      $1
    else
      branch
    end
  end

  def directory
    File.join(version, template)
  end

  def dockerfile
    File.join(directory, 'Dockerfile')
  end

  def tags
    # Ensure tags are strings
    super.map(&:to_s)
  end
end
