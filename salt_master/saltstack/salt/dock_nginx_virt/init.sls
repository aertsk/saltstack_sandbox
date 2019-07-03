#NOTE: Following open issue results in the fact that in a virtual environment you should deploy this sls 2 times to have the ducker running https://github.com/saltstack/salt/issues/45292

install_python3-pip:
  pkg.installed:
    - name: python3-pip

install_supervisor:
  pkg.installed:
    - name: supervisor

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

#https://docs.saltstack.com/en/latest/ref/states/all/salt.states.supervisord.html
start_docker_service:
  supervisord.running:
    - name: docker
    - require:
      - pkg: supervisor

#https://docs.saltstack.com/en/latest/ref/states/all/salt.states.docker_image.html
pull_nginx_image:
   docker_image.present:
     - name: nginx
     - tag: latest

#https://docs.saltstack.com/en/latest/ref/states/all/salt.states.docker_container.html
start_nginx:
   docker_container.running:
     - image: nginx
