Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F5D3A0EB3
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787557834; cv=none; b=b7ILRwAMgSu9/pM7UTFmQaoLUV44TmAskx0gH2BnhmHZ1e8PXIBF7QYCtw1DwkePoNopGxGYvf928/m4FXP53C88Sl1EORx3+bWVjmadhjZ+iISbhXAyCoyGP8z0sHgal5gUU8f84sXageQ8DxUqWOyukjK1oZ2kCaVsAPi/V2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787557834; c=relaxed/simple;
	bh=dlKx7BZw80w8bByuZyGb0QNm2TK8P+icaTDQTmDlsI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7qDfTsGw24RY9xpx5FMPd4RxFctLgeUJL/fOmE0t4eELjNnR5kGQMmDySnwdeKgKCB1p96rbcbxqDy0UobUcSjq1bkjWLVambv70hJ6ST7J8LHbhzUJYTqPSwm/BZhi5jk4fudZLtLY4nRKXsKfBrebQsnUgS5CwYcjyFazCTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pi4kBKwZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gTcyLMaF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pi4kBKwZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gTcyLMaF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O7Q7SN2666596
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9HJ8w3GwKU3lFtzua7oGY3/Y
	FZTlUiCBe66lb5hQc+E=; b=Pi4kBKwZv+0DDj1vDL80B10QfAqAFdwXyk+h9BeI
	/ZO0kWes2gQwWAX6Z0h8q16zrNGYoJtujKO7xRQ84cI1z/BLjFBE1rJYZhd4U/6Y
	UnpnT06wBTxkxQFlgGQj97ds3/h7sLUUDwAnzDiotBr7EJ6sFOwlZ9JqsHmH4uxN
	SC1te349bWFJ8GuAxPPG3F7KNo2mnzY9QNPh2BMlT3AoQuAgjjnST6MTOqf7Mb9/
	HQhP/RTPemwqk0VC4ucoj9XeuwUlcmHIXaKtaBa1+ucda5qgLPR6yA2uNwz3drDF
	m8YWQe4NnqkOKwHrAXxqvZRahPNEeYhJAnc8vn/+jj3crw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgr333-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:50:29 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-744e806f474so422205137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 00:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787557829; x=1788162629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9HJ8w3GwKU3lFtzua7oGY3/YFZTlUiCBe66lb5hQc+E=;
        b=gTcyLMaFKiljHJJ7gpqmxsStupcS/IMIttmP1W4RfLQooXczsyU6MRSlDTpNYPzNmr
         FclyFclkTNq5gE334i49wVdxpWo3MNDZYt1RPaP+bQOtZZLml7KQ9y3VQA8D1grum+0e
         bI6y0SBVVRuSdmjWFw413Li42xABra3lH/J0VW+LzQVBBO0OPsGiOa5fzWQmMkuKOYOI
         YYaHd6KD+L0nrACkHCoa5iJqkpP3FdkTcPgnCfvWgnQ7ivxXC3EVoaqHVe3a2i/4YfMa
         5ZL51qI5fwLWq4x01CQSVfqsoPSKdudmHoGuKnVwGsw+/Ppavu3gLu9sGdszrDL7Z3/4
         wQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787557829; x=1788162629;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9HJ8w3GwKU3lFtzua7oGY3/YFZTlUiCBe66lb5hQc+E=;
        b=stN/Z2Z/RNKCf45CfFM6DdXrTdvi6/hHG6FCTrSE/20KWFYdfULrVABRoXWmwm6dHJ
         ErUrnUUug5pVTMjR4O04b7KkfAM/KO9aYpE2JauFzFqUCHuDZYyFS7T76YqQ9m2PPQ88
         l2mUgmTWYUibjLN4A3yaqE6P+j/TrK8nU15cbFaHIMa2O9PYXtOnf15+nN4xpDglEDg0
         2t81/LrrZVdNqeeERPKfnOfiAGfWJ1SjdYlYZIwTlKuqms5yrZhY/Mr6PEs9eAjWdmwy
         KhhwM8lR19Te7525ipepyYtX//p/XzwCQgA2FEGUnoQaCY4/b6JqlcnpcjYdi6DMvhsG
         RgSA==
X-Forwarded-Encrypted: i=1; AHgh+RoJRuS0T3cUdd47f0mmArATnr7H9/TcGISRaHRblKfJOsRQ2Gw6xmooL94JAs9tYnTkDMqR1ltpxzmBU5Vn@vger.kernel.org
X-Gm-Message-State: AFuF++nKI3wy6Lavg5FhhJSJ+TM0xTNkbbEbfh1KLecMgQfRwubB5utn
	bxNpBbm5rYS0P5u/VncutU5A5zYcBgo6kkiN9ltF92xCHNmP+tuOHmpSEJwHiYVC85mxkOBLM2f
	aYXe328Nogsxr+k3Ui9DDL6sYI8CMT5CP4QGmHJhr82d36ygjVk7I8NeHmYcHTAJ7qUSp
X-Gm-Gg: AR+sD13Y2HVC+GhnOLZbkZnmuJ6dmXuiT7HovSzgN0vm2uzb1XwsUU7zfiXKkXOTXS/
	qTfgyI3CHEOmY8HLd+bEvfIImSKM5dh+Xg6zzfszakxnkIhzGM/8RkA9trz4/2M8+w4dE2RSvZM
	ESVECIwCtNxWnn7tIgqwlvryVT4JOrP9ZPwE7ySVfI95KlzQ6NwjYRBP3872htoQPZNw+h3yiv3
	XSVLs+QLIPjnCXKZ8aV+tazwkCujhK6Oqf8pMGERn8WvqOlD6kTH/SBhn43/lcQEbi923giKuLS
	OAeH0EBAJqh0ThpRo+lrwxnoSp1mCM3FgLwXDNfuI+olaf2dvCoOiMorssv9RUPwb+Js2HxTehT
	KnWeufuIzdxaeO78=
X-Received: by 2002:a05:6102:4422:b0:737:783d:1916 with SMTP id ada2fe7eead31-77a64230d44mr7674493137.11.1787557828530;
        Mon, 24 Aug 2026 00:50:28 -0700 (PDT)
X-Received: by 2002:a05:6102:4422:b0:737:783d:1916 with SMTP id ada2fe7eead31-77a64230d44mr7674463137.11.1787557827958;
        Mon, 24 Aug 2026 00:50:27 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e1cdbe9sm7372364a12.24.2026.08.24.00.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:50:26 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:50:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
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
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 09/15] pinctrl: qcom: Add Kuno pinctrl driver
Message-ID: <7ywfd3hfzngejfprv5zkn65kci52q5tgiq5h3sccpz35ov5eq4@ow4edd5epaws>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-9-196e2b306368@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-kuno-soc-support-v3-9-196e2b306368@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2NyBTYWx0ZWRfX1tzNy8GR26yI
 ECfNyLYkYJfShR2cqD+6rknzxTjXX7ihtmsGDpkXEZb38MxF6XOL6HMsd+Bl3By/jaBVzX5fffb
 LLqGfacsFAAhOmxEmXluaj0SU8tERhY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2NyBTYWx0ZWRfXw9xU6L92PQEu
 zv48ukRXKGQXc8BJ8ti2GGJv/YgV6ZYKQjmdgV1As0X9mbtzLjBXDXKRKAwM7uGHw6bVL/W3T9q
 ncVI+TUkcZ4xoxOFCIGD8bKyu61zDapPR2VaF3op4IofoHJNQyYmyXotCyipq/i+9ZC21RXMbQx
 baupBLq9uWLQ6RpwTZRxYk4sgb3bbJ5Dg0v0COloIxIWCgUGng/NV1B7KTSW4nsveZWoXFr2AcW
 OnVWZw7NQhSl47HK24s/4s1sviElvI41eTwXtX1rUfo3RS/4RyI+FRzX1sbvApt+Qfkss/89qCA
 EpiNGbT3GE0OBU+ynqgkaADVMHBa6Cca9jqxmODiKR6jwOy1URw3bBAe3+Sr4A36jZ9vSp89mhY
 uMFtUgrblzb/nJejY4D752bB2Vc/svulU25vSpYP+zn2NygnDYbQKB1z4aI4wQKDBKnzyHdg2KY
 jH7lDH7wwX4K0bsfJKw==
X-Proofpoint-ORIG-GUID: 38Mz6Ipo0c7Bvx2_YXHb3Waw_LGCTqLB
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8bf7c5 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=gSngVhONzQuCJb9LWNIA:9 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 38Mz6Ipo0c7Bvx2_YXHb3Waw_LGCTqLB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240067

On 26-08-21 21:39:02, Hardeep Sharma wrote:
> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
> interface through the common pinctrl-msm driver.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm    |  11 +
>  drivers/pinctrl/qcom/Makefile       |   1 +
>  drivers/pinctrl/qcom/pinctrl-kuno.c | 801 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 813 insertions(+)
> 

[...]

> diff --git a/drivers/pinctrl/qcom/pinctrl-kuno.c b/drivers/pinctrl/qcom/pinctrl-kuno.c
> new file mode 100644
> index 000000000000..f3f8ec3e09de
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-kuno.c
> @@ -0,0 +1,801 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#include "pinctrl-msm.h"

[...]

> +
> +static const struct pinfunction kuno_functions[] = {
> +	MSM_GPIO_PIN_FUNCTION(gpio),
> +	MSM_PIN_FUNCTION(audio_ref_clk),
> +	MSM_PIN_FUNCTION(coex_uart),
> +	MSM_PIN_FUNCTION(ebi2_lcd_a),
> +	MSM_PIN_FUNCTION(ebi2_lcd_cs),
> +	MSM_PIN_FUNCTION(ebi2_lcd_reset),
> +	MSM_PIN_FUNCTION(ebi2_lcd_te),
> +	MSM_PIN_FUNCTION(emac_mdc),
> +	MSM_PIN_FUNCTION(emac_mdio),
> +	MSM_PIN_FUNCTION(emac_pps_in),
> +	MSM_PIN_FUNCTION(emac_ptp_aux),
> +	MSM_PIN_FUNCTION(emac_ptp_pps),
> +	MSM_PIN_FUNCTION(gcc_gp1_clk),
> +	MSM_PIN_FUNCTION(gcc_gp2_clk),
> +	MSM_PIN_FUNCTION(gcc_gp3_clk),
> +	MSM_PIN_FUNCTION(mi2s0_data0),
> +	MSM_PIN_FUNCTION(mi2s0_data1),
> +	MSM_PIN_FUNCTION(mi2s0_sck),
> +	MSM_PIN_FUNCTION(mi2s0_ws),
> +	MSM_PIN_FUNCTION(mi2s1_data0),
> +	MSM_PIN_FUNCTION(mi2s1_data1),
> +	MSM_PIN_FUNCTION(mi2s1_sck),
> +	MSM_PIN_FUNCTION(mi2s1_ws),
> +	MSM_PIN_FUNCTION(mi2s_mclk),
> +	MSM_PIN_FUNCTION(nav_gpio),
> +	MSM_PIN_FUNCTION(pci_e_rst),
> +	MSM_PIN_FUNCTION(pcie_clkreq_n),
> +	MSM_PIN_FUNCTION(pll_bist_sync),
> +	MSM_PIN_FUNCTION(pll_clk_aux),
> +	MSM_PIN_FUNCTION(qdss_cti_trig0),
> +	MSM_PIN_FUNCTION(qdss_cti_trig1),
> +	MSM_PIN_FUNCTION(qdss_cti_trig1_mire),
> +	MSM_PIN_FUNCTION(qdss_gpio_traceclk),
> +	MSM_PIN_FUNCTION(qdss_gpio_tracectl),
> +	MSM_PIN_FUNCTION(qup0_se0),
> +	MSM_PIN_FUNCTION(qup0_se1),
> +	MSM_PIN_FUNCTION(qup0_se2),
> +	MSM_PIN_FUNCTION(qup0_se3_mira),
> +	MSM_PIN_FUNCTION(qup0_se3_mirb),
> +	MSM_PIN_FUNCTION(qup0_se4),
> +	MSM_PIN_FUNCTION(sdc4_clk),
> +	MSM_PIN_FUNCTION(sdc4_cmd),
> +	MSM_PIN_FUNCTION(sdc4_data),
> +	MSM_PIN_FUNCTION(sdc4_tb_trig),
> +	MSM_PIN_FUNCTION(sgmii_phy_intr),
> +	MSM_PIN_FUNCTION(spmi_coex_clk),
> +	MSM_PIN_FUNCTION(spmi_coex_data),
> +	MSM_PIN_FUNCTION(spmi_vgi_hwevent),
> +	MSM_PIN_FUNCTION(uim1_clk),
> +	MSM_PIN_FUNCTION(uim1_data),
> +	MSM_PIN_FUNCTION(uim1_present),
> +	MSM_PIN_FUNCTION(uim1_reset),
> +	MSM_PIN_FUNCTION(usb2phy_ac_en),
> +};
> +
> +/* Every pin is maintained as a single group, and missing or non-existing pin
> + * would be maintained as dummy group to synchronize pin group index with
> + * pin descriptor registered with pinctrl core.
> + * Clients would not be able to request these dummy pin groups.
> + */
> +static const struct msm_pingroup kuno_groups[] = {
> +	[0] = PINGROUP(0, uim1_data, NA, NA, NA, NA, NA, NA, NA, NA),

We use underscores instead of NA here.

Please compare to the older SoCs in upstream.
