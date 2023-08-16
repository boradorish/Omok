//
//  OmokButtonViewModel.swift
//  Omok
//
//  Created by snulife on 2023/06/22.
//

import Foundation

class OmokButtonViewModel : ObservableObject {
    let x: Int
    let y: Int
    
    @Published var buttonState: ButtonState = nil
    @Published var currentSide: SideState = .black
    var incrementalCounter : (Int, Int) -> Void
    
    init(
        x: Int, y : Int,
        buttonState: ButtonState, currentSide: SideState,
         incrementalCounter: @escaping (Int, Int) -> Void) {
        self.buttonState = buttonState
        self.currentSide = currentSide
        self.incrementalCounter = incrementalCounter
        self.x = x
        self.y = y
    }
    
    func onButtonTapped(){
        incrementalCounter(x,y)
    }
    
    typealias ButtonState = SideState?
    
}

