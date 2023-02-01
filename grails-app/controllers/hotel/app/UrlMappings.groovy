package hotel.app

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {

            }
        }
        "/" redirect: "/hotel"
        "/home" redirect: "/hotel"

        "/hotel"(controller: 'hotel')
        "/country"(controller: 'country')

        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
