//
//  Credits.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-10.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

struct Credits: View {
    var body: some View {
        VStack {
            Text("Brotherhood Alchemist")
                .font(Font.system(.headline))
            Text("Copyrights © 2012-2022 Dave Poirier")
                .font(Font.system(.headline))
            Text("All rights reserved.")
                .font(Font.system(.caption))

            Button(action: {
                let linkedInUrl = URL(string: "https://www.linkedin.com/in/dave-poirier-a9b25a9/")!
                UIApplication.shared.open(linkedInUrl)
            }) {
                Text("Open my LinkedIn profile")
                    .font(Font.system(.subheadline))
            }
            .padding(4.0)
            
            Button(action: {
                let linkedInUrl = URL(string: "https://www.patreon.com/encodedlife")!
                UIApplication.shared.open(linkedInUrl)
            }) {
                Text("Support me on Patreon")
                    .font(Font.system(.subheadline))
            }
            .padding(4.0)
            
            Text("Or reach out via dave@encoded.life")
                .font(Font.system(.subheadline))
        }
        .padding(.top, 40.0)
        .padding(.bottom, 20.0)
    }
}

struct Credits_Previews: PreviewProvider {
    static var previews: some View {
        Credits()
    }
}
