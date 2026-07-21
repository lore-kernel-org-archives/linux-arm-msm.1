Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8F443E483
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784676430; cv=none; b=Q+5OtyIWGVdY7MZE8ha4er/LByXk39pTqEWW4YIIOkgoYVfIhrOmgvITzOd0F+h10hQ2/VfD1DZUYqkZDe+5igEHqquzriCES2aWLj9mvJTacvGi4vSq8v/Jl6otnltADi1IW/wjb0kaC+moJyZwCSVyputIutjedXGbRM1U6zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784676430; c=relaxed/simple;
	bh=Inae5RPIN4Ku8/uZWKkykvp4V4fhRsPAyhzMzGFuS8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IS0aTfHjKD5gXNL3s2i7jsMs0FFKs8cQTT/7LdzRofLAQ1hX3mMDaJNDVAfNtT3gCXaEI6wKRTFmk8Q6Vmrrf7llinWcbLJVXE7C4RiPxl4QFeqpQWwf6jFVJXFtl8UPdVDhMAMTQZFFd+uJV7ffOUvlTVkEIq5DUVd5JAPe/Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n3Cb1rdt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/mJUXFU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n3Cb1rdt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j/mJUXFU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZoLW3172008
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AGwMeV7UNLwY0KpOqMhLEGJT
	auAHKsaW6udyi59jP0E=; b=n3Cb1rdtxsJK37aWJV6Url4xdeqKXfW3hKkDIqnj
	w0pKl8CukDCeKp8PeScTvKbnhfMt0suxWLxh9KCAfxeG84+wL/OXNiGT2ro2RJCi
	5FJ04A5GEKwpsLJemi7FvTM1SiTZ3wOfyvV6TKVG08UXhXlZH8qpa6Q6+ScNaa7t
	fMCYUADzReG6iOtd+OcLz/jG+CCAB3/0ZsaQpW9+kWG+qdyd5RhG3CqVsLE/0AiD
	pvdb6g1irSC6S02HPRJH8C2awUyvDgaxCKYaULt3yw1rXOLAv8b0M6p0hyCwJJOP
	pFmHrPJ5MmzrvHg6JavdQJQ9QGZKkzWTGhZ/rrXmJo8nfw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bsajpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:27:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c26012cd0so208551941cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 16:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784676425; x=1785281225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AGwMeV7UNLwY0KpOqMhLEGJTauAHKsaW6udyi59jP0E=;
        b=j/mJUXFUbf8P76EnrVYVJB+TeNbAkayzXJbOnNGBWUiJNHXEfCqVDjwKgAjP5Krvi3
         1TzBONAl+ZeQoeuvu4A6yePMKCleISsuH2jiP1whfDS3RTPU8GClob45WUnU4E5mCNAs
         CPMO72DKIrGP7U9xw8mhbbpZtDIoLVQSoYaoIfN+7Hbbae+4W1si3CYwANpk9eRcbMJ6
         TRqZLMmLs5uGhoP3khy4LzUTKmgSutz/fXaIDExvbK3xps528HLH12EuJFMmNVuUFaac
         UNCUKbbTJSPAZNZ4KWO+xvHZ/aci7NtcWmow7HhVGljc3pghMVXHDVvecMhYAiBhnwOH
         +4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784676425; x=1785281225;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AGwMeV7UNLwY0KpOqMhLEGJTauAHKsaW6udyi59jP0E=;
        b=SaMLj/5XPksmnl6fguxYleisKjlmD19GdMHofKIyWEdZW6t+Shdv7f94/He1+60TaK
         Pe/K8jU9GuED2saJWbe7YSPsQOKxsxbyaetT8OJKQTbkUw4/Xaak7K+kVxaf05QsqmoE
         2j3xtNNPXu1WG6UIayNiqJnt8hva4I0BNDHMl6x7WFk2Q/Wg051fo5NU3pwZyRG+s3Vn
         Yqpf8qb71B0gtkGjQdT0OG0KT1gPb1F9uLFSRDlf6xjkdm+JNMxC8/DHVeOhd2h/IL/O
         ciDz4lJVBZtr5/tkSa6YkmOnMQYVoRlTZIxw+J14TmcY350vhW02TWQ9FOat8UUa1NZW
         T3Xg==
X-Forwarded-Encrypted: i=1; AHgh+Rr88vbAI5IYmY8k6TmeUBgTdM34xESGFX7ONg3DH+79dGxQedDKTA+BArRQlsdOKHdA/yRAn5Zn7MjLXUys@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5iXjq6dv/RDbSLEBq1BBYb8XMf3epv507S2IJtfw1w8hZRjHN
	CYZ7U5VviNiNpI5eUCiezlM4i5AjBhrhjzmyDHmGq1IPjqN/MJhO+z+1UOkEGPCYy6wOeqAow8B
	KbHZEOVUZ1DW1qJrh7q0WsKA3ZCy3JbstiEJ4DO0rTZLs7OdXsrOlLM0MT3YDqtmtr3qbSmK4dU
	xy
X-Gm-Gg: AfdE7ckiV3Pkh3xPVQf+rWclR5UIa06ihRFW02cWIhO515B4wX2+Iyx+i1s2hWg8X0d
	l6WVJ3PooseQNrzZCOh3r1XPEkBaS9MNCBcrqF6ZlyYejuiieBIMYB6ztU3ss2yd7AcK1zxhznx
	UGTE+BKdmseOZvTzueSygm4nx0ww3lLpGoNeR1w2+y6FarBel+ikbyo0LJEzjwuFzlDaQtEGb8m
	Pa9SPM+d1e99wjyD97Ba69ut7fR0S7FGaP7mtam99oBBhBRy8zgwO6eOWyiB2GVsLuPlxdmzDZM
	8dMZ9re0/InvQQ/7AG9FGqWdrWfll4hY4J8jZqsDZzSyRufORlwJ/LXxIzCtONC4hMYPg4ZeM7+
	dm/EosnqADF8Dg4VW4S/z5oOIal2nUbgUp3VeoX/QruWD6kqOcMwrtalKKpqpYlPA+Gbs6rH5VM
	qPVuxUB2SXz4wTXA==
X-Received: by 2002:a05:622a:904:b0:51c:7b12:6002 with SMTP id d75a77b69052e-5213e77cfadmr187376411cf.78.1784676424674;
        Tue, 21 Jul 2026 16:27:04 -0700 (PDT)
X-Received: by 2002:a05:622a:904:b0:51c:7b12:6002 with SMTP id d75a77b69052e-5213e77cfadmr187376071cf.78.1784676424040;
        Tue, 21 Jul 2026 16:27:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6d8c297sm1473461fa.39.2026.07.21.16.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:27:01 -0700 (PDT)
Date: Wed, 22 Jul 2026 02:26:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH] phy: qualcomm: qmp-combo: update DP PHY PLL programming
 on Glymur
Message-ID: <5a5sgj22xzjp3sosnfjvm62waz7sf4d7w33takzsbzpiojrc2h@z6a7bjazyhks>
References: <20260721-glymur-phy-conf-v1-1-7c8909552c5e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-glymur-phy-conf-v1-1-7c8909552c5e@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: aztKk_GIn5MVUpY6ZVJhzXZC7lWtG8BK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDI0MiBTYWx0ZWRfX4QOLrwx/ZBaZ
 DcjBtsaycfS55sQzxpVZQ9qCJhji3BeRO3ippMUakH24PAXCPySJx22S2lk79M0g9qQl2aUsJJQ
 kraItLtzF3wyt1KXLC2oMFf9REQ63VqE1NIThDWR8wfoVEUKZU5WPlSX1BvGI4knF2qrHE+RuKj
 tCFf1K87Kl8MFVqganO3nb+H+4ILNWM/NXPy0pUhHUeRJ+T06jk+YE5uS1zBoruK8OTsmiI7cmz
 aegN2C52hVLJ8UcfKhi1lqlWLWdYSEfCtN4+MHuwaOr8QAoK2YIOfXd7fRnxcY+C/lOKrZx94B5
 KangZCgGl8I57UbMOtaqmiQOYkVSjeg3FoZRHELhopYblbu3cezOgRMEyxTpAfeCpU+lybgPg+B
 SxkIxLb6VXvK/tCvO2W4AU+UbB9tRfHH4BRm7pSCImCIbJdiJqNKlCGvYg/D/6Y4lgE+J4dxdol
 r8PwylHNNK5cNzdldwA==
X-Proofpoint-GUID: aztKk_GIn5MVUpY6ZVJhzXZC7lWtG8BK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDI0MiBTYWx0ZWRfXyYHqZjsTEn9/
 Y5SVFd7W2RFRWHDVrFB/DZLw16lUCgtq9uFuixzX7dIGSWgdL1PIM6CeLUclll6GQViTYNbQpk8
 HTz9LMvVZjit2BSwlJW4pzFFsaRESfo=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a600049 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nw4lXKZx8MFDIasXF9oA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210242

On Tue, Jul 21, 2026 at 10:48:33AM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> The existing DP PHY PLL and AUX configuration for the Glymur platform
> does not fully follow the Hardware Programming Guide requirements for
> DP over Type-C, which results in DP link bring-up failures.
> 
> Update the DP PHY programming sequence and PLL-related register
> settings to align with the latest HPG recommendations. With this
> change, DP link training completes successfully on Glymur-based
> platforms.
> 
> Fixes: d10736db98d2 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
> The existing DP PHY PLL and AUX configuration for the Glymur platform
> does not fully follow the Hardware Programming Guide requirements for
> DP over Type-C, which results in DP link bring-up failures.
> 
> Update the DP PHY programming sequence and PLL-related register
> settings to align with the latest HPG recommendations. With this
> change, DP link training completes successfully on Glymur-based
> platforms.
> 
> Changes in v2:
> - Use the DP-specific v8 COM status register definitions
> (DP_QSERDES_V8_COM_C_READY_STATUS and DP_QSERDES_V8_COM_CMN_STATUS)
> instead of adding new N3 USB/DP variants.(Konrad)
> - Drop the qmp_v8_combo_configure_dp_mode() implementation and
> reuse the common qmp_combo_configure_dp_mode() helper, restoring
> orientation-specific DP_PHY_MODE programming (0x4c/0x5c) and addressing
> review comments regarding DP_PHY_MODE handling.
> - Include phy-qcom-qmp-dp-qserdes-com-v8.h for the DP COM register
> definitions.
> - Update patch author to Ritesh Kumar.(Konrad)
> - Link to v1: https://lore.kernel.org/all/20260419-glymur_dp-v1-1-ad1067a8e8ae@oss.qualcomm.com/
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 190 ++++++++++++++++++++----------
>  1 file changed, 129 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index cdcfad2e86b1..c98abae40a32 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -50,6 +50,7 @@
>  #include "phy-qcom-qmp-dp-phy-v6.h"
>  #include "phy-qcom-qmp-dp-phy-v8.h"
>  
> +#include "phy-qcom-qmp-dp-qserdes-com-v8.h"
>  #include "phy-qcom-qmp-usb43-pcs-v8.h"
>  
>  /* QPHY_V3_DP_COM_RESET_OVRD_CTRL register bits */
> @@ -283,8 +284,8 @@ static const unsigned int qmp_v8_n3_usb43dpphy_regs_layout[QPHY_LAYOUT_SIZE] = {
>  	[QPHY_DP_AON_TOGGLE_ENABLE]		= QPHY_V8_PCS_AON_DP_AON_TOGGLE_ENABLE,
>  
>  	[QPHY_COM_RESETSM_CNTRL]		= QSERDES_V8_COM_RESETSM_CNTRL,
> -	[QPHY_COM_C_READY_STATUS]		= QSERDES_V8_COM_C_READY_STATUS,
> -	[QPHY_COM_CMN_STATUS]			= QSERDES_V8_COM_CMN_STATUS,
> +	[QPHY_COM_C_READY_STATUS]		= DP_QSERDES_V8_COM_C_READY_STATUS,
> +	[QPHY_COM_CMN_STATUS]			= DP_QSERDES_V8_COM_CMN_STATUS,

There are too many changes squashed into one commit, which makes it
harder to review. Could you please separate them into the logical
smaller chunks? Register layout fix, tables and other values update,
configuration rework, etc.

>  	[QPHY_COM_BIAS_EN_CLKBUFLR_EN]	= QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN,
>  
>  	[QPHY_DP_PHY_STATUS]			= QSERDES_V8_DP_PHY_STATUS,

> +static int qmp_v8_helper_configure_dp_phy(struct qmp_combo *qmp)
> +{
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	u32 status;
> +	int ret;
> +
> +	writel(0x0f, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG_1);
> +
> +	qmp_combo_configure_dp_mode(qmp);
> +
> +	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
> +	writel(0xa4, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG2);

If we are writing 0xa4 here, why does qmp_v8_dp_aux_init() write 0x06?

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

This is exactly the same as a part of qmp_v456_configure_dp_phy().
Please use it in that function too (and name correspondingly).

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
> +		DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
> +		DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
> +		qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
>  
>  	/* Turn on BIAS current for PHY/PLL */
> -	writel(0x1c, qmp->dp_serdes + cfg->regs[QPHY_COM_BIAS_EN_CLKBUFLR_EN]);
> +	writel(0x17, qmp->dp_serdes + cfg->regs[QPHY_COM_BIAS_EN_CLKBUFLR_EN]);
>  
>  	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG0);
>  	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
> @@ -3361,8 +3420,8 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
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
> @@ -3370,48 +3429,41 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
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

No more VCO?

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
>  
>  	writel(0x3e, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
>  	writel(0x05, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TX2_TX3_LANE_CTL);
>  	writel(0x05, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TX0_TX1_LANE_CTL);
>  	writel(0x01, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_CFG1);
> -	writel(0x11, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
> +	writel(0x33, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
>  	writel(0x1f, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN0_DRV_LVL);
> -	writel(0x1f, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN1_DRV_LVL);
> +	writel(0x02, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN1_DRV_LVL);
>  
>  	clk_set_rate(qmp->dp_link_hw.clk, dp_opts->link_rate * 100000);
>  	clk_set_rate(qmp->dp_pixel_hw.clk, pixel_freq);
> @@ -3558,7 +3610,7 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
>  	u32 status;
>  	int ret;
>  
> -	ret = qmp_v456_configure_dp_phy(qmp);
> +	ret = qmp_v8_helper_configure_dp_phy(qmp);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -3570,13 +3622,13 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
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
>  	}
>  
>  	writel(drvr0_en, qmp->dp_tx + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
> @@ -3584,6 +3636,14 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
>  	writel(drvr1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
>  	writel(bias1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
>  
> +	writel(0x03, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
> +	writel(0x23, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
> +	writel(0x22, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
> +
> +	writel(0x0a, qmp->dp_tx + QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL);
> +	writel(0x0a, qmp->dp_tx2 + QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL);
> +
> +	writel(0x3e, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
>  	writel(0x08, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>  	udelay(100);
>  	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> @@ -3591,16 +3651,24 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
>  
>  	if (readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
>  			status,
> -			((status & BIT(1)) > 0),
> +			((status & BIT(0)) > 0),

Why?  Should we poll both BIT(0) and BIT(1)?

>  			500,
>  			10000))
>  		return -ETIMEDOUT;
>  
> -	writel(0x00, qmp->dp_tx + cfg->regs[QPHY_TX_TX_DRV_LVL]);
> -	writel(0x00, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_DRV_LVL]);
> +	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
> +			status,
> +			((status & BIT(0)) > 0),
> +			500,
> +			10000))
> +		return -ETIMEDOUT;
>  
> -	writel(0x2b, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
> -	writel(0x2b, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
> +	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
> +			status,
> +			((status & BIT(1)) > 0),
> +			500,
> +			10000))
> +		return -ETIMEDOUT;
>  
>  	return 0;
>  }
> 
> ---
> base-commit: 6946bc5406f7fe2cb024419eca681bb0280f3461
> change-id: 20260720-glymur-phy-conf-fc878ed134b1
> 
> Best regards,
> --  
> Nabige Aala <nabige.aala@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
