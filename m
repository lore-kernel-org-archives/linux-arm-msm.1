Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2568A559CB7
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 18:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788980123; cv=none; b=lFhbixzHPpKG28N3zU1UUCsogp6nGW+iFQ0bNs9gz9lXJGoUFF8HYIxQw35I0a/emE/mGNnIER9WDnIsp0nNQ2BBsZFfxKeelcVAuVeXX43yGgnVHenq+NNOb8SzTg7jP5Njw2njlw5NXvbRRVp+EBerqzMzNqIC5FXdRVzOutU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788980123; c=relaxed/simple;
	bh=U1NdQA2aJNUMNdQHV1yvInMQLf5QuGfXhDOBIEUVFTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gqq+Tnpykxd2aUBNR4Fvz626mFyvYXJSgjmyQ88hobnEDAYtMt6Dm2V4i8gzEiATerMLd+gykYwqoI8nSfQ9C+zpVgI9BpIjfi08w2zRjwRACCSWciI987ANAOEDDctmE1oBxbaHIeK40HiyOJ26X+bu0ZCrIlMJ7Ab596HfgSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UBKV82pF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IirCt3Gu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UBKV82pF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IirCt3Gu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689Igp9Z1608471
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 18:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M5rvIWGTIvOTCE3UxEp1CtwJ
	p24SA8aalhpVBxX9P4c=; b=UBKV82pFgJhLWH2fGpTDOEjWYD13vt/8iJpHl8CP
	Wr99KKnwqJFy13Qd4uny+m/WphgkXa5cJ/2iqk8KchWGMv5GOzJvBZtqW0J53X5e
	DWwKK2h8e1LdBzzOU2ilj3+96RVr853RiUg4DYPAh/ekLdJUW2vgs6Qah9bZKqzn
	KKlCQF1AO6wDQd7rTmmaXaUUWjurunrQcUcPH50lY3way1V77/rcx5jZnZSdakXk
	QoFrzV2r0wmw4j+vXJLlgjQk80PSz1wG92C0GQiY8FcFYOZsu2bsWmlCXHsExeCK
	TOAWRQYBg3W1cogKlmAWR3bNqjA89QvEyn6+ocAG5M1UEA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg026e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 18:55:19 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78bb7517525so860442137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 11:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788980118; x=1789584918; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M5rvIWGTIvOTCE3UxEp1CtwJp24SA8aalhpVBxX9P4c=;
        b=IirCt3GuGiCMboTbA3d4HgfwpRQGh4tvs3IA9686PXb2KsPWswH4WeZ7rkML9EJX60
         NAo+k+NA+ipBJu/MOAH5VNnroxp9po9TqPOmO/0U+f0TslYncH+WDxbM8JdajdY1bK2U
         8YsuMxbkXM5rZ0DjAzyQUb0GymdPbHcH+cLhdULSiNh2M+9V38ahujt2O4Pcz5ZqTHjA
         hife1/IjTndzyC/NiXfBiKnlzbw+wOk4nqcyCfq4fcJltMhGygPVjwdOlkd+DPvGfZI6
         jHtDWEW4+lRiaiSfADliZPDbmpBtzoaOpQkU33bkLl052XejRxlgrYCfUgYmJnT7r0SJ
         gANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788980118; x=1789584918;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M5rvIWGTIvOTCE3UxEp1CtwJp24SA8aalhpVBxX9P4c=;
        b=s7/o71agLKIr1zYf8ZJr7rCVbgZHnnEYnBvXEMQ4S7gIwEBp9mnNJ4AypZhsqX7Dbp
         dqI2sFsmSMFB3c519aVEljTt8NTt8IdvWdjcVvefoSbCESoO+hw28dTdI7BM/0zaAVVd
         rcsjVhCZ2R/+1KF3eAfXMBDC/f9rAZtd21p2p9lUzMgqKzjiV0HCm26COsokEITWAqmT
         0Fzg/6t4wcTAwyooJJgJ+6NBtTOh9kBe/uDzeYBz6hUkbLhAXFIITIx116FzrR4kupZF
         R5N6pJutojLKquPUnUU1CHKJ1TAfUDptZoSTPaNTfByHfTluMciG0cHr5VFyJi2uewlQ
         hHCw==
X-Forwarded-Encrypted: i=1; AKwUvBx2fWsRvgghogsvUdTbyzgUjW2/9Jz58I9lMiInU46TlfiEgzy1mwV2Boh4CZgzFeExnOdlWOYP9kRgPNOg@vger.kernel.org
X-Gm-Message-State: AFuF++m8CaweR1gBC8tQ50lpiC1eOquYz4YH13ojZVtERtML0MsRI/68
	mCfyq2fjaTWmtD5FFF3V3yantFM/OYyOV8uojGs2bE2eC+HyCq+h4uEobdPNPZqwsQO6LRszg/5
	vPQ5ksCUJgDEHvpSj3TFzlQZf30s7DyWOjxsdEK1bEtuERmDHd2/96t1aIeQSc7yyQStx
X-Gm-Gg: AYBFou2cvgadGRZy1Zhj1lWmtydLd5oM0s/106Bx+wzanmO5W2hhns7YXq9iK9a4P5C
	2Sr3vbLRSFNZLLLP094R8k6L6CGnJ+PgMVTIyJyNQAaMJIE1OSfRNK31wNgWukjk7kznMsAtBTT
	wneQw6ddhcKa/6ZR04VIMU9BYOGRugnJPJ4vfQujykj7jolvdeNEvqfRnyBTEztrWp98Dw1+zRd
	dAyNO71Qwk7ETzV6PorIxUZ9jUVdhk1Oo+nFSAuxNXB3rxZucNwjMUyDc33yJsIOqyEYEADIlLt
	b4T4519m3PvNLmlzsJXYI0+CI1EquYswN20gNTsgX8yp38tycTJZ5tQMapOAofUNytFRJy2ur4x
	IryhwJLNJaNyyYg==
X-Received: by 2002:a05:6102:6b01:b0:785:3211:f5e4 with SMTP id ada2fe7eead31-78a4a6c8a04mr16623462137.4.1788980117775;
        Wed, 09 Sep 2026 11:55:17 -0700 (PDT)
X-Received: by 2002:a05:6102:6b01:b0:785:3211:f5e4 with SMTP id ada2fe7eead31-78a4a6c8a04mr16623409137.4.1788980116994;
        Wed, 09 Sep 2026 11:55:16 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d49d57sm9738765e9.14.2026.09.09.11.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:55:15 -0700 (PDT)
Date: Wed, 9 Sep 2026 20:55:15 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v2 9/9] net: stmmac: qcom-ethqos: add Shikra
 EMAC support
Message-ID: <aqGrk9TLx8RJ4Xzr@lore-desk>
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
 <20260908-shikra_ethernet-v2-9-bbe3389d0652@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hx4+qUIsDXNsQO4F"
Content-Disposition: inline
In-Reply-To: <20260908-shikra_ethernet-v2-9-bbe3389d0652@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bMqDs/+Z c=1 sm=1 tr=0 ts=6aa1ab97
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=DFbXc3gujWXi7Ms4cGQA:9 a=CjuIK1q_8ugA:10 a=AyJwBSL0_NbV6ZD5tKsA:9
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: EbReKkkcLrA5CC56Vzet2RWR6NElDiuI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIxMSBTYWx0ZWRfX9lBkJH64ljGI
 lU3Ji8ai06xLEjv20Dz/kfILedd+WlR+64Lgg7jka1jpyMFmFRoOQQcGFkPHqIC/JYjC+EcHOhq
 nUDCdiaKMyUo7jgj7ylTgCXQRpIlhAsgXAizwN+nsJhpqzkryY93RBQirpULfCjwAL2jnAZk6ZJ
 J5092gGrvYuWaTvwACbk/UEDU8mUPTEvWs7/N8JfF7Tns9R4TjbSDxtToyprJaet05hVDkinXAe
 rYXk51enjF4Svnd0k9f8kvG3xR3Jwo8pCKtRTIolmgFW6bvUnUu09sXpZ4o3F2J9e/GFZgAbL0m
 t49Cacehk3DHkV+7PQHNYbjA/KW4cqv12KzzSeaIkm2m6bS1yJPpkqn5JKh9kdQ6syHoeKGe/d9
 u9b3ez9fMSJdCrt/GhSkACRbkPq9IS3Pm9CD2CFkeEMF7JPxbWPaPC5Go+BoG52Japzi4H+7IZR
 z60+Qt1POWA5Vx5q9Dw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIxMSBTYWx0ZWRfX9wbFk3ZwK9+7
 TvFsG/gxXEG9QZ0hMlzyYL1v9WQFx/NOQa9RlJYPC2RLX4p4Kugl7eqnGWTd0frbsM/yRv3GBSS
 M2M6ZqhC6Fec5j3d55TAqjSZiVM7zDw=
X-Proofpoint-ORIG-GUID: EbReKkkcLrA5CC56Vzet2RWR6NElDiuI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609090211

--hx4+qUIsDXNsQO4F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Shikra integrates two Qualcomm ETHQOS controllers based on the Synopsys
> GMAC IP, similar to previous platforms.  Register qcom,shikra-ethqos
> backed by a new shikra_data descriptor that enables the three NOC clocks
> required for DMA memory access (axi-noc, pcie-tile-axi-noc, stmmaceth)
> all at 120 MHz, and the 36-bit DMA address width.
>=20
> As part of the NOC clock voting logic, the qcom-ethqos glue driver takes
> a second enable reference on the "stmmaceth" clock, which is already
> enabled by the stmmac core. All three clocks in shikra_noc_clks[] must
> run at 120 MHz for NOC access, and managing "stmmaceth" through the same
> clk_bulk path keeps the rate-setting and enable/disable together.
>=20
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 31 ++++++++++++++++=
++++++
>  1 file changed, 31 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 8871d285941162c72e2a8f79d2eef915d9283796..c474f1e5a043777a52bcbff8a=
488640f6dbdca30 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -328,6 +328,36 @@ static const struct ethqos_emac_driver_data emac_v4_=
0_0_data =3D {
>  	},
>  };
> =20
> +static const struct ethqos_noc_clk_cfg shikra_noc_clks[] =3D {
> +	{ "axi-noc", 120000000 },
> +	{ "pcie-tile-axi-noc", 120000000 },
> +	{ "stmmaceth", 120000000 },
> +};
> +
> +static const struct ethqos_emac_driver_data shikra_data =3D {
> +	.dma_addr_width =3D 36,
> +	.has_emac_ge_3 =3D true,
> +	.noc_clk_cfg =3D shikra_noc_clks,
> +	.num_noc_clks =3D ARRAY_SIZE(shikra_noc_clks),
> +	.rgmii_config_loopback_en =3D false,
> +	.dwmac4_addrs =3D {

nit: this part seems in common between emac_v3_0_0, emac_v4_0_0 and
shikraemac_v3_0_0, emac_v3_0_0 and shikra.
Can we add a common definition? E.g.

static const struct dwmac4_addrs qcom_emac_dwmac4_addrs {
	...
};

Regards,
Lorenzo

> +		.dma_chan =3D 0x00008100,
> +		.dma_chan_offset =3D 0x1000,
> +		.mtl_chan =3D 0x00008000,
> +		.mtl_chan_offset =3D 0x1000,
> +		.mtl_ets_ctrl =3D 0x00008010,
> +		.mtl_ets_ctrl_offset =3D 0x1000,
> +		.mtl_txq_weight =3D 0x00008018,
> +		.mtl_txq_weight_offset =3D 0x1000,
> +		.mtl_send_slp_cred =3D 0x0000801c,
> +		.mtl_send_slp_cred_offset =3D 0x1000,
> +		.mtl_high_cred =3D 0x00008020,
> +		.mtl_high_cred_offset =3D 0x1000,
> +		.mtl_low_cred =3D 0x00008024,
> +		.mtl_low_cred_offset =3D 0x1000,
> +	},
> +};
> +
>  static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
>  {
>  	struct device *dev =3D &ethqos->pdev->dev;
> @@ -962,6 +992,7 @@ static const struct of_device_id qcom_ethqos_match[] =
=3D {
>  	{ .compatible =3D "qcom,qcs404-ethqos", .data =3D &emac_v2_3_0_data},
>  	{ .compatible =3D "qcom,sa8775p-ethqos", .data =3D &emac_v4_0_0_data},
>  	{ .compatible =3D "qcom,sc8280xp-ethqos", .data =3D &emac_v3_0_0_data},
> +	{ .compatible =3D "qcom,shikra-ethqos", .data =3D &shikra_data},
>  	{ .compatible =3D "qcom,sm8150-ethqos", .data =3D &emac_v2_1_0_data},
>  	{ }
>  };
>=20
> --=20
> 2.34.1
>=20
>=20

--hx4+qUIsDXNsQO4F
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqGrkwAKCRA6cBh0uS2t
rArrAP9R8xEG+zLWVTIluHMbwn06eRZVDw4njA5XwSEu+LwHrQEAo4TJM5euvbra
4jutQknO4Wvvhxx1ELycGgKuzOGCTw0=
=m+rn
-----END PGP SIGNATURE-----

--hx4+qUIsDXNsQO4F--
