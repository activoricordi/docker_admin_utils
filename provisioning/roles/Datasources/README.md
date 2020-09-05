# Postgres Role

## Install Postgres

## Install pgAdmin4

### Reverse Proxy Setup

The pgAdmin server requests could go through a single secure port.

If you have multiple services running on Docker with different ports, you have to open ports in your firewall and you have to access the services via different ports in the browser. To have one access port (port 80 or 443) you can use a reverse proxy.

In our case we used NGINX to redirect the access to  PgAdmin4 (PostgreSQL Admin Tool) so that we can access both services on the same port (443) in the browser with different base paths: [http://localhost/pgadmin](http://localhost/pgadmin).

It is possible to add additional services to the NGIX server.

## References

* [Ansible Docker Postgres](https://github.com/levonet/ansible-docker-postgres)
