Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44A1484228
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 07:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789715278; cv=none; b=ERRsAOG4+wo7BESAHo1vJoE980Feq0NZe1Yi/dWysp1hK4LGhwzqqDhBRejPRJbyzS+HEII/PpyIV4Zot5k6+zGWCMF9SGbZBzq8JbmDF1GGcxiIhy7iGNYYdqKae73XaZ2n6riEeHWbtNTxK3eg1mhOHDa8B6SjcsBBsxQ4tjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789715278; c=relaxed/simple;
	bh=DhkCDXL1J9V6TBCIwgo21k3TW4GK7I7AbwxdOh7IJLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zai9bv2fSWjPcOTMFHVIAvtMG2t3WjRF9ytNoIw6eNCVUFV6UN65W+nLJR9mKVoyiEnt1fX3CzjpQozC/PKCooxxkrA0TP0OiPyG3J4k1kBdIh3v0Xy9EBhKRmnrfbm+0gP/sN3sBtmfiQ4eqDnXy+3cAxxVPFmVj1w+s33uS+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lM8iLofE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YdVN719y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lM8iLofE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YdVN719y"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I60Waj021456
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 07:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AkytsX2493oZhSqMdRdXpM7s
	sRvUOFLQTqg/Kr4r0k4=; b=lM8iLofEdhDCimhKaod0wVawIEDPcSuiJsLG7h+j
	/PvYZxiS0UHvyRoxfBnCuzB0BTgGAHTkzTUbACWDuPzcdC8LpDXU/lJzLiugB2fe
	TuOGJ3KF5HHKSMpeDUQfVtftXat96Zdb7maX1YktqctjvZS9h3skeYOaItvz4EDY
	5jIb879lAn26EsIzxt2Rwyn49YOA4ikuuEX8dWjeUq6uvCannUkdJBqhxsSm+gsb
	owv6b8OEZ4V04IaXUWuHhfTp+O8x5k5CTi0I/1psDZqH2/UePehYTwmwXGV5Rha3
	OMNp0Tfg+CVnGPxYdqNjz5GQcfmBSpki7sNG7jfN6jtCTQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grnqean44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 07:07:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f3426a7cso85421785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 00:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789715274; x=1790320074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AkytsX2493oZhSqMdRdXpM7ssRvUOFLQTqg/Kr4r0k4=;
        b=YdVN719y4VPxfFEE0FK1/G+W9I7HF8QuZHxjMcQ7LTSHsSvdzoXvRsDN2CYpq3KBeu
         gLrRrJal6ULJDJNDqNeNZ9aPlCiuvb0oYL9fNT+qVqQwkicII+kNc3KA/Wq/fIX23uPu
         KAum4v9tqgInCC8JZFhQjD5xRzoCxzBCwV2i/W7D7vjHCKbBs8gBKS3KUgPRLSY0Z6P7
         8ZdhTn4hwHZ2fJGnCMUwouvQKHoBPQ6AvOPcBjhjF/6b5e1MDxjAUKHv1kzYXP42e8Gr
         qz8IExXiccMFzNi4yPEH0Hn92gCeyUseHEtqsOpBNNUckmJdMWR6SDi3KdODKG7Kd5Tr
         IcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789715274; x=1790320074;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AkytsX2493oZhSqMdRdXpM7ssRvUOFLQTqg/Kr4r0k4=;
        b=mGoW47dWXb739UaLYbODk6qmLvp3bE9vibItNvRCS4+q6GJ/s0kr3p/1B4VDQpLmPK
         7beBdDRaep6AJAmpET9bCpMy+ndJCS8UfUfiHmpgtXbr+6NvztaAAvnw+m/L31G2hkfy
         sTCk12//vc+ZyEWNqrEaFzQFPJSzO3sWWyJeoI8b+OB1ecZDsmMY2zcOcj19dgk2RfRS
         Wy6Hk/vIQNwesVPMVm/V9zxt4daGAG3kpF5PHK//4ek/OOPd/TYeZcd2lDZl8fh/M3+b
         +gnTSBZfej88hgNV5Y6nPRpm7Mm0Wx/8CHMDRfEStUnUk1z92gX0Jzekj4npRXgplo62
         V3uA==
X-Forwarded-Encrypted: i=1; AKwUvBwFx7dwvr32NYbTO6PMjBWVF+4w1Ieir5JReqxK78GDPpOrt0V+z22jlgePu1nJzOp+ZjH3qvZCX7t0gX+C@vger.kernel.org
X-Gm-Message-State: AFuF++mEBrW6anXOfcvjEFJN7ZWnb9iQAQ31uj5zzs21iOL23XpzKn2F
	pGFZubcv9n59K61ysizNqqjjHaSlIai4/R/jDRz0LQPawT0CcF4CiA+oR7LJnVFm6WEDdc6yI4v
	mjVZxex2A9FGNvKLObbwzws63aULxUrBGBA88nI0z+JgIl1b8zr/FEndbBcfNmXuz4o4/
X-Gm-Gg: AYBFou2hph9s1srBjZxpg6y5N+OAYpfHoqcnIXgLujIpa8IFvUWzd40ryyFv1GgKE6w
	ZAwSjFp+JHahauH8E4DmggwaXppzhoC8exd7jpD8f1k4roLpUPl1aKL6fHSJnoc0Bpnyx+JfOd/
	7mho2LBcxw8JxgVUayeKnYFY8Qc0ENsLsqojcOMDRlnYsOxt9omMU79JI67TULwduwd2yAtbds5
	xNDZ3tiut8xBUOkeP4v3k90qrMvLWZwsp36R7Gb9Wur4jYH+K81fsE3eXZR20cvhyznhMXUZSq2
	1bgqLLyXBU1eL6wYeLul6jN1eu8T2hVW9T+bZUT4i+ADOLlDTlTZLnCMAnDAy1ULocjWA9I2MwG
	tKo2tSm8sLrDvqjS9oS6qVH5XrQFUtW0lQEGR+g==
X-Received: by 2002:a05:620a:6012:b0:915:a953:4b9c with SMTP id af79cd13be357-93bdc698a93mr190968685a.3.1789715274360;
        Fri, 18 Sep 2026 00:07:54 -0700 (PDT)
X-Received: by 2002:a05:620a:6012:b0:915:a953:4b9c with SMTP id af79cd13be357-93bdc698a93mr190965285a.3.1789715273806;
        Fri, 18 Sep 2026 00:07:53 -0700 (PDT)
Received: from localhost (77-32-99-124.dyn.eolo.it. [77.32.99.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd24034esm161065645e9.15.2026.09.18.00.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:07:52 -0700 (PDT)
Date: Fri, 18 Sep 2026 09:07:50 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Thomas Karpiniec <tom.karpiniec@outlook.com>
Cc: netdev@vger.kernel.org, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Choong Yong Liang <yong.liang.choong@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Coia Prant <coiaprant@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 1/3] net: stmmac: propagate platform mac_finish
 errors
Message-ID: <aqzjRcKWGBVb2dyg@lore-qca>
References: <SJ2PR11MB8401F5C3A075DE2A0013E063E4872@SJ2PR11MB8401.namprd11.prod.outlook.com>
 <SJ2PR11MB8401FFBBECB8FBBA9C002134E4872@SJ2PR11MB8401.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y1ppLvKxKDdIbxN5"
Content-Disposition: inline
In-Reply-To: <SJ2PR11MB8401FFBBECB8FBBA9C002134E4872@SJ2PR11MB8401.namprd11.prod.outlook.com>
X-Proofpoint-ORIG-GUID: bfXW94Jrd5JJVtw9PJVuX6se7PSiWmCL
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6aace34b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oN7owVyBLNHHe3W6XE6vpg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=9dhsta6yqxhMeNE18noA:9 a=CjuIK1q_8ugA:10
 a=l3wzEGKSjxwMGPmveUEA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: bfXW94Jrd5JJVtw9PJVuX6se7PSiWmCL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA5NSBTYWx0ZWRfXxxFHJumjuPEG
 k71OxrjhRZITz2AVbzdFukWfKME4MkKs/8kIadyXeep92rx776UwtZ4MOLg/29X6voug2sYDGUj
 nV+Lpru/i/gxzKe8s12IvwCmgw1RB6cwL8qM6gdoc7Rl+jQq3PItowmmaPUyfMCiUq4rRauVyuM
 5cdMlu4RmouHgMpECC+1/oNh7RJjYUnFWaGZkDSri/PZ5PCmnD9i0no7Yh7VJAFLBReVU6rxCyE
 bFfMQF5veLbqxvaxLE3TYmiwDHjAQmb9tsc6a+oskcsGoKlhllZvzC9GQ8T7IgDmjXEhYxVcf0f
 FqAQaDYHNcYDAnPPbrurGAg5/KGH5M1YVcj78D5ZnJkN8RpU17JCTlxzolY2cu9ITK/rpopGIHU
 2VL3nQu99S5phqG4MVquDEf155BFQKytGuApq2uvs8so8xi2Eav2PBnAG1wM5rDSP04xVMuYOFi
 BPQ1r6BvhjJVE3JBgiw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA5NSBTYWx0ZWRfX4eWAwuSAUxLc
 33cte/yw0o6HVQzL0S05UD3NS42nWbrcSmoMu+OEgLJqbOyTqb4s33rNA+8/Y0tdiOvPL6BFnDX
 oAPp4XS610P+cmPAYM7XCDm0Th9P5V8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180095

--y1ppLvKxKDdIbxN5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Thomas Karpiniec <tom@wendy.sh>
>=20
> stmmac_mac_finish() discards the platform callback's return value and
> always reports success to phylink. For example, the Qualcomm ETHQOS
> callback can return an error from phy_set_mode_ext() if SerDes
> configuration fails. Phylink then treats the interface as successfully
> configured and can report carrier even though the SerDes is not ready.
>=20
> Return the platform callback's result so that phylink can report the
> failure and keep the link down until a subsequent configuration succeeds.
> Keep returning zero when no platform callback is installed.
>=20
> Fixes: e654cfc718d4 ("net: stmmac: configure SerDes on mac_finish")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM sparse
> Signed-off-by: Thomas Karpiniec <tom@wendy.sh>
> Acked-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index 1fb5f804ea23..1350e92943ac 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1048,8 +1048,8 @@ static int stmmac_mac_finish(struct phylink_config =
*config, unsigned int mode,
>  	struct stmmac_priv *priv =3D netdev_priv(ndev);
> =20
>  	if (priv->plat->mac_finish)
> -		priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode,
> -				       interface);
> +		return priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode,
> +					     interface);
> =20
>  	return 0;
>  }
> --=20
> 2.54.0 (Apple Git-157)
>=20
>=20

--y1ppLvKxKDdIbxN5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqzjRQAKCRA6cBh0uS2t
rAQQAP9pZYjJEEjVyy6ZeDwCbVXtT7BVVF5T0zNpP2F2lURjvAD/RWQFaNQLdsGC
gsAp0m8owRMLJRx+SUPf+1FAkHDhMAo=
=GAAQ
-----END PGP SIGNATURE-----

--y1ppLvKxKDdIbxN5--
