# SpriteKitCubicCurve

It's an example project that explains how to use custom cubic Bezier timing curve for SpriteKit actions.

### Note

Building a SpriteKit action with a standard `timingFunction` that utilise value outside [0...1] range will stop executing right away.
To overcome this issue we have to use `SKAction.customAction(withDuration:actionBlock:)` applying our custom timing function 
to get a progress value for every time value change. For such cases use method `customAction(from:to:timing:progressBlock)` 
or other methods build on top of it, or make you own.
