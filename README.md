# 2DEV2_maekelberghThibault_ND_IPRESENT
> Presentation app for the Pioneer PLX-1000

Final project for devine.be 's Native Development module.
Showcase/Product Tour app for Pioneer's PLX-1000 turntable. Features consist of:

* Store/Reseller Locator (trough MapKit APi, there is a different branch for implementing Mapbox' API<sup>1</sup>)
* Feature list
* Modifier (changes the led color or base body color to the ltd. edition, also has the option to provide live preview to fake an AR env. Optionally a user can share the config to Facebook)
* Instagram Feed (#plx1000, isn't implemented yet)
* Product Video's (shows YouTube video's about the PLX-1000, needs a fix in AutoLayout since video's don't stack well)

## Installing
```shell
git clone https://github.com/thibmaek/2DEV2_maekelberghThibault_ND_IPRESENT ipresent
cd ipresent/xcode/Turntablism
pod install
open Turntablism.xcworkspace
```

## The other stuff
> I probably won't finish this (since I hate Swift, long live React-Native lol), but I might fix some of the issues if I feel like it.

<sup>1</sup> There was no easy way to create multiple pins trough a model class so I didn't implement this fully yet.
