version: '2'
volumes:
  filebeat-config:
    external: true
    driver: rancher-nfs
services:
  filebeat-test:
    privileged: true
    image: prima/filebeat:6.2.3
    environment:
      TZ: Asia/Shanghai
    volumes:
    - filebeat-config:/var
    - /var/lib/docker/volumes:/var/lib/docker/volumes:ro
    tty: true
    command:
    - -e
    - -c
    - /var/filebeat.yml
    labels:
      servicename: filebeat
  filebeat:
    privileged: true
    image: prima/filebeat:6.2.3
    environment:
      TZ: Asia/Shanghai
    volumes:
    - filebeat-config:/var
    - /var/lib/docker/volumes:/var/lib/docker/volumes:ro
    tty: true
    command:
    - -e
    - -c
    - /var/filebeat.yml
    labels:
      servicename: filebeat