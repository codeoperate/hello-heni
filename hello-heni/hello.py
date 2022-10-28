"""
This is a heni challenge answer: hello
"""
import json

def lambda_handler(event, context):
    """
    This is the entry point for the lambda
    """
    print("Received event: " + json.dumps(event, indent=2))
    print(f"Memory limit MB for lambda: {context.memory_limit_in_mb}")
    return "Hello"
