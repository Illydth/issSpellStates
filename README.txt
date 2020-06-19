====================================
=     Illydth's Spell States       =
====================================
See "Why Illydth's Spell States" at the end of this document if you wonder what the capabiltiies of this library are
or why you should choose to use this in your campaign.

See "Pre-Alpha Information" for limitations of this pre-alpha build.



Quick Start:
==========================
TOKEN INSTALLATION PROCESS:
* Unpack the Illydth_SpellStates_v0.1.0.zip file.
* Open your Campaign
* Create a New Token Property Type: "issSpellStates"
* Add the following to the issSpellStates Campaign Properties:
	SpellList
	libversion
	____ILLYDTH_TOKEN_SPELLSTATES_PROPERTIES____
	spellBuffs
	spellDebuffs
* Copy the 3 Tokens (Lib_SpellStates.rptok, iimage_GreenBubbleCheck.rptok, image_RedBubbleX.rptok) 
  to the library map of your campaign.
* Open the Selection, GM and Campaign Windows.
* Click on "Lib:SpellStates" in your Library map.
* Copy the "DM States Toolbox" macro to your GM Window.
* Copy the "Spell Info" macro to your "Campaign" Window.
* Open "Edit -> Campaign Properties" and click the Import Button
* Import the "Lib_SpellStates.mtprops" file.
* Import the "spells_testing.mttable" file into your Campaign Tables.
* Rename the "spells_testing" table to "Spells"

CAMPAIGN INSTALLATION PROCESS:
* Open the "LibSpellStates_DEV.cmpgn" File.
* Open the GM Window.

NOTE: The Campaign Window includes updates for other Spell States (updated tokens, coloration of buttons, etc.).



Requirements:
==========================
This library / macro code uses the Dialog5/Frame5 functionality of MapTool, this means MapTool version 1.6 or above
is required for best use of this tool.  All development is being done with the concept that Dialog5/Frame5 is available
within the MapTool installation.  No effort will be made to maintain a backaward compatable (dialong/frame) version of
the tool.

THAT SAID:

For those using a MapTool version below 1.6, at least at this moment, you SHOULD be able to modify the 
"openStatesToolbox" macro in the "Spell States Toolbox" section of the Lib:SpellStates Library and change the 
"dialog5" call to "dialog", and open the "Spell Info" campaign button macro and change "frame5" to "frame".

This should change things back to HTML 3.2 from HTML5 support.  At this point in development, I don't think i'm using 
any specific HTML 5 functionality that would break if run through the Dialog/Frame compatability frame. 

That said, Frame/Dialog and Frame5/Dialog5 produce VERY different looking Frame boxes in Maptool, and all layout
is being done using the HTML5 versions of these dialogs, YMMV with regards to look and feel or even functionality if
you choose to use the Frame/Dialog versions.



Pre-Alpha Information:
=========================
This is a Pre-alpha (< 0.5.0) version of Illydth's SpellStates.  

The following functionality is available in this version of the Library (No additional functionality provided):
* DM States Toolbox (Fully Functional - Alpha Testing)

Other Limitations/Notes:
At this point there are only 23 spells implemented in the database for testing.  This is due to the modifications 
I'll need to make to each spell that is in the base Spells.json calculated from https://5e.tools/spells.html.  For
the moment, there is a set of spells that represent things like Long and Short Names and spells that provide buffs, 
debuffs, or none of the above.  There should be enough spells to fully test the Toolbox functionality.

Data Files:
I've included a data file for the limited Spells.json table.  "spells_core_modified.json" can be run through excel
to re-create the Spells Table with updates.  The following is the data structure for re-creation:

Base JSON Data Structure:

{   "Name": "Aid",   "Source": "PHB",   "Level": "2nd",   "Casting Time": "Action",   "Duration": "8 hours",   
"School": "Abjuration",   "Range": "30 feet",   "Components": "V, S, M (a tiny strip of white cloth)",   
"Classes": "Artificer, Artificer, Artificer (Revisited), Cleric, Paladin",   "Text": "Your spell bolsters your allies 
with toughness and resolve. Choose up to three creatures within range. Each target's hit point maximum and current hit 
points increase by 5 for the duration.",   "At Higher Levels": "At Higher Levels. When you cast this spell using a 
spell slot of 3rd level or higher, a target's hit points increase by an additional 5 for each slot level above 2nd."}

+ An additional set of information at the end:

{"Beneficial": 1, "Determental": 0, "State": ""}

Where:
* "Beneficial" is set to 1 if the spell sets a beneficial state (on the caster or a friendly NPC/PC)
* "Determental" is set to 1 if the spell sets a determental state (on the target of the spell)
* "State" is a listing of Campaign States that the spell sets.

For instance, if the party cast a spell called "asp's spit" which poisoned the target, the added JSON would look like
the following:

{"Beneficial": 0, "Determental": 1, "State": "Poisoned"}

For the "Aid" spell, which doesn't set a campaign state, "State" would be just "", this leaves the JSON Structure for 
the "Aid" spell as follows:

{   "Name": "Aid",   "Source": "PHB",   "Level": "2nd",   "Casting Time": "Action",   "Duration": "8 hours",   
"School": "Abjuration",   "Range": "30 feet",   "Components": "V, S, M (a tiny strip of white cloth)",   
"Classes": "Artificer, Artificer, Artificer (Revisited), Cleric, Paladin",   "Text": "Your spell bolsters your allies 
with toughness and resolve. Choose up to three creatures within range. Each target's hit point maximum and current hit 
points increase by 5 for the duration.",   "At Higher Levels": "At Higher Levels. When you cast this spell using a 
spell slot of 3rd level or higher, a target's hit points increase by an additional 5 for each slot level above 
2nd.", "Beneficial": 0, "Determental": 1, "State": "Poisoned"}



Installation (Full):
=========================
Unpack the ZIP file, it contains the following files:
* Lib_SpellStates.rptok
* image_GreenBubbleCheck.rptok
* image_RedBubbleX.rptok
* spells_testing.mttable
* README.txt (this file)

Open your Campaign File in MapTool.

Create a new Campaign "Token Properties" Group:
Edit -> Campaign Properties
Token Properties Tab:
	Group Name: issSpellStates
	Group Value:
		SpellList
		libversion
		____ILLYDTH_TOKEN_SPELLSTATES_PROPERTIES____
		spellBuffs
		spellDebuffs

Drag the 3 .rptok files to your campaign's "Library" map.

This should create the following tokens on your Maptool Library Map:
* Lib:SpellStates
* image:GreenBubbleCheck
* image:RedBubbleX

[The Image Files are Optional, if you do not add them to your campaign, you will get a "Y" or "N" (text) in place of
the green Check Mark or Red X.  This looks uglier, but is fully functional if you don't want the added Image Tokens.]

Click on the "Lib:SpellStates" token on your Library Map,
Open the "Selected", "GM" and "Campaign" Windows.
Drag "DM States Toolbox" to the "GM" Window (this really does not need to be modified by players)
Drag "Spell Info" to the "Campaign" Window

Import the spells_testing.mttable file.
Rename this table to "Spells"



Use:
=====================================
Illydth's Spell States provides two very common capabilities to a tabletop campaign:  Searching for and displaying
information related to a spell or ability and the capability of tracking the effects those abiltiies have on a target
token.  The Pre-Alpha version tracks a VERY LIMITED number of 5e spells, useful for testing. 


Function - Spell Info:
----------------------
This is a pretty simple dialog.  Click the "Spell Info" button on the campaign pannel to open an Input box 
allowing you to type the name of a spell.

If that spell is found in the Spells table, it and it's information will be displayed in a frame.

The "New Spell" link will reload the form and allow a different spell entry.


Function - DM States Toolbox:
------------------------------
Click the "DM States Toolbox" button to begin using the Spell States system.  This should be done by the DM or the person
responsible for setting and managing token states during the game.  The "Toolbox" is the place where you are pairing down
the hundreds of spells in D&D 5e (or whatever your game system of choice) to only those that you care about for your next
session (those your PCs have memorized, or those they cast frequently).

Finding Spells to Add to the Toolbox:
--------------------------------------
The initial toolbox frame has a single input box to search for spells.  This must be done by full name (no partial search), 
however the search IS case-insensitive, so "Fireball", "fireball" and "FiReBaLL" are all going to be found.  The system 
will go to the spells table and try to find a match for your spell name.  If it does, it will display the capabilites of 
that spell under the search box.  The Spell Name column should show the name of the found spell, and the 
Beneficial/Determental colums should show whether the spell sets a beneficial or determental state on the token.

If the spell sets netiher a beneficial nor determental state, it will show with a Red "X" (or the letter "N" if the X
and Check Mark tokens weren't added to the campaign) in both the Beneficial and Determental columns. You can see this by 
typing in "Fireball" (no quotes) into the search box and either hitting return or clicking "Search". The spell is found 
in the database and is shown with a Red X or "N" in both the Beneficial and Determental Columns.  This spell cannot be 
added to the Toolbox, it doesn't set an effect.

Otherwise if one of the columns is marked with a green check mark, the spell does set an effect that can be tracked, 
and the spell can be added to the Toolbox.  You can see this by typing "Aid" (no quotes) into the text box and either
hitting enter or clicking the "Search" box.  In this case a green check mark shows up under the "beneficial" column
since the spell "Aid" sets a beneficial effect on a token.  

Adding Spells to the Toolbox:
***     -------------     ***
To the left of the name "Aid" shows a "+" button, which will allow you to add the spell to the Toolbox by clicking 
this "+" button.

When "+" is clicked, a message in the Chat window shows up noting that the spell (and it's number) have been added to 
the Toolbox, and a button appears in the bottom part of the frame (under "States in Toolbox")...green if the spell sets
a beneficial effect and red if it sets a deteremental effect.  Add as many effects as makes sense, but don't overadd 
effects, adding a new effect to the toolbox is as easy as typing it's spell name into the search box and clicking the 
"+" button.  No need to track more than you think you need!

Add the "Bless" and "Stoneskin" spells to the toolbox as well so that "Aid", "Bless", and "Stoneskin" show up.  
Note that the buttons will shift into a 5 column table arrangement as you add additional states.

Removing Spells from the Toolbox:
***     ------------------    ***
There are two ways to get rid of states in the toolbox.  The first is to simply click it's button down in the "States
in Toolbox" area. Clicking any of the buttons in that section of the Toolbox will cause it to be removed from the 
Toolbox.  Mousing over a button will cause it to be highlighted (drop-shadowed) so you can see which state you're
removing, and then clicking the button will cause it to disappear from the form, meaning the state is no longer in
the toolbox.

Click the "Aid" button now to remove it from the Toolbox.

Clearing the Toolbox:
***    -------    ***
If you wish to clear out the Toolbox completely and start over again, click the "Clear Toolbox" link.

A form will pop up showing you what spells are in the Toolbox and asking you to check a box to confirm that you want
to clear out the Toolbox's information.  Clicking "Cancel", Closing the Window or simply not checking the box and
clicking "Ok" will maintain the Toolbox's current state, not deleting anything.  However if you check the check box
and click "Ok" it will clear the Toolbox's stored data and reset the Toolbox back to empty.



Why Illydth's Spell States?:
==================================
Introduction:
This is a "spell states" management system for D&D 5e...and by extension any RPG that has abilties that set effects 
on PCs or NPCs.

The Problem...

The problem with 5e (though not unique to 5e...it's a problem with Pathfinder, GURPS, or, indeed, most tabletop systems) 
is that 5th edition has almost 500 spells at the time this was developed, and a signficiant quantity of them set 
some kind of state on a character, from Mage Armor and Stoneskin to Hex and Banishment.  All of these states are 
important for the DM and players to keep track of.  Unfortunately, even with a 3x3 grid and other tools that MapTool
has to manage "states" a sufficiently powerful and prepared spellcaster a couple of rounds into combat will have more
"states" on them than MapTool is currently capable of displaying on the character token, as well, while there are hundreds
of spell states that a character has access to, any one campaign will only tend to use a small handful of them.  

For instance, a campaign with a Warlock as a player character will almost definately use Hex, a campaign without a
Warlock will likely not.  A campign with a Ranger in it will likely use Hunter's Mark, without a Ranger?  Probably 
not.  

Does this ring a bell with any of you DMs out there?  Your Wizard finishes delving a dungeon only to find a new 
spell scroll which they spend their next long rest scribing to their spellbook and then decide to use on the next 
section of the adventure?  So now they say "I'd like to cast ..." and you realize, you have no state available to
track the use of that spell.  Worse, because it is a new spell none of you are familiar with in the campaign it's 
easy to forget.  So till you can get in and manage this new state (find an icon that makes sense, add the state to
your campaign, create macros to set/remove the state, etc.) you use one of the already current states in the 
campaign as a "placeholder" state, which 2 more rounds into combat, gets used for it's original intent and now you 
have to go back and find a different placeholder state for the new spell and figure out which tokens have what states 
on them...all by little icons...

Definately less than ideal.  The default method MapTool uses to handle states like this is pretty limited, and 
generally leaves DMs with a plethora of bad choices with no really good alternatives.

* Do you load every one of the hundreds of different states into your campaign in the case that someone will use one
	of them?  Of course this opens you up to "state bloat" with hundreds of macros on the characters or campaign 
	pannel that are never used to set/remove these states on the off chance someone eventually chooses to use one.  
	Then there's the problem of having to find unique icons for each and every state and having to get hundreds of 
	states even loaded in and setup in your campaign.

* Do you leave out the majority of spell states hoping that the less popular ones won't be used and thus you don't have
	"state bloat" in your campaign?  What happens when your Warrior decides to Multi-class into Warlock in the middle
	of a session and chooses "hex" for one of his spells, which isn't a state in the campaign?
	
* Do you try to manage states between sessions, adding new states and removing states between play sessions as spells
	fall in and out of favor with your party in an effort to manage bloat but yet make states available for tracking?
	Wouldn't this time be better spent preparing for the next part of the campaign?
	
* Do you try to add states on the fly during game play?  As a player uses a new spell do you pause combat with "hang
	on! I need to get a state added for that!" going through your library of icons to try to find one that even makes
	sense while your characters are waiting on their turns?
	
Most DMs seem to go for limiting the number of campaign states and then tracking things using placeholders or manual
notes or some form of "well, I don't have a state so we'll just set something and hope I remmeber it while combat is
going!" methodology.  This makes sense, after all, 5th Edition implements 19 default conditions (blind, charmed, 
concentrating, unconscious, dead, etc.), 6 Exhaustion States and 4 types of "cover" (none - full) all before taking 
into account general tracking things like advantage/disadvantage, damage resistance and immunity, inspiration, raging, 
shapechange (both beneficial and determental) and a host of other general conditions that cover abilities and spells.

Just implementing the default major conditions and states creates somewhere in the neighborhood of 40+ campaign states
and that takes into account almost no spells.  That means 40+ macros on the Campaign window to set those states, and
40+ icons that could appear in places on the token identifying things.  "There's an icon of a guy with an open mouth, 
is that feared or silenced?...And that blue dot in the right corner, is that concentration or inspiration?  Damn..."

How do we manage this much information on a character?

The Answer...

Illydth's Spell States (you knew this was going to be the answer, of course it was).  I've gone through every spell
in 5th Edition (all officially published materials) and created a table of spells useable both for lookup and (more
importantly) for identifying spells that set some kind of condition on a PC or NPC during the game.  These spells
have been broken down to two types:  buffs, and debuffs, or spells that set a beneficial effect and spells that set
a determental effect on a PC or NPC.

I've then created a system whereby the DM can quickly and efficiently add spell states to the system (through a tool
I call the "DM States Toolbox") and then use that toolbox to track states on tokens.  Using a small set of generic
icons (such as Buff, Debuff, Disabled, Immunity, Resistance, etc.) we set a visual state that represents a warning to
players and the DM that there's an effect set on the token, and then a way to "get info" on that token so that all of 
the states can be displayed and investigated (if needed).  For small combats or small numbers of buffs, just the general
"buff", "debuff", "disabled", etc. states are useful for generically tracking effects.  However the power in the system
is that beyond these general states (which ARE campaign states), we can store an unlimited number of other effects on 
the token that can then be displayed through an interface which can then also be linked back to the original spell.

This gives DMs an ability to investigate effects on a token in a multi-layered approach.  If by looking at the token the
"debuffed" effect icon triggers the DM's memory that the token is "hexed", and the DM remembers what that effect does, 
there's nothing more than needs to be done.  Just the "debuffed" icon is enough.  If, however, more information is 
needed, the DM (or players!) can select the token and check it's current state through an interface that will show all 
of the effects (buffs, debuffs, conditions, etc.) on the token.  So now, the DM can see that the "debuffed" effect icon 
is referencing the spell state "Hexed".  Again, if the DM is familiar with that condition no further information is
needed.  However, if the DM wants to see exactly what that state is referencing, the interface will allow the DM to
simply click a link and pull up the information about the spell that caused that state directly.

Because we can set an unlimited number of effects on a token, we're not limited to 9 icons or missing the fact that
a token is affected by something, or reusing states/effects/icons for things that they really don't pertain to.  
Because the DM has access to every effect causing capability in the game, there's no "mad dash" to add something 
new to an in-progress session, or to "placeholder" an effect becuase one doesn't exist for that spell or ability.
Because we're tracking EVERY effect and can link it back to it's source, we have the capability of providing every
bit of information needed in a quick and efficient manor when a question comes up as to how that state affects
gameplay.  And because of the "toolbox" methodology, adding and removing states becomes easy enough that there's no
reason for a DM to have to manage more than what pertains to this session!  A state no longer needed?  Delete it!
A new state being used?  Add it!  It only takes seconds to manage the toolbox.

Don't know what needs tracked and what doesn't?  That's easy enough as well.  All of the work into determining what does
and doesn't set effects has already been done.  Not sure if "Fireball" sets an effect on a token?  Go into the toolbox and
try to add it.  If it shows as either providing a beneficial or determental effect, it can be added to the toolbox!

When you go to apply an effect to a token, the effects are helpfully color coded (Green = Good, Red = Bad!) so that a DM
need not know what the effect being applied is, the color coding tells the DM who to apply it to (an Enemy NPC or a
friendly PC).  

Finally, everything is driven by an easily modified table in MapTool.  Everything is stored in JSON Format which can be
easily modified by any DM.  Did I miss something?  Have a homebrew ability or spell that isn't in the Spells table?  Is
a spell listed as Determental when it should be listed as Beneficial?  Fixing it is as easy as modifying a piece of data
in a JSON object (which is MUCH easier than it sounds since JSON is just a fancy text format).

The system is ultimately extendable to any tabletop RPG that sets and removes effects on a token because it has been
designed to be generic.  Replace the 5e version of the "Spells" table with a Pathfinder 2e version of that table and the 
system is now tuned for Pathfinder.  Not playing D&D or D20?  Modify the table for your games spells and abilities and 
it should STILL work.



Support Expectations:
============================
I've run a widely available open source project in my past lifetime and the one thing I learned from that 
project was that support can be a full time job.  I have a full time job and really can't afford to make Illydth's 
Spell States my next one.  While I am as dedicated as any creator with regards to his or her creations, I also have 
limited time available to me.  

I will try to answer questions regarding the tool, installation, or anything else related to this.  I'm more than
happy to take suggestions and constructive feedback on how to make the tool better.  Contributions back to the project
(such as bug fixes, WORKING code samples doing things in a better way, etc.) are more than appricated and will get you
a likely "Thank You" at the end of this document.  I maintain a "backlog" list of changes and suggestions that I find
useful and want to implement in the future, however I make no guarantees that your suggestion will reach that backlog.  
I also do not guarantee anything in the backlog will ever make it into the tool, nor the timing by which that will
happen.  Any requests for "any idea how long it'll be before..." will likely be answered with "whenever it happens, if 
it happens".  I'm not trying to be the south bound end of a north bound horse, it's just that I have a life and don't 
plan to make this project too significant a part of it.

Also, I maintain creative control over this code.  If you do not like how something is done or have problems with the
way it's being done, or if you feel you need something changed that I'm just not doing, you are MORE than welcome to
take this code and modify it to your needs.  I'm happy to (as opportunity provides) answer questions on how I did
something so you can modify it.  The only thing I'd ask is if you do use this code as a starter for your own project
to please let me know, and to provide an acknowledgement to that fact.

All this said, this entire set of functionality is being provided "as is" in the hopes that it helps DMs better run their
campaigns through MapTool.  While I do not take responsibility for any destroyed campaigns, or other problems caused by my 
code, this system was first, and foremost, designed for MY use in MY own personal campains.  I assure everyone I am using 
my own system, so if you've discovered something that broke your campaign, you can probably take comfort in the fact that 
I likely destroyed my own right beside yours.

Despite how the above might read, I am a colaborative person.  Don't hesitate to reach out with questions or comments, 
just don't be offended if I don't immediately respond.  I'd prefer an "@" on the MapTool discord or a resposne to a
thread on the MapTool forms to a Direct Message (on either platform) simply because I use both tools for things other
than answering questions.



Acknowledgements:
======================
No significant development effort is done "in a silo" and this effort was on the backs of giants larger than myself.

Melek:  First, and foremost, I want to thank "Melek" for the Simple5e Framework and continued support through this 
project.  From questions, ideas, brainstorming sessions, and many "how the hell does this work?!?!?!" frustrations a plenty
Melek has been exceptionally kind and patient with me as I've delved into this project.

rogue_ronin: Secondly, I need to throw a HUGE thank you out to rogue_ronin who's icons are at the very heart of this 
states system.  With nothing more than a simple request rogue spent a significant amount of time and effort to build a
set of icons that became a bit of the centerpiece of this project.  I do not have these skills and without these, this
project wouldn't be what it is.  I'd also like to thank rogue for NOT tracking me down with a pitchfork and torch, even
after the third "hey, could you re-make this icon for me in this minorly changed way?" request I made. :)

KellyENDER: Next, a big thanks to KellyENDER for development of the original spells table, reducing my once unheard of
hours of mind numbing work trying to get all the 5e Spells into a proper format to 20 seconds of "Import table", and 
then going farther to teach a guy to fish by showing me how to create my own copy of that thing in like 5 minutes.  Also
a significant portion of the initial development on "Spell Info" was done by KellyENDER which was also a great starting
point for the functionality in this project.

Jason_c_o:  Also a shout out to Jason_c_o who did some great work with the layout of Spell Info and the underlying HTML
on the 5e data table itself.

And, finally, a shout out to all of those on the MapTool Discord Server, especially Wolph42, aliasmask, Phergus, Reverend, 
and rogue_ronin, for your continued answering of my often silly questions about how Maptool works and how to get effect X
out of the uber powerful, fairly well documented, and yet fiddly macro language.