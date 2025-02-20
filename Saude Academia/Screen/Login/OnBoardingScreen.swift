import SwiftUI

struct OnBoardingScreen: View {
    
    @State var showSignUp = false
    @State private var selectPage = 0
    
    @State var pageArr = [
        [
            "title": "Exercicios",
            "subtitle": "Para o seu perfil personalizado",
            "image": "in_1"
        ],
        [
            "title": "Monitoramento da saúde",
            "subtitle": "Registre e lembre suas atividades",
            "image": "in_2"
        ],
        [
            "title": "Verifique seus progresso",
            "subtitle": "Um calendário de rastreamento",
            "image": "in_3"
        ],
    ]
        
    
    var body: some View {
        ZStack(alignment: .center) {
            TabView(selection: $selectPage.animation()) {
                ForEach(0 ..< pageArr.count, id: \.self) { index in
                    let iObj = pageArr[index]
                    
                    VStack {
                        Spacer()
                        
                        Text(iObj["title"] ?? "")
                            .multilineTextAlignment(.center)
                            .font(.customfont(.bold, fontSize: 25))
                        
                        Text(iObj["subtitle"] ?? "")
                            .multilineTextAlignment(.center)
                            .font(.customfont(.regular, fontSize: 15))
                        
                        HStack {
                            Image(iObj["image"] ?? "")
                                .resizable()
                                .scaledToFit()
                                .frame(width: .widthPer(per: 0.65))
                        }
                        .frame(width: .screenWidth, height: .screenWidth, alignment: .center)
                        
                        Spacer()
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .overlay(
                HStack(spacing: 8) {
                    ForEach(0 ..< pageArr.count, id: \.self) { index in
                        Capsule()
                            .fill(selectPage == index ? Color.primaryApp : Color.inActive)
                            .frame(width: 8, height: 8)
                    }
                }
                    .padding(.bottom, .heightPer(per: 0.2))
                ,alignment: .bottom
            )
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Pular")
                            .font(.customfont(.light, fontSize: 12))
                            .horizontal15
                            .vertical8
                    })
                    .foregroundColor(.secondaryText)
                    .background(Color.txtBG)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25.0).stroke(Color.board, lineWidth: 1)
                    )
                }
                
                Spacer()
                
                Button(action: {
                    showSignUp = true
                }, label: {
                    Text("Próximo")
                        .font(.customfont(.semiBold, fontSize: 14))
                        .horizontal15
                })
                .foregroundColor(.btnPrimaryText)
                .frame(width: 150, height: 50)
                .background(Color.primaryApp)
                .cornerRadius(25)
            }
            .horizontal20
            .topWithSafe
            .bottomWithSafe
        }
        .bgNavLink(content: SignUpScreen(), isAction: $showSignUp)
        .navHide
    }
}

#Preview {
    NavigationView{
        OnBoardingScreen()
    }
}
