Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990F04207A
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789344728; cv=none; b=F0PV+xK0kL7RbYdU5kNiEboCCSd6xCAsJZlvitl7cyFicHzDRyDyMLdTGmig6/DWYrWD1zNlLkIZgd9eqkhLrfPMrGINsaqn+5Loo/k/r/psfQIj4cd1EKxra5omcSfnyI5wvsAPrcCJ3nel/sbKbrZN16yRYMSlIEV5oHybf3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789344728; c=relaxed/simple;
	bh=ktKAtESfUnxoW7og7rX5gduf8kn8Z7FqLaUrmXjT3jU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZcoSN8Y6oo4Fc0euLhdp/Pp64i4TzSzYbP05/tOvzcyrkOeulQSAybs4kwTs9LbXFkidLjsy2vo82SGX+moKGz6psAYpXAcBOBQOS9cXfPrfYhTq9ywQOpgQJm0VmZomSjRScheD44lY+3HtObO/MQYVtNRVDhrd2uAjrpx80w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=epHc4tgs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EKO4Icp7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="epHc4tgs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EKO4Icp7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E069hr3130305
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e8pSLRGNT3rSCZcyNbWseqo/
	tYmMZllBzMLqwr0LFTg=; b=epHc4tgsZj5yGCT4hjzftMjZh0Jl+bg1warXRRhn
	6M3YznL2a/eTFZN9w5gnyszvVXCAcnZIKpe6He0Ua5fIQ1aHjwv3G1UP8BIposuc
	bZh50lMr2ntc0QLLoXuNPEewAPBbHhXPC2CvK22qeHF+zhDpGsXOWAxw9T1r/cLs
	S2tfuPpJ17jCV7IMJXXk06itpT5nhqE2jfkUsw96Y5DghRrie5B/+ehtXEs8yX4z
	9aqLsMguKT1MmWM9OO2FikDp3hGdcE9YxjZv7H0c5uGsdKR4n/lPfBLQokTUzcOd
	7h8/xjhrPZdHu5LdPYJlcmtohFaJQm5KflRQz3yEPxehow==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c4e13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:12:05 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-791463ed29dso2455205137.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 17:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789344724; x=1789949524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e8pSLRGNT3rSCZcyNbWseqo/tYmMZllBzMLqwr0LFTg=;
        b=EKO4Icp7ih64pByBIhMMlgYJdnMCoGnKJDoYeU5rXK2vvEEZYM35bs8ehYReXQV/sG
         kQUIH7ruQv6fRkX1ADnFhrprbZjnD3hfsWLoxdWCiDG2zz9i4aeuMr36XuWpVqcegcWs
         yBwGc3VQBGvxDztaP33K5Sc0XY1H9/CcNol5teSImDm27b+uxQwF1MUe1Hiq9Ty/t+HU
         +I7wS4IylyHh9psSGClTkNefvDBZlPkwUlYmc3lYI/fkgbfP9eHknUNodDP3lFLw7j4E
         fQFvcqU+jKgelmDWbKm7pl9eZf4QER2EJ3ykPx1+QR45/9gAMWu/n5QZpCC1LS5xju5S
         N91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789344724; x=1789949524;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e8pSLRGNT3rSCZcyNbWseqo/tYmMZllBzMLqwr0LFTg=;
        b=seSNeX4lIUezaE/EpRa1SDLArbAyMSNPJp18cOfPUKgn8BFha5lWqk4NfBWDj09fF8
         Ex/h3Juii0aOHGrrRhzTt6JRkSAdFONlXtGac9q8osckVyt7qpyYpSFuiD2ykCK9j5SO
         03So8NWbUqAWbKjfeeZSFm7ZEBDX87Cnq/i3uKMcvDfeFSDIBaQ69jGEj8mf+gXFUR/h
         aIoktiPmsS3hw6lctgXONxuTH7sHxQBYw7IQs8sQfvHfqDf5FhXI7iegO9pD/VxCXYzH
         sWaxDE+R3KvY0zzvAm+kSdMou0yGGGfEKMBII6orHSJVXSAkpyEdorNvx4WiB5qF1PWI
         6b+A==
X-Forwarded-Encrypted: i=1; AKwUvBz/KYvz9pGOhznNVTGeu3QirgEbSEoJvCeWBboumwEWlJQ3xzBy3zV6L/S1zzJX13fKBCNHOQgfL01AMq+2@vger.kernel.org
X-Gm-Message-State: AFuF++l8iHlheDZgaeqJlVHi7s9dKexSz97cZpEI0vOxdJGX6iD8JaFo
	HpO8vofg4+jwXK9H6DZM5ZE2IsWi6eRP77N3Isnv5aW08oJ9cSy8Jb3TeMUAJy8s0vja0oi645y
	ctGWgfn9AfuXAceGIeYIsn2us/khphLmcZrZHp/3Qqw2/yiIaEgBYMmkXzkztjTEU9v7q
X-Gm-Gg: AYBFou0zH7UBRA3wFbperz70icVDb4fCEZecZztZ3pWO63BAWd6ptvNyDvgpE8ipf9i
	8ECtzirtJPKmZttQjAdwcCwCpHfRuhb0678X7l5GnNhnz4MhN/ROnK0LFEZ8fulNFDn1A2Pkstd
	CSkPklRsNK3irJSJukLeuQ6JFHp/wRGMqFBB0Qy/kw0q5C0ujapsUWVUbOfb9LcarwlDUnxPSYd
	Mf7oXDtHZiUOKXUM0O8Fiwx2N4FnXto5wr8m2m7nUKQ6T4iRKe9enILf1orxTo+cgFbQKNpfbi7
	VGdZPVMMjDHI7Acgg4WiyBAivDDZTI8AxwCeB6w7MuevSMADDd3q4k0oJePYWmxkrI5UeI7SjY1
	EbRGqTMY7S9VzY1L1o4GL5UuDrT9NEcUW93ZBY8wu5F4EqX4HqWO5p3z79aGIyqq/dMaVTE3KdK
	LvtROC/fDE+Ci2
X-Received: by 2002:a05:6102:4492:b0:779:c38e:de53 with SMTP id ada2fe7eead31-79b5b28fe7cmr67036137.10.1789344724391;
        Sun, 13 Sep 2026 17:12:04 -0700 (PDT)
X-Received: by 2002:a05:6102:4492:b0:779:c38e:de53 with SMTP id ada2fe7eead31-79b5b28fe7cmr67008137.10.1789344723990;
        Sun, 13 Sep 2026 17:12:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0456bbesm1989247e87.22.2026.09.13.17.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:12:02 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:12:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 14/17] phy: qcom: edp: Add Nord PLL configuration callback
Message-ID: <nv5ij423d4rbwpnhexj6yv2qgasrb7k3wzoo7o6vx5kg3vc3n7@6u4rln5ltbsv>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-14-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-14-e25c073cf1b6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: VR2tSBeRxH_kTmo7BalXGYCoc5Dop1C_
X-Proofpoint-GUID: VR2tSBeRxH_kTmo7BalXGYCoc5Dop1C_
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa73bd5 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=G5yU_OXk3sxSGaYP5ugA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAwMSBTYWx0ZWRfXwcWALZsrcXPx
 UyL5WyVK1bsGqH/jTx1KROLcSrBO68jKaTKRdbiijxEqvWMasFK3P4wPT9X4rxW12K3vpaaQ8Xi
 TZ+d0togdajgvmqEwcZPr3qYLLauwFB2cepXHQLY+HQKrZTUErdC0gbdfGQcCe836dXqwKKdA2S
 r1yIf4XxrTX1+aBDZf518YCUlRcywgNeJ+aetnWhuQYh/ZgaMMWSOJK9km2pVNn1Zcobz3h5Xuc
 4ZgZHVMhWhvg6xYABpyiVI2w+2aYe69b6XvKoOGwnpumVW8RFvmJC6OUMGseGp7J3pUrHdPVHIJ
 gBoRM54zw4bIMKNqW/2so3UXrcLbx/4LmBO7ieCANUNo/V7VxdlRdtO2u0mU1qbQTpaLHieLd4c
 qpcK4UysIV99etpEmIDVGFP1jzrYO/qiS1xgiOOg17TFMR4HLol7zHZugACBzEmi9+aN1jEDcz2
 Sy4sG0JCTgdZM3QgAmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAwMSBTYWx0ZWRfX796FrR/KItTY
 kZ3TZajYa2NWFODymiqPZkyVHfq98KBIllsLQITw9sWyraetGrivbBvQrrPI5JHQ+WlWglR/Xcm
 EHvxsPiO8gVQ1urZ63ROm3J4Ch7Hc18=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140001

On Fri, Sep 11, 2026 at 09:06:45PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Nord uses a 38.4 MHz CXO reference with a different QSERDES v8 COM
> register layout and PLL coefficients.  Add
> qcom_edp_com_configure_pll_nord() which programs all QSERDES COM PLL
> registers with link-rate-dependent values for RBR, HBR, HBR2 and
> HBR3, per HPG Table 2-1-d.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 112 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 112 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index a0f4b12e561e..4d1b2c81d956 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -1688,6 +1688,118 @@ static int qcom_edp_com_configure_ssc_nord(const struct qcom_edp *edp)
>  }
>  
>  
> +/*
> + * Nord PLL configuration per HPG Table 2-1-d, CXO = 38.4 MHz.
> + * Supported link rates: 1.62 Gbps (RBR), 2.7 Gbps (HBR),
> + * 5.4 Gbps (HBR2), 8.1 Gbps (HBR3).
> + */
> +static int qcom_edp_com_configure_pll_nord(const struct qcom_edp *edp)
> +{
> +	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
> +	u32 div_frac_start1_mode0;
> +	u32 div_frac_start2_mode0;
> +	u32 div_frac_start3_mode0;
> +	u32 dec_start_mode0;
> +	u32 lock_cmp1_mode0;
> +	u32 lock_cmp2_mode0;
> +	u32 lock_cmp_en;
> +	u32 hsclk_sel;
> +	u32 code1_mode0;
> +	u32 code2_mode0;
> +	u32 core_clk_div_mode0 = 0x14;
> +
> +	switch (dp_opts->link_rate) {
> +	case 1620:
> +		hsclk_sel		= 0x0c;
> +		dec_start_mode0		= 0x54;
> +		div_frac_start1_mode0	= 0x00;
> +		div_frac_start2_mode0	= 0x00;
> +		div_frac_start3_mode0	= 0x06;
> +		lock_cmp1_mode0		= 0x37;
> +		lock_cmp2_mode0		= 0x04;
> +		lock_cmp_en		= 0x04;
> +		code1_mode0		= 0x8d;
> +		code2_mode0		= 0x27;

No extra alignment, please.

> +		break;
> +
> +	case 2700:
> +		hsclk_sel		= 0x04;
> +		dec_start_mode0		= 0x46;
> +		div_frac_start1_mode0	= 0x00;
> +		div_frac_start2_mode0	= 0x00;
> +		div_frac_start3_mode0	= 0x05;
> +		lock_cmp1_mode0		= 0x07;
> +		lock_cmp2_mode0		= 0x07;
> +		lock_cmp_en		= 0x08;
> +		code1_mode0		= 0xf6;
> +		code2_mode0		= 0x20;
> +		break;
> +
> +	case 5400:
> +		hsclk_sel		= 0x01;
> +		dec_start_mode0		= 0x46;
> +		div_frac_start1_mode0	= 0x00;
> +		div_frac_start2_mode0	= 0x00;
> +		div_frac_start3_mode0	= 0x05;
> +		lock_cmp1_mode0		= 0x0f;
> +		lock_cmp2_mode0		= 0x0e;
> +		lock_cmp_en		= 0x08;
> +		code1_mode0		= 0xf6;
> +		code2_mode0		= 0x20;
> +		break;
> +
> +	case 8100:
> +		hsclk_sel		= 0x03;
> +		dec_start_mode0		= 0x4f;
> +		div_frac_start1_mode0	= 0x00;
> +		div_frac_start2_mode0	= 0xa0;
> +		div_frac_start3_mode0	= 0x01;
> +		lock_cmp1_mode0		= 0x17;
> +		lock_cmp2_mode0		= 0x15;
> +		lock_cmp_en		= 0x08;
> +		code1_mode0		= 0x14;
> +		code2_mode0		= 0x25;
> +		core_clk_div_mode0	= 0x0a;
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	writel(0x01, edp->pll + DP_QSERDES_V8_COM_SVS_MODE_CLK_SEL_NORD);
> +	writel(0x0b, edp->pll + DP_QSERDES_V8_COM_SYSCLK_EN_SEL);
> +	writel(0x02, edp->pll + DP_QSERDES_V8_COM_SYS_CLK_CTRL);
> +	writel(0x0c, edp->pll + DP_QSERDES_V8_COM_CLK_ENABLE1);
> +	writel(0x06, edp->pll + DP_QSERDES_V8_COM_SYSCLK_BUF_ENABLE);
> +	writel(0x30, edp->pll + DP_QSERDES_V8_COM_CLK_SELECT);
> +	writel(hsclk_sel, edp->pll + DP_QSERDES_V8_COM_HSCLK_SEL_1);
> +	writel(0x07, edp->pll + DP_QSERDES_V8_COM_PLL_IVCO);
> +	writel(lock_cmp_en, edp->pll + DP_QSERDES_V8_COM_LOCK_CMP_EN);
> +	writel(0x36, edp->pll + DP_QSERDES_V8_COM_PLL_CCTRL_MODE0);
> +	writel(0x16, edp->pll + DP_QSERDES_V8_COM_PLL_RCTRL_MODE0);
> +	writel(0x06, edp->pll + DP_QSERDES_V8_COM_CP_CTRL_MODE0);
> +	writel(dec_start_mode0, edp->pll + DP_QSERDES_V8_COM_DEC_START_MODE0);
> +	writel(div_frac_start1_mode0, edp->pll + DP_QSERDES_V8_COM_DIV_FRAC_START1_MODE0);

Always 0x00

> +	writel(div_frac_start2_mode0, edp->pll + DP_QSERDES_V8_COM_DIV_FRAC_START2_MODE0);
> +	writel(div_frac_start3_mode0, edp->pll + DP_QSERDES_V8_COM_DIV_FRAC_START3_MODE0);
> +	writel(0x12, edp->pll + DP_QSERDES_V8_COM_CMN_CONFIG_1);
> +	writel(0x3f, edp->pll + DP_QSERDES_V8_COM_INTEGLOOP_GAIN0_MODE0);
> +	writel(0x00, edp->pll + DP_QSERDES_V8_COM_INTEGLOOP_GAIN1_MODE0);
> +	writel(0x00, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE_MAP);
> +	writel(lock_cmp1_mode0, edp->pll + DP_QSERDES_V8_COM_LOCK_CMP1_MODE0);
> +	writel(lock_cmp2_mode0, edp->pll + DP_QSERDES_V8_COM_LOCK_CMP2_MODE0);
> +	writel(0x0a, edp->pll + DP_QSERDES_V8_COM_BG_TIMER);
> +	writel(core_clk_div_mode0, edp->pll + DP_QSERDES_V8_COM_CORECLK_DIV_MODE0);
> +	writel(0x00, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE_CTRL);
> +	writel(0x1d, edp->pll + DP_QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN);

Not 0x1f?

> +	writel(0x0f, edp->pll + DP_QSERDES_V8_COM_CORE_CLK_EN);

No DP_QSERDES_V8_COM_VCO_TUNE1_MODE0 /
DP_QSERDES_V8_COM_VCO_TUNE2_MODE0?

> +	writel(code1_mode0, edp->pll + DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE1_MODE0);
> +	writel(code2_mode0, edp->pll + DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE2_MODE0);
> +
> +	return 0;
> +}
> +
> +
>  static const struct of_device_id qcom_edp_phy_match_table[] = {
>  	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
>  	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
