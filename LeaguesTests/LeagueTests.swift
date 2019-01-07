//
//  LeaguesTests.swift
//  LeaguesTests
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

@testable import Leagues

import Nimble
import Quick

class LeagueSpec: QuickSpec {
    override func spec() {
        describe("League") {
            context("Nominal case") {
                let leagueJson = """
                        {
                            "idLeague":"4328",
                            "strLeague":"English Premier League",
                            "strSport":"Soccer",
                            "strLeagueAlternate":"Premier League"
                        }
                        """.data(using: .utf8)!
                it("should be non nil") {
                }
                
                it("should contain all fields") {
                }
            }
            
            context("null fields") {
                let leagueJson = """
                        {
                            "idLeague":"4328",
                            "strLeague":"English Premier League",
                            "strSport":null,
                            "strLeagueAlternate":null
                        }
                        """.data(using: .utf8)!
                it("should be non nil") {
                }
                
                it("should contain all fields") {
                }
            }
        }
    }
}
