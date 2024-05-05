//
//  ViewTest.swift
//  IOS-SwiftUI.DiegoAndradesTests
//
//  Created by Macbook Pro on 4/5/24.
//

import XCTest
import SwiftUI
import MarvelLibrary
import ViewInspector

@testable import IOS_SwiftUI_DiegoAndrades

extension HeroesView: Inspectable{}
extension HerosRowView: Inspectable{}
extension DetailRowView: Inspectable{}
extension NetflixScrollView: Inspectable{}
extension HeroDetailView: Inspectable{}

final class ViewTest: XCTestCase {
    
    /// Test  heroView
    func testViewHeroes() throws {
        //instaciamos la vista
        let view = HeroesView(viewModel: HerosViewModel(network: HeroUseCaseFake()))
            .environmentObject(AppState())
            
        XCTAssertNotNil(view)
        
        //Comprobamos que haya un items creado
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        // Compruebo que está el campo de texto del titulo
        let text = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(text)
        
        // Compruebo que está la lista de texto
        let textList = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(textList)
        
        // Compruebo que está instanciada la imagen de fondo
        let photoBackground = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(photoBackground)
        
    }
    
    /// Test HerosRowView
    func testViewHerosRowView() throws {
        let view =   HerosRowView(hero:
                                    Result(
                                        id: 1,
                                        name: "3-D Man",
                                        description: "SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1",
                                        thumbnail: Thumbnail(
                                            path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                                            thumbnailExtension: .jpg
                                        )))
        
        XCTAssertNotNil(view)
        
        //Comprobamos que haya un items creado
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        // Compruebo que está el rectangulo de fondo
        let rectangle = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(rectangle)
        
        // Compruebo que está el campo de texto del nombre del personaje
        let textName = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(textName)
        
        // Se comprueba que está la view de la imagen del heroe
        let photoHero = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(photoHero)
        
        // Se comprueba que está la view de la imagen del heroe si hay un error en la carga
        let photoHeroError = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(photoHeroError)
        
        // Compruebo que está el campo de texto de la descripción del personaje
        let textDescription = try view.inspect().find(viewWithId: 4)
        XCTAssertNotNil(textDescription)
        
        // Compruebo que está el scroll del campo de texto
        let scroll = try view.inspect().find(viewWithId: 5)
        XCTAssertNotNil(scroll)
        
 
        
    }
    
    /// Test DetailRowView
    func testDetailRowView() throws {
        let view = DetailRowView(hero:
                                    Result(
                                        id: 2,
                                        name: "Adam Warlock",
                                        description: "Adam Warlock is an artificially created human who was born in a cocoon at a scientific complex called The Beehive.",
                                        thumbnail: Thumbnail(
                                            path: "http://i.annihil.us/u/prod/marvel/i/mg/a/f0/5202887448860",
                                            thumbnailExtension: .jpg)))
        XCTAssertNotNil(view)
        
       
            
        // Compruebo que está el rectangulo del texto
        let rectangle = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(rectangle)
        
        // Compruebo que está el campo de texto del nombre del personaje
        let textName = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(textName)
        
        // Se comprueba que está la view de la imagen del heroe
        let photoHero = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(photoHero)
        
        // Se comprueba que está la view de la imagen del heroe si hay un error en la carga
        let photoHeroError = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(photoHeroError)
            
    
    }
    
    
    /// Test NetflixScrollView
    func testNetflixScrollView() throws {
        let view = NetflixScrollView(serie: Resultado(
            id: 23058,
            title: "All-New Guardians of the Galaxy (2017)",
            description: "",
            startYear: 2017,
            endYear: 2017,
            thumbnail: Thumbnail1(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/10/5d92452f1ab25",
                                  thumbnailExtension: .jpg)))
        
        XCTAssertNotNil(view)
        
      
        // Compruebo que está el campo de texto con las fechas de inicio y fin de la serie
        let textName = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(textName)
        
        // Se comprueba que está la view de la imagen del heroe
        let photoHero = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(photoHero)
        
        // Se comprueba que está la view de la imagen del heroe si hay un error en la carga
        let photoHeroError = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(photoHeroError)
        
        // Compruebo que está el campo de texto con el titulo de la serie
        let textTitle = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(textTitle)
  
    }
    
    /// Test HeroDetailView
    func testHeroDetailView() throws {
        let view  = HeroDetailView(viewModel: SeriesViewModel(id:1), heroe: Result(
            id: 2,
            name: "A.I.M.",
            description: "AIM is a terrorist organization bent on destroying the world.AIM is a terrorist organization bent on destroying the world.AIM is a terrorist organization bent on destroying the world.AIM is a terrorist organization bent on destroying the world.AIM is a terrorist organization bent on destroying the world.",
            thumbnail: Thumbnail(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec",
                thumbnailExtension: .jpg)))
            .environmentObject(AppState())
        
        XCTAssertNotNil(view)
        
        // Compruebo que está el rectangulo del texto
        let rectangle = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(rectangle)
        
        // Compruebo botón de volver
        let backButton = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(backButton)
        
        // Compruebo que está el campo de texto del titulo de la vista
        let textTitle = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(textTitle)
        
        // Compruebo llamada al detailRowView
        let callDetailRowView = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(callDetailRowView)
        
        // Compruebo que está el rectangulo del texto Descripción
        let rectangle1 = try view.inspect().find(viewWithId: 4)
        XCTAssertNotNil(rectangle1)
        
        // Compruebo que está el campo de texto de descripción
        let text = try view.inspect().find(viewWithId: 5)
        XCTAssertNotNil(text)
        
        // Compruebo que está el campo de texto de scroll
        let textScroll = try view.inspect().find(viewWithId: 6)
        XCTAssertNotNil(textScroll)
        
        // Compruebo que está creado el Scroll para la descripción del personaje
        let Scroll = try view.inspect().find(viewWithId: 7)
        XCTAssertNotNil(Scroll)
        
        // Compruebo que está creado el Scroll para la lista netflix
//        let ScrollHorizontal = try view.inspect().find(viewWithId: 8)
//        XCTAssertNotNil(ScrollHorizontal)
        
        // Compruebo que está el campo de texto de no hay series
        let text1 = try view.inspect().find(viewWithId: 9)
        XCTAssertNotNil(text1)
        
        // Compruebo que está la imagen de background
        let background = try view.inspect().find(viewWithId: 10)
        XCTAssertNotNil(background)
    }

}
