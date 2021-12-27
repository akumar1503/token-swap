const { expect } = require('chai');
const { tokens } = require('./helpers');

const CurveOracle = artifacts.require('CurveOracle');

const CURVE_ADDRESS_PROVIDER = '0x0000000022D53366457F9d5E68Ec105046FC4383';

describe('CurveOracle', async function () {
    before(async function () {
        this.curveOracle = await CurveOracle.new(CURVE_ADDRESS_PROVIDER);
    });

    it('should return the exchange rate and pool for DAI -> USDC', async function () {
        const res = await this.curveOracle.getRate(tokens.DAI, tokens.USDC);

        console.log(`rate: ${res.rate}, poolAddress: ${res.pool}`);
        expect(res.rate).to.not.be.null;
        expect(res.pool).to.not.be.null;
    });
});
