//
//  Home.swift
//  CoffeeAppAnimation
//
//  Created by Ruben Granet on 08/11/2022.
//

import SwiftUI

struct HomeView: View {
    // Gesture Properties
    @State var offSetY : CGFloat = 0
    @State var currentIndex : CGFloat = 0
    
    var body: some View {
        GeometryReader{
            let size = $0.size
            //MARK: Since Card Size is the Size of the Screen Width
            let cardSize = size.width
            
            //MARK: Bottom Gradient Background
            LinearGradient(colors: [
                .clear,
                Color("Brown").opacity(0.2),
                Color("Brown").opacity(0.45),
                Color("Brown"),
            ], startPoint: .top, endPoint: .bottom)
            .frame(height: 500)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
            
            HeaderView()
            
            VStack{
                ForEach(coffees){coffee in
                    CoffeeView(coffee: coffee, size: size)
                    
                }
                
            }
            .frame(width: size.width)
            .padding(.top, size.height - cardSize)
            .offset(y: offSetY)
            .offset(y: -currentIndex * cardSize)
        }
        .coordinateSpace(name: "SCROLL")
        .contentShape(Rectangle())
        .gesture(
            DragGesture()
                .onChanged({ value in
                    //Slowing down the gesture
                    offSetY = value.translation.height * 0.4
                }).onEnded({ value in
                    withAnimation(.easeInOut){
                        let translation = value.translation.height
                        
                        if translation > 0 {
                            if currentIndex > 0 && translation > 250 {
                                currentIndex -= 1
                            }
                        }else{
                            if currentIndex < CGFloat(coffees.count-1) && -translation > 250 {
                                currentIndex += 1
                            }
                        }
                        offSetY = .zero
                    }
                })
        )
        .preferredColorScheme(.light)
    }
    
    @ViewBuilder
    func HeaderView() -> some View{
        VStack{
            HStack{
                Button {
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2.bold())
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "cart.fill")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                }

            }
            
            GeometryReader{
                let size = $0.size
                
                HStack(spacing: 0){
                    ForEach(coffees){coffee in
                        VStack(spacing: 15){
                            Text(coffee.title)
                                .font(.title.bold())
                                .multilineTextAlignment(.center)
                            
                            Text(coffee.price)
                                .font(.title)
                        }
                        .frame(width: size.width)
                        
                    }
                }
                .offset(x: currentIndex * -size.width)
                .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.8, blendDuration: 0.8), value: currentIndex)
            }
        }
        .padding(15)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
