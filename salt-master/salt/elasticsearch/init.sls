default-jre:
    pkg:
        - installed
elasticsearch:
    pkgrepo.managed:
        - humanname: elasticsearch
        - name: deb http://packages.elasticsearch.org/elasticsearch/1.3/debian stable main
        - file: /etc/apt/sources.list
        - key_url: http://packages.elasticsearch.org/GPG-KEY-elasticsearch
    pkg:
        - installed
        - require:
            - pkgrepo: elasticsearch

    {% if not salt['file.directory_exists']('/usr/share/elasticsearch/plugins/marvel') %}
    cmd.run:
        - name: bin/plugin -i elasticsearch/marvel/latest
        - cwd: /usr/share/elasticsearch/
        - require_in:
            - service: elasticsearch
    {% endif %}

    service:
        - running
        - require:
            - pkg: elasticsearch
