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
                            messageAutor: conversation.conversation.chatSettings?.title ?? "Пока без имени",
                            isOnline: false,
                            avatar: conversation.conversation.chatSettings?.photo.photo200 ?? "https://kartinki.pics/uploads/posts/2022-12/1670449450_5-kartinkin-net-p-kharder-sobaka-vkontakte-5.png",
                            isReaded: true,
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
