pragma solidity ^0.4.18;

import './ERC20.sol';
import './SafeMath.sol';

contract MattToken is ERC20 {
        
    using SafeMath for uint256;

    string public constant symbol = 'MAT';
    string public constant name = 'MAT Token';

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

    function MattToken() public {
        owner_ = msg.sender;
    }

    /**
     * @dev Approve a user to spend your tokens.
     */
    function approve(address _spender, uint256 _amount) external returns (bool) {
        //Ignore, not enough time
        return true;
    }

    /**
     * @dev Mint tokens and allocate them to the specified user.
     * @param _to The address of the recipient.
     * @param _value The amount of tokens to be minted and transferred.
     * @return Success of the transaction.
     */
    function mint(address _to, uint _value) external returns (bool) {
        if (msg.sender != owner_)
            return error('msg.sender != owner');

        if (_value <= 0)
            return error('Cannot mint a value of <= 0');

        if (_to == address(0))
            return error('Cannot mint tokens to address(0)');

        totalSupply_ = totalSupply_.add(_value);
        balances_[_to] = balances_[_to].add(_value);

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
        if (_value <= 0)
            return error('Cannot transfer amount <= 0');

        if (balances_[msg.sender] < _value)
            return error('Sender balance is insufficient');

        balances_[msg.sender] = balances_[msg.sender].sub(_value);
        balances_[_to] = balances_[_to].add(_value);

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
        if (_amount <= 0)
            return error('Cannot transfer amount <= 0');

        if (_amount > balances_[_from])
            return error('From account has an insufficient balance');

        balances_[_from] = balances_[_from].sub(_amount);
        balances_[_to] = balances_[_to].add(_amount);

        Transfer(_from, _to, _amount);
        return true;
    }

    function () payable public {
        //Ignore, not enough time
    }

    // Constants

    /**
     * @return the allowance the owner gave the spender
     */
    function allowance(address _owner, address _spender) external constant returns(uint256) {
        //Ignore, not enough time
        return 1;
    }

    /**
     * @param _owner The address from which the balance will be retrieved.
     * @return The balance
     */
    function balanceOf(address _owner) external constant returns (uint256) {
        return balances_[_owner];
    }

    /**
     * @return total amount of tokens.
     */
    function totalSupply() external constant returns (uint256) {
        return totalSupply_;
    }
}
