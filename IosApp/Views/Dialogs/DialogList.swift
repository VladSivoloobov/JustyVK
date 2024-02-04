//
//  DialogList.swift
//  IosApp
//
//  Created by Vladislav on 30.05.2023.
//

import SwiftUI

struct DialogList: View {
    @State var searchString = "";
    @State var viewWidth = CGFloat.zero;
    @Binding var tabBarVisibleBinding: Bool;
    @EnvironmentObject var userInfo: UserInfo;
    @State var conversations: [ConversationInfo] = [];
    
    var body: some View {
        NavigationStack{
            List{
                Section{
                    ForEach(conversations, id: \.self.lastMessage.fromId){ conversation in
                        DialogRow(
                            lastMessage: conversation.lastMessage.text,
                            messageAutor: "Тестоый юзер",
                            isOnline: true,
                            avatar: dialogs[0].image,
                            isReaded: false,
                            unreadCount: 0
                        )
                        .dialogContextMenu()
                        .dialogSwipeActions()
                        .dialogOverlay(dialog: conversation.conversation, tabBarVisibleBinding: $tabBarVisibleBinding)
                    }
                }
                .listSectionSeparator(.hidden)
            }
            .dialogModifiers($searchString)
            .getConversations($conversations)
        }
    }
}
