//
//  Friend.swift
//  Весточка
//
//  Created by Vladislav on 03.06.2023.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct FriendRow: View {
    @State var name: String;
    @State var image: String;
    @State var lastSeenTime: Int;
    @State var lastSeenPlatform: Int;
    @State var sex: Int;
    @State private var lastSeenString = "";
    @State var isOnline: Int;
    @EnvironmentObject var userInfo: UserInfo;
    @State var user: User;
    @Binding var tabBarVisibleBinding: Bool;
    
    var body: some View {
        HStack(alignment: .center){
            WebImage(url: URL(string: image))
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .cornerRadius(.infinity)
                .padding(.trailing, 5)
                .overlay(alignment: .bottomTrailing){
                    if(isOnline == 1){
                        UserOnlineStatus(isOnline: isOnline == 1 ? true : false)
                            .offset(x: -3)
                    }
                }
            VStack(alignment: .leading){
                Text(name)
                    .font(.system(size: 17))
                    .fontWeight(.medium)
                HStack(spacing: 2){
                    Text(lastSeenString)
                    
                }
                .foregroundColor(isOnline == 1 ? .green : .gray)
                .font(.system(size: 13))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .overlay{
            NavigationLink(
                destination: {
                    UserProfile(
                        userId: user.id,
                        name: name,
                        id: user.screenName ?? "",
                        lastOnline: lastSeenString,
                        status: user.status ?? "",
                        user: user
                    )
                        .onAppear(){
                            self.tabBarVisibleBinding.toggle();
                        }
                        .onDisappear(){
                            withAnimation(.spring()){
                                self.tabBarVisibleBinding.toggle();
                            }
                        }
                }, label: {
                    EmptyView()
                }
            )
            .opacity(0)
        }
        .onAppear{
            if(isOnline == 1){
                lastSeenString = "в сети";
                return;
            }
            
            switch(sex){
            case 1:
                lastSeenString = "была "
                break;
            case 2:
                lastSeenString = "был "
                break;
            default:
                lastSeenString = "был(а) "
                break;
            }
            
            if(lastSeenTime == -404){
                lastSeenString += "недавно";
                return;
            }
            
            let calendar = Calendar(identifier: .gregorian);
            let date = Date(timeIntervalSince1970: TimeInterval(lastSeenTime));
            let daysDifference = calendar.numberOfDaysBetween(date);
            lastSeenString += calendar.getLastOnlineDateString(difference: daysDifference, date: date)
        }
    }
}
