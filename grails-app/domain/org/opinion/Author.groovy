package org.opinion

class Author {

    String firstName
    String lastName

    static hasMany = [books: Book]


    Date dateCreated
    Date lastUpdated

    static constraints = {
        firstName(nullable: false, blank: false)
        lastName(nullable: false, blank: false)
    }

    String toString() {
        return firstName + " " + lastName;
    }
}
