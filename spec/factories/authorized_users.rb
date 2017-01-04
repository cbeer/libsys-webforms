FactoryGirl.define do
  factory :authorized_user do |f|
    f.user_id 'testuser'
    f.user_name 'Test User'
    f.unicorn_updates 'Y'
    f.direct_upload 'Y'
    f.unicorn_circ_batch ''
    f.priv_approval ''
    f.email_stats ''
    f.priv_support ''
    f.db_access_ids ''
    f.priceforbills ''
    f.reset_recall_counter ''
    f.mgt_rpts 'Y'
    f.ora_admin 'Y'
    f.sal3_batch_req 'Y'
    f.sal3_breq_edit 'Y'
    f.file_upload 'Y'
    f.userload_rerun 'Y'
  end
end
