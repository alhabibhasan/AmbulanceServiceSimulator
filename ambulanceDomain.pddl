(define (domain Ambulance)
(:requirements :strips :typing :fluents :durative-actions:equality)
(:types  patient location
 helicopter truck - vehicle)
(:predicates
  (at-vehicle ?t - vehicle ?l - location)
  (patient-stable ?p - patient)
  (at-patient ?p - patient ?l - location)
  (patient-loaded ?p - patient ?v - vehicle)
  (hospital ?h - location)
  (patient-at-hospital ?p - patient)
  (location-linked ?x ?y - location)
  (vehicle-full ?v - vehicle)
  (vehicle-empty ?v - vehicle)
  (fuel_pump ?l - location)
  (vehicle-prepared ?v - vehicle)
  )

(:functions (distance-between ?x ?y - location)
            (distance-travelled)
            (max_fuel ?v - vehicle)
            (fuel_level ?v - vehicle)
            (fuel_use ?x ?y - location)
            (patient-urgency ?p - patient)
            (vehicle-urgency ?v - vehicle)
            (time-to-prepare ?v - vehicle)
            (vehicle-speed-up ?v - vehicle)
)


(:durative-action drive-to-patient
    :parameters (?t - vehicle ?from ?to - location ?p - patient)
    :duration (= ?duration (distance-between ?from ?to))
    :condition (and (over all (location-linked ?from ?to))
                    (at start (at-vehicle ?t ?from))
                    (over all (vehicle-empty ?t))
                    (at start (vehicle-prepared ?t))
                    (at start (< (patient-urgency ?p) 5))
                    (at start (>= (fuel_level ?t) (fuel_use ?from ?to))))
    :effect (and (at end (not (at-vehicle ?t ?from)))
                 (at end (at-vehicle ?t ?to))
                 (at end (increase (distance-travelled) (distance-between ?from ?to)))
                 (at end (decrease (fuel_level ?t) (fuel_use ?from ?to)))
                 )
)

(:durative-action fly-to-patient
    :parameters (?hl - helicopter ?from ?to - location ?p - patient)
    :duration (= ?duration (/(distance-between ?from ?to) (vehicle-speed-up ?hl)))
    :condition (and (over all (location-linked ?from ?to))
                    (at start (at-vehicle ?hl ?from))
                    (at start (vehicle-prepared ?hl))
					(at start (>= (patient-urgency ?p)5))
                    (over all (vehicle-empty ?hl))
                    (at start (>= (fuel_level ?hl) (fuel_use ?from ?to))))
    :effect (and (at end (not (at-vehicle ?hl ?from)))
                 (at end (at-vehicle ?hl ?to))
                 (at end (increase (distance-travelled) (distance-between ?from ?to)))
                 (at end (decrease (fuel_level ?hl) (fuel_use ?from ?to)))
                 )
)

(:durative-action take-patient-to-hospital
    :parameters (?t - vehicle ?from ?to - location ?p - patient)
    :duration (= ?duration (/ (vehicle-speed-up ?t) (distance-between ?from ?to)))
    :condition (and (over all (location-linked ?from ?to))
                    (at start (at-vehicle ?t ?from))
                    (at start (at-patient ?p ?from))
                    (at start (patient-stable ?p))
                    (at start (>= (fuel_level ?t) (fuel_use ?from ?to)))
                    (over all (patient-loaded ?p ?t)))
    :effect (and  (at end (not (at-vehicle ?t ?from)))
                  (at end (not (at-patient ?p ?from)))
                  (at end (at-patient ?p ?to))
                  (at end (at-vehicle ?t ?to))
                  (at end (decrease (fuel_level ?t) (fuel_use ?from ?to)))
                  (at end (increase (distance-travelled) (distance-between ?from ?to)))
                  ))

(:durative-action drop-off-patient
    :parameters (?t - vehicle ?h - location ?p - patient)
    :duration (= ?duration 3)
    :condition (and (over all (hospital ?h))
                (over all (at-vehicle ?t ?h))
                (over all (at-patient ?p ?h))
                (at start (patient-loaded ?p ?t)))
    :effect (and (at end (patient-at-hospital ?p))
             (at end (at-patient ?p ?h))
             (at end (not (patient-loaded ?p ?t)))
             (at end (not (vehicle-full ?t)))
             (at end (not (vehicle-prepared ?t)))
             (at end (vehicle-empty ?t)))
)

(:durative-action stabilize-patient-and-pick-up
    :parameters (?t - vehicle ?p - patient ?l - location)
    :duration (= ?duration 10)
    :condition (and (over all (at-vehicle ?t ?l))
                    (over all (at-patient ?p ?l))
                    (over all (vehicle-empty ?t))
                    (over all (>= (patient-urgency ?p) (vehicle-urgency ?t)))
                    )

    :effect (and (at end (patient-stable ?p))
            (at end (patient-loaded ?p ?t))
            (at end (vehicle-full ?t))
            (at end (not (vehicle-empty ?t)))
            )
)

(:durative-action refuel
    :parameters (?t - vehicle ?l - location)
    :duration (= ?duration 10)
    :condition (and (at start (fuel_pump ?l))
                    (over all (at-vehicle ?t ?l))
                    (over all (vehicle-empty ?t))
                    (over all (<= (fuel_level ?t) (max_fuel ?t)))
                )
    :effect (and (at end (increase (fuel_level ?t) 10)))
)

(:durative-action prepare-vehicle
    :parameters (?v - vehicle)
    :duration (= ?duration (time-to-prepare ?v))
    :condition (and)
    :effect (and (at end (vehicle-prepared ?v)))
)

)
