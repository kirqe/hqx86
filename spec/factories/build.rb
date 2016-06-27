FactoryGirl.define do
  factory :build do
    b_type "mid"
    name "klinker's build"
    spec "GA-Z97X-UD7 TH / i7 4790K / 32GB / GTX 770 / 10.9.4"
    mb "Gigabyte GA-P55A-UD3 rev. 1 Bios F11"
    cpu "Intel Core i5 750 2,66Ghz overclocked @ 3,66Ghz/183x20"
    gpu "Gigabyte GTX560Ti 1GB Superoverclock GV-N560SO-1GI-950"
    ram "2x2GB + 2x4GB DDR3 Kingston HyperX Blue 1600Mhz overclocked @ 1830Mhz"
    disk "Samsung 840 Basic 120GB (OSX ML System)"
    chassis "Corsair 600T"
    cost 1000
    os "10.9.4 Mavericks"
    im "Unibeast"
    status "success"
    body "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolor"
    slug ""
    published true
    tweeted false
    other_hw "http://example.com/"
    mb_url "http://example.com/"
    cpu_url "http://example.com/"
    gpu_url "http://example.com/"
    ram_url "http://example.com/"
    disk_url "http://example.com/"
    chassis_url "http://example.com/"
    user
  end
end
