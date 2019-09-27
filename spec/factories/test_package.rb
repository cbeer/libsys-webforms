# frozen_string_literal:true

FactoryBot.define do
  factory :test_package do
    package_id { 'ws' }
    package_name { 'World Scientific eBooks' }
    package_status { 'Active' }
    vendor_name { 'World Scientific Publishing' }
    data_pickup_type { 'AFS' }
    afs_path { 'WorldScientific' }
    ftp_list_type { '1' }
    package_url { 'https {consul.stanford.edu/x/JQCMB' }
    holding_code { 'SUL-INT-H' }
    comments { 'spreadsheet records {erge only and match to 020' }
    url_field { '856' }
    vendor_id_read { '001' }
    vendor_id_write { '001' }
    access_note { 'YES' }
    export_note { 'YES' }
    junktag_file { 'junktag.eload_WorldScientific' }
    encoding_level { 'ASIS' }
    vnd_catcode { 'World Scientific Publishing' }
    match_opts { '020}776_isbn' }
    proc_type { 'newmerge' }
    update_040 { 'YES' }
    date_cat { 'TODAY' }
    export_auth { 'WEEKLY' }
    preprocess_modify_script { '/s/SUL/Bin/Eloader/WorldScientific/modify_worldscientific.pl' }
  end
end
