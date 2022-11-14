//
//  CoffeeView.swift
//  CoffeeAppAnimation
//
//  Created by Ruben Granet on 08/11/2022.
//

import SwiftUI

struct CoffeeView: View {
    var coffee:Coffee
    var size:CGSize
    
    var body: some View {
        let cardSize = size.width * 0.5
        // To show Three max cards on the display
        let maxCardsDisplaySize = size.width * 3
        
        GeometryReader{proxy in
            let _size = proxy.size
            //MARK: Scaling Animation
            // Current Card Offset
            let offset = proxy.frame(in: .named("SCROLL")).minY - (_size.height - cardSize)
            let scale = offset <= 0 ? (offset / maxCardsDisplaySize) : 0
            let reducedScale = 1 + scale
            let currentCardScale = offset / cardSize
            
            Image(coffee.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: _size.width, height: _size.height)
            //To Avoid Warning
                .scaleEffect(reducedScale < 0 ? 0.001 : reducedScale, anchor: .init(x: 0.5, y: 1 - (currentCardScale / 2.4)))
            //MARK: When it's going from bottom, Animatin the Scale from Large to Actual
                .scaleEffect(offset > 0 ? 1 + currentCardScale : 1, anchor: .top )
            //MARK: To remove the next view using offset to move the view in Real time
                .offset(y: offset > 0 ? currentCardScale * 200 : 0)
                .offset(y: currentCardScale * -130)
        }
        .frame(height: size.width)
    }
}

//struct CoffeeView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoffeeView()
//    }
//}
