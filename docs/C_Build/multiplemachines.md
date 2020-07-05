# Multiple Machines

I have researched this technique at multiple web sites, combine their best practices to come up with an updated one.
This technique is explained at the blog [Multi machine using Vagrant and YAML](https://blog.scottlowe.org/2014/10/22/multi-machine-vagrant-with-yaml/)
```ruby
config.vm.define "k8s-master" do |master|

end


config.vm.define "machinelearning" do |ml|

end

config.vm.define "datasources" do |storage|

end

config.vm.define "observability" do |storage|

end
```
