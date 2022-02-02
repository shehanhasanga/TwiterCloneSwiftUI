//
//  ProfileView.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-01-30.
//

import SwiftUI
import Kingfisher
struct ProfileView: View {
    @State var selectionFilter: TweetFilterViewModel = .tweets
    
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    private var user : User
    
    var profileViewMOdel : ProfileViewModel
   
    
    init(user:User){
        self.user = user
        self.profileViewMOdel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        VStack(alignment:.leading){
            header
            actionButtons
            userInfo
           tweetFilterBar
            tweetsUi
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        
       
    }
}

extension ProfileView{
    var header : some View {
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            VStack{
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.white)
                        .frame(width: 20, height: 16)
                        .offset(x:16, y: 12)
                }
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .frame(width: 72, height: 72)
                    .scaledToFill()
                    .clipShape(Circle())
                    .offset(x:16, y :24)
                   

            }
           
        }
        .frame( height: 96)
    }
    
    var actionButtons  : some View {
        HStack( spacing: 12 ){
            Spacer()
            Image(systemName: "bell.badge")
                .font(.title)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            Button {
                
            } label: {
                Text(profileViewMOdel.actionBtnTitle)
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }

        }
        .padding(.trailing)
    }
    
    var userInfo : some View{
        VStack(alignment: .leading, spacing: 4) {
            HStack{
                Text(user.fullname)
                    .font(.title).bold()
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.blue)
            }
            Text("@\(user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("Yours favourite soul")
                .font(.subheadline)
                .padding(.vertical)
            HStack{
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    Text("shehan k")
                }
                Spacer()
                HStack{
                    Image(systemName: "link")
                    Text("www.shehank.com")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            UserStatView()
            .padding(.vertical)
         
            
        }
        .padding(.horizontal)
    }
    
    var tweetsUi : some View{
        ScrollView{
            LazyVStack{
                ForEach(profileViewMOdel.tweets(filter: self.selectionFilter)){
                    tweet in
                    TweetsRowView(tweet: tweet)
                        .padding(.horizontal)
                }
            }
        }
    }
    
    var tweetFilterBar : some View{
        HStack {
            ForEach(TweetFilterViewModel.allCases , id: \.self){
                item in
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectionFilter == item ? .semibold : .regular)
                        .foregroundColor(selectionFilter == item ? .black : .gray)
                    if (selectionFilter == item){
                        Capsule()
                            .foregroundColor(.blue)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundColor(.clear)
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(Animation.easeInOut){
                        selectionFilter = item
                    }
                }
                
               
                
            }
        }
        .overlay(Divider().offset(x:0, y :16))
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
