//
//  Theme.swift
//  CustomFontDemo
//
//  Created by Mihai Constantin on 24.04.2024.
//

import SwiftUI

struct Theme {
    var text: Text
    var button: Button
    var textField: TextField
    
    struct Text {
        var primary: Primary
        
        struct Primary {
            var color: Color
            var borderColor: Color
        }
    }
    
    struct Button {
        var primary: Primary
        
        struct Primary {
            var color: Color
        }
    }
    
    struct TextField {
        var primary: Primary
        
        struct Primary {
            var textColor: Color
            var backgroundColor: Color
        }
    }
}

extension Theme {
    static let `default` = Self(
        text: .init(
            primary: .init(color: Color("TextColor"), 
                           borderColor: Color("TextBorderColor"))
        ),
        button: .init(
            primary: .init(color: Color("ButtonLabelColor"))
        ),
        textField: .init(
            primary: .init(textColor: Color("TextFieldColor"),
                           backgroundColor: Color("TextFieldBackgroundColor"))
                
        )
    )
}

private struct ThemeEnvironmentKey: EnvironmentKey {
    static var defaultValue = Theme.default
}

extension EnvironmentValues {
    var theme: Theme {
        get { self[ThemeEnvironmentKey.self] }
        set { self[ThemeEnvironmentKey.self] = newValue }
    }
}
