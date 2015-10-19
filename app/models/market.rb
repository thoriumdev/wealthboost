class Market < ActiveRecord::Base
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      data_hash = row.to_hash
      new_hash = Hash.new()
      data_hash.each do |key, value|
        new_key = key.downcase.gsub(/[^0-9a-z ]/i, '').strip
        new_key.gsub!(' ', '_')
        new_hash[new_key] = value
      end
      binding.pry
      Market.find_or_create_by!(row.to_hash)
    end
  end
end

# <CSV::Row "data_source":"Canadian ETF Association & Bloomberg" "security_type":"ETF" "can_or_us":"CAN" "ticker":"BXF" "fund_name":"First Asset 1-5 Year Laddered Government Strip Bond Index ETF" "total_assets":"31.869" "fund_size_monthly":"0">
# <CSV::Row "Ticker":"BXF" "Fund Name":"First Asset 1-5 Year Laddered Government Strip Bond Index ETF" " Tot Asset (M) ":"31.869" "Asset class (broad)":"Fixed Income - Government" "Geographic Focus (Revised)":"Canada" "Expense Ratio ":"0.01" "Asset All. - Equity ":"  -   " "Yearly Return Year1993 CAD":nil "Yearly Return Year1994 CAD":nil "Yearly Return Year1995 CAD":nil "Yearly Return Year1996 CAD":nil "Yearly Return Year1997 CAD":nil "Yearly Return Year1998 CAD":nil "Yearly Return Year1999 CAD":nil "Yearly Return Year2000 CAD":nil "Yearly Return Year2001 CAD":nil "Yearly Return Year2002 CAD":nil "Yearly Return Year2003 CAD":nil "Yearly Return Year2004 CAD":nil "Yearly Return Year2005 CAD":nil "Yearly Return Year2006 CAD":nil "Yearly Return Year2007 CAD":nil "Yearly Return Year2008 CAD":nil "Yearly Return Year2009 CAD":nil "Yearly Return Year2010 CAD":nil "Yearly Return Year2011 CAD":nil "Yearly Return Year2012 CAD":nil "Yearly Return Year2013 CAD":nil "Yearly Return Year2014 CAD":nil "5":nil "10":nil "15":nil "20":nil "retirement":nil>