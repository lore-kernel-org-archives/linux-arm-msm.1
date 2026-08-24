Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E166C42E8F6
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787579467; cv=none; b=aa6zK6UX8fjNY6w6KvJRWeOPcZ0e1+RO+7lsvQu3e8WyjgklD8UeQKwAwhmSc6ahG8QDWdO8/S7JnopE0MeFf2yr69VQ7WaHIahYeE4yyuWZo88GZbo31WgOKvc/LBP0Dq/j6ip2qEzhiGTYXFqG+eSQhoDbV2lRLeHuKmJsGzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787579467; c=relaxed/simple;
	bh=0yljH0aVz/r4eBwqu9hC+iXHJEmlFQIrNrbxgGtz4Mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ib7attnwgEau+DnH0qfparkxcb086FZwsWk3Rdd61Yl7TJon1TQERUwHKMTBSCgQC8hJfHpfBmDOdf4M8H8jN13e6IUxkiu+gjw3v0Ao3yXFDkx1LwdZXm/838eFsO8kMtObTrWIl34ln/fHrZYQivmmprIj9lk28i/UxRKxHyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGIfGZjm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KB7iokSW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGIfGZjm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KB7iokSW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCv53Q2006635
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P933sj/R9/lngFoiKY5nO+tX
	09j8AxPBJ7WGQH/Z4O4=; b=OGIfGZjmHQNutyx/mP8rqbt05aaoBOJl0EcTQE7v
	fS8aTG7CNiJpOaRCbsRVFvo+4j83tyrm8r4XSU3PVB9f7HcsXyTsEvhsQAsdvKZa
	LK2WSdny5HkIq2aTcgw6Heh4bBApemv0j0zMR4YxPS9i/fxpQ9tWhWrOxWWZXerJ
	h0zH5C2Hq6qEWc2qRmZOA72yeyq5L4e1Ic0NK61E+i88dFUrAt9iiMHhUpQ+/7uw
	AnKY/q3RVFxNKpXL1vutgWjQ62FGwsSe0jDBFkkwBUxwyOFHynmZ5M4CAgklA+m3
	yUP80fgsjEGKsxhP/OL2V33UKGk2YPJKKnjqHkLUuratKA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kv78vtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:51:05 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-75116a48926so2860127137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787579464; x=1788184264; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P933sj/R9/lngFoiKY5nO+tX09j8AxPBJ7WGQH/Z4O4=;
        b=KB7iokSWsXcPRNcwI3jBsDxeVXK8I9Nov9OUK/0IZ7/F510MWIXV7dMDQ3LqSiILus
         6jDVa6+gQn4osHGKzHWynqrWaP+Jcn5Nn2cQMMbgOmHesgtZVr/QDb7BkHOnY+2WG0NR
         hiqNBfumXeeQLLHdLma0wBXsVtPd1IEp7pdRfwT53bFwQrM3MsEBj61gMmcxsn59uc4S
         fGLDvwiP9afxpO92+IlKg8xys9s/spBdBV310dYtNtq99yio82rIIWAwRyHTBgV1fFOR
         m4a3yizh57CazlgNnit7bwL+dDn2x+/hPGjnZplYL+UPzE02a6Ntn7qRrQh47W4LP+3M
         sO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787579464; x=1788184264;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P933sj/R9/lngFoiKY5nO+tX09j8AxPBJ7WGQH/Z4O4=;
        b=cvMpzA6HCUBG5qE1OUp+JHxSBCcsiAXKzfgmdVRDg0YzlPmWerka+m0Q1NMMZt37/W
         XelgKgVeJe5wKxnmZSU87pZBXYdAPtju1+sqSHWPQW5hf7oxv+/K6Ntj67NWYJPjLXuG
         fdvia2VyhMlc1Um5jg3wd2VrMoIogKquZghYNGFJEzuTonFNwsQDLO7EcVqyHY3nmrki
         41t9MKg/ven5sOKqk5l9/lMMDgXH3e2T4FtyWl7Wzzz0U6zF1s/BO+GvvlvpmS1EMfOZ
         9jfMzk8k+SL8bQG5hmjjZofqWXbUtUONr8FjK+xcfJPK0/yK+mVVJYNQkcQlWYXC6BMq
         sm0w==
X-Forwarded-Encrypted: i=1; AHgh+Rou5P8Hl1UCP6jOza/N6w7xZUwos1nqrMthDySJWY7S8ar9j7ZPK5q+NbReYYDjc6/mJ4/CDkFt6zUy3omx@vger.kernel.org
X-Gm-Message-State: AFuF++kpHGm+VCu/mgHUwB1qkIGa3n545lbI0rpPlXWmVO1gtq+1Qn4W
	ETzWBqvlbxLsOCzsLrwPzXMGpG4XU4CwMcz6Ikz30Fusk7mBJc6ENoJ4LF5kZXv1pEAVJ/XtnBb
	a3sg7kqBNQRlJc7KyflJS9dZVBFGFM+EIdr5dI2tFGMAUXtEZ+jKZhDVVGNDex7cVrlDR
X-Gm-Gg: AR+sD13+8wpFGIVSzQkgbU6HCmq993+MFYjObaI3v3yZLHjrJL67f6q2kQkCngRaWpK
	XFw8q0n+iVQSXBN5+O/9sPwsvkQKfOZLTEPhgGSku7BrmdsRxIyapNCgS9HhvVP0rfhiWDiV9Ru
	cJ3fdpBK1zR00kygqWrzv8seoqWYGRhBXdKlEV5eFIzN1eXalGNE+2lWExthhFbLVyQvBYvy1bI
	/39wDIbsh/QvGXUyJTB47XquzuLBpzM337C7qHFp4PC/fBOMYA/61G3XzPsw0Dq2UvcBOiq2U4z
	PUm+uPLQf/O7akPMwyKHfYbakEx4Lz1PQb0OyhaSW8hwfgsqMakpFs3N0VR+hjXpa3pE6N/8EpD
	umBnAbhmNMIb25nc=
X-Received: by 2002:a05:6102:5488:b0:77f:539a:ba0b with SMTP id ada2fe7eead31-77f539aecd9mr803657137.8.1787579464007;
        Mon, 24 Aug 2026 06:51:04 -0700 (PDT)
X-Received: by 2002:a05:6102:5488:b0:77f:539a:ba0b with SMTP id ada2fe7eead31-77f539aecd9mr803627137.8.1787579463387;
        Mon, 24 Aug 2026 06:51:03 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59dd550bcsm9563073a12.0.2026.08.24.06.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:51:01 -0700 (PDT)
Date: Mon, 24 Aug 2026 16:50:58 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, konradybcio@kernel.org,
        tglx@kernel.org, ulfh@kernel.org, bmasney@redhat.com, radu@rendec.net,
        lpieralisi@kernel.org, taniya.das@oss.qualcomm.com,
        danila@mainlining.org, davidwronek@gmail.com, mani@kernel.org,
        robimarko@gmail.com, linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 04/13] clk: qcom: Add Global Clock Controller (GCC)
 driver for SM7250
Message-ID: <5ybg37jlklgrkxseu24xytbom3v3rnzbwpudg7jftr6g3oqvo5@x4sfjci7v7m3>
References: <20260824130437.2771-1-sreeshankar0910@gmail.com>
 <20260824130437.2771-5-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824130437.2771-5-sreeshankar0910@gmail.com>
X-Authority-Analysis: v=2.4 cv=Cfg4Irrl c=1 sm=1 tr=0 ts=6a8c4c49 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=WOPXDmdO3qaVRrrDsJIA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExNiBTYWx0ZWRfXxjGT0hO24qY5
 wY4KRxhoAd3gQoMmq5CBD1zqSUaKBlw3uCfRSnjzou08ok6Qn6eZZhlDr1pXF8iCCgFppm0+nQU
 FCyJXrWm3+6GLR1JPzQsFGQVkqGsnKQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExNiBTYWx0ZWRfXyk41WRaSjqVZ
 08QTE61p96fDRI73T/VaUsyNvFhHuXR25VCayspO3yY34l48iQiVzt/qjB9CrPmWR2cMXCUHpC4
 RhgvYocMDxERWhByXIVdHL87POK00SC3Sq9O9jU2pv1w6YDNIiKr/IYP9G0HglVurBq/ue6yW1a
 6wia3qVtRNwXucGcSV9B3XsRilfgoYBhgtfa09gaiclIRagvXoFq5pTGzEko9sr6bEbgB4Lhahr
 zOmh5Cd26boIu5l0jbJmCwsCXcuEzlGtKmzpMLG6gg3cg6UQ9WQvqD41S8WE0nKiXMctcyphPgi
 D5qZ5YoDPE2vcAYAsHmf11kAKhHzI7KBLQRjJXXlrD9L/72Ful+ML4+/sIsz5i8VH913ZIQTCK3
 QpdaMCn0Oads6tkuguBR1RM4Cs5m+dTwGkEB97Gq+NmVC+4hCKOVagLORX0khPKejy3O8S9i6b6
 z0I4Kj6x7VmYv4SCTMg==
X-Proofpoint-ORIG-GUID: YgpBQqlhXT5bC5A7w1FkSB5MhlQ-NFe0
X-Proofpoint-GUID: YgpBQqlhXT5bC5A7w1FkSB5MhlQ-NFe0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240116

On 26-08-24 13:04:28, Sreeshankar K wrote:
> Add support for the global clock controller found on SM7250
> based devices. This should allow most non-multimedia device
> drivers to probe and control their clocks.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> ---
>  drivers/clk/qcom/Kconfig      |    9 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/gcc-sm7250.c | 2275 +++++++++++++++++++++++++++++++++
>  3 files changed, 2285 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-sm7250.c

[...]

> diff --git a/drivers/clk/qcom/gcc-sm7250.c b/drivers/clk/qcom/gcc-sm7250.c
> new file mode 100644
> index 000000000..bf75c8ec1
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-sm7250.c
> @@ -0,0 +1,2275 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2026, Sreeshankar K <sreeshankar0910@gmail.com>
> + */
> +
> +

[...]

> +static struct clk_alpha_pll gpll0 = {
> +	.offset = 0x0,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> +	.clkr = {
> +		.enable_reg = 0x52010,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){

You missed my other comment from v4.

const here and everywhere else.

It is always a good practice to compare to other (older) drivers from
upstream.

> +			.name = "gpll0",
> +			.parent_data = &(const struct clk_parent_data){
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_fixed_lucid_ops,
> +		},
> +	},
> +};
> +

[...]
