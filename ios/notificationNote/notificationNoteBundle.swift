//
//  notificationNoteBundle.swift
//  notificationNote
//
//  Created by Guilherme Martins on 26/04/25.
//

import WidgetKit
import SwiftUI

@main
struct notificationNoteBundle: WidgetBundle {
    var body: some Widget {
        notificationNote()
        notificationNoteControl()
        notificationNoteLiveActivity()
    }
}
