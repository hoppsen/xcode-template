#  Assets

## Assets

Assets only contains graphics. `Assets.swift` is generated via

```bash
bundle exec fastlane assets
```

> For icons ``Symbols.xcassets`` should be used! If we don't have a particular symbol as an SFSymbol, the design team should provide it.

## Colors

The Color extension `Colors.swift` is manually generated out of the `Colors.xcassets`.

## Symbols

All custom symbols should be placed within `Symbols.xcassets`. If possible and where it makes sense group them.

### Backwards Compatibility

Sometimes new icons are not available with older operating systems. For this we create a new folder, such as `iOS15+` where we export the corresponding symbol from SF Symbols and place it within this folder. This way these specific icon becomes backwards compatible.
