class Expenditures < ActiveRecord::Migration
  def change
    create_table :expenditures do |t|
      t.datetime  :row_date
      t.datetime  :review_date
      t.integer   :ta_inv_line_key
      t.string    :ta_fund_code
      t.integer   :ta_fund_total_paid
      t.string    :ta_gl_code
      t.integer   :ta_ord_line_key
      t.integer   :ta_inv_key
      t.datetime  :ta_date_2encina
      t.string    :ta_encina_key
      t.integer   :ta_invoice_total_withtax
      t.integer   :ta_tax_total
      t.string    :ta_taxtype_flag
      t.datetime  :ta_vend_inv_date
      t.string    :ta_vend_inv_num
      t.string    :ti_inv_lib
      t.string    :ti_inv_line_note
      t.string    :ti_inv_line_num
      t.integer   :ti_inv_line_total_us
      t.string    :ti_unicorn_inv_num
      t.string    :ti_inv_line_type
      t.integer   :ti_inv_line_total_vendor
      t.string    :ti_fiscal_cycle
      t.string    :ti_vendor_alpha_id
      t.string    :to_order_id
      t.integer   :to_order_line_num
      t.integer   :to_ord_key
      t.string    :to_order_line_control_type
      t.integer   :to_order_line_copies
      t.datetime  :to_order_line_cre_date
      t.integer   :to_order_line_dollars_paid
      t.string    :to_order_line_seg_type
      t.datetime  :ts_date_mailed
      t.string    :ol_selector
      t.string    :ol_cat_key
      t.string    :ol_call_seq
      t.string    :ds_hold_code
      t.string    :d2_hldc_lib
      t.string    :d2_hldc_loc
      t.string    :d2_hldc_type
      t.string    :sc_lib
      t.string    :sc_id
      t.string    :sc_cat1
      t.string    :sc_cat2
      t.datetime  :or_create_date
      t.string    :ca_title
      t.string    :ca_author
      t.string    :ca_year
      t.string    :ca_place
      t.string    :ca_lang
      t.string    :ca_pub260
      t.string    :cn_callnum
      t.string    :vn_name_key
      t.string    :fn_name_key
      t.string    :fn_level1
      t.string    :fn_level2
      t.string    :fn_level3
      t.string    :fn_level4
      t.string    :fn_fund_key
      t.string    :fg_funding_key
      t.string    :fg_fundcyc_key
      t.string    :ca_fmt
      t.string    :ca_020
      t.string    :ca_022
      t.string    :ca_024
      t.string    :ca_series
      t.string    :ca_962
      t.string    :cn_shlv_key
      t.string    :ol_volume
      t.string    :i_created_by
      t.string    :i_modified_by

      t.timestamps null: false
    end
  end
end