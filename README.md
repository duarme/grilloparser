# Super-simple parser for the most voted comments on Beppegrillo.it

Since the most voted comments view ("commenti più votati") has been discontinued from beppegrillo.it, this simple parser is to, somehow, bring it back.

## Usage
`$ ruby grilloparse.rb [URL]`   

* URL must be a beppegrillo.it post url.
* It requires the nokogiri gem, you can get it by `gem install nokogiri`;
* Works with ruby v. 1.9.3.

#### Example
`$ ruby grilloparse.rb http://www.beppegrillo.it/2013/10/che_cose_una_piattaforma_un_portale_no_e_il_sistema_operativo_del_m5s.html`   

Have fun!