<?php
ini_set('display_errors', 1);
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

// Debug: Log received data
error_log("Received data: " . $json);

// Extract user data with fallbacks
$user_email = isset($data['email']) ? trim($data['email']) : null;
$user_password = isset($data['password']) ? sha1(trim($data['password'])) : null;
$user_phone = isset($data['phone']) ? trim($data['phone']) : null;
$user_verify_code = isset($data['verifyCode']) ? trim($data['verifyCode']) : null;
$user_approve = 0;

// Validate required fields
if (empty($user_email) || empty($user_password) || empty($user_phone) || empty($user_verify_code)) {
    echo json_encode([
        'status' => false,
        'message' => 'Missing required fields',
        'debug' => [
            'email' => $user_email,
            'password' => !empty($user_password) ? 'provided' : 'missing',
            'phone' => $user_phone,
            'verifyCode' => $user_verify_code,
            'raw_data' => $data
        ]
    ]);
    exit;
}

// Check if user already exists
$statm = $con->prepare("SELECT * FROM users WHERE users_email=? AND users_phone=?");
$statm->execute(array($user_email, $user_phone));
$count = $statm->rowCount();

if ($count > 0) {
    echo json_encode([
        'status' => false,
        'message' => 'Email or phone already exists',
        'userData' => null
    ]);
} else {
    // Insert new user
    $table = "users";
    $insert_data = array(
        "users_email" => $user_email,
        "users_password" => $user_password,
        "users_phone" => $user_phone,
        "users_verify_code" => $user_verify_code,
        "users_approve" => $user_approve
    );
    
    $result = insertData($table, $insert_data);
    
    if ($result > 0) {
        // Success - return success response
        echo json_encode([
            'status' => true,
            'message' => 'User registered successfully',
            'userData' => [
                'email' => $user_email,
                'phone' => $user_phone,
                'verify_code' => $user_verify_code,
                'approved' => $user_approve,
                'created_at' => date('Y-m-d H:i:s')
            ]
        ]);
    } else {
        // Insert failed
        echo json_encode([
            'status' => false,
            'message' => 'Registration failed. Please try again.',
            'userData' => null
        ]);
    }
}
?>
