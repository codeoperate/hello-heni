import json

def lambda_handler(event, context):
    """
    This is the entry point for the lambda
    """
    print("Received event: " + json.dumps(event, indent=2))
    return "Hello"
