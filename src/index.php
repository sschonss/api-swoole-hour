<?php

$http = new Swoole\Http\Server("0.0.0.0", 9501);

$http->on('request', function ($request, $response) {
    $response->header("Content-Type", "application/json");
    $response->end(json_encode(['hora_atual' => date('Y-m-d H:i:s')]));
});

$http->start();
