# STP-Kate-Syntax-Highlighting
STP Routes Syntax Highlighting for Kate Editor


# STP Routes Syntax Highlighting for Kate

Syntax highlighting definition for STP (Steuerungsprogramm für Triebfahrzeuge) route files (.str) in KDE Kate text editor.

## What is STP?

STP is a control software for model railway systems, particularly popular with digital model train enthusiasts using systems like Zimo. It uses `.str` files to define routes, automation sequences, and track layouts through a specific command syntax.

## Purpose

This syntax highlighting package makes STP route files more readable and easier to debug by:

- **Color-coding different command types** (signals, turnouts, sections, etc.)
- **Highlighting syntax errors** through lack of expected coloration
- **Distinguishing between route groups** (S: routes, L: lines, A: automations)
- **Making complex route definitions visually parseable**

## Why This is Useful

Working with STP route files in plain text can be challenging:
- Commands like `W192/1, S192/2, M192/1` blend together without visual distinction
- Errors in parameter counts or values are hard to spot
- Complex automation sequences become difficult to follow

With syntax highlighting:
- **Turnout commands** (W) appear in green
- **Signal commands** (S, T) appear in yellow  
- **Section commands** (A, P) appear in cyan
- **Automation routes** appear in blue
- **Invalid syntax remains uncolored**, making errors immediately visible

## Installation

### Automatic Installation (Windows)

1. Download both files:
   - `stp-routes.xml` - The syntax definition file
   - `installer-stp-kate.bat` - The installation script

2. Place both files in the same folder

3. Run `installer-stp-kate.bat` by double-clicking it
   - The script will automatically find Kate's configuration folder
   - It will copy the syntax file to the correct location
   - If Kate isn't installed in the default location, it will create the necessary folders

4. Restart Kate

5. Open any `.str` file - syntax highlighting will be applied automatically

### Manual Installation

If the automatic installer doesn't work, you can install manually:

**Windows:**
```
%LOCALAPPDATA%\org.kde.syntax-highlighting\syntax\stp-routes.xml
```

## Features

### Supported Command Groups

- **Routes (S:)** - Station routes with turnouts, signals, and sections
- **Lines (L:)** - Track lines with speed profiles and block signals
- **Automations (A:)** - Automatic route setting based on train detection
- **Comments (C:)** - Documentation and notes

### Command Categories

The syntax highlighting recognizes and colors:

- **Turnout commands** (W) - Track switches
- **Signal commands** (S, T, X) - Main and distant signals
- **Section commands** (A, P) - Track sections with speed settings
- **Illumination** (M, L, s, w) - Panel indicators
- **Route control** (B, F, R, N, H) - Route management
- **Variables** (#, ?, *) - Conditional logic
- **Engine groups** (J, Y) - Locomotive group management
- **Direct commands** (D, d, E, e) - Direct decoder control

## Usage

Once installed, the syntax highlighting activates automatically when you:
1. Open a file with `.str` extension
2. Or manually select "STP Routes" from the syntax highlighting menu

## Validation

The syntax highlighting acts as a basic validator:
- Properly formatted commands will be colored
- Invalid parameters or syntax errors remain uncolored
- This provides immediate visual feedback while editing

## Example

Without highlighting:
```
S:177/181: T164/0, I182/1, I184/1, B2, F2, R2, -
W192/1, U192/40, W198/1, U198/40, M39/1, A39/3
```

With highlighting, each command type appears in its designated color, making the route structure immediately clear.

## Configuring STP to Use Kate as Default Editor

To make STP automatically open route files in Kate with syntax highlighting:

### Finding Kate's Executable Path (Windows Store Installation)
https://kate-editor.org/

Since Kate installed from Microsoft Store has a complex path, follow these steps:

1. Open Kate
2. Open Task Manager: `Ctrl + Shift + Esc`
3. Find `kate.exe` in the process list
4. Right-click on `kate.exe` → **Open file location**
5. In Windows Explorer, right-click on the folder path → **Copy address as text**
6. You'll get something like: `C:\Program Files\WindowsApps\KDEe.V.Kate_25.401.9515.0_x64__7vt06qxq7ptv8\bin`
7. Add `\kate.exe` to the end of the path
   - Final path example: `C:\Program Files\WindowsApps\KDEe.V.Kate_25.401.9515.0_x64__7vt06qxq7ptv8\bin\kate.exe`

### Configuring STP.ini

1. Navigate to your STP installation folder (typically `C:\STP\`)
2. Open `STP.ini` in a text editor
3. Find the line containing the text editor setting (usually starts with `Editor=` or similar)
4. Replace the current editor path with your Kate path from step 7 above
5. Save the file

Now when you edit route files from within STP, they will open in Kate with full syntax highlighting support.

**Note:** The Kate path from Microsoft Store changes with updates. If Kate stops opening from STP after an update, repeat these steps to get the new path.


## Requirements

- Kate text editor (KDE)
- Windows, Linux, or macOS
- STP route files (.str)

## Contributing

Feel free to report issues or suggest improvements for the syntax definition. The highlighting rules are based on STP V5 documentation.

## License

This syntax highlighting definition is provided as-is for the model railway community. Feel free to modify and distribute as needed.

## Acknowledgments

Created for the model railway community using STP software with Zimo and compatible digital control systems.