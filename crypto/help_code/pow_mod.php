<?php

$m = 56;
$e = 55;
$n = 59;

// echo bcpowmod($m, $e, $n) . PHP_EOL;

$res = 1;

for ($i = 0; $i < $e; $i++)
    $res = ($res * $m) % $n;

echo $res . PHP_EOL;
