package org.hotelApp

class Hotel {

    String name
    Integer rating
    String siteUrl
    Country country

    static belongsTo = [country: Country]

    static constraints = {
        name maxSize: 255, blank: false, unique: 'country'
        rating min: 1, max: 5
        country blank: false
        siteUrl blank: true, matches: 'http[s]?:\\/\\/www\\.[a-zA-Z]+\\.[a-z]{2,3}'
    }
}
