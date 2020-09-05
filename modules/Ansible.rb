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

module Ansible
    def Ansible.ensureAnsibleFilesPresent
        if not File.exist?("./docks.yml")
            raise "A playbook file named 'provisioning/playbook.yml' next to Vagrantfile!\n"
        end

        if not File.exist?("./hosts")
            raise "You must create inventory file for Ansible named 'hosts' next to Vagrantfile! See hosts.example.txt for instructions\n"
        end
    end
end
