-- A Apple Script to take the content
-- of the clipboard and add them into
-- a subfolder after todays date under
-- "folderName".

set toDaysDate to do shell script "date '+%Y.%m.%d'"
set toDaysTime to do shell script "date '+%H:%M:%S'"
set folderName to "eJ"
set c to "<pre style=\"font-family:Helvetica,sans-serif;\">" & Â
	(the clipboard as Unicode text) & "</pre>"

tell application "Notes"
	tell account "iCloud"
		if not (exists folder folderName) then
			make new folder with properties {name:folderName}
		end if
		tell folder folderName
			if not (exists folder toDaysDate) then
				make new folder with properties {name:toDaysDate}
			end if
			tell folder toDaysDate
				make new note with properties {name:toDaysTime, body:c}
			end tell
		end tell
	end tell
end tell
