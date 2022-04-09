//
//  BorderedText.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-08.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

struct BorderedText: View {
    let borderWidth: CGFloat
    let text: String
    let fontName: String
    let fontSize: CGFloat
    
    var body: some View {
        Color.green
            .clipShape(pathFromText())
            .border(Color.red, width: 6.0)
    }
    
    private func pathFromText() -> Path {
        let fontName: CFString = fontName as CFString
        let letters: CGMutablePath = .init()
        let font: CTFont = CTFontCreateWithName(fontName, fontSize, nil)
        let attrString: NSAttributedString = .init(
            string: text,
            attributes: [kCTFontAttributeName as NSAttributedString.Key: font])
        let line: CTLine = CTLineCreateWithAttributedString(attrString)
        let runArray: CFArray = CTLineGetGlyphRuns(line)
        
        for runIndex in 0..<CFArrayGetCount(runArray) {
            
            let run: CTRun =  unsafeBitCast(CFArrayGetValueAtIndex(runArray, runIndex), to: CTRun.self)
            let dictRef: CFDictionary = CTRunGetAttributes(run)
            let dict: NSDictionary = dictRef as NSDictionary
            let runFont = dict[kCTFontAttributeName as String] as! CTFont
            
            for runGlyphIndex in 0..<CTRunGetGlyphCount(run) {
                let thisGlyphRange: CFRange = CFRangeMake(runGlyphIndex, 1)
                var glyph: CGGlyph = .init()
                var position: CGPoint = .zero
                CTRunGetGlyphs(run, thisGlyphRange, &glyph)
                CTRunGetPositions(run, thisGlyphRange, &position)
                
                guard let letter: CGPath = CTFontCreatePathForGlyph(runFont, glyph, nil) else {
                    continue
                }
                let transform: CGAffineTransform = .init(translationX: position.x, y: position.y)
                letters.addPath(letter, transform: transform)
            }
        }
        let flippedTransform: CGAffineTransform = .init(scaleX: 1.0, y: -1.0)
        return Path(letters).applying(flippedTransform)
    }
}

struct BorderedText_Previews: PreviewProvider {
    static var previews: some View {
        BorderedText(
            borderWidth: 6.0,
            text: "must",
            fontName: UIFont.systemFont(ofSize: 8).fontName,
            fontSize: 8.0)
    }
}
