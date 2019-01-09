//
//  PlayerTests.swift
//  LeaguesTests
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation

@testable import Leagues

import Nimble
import Quick

class PlayerSpec: QuickSpec {
    override func spec() {
        describe("Player") {
            context("Nominal case") {
                let playerJson = JsonFileReaded(fileName: "PlayerNominal").data
                let player = try? JSONDecoder().decode(PlayerEntity.self, from: playerJson)
                it("should be non nil") {
                    expect(player).toNot(beNil())
                }
                
                it("should contain all fields") {
                    expect(player?.identifier).to(equal("34145937"))
                    expect(player?.name).to(equal("Mario Balotelli"))
                    expect(player?.birthDate).to(equal("1990-08-12"))
                    expect(player?.signingAmout).to(equal("£16,000,000"))
                    expect(player?.position).to(equal("Forward"))
                    expect(player?.headImageUrlString).to(equal("https://www.thesportsdb.com/images/media/player/cutout/43001238.png"))
                    expect(player?.thumbnailImageUrlString).to(equal("https://www.thesportsdb.com/images/media/player/thumb/qqvuvq1431622719.jpg"))
                }
            }
            
            context("null optional fields") {
                let leagueJson = JsonFileReaded(fileName: "PlayerNullFields").data
                let player = try? JSONDecoder().decode(PlayerEntity.self, from: leagueJson)
                it("should be non nil") {
                    expect(player).toNot(beNil())
                }
                
                it("should contain all fields") {
                    expect(player?.identifier).to(equal("34145937"))
                    expect(player?.name).to(equal("Mario Balotelli"))
                    expect(player?.birthDate).to(beNil())
                    expect(player?.signingAmout).to(beNil())
                    expect(player?.headImageUrlString).to(beNil())
                    expect(player?.thumbnailImageUrlString).to(beNil())
                }
            }
        }
    }
}
