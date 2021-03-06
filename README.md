# issSpellStates
A MapTool Drop-In Spell/Effects States System

*NOTE: Out of the box, as of the point this is being published, this states system supports D&D 5th Edition.  There
are no abllities/spells tables created for other systems.  If you'd like to translate this states system to other
RPGs besidse 5e, it's not a difficult task, especially if your RPG has an SRD or other digital method of obtaining
your system's spells and abilties.  No programming in maptool or otherwise is required to complete this translation.
If you ARE interested in contributing a system to this framework, please don't hesitate to contact me by Discord
Private Message, on the Maptool Discord or drop an issue here.*  

----
## What is issSpellStates?
issSpellStates or Illydth's Spell States, is a MapTool drop-in framework for managing Tabletop Spell and Effects 
states without having to create Campaign Properties states to manage them.  While by default this drop-in is 
setup for D&D 5th Edition (5e) it is a generic framework that can be used (with some work) for any MapTool RPG
Framework that needs to keep track of spells and effects on PC and NPC tokens during game play.

The problem with most tabletop RPG Systems is that they almost all have a huge number of spells and abilities and a
signficiant quantity of them set some kind of state on a character, from Mage Armor and Stoneskin to Hex and Banishment.  
All of these states are important for the DM and players to keep track of.  Unfortunately, even with a 3x3 grid and 
other tools that MapTool has to manage "states", a sufficiently powerful and prepared spellcaster a couple of rounds 
into combat will have more "states" on them than MapTool is currently capable of displaying on the character token.

Then, there's campaign state bloat.  Just implementing the default major conditions and states in 5e creates somewhere 
in the neighborhood of 40+ campaign states and that takes into account almost no spells.  That means 40+ macros on the 
Campaign window to set those states, and 40+ icons that could appear in places on the token identifying things.  
"There's an icon of a guy with an open mouth, is that feared or silenced?...And that blue dot in the right corner, is 
that concentration or inspiration?  Hum..."

How do we manage this much information on a small token?

I've created a system whereby the DM can quickly and efficiently add spell states to the system (through a tool
I call the "DM States Toolbox") and then use that toolbox to track states on tokens.  Using a small set of generic
icons (such as Buff, Debuff, Disabled, Immunity, Resistance, etc.) we set a visual state that represents a warning to
players and the DM that there's an effect set on the token, and then a way to "get info" on that token so that all of 
the states can be displayed and investigated (if needed).  The power in the system is that beyond these general states
(which ARE campaign states), we can store an unlimited number of other effects on the token that can then be displayed 
through an interface which can then also be linked back to the original spell.

----
## Installation and Use
A longer/more detailed version of these installation instructions are found in the User_Manual.txt file, shipped with
the release and available here on this GitHub archive.  Please see that document for more information on installation
and use.

#### Installing into Your Own Campaign
* Get the release distribution from the releases area, or download this GIT archive and use the 
individual pieces in your campaign.
* Modify the Campaign Properties to add the issSpellStates Properties to the Campaign.
* Modify the Campaign Properties to add the Character Properties to the base Token Properties.
* Copy the Three .rptok files into your Library Map in your campaign.
* Open the Selection, GM and Campaign Windows and copy the 4 main buttons into the apporpriate
areas of your campaign.  
* Import the Appropriate RPG abilities table into your campaign's Maptool Tables.
* And set the various campaign states needed by the Spells and Abilities in your RPGs table.

#### Using the Included Campaign File
You can use the included campaign file (issSpellStates_Base.cmpgn) to build your own campaign off of this framework.
The campaign file has all the needed states, properties and buttons setup and ready to go for issSpellStates to work.


### Additional Available Assets and Integrations
The release files include several additional binaries not included in the GIT archive for issSpellStates.  These additional
binaries are icon packs and additional campaign files to make it easy to install or setup issSpellStates in the same way
as the distributed campaign file has it.

#### Campaign Files
Additional campaign files include:
* Meleks_Simple_5e_{version}_SpellStates.cmpgn.zip
* Not-So-Simple5e_{version}.cmpgn.zip

The first file is a campaign file for *Melek's Simple 5e* D&D 5th Edition Framework (Latest Version), modified to include 
issSpellStates in a fully setup and functional form (including Campaign States with updated Icons and Properites).  This
.cmpgn file is identical to the released *Simple 5e* campaign file except for the setup of issSpellStates already completed.

If you like the simplicity of *Melek's Simple 5e* framework and are looking to maintain that, but want to include my Spell 
States functionality this is a great place to start.  This is where you should start if you're looking to "build up" your
campaign with addons as you find you need them.

The second set of files is what i'm now referring to as "Not-So-Simple5e", see the sub-section on that below.

#### Icon Assets for Campaign States
Included in the Releases Section is a grouping of icon assets by rogue_ronan from the Maptool Discord that were developed 
explicitly to work with issSpellStates.  While any state icons are usable to fulfil the needed Campaign States for this
framework, I suggest checking out the downloadable zip file of rogue_ronan's work. His icons are very coherent (even
at small sizes) and all have a similar "look and feel" to them that I think creates a visually appealing and easy to 
understand set of effects on a token.  You can check them out by downloading and opening the issSpellStates_Base.cmpgn 
file as they are already implemented in it.


### Using issSpellStates
Illydth's Spell States provides two very common capabilities to a tabletop campaign:  Searching for and displaying
information related to a spell or ability and the capability of tracking the effects those abiltiies have on a target
token.

The User_Manual.txt file has a full breakdown of usage for all parts of issSpellStates and the "Using_issSpellStates_by_Example.txt"
document includes a full "by example" walkthrough of how to use the system to it's fullest capabilities.

At a high level, however, here are the basics:
* Open the "DM States Toolbox"
* Use the Search Button to find Spells/Abilities in your RPGs database 
* Add those Spells/Abilities to the DM States Toolbox.
* Open the States Management Frame (docking it and the spell lookup frame together is VERY helpful)
* Click a Token or set of tokens, and start applying states!
* Use the "Get Token Info" button to see the current state of a token in your game.

----
## Integrating issSpellStates with your Campaign or Framework

issSpellStates includes a grouping of "API" Macros intended to be used by Framework creators and Campagin Designers/DMs to 
integrate their Frameworks and Campaigns with the capabilities of issSpellStates.  By adding the issSpellStates API macros
as calls into your campaign/framework's already created buttons and macros, you can cause issSpellStates to seemlessly
integrate with your existing code.

Already have a button to cast "Bless"?  Add a call to "iss.addEffectToToken" and pass "Bless" to it and your bless button
will now set a trackable Bless "Spell State" on the selected Token or Tokens.

Have a custom Initative tracking Macro that does things during combat rounds?  Add a call to iss.decrementSpellDuration to 
count down all the effects on the selected tokens so you can accurately track when a spell effect stops affecting a target.

See the User_Manual.txt file for a listing of all APIs and their effects.

----
## Documentation and Opening Issues

If you have any questions or are seeing any problems while using the system, please consider looking through the relevant
information in the User_Manual.txt file.  Many questions are answered there and much of the information is laid out such
that there's no need to read the whole manual just to find an answer to your single question.  

Also, if you have any questions on usage, the "Using_issSpellStates_by_Example.txt" file is full walkthrough using the
campaign file that should take you step by step through every feature the framework provides.  

That said, if you do have a problem, feel free to open an issue on the framework here on GitHub.  There is a "support
expectations" section of the User_Manual.txt file you should be aware of (namely, this isn't my full time job so please
do not expect immediate or even timely support for issue tickets raised).  I will do the best I can to look at it and
get things worked out.  If you have suggestions on ways to make the framework better or contributions back to the 
framework, don't hesitate to get in contact with me or open an issue.

Finally (as mentioned at the beginning of this Readme) if anyone would like to extend this system to other platforms 
(Pathfinder, Starfinder, Random RPG01, etc.) don't hesitate to let me know.  I would be happy to hop on discord with you
and start you off on the right foot for how to make things easy for yourself when doing it.

----
## Not-So-Simple5e

As of the 1.0.1 release of issSpellStates, i'm beginning to publish a framework campaign file I call "Not-So-Simple5e" which
is a tongue-in-cheek name for a campaign file baseed off of Melek's Simple5e 5th Edition Framework that I have "polluted"
with pretty much every addon intended to work with Simple5e.  

Melek's framework is intended to be light-weight and easy to hack into and modify, leaving out Lib:Tokens and many of the 
complexities of modern MapTool Frameworks with an intent to make it approachable for new users and MapTool Scripting initiates.
[Melek's Simple5e](https://github.com/melek/Simple5e) - You should ABSOLUTELY go check it out, it is a phenominal place to
start learning all about Maptool's scripting language.

Even though it was developed for newer users, I find Simple5e's approach to token management and macros exaclty what I was 
looking for from a complexity vs. tuning capability for my own campaign, even though I have some fairly extensive scripting 
experience in MapTool at this point I still find this Framework to be the "Goldilocks" of 5e Frameworks for me.

And that left me poluting his "Simple" framework with a boatload of COMPLEX addons and drop-ins for functionality I wanted
within my campaign file.  The end result is still a very simple framework but with lots of addon tooling that makes things 
LOOK very complicated with a lot of features and functionality for some very complex capabilties...leaving it not exactly 
"new user friendly".

This framework campaign file brings together all of the tools that have been written for and work with Simple5e into one
fully featured campaign file including:

* Lib:issSpellStates (this Library)
* Lib:imcMonsterCreator (my other Drop-In for Creating Monsters)
* Lib:Addon5e - A Library supporting bobifle's 5e SRD monster tokens.
* Lib:SpellLibrary - Merudo's Spell Library and Spell Casting System for Simple5e.
* Bag of Tricks (46) - Wolph42's Bag of Tricks Drop in Functionality Addtion for MapTool

All functionality for all pieces (such as Bag of Tricks) are installed and up to date in my "Not-So-Simple5e" file.  If 
you are an experienced DM who still likes the Simple5e system but wants something more fully featured to work with either as
a starting point for your own campaign or to build onto for your own framework, Not-So-Simple5e is a good starting place that
can save you a couple hours of time getting everything downloaded and setup.

The work of each individual author of each individual library and piece of this campaign file is their own unique contribution
to the MapTool community, and should be recognized as such.  I am simply packaging these unique works into a common collection
that should work together all in a reasonable way.  I'm happy to answer questions on that packaging, but support for each piece
should be addressed to the individual authors.


----
## changelog
* 19-Jun-2020 Initial Creation of this Readme
* 20-Jun-2020 Minor Updates to Readme.MD for better Clarity, Included Section on Additional Available Assets.
* 17-Aug-2020 1.0 Release of issSpellStates.
	- Last Version to supply Simple5e_2.1 files.
	- Added Not-So-Simple5e v2.1 and v2.2.1 files.