//
//  IOS_SwiftUI_DiegoAndradesTests.swift
//  IOS-SwiftUI.DiegoAndradesTests
//
//  Created by Macbook Pro on 29/4/24.
//

import XCTest
@testable import IOS_SwiftUI_DiegoAndrades
import SwiftUI
import MarvelLibrary

//MARK: - Creamos testing de la app
final class IOS_SwiftUI_DiegoAndradesTests: XCTestCase{
    
    
    
    
    //MARK: - Testing de Heros
    
    //Compruebo que haya héroes en el HeroUseCaseFake
    func testHeroViewModel() async throws {
        let vm = HerosViewModel(network: HeroUseCaseFake())
        XCTAssertNotNil(vm)
        
    }
    
    func testHeroUseCase() async throws {
        //Compruebo que no me devuelva nil
        let usecase = HeroUseCase(repo: HerosRepositoryFake())
        XCTAssertNotNil(usecase)
        
        //Compruebo que tenga dos datos el repositorio fake
        let data = await usecase.getHeros()
        XCTAssertEqual(data.count, 2) 
    }
    
}


    
