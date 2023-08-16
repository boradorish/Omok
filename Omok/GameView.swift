//
//  ContentView.swift
//  Omok
//
//  Created by snulife on 2023/05/23.
//

import SwiftUI

struct GameView: View {
    @StateObject var viewModel = GameViewModel()
    @AppStorage("theme") var theme: GameTheme = .brown
    
    var body: some View {
        ZStack{
            omockBackGround
//                .sheet(isPresented: $viewModel.gameIsFinished) {
//                    Text("Player \(viewModel.gameWinner) win!!")
//                        .padding(30)
//                }
            gridify{ (index, innerIndex) in
                let buttonState = viewModel.buttonStates[index] [innerIndex]
                OmokButton(viewModel: OmokButtonViewModel(
                    x: index, y: innerIndex,
                    buttonState: buttonState, currentSide: viewModel.currentSide , incrementalCounter: viewModel.omokTapped))
            }
            if viewModel.gameIsFinished{
                ZStack{
                    Rectangle()
                        .fill(theme.color)
                        .frame(width: 420, height: 420)
                        .opacity(0.7)
                    VStack{
                        Text("Player \(viewModel.gameWinner.rawValue) wins!!")
                            .padding(20)
                            .font(.system(size: 30))
                        Button {
                            viewModel.onNewGameButtonTapped()
                        } label: {
                            Text("New Game?")
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
    
    var omockBackGround : some View{
        ZStack{
            Rectangle()
                .fill(theme.color)
                .frame(maxWidth: .infinity)
            gridComponent
                .padding(12.5)
            
        }
    }
    
    var gridComponent : some View {
        ZStack{
            hlines
            vlines
        }
        .aspectRatio(1,contentMode: .fit)
        .foregroundColor(.black)
    }
    
    var hlines: some View{
        HStack(spacing:0){
            ForEach(0..<15){ index in
                Rectangle()
                    .frame(width:1)
                if index < 14{
                    Spacer()
                }
            }
        }
        
    }
    

    var vlines: some View{
        VStack(spacing:0){
            ForEach(0..<15){ index in
                Rectangle()
                    .frame(height:1)
            if index < 14{
                Spacer()
                }
            }
        }
    }
 
   @ViewBuilder
    func gridify<Content: View> (@ViewBuilder items: @escaping (Int, Int) -> Content) -> some View {
        HStack(spacing: 0) {
            ForEach(0..<15) { index in
                VStack(spacing: 0) {
                    ForEach(0..<15) { innerIndex in
                        ZStack{
                            items(index, innerIndex)
                        }
                    }
                }
            }
        }
    }
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
