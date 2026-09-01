Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF046275B03
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 12:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266038; cv=none; b=auN0Fy+3i5m/P3cyVOL5AtamvvZq9VgEgg4xTbF9PVbjP0TuSkoD26a8SKI8iu68NN94swmZyjKrVbcHB09kvCAF8aWN9RXWNIcMjX8G4yVGUASmbmYbzorCeUwLuhkInZzr4daUjVB5UvSiorrMxc8wf3O0E/75rARb9kqKHN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266038; c=relaxed/simple;
	bh=+GrlwZTegUS41iAh6l8A/qPck4pkUf64zUownPs0fqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gsMntfrcfImI780VjB/7o/7xtZDIjOQH/yKGfqmICyJQBK5f7Cd4RtgxaADqmf2HrKz4568+vNTRET4SD2liEegXEx49EokQWjbDq5Ydkzzda2d3yBY6tb+FokX7AaBxia475Nvyh1iDTpzKQ88eEfY0ZTdj8YrsXPo7wL5xmwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgyopRWB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fMfceL+o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgyopRWB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fMfceL+o"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJdXU1767350
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 12:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/LKqjBcRNiuGtvZQhplHOiUwQdWdAXbYDnr76Hzm+RU=; b=UgyopRWBjVj+DPTX
	cAvb0wCnTHAOgC5V1wsNuga5eh6RC/LPvxokzQAOj0HeJoU4+2TvcnzLKuxg5xIf
	UwCRMRSWXsJ85N0yG1JVkuEq+dGnfjMnTAUCL8kA/+y53bbHV2Vy41ogesTnV94m
	d6/V5obm0f3H5tRMzTqZKJbaDSBA40Dx7XhqqykMBN5w77Un0dLraTWE2MxDmj9H
	9RXlbg5Rh2H6HNwKEUeHwHVkdOrYFKMwz3FvIv5gpcKdU/tdrKlEqme72OcP+9mZ
	b+lozg01MpOlWxlCJ4rK+YX31ekiSaVFWH3yfx6qVHJhhRcfNcJV7SZGN20WljVb
	nJjyng==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx377h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 12:33:55 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso3218265a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 05:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788266034; x=1788870834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/LKqjBcRNiuGtvZQhplHOiUwQdWdAXbYDnr76Hzm+RU=;
        b=fMfceL+oLKqeJj3mDYH6orSHUKOCB/0jm0YBZQN1bE/4uf2SSIf6ev7gurcgRJ/EkW
         mr9dzEOymhasduNhApgWvHWpkunN9C55u9Z0nA5QifY1JBmzHBLTqHIbEKusAWLACrUg
         +TS9AMbsDBKjhOMYvRuieuBkGu0zLo1jMvVX4XGSAgcNlBU+CDSu3SGIatlFMCsDIXL+
         4v1U3ly1SR3bXG1iqR+ulKpXc4MsxSALrwLBYJMkZ61c2DjWtkbUahgQ3JFJupNwhnTi
         tUCXKDQOBce8ptRhb5DeQIYKwM6xN9rKLRwE7qAM2bRyPXDF2IDDRIdyAzxUgR7Ewvcc
         X9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788266034; x=1788870834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/LKqjBcRNiuGtvZQhplHOiUwQdWdAXbYDnr76Hzm+RU=;
        b=I1gdCHWVtMblFgQiuPrq2cVr7wcNhW4xywIbw+kfrtBtisd/dhzT2S6dCeuse673QO
         1lD36+k+H6h9ZlxHG57or2o7RuQ61w2irJr9zZcLIxkwWTdbyixVoeBoe503JVzXwcvq
         sYGYFN8+UAIpwUGH0iG1wHUsyok2gLp/3efzfmqa52nHm4+T5lra79Y+1QJJoQkgyQAi
         wVd7UXe/EBh0mmsNQLt4aUfXuAoWkA+eWQBuHxhYOg+OvcJLxsIxAMBrq0evCzzm2In/
         uTuwUNF8lZ6PxXiJVOUgs2WpCr6klyGl71m244tHo1OYeq3fTaHokocyB6DDJGmXI1Pv
         /uDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRHkFKQTSzbwcZKDq4p6pb+wGiH8YnkWtCINyAYAdjcWBU0RbUk9xwDPPGUHISeDp8JV4iVoZN4+7KMU4Y@vger.kernel.org
X-Gm-Message-State: AFuF++kRby6PzJv3/40YV1ITq3fh284MMwKUEJxp87J27PEG37/XTNim
	fgk524qb7c+5mm252I4uK5X2esTuoQoJlw8eTGglUGvmKGChz3iKcBY4aH3wP1SW12+bORasiSd
	D/OsX+aAUQouVSEiMqf1zVP7owS3ry0hMjTiIKoIDGpWOY8LtoVFz9ugOjYIWzsEXQSyL
X-Gm-Gg: AYBFou2dXKBzJgyJO0BX9At1yahVTUdRA8bNSpJHmElydhCVhm0/mOaF3CV0SB0yUDU
	UiFO0G2Hi6jRBBkJDDfm9h6QprgUx9jicVf92ktet9d1dT4Qq+uyPKKyF2xkcvvpr2Qo2XfN9E5
	wmnADmCaIRptUv48ceLzrMLrPsHjD+SFvtBDMrhNThxHZYps8UUKX2ojmUuTivDsXZ5eiuAnJy1
	HwdZG6QzeBYcBBjwyZVC+8g5SHkXHFyyCuLtuiRZMItN7cUFV2Ret2AQyIIkL6juxr5ygXyUcwK
	BL+0hpW/wgd3+YV+hBIS66PUZfGsoNONdpUhEmAMsiCNHLyT1J+LwVzT6oIB8JrOAzUD908f0Mg
	xkcEIzdum+TdOzl+s1ATqwQVUyx3uvFBoiRSsU2Jo4XHM+h9ILLSsBez6fRwLOQQ7guDf
X-Received: by 2002:a17:90b:3c8f:b0:398:dc16:3c29 with SMTP id 98e67ed59e1d1-398dc16407dmr23761067a91.7.1788266034331;
        Tue, 01 Sep 2026 05:33:54 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8f:b0:398:dc16:3c29 with SMTP id 98e67ed59e1d1-398dc16407dmr23760956a91.7.1788266033862;
        Tue, 01 Sep 2026 05:33:53 -0700 (PDT)
Received: from [192.168.1.5] ([122.177.240.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d499811sm6791102a91.10.2026.09.01.05.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 05:33:53 -0700 (PDT)
Message-ID: <36ebf737-e462-4c53-b6a9-51d26d4acc35@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 18:03:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] phy: qcom: qmp-combo: Add USB3+DP PHY support for
 Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260901095055.42229-1-shengchao.guo@oss.qualcomm.com>
 <20260901095055.42229-5-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260901095055.42229-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a96c633 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=2sMs7eQfJahgYk7ien9XMw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=drxAI8maUB5UtpXgck8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExMSBTYWx0ZWRfX5s4VFR5zhWp0
 Y8jGCPoglz8VD+jsanNFQR939m49xPpPyFXRkfDl7TvMy/SxBq8nKwdg8Wr9A0vEsrEubhqrvtz
 g7W4BbcoebqeRlK/xAbZwItXTlHIfxw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExMSBTYWx0ZWRfX5lgD+WUYjFuj
 1Qa8fvC+ozXFEk9yWYPPt8UXzOxZi8Pp6ujn4c8b9qaLwBjLOQaWaFAlxOXfnJrqyJAb7An6xmv
 YkxZg4LmdAl4Euyr8KgsLxm9hZCf5bZ7Ha5EMeu08wmdOdryxXco3aUMai2wnDmPfM48V5elYrk
 dttH4G7Pgc6FhIZCQPFSKUrLYnWfx8dBJoFTptHDM+SmiNOmBXdaVlOfykFr05CgY2UVX5vnbQ4
 YlZYLWPDmcXqogkVKlXItYKJ+b5WiKdVAGAyHOqnVodfDVlCCu9jccD2bziF1avsfGtXe6G+hXX
 P1Sty5skIobj8kTgz1rJBGlnJXgLuiKBpaliPZXPsWl6xK1kAzFQtp7+TEZ+RPYNEZpf9CieVVS
 PFX8C6JpUiZj0HOKT3MfmNKU4x0Dn2omTI4JOf5eaJA2su4C+RASPmldRcVD3BUxkiwH0IiUtCj
 G1yjhB9r2xvFjmfdfpQ==
X-Proofpoint-GUID: OGG0d5QOpC1Jf9tD5uUx1sF1TOZ3ZHKb
X-Proofpoint-ORIG-GUID: OGG0d5QOpC1Jf9tD5uUx1sF1TOZ3ZHKb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010111



On 9/1/2026 3:20 PM, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Nord SoC provides two USB3+DP combo PHYs. Their initialisation sequences
> are identical to sm8550, but the sub-blocks are not laid out the same way:
> Nord adds a dedicated USB3_PCS_AON region at offset 0x1e00 and leaves
> everything else where sm8550 has it. None of the existing offsets tables
> describe that, so add a v6 table which is the v3 layout plus usb3_pcs_aon.
> 
> Populating usb3_pcs_aon changes where the driver drives the I/O clamp when
> entering and leaving autonomous mode: it now uses the real AON region
> rather than falling back to PCS_MISC, which is what platforms with no AON
> region do.
> 
> The offsets were confirmed against the Nord register map for both PHY
> instances, USB3_DP_PHY_0 at 0x088e1000 and USB3_DP_PHY_1 at 0x088e4000.
> USB3_PCS_AON_CLAMP_ENABLE sits at offset 0x00 of the AON region with a
> single CLAMP_EN_B bit, matching QPHY_V6_PCS_AON_CLAMP_ENABLE and CLAMP_EN.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 66 +++++++++++++++++++++++
>   1 file changed, 66 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index c39ced168d03..de82c7107c92 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -2690,6 +2690,23 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v5 = {
>   	.dp_dp_phy	= 0x2200,
>   };
>   
> +static const struct qmp_combo_offsets qmp_combo_offsets_v6 = {
> +	.com		= 0x0000,
> +	.txa		= 0x1200,
> +	.rxa		= 0x1400,
> +	.txb		= 0x1600,
> +	.rxb		= 0x1800,
> +	.usb3_serdes	= 0x1000,
> +	.usb3_pcs_misc	= 0x1a00,
> +	.usb3_pcs	= 0x1c00,
> +	.usb3_pcs_aon	= 0x1e00,
> +	.usb3_pcs_usb	= 0x1f00,
> +	.dp_serdes	= 0x2000,
> +	.dp_txa		= 0x2200,
> +	.dp_txb		= 0x2600,
> +	.dp_dp_phy	= 0x2a00,
> +};
> +
>   static const struct qmp_combo_offsets qmp_combo_offsets_v8 = {
>   	.com		= 0x0000,
>   	.txa		= 0x1400,
> @@ -3394,6 +3411,51 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
>   	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_refgen),
>   };
>   
> +static const struct qmp_phy_cfg nord_usb3dpphy_cfg = {
> +	.offsets		= &qmp_combo_offsets_v6,
> +
> +	.serdes_tbl		= sm8550_usb3_serdes_tbl,
> +	.serdes_tbl_num		= ARRAY_SIZE(sm8550_usb3_serdes_tbl),
> +	.tx_tbl			= sm8550_usb3_tx_tbl,
> +	.tx_tbl_num		= ARRAY_SIZE(sm8550_usb3_tx_tbl),

The values are different for the following registers:

       USB3_QSERDES_TXA_RCV_DETECT_LVL_2: SM8550=0x12, Nord=0x14
       USB3_QSERDES_TXB_RCV_DETECT_LVL_2: SM8550=0x12, Nord=0x14

We need to add new tx_tbl for Nord.

Regards,
Krishna,
