SELECT count(*) = 4 AS check
FROM pg_constraint
WHERE conname IN ('ch_nn_person_id',
                  'ch_nn_pizzeria_id',
                  'ch_nn_discount',
                  'ch_range_discount')