require_relative "sqlite_connector"

def sql(query)
    use_database "sinatra", :return_format => "hash" do |db|
        db.execute query
    end
end
