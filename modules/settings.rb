# -*- mode: ruby -*-
# vi: set ft=ruby :

# This function is a modification of Setting function from Vladislav Rastrusny                                                                     /____//____/
# Email: FractalizeR@yandex.ru, vladislav.rastrusny@gmail.com
# http://www.fractalizer.ru
#
# This work is licensed under the Apache 2.0
# United States License. To view a copy of this license, visit
# http://www.apache.org/licenses/LICENSE-2.0
# or send a letter to The Apache Software Foundation Dept. 9660 Los Angeles, CA 90084-9660 U.S.A.

require 'yaml'

module Settings

    # Get the Vagrant Project Name
    def Settings.siteName
       vagrant_sitename = File.basename(Dir.pwd); #taken from VVV
       # puts "Site name is #{vagrant_sitename}"
       sitename = vagrant_sitename.tr("_", "")
       # puts "Normalized site name #{sitename}"
       sitename
    end

    def Settings.readConfiguration(folder, ymlFile)
        # current_dir = File.dirname(File.expand_path(__FILE__))
        # puts "Current dir is #{current_dir}"

        config_file = File.join('config', 'config.yml')
        # puts "Configuration file is #{config_file}"
        default_config_file = File.join('config', 'config.default.yml')
        # puts "Default Configuration file is #{default_config_file}"
        configs = if File.file?(config_file)
            settings =YAML.load_file(config_file)
          else
            settings =YAML.load_file(default_config_file)
          end
        settings[0]
    end 

    def Settings.readFromYml(ymlFile)
        settings = YAML.load_file('./config/config.yml')
        settings[0]
    end
end
