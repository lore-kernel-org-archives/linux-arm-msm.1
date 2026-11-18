Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994842;
	b=arbpdwPUiSV65sxo/Lc8bpju4+6u3nh8huHnkj+bSJkGyqrUiFQappnPb9pa/f6mcZZu
	 qtW0+zTc4jNCfCq9IlKkV11qjxbJkRbz6huLgyuNKXji4+MlbCnWOVmb5NcRsZkkUec7s
	 5fkbAsXWU5tQmq9oDCH9c33QOB2vGdjsqfRR1JWC9N4Wbqd35/HSS48dZTC3eQ1fUuWFt
	 TExhDp0iqC2th8GwR3F27YbVi2JkmJQfND1nZ9d0AzLO1yGGeCUK74s9KyE6K5IkUxWpQ
	 5bCB4+43r1AfukIRiIGB+LtbkUWiTJ0YyX5wyM8Oy0Iabbg5PSMpcnSMsrQW5JW75tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994842;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jAyDX6sBJRescoz2h8Wju/7fXm9bYBb2dd0D5Xs+d9o=;
	b=P+dyQxYiAVmHZh3hIEMHe8xAuX1Zojo+/j9c9MDRVmA9vuCb/4unEMGImZrqjl6Yukbw
	 Ea+nCUbHSX3eSgNLHm/7AhDvtiqkj5uH//Mt+dnoKOPD8S8GcHGfszkg285zsjEMQ3NN3
	 hzDAJcWH04Rz1sjtE922ZvSwVxyPny1atn9uH0T7tPqRteT5aSTFDoMgKBu6B3ttIdeH2
	 Fen9jLgPG49LKcwqcZE4IX2Iy5xFzJ2Zzi2ialhnIpyOxgi4oPtzCOGG9VljzeU49atJa
	 UahiFqx5qtDq9+HPP6GhK+ABbc35Ys6eCzTVKIOJCn+87z1Yq56HOqiB6QxCsZOiwUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZcYNg8dh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JcotXFhE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBD7606A325
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 09:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DBD7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZcYNg8dh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JcotXFhE
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8HQu1764095
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 09:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jAyDX6sBJRescoz2h8Wju/7f
	Xm9bYBb2dd0D5Xs+d9o=; b=ZcYNg8dhnRByell9a43mmmb6YmQfuKlErWPlGFA8
	T93elM9UY8hEJnc0ty30Qp+2NJUHvhJ08cdQ344TanLKsvrVr/TBiIc7wCMS/m7Q
	7GxvhtCAXYHo/7J6NitY8yJCkAl4CF6orJkn8MtayZ5UGSrhXwWYe9nNgUnDDeZM
	tsaDu2kNyS1tjLnvb/99CD7it1euLgpqMtfMNC8HWunt1JRLUQJP6H5c9yFFvB4r
	C7h2rmpybDaWMHQdS7IAWZutilrwYaAsgLpRi97+jMizmx6u8CGbMz1CJwv2Hhbu
	3WsxU5uCSxaMfGL6UaB9pm2wz/CqXf+ND9S5S8FUVoxwvQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvbaccd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 09:40:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94961ed97d6so134838985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 01:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794994839; x=1795599639; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jAyDX6sBJRescoz2h8Wju/7fXm9bYBb2dd0D5Xs+d9o=;
        b=JcotXFhEJOL/LsUM8EOevU7SkXXDCjDusQiqqGuLi0P18vXbrZ+F+i3F3o2vbfmmBU
         NtzuvJezis8YySRFLIQooKtKrBWcv/MnpZhhzSzWRMne3g0pnOQqzizek6qG5c3vsOh5
         qKzl+phuqD8ynu/5T+XawNODpCzpXaFe2w/QQtbMPmCrCv3b3JBBUjjq0k68I0xdYk0e
         f50WfOCmhLBfUETMX6IAurT/IycUB+ru0BRQN1lkR4SyB5WESgwMBRrnkX2ELj/xwlUx
         s0OqhQyJPnhlr64kCCSkAusNr/b+GL6z/zZj7shwN+U0YXBYzMvKtRsm3kLCFQ1DW7ai
         KAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994839; x=1795599639;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jAyDX6sBJRescoz2h8Wju/7fXm9bYBb2dd0D5Xs+d9o=;
        b=Ru9PJeFqkISrh2KydxVtta4z4DEjtcoSrlwBhm11pWnKFlucQPJG77LOPiugqy5SkO
         yginV6JtB1lSCWqMMPEmuxgb0qFLlRVx+RMEnmor1YVmZpz6Hi0Po7cBmwPjA6YMWxk/
         6Zxs2VjBcMEccwsHJ+iqNhQC4C3UI8DHwJw5Etd0Y61ABZfT8tmtvljGchW9EpfCPKtD
         Vscg5W8E5UIcuHhhdy8iuAJl7i3A6sY8P6RpNbu4ZxcniKU6RJQ8ptFoBYOWoVfC7Ipb
         4bP22ifw3znaK5G6pceCq8qKj5mw2paCAKtooquhxL6/vSI9W2uhvDJNmrYwZL9EpYP7
         mCFw==
X-Forwarded-Encrypted: i=1; AL+hErFd8lj1/bjgtbzjKYIzvLPzGvTxXwKia0DnfKlAxPdUONRUxakpaoLWBD11cPMEZRXkKsvajBij90fS5JbQ@vger.kernel.org
X-Gm-Message-State: APuU4Z/nmwJnr5re6YYMEJR7U5Z8U663daiX+yuL4afqj06ZPrZB/En3
	UGbhY9EroKf0pbRIakZ4P7gfa3DON2S17k4EY0h49UAl2tuCfjYq3kc3WKGeZa9Hs6losHUNnsT
	yYPKzA/E+OfheR+qGR7btqpQlLGFjGRPx4otBGY55jOZScaHpvU6rRG6y8xaJtO6sREvb
X-Gm-Gg: AYBFou2W3euwzEl7+BLLOnAqS/4yYO+8t/cSsqnbalyayRAnGj5Zfy8B9x1sllU8xB8
	8y6wo4l/+3FQGodJvqgyiqp3pjDCQUsblbr6A82QdfgVuP0BT9i8sO1eLTpiobN3gfZiOTKl79A
	9c/O32xiuris5I7y4egeFTL62yW4jhhx4LhqHOz6E9H+VTRPa5y/Od+bH30ZMtYGZO+99wA2fLL
	Ja+tUh3yZh0HTVDXg/EJkllQieTprebA9fScDSs5CJSaPagQjaAwdkl0qE529benj1xH0N2z9N2
	Ym++rX+8Nm0sEhvrA3VgtGFe99k9Knr8bRFB6mx3lkGyqTticIrd7pNIyNIM9xMz+rjGrjT8qsg
	L6AcSA0yFNJDXEuBVR33Y/Hpmv25XZHNBD1pS3j+mDjy+rK6EOoQnHnGth0dpYYU=
X-Received: by 2002:a05:620a:2606:b0:93e:c12d:4ecc with SMTP id af79cd13be357-9498b9a52bdmr798026485a.44.1794994839435;
        Wed, 18 Nov 2026 01:40:39 -0800 (PST)
X-Received: by 2002:a05:620a:2606:b0:93e:c12d:4ecc with SMTP id af79cd13be357-9498b9a52bdmr798020185a.44.1794994838774;
        Wed, 18 Nov 2026 01:40:38 -0800 (PST)
Received: from localhost ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78422d2dsm190598255e9.10.2026.11.18.01.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:40:37 -0800 (PST)
Date: Wed, 18 Nov 2026 10:40:35 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
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
Subject: Re: [PATCH net-next v4 08/10] net: stmmac: qcom-ethqos: add
 per-platform NOC clock voting
Message-ID: <av1yk7P2_nNBvRMs@lore-qca>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
 <20261117-shikra_ethernet-v4-8-c41902e5f2fa@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sQAqpoQJ5wAuuY31"
Content-Disposition: inline
In-Reply-To: <20261117-shikra_ethernet-v4-8-c41902e5f2fa@oss.qualcomm.com>
X-Proofpoint-GUID: 1MOn2HUewIiFE7rX-_FXqH3usliupUBB
X-Proofpoint-ORIG-GUID: 1MOn2HUewIiFE7rX-_FXqH3usliupUBB
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd7298 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=okzICtKxooRRR1VLav4A:9 a=CjuIK1q_8ugA:10 a=Dhi2dq_hunc8pPVQk9UA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfXxIdi9t21rkk+
 TMz3xZdyLsDzksA1oLiEO9p2vbLm/+yzOJaIoS20YgSFSZ7orlGC4hs0LBRJsWoHYRH+293s0vp
 etF3gkr8bk+STKGuC7Y9vIPdQVIZtXA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX+hA0A/NYuvVI
 K3NBh5TzLTFe74bB2oCY/G0Aly4hosSpjgYHzYHNyQvXAcSo1qZoivpMALOfSpLPdQ8QHouYrGv
 nzpqfFFDYfjazsNrh9tOeoDTO/Cvs2uDzCk9VXcWdVQKj5W39Z4bW369Hi9b1GwkjoPhMREzIDx
 onSV2vdkJZ6byYUCEpLlEypBLqf4KLqlm5zVKuUFQh5AwMuIkjlw7VaTJQt1F3j9MANYen8F8zD
 NU2sK8jVm7qISbth1mQ/CdSNJlgiJ5McMziDWoombA3A3IIwRBysxundLuwJFC2vwkHLy/vR/aq
 rKiDLpsjAjY4DltCeT43uHsHuQtV93i9ozEEvwIBwf+L45Gg/DGzYyI5pLSgMye+7YbqH12N9Xt
 H5pMEKX9K7TvCHAgI+B7luFQxjuewF4q1g5XdZ/pSCnw3lNHNa9U9g8VtyIkkmP7N37gp7xbmB3
 KQPUuKR82JSykCv8bLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180038

--sQAqpoQJ5wAuuY31
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Some SoCs gate the EMAC DMA path behind dedicated AXI clocks. Add
> per-platform clock-name lists and configure them as a single
> multi-clock OPP. The OPP core programs every clock rate and propagates
> the required power state.
>=20
> Select PM_OPP because DWMAC_QCOM_ETHQOS calls PM OPP APIs for
> compatibles that describe AXI OPP clocks.
>=20
> No functional change for existing compatibles. This will help us when
> we add support for Shikra.
>=20
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Hi Mohd,

just a nit inline. Fixing it:
Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Regards,
Lorenzo

> ---
>  drivers/net/ethernet/stmicro/stmmac/Kconfig        |   1 +
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 103 +++++++++++++++=
++++++
>  2 files changed, 104 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/et=
hernet/stmicro/stmmac/Kconfig
> index c6559e749c0c..15639666e837 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -146,6 +146,7 @@ config DWMAC_QCOM_ETHQOS
>  	tristate "Qualcomm ETHQOS support"
>  	default ARCH_QCOM
>  	depends on OF && (ARCH_QCOM || COMPILE_TEST)
> +	select PM_OPP
>  	help
>  	  Support for the Qualcomm ETHQOS core.
> =20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index bc443793539b..15385750b3e6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -6,6 +6,7 @@
>  #include <linux/of_net.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> +#include <linux/pm_opp.h>
>  #include <linux/phy.h>
>  #include <linux/phy/phy.h>
> =20
> @@ -102,6 +103,8 @@ struct ethqos_emac_driver_data {
>  	const char *link_clk_name;
>  	const struct dwmac4_addrs *dwmac4_addrs;
>  	bool needs_sgmii_loopback;
> +	const char * const *noc_clk_names;
> +	unsigned int num_noc_clks;
>  	/* Fixed PTP reference clock rate, used on SCMI platforms where
>  	 * firmware does not implement the clock protocol allowing linux to
>  	 * query it.
> @@ -119,6 +122,8 @@ struct qcom_ethqos {
>  	phy_interface_t phy_mode;
>  	struct dev_pm_domain_list *pds;
>  	const struct ethqos_emac_driver_data *data;
> +	struct clk_bulk_data *noc_clks;
> +	unsigned int num_noc_clks;
>  };
> =20
>  static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
> @@ -725,18 +730,61 @@ static int ethqos_mac_finish_serdes(struct net_devi=
ce *ndev, void *priv,
>  	return ret;
>  }
> =20
> +static int qcom_ethqos_set_opp(struct qcom_ethqos *ethqos)

is it clearer to have an utility routine to set a specific freq and then ca=
ll it
with freq =3D ULONG_MAX? Something like:

static in t qcom_ethqos_set_opp(struct qcom_ethqos *ethqos, unsigned long *=
freq)
{
	....
}

> +{
> +	struct device *dev =3D &ethqos->pdev->dev;
> +	unsigned long freq =3D ULONG_MAX;
> +	struct dev_pm_opp *opp;
> +	int ret;
> +
> +	opp =3D dev_pm_opp_find_freq_floor_indexed(dev, &freq, 0);
> +	if (IS_ERR(opp)) {
> +		ret =3D PTR_ERR(opp);
> +		dev_err(dev, "Failed to find AXI NOC OPP: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D dev_pm_opp_set_opp(dev, opp);
> +	dev_pm_opp_put(opp);
> +
> +	return ret;
> +}
> +
>  static int ethqos_clks_config(void *priv, bool enabled)
>  {
>  	struct qcom_ethqos *ethqos =3D priv;
>  	int ret =3D 0;
> =20
>  	if (enabled) {
> +		if (ethqos->num_noc_clks) {
> +			ret =3D qcom_ethqos_set_opp(ethqos);
> +			if (ret) {
> +				dev_err(&ethqos->pdev->dev,
> +					"NOC OPP set failed: %d\n", ret);
> +				return ret;
> +			}
> +		}
> +
>  		ret =3D clk_prepare_enable(ethqos->link_clk);
>  		if (ret) {
>  			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
> +			if (ethqos->num_noc_clks)
> +				dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
>  			return ret;
>  		}
> =20
> +		if (ethqos->num_noc_clks) {
> +			ret =3D clk_bulk_prepare_enable(ethqos->num_noc_clks,
> +						      ethqos->noc_clks);
> +			if (ret) {
> +				dev_err(&ethqos->pdev->dev,
> +					"NOC clocks enable failed: %d\n", ret);
> +				clk_disable_unprepare(ethqos->link_clk);
> +				dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
> +				return ret;
> +			}
> +		}
> +
>  		/* Enable functional clock to prevent DMA reset to timeout due
>  		 * to lacking PHY clock after the hardware block has been power
>  		 * cycled. The actual configuration will be adjusted once
> @@ -745,7 +793,12 @@ static int ethqos_clks_config(void *priv, bool enabl=
ed)
>  		qcom_ethqos_set_sgmii_loopback(ethqos, true);
>  		ethqos_set_func_clk_en(ethqos);
>  	} else {
> +		if (ethqos->num_noc_clks)
> +			clk_bulk_disable_unprepare(ethqos->num_noc_clks,
> +						   ethqos->noc_clks);
>  		clk_disable_unprepare(ethqos->link_clk);
> +		if (ethqos->num_noc_clks)
> +			dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
>  	}
> =20
>  	return ret;
> @@ -773,6 +826,52 @@ static void ethqos_ptp_clk_freq_config(struct stmmac=
_priv *priv)
>  	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
>  }
> =20
> +static void qcom_ethqos_noc_opp_cleanup(void *dev)
> +{
> +	dev_pm_opp_set_rate(dev, 0);
> +}
> +
> +/* Some SoCs gate NOC access behind dedicated clocks. Acquire them here
> + * and set up an OPP table to vote for the required rate and power.
> + */
> +static int qcom_ethqos_init_noc_clks(struct qcom_ethqos *ethqos,
> +				     const struct ethqos_emac_driver_data *data)
> +{
> +	struct dev_pm_opp_config config =3D {
> +		.clk_names =3D data->noc_clk_names,
> +		.config_clks =3D dev_pm_opp_config_clks_simple,
> +	};
> +	struct device *dev =3D &ethqos->pdev->dev;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!data->num_noc_clks)
> +		return 0;
> +
> +	ethqos->noc_clks =3D devm_kcalloc(dev, data->num_noc_clks,
> +					sizeof(*ethqos->noc_clks), GFP_KERNEL);
> +	if (!ethqos->noc_clks)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < data->num_noc_clks; i++)
> +		ethqos->noc_clks[i].id =3D data->noc_clk_names[i];
> +	ethqos->num_noc_clks =3D data->num_noc_clks;
> +
> +	ret =3D devm_clk_bulk_get(dev, ethqos->num_noc_clks, ethqos->noc_clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get NOC clocks\n");
> +
> +	ret =3D devm_pm_opp_set_config(dev, &config);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to configure OPP clocks\n");
> +
> +	ret =3D devm_pm_opp_of_add_table(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to add OPP table\n");
> +
> +	return devm_add_action_or_reset(dev, qcom_ethqos_noc_opp_cleanup, dev);
> +}
> +
>  static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
>  			     struct plat_stmmacenet_data *plat_dat)
>  {
> @@ -780,6 +879,10 @@ static int ethqos_hlos_setup(struct qcom_ethqos *eth=
qos,
>  	struct device *dev =3D &pdev->dev;
>  	int ret;
> =20
> +	ret =3D qcom_ethqos_init_noc_clks(ethqos, ethqos->data);
> +	if (ret)
> +		return ret;
> +
>  	ethqos->rgmii_base =3D devm_platform_ioremap_resource_byname(pdev, "rgm=
ii");
>  	if (IS_ERR(ethqos->rgmii_base))
>  		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
>=20
> --=20
> 2.34.1
>=20

--sQAqpoQJ5wAuuY31
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCav1ykwAKCRA6cBh0uS2t
rNQBAP4lJiuirwRLFVe8XvEt5fSxZrB9fn9Cj/z3AcKiRIBcEAEA+hNM2boDyzWS
OuhgaeR4bNxOJR5Y8qmsH2GTsrvmiAU=
=y4oA
-----END PGP SIGNATURE-----

--sQAqpoQJ5wAuuY31--
