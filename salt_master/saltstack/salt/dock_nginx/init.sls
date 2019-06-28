docker-pkg:
  pkg.installed:
    - name: docker.io

docker:
  service.running

nginx-image:
   docker.pulled:
     - name: nginx
     - require_in: nginx-container

nginx-container:
   docker.installed:
     - name: nginx
     - hostname: nginx
     - image: nginx
     - require_in: nginx

nginx:
   dockerng.running:
     - name: nginx
     - image: nginx:latest
