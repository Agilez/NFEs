require 'savon'

client = Savon.client(wsdl: 'https://nfehomologacao.etransparencia.com.br/sp.taubate/webservice/aws_nfe.aspx?WSDL',
		log: true,
		log_level: :debug,
		namespace_identifier: :nfe,
		convert_request_keys_to: :none,
		pretty_print_xml: true)

ope = client.operations

msg = {
	Sdt_processarpsin: {
		Login: {
			CodigoUsuario: 'XXXXXXXX',
			CodigoContribuinte: 'XXXXXXXX'
		},
		SDTRPS: {
			Ano: '2015',
			Mes: '07',
			CPFCNPJ: '21187413000105',
			DTIni: '23/07/2015',
			DTFin: '23/07/2015',
			TipoTrib: '4',
			DtAdeSN: '23/07/2015',
			AlqIssSN_IP: '2,0',
			Versao: '2.00',
			Reg20: {
				Reg20Item: {
					TipoNFS: 'RPS',
					NumRps: '7',
					SerRps: '1',
					DtEmi: '23/07/2015',
					RetFonte: 'NAO',
					CodSrv: '01.01',
					DiscrSrv: 'USO DA PLATAFORMA ONLINE',
					VlNFS: '10,00',
					VlDed: '0,00',
					DiscrDed: '',
					VlBasCalc: '10,00',
					AlqIss: '2,00',
					VlIss: '0,20',
					VlIssRet: '0,00',
					CpfCnpTom: '34662678463',
					RazSocTom: 'MONTEIRO LOBATO',
					TipoLogtom: 'AVENIDA',
					LogTom: 'PAULISTA',
					NumEndTom: '1121',
					ComplEndTom: 'CJ 100',
					BairroTom: 'BELA VISTA',
					MunTom: 'SAO PAULO',
					SiglaUFTom: 'SP',
					CepTom: '01322050',
					Telefone: '(11)9999-9999',
					InscricaoMunicipal: '',
					Email1: 'monteiro@lobato.com'
				}
			},
			Reg90: {
				QtdRegNormal: '1',
				ValorNFS: '10,00',
				ValorISS: '0,20',
				ValorDed: '0,00',
				ValorIssRetTom: '0,00',
				QtdReg30: '0',
				ValorTributos: '0,00'
			}
		}
	}
}

response = client.call(:processarps, message: msg)

puts response.body
