elasticsearch:
    pkgrepo.managed:
        - humanname: elasticsearch
        - name: deb http://packages.elasticsearch.org/elasticsearch/1.3/debian stable main
        - file: /etc/apt/sources.list
        - key_url: http://packages.elasticsearch.org/GPG-KEY-elasticsearch
    pkg:
        - installed
    cmd.run:
        - name: bin/plugin -i elasticsearch/marvel/latest
        - cwd: /usr/share/elasticsearch/
        - require:
            - pkg: elasticsearch
    service:
        - running
        - require:
            - pkg: elasticsearch
            - cmd: elasticsearch


