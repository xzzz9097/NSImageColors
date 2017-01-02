//: Playground - noun: a place where people can play

import Cocoa
import PlaygroundSupport
import UIImageColors

PlaygroundPage.current.needsIndefiniteExecution = true

let images = [NSImage(named: "Black on Both Sides.png"),
              NSImage(named: "Cupid Deluxe.png"),
              NSImage(named: "If You're Reading This It's Too Late.png"),
              NSImage(named: "Kind of Blue.png"),
              NSImage(named: "My Beautiful Dark Twisted Fantasy.png")]

var colors: [NSColor] = []

for image in images {
    colors.append((image?.getColors().backgroundColor)!)
}

colors