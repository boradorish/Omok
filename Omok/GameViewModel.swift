//
//  OmokViewModel.swift
//  Omok
//
//  Created by snulife on 2023/05/23.
//

import SwiftUI

class GameViewModel: ObservableObject {
    
    @Published var gameIsFinished = false
    @Published var gameWinner = SideState.black
    @Published var buttonStates: [[OmokButtonViewModel.ButtonState]]
    @Published var currentSide = SideState.black
    
    init(gameIsFinished: Bool = false, gameWinner: SideState = SideState.black, showPiece: Bool = false, buttonStates:  [[OmokButtonViewModel.ButtonState]] = [], currentSide: SideState = SideState.black) {
        self.gameIsFinished = gameIsFinished
        self.gameWinner = gameWinner
        self.buttonStates = []
        self.currentSide = currentSide
        
//        let theme: GameTheme = UserDefaults.standard.string(forKey: "theme")
//        print(theme)
//
        self.buttonStates = cleanState
    }
    
    
    func omokTapped(x: Int, y: Int){
        guard buttonStates[x][y] == nil else {return}
        buttonStates[x][y] = currentSide
        switch currentSide {
        case .black:
            currentSide = .white
        case .white:
            currentSide = .black
        }
        
        finishTheGameIfTheGameIsFinished(with: buttonStates)
    }
    
    func finishTheGameIfTheGameIsFinished(with states: [[OmokButton.ButtonState?]]){
        gameIsFinished = (
            checkVertical(with: buttonStates) ||
            checkHorizontal(with: buttonStates) ||
            checkLeftHigh(with: buttonStates) ||
            checkRightHigh(with: buttonStates))
        
    }
    
    func checkVertical(with states: [[OmokButton.ButtonState]]) -> Bool{
        for x in 0..<15{
            var continuedTimes = 0
            for y in 0..<14{
                if states[x][y] != nil{
                    if states[x][y] == states[x][y+1]{
                        continuedTimes += 1
                    }else{
                        continuedTimes = 0
                    }
                    if continuedTimes >= 4{
                        gameWinner = states[x][y]!
                        return true
                    }
                }else{
                    continuedTimes = 0
                }
            }
        }
        return false
    }
    
    func checkHorizontal(with states: [[OmokButton.ButtonState]]) -> Bool {
        for y in 0..<15{
            var continuedTimes = 0
            for x in 0..<14{
                if states[x][y] != nil && states[x][y] == states[x+1][y] {
                    continuedTimes += 1
                }else{
                    continuedTimes = 0
                }
                if continuedTimes >= 4{
                    gameWinner = states[x][y]!
                    return true
                }
            }
        }
        return false
    }
    
    func checkLeftHigh(with states: [[OmokButton.ButtonState]]) -> Bool {
        var omokMade = false
        for x in 4..<15{
            for y in 0..<11{
                omokMade = true
                for i in 0..<4{
                    if states[x][y] == nil || states[x][y] != states[x-1-i][y+1+i]{
                        omokMade = false
                    }
                }
                if omokMade{
                    gameWinner = states[x][y]!
                    return true
                }
            }
        }
        return false
    }
    
    func checkRightHigh(with states: [[OmokButton.ButtonState]]) -> Bool{
        var omokMade = false
        for x in 0..<11{
            for y in 0..<11{
                omokMade = true
                for i in 0..<4{
                    if states[x][y] == nil || states[x][y] != states[x+1+i][y+1+i]{
                        omokMade = false
                    }
                }
                if omokMade{
                    gameWinner = states[x][y]!
                    return true
                }
            }
        }
        return false
    }
    
    func onNewGameButtonTapped(){
        buttonStates = cleanState
        gameIsFinished = false
    }
    
    private var cleanState: [[OmokButtonViewModel.ButtonState]]{
        Array(repeating: Array(repeating: nil, count: 15), count: 15)
    }
}

enum SideState: String {
    case black
    case white
}
