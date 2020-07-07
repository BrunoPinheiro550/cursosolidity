/*
SPDX-License-Identifier: CC-BY-4.0

*/
pragma solidity 0.6.10;


contract Distribuicao {
    
    uint256 public valorDoProduto;
    
    /* No território de exclusividade do Distribuidor, não pode haver vendas dos produtos objeto do contrato, seja por outro distribuidor ou 
    até mesmo por venda direta pelo distribuido
    */
   
    string public territorioDeExclusividade;
    
    struct distribuidor {
        string nomeDistribuidor;
        address payable carteiraDistribuidor;
    }
    
    struct distribuido {
        string nomeDistribuido;
        address payable carteiraDistribuido;
    }
    
    uint256 public prazoDeDuracaoDoContrato;
    uint256 prazoPagamentoDoPedido;
    
     function valorAtualDoProduto() public view returns (uint256) 
    {
        return valorDoProduto;
    }
    
    constructor (
        uint256 _duracaoDoContrato,
        string memory _territorio
                )
        public {
            prazoDeDuracaoDoContrato = now + _duracaoDoContrato;
            territorioDeExclusividade = _territorio;
        }
    
    // No contrato de distribuição, o distribuidor revende os produtos do distribuido, de modo que seu lucro é obtido na revenda dos produtos no mercado em que atua.
    
    function compraDosProdutos (uint256 quantidadeDeProdutos, address payable carteiraDistribuido) public payable {
        require (now<prazoPagamentoDoPedido, "Pagamento Fora do Prazo");
        carteiraDistribuido.transfer(valorDoProduto*quantidadeDeProdutos);
        
    }
    
    // O envio dos produtos será feito pelo distribuído ao distribuidor, que deverá lhe reembolsar o frete pago.
    
    function pagamentoFrete (uint256 valorDoFrete, address payable carteiraDistribuido) public payable {
        
        carteiraDistribuido.transfer(valorDoFrete);
    }
    
}
