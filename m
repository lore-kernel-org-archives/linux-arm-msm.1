Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19EF47C0FE
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 09:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792230807; cv=none; b=dDthhPDzKy9bScqhsuqgSncgZ9E2hDnfUzZqY61BE+48lzYhtDxzaqOhBbFIiHeBt/SmOw3Rur8ImGwY37wOp3onRAnC6wwJoILuRZ70SeJBSHg9BYoe4V9acevBoqdJ0+r3R271EEJuXmHOgSvO04/XD0qe/RM+AbaZUWtOQBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792230807; c=relaxed/simple;
	bh=j58n6xlP1WdLlmhvGi/Za3kYOwUNNCElJDpoHZoH8UE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GXNiYdeXjZtY66DoI5FRr/LRBYwB1uewe7F92tlgdidvQnWkBmMhnhdXrxfVzPVJGZWRfIw5k4NjmQqnvZjqE0cBDKfk8YCIyHVjrxetUEhqOaVHwUJ8CoiY8OqYA33+j7LbTqrq8yGuDglUr/TalW6V8J86P3TkqP7YM+/ghss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X62dA5hr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f2Nbn+Yf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X62dA5hr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f2Nbn+Yf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6o3lh900565
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 09:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XtXS4yD9Try/qCHd07nuVF72
	fRP9oxFrjzBY101VuBE=; b=X62dA5hrbOOwcSzXIK8DZjEgKA5+PWQ5ybpWnqa1
	8yqIdGl7fAX+uVEehWCiT85sopw3Mf8a0BJLphDpWhJISrG4OpDzE8A/v+WorWyV
	yIZjMnqVqyPo/Lc2cLQrEI2Hf1eirStcsENm2ZfyCU5nikmbUYW7ADHR932Klq3G
	TgHFR3n7vLI5AI6CXDuD+aB8prHUGlhHpCxYQ91uNwoiVIc3Xk530e2pPy6QE0d+
	8fbwAJu2Q/RHRf6nLmV7Rcsgey2CNvY67Iib5dF7dcAi0NRJMiUL4oh4x6xu8uGl
	EiJYSTp3kQMXWKGrm8ptLfW5khDdZU5kaEzcLAX3Abau7g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0kxgnxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 09:53:25 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35cbea41088so1014898eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 02:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792230805; x=1792835605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XtXS4yD9Try/qCHd07nuVF72fRP9oxFrjzBY101VuBE=;
        b=f2Nbn+YfcxWc+G01pO7YN1volimu8ngylIALdY1HnQ3vEVNvLX33a1PQJZgX0O+kWv
         ufebQwT3L3IlRPpcMBlWR0lbdTRqE/UwWcrVugUvo0oWle1gSSVk/cud39ISgGgcRGxx
         W3hOVr2FIi8aqo9HqKxbcPOISN+QQprFMbTgzXJlnqUOXlrYU8V4QPgmQd0fNJMFEPtk
         2jhDiIv/sh15YMV364M2MvYGSVEy8An6ZYAkzPHvwywQ2G7DyNLYlYCmOiEExiZYWbJN
         NClSxG/rNSfUnmRqhGbykWCUXl3Vsf3QbPBdV4oJ0O9D+NpTV1lF/YpNRNwbomv0u0/v
         WXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230805; x=1792835605;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtXS4yD9Try/qCHd07nuVF72fRP9oxFrjzBY101VuBE=;
        b=oO/cRAbvXpWQuZrjcby7hHmqYfVFMqM/CpbVxhulDMwqmJyxz0LnQNh3uENpJHug7c
         0+FILvWqcsnfcVt6O14NB9bVhX+BOBVwgx+2BbUDOK6S9iEhN1TdZX0VyuVBnfUuqger
         6RxwjmJzljP237j8++mkQRmMZyGDMukbLWctmIM3k55DvvRCfG9EMRpMJxRYXGdihS8C
         xM3+tC5/CzhFrNE0MkXylAiNKHo74Ux1qEQlRpqydh1CzHuySoV1N9+4An8Ip3DjeNji
         mCMhX4TSGDjKBS5JZCSd9dGQ9L2x2Xtda04VDvsR4u+ygzS0Mp9vQ6sWpZxyaYmW0Se+
         pBxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEpp5ooEAuZdT9wBpGbeZe7urrdIhv2UDXuF3OI7j8Nr4xIHtsVhhE2Q0W/q4J30gDGb26lCwyVbxyImmk@vger.kernel.org
X-Gm-Message-State: AFq9FYIHMEo6LXRZzsIo4i61irG+k+Q+wr2tacYtiMQDbzuim725Bq5A
	cw+43CjkhdfaLC7pyRuKQFRp7TlNal3CUGripJJg9vMEUNcvVyY/YqZcCbngmkVW+SN9annhwOl
	YTc7vU8jHxGb/UAE9awKQgWne9cxTaDY0GjyGUCDzT+q0o53swR2dC4NqBhWoiwfBZrzm
X-Gm-Gg: AYBFou1bvOUQJZvxH/x1/6DWGYueG9c/uQ+sWoly27FE2JL16XFkPFQjdd0hXL6Ce5N
	06E9yb78CGN+fpeNhESwgzfo/vUBdQz8t9DjMOcqGCgOnRbLaB6zfG8RNfFZrCampgq6FueGpak
	Y5AnG/ijmvOlk+4l+Gxh8wQv5pZSupAlbuO+QpZpoTfQmPuBFw0WUHP72jRxImObeGmjFVsCN9Z
	hjBiGnCCcyWaOklorFB8N23tFMDSxZBcIXiNzwZlK/f8O1Nhoau65h3opDlo5315ra84gHvf8VL
	2PGiz5lNaUtEtQmgEqoszDJTERemx4lhdwPcEwT0TUzzH0Cj4W3nD09SzxhL/EYYgBoMUoxV6sx
	/eTTk8Fgrk4Jg
X-Received: by 2002:a05:693c:881b:10b0:35a:47ed:c39a with SMTP id 5a478bee46e88-361a2f333b2mr2990933eec.37.1792230804200;
        Sat, 17 Oct 2026 02:53:24 -0700 (PDT)
X-Received: by 2002:a05:693c:881b:10b0:35a:47ed:c39a with SMTP id 5a478bee46e88-361a2f333b2mr2990870eec.37.1792230803002;
        Sat, 17 Oct 2026 02:53:23 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36083283478sm13189465eec.29.2026.10.17.02.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:53:22 -0700 (PDT)
Date: Sat, 17 Oct 2026 15:23:12 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v3 0/9] net: stmmac: qcom-ethqos: add Shikra
 EMAC support
Message-ID: <atNFiFvIeecfcgAX@oss.qualcomm.com>
References: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzOSBTYWx0ZWRfX0EIwytAdXOpn
 1Ee7MRoaaHGcm+pqjYLR2lxiVwewO953GDFH/BL8IgFI/XOoj08dKoqWbri9sMrW44VjAEuy77m
 3LKqBIiT5MDKqzcJfaTsEEP/ze+ckS4=
X-Authority-Analysis: v=2.4 cv=JpZkP84C c=1 sm=1 tr=0 ts=6ad34595 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3MThnnmduzqR5zQ_0GUA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzOSBTYWx0ZWRfX9GRYRGhzZ4tY
 QcHqYZQ98UKDqJPXP0vEXlbxoCcOsCfmr3FdFf8VVhyQdWboW84BIecz5nvc+QsxOqXG9v1vTic
 m/REbHETP/tj68U3s9qW161DwNR08har5t/Qt+BClPpYh8qBuZSXxIa/qQ8sodN+wtc+b88Cy99
 LHi+w+p4rDArG6IirPOqoXcl1jYDhhu5FkcF0t9mj4rLllX9+/45+hsZh3SmqFWp+YIWR4uX2J4
 hJ2CJ/ysW80nzA8lScbv7WRg0wsObbacm2/+JodPOpehgnUTC/FLcQBGsoWZdYGMpZwoC4n+9KM
 5ZDLp+SlF09vvF6bDNzkv02myekk6Lufe0wrNLXc26ipzKK3L0illi0MTwZ8DC9lEnitYrWTmpC
 tK++MZJ/IU9W5LcToWaOkn7YDbnzHkXF9k+NrkjCrdnZcLLmrSRC9p/vjuhRRX05uiu95mdDwzB
 IL1F/35/pVN5wb6t9iw==
X-Proofpoint-ORIG-GUID: OCj1WXjnlXEouK-VsVJszODIPAxAwHpC
X-Proofpoint-GUID: OCj1WXjnlXEouK-VsVJszODIPAxAwHpC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170039

On Sat, Oct 17, 2026 at 03:15:11PM +0530, Mohd Ayaan Anwar wrote:
> 
>       net: phy: dp83867: add regulator supply management
>       dt-bindings: net: qcom,ethqos: add qcom,shikra-ethqos compatible
>       net: stmmac: qcom-ethqos: convert ethqos_rgmii_macro_init() to void
>       net: stmmac: qcom-ethqos: fix RGMII_ID mode to use DLL bypass
>       net: stmmac: qcom-ethqos: warn about legacy RGMII PHY modes
>       net: stmmac: qcom-ethqos: set initial RGMII link clock to lowest speed
>       net: stmmac: qcom-ethqos: share common GMAC4 address table
>       net: stmmac: qcom-ethqos: add per-platform NOC clock voting
>       net: stmmac: qcom-ethqos: add Shikra EMAC support

There should be 10 patches, not 9.
Looks like I messed up some b4 setting and it dropped the bindings
change for dp83867. It is the same as v2:
https://lore.kernel.org/all/20260908-shikra_ethernet-v2-1-bbe3389d0652@oss.qualcomm.com/

I hope I can resend the series after 24 hours.

	Ayaan
