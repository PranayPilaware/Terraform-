import shutil
import datetime
import os

def backup_file(source, destination):
    today=datetime.date.today()
    backup_filename = f"backup_{today}.zip"
    
   