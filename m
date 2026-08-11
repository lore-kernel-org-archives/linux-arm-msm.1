Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6642D2EB874
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 01:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786410429; cv=none; b=EJz7v2Wi7jS4ayP9wT8g9aX6QK2kfFg+rng1a7DIYeY3FE632u1lCIcccm/pRwS6byZjMeNQjVyQQ/eON8q+zEAyCtMGOBzURljIigKuV1UHWttcrogEmlUdJPGYunhJ4SC4ldexSLI5dEYnumFkuHxQrDD2SDF3+/ruQ/62Wh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786410429; c=relaxed/simple;
	bh=0a7KrwckELD0BSsVz1sZpospsBXzH5+wJ3BdAHmVwqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FYShAsBoxfTegMDIsASi7XRH4R+kEmJUWstqGkGVh8RiEJYl8LVICLPC1OzdVxif/M4IGzJUA9tqmY/VVi73vIgxlxo/sY5cEG57HgwQ+eFp2v77Rq03jyt4/eAZa+XvYI6+DgLuqM4AQWMP2F8wnzvAZh1NhQgZ/J4mCKncgqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jxza7oXM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BTTuZcHR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jxza7oXM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BTTuZcHR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMqKd13010200
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 01:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LKWM64w9B/428ZZASotTcAv1
	uE/KA59H6TXr868LmeA=; b=Jxza7oXMVn41cVQ2wPrP6IG7+Jprdl5vaVU5gRkS
	oAuW0QFGmJ/vSh0jMw9FVQtlciDTIzMa0oILUlC7rcG0AjDtynG8RF0bbfnUq6Tu
	7bQ1Rg2NrAxsVomj1YkifV8eGFk9OWoHtm3r7oBmcr1mSsSuOeJvzGLdUbGqwyfC
	45F0FL7tSET3vpxmGwrKEhfCN7E9S687OS9cvMsafC4bF0ydMpasYX+vX02geDn6
	N91xnz7b6R+3X+hl262fLHmb8D36bgNFixHCmFePrhbE7u5nqdCGhiq55e8xLla+
	LX+DV4CUkFPuE+oaFhNIPjH9OPmra0SQKd7Iif4q7P1NZg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjjthqn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 01:07:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d7886cdso48246861cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 18:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786410426; x=1787015226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LKWM64w9B/428ZZASotTcAv1uE/KA59H6TXr868LmeA=;
        b=BTTuZcHRdPXmKfLxEzf4nZ2RE57A6dYpnGtWfk9d09MMKtKuIZITtiATjyfhXaXwTa
         d2yjCxeCUOZnpMo30tpaYXKfvg03C1haY05ivKzMT3UHR6/eG/Ii1cQl3AwmD9IRUVv8
         pLiBEgNAITM5tTnvXs84GUYHGY/QHIMjl4VeihxHUlRIc5YLEKPoQfHLaMNsQh/lrNEu
         nnoAN0hW5Z0kc3TGzizYGEq++q/v0tCbfnmlUChH40UISGIrQDP0nscy+FiQs8iPvVXc
         utLjbH51L4r7/ori+/s3r2oERztW+qAd146FiGYT0WOlnFawkYAIS9+oSrrRedhjvUBe
         RcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786410426; x=1787015226;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LKWM64w9B/428ZZASotTcAv1uE/KA59H6TXr868LmeA=;
        b=qLXPE8cD+Y9VWfWX6fK71tMVVpF8QZRZff7shl4+4na3l0A18nIDtF7KNlALTLAO7L
         lliLTHCgFKj/VL0LEdgakZLzLqNUXzpfvorO2IlGyUCwg39J2zGiFGKLIx92P0L/t3R3
         UE++TVAsEco1kvTw82iui5pKW4t8ovaoDeAmWqHISWvfObVEt7YpRpfxyd8z9isRb5n/
         16Z/ASO1+nJ3zl3HbWS90GscWSF836uICKIwOm0lSOIqicGXJrpJzbLdZ+XHuOgiczvk
         x56LhsgOtFcgaGoOUFDxsF66kLbzHEeWv3+Eiuylh9PdLZWX78ispovscg3EOy1xuDRv
         T5qg==
X-Forwarded-Encrypted: i=1; AHgh+Rog9kjeQGTDc5YhBAiXWZz0UHnuRXNfZFo+JZHDYVQkkD8Cg3ykcghTytePycRM2navwnYB7Tn5xhHBAfs8@vger.kernel.org
X-Gm-Message-State: AOJu0YxvEsm6QgbAH4sb0CHfJNlogJNwCV1toV+eObg0Bvstt8MN/RqH
	x/SSxQc2nGg5aOvYZfhS7y0bNOebCQDz6zMIfKuxHmeWxYbSnypzjkZHKF14qg+HwLWblo3FZFt
	k627oC98oNHYbHdF/NHfvfOgcUzxEi6oCb0Nucfj5JcaKkhiwhELTDNqEfFKOyk5l8npE
X-Gm-Gg: AR+sD11u2FH2gmZN4VwnuqY415QNjkoZkVWv4eJTutOZk+eX0r3+n3GJwD6vyoVE4IB
	KjyU1ft5iJDzd4+FBWA+nlM50vN1bKRXGsSsEgOJAIOweOtTew2hsPuGD/Rko8zmvF6Lok3hno7
	ia63UzyX3rOm6zBaVadQwXCI/8+dWujKuS1fOToBPvTR0kCn9mjBub+xbOBpIxb2alXGC5kxzWj
	h/a3AUdlQ3O5dptcz7q8a1CAKIiNzKlB98DRIwDrf4hstUPw346g/G2O6+3kVtOGG5UJ6WWitjb
	02RSWGuQIk91wqfHpGFWWmzyUtAPv3LRShmjBtOY/cMw06P7bGkVAsJQvHwKHKT7PWKkaaQVgiy
	XfjRfCHPqO1Vsl/VSrWQeQUk7mvR0Kew4QaN6l7mUQbxVLgax3JOU6Ap/sNR5py8toJaZ/dK5es
	aLNDUiDz2SjK1jAA==
X-Received: by 2002:ac8:5c84:0:b0:51a:8bc9:2915 with SMTP id d75a77b69052e-52d4bb52da7mr76245111cf.8.1786410425705;
        Mon, 10 Aug 2026 18:07:05 -0700 (PDT)
X-Received: by 2002:ac8:5c84:0:b0:51a:8bc9:2915 with SMTP id d75a77b69052e-52d4bb52da7mr76244441cf.8.1786410425284;
        Mon, 10 Aug 2026 18:07:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fdda80e00sm26841741fa.9.2026.08.10.18.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 18:07:02 -0700 (PDT)
Date: Tue, 11 Aug 2026 04:06:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 11/15] clk: qcom: Add Global Clock Controller driver for
 Kuno
Message-ID: <h3mptj7zar6lev6qqsuz6q4gqkywu5djadjglzsjztzqystabz@555y7a4xd6ux>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-11-5e0ede4a0c72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809-kuno-soc-support-v1-11-5e0ede4a0c72@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDAwNyBTYWx0ZWRfX2c0GtWNvfaLZ
 9OZvqvzdYjDp5C8GUEsLwli5mZfc9pf7YDYALUXQKHz/LFXgV0RnJwFXxYN2THtRt/PYE3Oj2pX
 qWV/yMHbaN4q2Xz+kKph3woRlgBUOUE/x2j+X6Y20FVN6MB5VXbBk5Fyu9xe9y6XEzKeDayX3oc
 b6UkUPr8fpPrxpPGz6gCJ+gAgc8Sp+slSoEI4iMZyMFxQjJm5xTNAUvdQAyOLA4Ci0saqGyEKPS
 5WbtgP8DELiCAXXD3PT+yqUmLK2blAQvSs9In7bT8gZBvqkgtljwA8LoIKKq0Tcmu+IBfc67PyJ
 NwIhggHoCMnq3b3/NTuOTsL90+IYh/y9XVaCuOTvdKIb1xWK8Q4WaKTDZQnIcUED5fEQ2eW3JOv
 qWyzIjf0Z/uUfSt0ru+TQbjdP/TZMwsAQaVuHAbxT4x3I5ZpCSqI/L6o4Q0e5puh5zFmh2a1Vvh
 /EuVxlchVZygABN70Ng==
X-Proofpoint-ORIG-GUID: OFl6-UDh7CkPxOKVAIP4DPGTzwOsyk_u
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDAwNyBTYWx0ZWRfX5Kb7pOKU+l4l
 tzwEuXpRzBdkdqe2isfcjFg2JBkGC8US/GDXFHyKqGtRJMETVS/Oi7/IZmAoHrLR8JngSaIF+RV
 H3t2RTDVPpcSu+8Dtwag5LJszcUeN5M=
X-Proofpoint-GUID: OFl6-UDh7CkPxOKVAIP4DPGTzwOsyk_u
X-Authority-Analysis: v=2.4 cv=JsHBas4C c=1 sm=1 tr=0 ts=6a7a75ba cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=AtW9uK5K-k73WlJJaeAA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110007

On Sun, Aug 09, 2026 at 12:57:10PM +0530, Hardeep Sharma wrote:
> Add the global clock controller (GCC) driver for the Qualcomm Kuno SoC,
> providing the PLLs, root clock generators, gate/branch clocks and resets
> used by the peripheral devices such as UART, SPI, I2C, USB, SD, PCIe and
> Ethernet.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig    |   10 +
>  drivers/clk/qcom/Makefile   |    1 +
>  drivers/clk/qcom/gcc-kuno.c | 1438 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 1449 insertions(+)
> 
> +static struct clk_alpha_pll gpll0 = {
> +	.offset = 0x0,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
> +	.clkr = {
> +		.enable_reg = 0x7d000,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data){
> +			.name = "gpll0",
> +			.parent_data = &(const struct clk_parent_data){

Whitespace between ) and { (through all the file).

> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_fixed_lucid_evo_ops,
> +		},
> +	},
> +};
> +
-- 
With best wishes
Dmitry
