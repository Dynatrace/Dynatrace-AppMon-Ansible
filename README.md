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

| Tag                | Matches Role |
|--------------------|--------------|
| agents             | [dynatrace.Dynatrace-Agents](https://galaxy.ansible.com/list#/roles/5320) |
| apache-httpd-agent | [dynatrace.Dynatrace-Apache-HTTPD-Agent](https://galaxy.ansible.com/list#/roles/5321) |
| client             | [dynatrace.Dynatrace-Client](https://galaxy.ansible.com/list#/roles/5323) |
| collector          | [dynatrace.Dynatrace-Collector](https://galaxy.ansible.com/list#/roles/5325) |
| glassfish-agent    | [dynatrace.Dynatrace-Glassfish-Agent](https://galaxy.ansible.com/list#/roles/5326) |
| java-agent         | [dynatrace.Dynatrace-Java-Agent](https://galaxy.ansible.com/list#/roles/5327) |
| license            | [dynatrace.Dynatrace-License](https://galaxy.ansible.com/list#/roles/5328) |
| nginx-agent        | [dynatrace.Dynatrace-NGINX-Agent](https://galaxy.ansible.com/list#/roles/5319) |
| plugin             | [dynatrace.Dynatrace-Plugin](https://galaxy.ansible.com/list#/roles/5330) |
| server             | [dynatrace.Dynatrace-Server](https://galaxy.ansible.com/list#/roles/5331) |
| tomcat-agent       | [dynatrace.Dynatrace-Tomcat-Agent](https://galaxy.ansible.com/list#/roles/5332) |
| update             | [dynatrace.Dynatrace-Update](https://galaxy.ansible.com/list#/roles/5333) |
| wsagent            | [dynatrace.Dynatrace-WebServer-Agent](https://galaxy.ansible.com/list#/roles/5324) |

## Additional Resources

### Blogs

- [How to Automate Enterprise Application Monitoring with Ansible](http://apmblog.dynatrace.com/2015/03/04/how-to-automate-enterprise-application-monitoring-with-ansible/)
- [How to Automate Enterprise Application Monitoring with Ansible - Part II](http://apmblog.dynatrace.com/2015/04/23/how-to-automate-enterprise-application-monitoring-with-ansible-part-ii/)

### Presentations

- [Automated Deployments (of Dynatrace) with Ansible](http://www.slideshare.net/MartinEtmajer/automated-deployments-with-ansible)
- [Test-Driven Infrastructure with Ansible, Test Kitchen, Serverspec and RSpec](http://www.slideshare.net/MartinEtmajer/testing-ansible-roles-with-test-kitchen-serverspec-and-rspec-48185017)

### Tutorials

- [Automated Deployments (of Dynatrace) with Ansible](https://community.compuwareapm.com/community/display/LEARN/Tutorials+on+Automated+Deployments#TutorialsonAutomatedDeployments-ansible)

## Questions?

Feel free to post your questions on the Dynatrace Community's [Continuous Delivery Forum](https://answers.dynatrace.com/spaces/148/open-q-a_2.html?topics=continuous%20delivery).

[![analytics](https://www.google-analytics.com/collect?v=1&t=pageview&_s=1&dl=https%3A%2F%2Fgithub.com%2FdynaTrace&dp=%2FDynatrace-Ansible&dt=Dynatrace-Ansible&_u=Dynatrace~&cid=github.com%2FdynaTrace&tid=UA-54510554-5&aip=1)]()
