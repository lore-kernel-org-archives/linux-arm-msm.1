Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D773A3290C9
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 06:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791183340; cv=none; b=AJ/FmjtCFqQYRMJrtqwriMVW87cx4BI+wZAnQjLdSlp9xqy1MOijAG36i1ZWJDN6KEF76vrklo7unv+/eFSdYXF5PP0/n8uJ7x6swyucpu8t06KnN7wZ6zg2hzcp4EMfAuoPRKrqCVJM23BYY474np8mNUXGrKKr7I7clHLux7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791183340; c=relaxed/simple;
	bh=hyppn6ZS7iKrvhduyzUL5EMtorwbII9bi47RogEviWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NcINUcE2gNOi1vuvmT3miywtW7beWxvt0uO7ML8J4UWg1ZDwMHh0oPCVNPI7s+TiM0/i0/izVTkFZ5W88jQFj66IXsUs8GcAlT3/Z6142dCO/l1+ZKiOcwan13KFqG8/x8tQjrYCP6Ip715JqnYx5oPMzYse20oS/lXCvvtQQWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TGpQxz0r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fciFNvPO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TGpQxz0r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fciFNvPO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510YkH094002
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 06:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6A1bPSiOGgsHAdpCNaSmQ9ZG
	Nam6PZMqoQGyG8bRKdU=; b=TGpQxz0rp6HR3enX/zk6Qzg7H3YJcUVk7yONfn5i
	9VpXQNRsSLY6ois4sKf3qiTyJgArTDt1bN0c+UXh3bdNjN0sgaW79pSmF0Rh0InY
	okQukS8x6fwOM2PrPkGV83yQJ+jpo0IbAzNiYBWSjnuelP1eHlzzvZq5BlZFz5Sx
	k0Av9lzRIMuV3sUJzZOxhxWOcPYlTIS88n/FGK9lyFJi0SgcVW+XqSsug2Anuvlj
	I5+5UEBf/M8pn5L4NK6NfM9jh5tNgbQMwL+ZNZdESbI9cK1UIut3kmDs2rZeeZ4l
	2um8w60T3SpV+vbFZDXbOu69WnQJOWmEgGiaj4uMPwQ7Qw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssu4se8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 06:55:37 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf3a0a498fso1291593137.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 23:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791183337; x=1791788137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6A1bPSiOGgsHAdpCNaSmQ9ZGNam6PZMqoQGyG8bRKdU=;
        b=fciFNvPO+05eVIK6hUscamo160quGpMfP8kCxAZtk8E0uxdubvtOka4R9kYLXor+Bd
         NmqSODiMEQ6CK/GFE3RogmseAnDsjkDaym3v/8tGZhaUNog2PMeP+gL/K7Jn0/OlmjZL
         KVNXoFB9xa38NxKNGE04mbaplrpCSijyAlBpzc0efulueOqRdA7har8gB0yIqpvIZK4f
         AHt7hAd7HynyzHpy0mvhz3wKqX+QLHh2vh0AhFE1StlxhWFwUkMBoBsSDvMCm7JKNrx3
         eMz51uHShjfQzxqbalOL0fMx7RRu0XauPMTNLGcw8gZOytP/1J1Et56wCRzkaA/xUeZD
         JA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791183337; x=1791788137;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6A1bPSiOGgsHAdpCNaSmQ9ZGNam6PZMqoQGyG8bRKdU=;
        b=mCQkSc8yWarr0nQ1hG40lhu1xSBzUbMthdBpGYu0AMphU8COOo2/CGvL08B6V6itfP
         ZQZ2YikoV6MtDN/QpxxYtJM4kMoEQX0HXwiLRbUdaaRcBmRi9/yGtuPp1w/YWs0tHd0l
         s1q49ovYjOCJi06phweQLPMVW2y2F+CnXAhy4iPcfJbYf8bH5oA17ywI0rHtBS9lRpcL
         JHYvQo8w/bLRqxWzYAXNPU/s+0chaInFDRZF0ireZiT7bB/KRTVDjGN2ArlyQDr/uho3
         lhhMHs/LKvg/SuL1Kw8H2Uz7xAK2hU3ESPyF5P4/BIeaqpsJZwoDjPYdClbSFYc1Rb3w
         OkGA==
X-Forwarded-Encrypted: i=1; AKwUvBw9Ssn18mOPeUMcj76qqtvx2MNClXJLw+34MYnJ0BwtmtpMKFm+0LzyHXL5H6VDyEqi2U6sg2rzdIGE+BbP@vger.kernel.org
X-Gm-Message-State: AFq9FYJ52ERMCWIA7QBcjRsIIFCuh2sFmKN4Ix4DM/GC77PalRgWiY9y
	lKzPDGSHqvbMQT8jK2Y/XzkfPpJ+gpUL6ak0rrie4y7V6Zjz9v8OVs8iJP5TbPL/eyAr7RMLNDm
	ZRdY138fqoq3buqH+fbOkjJwUZNE3JruS3W4WDEro8loc65pdjhsgMvomPwG64flX3KHd
X-Gm-Gg: AYBFou1Ykt69PDJWKNGe6k587LvYVU7iJ1riEsMKJcPTKI2Ve923phknzzV1OFaTXip
	ATEZJZqv9petF+rkFdyWmxbGVSxBH1u+bvpLFXykT9PhxtWQU/4WilT8SjWf8VwTYZeOC8zTYFx
	2EVN48aBCnslznjwPd+PUrxGyU+raON6/nBv16zD6cJVwiINlYIotYt5WhOHUNWLlEFCyxqeoux
	VgJIfVbs/3qOjTaDCdm1mgOyTwb8dD9I90i7WSgeXRmtOiANe49IKgPkMAC7Mfmbr73YXEcY42W
	pwXExMMHpG/JThdb3j2p9SNIy3vI5p7oVYhWHp1m6zi7rjjPxMe/LqU1DROZeNAQ4UQu/Wob248
	lBMTULe+sWOZdC0+mzNJBfTxqnviJZbi9E9ayptKGyhPCxz8NuctLOwBRVIEWbLGzqG2/2m3mzo
	mH2KjclPhjraHK
X-Received: by 2002:a05:6102:5120:b0:79d:a035:b6e6 with SMTP id ada2fe7eead31-7c0f4689e8dmr1883071137.3.1791183337089;
        Sun, 04 Oct 2026 23:55:37 -0700 (PDT)
X-Received: by 2002:a05:6102:5120:b0:79d:a035:b6e6 with SMTP id ada2fe7eead31-7c0f4689e8dmr1883066137.3.1791183336654;
        Sun, 04 Oct 2026 23:55:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e33530bsm38036081fa.42.2026.10.04.23.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:55:35 -0700 (PDT)
Date: Mon, 5 Oct 2026 09:55:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm/panel: Add driver for Novatek NT37705 panel
Message-ID: <xuiobdqd236poxv2lieckjg7da3cpmczdf5owwxx2fl3hynhf5@rl5mmcyzzqk6>
References: <20260918-fp6-panel-v2-0-6695c4008920@fairphone.com>
 <20260918-fp6-panel-v2-2-6695c4008920@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-fp6-panel-v2-2-6695c4008920@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNyBTYWx0ZWRfX79Ve1NBANMRd
 pooUGW1OCqY6jN6cYCrRcFeyXJ/KFt0mgo4jHS1KQ0a/4C+gqacoE8H8tny1t0iotYgyITij7au
 GRponX/XRiCXF1sx9RTv0lrf7G3WQEDlJM/+B/9BSRSbdDwr/DWDQh5zH0/Q04+rSTKvHV575fz
 2/YD8/Q14PCLhngCs7K/wgeBSXpiJCLjAUjH4uXNoAEY4xHAqqtcvGXkXl3Dfzr37hlNWWB1Bz6
 bGhoFmo98B1rmnhXFjE0zDat8MtDvWLkpognORZbWff8Ggyl1W7yJdm/wA5AL0yuphMVPoyCyv9
 MDBGxru7ev6gQtietfRW4NL9GESb/5Xq5bOCCDDG34xCxoqDPw+ae3rkwh0qWWYbohn9C1qIMcm
 LLcltYPriYWvmVbIcUxpQkTQEErTILbPg4lY62xklbOtSCZOKp5Y36zNbdGLJRAoC23YML00zEH
 SPpwJHZq70i+PPSOZ1A==
X-Proofpoint-ORIG-GUID: UkkfG0oWVHoyeP9RzphzKtxTjTdyAH08
X-Proofpoint-GUID: UkkfG0oWVHoyeP9RzphzKtxTjTdyAH08
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNyBTYWx0ZWRfX5WMnkyUFalSP
 T2bkE0oQ7EInoj13+702ClEOIlpF1s1zrsO8PBBMoqVQxqLtdo4RNVAqQ4rlxVvDsPytVWLa7Ce
 CvrrlyLr69uF3gfiYy6ZbJ2BLuBwGVg=
X-Authority-Analysis: v=2.4 cv=XPSl2ghE c=1 sm=1 tr=0 ts=6ac349e9 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=6H0WHjuAAAAA:8
 a=o-EclO7zvcZZgozh8CsA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050027

On Fri, Sep 18, 2026 at 04:40:05PM +0200, Luca Weiss wrote:
> Add support for the 2484x1116 AMOLED panel from BOE (BJ631JHM-T71-D900)
> bundled with a NT37705 driver IC, as found on the Fairphone (Gen. 6)
> smartphone.
> 
> The panel can also be configured in 10-bit (RGB101010) mode, however
> currently it's configured in 8-bit (RGB888) since there's some issues in
> the Qualcomm DPU driver when driving this panel in 10-bit.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |  12 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-novatek-nt37705.c | 413 ++++++++++++++++++++++++++
>  3 files changed, 426 insertions(+)
> 
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x00);

MIPI_DCS_EXIT_SLEEP_MODE

> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x00);

MIPI_DCS_SET_DISPLAY_ON

> +	mipi_dsi_msleep(&dsi_ctx, 22);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int nt37705_off(struct nt37705_panel *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x00);

MIPI_DCS_SET_DISPLAY_OFF

> +	mipi_dsi_msleep(&dsi_ctx, 20);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x00);

MIPI_DCS_ENTER_SLEEP_MODE

> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	return dsi_ctx.accum_err;
> +}
> +

-- 
With best wishes
Dmitry
