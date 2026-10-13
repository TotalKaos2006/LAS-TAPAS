<?php

header('Content-Type: application/json; charset=utf-8');
header('Cache-Control: no-store');

$config = require __DIR__ . '/config.php';

try {
    $database = new PDO(
        "mysql:host={$config['host']};port={$config['port']};dbname={$config['database']};charset=utf8mb4",
        $config['username'],
        $config['password'],
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
        ]
    );

    $query = $database->query("
        SELECT id, tafel_nummer, opmerking, status, aangemaakt_op
        FROM bestellingen
        WHERE status <> 'klaar'
        ORDER BY aangemaakt_op, id
    ");

    $bestellingen = $query->fetchAll();

    $regels = $database->prepare("
        SELECT naam, aantal, soort
        FROM bestelregels
        WHERE bestelling_id = ?
        ORDER BY id
    ");

    foreach ($bestellingen as &$bestelling) {
        $regels->execute([$bestelling['id']]);
        $bestelling['items'] = $regels->fetchAll();
    }
    unset($bestelling);

    echo json_encode($bestellingen, JSON_UNESCAPED_UNICODE);

} catch (PDOException $fout) {
    http_response_code(500);
    echo json_encode([
        'error' => 'Bestellingen ophalen is niet gelukt.'
    ]);
}