import clipboard

def get_text_from_clipboard():
    copied_text = clipboard.paste()
    return copied_text or "there was nothing on the clipboard"