// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.10;

contract Representacao {
    
    string public representante;
    string public representado;
    string public territorio;
    uint256 private ValorDaNotaFiscalDeVenda;
    uint256 constant PercentualDaComissao=5;
    
    
    
    constructor(
        string memory _representante,
        string memory _representado,
        string memory _territorio
        
                )
                
        public {
            representante=_representante;
            representado=_representado;
            territorio=_territorio;
            
                }
                
   
            
   function ValueComission (uint256 PercentualDaComissao, uint256 ValorDaNotaFiscalDeVenda) public returns (uint256 ValorDaComissao)
   
    {
            ValorDaComissao=PercentualDaComissao*ValorDaNotaFiscalDeVenda;
            return ValorDaComissao;
            
            
        if (ValorDaNotaFiscalDeVenda>100)
        {
            ValorDaComissao=6;
        }
        
    }
}
