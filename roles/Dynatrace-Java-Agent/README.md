# Dynatrace-Java-Agent-Ansible

This Ansible role installs and configures the Dynatrace AppMon Agent of the [Dynatrace AppMon](https://www.dynatrace.com/support/doc/appmon/) solution for a Java process.

**Note**: this role makes the Dynatrace AppMon Agent available to a Java Virtual Machine by injecting an appropriate *-agentpath* option into an environment variable, e.g. ```JAVA_OPTS```, inside a file (typically an executable script). It is assumed that this script either executes the Java process directly or is sourced by another script before the Java process gets executed. **You will have to restart your application after placing the agent.**

## Example

We are given a file ```run-foo.sh``` that executes the *main* method in class *Foo*:

```
java Foo
```

By executing this role we change the file's contents to come up with something like this:

```
export JAVA_OPTS="$JAVA_OPTS -agentpath:/opt/dynatrace/agent/lib64/libdtagent.so=name=foo-java-agent,collector=localhost:9998"
java Foo
```

## Download

The role is available via:

- [Ansible Galaxy](https://galaxy.ansible.com/Dynatrace/Dynatrace-Java-Agent)
- [GitHub](https://github.com/Dynatrace/Dynatrace-Java-Agent-Ansible)

## Dependencies

This roles depends on the following roles:

- [Dynatrace-Agent](https://galaxy.ansible.com/Dynatrace/Dynatrace-Agent)

## Role Variables

As defined in ```defaults/main.yml```:

| Name                                             | Default                                  | Description |
|--------------------------------------------------|------------------------------------------|-------------|
| *dynatrace_java_agent_env_var_name*              | JAVA_OPTS                                | The name of the environment variable to be used for Agent injection. |
| *dynatrace_java_agent_env_var_file_name*         | **required**                             | The name of the file to be modified. |
| *dynatrace_java_agent_env_var_file_insert_after* | BOF                                      | A regex, BOF or EOF for *begin-of-file* and *end-of-file*, respectively. If a given regex is not matched, the *-agentpath* option will be appended to the file. |
| *dynatrace_java_agent_name*                      | java-agent                               | The name of the Agent as it appears in Dynatrace AppMon. |
| *dynatrace_java_agent_collector_hostname*        | localhost                                | The location of the collector the Agent shall connect to. |
| *dynatrace_java_agent_collector_port*            | 9998                                     | The port on the collector the Agent shall connect to. |
| *dynatrace_java_agent_linux_agent_path*          | /opt/dynatrace/agent/lib64/libdtagent.so | The path to the Agent libary. |
| *dynatrace_java_agent_state*                     | present                                  | Whether the Agent shall be ```present``` or ```absent```. |

## Example Playbook

```
- hosts: all
  roles:
    - role: Dynatrace.Dynatrace-Java-Agent
      dynatrace_java_agent_env_var_file_name: /usr/bin/run-foo.sh
      dynatrace_java_agent_env_var_file_insert_after: '#!/bin/sh'
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

- [Automated Deployments (of Dynatrace AppMon) with Ansible](http://www.slideshare.net/MartinEtmajer/automated-deployments-with-ansible)
- [Test-Driven Infrastructure with Ansible, Test Kitchen, Serverspec and RSpec](http://www.slideshare.net/MartinEtmajer/testing-ansible-roles-with-test-kitchen-serverspec-and-rspec-48185017)

## Problems? Questions? Suggestions?

This offering is [Dynatrace Community Supported](https://community.dynatrace.com/community/display/DL/Support+Levels#SupportLevels-Communitysupported/NotSupportedbyDynatrace(providedbyacommunitymember)). Feel free to share any problems, questions and suggestions with your peers on the Dynatrace Community's [Application Monitoring & UEM Forum](https://answers.dynatrace.com/spaces/146/index.html).

## License

Licensed under the MIT License. See the LICENSE file for details.
[![analytics](https://www.google-analytics.com/collect?v=1&t=pageview&_s=1&dl=https%3A%2F%2Fgithub.com%2FdynaTrace&dp=%2FDynatrace-Java-Agent-Ansible&dt=Dynatrace-Java-Agent-Ansible&_u=Dynatrace~&cid=github.com%2FdynaTrace&tid=UA-54510554-5&aip=1)]()
