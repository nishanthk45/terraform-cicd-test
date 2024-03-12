import json 

def foo():
    """
    Returns a JSON string with a key-value pair.

    Returns:
        str: JSON string
    """
    return json.dumps({'foo': 'bar'})