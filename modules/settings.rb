# -*- mode: ruby -*-
# vi: set ft=ruby :

# This function is a modification of Settings function from Vladislav Rastrusny                                                                     /____//____/
# Email: FractalizeR@yandex.ru, vladislav.rastrusny@gmail.com
# http://www.fractalizer.ru
#
# This work is licensed under the Apache 2.0
# United States License. To view a copy of this license, visit
# http://www.apache.org/licenses/LICENSE-2.0
# or send a letter to The Apache Software Foundation Dept. 9660 Los Angeles, CA 90084-9660 U.S.A.

require "yaml"


module Settings

    def Settings.vagrantfiledir(fileName)
      current_dir = File.dirname(File.expand_path(fileName))
      puts "Current dir is #{current_dir}"
       current_dir
    end

    def Settings.projectFileDir(fileName)
      current_dir = File.dirname(File.expand_path(fileName))
      puts "Current dir is #{current_dir}"
       current_dir
    end

    def Settings.readConfiguration(folder, ymlFile)
        config_file = File.join('config', 'config.yml')
        # puts "Configuration file is #{config_file}"
        default_config_file = File.join('config', 'config.default.yml')
        # puts "Default Configuration file is #{default_config_file}"
        configs = if File.file?(config_file)
            settings =YAML.load_file(config_file)
          else
            settings =YAML.load_file(default_config_file)
          end
        # settings[0]
        settings
    end

    def Settings.readFromYml(ymlFile)
        settings = YAML.load_file('./config/config.yml')
        settings[0]
    end
end
