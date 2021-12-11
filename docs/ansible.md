# Ansible files

ansible.cfg - INI formatted, contains defaults for variables and locations for other files.

inventory.yml - List of hosts, groups of hosts, and variables associated with them. Default name is hosts, name can be specified on comand line with -i option, but I use inventory.yml and specify that in the ansible.cfg file.

secret.yml - list of secret values encrypted with ansible-vault.

requirements.yml - List of roles to be downloaded from ansible galaxy via ???

./files/ - directory of files needed for copy or configuration operations. Organized in subdirectories by task group

./tasks/ - directory of task list files used for installing/configuring specific software or types of software. These files are included/imported into playbooks (possibly conditionally)

Files (except for ansible.cfg) are YAML formatted <https://en.wikipedia.org/wiki/YAML>

roles downloaded from ansible galaxy are stored in ~/.ansible/roles by default.

# Variables

Variables are substituted into yaml files using jinja2. (e.g. {{var}}). Note that in YAML, a dictionary can be written as {a:1 b:2 c:3} so if a variable substitution starts a value, the entire value must be in double quotes: "{{var}} is the host name"

ansible_facts is a dictionary variable that contains facts about the target system. <https://docs.ansible.com/ansible/latest/user_guide/playbooks_vars_facts.html> Examples include:

* ansible_facts.ansible_architecture: "x86_64"
* ansible_facts.ansible_distribution: "Ubuntu"

magic variables contain information about ansible. e.g.

* inventory_hostname - the name of the current host
* hostvars - a dictionary of variables associated wiht the host
* "ansible_version": {
    "full": "2.10.1",
    "major": 2,
    "minor": 10,
    "revision": 1,
    "string": "2.10.1"
}


Jinja2 syntax can be used to conditionally read portions of a configuration file:

{% if 'webserver' in group_names %}
   # some part of a configuration file that only applies to webservers
{% endif %}

