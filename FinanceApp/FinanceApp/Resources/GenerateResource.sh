#!/bin/sh

RSROOT=$SRCROOT/FinanceApp/Resources

"$PODS_ROOT/SwiftGen/bin/swiftgen" \
xcassets -t swift3 "$RSROOT/Assets.xcassets" \
--output "$RSROOT/Assets.swift"

"$PODS_ROOT/SwiftGen/bin/swiftgen" \
strings -t structured-swift4 "$RSROOT/Localization/Language.strings" \
--output "$RSROOT/Localization/Language.swift"
