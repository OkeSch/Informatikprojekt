get "/contact" do
  @title="Kontakt"
  erb :contact
end

enable :inline_templates

__END__

@@ contact
  <section>
    <p>You can contact me by sending an email to <a href='mailto:schule@raeker.com'>schule@raeker.com</a></p>
  </section>
