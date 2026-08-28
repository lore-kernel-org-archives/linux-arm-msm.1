Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEC543A7E7
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787919176; cv=none; b=LDpM2SVChIlqsAAU24x1EgOjZqtDuD38k3jYkfPaUYqeZHzHWcbPyKoldtqgqbFmeqdAztJp5MSE3gpfiUrDaRaaKbIFouTDqms4B/T1xTbdY/ZA8+GdGDJgJeo0HU52wZvS9vz2OGjfT7eNsYsRbCKaPHovi7MR5RkbbpD9CG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787919176; c=relaxed/simple;
	bh=0Nc+nhiZ+oV05icK61jd7OMyyn7VUZj12fSH0gzkh8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MCPSRryoKOyIJeCKRelVSU1Qrxvh6CC3AGIS5jyydfrqjJL0cAPxRXJV2hg+mNlPeGwTlipxOPcTMCyxcXlufHm8L7VGZARcUbQYfR788oLMUa4FEt2W/Mdt62KghIaCMVs9Mjswk4QOjwKDvnOwR72vAXRMYju+NLywPo5mb2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HZS/U8tJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hg3kQonp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HZS/U8tJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hg3kQonp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA87kR2596111
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z3zASg/IOmTyCS64W7qkQMt2E4H1NwFHCv+7aMnXk3I=; b=HZS/U8tJCFVASJ1x
	DkKwgyJhpSiwXTUCihUhDwbCXkPWr3GFPFlARtwOWq3XXiO0RxDcKSXBXV5OgR8K
	HJ/QZkk1QiOxikHvj61zjE2Ex8y46NlV8U8E5/yyJwXJjI67eHS8DCt2FraBUmLZ
	HH+GSbVY6+hk+MPji8XvxrlqPGmiX+zM4BE76b74UPB+VglmOYokn2UY3WDa1HJY
	hsBaSWahjS9pF5ZGXQhBEgSSACxiodU1xPIsoti5yLfoT7V2evoTYY7REJh7Z53I
	+u2Zq7Cg4c9to4F0VL7lhP6SlWd5JeDTJMmbdmfn1KmyV9xY5SGr/uMb9paIU+T7
	6HxrTg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb1v3a5sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:12:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfd1772d8so2060871cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 05:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787919165; x=1788523965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z3zASg/IOmTyCS64W7qkQMt2E4H1NwFHCv+7aMnXk3I=;
        b=Hg3kQonpAewJ21zIfj3QO2F/4di0KzhYgwAAup25kJ4vJ+L+izz5T/Gu8PwWJdm3xB
         cHU30Wq9QqfafDyF+9eul6dj5PsZKc75hD2WkxpXN2R3w9Cdi2tNrXXfgYYcjXdRr6W1
         j4+7ZLguXse9dXyZynEFRLs8q66UYpAmFAwLTO7E02OMjeCMuWaABJVGUeCTYmrCC71G
         3ReEgyKPC0ktVofV0IHzsy7ZD/q36t3TMSs8Mpjs0RFaix3zA0mNLAFiglqitB7h1ect
         m2iRktOyMk8XL2HRespNM7ZF35dY2l1hCeb6WNWHJmTuMPAfwH5fnXEAM77XpgJT8wEF
         H8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787919165; x=1788523965;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z3zASg/IOmTyCS64W7qkQMt2E4H1NwFHCv+7aMnXk3I=;
        b=qWrTScPNQ/+2woz2xktQiRj2b6whGJqUGj6Sr7XFC8RkPU7+Y6V0CLWoEMPDvSXxz+
         jc6zibz8G/fXgNDXEZWtD/MkTnK+f1pZNz7/ZOUW2163QCnD1Q5lPUNKwovN8rdd8RVT
         qDxyX+vcZ3bq3+ai5EShkhp8GLhRSeiCdEb8dUpD/B+FnnpfG84MOsFRJ1/WzV4VyOBb
         lEscLICpzN8gmC38LLdbMsz3egTxzOZTFBtdoXE/egLXmwssh/FG8FrOMIWD5hqZ7doD
         YIkTfAXW5GqOj/R/jvNXWkQs8hVem6sZMjZ+qJjaZlr0pbcyhUseGIDOuwrmTIer3kDk
         0jcg==
X-Gm-Message-State: AFuF++lAMjW2Vom5UCb5k/X8JpEWAvYC1ZANjUvOw5Q5bYao3IMlV/2K
	jW8qwBhov2xIXy11Tuhdrz+6G40ixhd99mgVYTl80tQk9IF5s+PQX+mZh5JAysmJtYqGivfiNWz
	Oj3lxMUW1ufkRlOeDH5kiMSS1pJ2QhyN2gnaHMpDhThzbwcad+WT+FnlrsKFNA3niJ6To
X-Gm-Gg: AR+sD12JnyKt6COWAQlk+/k33flVMrGoUksfTzJmfE7CW3hPlVGclmJ+Y95aKwpw5R1
	cpzovRqLef5NVLt7Tq4mp2ITpL8ZJdyYv8S7QoOD0HdVCvtEPRmZbmY6sGGpTjjXA7j4eCwI22m
	vzSEMD75P8M9IiMihS1PzaokuGfp5nQZ63USIWiRFZa7bXYfFRym9OQ2D6dtKjEqI0AudgJiXK/
	xLkFEv3h5n3ajhNKj4Np8gKakihqxnYx+cOrmVEJaram9Hi5c1EkM3E3lX+j9JgdnQ89v9rABz5
	Jsj8ueLvJKXVU+ZOc0+RccJFFr3yx1u7Ucm10M+27+0mvPjedfQ9UDhgluE8+UnHgZYBrgp1kPQ
	vh9hGNPC9BOqz5liL2c5b21k=
X-Received: by 2002:ac8:7f4f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52fb95f4e1amr48205001cf.3.1787919159815;
        Fri, 28 Aug 2026 05:12:39 -0700 (PDT)
X-Received: by 2002:ac8:7f4f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52fb95f4e1amr48203571cf.3.1787919158639;
        Fri, 28 Aug 2026 05:12:38 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee288afsm73982566b.23.2026.08.28.05.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 05:12:37 -0700 (PDT)
Message-ID: <4afd317a-24be-44c1-959e-9cdd220273f8@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 14:12:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] phy: qualcomm: qmp-combo: Rework DP PHY runtime
 configuration
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
 <20260828-glymur-phy-v3-v3-4-8e73ce7c4636@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-glymur-phy-v3-v3-4-8e73ce7c4636@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwNSBTYWx0ZWRfXxaZQvwYIsnJd
 l+rcsGOLgs+VM1A1Mfnx9/FSD8nhCRRiY59jFwe1yXqO/wCzXuuM0voE/flwnT2wzELNMNGuu8O
 BgWpC+kYmrvivQ4pDWXKnEhUzT28oZUQ1blcfLt84U7BVagk16yO8wDhjpxq17SNe4Q7VPl2N1w
 89m4/Co1hVK3Q59omZ4VmYeYCIjgbqFO03ZWkFuLx+wxv1DPCR6Brvr+Qllrw8lpoNijYyLyiqv
 3Y9SIdzw97A//wzV+GkyaY60SQEwvzUSY4TZrQNdApFJFEP+Pj+ovqitSe3RHlCL8+f/M6gs3Km
 KVY/JYxIcsUkVnSmAPPW45T9KQsAkXCdQSUghLQljrwkppg331o8AGk7qaCHBpZTpupx8lAiteu
 uiBCsduK0poyVeoyLfUaV93gX66VE8Eos2oaSna7aOw9+SbNe1GZr8hrbhpKXdFOBEwqf0vkFCY
 AYok3LOOQybKfVYLLTQ==
X-Proofpoint-ORIG-GUID: dPzlb6lNS8tP96Fq-Wvu4nNPJH25hBoH
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwNSBTYWx0ZWRfX5Niz2Cqy3uWp
 wk02vZxtOpcDzdvrZlE1LuQTLAgNPb0Rm0kmSrLi0RLxR3rG5C6zZwNkTjMbPQmuvGRbYB5vkYK
 WwJED3LV4UVSPJzAQWFRMJN+UB36Pm0=
X-Authority-Analysis: v=2.4 cv=faedDUQF c=1 sm=1 tr=0 ts=6a917b3d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=X346SdmPfOZ6fRuWxNEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: dPzlb6lNS8tP96Fq-Wvu4nNPJH25hBoH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280105

On 8/28/26 11:43 AM, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

[...]


> +static int qmp_combo_configure_dp_phy_common(struct qmp_combo *qmp)
> +{
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	u32 status;
> +	int ret;
> +
> +	if (!cfg->dp_aux_cfg2) {
> +		dev_err(qmp->dev, "DP AUX CFG2 value not configured\n");
> +		return -EINVAL;
> +	}
> +
> +	writel(0x0f, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG_1);
> +
> +	qmp_combo_configure_dp_mode(qmp);
> +
> +	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
> +	writel(cfg->dp_aux_cfg2, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG2);
> +
> +	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX0_TX1_LANE_CTL);
> +	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX2_TX3_LANE_CTL);
> +
> +	ret = qmp->cfg->configure_dp_clocks(qmp);
> +	if (ret)
> +		return ret;
> +
> +	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +	writel(0x05, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +
> +	writel(0x20, qmp->dp_serdes + cfg->regs[QPHY_COM_RESETSM_CNTRL]);
> +
> +	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_C_READY_STATUS],
> +			status,
> +			((status & BIT(0)) > 0),
> +			500,
> +			10000))
> +		return -ETIMEDOUT;
> +
> +	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
> +			status,
> +			((status & BIT(0)) > 0),
> +			500,
> +			10000))
> +		return -ETIMEDOUT;
> +
> +	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
> +			status,
> +			((status & BIT(1)) > 0),
> +			500,
> +			10000))
> +		return -ETIMEDOUT;
> +
> +	return 0;
> +}
> +
>  static void qmp_v8_dp_aux_init(struct qmp_combo *qmp)
>  {
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>  
> -	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_PSR_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> -	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
> -	       qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
> +	writel(0x3f, qmp->dp_serdes + QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1);
> +
> +	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> +			DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
> +			DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
> +			qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
>  
>  	/* Turn on BIAS current for PHY/PLL */
> -	writel(0x1c, qmp->dp_serdes + cfg->regs[QPHY_COM_BIAS_EN_CLKBUFLR_EN]);
> +	writel(0x17, qmp->dp_serdes + cfg->regs[QPHY_COM_BIAS_EN_CLKBUFLR_EN]);
>  
>  	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG0);
>  	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
> @@ -3729,8 +3807,8 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
>  	writel(0x27, qmp->dp_tx + cfg->regs[QPHY_TX_TX_DRV_LVL]);
>  	writel(0x27, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_DRV_LVL]);
>  
> -	writel(0x20, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
> -	writel(0x20, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
> +	writel(0x2b, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
> +	writel(0x2b, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
>  
>  	qmp_combo_configure_dp_swing(qmp);
>  }
> @@ -3738,48 +3816,41 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
>  static int qmp_v8_configure_dp_clocks(struct qmp_combo *qmp)
>  {
>  	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
> -	u32 phy_vco_div;
>  	unsigned long pixel_freq;
> -	const struct qmp_phy_cfg *cfg = qmp->cfg;
>  
>  	switch (dp_opts->link_rate) {
>  	case 1620:
> -		phy_vco_div = 0x4;
>  		pixel_freq = 1620000000UL / 2;
>  		break;
>  	case 2700:
> -		phy_vco_div = 0x2;
>  		pixel_freq = 2700000000UL / 2;
>  		break;
>  	case 5400:
> -		phy_vco_div = 0x4;
>  		pixel_freq = 5400000000UL / 4;
>  		break;
>  	case 8100:
> -		phy_vco_div = 0x3;
>  		pixel_freq = 8100000000UL / 6;
>  		break;
>  	default:
>  		/* Other link rates aren't supported */
>  		return -EINVAL;
>  	}
> -	writel(phy_vco_div, qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_VCO_DIV]);
>  
>  	/* disable core reset tsync */
>  	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>  
> -	writel(0x04, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SETUP_CYC);
> -	writel(0x08, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SILENCE_CYC);
> +	writel(0x09, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SETUP_CYC);
> +	writel(0x11, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SILENCE_CYC);
>  	writel(0x08, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_CYC);
> -	writel(0x11, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
> +	writel(0x33, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);

These 3 altered writes depend on the rate

>  
>  	writel(0x3e, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
>  	writel(0x05, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TX2_TX3_LANE_CTL);
>  	writel(0x05, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TX0_TX1_LANE_CTL);
>  	writel(0x01, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_CFG1);
> -	writel(0x11, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
> +	writel(0x33, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);

This is duplicated, it seems

>  	writel(0x1f, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN0_DRV_LVL);
> -	writel(0x1f, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN1_DRV_LVL);
> +	writel(0x02, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN1_DRV_LVL);

This depends on swing/preem levels

[...]

> @@ -3938,13 +3971,13 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
>  	} else if (dp_opts->lanes == 2) {
>  		bias0_en = reverse ? 0x3f : 0x15;
>  		bias1_en = reverse ? 0x15 : 0x3f;
> -		drvr0_en = 0x10;
> -		drvr1_en = 0x10;
> +		drvr0_en = 0x30;
> +		drvr1_en = 0x30;
>  	} else {
>  		bias0_en = 0x3f;
>  		bias1_en = 0x3f;
> -		drvr0_en = 0x34;
> -		drvr1_en = 0x34;
> +		drvr0_en = 0x30;
> +		drvr1_en = 0x30;

2ln settings should also depend on the reverse state


>  	}
>  
>  	writel(drvr0_en, qmp->dp_tx + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
> @@ -3952,6 +3985,15 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
>  	writel(drvr1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
>  	writel(bias1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
>  

This should also be preceded by LANE_CLKBUF_EN, I think

> +	writel(0x03, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
> +	writel(0x23, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
> +	writel(0x22, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
> +
> +	writel(0x0a, qmp->dp_tx + QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL);
> +	writel(0x0a, qmp->dp_tx2 + QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL);
> +
> +	writel(0x3e, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);

Konrad
