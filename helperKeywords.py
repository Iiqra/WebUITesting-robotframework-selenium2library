import clipboard
from datetime import datetime
import os, shutil

def get_text_from_clipboard():
    copied_text = clipboard.paste()
    return copied_text or "there was nothing on the clipboard"



# def backup_existing_reports():
#     folder_name = datetime.now().replace(second=0, microsecond=0)
#     folder_path = "logs/" +  str(folder_name)
#     print(folder_path)
#     if not os.path.exists(folder_path):
#         os.makedirs(folder_path)
#     src = './'
#     dst = './logs/' + folder_name
#     shutil.move(os.path.join(src, 'log.html'), os.path.join(dst, 'log.html'))
#     #shutil.move(os.path.join(src, 'report.html'), os.path.join(dst, 'report.html'))