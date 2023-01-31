package org.hotelApp

import grails.rest.Link

class Hotel {

    String name
    Integer rating
    String siteUrl
    Country country

    static belongsTo = [country: Country]

    static constraints = {
        name maxSize: 255, blank: true, unique: 'country'
        rating min: 1, max: 5
        country blank: true
        siteUrl blank: false , nullable: true/*, matches: 'http[s]?:\\/\\/www\\.[a-zA-Z]+\\.[a-z]{2,3}'*/
    }

    String toString(){
        name + " " + rating + " " + siteUrl + " " + country.name
    }
}
