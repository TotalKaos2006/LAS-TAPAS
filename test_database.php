<?php

$config = require __DIR__ . '/config.php';

try {
    $database = new PDO(
        "mysql:host={$config['host']};port={$config['port']};dbname={$config['database']};charset=utf8mb4",
        $config['username'],
        $config['password'],
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );

    echo 'Databaseverbinding gelukt!';
} catch (PDOException $fout) {
    echo 'Databaseverbinding mislukt. Controleer config.php en of MySQL draait.';
}