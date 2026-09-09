Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14391367F25
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 17:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974179; cv=none; b=RKPSDhM+gxxHumg/+VV5xdAfg68MUVpxzblevM9XgeKKIRg8Wj8WX0k6bNmHZRSoDLX77p4EsInPoLgVD3mQp/5uR1FUpWB90B9OGj+T1MeEs+oAoqMfESjqR127L/jnObd9hG38SK1yjkSFjxq78lKLjEaZm+NHZRKUWXkvqsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974179; c=relaxed/simple;
	bh=Edmagecg2PaIU44/PLytw5C3Adgmsos2KNBXGxIxnCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4ZOvd+RSkxX6YlP7etTg6Vb7GLgJUJnfjQUIR/7Bpi2iORV38h9Mt7IKy1B1UCkUVgUIfgcjbi3nr8sq3CysN2xLsj6sWyE5nta0r/XvBLqnRIQMQ2bwgyglhknBl6bW38N+CYx7AUEJuVsKOebTDgpUVnkwlwJ8ZRAFaYxz9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S72Welgf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/AdubD5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S72Welgf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/AdubD5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7awA2600048
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 17:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NrIsFfwedfuLeKvzU70rKNtT
	+rVIhJ0VJ39qxRIr5Qw=; b=S72WelgfsaZtrz5JllU+R+NP9CCOf2QzT2nd3iR6
	wVf8+viNAnTjKlWgnXqmTJa+2+dOvFTecJ/+pvjjoef8HDQrzr3XkftTUg//NuT5
	QE2XVeIArXON82vf2exGclBNbCWt9I8jtGwOKQAOesYkbRJCpqFlVqVHwI7H4oCF
	j8otjdTeVixQT3MxPzRBRHAmjqQWv5JN1oO39r2VPoj9ccSctHWm5xJVArVMH3Fr
	khQaXcy0sO/7WGuWyZPw68FrU0mR/J3a+mR8p31Wx0leOSVanwZrRR86HEdyCSXx
	MZhI/FigkoPuuT56ufkksltirKf6M6JnMHyWflixtksxOQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk87r1712-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 17:16:17 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97c3796d17dso408943241.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 10:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788974176; x=1789578976; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NrIsFfwedfuLeKvzU70rKNtT+rVIhJ0VJ39qxRIr5Qw=;
        b=P/AdubD5CbjshzP1yZdjveCGdDZ9/HPX72/8sINHn+fiYgnL4C3gaZItFWtxacGgkB
         nTZeoE/5r7Sfyzn/oSjoq/wPffaNI1LIcHPeEof8w5MJBlEnqYD7IuhWDCcjsDdBbBvh
         VlHAnKMFzMOm6kEAA9PMHuidnfyea3dlShc89akxCkILVCic1aOJU1B0yFUfhfiP9NSi
         GvkAZUkAXb/vGRpGseAEqZGSASF5R6gUqLvtMQP14K8Gj9BuFB29/DEYotP20X2EKvoC
         2iPg49lJWLC7nkGEPl5N+PD8/eVZ6tQF2+0Ve1lKOd7hIegru6HUg3AQ2Ty8NIeiRLEa
         NN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788974176; x=1789578976;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NrIsFfwedfuLeKvzU70rKNtT+rVIhJ0VJ39qxRIr5Qw=;
        b=U8ardK8nLgyJtyJKaWMhaI47HnWpiNr34KZRJ93gDZJ/unTonFDDUpRDNJ2QWpYQ/x
         PHhhXNnkH7CRtDCeeE8KmqKSWl/SlOxLyLvpIlZwZyU0HvnniFtLo9mHAnHYpWTw0YKS
         WsrZmKdUdKWbjLbsNi6lWpIsEkfzqtY+pbK/KqzNG7ckHeNlDA7ne0uED3ec/bvz2kns
         Qs5NemnV8Nv11kC0jpykWsK25nuTpm6m/kpEv/cxyB9cfGH/44INDJ54Dhpfj3m5CSze
         6Fyke4nfjPzxgL5h5hB8EhZ1fy6xcCAoYTq7yLvs45JSq67j6xVYE2R6zS7hs9vC2Jvo
         aNyw==
X-Forwarded-Encrypted: i=1; AKwUvBzi9mG1Xf7WwI8nwhZwjsNIliw1uhEm4pJHfO7SPTxTjsFnDlmjxwqOveRwiyvf2phdKITeeXHHzjOaj8Kr@vger.kernel.org
X-Gm-Message-State: AFuF++k7F1zeek4j6cyNVp4dlk7+E61prbvlHDUVZIAgSlLE7oJyFNxh
	4pF9xX7XDTZx+1832KSF3nmg5diIq6Bg7u0RXEe7jQ6X//QYQYlYRNjCZuSLW1W49Ls54f+i4Q/
	etekrjZbHKSfw6OFNm6C+5bTx/vXlQZyuG4cJcaHQyi7pSmCgknrRMwSefLSWNYy5ISjB
X-Gm-Gg: AYBFou2/M8ul/+h9LL32RHKZ+NVDJruR1bCTO63zEqQIEMQaeARcJ4Iu/dKGxyT+lxS
	JI+lT9Say1K2h1NUouAOpsLvF74Y9r9L+APvVQVb3JTC34bL67ul8cxKJA54GUdjHWu5ejyzUsH
	BEdzemA12szrY+xnGBHO85gyMisf7n+FYnNGsxZU5hZYFQp0XzRHrXzCOQGdphEau6r4lopuoy5
	e0aPHaJxRQel00hVC+oQyF2XU9NkmBYJU8Uz6PgHDUvdVXy/RfbLuBojw28vMNJkQHDnMAcuE9O
	EpP1xki9sXHlKpTlR1J5yY/OyqRASB5GkXS2DLeY0AL7MqEtR0kr+zNa7iVL6WszwCwKYMh4vdF
	dyHTrWYNKaom0VQ==
X-Received: by 2002:a05:6102:5698:b0:78f:f234:75b9 with SMTP id ada2fe7eead31-790726d342emr1955923137.0.1788974176159;
        Wed, 09 Sep 2026 10:16:16 -0700 (PDT)
X-Received: by 2002:a05:6102:5698:b0:78f:f234:75b9 with SMTP id ada2fe7eead31-790726d342emr1955829137.0.1788974175459;
        Wed, 09 Sep 2026 10:16:15 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1fb04f1esm60278055e9.0.2026.09.09.10.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:16:13 -0700 (PDT)
Date: Wed, 9 Sep 2026 19:16:13 +0200
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
Subject: Re: [PATCH net-next v2 4/9] net: stmmac: qcom-ethqos: convert
 ethqos_rgmii_macro_init() to void
Message-ID: <aqGUXf4aaPNGhuJm@lore-desk>
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
 <20260908-shikra_ethernet-v2-4-bbe3389d0652@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Jz3BLvdJrcEnCQaB"
Content-Disposition: inline
In-Reply-To: <20260908-shikra_ethernet-v2-4-bbe3389d0652@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AImJJIpd c=1 sm=1 tr=0 ts=6aa19461 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=VkhmObMS16-UOsR-uKgA:9 a=CjuIK1q_8ugA:10
 a=Ytgtto6viW8UiwRGLNEA:9 a=1WsBpfsz9X-RYQiigVTh:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE5MiBTYWx0ZWRfX2W9IBUgjW2a8
 balZiGfzvCYMHnwy2KbIQN4TnWWc2Ih4FN3yH9VI7EYdMbGhi4GtmrtQKjxjl7Tsosq/MksqCJN
 h1RlQsrQGFIVhDDOoa4nUyvX3zAAJUELJpCGkWqJU+FiGInZRHyvE11CzmK/iuWQXKF1+HspLI8
 iaoE2RMrFdsYFr6KVT9bBn6Iw7xFpUfaeFJsxdui0Hf9dsX1avn8wcks/21UjUBoaKmUtXpwr3S
 m6UhFuswd6XSfuY1a93ATQHd+dQOBnYPN9H8Dbpb98Fab2bTiLqzDZIcxjiwT/7Cft19/moYkv6
 Gzt85sZ3KmGmWu/LpzjHRFf+RSabVM38w1/zsWC5egW1T+WViF7Kn5uy+BTO/USKaoyOSM+eAJM
 6KPHoXXb0Yqme2QH1VFboOmriPsx6YvTJEvgAF9PJkzETYWIXPyQCXCrAxl/X/8sStv1BBBdhzh
 1QP2AmZCvqLNXGOwIFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE5MiBTYWx0ZWRfXy6a85tJUkjHV
 R/YLhnySspy59cw2qL3EC6lpuiBE6LKK4fmidsAYxPWJKamnNA4DYS4CtYXNf35X0H7KlX6N6TD
 fD6QeheU0Wxb31f0y0dSOds+CMjXjhY=
X-Proofpoint-ORIG-GUID: l9gIOAAt01ujfCN4nSVBf-C1eCp8e8HA
X-Proofpoint-GUID: l9gIOAAt01ujfCN4nSVBf-C1eCp8e8HA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090192

--Jz3BLvdJrcEnCQaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The return value is never checked by its sole caller and the speed
> validation duplicates a check higher up the call stack.  Convert to
> void and remove the dead code.
>=20
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..44270c25d874f72e7f971757f=
ec659d36468c315 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -371,9 +371,8 @@ static int ethqos_dll_configure(struct qcom_ethqos *e=
thqos)
>  	return 0;
>  }
> =20
> -static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
> +static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int spee=
d)
>  {
> -	struct device *dev =3D &ethqos->pdev->dev;
>  	unsigned int prg_rclk_dly, loopback;
>  	unsigned int phase_shift;
> =20
> @@ -384,11 +383,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqo=
s *ethqos, int speed)
>  	/* Select RGMII, write 0 to interface select */
>  	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL, RGMII_IO_MACRO_CONFIG);
> =20
> -	if (speed !=3D SPEED_1000 && speed !=3D SPEED_100 && speed !=3D SPEED_1=
0) {
> -		dev_err(dev, "Invalid speed %d\n", speed);
> -		return -EINVAL;
> -	}
> -
>  	rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
> =20
>  	if (speed =3D=3D SPEED_1000) {
> @@ -479,8 +473,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos=
 *ethqos, int speed)
> =20
>  	rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN, loopback,
>  		      RGMII_IO_MACRO_CONFIG);
> -
> -	return 0;
>  }
> =20
>  static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
>=20
> --=20
> 2.34.1
>=20
>=20

--Jz3BLvdJrcEnCQaB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqGUXQAKCRA6cBh0uS2t
rIibAP0S/gGVaDgOtJQrrnNWdWnIJWz20hm/VIyYD9SKCquKdwD/YToyiF5E74NX
CzVfv/b293W/qNrfSESKxGxMQFlq6A8=
=s/dw
-----END PGP SIGNATURE-----

--Jz3BLvdJrcEnCQaB--
