Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D294AA032
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 14:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790345981; cv=none; b=tulD6x2iTK3HpMxz9UcJvPYk9J3Lccq+d9hiplzQoF1TUVyzZpyPC4yrBOD+tcPptoDQB1TfIcnK571inWmjvpzTURSTS13ZJ5G+BdNbaznD6zDoZ7xbfXWBOjKu9e9S6vBqjR3T37ZKL9EtgTqH4gEz/4+qDqM+L5158ln5wZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790345981; c=relaxed/simple;
	bh=0IOCe0rhZkZk9loRRTF/Mw+l54Zou2USonDmfkIm3ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FvxWBDBTy3vQmW+qfnjAQ+uwkz1lffzWo6shZo/6P6xjKya/CUT1y5xm6OdL038OmFJ/Hmtwc8vvYXGJpHyUlWFjt7zZREMMffusiT1CZeuLDEbunzFJz44R/cOl8kfZ/jTv1sy5tjtpwoH8RtmwzK9Xy7694sdPZF9JX6s9x/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BJy/xYTF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C39aNWM8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJy/xYTF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C39aNWM8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PA4Djo609132
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 14:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Gs/Zp4Lyis1BUfei8WI1dbDL
	AbMPRkxp7joj1eNb5+8=; b=BJy/xYTFs1C+RCKKuMNXhfxCK8TqLvqP2uymw68K
	GQ1B3ulwMqZu18/z7ZsmtNvYpJGn/LyY3alfnOOvql+Xs0XH95oQRiCp8eOKPy8z
	Jiu4+C3oVlXCrC72+kpSocWr5BdlI/QJOmYT8HQoT5aYy+QeYaEtnGVTAVuQNrnL
	jj1a8Slx8POrx/C1xqZZMnoCBkIAEm0xtJtNXY+QpzlA3ZLfrBzYILNngtzaajG3
	gVYjviAZGlsxd9NUSFGZmw1oR/A0RfmCk1+QxkouzwLWjzavJ4AQ1d4IBThNcig1
	4BNMc3jgzrmqvOwipjHao1JZMvB7lJCkyPnPuCmBf9WQcA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwpvnrswq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 14:19:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c444b438aso173295285a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 07:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790345977; x=1790950777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gs/Zp4Lyis1BUfei8WI1dbDLAbMPRkxp7joj1eNb5+8=;
        b=C39aNWM8afpC26Q7dm88cOYSkTQsKePsmdnG2F+dYbjg2PEkDl9roa0arcFgFi6O12
         VUCJOY4jD2QKsfWJyTaNNcS+OLQ2ic695gLoXkF6P0NBLm9ZVDspywu+Q7yQ9UyYSCId
         +YbdlVtunV+EW/cwQ68X16ZkYNocJpVW09IGhgWsIzpIjmkMTyV8NG0vQ+v0XCFwo0ti
         6RiSjQ79/HLAH4r9eGdYQMbCo3yELiIAgP51rkFDT51rFYurWXZvlPP7fFJnlMzlYrqX
         wy5FbH7unWf5Qs/+6NXC4z0YUAFwyJ7ubDWK/Zj5BL50iXc3TFVh66aq9drQTotO/yTH
         CJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790345977; x=1790950777;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gs/Zp4Lyis1BUfei8WI1dbDLAbMPRkxp7joj1eNb5+8=;
        b=sZzlXxDLBJT7qldT2hYeb63Xtu6k8/0s8JXbP1SYmI+YgGSiI/xWUqZtJVbfplJgYo
         KwkpAqzAIjsKu96e9nVTuad2vkZWXVvLQ3D56PnY+yrgje/wSsVEYc0x7wsWFomAwNLp
         NWv8hKogJNKuDeR5SM57ogRPkRuBGDREPWnEs8dJ7fyu5ffkjgIhJxLdaWKQk8i1l5Ja
         dCsajXj2JU4aPc2JE6hxBFFRyhmv+geccjFEIcmdMJ9bJ1w42xlBAslVk/vfGeKQpy8A
         K7rnC3M5K6FCI67q5Byw+HDCOwPAOw9TPoVD31lWDMN1XGeWgqvhNylJ+/FRKedCgOZ2
         NMPg==
X-Forwarded-Encrypted: i=1; AKwUvBzmEHKUvm86jZlryveuHD++q7ytVRO+fsXA71BfhEW4jcEtsLrLnGwx3pODXsah2dvOCNfgf8hN1G7xQlEP@vger.kernel.org
X-Gm-Message-State: AFuF++n5rzgz79N8ZmV6I9D77bmoxlv2xSm7urc30gdy1fmzB6A7RR9A
	5IlbmkKUuqWNePHI6So+FvbtmDK3wgnE4gRO1ZKC+lIWcZxKV1W1xw3eCYox7h2Yr2CO9JJX/GG
	N/YBr1LqVrzWF2ToW6uGJjyOQ+DKlciIz6XHl7hGH724BKFaMBa69L0dB39wIlNksVVsDp9L741
	+z
X-Gm-Gg: AYBFou2FbK70sJwFl2thF8jPzjaPzOje4M6aEdSjyL6qWSONW3Zd3xNQap/tPFbUYSI
	eFog5Zfz48Ib136fsq8VEKLBgD6m25GOoDOL4yilt6pRQ4R7pVd8pY1FP9CVyDtKiPSMv+G6jTq
	gu0vWnPOWmkHz2KyW8Wy1kLRdhmkz/LtwUqNoJz5RNdLrFLCXycyUjN4myMd+JiPFN09YNAfKTb
	PndwzxeOnSnvezBkIrApqMHOO/MeB2K+fs2apFqEm2wF8KxIWOWFZPumA59Cm7WchZ8cgLaM3tb
	SH84cw+oMAsS6anezqMSRnRJVwRCKpdAKitciFTlpIwwiLZqn5mHUDiGKnDL3aGK31XhhVVUQXa
	757jxhPRWvuXpL6+GAZ3n6m/lFApXMe15g2drVALsdXw3tYQlu1KcLB/qSfzmYzGMwERnx36S7r
	v2/zyqcEFb/Pia
X-Received: by 2002:a05:620a:710d:b0:93b:ca79:3b0b with SMTP id af79cd13be357-93c43be5048mr477719085a.24.1790345976483;
        Fri, 25 Sep 2026 07:19:36 -0700 (PDT)
X-Received: by 2002:a05:620a:710d:b0:93b:ca79:3b0b with SMTP id af79cd13be357-93c43be5048mr477713385a.24.1790345975854;
        Fri, 25 Sep 2026 07:19:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6b0795bsm567008e87.64.2026.09.25.07.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:19:34 -0700 (PDT)
Date: Fri, 25 Sep 2026 17:19:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>, Val Packett <val@packett.cool>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi/phy: power up the digital top before
 starting the 7nm PLL
Message-ID: <hqdsikuu7tgbkchteduzgno3pvzvhxahdrv52qy2v35qj3w7ms@qhsy2cot4uuy>
References: <20260924-dsi-7nm-pll-digtop-v1-1-c2b24c8e218d@oss.qualcomm.com>
 <DLNL4OAG2D1L.2EI2N80LMZV8N@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLNL4OAG2D1L.2EI2N80LMZV8N@fairphone.com>
X-Proofpoint-ORIG-GUID: UtDZxVzgTpnGFYv6-UXJlfdLb6uidI8k
X-Proofpoint-GUID: UtDZxVzgTpnGFYv6-UXJlfdLb6uidI8k
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1NyBTYWx0ZWRfX0eQTV/gcNVob
 FWPFr57Ou2aaNCkCuBFIrr59pMdXZ7Cv0v2Aw2gL8Q2rCqckh5D/YjvVYegIfcYiWH+CH5CSPz4
 bEA4VeJYtgn+Nq7tMftq21tQlCArxfw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1NyBTYWx0ZWRfX2Yp8SCrCUCJT
 njCklVkX6tP4r/KWcYPa6lO2wegkA2dbZCnYNirCeb2oHgJ2V8bJs5SqA57U+aqpqV7l3kvry7J
 rj76HM7GO5D3iOZdBL0451hwkmqxlPuaG6qkp2i4dsU/bZyOv1NmYDAYhi/ZKnWrNcX5q1MF9vC
 sDALfY2XhEJ420al3FcEbMU/qS/53+RKdAh4TaOxDYWshb0NPhVbtN32qlsg3CUb7uUTolT7nHQ
 c04sMgFWDa9FQ4REag4wE57tIHpCdYbGwyT+9o0oA6ff7yLvaGSOzwTtM1OI8o6JvT64BKCkvbU
 OcYuFx2dZCzZPwsdtpCclDn5xKgY+211XjBCvOmDp1GvVvIw9tTBhNbRpARZoBHVNlRrAF9vrD+
 Zs1iOsAsr1VR7erX7TiXDg3s/vXLObVC3dHAI8SgUJMRhUArQ5GolTySksHQtpyjMDnIaD54r/Z
 lB0p6sMMmEQOjBS00zw==
X-Authority-Analysis: v=2.4 cv=eNmGH3p1 c=1 sm=1 tr=0 ts=6ab682f9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=BDs8z1iCgLwJFp4fgFUA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250057

On Thu, Sep 24, 2026 at 03:36:05PM +0200, Luca Weiss wrote:
> Hi Dmitry,
> 
> On Thu Sep 24, 2026 at 2:51 AM CEST, Dmitry Baryshkov wrote:
> > dsi_pll_7nm_vco_prepare() de-asserts PLL_SHUTDOWNB and starts the PLL,
> > but leaves the PHY digital top powered down; only dsi_7nm_phy_enable()
> > sets DIGTOP_PWRDN_B.  The PLL cannot lock in that state.  This went
> > unnoticed for as long as the PLL was only ever prepared from the DSI
> > host's enable path, after the PHY had been enabled.
> >
> > Since commit acf7a91d0b0e ("clk: qcom: dispcc-sm8250: Enable parents for
> > pixel clocks") the clock framework enables the PHY PLL on its own while
> > applying the DT's assigned-clock-parents from of_clk_set_defaults(), at
> > probe time, before the PHY has been touched.  The lock fails, the failed
> > enable leaves the pixel clock with an unbalanced enable count, and the
> > retries on every probe attempt stall the boot for tens of seconds:
> >
> >   DSI PLL(0) lock failed, status=0x00000000
> >   PLL(0) lock failed
> >   dsi0_phy_pll_out_dsiclk already disabled
> >   WARNING: drivers/clk/clk.c:1188 at clk_core_disable+0x244/0x24c
> >    clk_core_disable
> >    __clk_set_parent_after
> >    clk_core_set_parent_nolock
> >    clk_set_parent
> >    of_clk_set_defaults
> >    platform_probe
> >
> > CMN_CTRL_0 reads 0x20 at the failing attempt: PLL_SHUTDOWNB set,
> > DIGTOP_PWRDN_B clear.  Setting DIGTOP_PWRDN_B alone makes the same PLL
> > lock, with no rate change and no other register touched.
> >
> > Power up the digital top together with the PLL bias, and power it down
> > again with it.  The normal enable path is unaffected: dsi_7nm_phy_enable()
> > holds the bias reference and writes CMN_CTRL_0 in full anyway.
> 
> FWIW the same fix seems to help on the 10nm with this error on bootup
> 
> [    0.503085] msm_dsi_phy ae94400.phy: [drm:dsi_pll_10nm_vco_prepare] *ERROR* DSI PLL(0) lock failed, status=0x00000000
> [    0.503168] msm_dsi_phy ae94400.phy: [drm:dsi_pll_10nm_vco_prepare] *ERROR* PLL(0) lock failed
> 
> I've also ported more commits from 7nm to 10nm locally, will send them
> soon, since anyway they should be good fixes and code quality
> improvements
> 
> drm/msm/dsi_phy_10nm: Protect PHY_CMN_CLK_CFG0 updated from driver side
> drm/msm/dsi_phy_10nm: Protect PHY_CMN_CLK_CFG1 against clock driver
> drm/msm/dsi_phy_10nm: Do not overwite PHY_CMN_CLK_CFG1 when choosing bitclk source
> drm/msm/dsi_phy_10nm: Define PHY_CMN_CLK_CFG[01] bitfields and simplify saving
> drm/msm/dsi_phy_10nm: Define PHY_CMN_CTRL_0 bitfields
> drm/msm/dsi_phy_10nm: Fix reading zero as PLL rates when unprepared
> 
> Unfortunately some other warnings/errors still persist on bootup that I
> can't figure out... maybe you have some idea?
> 
> If not, I don't want to bring this thread too much offtopic :)
> 
> [    1.197104] ------------[ cut here ]------------
> [    1.197113] dsi0_pll_bit_clk: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set

This looks like the read from the unpowered PLL block. Check that all
required bits are set. It might be worth replacing this standard
clk_divider (and the one in 7nm) with the special version that doesn't
go to the registers if the PHY is unpowered.

> [    1.197134] WARNING: drivers/clk/clk-divider.c:145 at divider_recalc_rate+0xac/0xd4, CPU#0: kworker/u32:0/12
> [    1.197150] Modules linked in:
> [    1.197160] CPU: 0 UID: 0 PID: 12 Comm: kworker/u32:0 Not tainted 7.2.0-00088-gddc402c24fff #86 PREEMPTLAZY 

-- 
With best wishes
Dmitry
