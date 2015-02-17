# Dynatrace-Ansible

A collection of [Ansible Roles](http://docs.ansible.com/playbooks_roles.html) for automated deployments of Dynatrace products.

You can use the provided sample [Ansible Playbook](http://docs.ansible.com/playbooks.html) in ```sample-playbook.yml``` as a quick starter for deploying Dynatrace products into your development, testing and production environments. Please refer to the particular roles in the ```roles``` directory for detailed instructions. A sample [Ansible Inventory](http://docs.ansible.com/intro_inventory.html) file is provided in ```sample-inventory```.

## Requirements

For all machines in the inventory file, Ansible requires an SSH connection and a user that is able to execute the commands given in the particular roles using *sudo*. The sample playbook assumes that such a user exists under the name *deploy* (which can easily be changed to whatever works for you).

## Usage

```
ansible-playbook -i sample-inventory --tags=$product --ask-pass sample-playbook.yml
```

Where *$product* is one of, or a comma-separated combination of the following [Ansible Tags](http://docs.ansible.com/playbooks_tags.html):

| Tag          | Matches Role |
|--------------|--------------|
| agents       | [Dynatrace-Agents](https://galaxy.ansible.com/list#/roles/2620) |
| apache-agent | [Dynatrace-Apache-HTTPServer-Agent](https://galaxy.ansible.com/list#/roles/2681) |
| client       | [Dynatrace-Client](https://galaxy.ansible.com/list#/roles/2856) |
| collector    | [Dynatrace-Collector](https://galaxy.ansible.com/list#/roles/2621) |
| fixpack      | [Dynatrace-Fixpack](https://galaxy.ansible.com/list#/roles/2627) |
| java-agent   | [Dynatrace-Java-Agent](https://galaxy.ansible.com/list#/roles/2653) |
| license      | [Dynatrace-License](https://galaxy.ansible.com/list#/roles/2626) |
| plugin       | [Dynatrace-Plugin](https://galaxy.ansible.com/list#/roles/2628) |
| server       | [Dynatrace-Server](https://galaxy.ansible.com/list#/roles/2623) |
| tomcat-agent | [Dynatrace-Tomcat-Agent](https://galaxy.ansible.com/list#/roles/2654) |
| wsagent      | [Dynatrace-WebServer-Agent](https://galaxy.ansible.com/list#/roles/2625) |

## Testing

We use [Kitchen](http://kitchen.ci) to automatically test our automated deployments using [serverspec](http://serverspec.org):

1) Install Kitchen and its dependencies from within the project's directory:

```
gem install bundler
bundle install
```

2) Run tests

```
kitchen list # choose an instance (e.g. server-ubuntu-1204)
kitchen test $instance
```

## Additional Resources

- [Slide Deck: Automated Deployments](http://slideshare.net/MartinEtmajer/automated-deployments-slide-share)
- [Slide Deck: Dynatrace Inside Continuous Delivery](http://slideshare.net/MartinEtmajer/dynatrace-inside-continuous-delivery)

[![analytics](https://www.google-analytics.com/collect?v=1&t=pageview&_s=1&dl=https%3A%2F%2Fgithub.com%2FdynaTrace&dp=%2FDynatrace-Ansible&dt=Dynatrace-Ansible&_u=Dynatrace~&cid=github.com%2FdynaTrace&tid=UA-54510554-5&aip=1)]()