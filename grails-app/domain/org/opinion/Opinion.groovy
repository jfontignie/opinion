package org.opinion

class Opinion {

    transient originalEvaluation
    int evaluation

    Origin origin

    Date dateCreated
    Date lastUpdated

    boolean recommend

    String comment

    def setEvaluation(newEvaluation) {
        originalEvaluation = this.evaluation
        this.evaluation = newEvaluation
    }

    def afterInsert(){
        product.average = product.average * (product.opinions.size()-1) + evaluation
        product.save()
    }

    def beforeUpdate() {
        if (originalEvaluation != evaluation) {
            log.info("Resetting the average of the object")
            product.average = (product.average*product.opinions.size()-originalEvaluation + evaluation)/product.opinions.size()
            product.save()
        }
    }

    static belongsTo = [product:Product, user:User]

    static constraints = {
        evaluation(min: 0, max: 5)
    }
}
