packets = require('packets')


_addon.name = 'InstantBid'
_addon.version = '0.1'
_addon.author = 'Otamarai, Ivaar'
--Purely ripped from Ivaar's AuctionHelper but only listed successful bids as functionality. In an attempt to mimic ashita's InstantAH but without client injection capability

windower.register_event('incoming chunk', function(id, original, modified, injected, blocked)
    if id == 0x04C then
        local packet = packets.parse('incoming',original)
        if packet['Type'] == 0x0E then
            if original:byte(7) == 1 then
                windower.add_to_chat(207, 'Bid Success')
            elseif original:byte(7) == 0xC5 then
                windower.add_to_chat(207, 'Bid Failed')
            end
        end
    end
end)