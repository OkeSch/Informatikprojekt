get "/home" do
  @title="Startseite"
  erb :home
end

enable :inline_templates

__END__
@@home
  <section>
    <p>Welcome to this website all about the songs of the great
      Frank Sinatra</p>
      <img src="/images/sinatra.jpg" alt="Frank Sinatra">
  </section>
