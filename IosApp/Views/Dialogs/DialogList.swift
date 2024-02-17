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
    @Binding var unreadMessagesCount: Int;
    @Environment(\.editMode) private var editMode
    
    var body: some View {
        NavigationStack{
            List{
                Section{
                    ForEach(conversations, id: \.self.conversation.peer.id){ conversation in
                        DialogRow(
                            conversation: conversation.conversation,
                            lastMesage: conversation.lastMessage,
                            tabBarVisibleBinding: $tabBarVisibleBinding
                        )
                    }
                }
                .listSectionSeparator(.hidden)
            }
            .dialogModifiers($searchString)
            .getConversations($conversations, $unreadMessagesCount)
            .toolbar{
                EditButton()
            }
        }
    }
}
