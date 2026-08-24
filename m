Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD2E372B2F
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787565144; cv=none; b=LaNIBPUeDGpB+vyqn7ZgubGSVj0KMT6MNL8QkHIbcrSqLv9ZsxXQGFM5cdqYxaZY4w4yi33fJVOpATzNs01RfVLFoI3i8aaVJebZfCeUX7nf+Km0QMNa8Mo3rGN+jalI+KwUYL42cLF6Ks/QLXIGy7pRzi1Cn902ExFw+VIldG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787565144; c=relaxed/simple;
	bh=G8YOmgtsM1pHai5T07GQVnDJ+gTFpM/SG9Zj/zKar2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X99eFXaDRMBRsndwthK9VyL2lMhwjI99u8n08WuVNEfGX3wG2UnHdKYToaqHNO0zcMTCmTh16L8IWL2lliCPyy7vNPkfLf4mqCuBy2Vwm3xdN4paLLaHw/+jCcmqaW4E3c1WCMCjirGCSVTraoAmXZjs2JVWjvqHwHxA9anVpf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PtR0TXhA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RuyY4dc9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PtR0TXhA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RuyY4dc9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O99J1P2900954
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yvBF0M61sE+RigWcAb/VlCXIeSNo1IdZb6Fbk2p5FtQ=; b=PtR0TXhAZ6K93Tog
	ivCcS8+LJMweBlf3yJRlZFvonQrbFey0XwijPEijPQZ20fyljIgMdnaHQcaMKb2R
	X6ZCgYfS5xBArOssK4Huh+RAx6oL45STO+/XA8+PoxYoeKTK3NUNoFtZ9vZNR1sp
	09mNr5/va76xmuJ1+OrIUQ4eoujC7Xhd2ByTefL8mN4oZ8t4PEitSh6C5dVXKpn1
	1lRZQkhcFM4nIlFEfpIIlig5kei1rr+QX38gRnejam1hQne0mGLOvOneka11sbVq
	wkCCQZ/GSlmRoQwybWFhaDVSS4a1AzH6ofQ/mviIZrHL3kLh6Yby5+OULF3yukuQ
	WYuMpQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgrnq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:52:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39533bb224cso3990507a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 02:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787565139; x=1788169939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yvBF0M61sE+RigWcAb/VlCXIeSNo1IdZb6Fbk2p5FtQ=;
        b=RuyY4dc91J2cPXq50zLtRfBiheiRg7cTYPGQXPLSRxSjCmciwAt6AKy7z66nyAtaRW
         LXaS9A0C+CtNVp+Ma27YJJxAO3LSeCE/bRq1/F4we4We4f8UAdGf2s1TRUbIIi0T7ajg
         m9YEj7WFssWK1xpJsRn7T950Hjw83S7dODzA5gZmuzzQl0VYyxBth4SFkRGxiwX/VXWX
         NLKGPK9WCpL9C7D+bP0LCD+MbMTlDUfZrqQa28X8kGOzP7h0SCB1wLuWtaIdk0pwg9FW
         QoqxMyQmUlF5u5UUzsKRqLda3o6XUiSdlVNfSE5S42MOjow7jSh8r5awbsK1N3E1PrLA
         6ygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787565139; x=1788169939;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yvBF0M61sE+RigWcAb/VlCXIeSNo1IdZb6Fbk2p5FtQ=;
        b=CUov0qNKplPK1H6qr+ateFlW7BfhiGDNe/QpPK+tRupPEprnQezZA0hKE9EY00/np/
         IZzCfC+7ZQoh1ssgjR3RyisWcW73v3xn0lX+NdKl2uAH7ZR1FegkGyO8ZxK61MIlTe2v
         400++u/tAfaazGeSoSmXZTp84pBkgysAkcJwU2XMpmpySH1zzEahSkF/UbeyfmYYIkxT
         cHfIg5N7EUiMJw5qTjQN0ZrFYjnzLcUWvr7iuJJVtti6DuVQsDzwZ3WrVUOSXraWRy8O
         PTm0Y+JJoxKSc+e08JVKka2hhK3DrDTnirRDL2HqH12dr4M4KWR5GB+QrauTE+30PfP1
         aoEw==
X-Gm-Message-State: AFuF++mv6yYTtbf5zSAR5xAs9xioEvyAJk5MqH9guIgUzPNGGEIpIxFk
	Vm/1oQD4bQrvPizDbLwAnjYdHWjpLLuLpuoifPHtBQZcKr8a9jN6R9P/lRW3bZuadcb2AjFmSR3
	49RRzI1o6It1LuN0AjfzfiuUVXQ6bpjXqHj2vSRkmb0We9vvQjpAdUss4kaDxjSM6jWxT
X-Gm-Gg: AR+sD13ZvZ/W4o7xGd+tJYJo1aRJlFQJwZn3ndvUyuiNAqA6xZ+usyoL95t0FbZQ8sN
	pora5wJsnaYMxUPXm+abDB2zbqMkUszMaIVolpYyG9St6fWK74zHeHMxV5Rgu4hcxxOWGo2v2HP
	CyqI3QYQcJ0zC2qKkaDtzEbhSJwa/wvqAGWf57S5/Q+gKnXnkAC0xgiFFF+OcWhknAyxSjSxrCX
	8wdh2GTE9tKW/S9rPka2P6low02CrplycRQRl1kdkBg4pBNDIvZHj/bRrhwLf7HyYjpvxjP+qC0
	E+EVWskfsrPEhLRpDGA6lA+APY928LUndcTs6VnRyjGwp6zsOq1Kf5OlJes5O63Iyc/kYlhb4ej
	Jjgwm7rwRB9C2m13SU8TxQDzdLLC2YjHIEQ==
X-Received: by 2002:a17:90b:5886:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-395dee7d5f6mr33449771a91.3.1787565138622;
        Mon, 24 Aug 2026 02:52:18 -0700 (PDT)
X-Received: by 2002:a17:90b:5886:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-395dee7d5f6mr33449672a91.3.1787565138094;
        Mon, 24 Aug 2026 02:52:18 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e496a27esm9749465a91.2.2026.08.24.02.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:52:17 -0700 (PDT)
Message-ID: <906cee12-6872-429b-8356-08a53c962d9a@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 15:22:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
To: sarath.ganapathiraju@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260821-heartbeat-v6-next-20260821-send-v6-0-62c5df84ce21@oss.qualcomm.com>
 <20260821-heartbeat-v6-next-20260821-send-v6-2-62c5df84ce21@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260821-heartbeat-v6-next-20260821-send-v6-2-62c5df84ce21@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4NCBTYWx0ZWRfX4R/26bKLlsfN
 x6lOXUvEYU5X0fbbPf4icd7EG3xn/+LO/eGLG50tv8GQCh1cnNIWLzLvaKOvlpveIOTuSHSnE5p
 S0GmwCaLDup08/HWPXE8vtY+/hVQGrs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4NCBTYWx0ZWRfXyMMIpkMxr262
 k2tXhbd6J8Ed9B+RExpSXyTwhjEx5sYeuho6Hk2BoXgm7YqEaY9EPwCB1vpdie2r/n3IsrNoAsq
 FdMM0AzWqDXgFYp5HXlg62NgIeHsU86j8w/xRJ1MaLWY6h2Ar3TEruSLatnWOkG+1I95jy0WetJ
 D3pm2caw1meeyZYlL9C+2nBal/TvTq/CYqT+85ctMj+VA4Oy2quNb1LpKpGIJKEjGZvZ5PER0ll
 8sHFsdguV2AtrXRB/tDVlV8lyrxUJo0fPvZ4iG58uCy3vDGV4bpQlXWRfQVd/XGmiZnn47sjzbc
 Kt7kCa6CleqoaFh4dmYaLK5ssQB3yZUz7RNWeAWt68aK0SafQqrTATCdAksTI3psJSP1JsHcB8H
 COJVy9SHrMsa4C+FP8uORWYLcSjj2Y8iRMJQcA9hzPBrSlzdgPsWl0+4d9tDKaEHdglCb9rTFcb
 52LsdbxGeZuLoMzjw8w==
X-Proofpoint-ORIG-GUID: TWPWkWwqSjr8dFhupFVfxyRAQOh0S50I
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c1453 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=DXzLyDNX0Fr8cL_R7gUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: TWPWkWwqSjr8dFhupFVfxyRAQOh0S50I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240084


On 8/21/2026 11:26 PM, Sarath Ganapathiraju via B4 Relay wrote:
> From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
>
> The HeartBeat Pulse (also known as RateGen Pulse) synchronizes the
> start of the DMAs and Codec Interfaces for the audio usecases and can
> serve as a periodic wakeup source for the DSP.
>
> Add the LPASS VA CSR driver that models the rate generator as a clock
> provider so it is enabled and disabled automatically alongside the other
> clocks during runtime PM resume and suspend.

Thanks for Patch.

Tested this patch on Hawi, WCD Headset Record working fine.

Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Tested-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

>
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> ---
>   drivers/clk/qcom/Kconfig        |  14 ++++
>   drivers/clk/qcom/Makefile       |   1 +
>   drivers/clk/qcom/lpass-va-csr.c | 148 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 163 insertions(+)
>
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index e609a7819e07..502acd86efd6 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -2105,6 +2105,20 @@ config CLK_GFM_LPASS_SM8250
>   	  Support for the Glitch Free Mux (GFM) Low power audio
>             subsystem (LPASS) clocks found on SM8250 SoCs.
>   
> +config QCOM_CLK_LPASS_HEARTBEAT_PULSE
> +	tristate "Qualcomm LPASS VA CSR heartbeat pulse clock provider"
> +	depends on COMMON_CLK
> +	depends on ARM64 || COMPILE_TEST
> +	select REGMAP_MMIO
> +	default m if ARCH_QCOM
> +	help
> +	  Qualcomm LPASS VA CSR block contains the rate generator hardware
> +	  that produces the HeartBeat Pulse (also known as RateGen Pulse).
> +	  This driver models the rate generator as a clock provider so
> +	  that consumers can enable or disable it via the common clock
> +	  framework, and it can be used to synchronize the start of DMAs
> +	  and Codec Interfaces or as a periodic wakeup source for the DSP.
> +
>   config SM_VIDEOCC_8450
>   	tristate "SM8450 Video Clock Controller"
>   	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index b8590963736a..3f6a52cc7ec7 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_CLK_ELIZA_GPUCC) += gpucc-eliza.o
>   obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
>   obj-$(CONFIG_CLK_ELIZA_VIDEOCC) += videocc-eliza.o
>   obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
> +obj-$(CONFIG_QCOM_CLK_LPASS_HEARTBEAT_PULSE) += lpass-va-csr.o
>   obj-$(CONFIG_CLK_GLYMUR_CAMCC) += camcc-glymur.o
>   obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
>   obj-$(CONFIG_CLK_GLYMUR_EVACC) += evacc-glymur.o
> diff --git a/drivers/clk/qcom/lpass-va-csr.c b/drivers/clk/qcom/lpass-va-csr.c
> new file mode 100644
> index 000000000000..8438d000814e
> --- /dev/null
> +++ b/drivers/clk/qcom/lpass-va-csr.c
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/of_clk.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#define LPASS_RATE_GEN_CTRL		0xd000
> +#define LPASS_RATE_GEN_COUNTER_0	0xd004
> +#define LPASS_RATE_GEN_DELAY		0xd010
> +
> +#define LPASS_RATE_GEN_MAX_REG		LPASS_RATE_GEN_DELAY
> +
> +#define LPASS_RG_CTRL_EN		BIT(0)
> +
> +struct lpass_va_csr_data {
> +	u32 counter_0;
> +	u32 delay;
> +};
> +
> +static const struct lpass_va_csr_data hawi_csr_data = {
> +	.counter_0 = 0x960,
> +	.delay = 0x16,
> +};
> +
> +static const struct regmap_config lpass_rate_gen_regmap_config = {
> +	.name = "lpass_rate_gen",
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = LPASS_RATE_GEN_MAX_REG,
> +	.cache_type = REGCACHE_MAPLE,
> +};
> +
> +struct lpass_va_csr {
> +	struct regmap *regmap;
> +	const struct lpass_va_csr_data *data;
> +	struct clk_hw hb_hw;
> +};
> +
> +#define to_lpass_va_csr(_hw) container_of(_hw, struct lpass_va_csr, hb_hw)
> +
> +static int heartbeat_pulse_prepare(struct clk_hw *hw)
> +{
> +	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
> +	int ret;
> +
> +	ret = regmap_write(csr->regmap, LPASS_RATE_GEN_COUNTER_0, csr->data->counter_0);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(csr->regmap, LPASS_RATE_GEN_DELAY, csr->data->delay);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_set_bits(csr->regmap, LPASS_RATE_GEN_CTRL, LPASS_RG_CTRL_EN);
> +}
> +
> +static void heartbeat_pulse_unprepare(struct clk_hw *hw)
> +{
> +	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
> +
> +	regmap_clear_bits(csr->regmap, LPASS_RATE_GEN_CTRL, LPASS_RG_CTRL_EN);
> +}
> +
> +static int heartbeat_pulse_is_prepared(struct clk_hw *hw)
> +{
> +	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
> +
> +	return regmap_test_bits(csr->regmap, LPASS_RATE_GEN_CTRL, LPASS_RG_CTRL_EN);
> +}
> +
> +static const struct clk_ops heartbeat_pulse_ops = {
> +	.prepare = heartbeat_pulse_prepare,
> +	.unprepare = heartbeat_pulse_unprepare,
> +	.is_prepared = heartbeat_pulse_is_prepared,
> +};
> +
> +static int lpass_va_csr_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct lpass_va_csr *csr;
> +	struct clk_init_data init = {
> +		.name = "lpass_heartbeat_pulse",
> +		.ops = &heartbeat_pulse_ops,
> +	};
> +	void __iomem *base;
> +	int ret;
> +
> +	csr = devm_kzalloc(dev, sizeof(*csr), GFP_KERNEL);
> +	if (!csr)
> +		return -ENOMEM;
> +
> +	csr->data = of_device_get_match_data(dev);
> +	if (!csr->data)
> +		return dev_err_probe(dev, -EINVAL, "no variant data for compatible\n");
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	csr->regmap = devm_regmap_init_mmio(dev, base,
> +					    &lpass_rate_gen_regmap_config);
> +	if (IS_ERR(csr->regmap))
> +		return dev_err_probe(dev, PTR_ERR(csr->regmap),
> +				     "failed to init regmap\n");
> +
> +	csr->hb_hw.init = &init;
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable PM runtime\n");
> +
> +	ret = devm_clk_hw_register(dev, &csr->hb_hw);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register heartbeat clock\n");
> +
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &csr->hb_hw);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to add clock provider\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id lpass_va_csr_dt_match[] = {
> +	{ .compatible = "qcom,hawi-lpass-va-csr", .data = &hawi_csr_data },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, lpass_va_csr_dt_match);
> +
> +static struct platform_driver lpass_va_csr_driver = {
> +	.driver = {
> +		.name = "qcom-lpass-va-csr",
> +		.of_match_table = lpass_va_csr_dt_match,
> +	},
> +	.probe = lpass_va_csr_probe,
> +};
> +
> +module_platform_driver(lpass_va_csr_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm LPASS VA CSR heartbeat pulse clock provider");
> +MODULE_LICENSE("GPL");
>
