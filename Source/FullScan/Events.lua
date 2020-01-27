Auctionator.Events.Register("AUCTION_HOUSE_SHOW", function()
  Auctionator.FullScan.Initialize()
  Auctionator.FullScan.State.Completed = false
end)

Auctionator.Events.Register("AUCTION_HOUSE_CLOSED", function()
  if Auctionator.FullScan.State.InProgress and not Auctionator.FullScan.State.Completed then
    Auctionator.FullScan.State.InProgress = false

    Auctionator.Utilities.Message(
      "Full scan failed to complete. " ..
      Auctionator.FullScan.NextScanMessage()
    )
  end
end)

Auctionator.Events.Register("REPLICATE_ITEM_LIST_UPDATE", Auctionator.FullScan.ProcessReplicateResults)
