<?php
$dbsettings['engine'] = getenv('DB_ENGINE') ?: 'pdo_pgsql';
$dbsettings['host'] = getenv('DB_HOST') ?: 'postgres';
$dbsettings['dbname'] = getenv('DB_NAME') ?: 'spotweb';
$dbsettings['user'] = getenv('DB_USER') ?: 'spotweb';
$dbsettings['pass'] = getenv('DB_PASS') ?: 'spotweb';
