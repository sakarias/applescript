-- A Apple Script to get the songs/books I have
-- listened to today, and add them to Day One.
--
-- Needs to have "Day One CLI" installed
-- http://dayoneapp.com/tools/

set _toDaysDate to do shell script "date '+%Y.%m.%d'"

on SaR(sourceText, findText, replaceText)
	set {atid, AppleScript's text item delimiters} to {AppleScript's text item delimiters, findText}
	set tempText to text items of sourceText
	set AppleScript's text item delimiters to replaceText
	set sourceText to tempText as string
	set AppleScript's text item delimiters to atid
	return sourceText
end SaR

set _playList to "Today"

tell application "iTunes"
	set _trackCount to count tracks in playlist _playList
end tell

if _trackCount is not 0 then
	tell application "iTunes"
		set _trackNames to name of tracks in playlist _playList
	end tell
	if _trackNames is not equal to "" then
		set _trackName to SaR(_trackNames, ",", "
* ")
		do shell script "echo '## iTunes activity for " & _toDaysDate & ":

* " & _trackName & "' | /usr/local/bin/dayone new"
	end if
end if