<?php

$to      = 'wesley@cloudstorm.academy';
$subject = 'the subject';
$message = 'hello';
$headers = 'From: wesley@cloudstorm.academy' . "\r\n" .
    'X-Mailer: PHP/' . phpversion();

mail($to, $subject, $message, $headers);