<?php
ini_set('display_errors', 0); // Hide HTML errors
error_reporting(E_ALL);

// Set CORS headers for Flutter app
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

// Handle preflight requests
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    exit(0);
}

include "../connect.php";

// Get JSON data from Flutter app
$json = file_get_contents('php://input');
$data = json_decode($json, true);

// Debug: Log everything to see what Flutter is sending
file_put_contents('signup_debug.log', "=== NEW REQUEST ===\n", FILE_APPEND);
file_put_contents('signup_debug.log', "Raw JSON: " . $json . "\n", FILE_APPEND);
file_put_contents('signup_debug.log', "Decoded Data: " . print_r($data, true) . "\n", FILE_APPEND);

// Try different ways to extract data
$user_email = null;
$user_password = null;
$user_phone = null;
$user_verify_code = null;

// Method 1: Direct from JSON
if (isset($data['email'])) {
    $user_email = trim($data['email']);
}
if (isset($data['password'])) {
    $user_password = sha1(trim($data['password']));
}
if (isset($data['phone'])) {
    $user_phone = trim($data['phone']);
}
if (isset($data['verifyCode'])) {
    $user_verify_code = trim($data['verifyCode']);
}

// Method 2: If still null, try alternative field names
if ($user_email === null && isset($data['users_email'])) {
    $user_email = trim($data['users_email']);
}
if ($user_phone === null && isset($data['users_phone'])) {
    $user_phone = trim($data['users_phone']);
}

$user_approve = 0;
$now = date('Y-m-d H:i:s');

// Debug: Log extracted values
file_put_contents('signup_debug.log', "Extracted: email=$user_email, phone=$user_phone, verifyCode=$user_verify_code\n", FILE_APPEND);

// Validate required fields
if (empty($user_email) || empty($user_password) || empty($user_phone) || empty($user_verify_code)) {
    echo json_encode([
        'status' => false,
        'message' => 'Missing required fields',
        'debug' => [
            'email' => $user_email,
            'password' => !empty($user_password),
            'phone' => $user_phone,
            'verifyCode' => $user_verify_code,
            'raw_json' => $json
        ]
    ]);
    exit;
}

try {
    // Check if user already exists
    $email_check = $con->prepare("SELECT * FROM users WHERE users_email = ?");
    $email_check->execute(array($user_email));
    $email_count = $email_check->rowCount();
    
    if ($email_count > 0) {
        echo json_encode([
            'status' => false,
            'message' => 'Email already exists',
            'userData' => null
        ]);
        exit;
    }
    
    $phone_check = $con->prepare("SELECT * FROM users WHERE users_phone = ?");
    $phone_check->execute(array($user_phone));
    $phone_count = $phone_check->rowCount();
    
    if ($phone_count > 0) {
        echo json_encode([
            'status' => false,
            'message' => 'Phone already exists',
            'userData' => null
        ]);
        exit;
    }
    
    // Insert new user
    $insert_sql = "INSERT INTO users (users_email, users_password, users_phone, users_verify_code, users_approve, users_created_at) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $con->prepare($insert_sql);
    $result = $stmt->execute(array(
        $user_email,
        $user_password,
        $user_phone,
        $user_verify_code,
        $user_approve,
        $now
    ));
    
    if ($result) {
        $user_id = $con->lastInsertId();
        
        // Success - return success response
        echo json_encode([
            'status' => true,
            'message' => 'User registered successfully',
            'userData' => [
                'id' => $user_id,
                'email' => $user_email,
                'phone' => $user_phone,
                'verify_code' => $user_verify_code,
                'approved' => $user_approve,
                'created_at' => $now
            ]
        ]);
    } else {
        echo json_encode([
            'status' => false,
            'message' => 'Registration failed. Please try again.',
            'userData' => null
        ]);
    }
    
} catch (Exception $e) {
    echo json_encode([
        'status' => false,
        'message' => 'Database error: ' . $e->getMessage(),
        'userData' => null
    ]);
}
?>
