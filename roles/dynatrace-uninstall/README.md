# Dynatrace-Server-Ansible

This Ansible role uninstalls Dynatrace components of the [Dynatrace Application Monitoring](http://www.dynatrace.com/en/products/application-monitoring.html) solution.

## Download

The role is available via:

- [Ansible Galaxy](https://galaxy.ansible.com/Dynatrace/Dynatrace-Uninstall-Ansible)
- [GitHub](https://github.com/Dynatrace/Dynatrace-Uninstall-Ansible)

## Description

This role uninstall Dynatrace components: Dynatrace Server, Collector, Client, Agent, WebServer Agent, OneAgent, Dynatrace User and remove Dynatrace directory. You can choose components to install by setting variable's in playbook or in `defaults/main.yml` file.,

## Role Variables

As defined in ```defaults/main.yml```:

| Name                                          | Default                                                               | Description
|-----------------------------------------------|-----------------------------------------------------------------------|------------
| *dynatrace_install_dir*          				| /opt                                                                  | The Dynatrace directory will be removed from *$dynatrace_install_dir*. 
| *dynatrace_version*  							| 6.5                                     								| The version of the Dynatrace Component.
| *dynatrace_user*   							| dynatrace | The system user that owns the Dynatrace installation, whom will be removed.
| *dynatrace_server_collector_port*             | 6699                                                                  | The port where the server shall listen for Collectors. Use either ```6698``` (non-SSL) or ```6699``` (SSL).
| *dynatrace_collector_agent_port*         		| 9998                                                                  | The port on the Collector the Web Server Agent shall connect to.
| *ansible_uninstall_server*    				| yes                                                            		| Whether the Dynatrace server shall be uninstall, or not.
| *ansible_uninstall_collector*        			| no                                                                 	| Whether the Dynatrace Collector shall be uninstall, or not.
| *ansible_remove_dynatrace_user*       	 	| yes                                                        			| Whether the Dynatrace user shall be removed, or not.
| *ansible_remove_dynatrace_diretory*    		| yes                                                            		| Whether the Dynatrace directory shall be removed, or not.
| *ansible_uninstall_client*    				| dynatrace                                                             | Whether the Dynatrace Client shall be removed, or not.
| *ansible_uninstall_agent*    					| dynatrace                                                             | Whether the Dynatrace Agent shall be uninstall, or not.
| *ansible_uninstall_wsagent*                   | dynatrace                                                             | Whether the WebServer Agent shall be uninstall, or not.
| *ansible_uninstall_oneagent*                  | dynatrace                                                             | Whether the Dynatrace OneAgent shall be uninstall, or not.
| *dynatrace_server_role_name*                  | Dynatrace.Dynatrace-Uninstall-Ansible                                 | The actual name of this role in an [Ansible Playbook's](http://docs.ansible.com/playbooks.html) ```roles``` directory.

## Example Playbook

```
---
- hosts: all
  roles:
  - role: Dynatrace-Uninstall-Ansible  
    ansible_uninstall_server: no
    ansible_uninstall_collector: no
    ansible_uninstall_client: no
    ansible_uninstall_wsagent: yes
    ansible_uninstall_agent: no
    ansible_remove_dynatrace_user: no
    ansible_remove_dynatrace_diretory: no
    ansible_uninstall_oneagent: no
  remote_user: user       
```

## Testing

We use [Test Kitchen](http://kitchen.ci) to automatically test our automated deployments with [Serverspec](http://serverspec.org) and [RSpec](http://rspec.info/):

1) Install Test Kitchen and its dependencies from within the project's directory:

```
gem install bundler
bundle install
```

2) Run all tests

```
kitchen test
```

By default, we run our tests inside [Docker](https://www.docker.com/) containers as this considerably speeds up testing time (see `.kitchen.yml`).

## Additional Resources

### Blogs

- [How to Automate Enterprise Application Monitoring with Ansible](http://apmblog.dynatrace.com/2015/03/04/how-to-automate-enterprise-application-monitoring-with-ansible/)
- [How to Automate Enterprise Application Monitoring with Ansible - Part II](http://apmblog.dynatrace.com/2015/04/23/how-to-automate-enterprise-application-monitoring-with-ansible-part-ii/)

### Presentations

- [Automated Deployments (of Dynatrace) with Ansible](http://www.slideshare.net/MartinEtmajer/automated-deployments-with-ansible)
- [Test-Driven Infrastructure with Ansible, Test Kitchen, Serverspec and RSpec](http://www.slideshare.net/MartinEtmajer/testing-ansible-roles-with-test-kitchen-serverspec-and-rspec-48185017)

## Problems? Questions? Suggestions?

This offering is [Dynatrace Community Supported](https://community.dynatrace.com/community/display/DL/Support+Levels#SupportLevels-Communitysupported/NotSupportedbyDynatrace(providedbyacommunitymember)). Feel free to share any problems, questions and suggestions with your peers on the Dynatrace Community's [Application Monitoring & UEM Forum](https://answers.dynatrace.com/spaces/146/index.html).

## License

Licensed under the MIT License. See the LICENSE file for details.
[![analytics](https://www.google-analytics.com/collect?v=1&t=pageview&_s=1&dl=https%3A%2F%2Fgithub.com%2FdynaTrace&dp=%2FDynatrace-Server-Ansible&dt=Dynatrace-Server-Ansible&_u=Dynatrace~&cid=github.com%2FdynaTrace&tid=UA-54510554-5&aip=1)]()
