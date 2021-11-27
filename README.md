# ft_server

This topic is intended to introduce you to system administration. It will make you aware of the importance of using scripts to automate your tasks. For that, you will discover the "docker" technology and use it to install a complete web server. This server will run multiples services: Wordpress, phpMyAdmin, and a SQL database.

• You must set up a web server with Nginx, in only one docker container. The container OS must be debian buster.

• Your web server must be able to run several services at the same time. The services
will be a WordPress website, phpMyAdmin and MySQL. You will need to make sure your SQL database works with the WordPress and phpMyAdmin.

• Your server should be able to use the SSL protocol.

• You will have to make sure that, depending on the url, your server redirects to the
correct website.
