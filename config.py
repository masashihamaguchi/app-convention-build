import plistlib
import csv
import os
from dotenv import load_dotenv

load_dotenv()

def main():

    # road plist.sample
    TEAM_ID = os.getenv('TEAM_ID')
    PROVISIONING_PROFILE = os.getenv('PROVISIONING_PROFILE')

    with open('config/ExportOptions.plist.sample', 'rb') as file:
        plist = plistlib.load(file)

    plist['teamID'] = TEAM_ID

    with open('config/AppIDs.csv', 'r') as file:
        apps = csv.DictReader(file)
        for row in apps:
            key = list(row.keys())[0]
            plist['provisioningProfiles'][row[key]] = PROVISIONING_PROFILE

    with open('config/ExportOptions.plist', 'wb') as file:
        plistlib.dump(plist, file)

if __name__ == '__main__':
    main()
