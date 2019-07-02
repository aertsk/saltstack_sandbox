install_python3-pip:
  pkg.installed:
    - name: python3-pip

install_docker_salt_module:
  pip.installed:
    - name: 'docker'
    - reload_modules: True
    - exists_action: i
    - force_reinstall: True
    - require:
      - pkg: python3-pip

install_docker:
  pkg.installed:
    - name: docker.io

#https://docs.saltstack.com/en/latest/ref/states/all/salt.states.service.html#salt.states.service.running
start_docker_service:
  service.running:
    - name: docker
    - enable: True

#https://docs.saltstack.com/en/latest/ref/states/all/salt.states.docker_image.html
pull_nginx_image:
   docker_image.present:
     - name: nginx
     - tag: latest

#https://docs.saltstack.com/en/latest/ref/states/all/salt.states.docker_container.html
start_nginx:
   docker_container.running:
     - image: nginx
