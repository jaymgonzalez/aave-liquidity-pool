const hre = require('hardhat')

const IPoolAddress = '0xc4dCB5126a3AfEd129BC3668Ea19285A9f56D15D'

async function main() {
  console.log('deploying...')
  const MarketInteractions = await hre.ethers.getContractFactory(
    'MarketInteractions'
  )
  const marketInteractions = await MarketInteractions.deploy(IPoolAddress)

  await marketInteractions.deployed()

  console.log('Flash loan contract deployed: ', marketInteractions.address)
}

main().catch((error) => {
  console.error(error)
  process.exitCode = 1
})
