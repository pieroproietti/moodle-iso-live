DROP DATABASE moodle;

CREATE DATABASE moodle;

GRANT ALL PRIVILEGES ON moodle .* TO 'moodle'@'localhost' IDENTIFIED BY 'evolution';
FLUSH PRIVILEGES;
/q
