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
    docker.running:
        - container: nginx
        - port_bindings:
            "80/tcp":
                    HostIp: ""
                    HostPort: "80"
        - binds:
            /srv/platform: /usr/local/nginx/html/platform
