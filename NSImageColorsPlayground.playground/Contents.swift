//: Playground - noun: a place where people can play

import Cocoa
import PlaygroundSupport
import NSImageColors

PlaygroundPage.current.needsIndefiniteExecution = true

var shouldSetPlaygroundLiveView = false

let Albums: [Album] = [
    Album(albumFile: "df.png", albumName: "My Beautiful Dark Twisted Fantasy", artistName: "Kanye West", year: 2010),
    Album(albumFile: "nw.jpg", albumName: "Nothing Was the Same", artistName: "Drake", year: 2013),
    Album(albumFile: "ok.png", albumName: "OK Computer", artistName: "Radiohead", year: 1997),
    Album(albumFile: "yz.jpg", albumName: "Yeezus", artistName: "Kanye West", year: 2013),
    Album(albumFile: "ab.jpg", albumName: "Ágætis byrjun", artistName: "Sigur Rós", year: 1999),
    Album(albumFile: "cd.jpg", albumName: "Cupid Deluxe", artistName: "Blood Orange", year: 2013),
    Album(albumFile: "ed.jpg", albumName: "Endtroducing.....", artistName: "DJ Shadow", year: 1996),
    Album(albumFile: "dj.jpg", albumName: "Duke Ellington & John Coltrane", artistName: "Duke Ellington & John Coltrane", year: 1963),
    Album(albumFile: "ph.jpg", albumName: "Purple Haze", artistName: "Cam'ron", year: 2004),
    Album(albumFile: "rm.png", albumName: "Random Access Memories", artistName: "Daft Punk", year: 2013),
    Album(albumFile: "sk.jpg", albumName: "Skream!", artistName: "Skream", year: 2006),
    Album(albumFile: "b6.jpg", albumName: "Barter 6", artistName: "Young Thug", year: 2015)
]

func makeBox(_ asynchronous: Bool, completionHandler: @escaping (NSView) -> Void) {
    let maxIterations = CGFloat(Albums.count)
    let sample = Container(album: Albums[0])
    let box = NSView(frame: NSMakeRect(0, 0, sample.frame.width*2, ceil(maxIterations/2)*sample.frame.height))
    
    for i in stride(from: CGFloat(0), to: maxIterations, by: 1) {
        let c = Container(album: Albums[Int(i)])
        c.frame.origin = CGPoint(x: sample.frame.width*(i.truncatingRemainder(dividingBy: 2)), y: sample.frame.height*floor(i/2))
        box.addSubview(c)
        
        if asynchronous {
            c.albumImageView.image!.getColors { colors in
                c.layer?.backgroundColor = colors.background.cgColor
                c.albumTitle.textColor = colors.primary
                c.artistTitle.textColor = colors.secondary
                c.yearLabel.textColor = colors.detail
                if i == maxIterations-1 {
                    completionHandler(box)
                }
            }
        } else {
            let colors = c.albumImageView.image!.getColors()
            c.layer?.backgroundColor = colors.background.cgColor
            c.albumTitle.textColor = colors.primary
            c.artistTitle.textColor = colors.secondary
            c.yearLabel.textColor = colors.detail
            if i == maxIterations-1 {
                completionHandler(box)
            }
        }
    }
}

// Make a box of albums
makeBox(false) { box in
    if shouldSetPlaygroundLiveView {
        PlaygroundPage.current.liveView = box
    } else {
        box // View will appear here!
        PlaygroundPage.current.finishExecution()
    }
}
