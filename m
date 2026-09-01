Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257D437DE9B
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 07:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247284; cv=none; b=gcdluR6AS/5KCu37hBfNvMptELw2++A4r/SEAmIxdzeS1PxqofEgDRV/kzNOl5LL4ByvXbkbtvhDF6c1YlEWaCWmduoV9SFvTaMiMSi9RF6BNu5ai99hfNeWeVMIGS6iEK+LqJIDaFtjGJRQ7Ii592mGzrNyIpXUM1lxCdcF5Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247284; c=relaxed/simple;
	bh=QU0jsatRvUpSD2qAXK7xjuUZ4fa1ontKoCWpNceBOX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eyV96fqPrroU7N8/5Uh8OPBuXJvCn6icbEtyGkXHO4jTYMy05mAld3CosvDpExsGKZkHqTVL+yOxBb4kQpmmUXJIhFvMY2SKa/vTAtN0MKLPuldKZoweGG/xk9dgfsik3G8RAFcKMmRXG3fzEXmPsz9KdKKWciIf9rqC5+gm4hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNEIrAKm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmYC/o3n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KNEIrAKm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UmYC/o3n"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681797b41211433
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 07:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qbzlp9SMSko7PidhSJnkg6//
	wcnQvTw7pNx2Odv6V3k=; b=KNEIrAKmiYBgGr52uNJLFUYWgWwqDlXRi24zChWI
	EBvzX+j8awoDxJws0XU1e2ZcxXa+uXMSin3fJ1w0voMmz+z3Nku7k5kGhthXcxbJ
	gda+vuP9SH5W007u5Yrj0ETj8af/9F24S0d53Phy29v73UyZFFgGEq5f/3tFH+gd
	cJO28OIQJhEBVYSLasGWTHIApcAjiZpmRv06S2ouJUDdY1xUeTR0bgBx4R4odf4s
	DM8nYLKfFLHTNCM/btvuOakR47DM7CTV9gpshjaiAgJMBL6dVBJNg2/ZyRx656kS
	YmF3e24k3lz1OZ649olRmQnFG2cjH027ojQRiIsdIz4VYA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8s7js-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 07:21:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so125429185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 00:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788247279; x=1788852079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qbzlp9SMSko7PidhSJnkg6//wcnQvTw7pNx2Odv6V3k=;
        b=UmYC/o3n8XaUH0Dl1vLVctNECkgmsLCWeMAW6UX/KffwXyePs2jsWDfb2+WHjvnsF7
         J4+/lckuf+w3W9FVsjcv0NmUocZLjQukwGhGSHHQpRyQCbrHSdoT1fUn7FInLkExIO8z
         PPCjQ3qKhnlz/tV2okufmlQMHtbgxGUzd9jfHvbsKjSRX/vWQIY5RSuAuGNBGSopTR9E
         NnKNc97MUxRnVODjkal8z3K9fCbQbD/ssxx690AVrFmhZmNBTX1PgvLPOWMYQsMNb7ZR
         eXATFr5+34sjP7FHJA7tdL+cjB5LF7m/dvuVr14MxZ5jz1y4PzFLHiXRNsgOkTdDPkzL
         Z93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247279; x=1788852079;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbzlp9SMSko7PidhSJnkg6//wcnQvTw7pNx2Odv6V3k=;
        b=JPH8bQJ3zPw3lFJSL8D2urOuTvOB6BeZ+eTw3nDpjxiKGY0g3MvHazcVTKlF+Pt2Mt
         ZXt0eoVq66yKTFizAoF9Z0JY4m5clPNTEVplfCaXatakrqoQlJBXov5Q3wsTNhXCN8aw
         2kk3yW3CE9GKLuhmt68njbS7Z37L0rSkhv0VizDp81A/lhUzS5bS5KBtG+xT9UaKCQfU
         QlmSAoBdIDvJVYrAHcGYeoXN5cEpkS1G+xhbl9+p6i7yKgQUMhh/u0YmoqyfC9vwx2t1
         BEyMkM2M98rPNKl9dNonljmgkhCyTUXkye2E8kjsDYB7CzMmeopYgY4ZPcY1IPPZo8wM
         Nx/g==
X-Forwarded-Encrypted: i=1; AHgh+RpRJ2nR6iEPwvd1yD8pyxAXh7HYks1G2rV0CpIi+ePvpWE7pjtEMWSbPDq5xJs+TXFCS3DnnK2t1DEABxR9@vger.kernel.org
X-Gm-Message-State: AFuF++kkQnoclToN+Ux0WKk26F5jcT/el3uNXOy5WUjZqiVOxxq79CXk
	PPnv51aGcjk7q8d/DlmjpKQC+caYpdChe/TK0p5aA6rbXi1fVwUUG25kbj4tLqldL8M2anLcZIG
	fb2zC68I+G8F+MDBc4SPXzp3y/O0IUwc0q7WU4h7lGE6+iaLPh1gYWBENSWb9MnBH+lJ5
X-Gm-Gg: AR+sD1294n0Q2iaXJqIHxILpYQpJU2QO7INDWIvp+RXPZMrlcV11Ya2GOjuXbUgfee3
	gDlBN0ruJW12vMAmUyUOTI8uuMrvZAD5/1902x32n0MjAZw/tmrhmlRdnVfugp4laUxO5IakTNs
	X53koJB6G6B+CS1kk9/OkV2SXGDXdEA2lRpQnMJYXOyMHmuAl7mghS02XoQIa5sdNpJShkcqd4x
	RdinoKyZykEHsCBaUXFbRaK4EtJY3ss+rK6rbJrlYerW4C4d6phm3qX7wPMnGPCWreaXMMu1ZAb
	oCHeN/I3Ff0dF/xoraARLj+jNzo2jmS/r0K+agqlhTygzgktt6S2eE2fICH6hZKZbeviSWu9Eb4
	ZvhL3tgY9qvB6CF8=
X-Received: by 2002:a05:620a:84c7:b0:939:4bee:f84b with SMTP id af79cd13be357-9394beeff4dmr445367885a.9.1788247279143;
        Tue, 01 Sep 2026 00:21:19 -0700 (PDT)
X-Received: by 2002:a05:620a:84c7:b0:939:4bee:f84b with SMTP id af79cd13be357-9394beeff4dmr445361285a.9.1788247278504;
        Tue, 01 Sep 2026 00:21:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce0b401sm45924505e9.3.2026.09.01.00.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:21:17 -0700 (PDT)
Date: Tue, 1 Sep 2026 10:21:14 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
        konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org,
        radu@rendec.net, taniya.das@oss.qualcomm.com, danila@mainlining.org,
        davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com,
        linux@gurudas.dev, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v8 04/12] clk: qcom: Add Global Clock Controller (GCC)
 driver for SM7250
Message-ID: <fyzo7furxfsreajgefuimfdpkkulxvwxf76plc5o6kjv7bgdym@2pah3t7yfiw7>
References: <20260901070717.20513-1-sreeshankar0910@gmail.com>
 <20260901070717.20513-5-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901070717.20513-5-sreeshankar0910@gmail.com>
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a967cf0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=7xdfmJvTUVrkudBNT9YA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NCBTYWx0ZWRfX6FBpiQLW8MtU
 trs9pkBARm7FDKrV3KEC12sBXeLqhmQ5VvNFseuLdE84X2i+FjliLUKb6DWGT446R9kV89kPSSw
 3yEH47iFgzXeRC6HZ7cKBgDF3jutWw7O0Mfb0IFfrG4kGM0++CSbMDnIjNuRL1dwJhTm6BeGSoY
 UoZm3yTNVis0U7r+rGUQ7DtwAesTlhTeNKZBC0d4Y8XWm0wEOzRcVeYazlLRwCkzQiS1Jpty/uG
 tp3XIIzi1sFL391XqPZ3LGvzMA3EkHrxYNGCeKtqOm3XK7DL2JkREdRZfuJGp+TXkkm0KGQLqCb
 4tt6gCfd45Qp5O/oPzQ3rtE4z5F34F/LGiBWI5RNQbclEieeUp5uhjt+CRWZ6+Gvu+ihiSCkTX2
 gRxionndH89JSYGzSF5JlzzAxPooZ/3mSpI+hSX0qsmHC0So7DnkaXp4BF4sirl318hjjM/epcq
 HwkkCNgeiT0PiQEibzw==
X-Proofpoint-ORIG-GUID: 36dIPzQfDXiK_tPJ6E8TjrUo4r9y6zpn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NCBTYWx0ZWRfX1v9vWF+0lJH3
 AeFqLSYT4udI02Os85iCBFz3DdUqAinrO+7NKKpMeHCGWZr66qlVkFQ3Nj91aYnEBpzNMchziQd
 wwYMmjXPmbT5bnm9zi//ju9KrkYKO2s=
X-Proofpoint-GUID: 36dIPzQfDXiK_tPJ6E8TjrUo4r9y6zpn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010064

On 26-09-01 07:07:09, Sreeshankar K wrote:
> Add support for the global clock controller found on SM7250
> based devices.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> ---
>  drivers/clk/qcom/Kconfig      |    9 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/gcc-sm7250.c | 2275 +++++++++++++++++++++++++++++++++
>  3 files changed, 2285 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-sm7250.c
> 

[...]

> diff --git a/drivers/clk/qcom/gcc-sm7250.c b/drivers/clk/qcom/gcc-sm7250.c
> new file mode 100644
> index 000000000..0d548fe4a
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-sm7250.c
> @@ -0,0 +1,2275 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2026, Sreeshankar K <sreeshankar0910@gmail.com>
> + */

[...]

> +
> +static struct clk_alpha_pll gpll0 = {
> +	.offset = 0x0,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> +	.clkr = {
> +		.enable_reg = 0x52010,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){

const

I think I already mentioned this for v4.

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
> +static const struct clk_div_table post_div_table_gpll0_out_even[] = {
> +	{ 0x1, 2 },
> +	{ }
> +};
> +
> +static struct clk_alpha_pll_postdiv gpll0_out_even = {
> +	.offset = 0x0,
> +	.post_div_shift = 8,
> +	.post_div_table = post_div_table_gpll0_out_even,
> +	.num_post_div = ARRAY_SIZE(post_div_table_gpll0_out_even),
> +	.width = 4,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> +	.clkr.hw.init = &(struct clk_init_data){

Same here and everywhere else.

> +		.name = "gpll0_out_even",
> +		.parent_hws = (const struct clk_hw*[]){
> +			&gpll0.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.ops = &clk_alpha_pll_postdiv_lucid_ops,
> +	},
> +};

[...]
