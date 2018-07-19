version: '2'
services:
  sc-service-lb:
    image: rancher/lb-service-haproxy:v0.9.1
    ports:
    - 80:80/tcp
    labels:
      io.rancher.container.agent.role: environmentAdmin,agent
      io.rancher.container.agent_service.drain_provider: 'true'
      io.rancher.container.create_agent: 'true'
  safeye-rms-sc-service:
    image: hub.safeway.com/micro-service/safeye-rms-sc-service:latest
    environment:
      TZ: Asia/Shanghai
    stdin_open: true
    volumes:
    - /logs
    tty: true
    labels:
      io.rancher.container.pull_image: always
      servicename: safeye-rms-sc-service
