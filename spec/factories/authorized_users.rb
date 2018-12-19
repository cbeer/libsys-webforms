FactoryBot.define do
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
    f.accession_number 'A'
    f.edi_inv_view 'Y'
    f.edi_inv_manage 'Y'
  end
  factory :admin_user, class: AuthorizedUser do |f|
    f.user_id 'admin_user'
    f.user_name 'Admin User'
    f.unicorn_updates 'A'
    f.direct_upload 'Y'
    f.unicorn_circ_batch ''
    f.priv_approval ''
    f.email_stats ''
    f.priv_support ''
    f.db_access_ids ''
    f.priceforbills ''
    f.reset_recall_counter ''
    f.mgt_rpts 'A'
    f.ora_admin 'Y'
    f.sal3_batch_req 'Y'
    f.sal3_breq_edit 'Y'
    f.file_upload 'Y'
    f.userload_rerun 'Y'
    f.accession_number 'A'
    f.digital_bookplates 'A'
    f.edi_inv_view 'A'
    f.edi_inv_manage 'A'
    f.package_manage 'A'
  end
  factory :staff_user, class: AuthorizedUser do |f|
    f.user_id 'staff_user'
    f.user_name 'Staff User'
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
    f.accession_number 'Y'
    f.digital_bookplates 'Y'
    f.edi_inv_view 'Y'
    f.edi_inv_manage 'Y'
    f.package_manage 'Y'
  end
  factory :blank_user, class: AuthorizedUser do |f|
    f.user_id 'blank_user'
    f.user_name 'Blank User'
    f.unicorn_updates ''
    f.direct_upload ''
    f.unicorn_circ_batch ''
    f.priv_approval ''
    f.email_stats ''
    f.priv_support ''
    f.db_access_ids ''
    f.priceforbills ''
    f.reset_recall_counter ''
    f.mgt_rpts ''
    f.ora_admin ''
    f.sal3_batch_req ''
    f.sal3_breq_edit ''
    f.file_upload ''
    f.userload_rerun ''
    f.accession_number ''
    f.edi_inv_view ''
    f.edi_inv_manage ''
  end
end
