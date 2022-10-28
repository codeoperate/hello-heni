resource "aws_iam_role" "lambda_iam" {
  name = "lambda_iam"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "hello_function" {
  function_name = var.lambda
  filename      = var.package
  role          = aws_iam_role.lambda_iam.arn
  handler       = "hello.lambda_handler"

  runtime = "python3.9"

  source_code_hash = filebase64sha256(var.package)
}

resource "aws_lambda_function_url" "call_hello_heni" {
    function_name = aws_lambda_function.hello_function.arn
    authorization_type = "NONE"
}