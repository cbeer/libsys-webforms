###
# Utilities to provide sql queries for different environments
###
module SqlUtils
  extend ActiveSupport::Concern

  def EndowedFundsReport.fund_sql(fund_code, date_start, date_end)
    if Rails.env.test?
      Expenditures.where(ta_fund_code: fund_code)
    else
      Expenditures.where("ta_fund_code = ? AND ta_date_2encina between
                   TO_DATE(?, 'yyyy-mm-dd') AND TO_DATE(?, 'yyyy-mm-dd')", fund_code, date_start, date_end)
    end
  end

  def EndowedFundsReport.fy_sql(fund_code, date_start, date_end)
    if Rails.env.test?
      Expenditures.where(ta_fund_code: fund_code)
    else
      Expenditures.where('ta_fund_code = ? AND (ti_fiscal_cycle >= ? AND ti_fiscal_cycle <= ?)',
                         fund_code, date_start, date_end)
    end
  end

  def EndowedFundsReport.fund_begin_sql(fund_begin, date_start, date_end)
    if Rails.env.test?
      Expenditures.where('ta_fund_code LIKE ?', "%#{fund_begin}%")
    else
      Expenditures.where("ta_fund_code LIKE ? AND ti_inv_lib = 'SUL' AND ta_date_2encina between
                        TO_DATE(?, 'yyyy-mm-dd') AND TO_DATE(?, 'yyyy-mm-dd')",
                         "%#{fund_begin}%", date_start, date_end)
    end
  end

  def EndowedFundsReport.fy_begin_sql(fund_begin, date_start, date_end)
    if Rails.env.test?
      Expenditures.where('ta_fund_code LIKE ?', "%#{fund_begin}%")
    else
      Expenditures.where("ta_fund_code LIKE ? AND ti_inv_lib = 'SUL' AND
                       (ti_fiscal_cycle >= ? AND ti_fiscal_cycle <= ?)",
                         "%#{fund_begin}%", date_start, date_end)
    end
  end
end
