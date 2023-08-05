<!DOCTYPE html>
<html>
<head>
    <title>{{ $title }}</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 10vh;
            margin: 0;
            padding: 20px;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
    </style>
</head>
<body>
    
    <h1>Email verified successfully. </h1>
    <h3>Welcome to Shopping-Hub, {{ $name }}! {{ $message }}</h3>
</body>
</html>
