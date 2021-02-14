ELITE = {}

ELITE.StaffListRanks = { "superadmin", "admin" } -- What ULX ranks to show on the "Staff Online" list.
ELITE.ShowFoodTab = true -- Make sure Hungermod is enabled, otherwise this will give you errors!

ELITE.VIPJobCheckbox = true -- Whether or not to show the "Show VIP Jobs" checkbox on the jobs tab. (The checkbox is based on the jobs that have a customCheck)

ELITE.OpenWebsiteInOverlay = false -- If this is true, the website will open in Steam overlay, if false, it will open in the F4 menu.

ELITE.WebsiteURL = "http://google.com" -- Website that opens when clicking the "Website" button, make sure you include "http://"!

timer.Simple( 1, function() -- Don't screw with this timer, but you may change the tables inside.
    ELITE.AccessToCPCmds = { TEAM_POLICE, TEAM_CHIEF }
    
    ELITE.AccessToMayorCmds = { TEAM_MAYOR }
end)

-- Adding Commands Buttons (Advanced)
/*
MenuAddMButton - Adds button to first section
MenuAddRPButton - Adds button to second section
MenuAddCPButton - Adds button to exclusive CP section
MenuAddMayorButton - Adds button to exclusive mayor section

Format goes as shown:
MenuAddMButton( [Title of button], [Function of button] )

===============================================================================

If you would just like the button to run a command (i.e. /buyhealth):
For the [Function of button] argument, use:

RunConsoleCommand( "say", [Command] )

===============================================================================

If you would like to open a window that takes the players input (number or reason) when clicked:
For the [Function of button] argument, use:

function() OpenTextBox( [Title of dialog box], [Subtext of dialog box], [Command] ) end

===============================================================================

If you would like to open a window with a drop down of players when clicked:
For the [Function of button] argument, use:

function() OpenPlyBox( [Title of dialog box], [Subheading over dropdown], [Command] ) end

===============================================================================

If you would like to open a window with a drop down of players and an input box (reason or number) when clicked:
For the [Function of button] argument, use:

function() OpenPlyReasonBox( [Title of dialog box], [Subheading over dropdown], [Subheading over input box], [Command] ) end

===============================================================================

*/

MONEYCMD_BUTTONS = {}
RPCMD_BUTTONS = {}
CPCMD_BUTTONS = {}
MAYORCMD_BUTTONS = {}
OTHERCMD_BUTTONS = {}

local function AddSidebarButton( n, f )
    table.insert(WEB_BUTTONS, { Title = n, Func = f } )
end
 
local function MenuAddMButton( n, f )
    table.insert(MONEYCMD_BUTTONS, { NAME = n, FUNC = f } )
end

local function MenuAddRPButton( n, f )
    table.insert(RPCMD_BUTTONS, { NAME = n, FUNC = f } )
end

local function MenuAddCPButton( n, f )
    table.insert(CPCMD_BUTTONS, { NAME = n, FUNC = f } )
end

local function MenuAddMayorButton( n, f )
    table.insert(MAYORCMD_BUTTONS, { NAME = n, FUNC = f } )
end

local function MenuAddOtherButton( n, f )
    table.insert(OTHERCMD_BUTTONS, { NAME = n, FUNC = f } )
end

--First Section
MenuAddMButton( "Give Money To The Player You're Looking At", function() OpenTextBox( "Give Money", "How much money would you like to give to this player?", "/give" ) end )
MenuAddMButton( "Drop Money", function() OpenTextBox( "Drop Money", "How much money would you like to drop?", "/moneydrop" ) end )
--MenuAddMButton( "Buy Health", function() RunConsoleCommand( "say", "/buyhealth" ) end )

--Second Section
MenuAddRPButton( "Change Roleplay Name", function() OpenTextBox( "Change Name", "What would you like to change your roleplay name to?", "/rpname" ) end )
MenuAddRPButton( "Go to Sleep/Wake Up", function() RunConsoleCommand( "say", "/sleep" ) end )
MenuAddRPButton( "Drop Current Weapon", function() RunConsoleCommand( "say", "/drop" ) end )
MenuAddRPButton( "Request Gun License", function() RunConsoleCommand( "say", "/requestlicense" ) end )
MenuAddRPButton( "Demote A Player", function() OpenPlyReasonBox( "Demote a player", "Which player would you like to demote?", "Why would you like to demote this player?", "/demote" ) end )
MenuAddRPButton( "Sell All Doors", function() RunConsoleCommand( "say", "/unownalldoors" ) end )

MenuAddCPButton( "Make a player wanted", function() OpenPlyReasonBox( "Make a player wanted", "Which player would you like to make wanted?", "Why would you like to make this player wanted?", "/wanted" ) end )
MenuAddCPButton( "Make a player not wanted", function() OpenPlyBox( "Make a player not wanted", "Which player would you like to make not wanted?", "/unwanted" ) end )
MenuAddCPButton( "Warrant a player", function() OpenPlyReasonBox( "Warrant A Player", "Which player would you like to warrant?", "Why would you like to warrant this player?", "/warrant" ) end )

MenuAddMayorButton( "Make a player wanted", function() OpenPlyReasonBox( "Make a player wanted", "Which player would you like to make wanted?", "Why would you like to make this player wanted?", "/wanted" ) end )
MenuAddMayorButton( "Make a player not wanted", function() OpenPlyBox( "Make a player not wanted", "Which player would you like to make not wanted?", "/unwanted" ) end )
MenuAddMayorButton( "Warrant a player", function() OpenPlyReasonBox( "Warrant A Player", "Which player would you like to warrant?", "Why would you like to warrant this player?", "/warrant" ) end )
MenuAddMayorButton( "Initiate a Lockdown", function() RunConsoleCommand( "say", "/lockdown" ) end )
MenuAddMayorButton( "Conclude a Lockdown", function() RunConsoleCommand( "say", "/unlockdown" ) end )
MenuAddMayorButton( "Place board of laws", function() RunConsoleCommand( "say", "/placelaws" ) end )
MenuAddMayorButton( "Add Law", function() OpenTextBox( "Add Law", "What new law would you like to introduce?", "/addlaw" ) end )

MenuAddOtherButton( "Say I'm Swaggy", function() RunConsoleCommand( "say", "I'm swaggy" ) end )
