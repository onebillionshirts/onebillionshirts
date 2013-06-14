namespace :db do
  task cost_mat: :environment do
    puts "Deleting existing cost Matrix.."
    CostMatrix.destroy_all

    mat = CostMatrix.create(name: "default")

    mat.matrix_cols.create(c_1: 1.53, c_2: 2.45, c_3: 3.38, c_4:4.30, c_5:5.23, c_6:6.15 , count:24)
    mat.matrix_cols.create(c_1: 1.06, c_2: 1.63, c_3: 2.19, c_4:2.75, c_5:3.31, c_6:3.88 , count:48)
    mat.matrix_cols.create(c_1: 0.86, c_2: 1.22, c_3: 1.58, c_4:1.93, c_5:2.29, c_6:2.65 , count:72)
    mat.matrix_cols.create(c_1: 0.70, c_2: 0.91, c_3: 1.11, c_4:1.32, c_5:1.52, c_6:1.73 , count:144)
    mat.matrix_cols.create(c_1: 0.60, c_2: 0.75, c_3: 0.91, c_4:1.06, c_5:1.21, c_6:1.36 , count:288)
    mat.matrix_cols.create(c_1: 0.48, c_2: 0.60, c_3: 0.73, c_4:0.85, c_5:0.98, c_6:1.11 , count:576)
    mat.matrix_cols.create(c_1: 0.37, c_2: 0.43, c_3: 0.50, c_4:0.56, c_5:0.63, c_6:0.69 , count:1000)
    mat.matrix_cols.create(c_1: 0.36, c_2: 0.42, c_3: 0.47, c_4:0.53, c_5:0.59, c_6:0.65 , count:2000)
  end
end
