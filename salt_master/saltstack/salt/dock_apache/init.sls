docker.pull:
  module.run:
    - repo: utahdave/saltdemo

apache-image:
   docker.pulled:
     - name: utahdave/saltdemo
     - require_in: apache-container

apache-container:
   docker.installed:
     - name: apache
     - hostname: apache
     - image: utahdave/saltdemo
     - require_in: apache

apache:
   docker.running:
     - container: apache
     - port_bindings:
            "80/tcp":
                HostIp: ""
                HostPort: "8000"
