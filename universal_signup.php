<?php
ini_set('display_errors', 0);
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

// Extract user data
$user_email = isset($data['email']) ? trim($data['email']) : null;
$user_password = isset($data['password']) ? sha1(trim($data['password'])) : null;
$user_phone = isset($data['phone']) ? trim($data['phone']) : null;
$user_verify_code = isset($data['verifyCode']) ? trim($data['verifyCode']) : null;

// Debug: Log what we receive
file_put_contents('debug_signup.log', "Received JSON: " . $json . "\n", FILE_APPEND);
file_put_contents('debug_signup.log', "Extracted: email=$user_email, phone=$user_phone, verifyCode=$user_verify_code\n", FILE_APPEND);

// Validate required fields
if (empty($user_email) || empty($user_password) || empty($user_phone) || empty($user_verify_code)) {
    echo json_encode([
        'status' => false,
        'message' => 'Missing required fields',
        'debug' => [
            'email' => $user_email,
            'phone' => $user_phone,
            'verifyCode' => $user_verify_code,
            'raw_json' => $json
        ]
    ]);
    exit;
}

try {
    // First, let's see what columns exist in your users table
    $columns_query = $con->prepare("DESCRIBE users");
    $columns_query->execute();
    $columns = $columns_query->fetchAll(PDO::FETCH_COLUMN);
    
    file_put_contents('debug_signup.log', "Database columns: " . implode(', ', $columns) . "\n", FILE_APPEND);
    
    // Build INSERT query dynamically based on available columns
    $insert_columns = [];
    $insert_values = [];
    $insert_params = [];
    
    // Check what columns we can insert into
    if (in_array('users_email', $columns)) {
        $insert_columns[] = 'users_email';
        $insert_values[] = '?';
        $insert_params[] = $user_email;
    }
    
    if (in_array('users_password', $columns)) {
        $insert_columns[] = 'users_password';
        $insert_values[] = '?';
        $insert_params[] = $user_password;
    }
    
    if (in_array('users_phone', $columns)) {
        $insert_columns[] = 'users_phone';
        $insert_values[] = '?';
        $insert_params[] = $user_phone;
    }
    
    if (in_array('users_verify_code', $columns)) {
        $insert_columns[] = 'users_verify_code';
        $insert_values[] = '?';
        $insert_params[] = $user_verify_code;
    }
    
    if (in_array('users_approve', $columns)) {
        $insert_columns[] = 'users_approve';
        $insert_values[] = '?';
        $insert_params[] = 0;
    }
    
    if (in_array('users_created_at', $columns)) {
        $insert_columns[] = 'users_created_at';
        $insert_values[] = '?';
        $insert_params[] = date('Y-m-d H:i:s');
    }
    
    // Build the final query
    if (!empty($insert_columns)) {
        $sql = "INSERT INTO users (" . implode(', ', $insert_columns) . ") VALUES (" . implode(', ', $insert_values) . ")";
        
        file_put_contents('debug_signup.log', "SQL: " . $sql . "\n", FILE_APPEND);
        file_put_contents('debug_signup.log', "Params: " . print_r($insert_params, true) . "\n", FILE_APPEND);
        
        $stmt = $con->prepare($sql);
        $result = $stmt->execute($insert_params);
        
        if ($result) {
            echo json_encode([
                'status' => true,
                'message' => 'User registered successfully',
                'userData' => [
                    'email' => $user_email,
                    'phone' => $user_phone,
                    'verify_code' => $user_verify_code,
                    'created_at' => date('Y-m-d H:i:s')
                ]
            ]);
        } else {
            echo json_encode([
                'status' => false,
                'message' => 'Registration failed',
                'userData' => null
            ]);
        }
    } else {
        echo json_encode([
            'status' => false,
            'message' => 'No valid columns found in users table',
            'userData' => null
        ]);
    }
    
} catch (Exception $e) {
    echo json_encode([
        'status' => false,
        'message' => 'Error: ' . $e->getMessage(),
        'userData' => null
    ]);
}
?>
