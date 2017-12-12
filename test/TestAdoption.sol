pragma solidity ^0.4.11;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
  Adoption adoption = Adoption(DeployedAddresses.Adoption());

  // Testing the adopt() function
  function testUserCanAdoptPet(){
    uint returnedId = adoption.adopt(8);

    uint expected = 8;

    Assert.equal(returnedId, expected, "Adoption of pet ID 8 should be recorded.");
  }

  // Testing retrieval of a single pet`s owner
  function testGetAdopterAddressbyPetId(){
    // Expected owner is this contract
    address expect = this;

    address adopter = adoption.adopters(8);

    Assert.equal(adopter, expected, "Owner of the pet ID 8 should be recorded.")
  }
 }
