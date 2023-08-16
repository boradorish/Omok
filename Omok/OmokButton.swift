//
//  OmokButton.swift
//  Omok
//
//  Created by snulife on 2023/06/01.
//

import SwiftUI

struct OmokButton: View {
   
    @ObservedObject var viewModel : OmokButtonViewModel

    typealias ButtonState = SideState?
    
    var body: some View {
        Button {
            viewModel.onButtonTapped()
        }label: {
            switch viewModel.buttonState {
            case nil:
                Circle()
                    .tint(.clear)
            case .black:
                Circle()
                    .tint(.black)
            case .white:
                Circle()
                    .tint(.white)
            }
        }
    }
}

struct OmokButton_Previews: PreviewProvider {
    static var previews: some View {
        OmokButton(viewModel: OmokButtonViewModel(x:0, y:0, buttonState: .black, currentSide: .white, incrementalCounter: {x,y in return}))
    }
}
