Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416952;
	b=yvYyTKRO7eyg+jpIXFVXFXNNGf6CKk1Rs+YWu9FeJpD8L8+2GTna1Ed9pBx/39Ua8qha
	 vk6iMyM2APV4pmbolIbuaqeeiAXAURDhzd+WWGkIz8nUK3drivP3kybPt61+69iGiSWY9
	 IvOsA+XRZE2F4Ru5u0ZDQ5RUGmFqe3KoB/TAE0nhzJkK2IpibmTQIwG2T2LVYB42gN61C
	 1WIZyT5oD8QKdixOZ3r1kuKpKUfT2FK+6+5ynYFrngtUxNE8UDQRXtXr90LJxE/Jr/eEX
	 qCXAnQpULh5KvCFrLjeKi2aNPGZs/ydc4w+gjaQbN24xbwOilK4PVy+buanaAFMO4BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416952;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tVcctW/oKDuxTt7DrKIQJLMMmlpeEMy6Mr9dwtxp8WY=;
	b=s/1TWUCg8DNthlz3mS/99ZNjZemJ7rjPTvSvp+bIkxsSCVCx39G9Tqi3R4MO+6Jy6MV+
	 gHGerwRb7noa7pbsq3S9+XSrPTNLpBtZyH7D+6uaf4If9rXjA7JjzEhkaHrJz8PHnasFl
	 W2v6CLIO6cMFTTfoZ9ErOdw5Ne2WGwKO2nSO95DCq17g08TbTqUDE2UXb30B1FoRmOjlq
	 0DTPDlPR4KQXHHY6zuaShfHzyIPY9Q31mVCu6yw5IQcJcnynV5fv5yPafmqAjovRnElQA
	 1mG+MNCzDW//K3/nsoPJ+z8M5Klhx7nTw07spcTKU5eZJ0fuWTFRFCHumrfR87qFQTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S1djNy02;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="WB/3UJnL";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897EE606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 897EE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S1djNy02;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WB/3UJnL
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF044B1665572
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tVcctW/oKDuxTt7DrKIQJLMM
	mlpeEMy6Mr9dwtxp8WY=; b=S1djNy02soVsnM6zgLcxLwbTC4mKwOQot0aMq5SJ
	svQ58fBgLts9WD/bnLtpmQBZaz+5SN+YHJVUWm5vGbCtlDNA2lEN0awRmnJfT/Ek
	qmaqwyfT2sbuGxL+alvXmY73mfehcdLC7CclqIBeqnZ2U81QKb7bjrEnqfjAGBRp
	7nDfGjbUAQ9a6QpHSrNryZ0wUnmzOT6/ivbJc7Is/qesQ6AUTgU8afQFHSmZZXtQ
	ueu4z4Rz2aHdnEPHY/roYhHbNiOz1wiHrkVJUulvtamN5Z4IHM42eBBNh0QcRc42
	Y5e8zvnbJsZRBdwYGODw9uVDY7BhdxAjucBsntxv+AiDnQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7ptc0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:09:11 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5edf86a8c00so816456e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 09:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794416950; x=1795021750; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tVcctW/oKDuxTt7DrKIQJLMMmlpeEMy6Mr9dwtxp8WY=;
        b=WB/3UJnLNP59TawUNQ7dHi9Nf/WOEjaC3DKi59QRPNBjLJeCrxQUBJsIhU6YuXiYRm
         qg/fTWer0GyL8Hscqft33sdeieL0AH2zcZCJDOJ/hWIHalLE06dc9jIaSEevg0iLs4Pu
         wJfB1oEed308yjWFhkGpavYYHLNA4Ge+f2s4sWTqrmGbiX4wLT1XaMODbci9x4jCKH9b
         hk4F57FAxq/Xrly3CwvNO9BVku39FNus7tEV8nnFCXbbQ1YfXfmAHIT9kYd7XI73heyO
         Fu4BPbSFl3D2gvSx7WN6untKccZp4F5NtOM4YeM4U8IHcqj+aYugb9xskLgIla/tpV55
         EiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416950; x=1795021750;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tVcctW/oKDuxTt7DrKIQJLMMmlpeEMy6Mr9dwtxp8WY=;
        b=IrWw0O+KTyI3bwuvPdL4HxP4KTlFan+ZB1tYtkdSj0fraAIS6Cl7B8xxJbpVQEnZ7Q
         sJDISSUbPA4IXRlbdeA/Pm4jw1pRQZu7cJA1URip2wdpmC9AaT5ysp+Ky/Mvnu13HFFF
         rGUeXsZWI0hbciNeD0n6d95WXnhFZRQiIqPBq/+0wgPgzK9+HxRBo0RGtvBLdEk2lo24
         pHqLhbmue+kY9OQKZjjJInp9nlHiApg+ujlJjhbPg0pwByUgoCngbCSztmqg6c3C4tIA
         2lhle3e0gHBmdaRW+mH59jBB06cqkuK5Npvl/P2zBWLCpa/y7f3Jlotuf0QZ9qWrcfRs
         wlVg==
X-Forwarded-Encrypted: i=1; AL+hErGQkNj6HIqSo010IHP8JcM8FCi8jH0uhdjv5iGc4C7MBNM+gBCHuebb18EN8ciqRFZ2zTMxZ7Je/NdXCtbT@vger.kernel.org
X-Gm-Message-State: APuU4Z+7ZZWdaZpUEPq0wJ7yhW+CPymr0G7SlJQ6+2/gDnVsLyOvvUlR
	zjw97tr7snvm5aiuIP75+6RezY0j3h156IxUFMv1QPetmyeO1fuywOlzkyOHm/sF5MdHfXx9KT6
	bwB0beXT0F2OIpu7bhqwFItzKul9Nposar0c7ZTjzSeEDv++f47f3kvqnXMT9uZSSvkbK
X-Gm-Gg: AYBFou3X7BJvU94MQBpVMnwu08n6e/DZk3/Frqj2y2g2UxuXor+3Sl8bld0lmzdMwoC
	R2foZqj6rt8sGRgs4jRVLycXkJBWdCdAUNMMf4+7BTIw6sJ5O4kcQt06RK9hjS70m4CbzQz9bh2
	A+2M7MmJfZ/OCLOiRjATKaihkXNE4OTg0Rxpi2k0wcoIfN+DqfC3OanXj47/XmK37hiDtOKYD67
	SEEOVCMUY3pvaB2Vaxd4hOupR/Igfmhav4CVzKOCdrCsKOn6YHtXVsRelKc1Yck1WeQcZhUBtwd
	gY0EulogwjUmU6Hq4fxo399524SG9MLoVlcgZo9m048eb2QOk6NT5jKX6GjVaAWt01VbyvC07/3
	jA69mm7f6+FMYurw0Yy++NMLFTxc9QlNHm/jDYrg7MCZyTSHQa8H1xrtqRKE/G4eTfEewSmZn/j
	bTGhz7M/w0YmLhiek5E+4fr8giq5w7EdDlaYjjLWafRXRhVB3C7azqY2X4pjkFJA==
X-Received: by 2002:a05:6122:4b16:b0:5ea:b9b5:8c43 with SMTP id 71dfb90a1353d-5ee1c480a5emr1354767e0c.18.1794416950249;
        Wed, 11 Nov 2026 09:09:10 -0800 (PST)
X-Received: by 2002:a05:6122:4b16:b0:5ea:b9b5:8c43 with SMTP id 71dfb90a1353d-5ee1c480a5emr1354753e0c.18.1794416949763;
        Wed, 11 Nov 2026 09:09:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157b7a0dcsm1105809e87.5.2026.11.11.09.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:09:08 -0800 (PST)
Date: Wed, 11 Nov 2026 19:09:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi/phy: program PLL_SYSTEM_MUXES on the first
 PHY enable
Message-ID: <e4ul4zxjta4oyo5fpjjzwkykb4gicztcn7yrgjw7aer6bqowkw@6nx2arhvmyca>
References: <20261019130041.305805-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019130041.305805-1-xiaqinghuan@mail.ustc.edu.cn>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2OCBTYWx0ZWRfX+7D8AshyLGbu
 3/6F3xdsp7b6TxidRsfz0xgW5ymUxJiSBQsOJ/tmt8iPdyi0nSahjJaWo0HhirDBVOKutoIc/ht
 0CSghcrMAewU4F2IBLNCM/0E2piRrDE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2OCBTYWx0ZWRfX1YXeZRkGsy5i
 WPDv9zQ1OZggIC2hFZ/p+MZliJG8Z5fmYu+Iz+PNVcUoro4P1FDNZphE9Vt1nItiqXO5xlTHaSl
 4B2f0DpxeUeFgIPsRk+0WZGsBmr5lux1dhmWkff7Il6QRoX36KnNOyKA1rbYyYt3BarVsZVwJ6e
 Tk5HEvScPoQh2S9GWMVB6FCeoCBa7h23u5DN89sLXmtWqc2P/nZroMrCWGRWa+MpxsmlnLFJ6Eo
 eIzKHUZynA+OrXp4MuRztjJnLpf7QnRUnPVBp68jKg3BNpGv15ESChSdbVe8NVLcMzxfGdrvDhP
 uYkGqPJFvGOTyW6BP7aKYeEPMoG+Iw9N7D04JzeNVmlYg95qKg/54jVFKaNzi3JkTsAE7OtCn9F
 Qm3rgeBaSzqk4B/w7FiE/n7aPiUrYWoNl2gG5Dr2Y8sq5ypLQGh5dRb2gv9aOK6uVIAzoxpO5B8
 S7+O7A5av/n5pQ/ks8A==
X-Proofpoint-GUID: ktjJCLfA-wZS0A5rPbsfiJy7vsp1bc_B
X-Proofpoint-ORIG-GUID: ktjJCLfA-wZS0A5rPbsfiJy7vsp1bc_B
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af4a137 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=InjWm6lT3iDBAsjdKxMA:9
 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110068

On Mon, Oct 19, 2026 at 09:00:41PM +0800, Qianhui Xu wrote:
> From: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
> 
> dsi_7nm_phy_enable() pre-seeds pll_enable_cnt = 1 before calling
> dsi_pll_enable_pll_bias().  That makes the bias helper take its
> early-return path, so its PLL_SYSTEM_MUXES = 0xc0 write is skipped on the
> first (bonded) bring-up and the register is left at 0x0.  Panels wired
> for bonded DSI then come up with a blank display.
> 
> Write PLL_SYSTEM_MUXES in dsi_7nm_phy_enable() as well.  The write in
> dsi_pll_enable_pll_bias() is kept for the warm re-enable path where
> pll_enable_cnt is 0.
> 
> Fixes: 44784327815b ("drm/msm/dsi: phy: rework PLL bias enable/disable")
> Signed-off-by: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 1fc3b4f0c..5dd4830a1 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -1144,6 +1144,15 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>  	data = DSI_7nm_PHY_CMN_CTRL_0_DIGTOP_PWRDN_B |
>  	       DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>  	writel(data, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
> +	/*
> +	 * Program the PLL output muxes here as well.  The pll_enable_cnt
> +	 * pre-seed above makes dsi_pll_enable_pll_bias() take its early-return
> +	 * path, so on the first (bonded) bring-up PLL_SYSTEM_MUXES would
> +	 * otherwise never be written and the panel would stay dark.  The bias
> +	 * function keeps its own write for the warm re-enable path
> +	 * (pll_enable_cnt == 0).
> +	 */

This belongs to the commit message rather than the code.

> +	writel(0xc0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
>  	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>  
>  	/* Assert PLL core reset */
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
