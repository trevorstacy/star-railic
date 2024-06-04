//
//  RelicUploader.swift
//  StarRailic
//
//  Created by Trevor Stacy on 9/17/23.
//

import SwiftUI
import PhotosUI
import Vision

struct RelicUploader: View {
    private var relicProcessor = RelicProcessor()
    
    @State private var showError: Bool = false
    @State private var relicPhotoItem: PhotosPickerItem?
    @State private var relicImage: Image?
    @State private var relic: Relic?
    
    func onShowError() {
        relicPhotoItem = nil
        relicImage = nil
        showError = true
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            if showError {
                VStack {
                    Text("The image you selected couldn't be processed properly. Please ensure you are following the guidelines for screenshots and try again.")
                        .foregroundStyle(Color("SecondaryTextColor"))
                }
                .padding()
                .padding(.bottom, 20)
            }
            
            if let relicImage {
                VStack(spacing: 0) {
                    ZStack {
                        relicImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: .infinity, height: 270)
                            .blur(radius: 20)
                            .clipped()
                        
                        relicImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 230, height: 230)
                    }
                }
                .padding(.top)
            }
            
            if let relic = relic {
                VStack(spacing: 12) {
                    HStack {
                        VStack(spacing: 12) {
                            HStack(alignment: .firstTextBaseline) {
                                Text(relic.name)
                                    .foregroundStyle(Color("AccentColor"))
                                    .font(.title2)
                                Spacer()
                            }
                            
                            HStack {
                                HStack(alignment: .firstTextBaseline) {
                                    Text(relic.type)
                                        .foregroundStyle(Color("AccentColor"))
                                        .font(.subheadline)
                                        .fontWeight(.thin)

                                    Text("+\(relic.level)")
                                        .foregroundStyle(Color("AccentColor"))
                                        .font(.subheadline)
                                        .fontWeight(.thin)
                                }
                                
                                Spacer()
                            }
                        }
                        .padding(16)
                        
                        Spacer()
                        
                        Text("S+")
                            .font(.title)
                            .foregroundStyle(Color("STier"))
                            .padding(.trailing)
                            .italic()
                    }
                    .background(
                        Color("ButtonBackground")
                    )
                    .background(
                        Color("ButtonStroke").frame(height: 1), alignment: .bottom
                    )
                    
                    VStack(spacing: 10) {
                        ForEach(relic.stats) { relicStat in
                            HStack {
                                relicStat.mainStat ?
                                    Text(relicStat.stat.name).font(.title3).foregroundStyle(Color("SecondaryTextColor")) :
                                    Text(relicStat.stat.name).foregroundStyle(Color("SecondaryTextColor")).fontWeight(.thin)
                                
                                Spacer()
                                
                                HStack(alignment: .center, spacing: 6) {
                                    if !relicStat.mainStat {
                                        if let distribution = relicStat.distribution {
                                            HStack(spacing: 4) {
                                                ForEach(1..<relicStat.distribution! + 1) { amount in
                                                    Circle()
                                                        .fill(Color("AccentColor"))
                                                        .frame(width: 2, height: 2)
                                                        .opacity(0.5)
                                                }
                                            }
                                        }
                                    }
                                    
                                    relicStat.mainStat ?
                                        Text("\(relicStat.formattedValue)\(relicStat.stat.flat ? "" : "%")").foregroundStyle(Color("SecondaryTextColor")) :
                                        Text("\(relicStat.formattedValue)\(relicStat.stat.flat ? "" : "%")").foregroundStyle(Color("SecondaryTextColor")).fontWeight(.thin)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
            
            PhotosPicker(selection: $relicPhotoItem, matching: .images) {
                SlantedRectangle()
                    .stroke(Color("ButtonStroke"), lineWidth: 1)
                    .fill(Color("ButtonBackground"))
                    .frame(width: 270, height: 54)
                    .overlay(Text(relicImage == nil ? "Select Relic Screenshot" : "Change Relic Screenshot").foregroundStyle(Color("SecondaryTextColor")))
            }
        }
        .onChange(of: relicPhotoItem) {
            relic = nil
            relicImage = nil
            showError = false

            Task {
                if let data = try? await relicPhotoItem?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    relicImage = Image(uiImage: uiImage)

                    relicProcessor.processImageForText(uiImage) { recognizedText in
                        if let text = recognizedText {
                            relicProcessor.getDataFromText(text) { result in
                                if let relic = result {
                                    self.relic = relic
                                } else {
                                    onShowError()
                                }
                            }
                        } else {
                            onShowError()
                        }
                    }

                    return
                }

                onShowError()
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {}) {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .foregroundStyle(Color("AccentColor"))
            }

            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {}) {
                    Image(systemName: "questionmark.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .foregroundStyle(Color("AccentColor"))
            }
        }
    }
}

#Preview {
    RelicUploader()
}
