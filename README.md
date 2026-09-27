# restart-services

## About

`restart-services` is a macOS Automator utility that provides a simple way to restart commonly used system services.

The current version allows the user to restart Bluetooth, the Wi-Fi interface, Finder, or Dock from a simple service selector.

## Status

**In Progress**

The current Automator version is functional, but the project is not considered finished.

## Features

- Restart Bluetooth
- Restart the current Wi-Fi interface
- Restart Finder
- Restart Dock
- Detect the active Wi-Fi interface automatically
- Display notifications after successful actions
- Display an error dialog when an operation fails

## Requirements

- macOS
- Administrator privileges for Bluetooth and Wi-Fi operations

## Usage

Launch `restart-services.dmg` and use the service selector to choose the service to restart.

Some operations require administrator authentication.

## How It Works

The current application is built with AppleScript and packaged as a macOS Automator application.

The script detects the current Wi-Fi interface using `networksetup`, then executes the appropriate system command for the selected service.

The source code is included separately in `restart-services.applescript` so the project can be maintained and developed independently from the packaged application.

## Project Structure

```text
restart-services/
├── .gitignore
├── README.md
├── restart-services.applescript
└── restart-services.dmg
```

## Future Development

The planned next version is to evolve the utility into a native macOS menu bar application.

The menu bar version will provide direct access to the available services from the macOS menu bar, eliminating the need for the current service-selection dialog.

## Design Notes

The current implementation is intentionally kept simple and focused on performing a small set of system maintenance actions.

The existing AppleScript implementation is preserved as the starting point for future development.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for the full license text.
