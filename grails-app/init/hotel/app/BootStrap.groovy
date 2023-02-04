package hotel.app


import org.hotelApp.Country

class BootStrap {

    CountryService countryService
    HotelService hotelService

    def init = { servletContext ->

        Random rd = new Random();

        countryService.save('Russia', 'Moscow')
        countryService.save('USA', 'Washington')
        countryService.save('Germany', 'Berlin')
        countryService.save('Greece', 'Athens')

        for (i in 1..50) {
            countryService.save('country_name' + rd.nextInt(100), 'capital' + rd.nextInt(100))
        }
        Integer countryListSize = Country.list().size()

        for (i in 1..50) {
            hotelService.save('hotelName' + rd.nextInt(500),
                    rd.nextInt(5) + 1,
                    'https://www.hotelSite' + (rd.nextInt(500) + 500) + '.com',
                    Country.list().get(rd.nextInt(countryListSize)).save())
        }

    }
    def destroy = {
    }
}
