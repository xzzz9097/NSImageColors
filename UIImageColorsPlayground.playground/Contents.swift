//: Playground - noun: a place where people can play

import Cocoa
import PlaygroundSupport
import UIImageColors

PlaygroundPage.current.needsIndefiniteExecution = true

let image = NSImage(named: "Black on Both Sides.png")

let color = image?.getColors().primaryColor