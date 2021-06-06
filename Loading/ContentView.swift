//
//  ContentView.swift
//  Loading
//
//  Created by Raphael Cerqueira on 06/06/21.
//

import SwiftUI

struct ContentView: View {
    @State var isLoading = false
    @State var isAnimating = false
    
    var body: some View {
        if isLoading {
            CustomLoadingView()
                .rotationEffect(.degrees(isAnimating ? 360 : 0))
                .animation(Animation.linear(duration: 0.75).repeatForever(autoreverses: false))
                .onAppear {
                    isAnimating = true
                }
                .onDisappear {
                    isAnimating = false
                }
        } else {
            VStack {
                Spacer()
                
                Button(action: {
                    self.isLoading.toggle()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        self.isLoading.toggle()
                    }
                }, label: {
                    Text("Start animation")
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(8)
                        .padding()
                })
            }
        }
    }
}

struct CustomLoadingView: View {
    var width: CGFloat = 3
    var height: CGFloat = 12
    var spacing: CGFloat = 2
    
    var body: some View {
        ZStack {
            VStack(spacing: spacing) {
                Rectangle()
                    .frame(width: width, height: height)
                    .foregroundColor(.red)
                
                HStack(spacing: spacing) {
                    Rectangle()
                        .frame(width: height, height: width)
                        .foregroundColor(.clear)
                    
                    Circle()
                        .strokeBorder(Color.red, lineWidth: 3)
                        .frame(width: 16, height: 16)
                    
                    Rectangle()
                        .frame(width: height, height: width)
                        .foregroundColor(.red)
                }
                
                Rectangle()
                    .frame(width: width, height: height)
                    .foregroundColor(.clear)
            }
            
            Rectangle()
                .frame(width: height, height: width)
                .foregroundColor(.red)
                .rotationEffect(.degrees(135))
                .offset(x: height - 1, y: -height + 1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
