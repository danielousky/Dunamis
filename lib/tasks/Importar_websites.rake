desc "Importa las notas de las Websites"
task :importar_notas_website => :environment do
  puts 'Iniciando Barrido...'
  # Nota.delete_all (["resumen_id IS ? AND created_at < ?", nil, Date.today])
  # puts 'Borrando notas anteriores a hoy...'
  while true do
    puts "Inicio Vuelta: <#{DateTime.now}>"
    Website.all.each do |website|
      begin
        puts "------------------------------------"
        puts "\tIntentando cargar paginas de: #{website.nombre}" 
        website.importar_notas_website
        puts "\tCarga exitosa de paginas de #{website.nombre}" 
      rescue Exception => ex
        puts "\tError al intenter importar notas de #{website.nombre}. Error: #{ex}"
        puts "Se continua la carga ..."
      end
    end
    puts "Fin de vuelta <#{DateTime.now}>"
    sleep(5.minutes)
  end
end
