pragma solidity ^0.4.18;

import './ERC20.sol';
import './SafeMath.sol';

contract YourToken is ERC20 {
        
    using SafeMath for uint256;

    string public constant symbol = '';
    string public constant name = '';

    // Amount of tokens currentl in circulation
    uint256 public totalSupply_;
    
    // Owner address of the contract
    address public owner_;

    // User balances of tokens
    mapping (address => uint256) public balances_;

    event LogErrorString(string errorString);
    
    function error(string _errorMessage) internal returns(bool) {
        LogErrorString(_errorMessage);
        return false;
    }

    function YourToken() public {
        //TODO
    }

    /**
     * @param _owner The address from which the balance will be retrieved.
     * @return The balance
     */
    function balanceOf(address _owner) external constant returns (uint256) {
        //TODO
    }

    /**
     * @return total amount of tokens.
     */
    function totalSupply() external constant returns (uint256) {
        //TODO
    }

    /**
     * @dev Mint tokens and allocate them to the specified user.
     * @param _to The address of the recipient.
     * @param _value The amount of tokens to be minted and transferred.
     * @return Success of the transaction.
     */
    function mint(address _to, uint _value) external returns (bool) {
        // TODO only owner can mint, check if owner called this function

        // TODO cannot min less than 1 token

        if (_to == address(0))
            return error('Cannot mint tokens to address(0)');

        // TODO do mint

        Transfer(address(0), _to, _value);

        return true;
    }

    /**
     * @dev send `_value` token to `_to` from `msg.sender`
     * @param _to The address of the recipient, sent from msg.sender.
     * @param _value The amount of token to be transferred
     * @return Whether the transfer was successful or not
     */
    function transfer(address _to, uint256 _value) external returns (bool) {
        //TODO cannot transfer less than 0

        //TODO cannot transfer more than balance

        //TODO do transfer

        Transfer(msg.sender, _to, _value);

        return true;
    }

    /**
     * @param _from The address transferring from.
     * @param _to The address transferring to.
     * @param _amount The amount to transfer.
     * @return The success of this method.
     */
    function transferFrom(address _from, address _to, uint256 _amount)
        external returns (bool) {
        //TODO cannot transfer less than 0

        //TODO cannot transfer more than balance

        //TODO only owner of token has God's right to transfer (in real world
        //    this function is used only for approvals

        //TODO do transfer

        Transfer(_from, _to, _amount);
        return true;
    }

    function () payable public {
        //Ignore, not enough time
    }

    /**
     * @dev Approve a user to spend your tokens.
     */
    function approve(address _spender, uint256 _amount) external returns (bool) {
        //Ignore, not enough time
        return true;
    }

        /**
     * @return the allowance the owner gave the spender
     */
    function allowance(address _owner, address _spender) external constant returns(uint256) {
        //Ignore, not enough time
        return 1;
    }

}
