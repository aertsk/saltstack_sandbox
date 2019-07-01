install_python-pip:
  pkg.installed:
    - name: python-pip

#install_docker_salt_module:
#pip install docker:
#  cmd.run

install_docker_salt_module:
  pip.installed:
    - name: 'docker'
    - reload_modules: True
    - exists_action: i
    - force_reinstall: True
    - require:
      - pkg: python-pip

install_docker:
  pkg.installed:
    - name: docker.io

#TO DO: Check out following steps
service docker start:
  cmd.run

#https://docs.saltstack.com/en/latest/ref/states/all/salt.states.service.html#salt.states.service.running
start_docker_service:
  service.running:
    - name: docker
    - enable: True

nginx-image:
   docker_image.present:
     - tag: nginx:latest

nginx:
   docker_container.running:
     - image: nginx
