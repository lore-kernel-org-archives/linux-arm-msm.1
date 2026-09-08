Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F80A3B14AF
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 20:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899373; cv=none; b=YWjnVxXcpokYrpPgp3QFuACahPuahcl6uoPY1/EzKnhVvl0V8aA95IFuql8I6vf1fG8L3frk3zKquu9uO7FPTPhN6duOGv7b6ovbcBbwITAXRSUarhfjjwr1AkPvUVoBw8WlLvyoLuQVJOfYdKT7vohGcTo2gPLyFZXDHkwEQeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899373; c=relaxed/simple;
	bh=/BSeRI8oAY2EXeYDQYbh7+juGNtzRqVvmawzAxakJC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JeK8MtKltZkunJ0+O0t2Hc55XUzaOjrzX6nouKT/AUddMhR3CEOVtIlGbYgx7SyJ5XtNZpXRMFVVNR5vg5XUaY15mZ2bu1k4Qsk26nt7UGGXT07d9oj1pL1jDBs89/TSckh/QnRzJDjg2Ot1PNOpJJnf8aLcckFdVYmjXcb8B/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CAbEuMJl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+/NN4UY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CAbEuMJl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W+/NN4UY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688GLn8L3502009
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 20:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mTtgorZFcSlreip2GXCDVGY1h7R3w9udtSjCSpVGQLo=; b=CAbEuMJl76RtIlOX
	fs3y3OdTiy2ABBJPHyEC6OBCDdvxmXofOogetztcZy/jrJeyEBcbkxYBkCs14L+H
	1YLCOweu1t6y8mGoxsGPi/e01UGUWX29Zk6niYuZ5pWxcs1h/ppSGdKZSANhULEW
	vhlwQ2ETHLPkIFz/HdFh6Kkf4s4K7whWvoUNCp/gayMAt1oLkxbzDW6hUp38TGio
	Yi0/rhrJGsAm3JW0Ltq+LHjPaSxQ4uauymCSAMXqf2rYPTbcQ+t3F7voCjSeaClp
	fsS088rfUqfRj+39Tg5Vtamzbs5EByUdiu8zKcV1j7jlZgP6Se5LeDF6gnUnUTyB
	itlbnw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjntph567-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 20:29:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ec3146553so1161975085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 13:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788899370; x=1789504170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mTtgorZFcSlreip2GXCDVGY1h7R3w9udtSjCSpVGQLo=;
        b=W+/NN4UYtyvnF1AYqSsIUmF4DtPZAfMPc7k2y5Z6x4ISyqaj1aA2Ly2Xoa9hu9iN0k
         rVmGrJn5NOOXFFLYipMLDPNsWAcjRGeo74iAQaKMjmhdzpqlLTQsvyB4kFNwEYIWpbe3
         GOwXS8NkjTPPwrqKGA3B7G3EixpISyHh9PwvlgvHeBaReTQ3WoiHaVUK0WzHXQjO2Y1R
         I2eEuUwWNNiheA5WtLNrw3u+yZIiZj8qi/E+ldQAMQaBp/7E8Ud6MfV8TM47e+nBvlEY
         yr2yUK3CVhXU5FrEcKFS4avccX5mgI0VUjgN9RI3HEU2kVaXv0BF7WDDo6T5q+1hXBHi
         R/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788899370; x=1789504170;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mTtgorZFcSlreip2GXCDVGY1h7R3w9udtSjCSpVGQLo=;
        b=ICqa8QgCWCmeHggkjVABLvCrn85fG6sBwp4te6FKTyipCa7sOXaBT7vbMzzzwiH0D7
         G3aZ5ChvSAgn3h4clUW/4ocoZWLt6cH6gNOfFlmItarmXu326eKT3lQuMlKNaAVuLlFs
         1w7YKsYQDwbKRgq+CPnXABH9qUpPH0vY7OuoYNLm/+/hao9iqOlSGOgFsHn8idCz5L/f
         YbzPsc9j0MtaVIVTqQ39/iIKeohK9OyNQHTH2oJUx+l2ZK+iymgjzL4FI+mSPNK2P4bt
         Po4KqvFao1HEbBnbraz8ywfT6pQH+XZ83O84U9aqX70vG9rrzYmA1CAlq3oC0CJWqooz
         7Pkg==
X-Gm-Message-State: AFuF++nr9d5T4PV5ATclL1IVtLjS5wPx/4dVXXYwMLiWbqqaO30s11tD
	JIvExTL5i3hqaipMYCfQ2rNOuQ3TMd2jdbsQFnS+1VrS2z2hNZxR1dW8W4p2E82Ws0dU2NSi97V
	E1eBezf2Au1Xcz+uTaFdqxrCm4FMkZbLpWLNHnoxZlluNNIHkO6+gh380kMw3B01eRG9g
X-Gm-Gg: AYBFou2RnJRoAbxAXqT7E9pa8nqOZNbQJixSCj2QKFLMXK6hXl4EIj/SBu7hHTKAmFJ
	XnuVadZXbEQM782O/q+3rSosFTEdbw46Tpo+pK2c4O6oYh1FbDOzFJG15QrqU0DbeOd/Q35xoLA
	13DixgktJPwL5ZHkBsTi9ztDJscCAxiH38+zZsfoD4heG1O0/jLJ0DTiVceQPadkPnqpwRXdH0s
	uyMWaHbObGcHKpqitY29qZ6eJv6kfTLjnag1IQcjyzh0v9hhJCSSGGr+2u2eCzP4yGaMozW5VlC
	1Aprb+fXyeJ3psptODsPMYTpuX7/DLWcmXjrtQZFltiTub6NWoi9d5wu7J02FGGLXoX2DPCSti8
	gJ6UqWe+9+4ZCzR7aO+jgqsIzUBk=
X-Received: by 2002:a05:620a:26a7:b0:938:fca0:cb54 with SMTP id af79cd13be357-9398072d08bmr3427334685a.40.1788899369617;
        Tue, 08 Sep 2026 13:29:29 -0700 (PDT)
X-Received: by 2002:a05:620a:26a7:b0:938:fca0:cb54 with SMTP id af79cd13be357-9398072d08bmr3427328885a.40.1788899369135;
        Tue, 08 Sep 2026 13:29:29 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d0af538d0sm286668595e9.8.2026.09.08.13.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 13:29:27 -0700 (PDT)
Message-ID: <dfcdf1bd-540c-4294-9e41-1dfd9ec16be4@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 21:29:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
To: sarath.ganapathiraju@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com
References: <20260831-heartbeat-v7-next-20260828-v7-0-e3ffeac46a51@oss.qualcomm.com>
 <20260831-heartbeat-v7-next-20260828-v7-2-e3ffeac46a51@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260831-heartbeat-v7-next-20260828-v7-2-e3ffeac46a51@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDIyMyBTYWx0ZWRfX/iVGGHNG3EsA
 /svboltqHTSG96ErN9DRH4h3rxLTkXWb8CHtwE6Ru51+WDNEJg3dYL9PGN8RTxjU6c5/wjvLdCP
 rMqLlkZ83b5sZXu2QpLecLHyaC5dxd9U7SO2iv9AO/6ta7uxnijfCmaTbnFzHnTCS+5YRNNjxI3
 UYHap207f1pkWGamRaXp9DulrPBsXnbT7/gyzAjBs7bciwmHE42zvo7HXDU2Iajv1IgdJMKxWby
 VeIFw6y8M+okvp0o/0bVsT/1scfVARvJn3KbUH0CGGSIynRKwFeLCuvbKCjGoi1G875QEdHe+rU
 oB9nRNlxFl+8Z2U7qx4DvFqK2SFQE7E3V2Tgbtz2+mw+zO2rsPNFGsX13ePOWuOYqgKA3zOtraX
 u2tScZBhBkyVa4H3K4hnfswGE6VD2WovP7c0n4O65PjMiSjVaOVzXkCrhACPELSUG+MHiK18H4s
 u2ULyrgHleVRDA2vtBA==
X-Authority-Analysis: v=2.4 cv=N+AZ0W9B c=1 sm=1 tr=0 ts=6aa0702a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=G3gKnUrgdjqRGvMogNIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: u9oKnmO5j8-Pnq3wHApZe7B3obPwtGlY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDIyMyBTYWx0ZWRfX8uVjEnj2LA/K
 YVO6rSbwGdDMQg8DBQep3u5x8pzY3EpsdjPB+izJOvheGhGvmcXHCCeslnUzkLV6zyYJDpa2cwk
 F77ITA/kAk8b5nYWjX5WyXDpFYkXo3U=
X-Proofpoint-GUID: u9oKnmO5j8-Pnq3wHApZe7B3obPwtGlY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080223

On 8/31/26 7:33 AM, Sarath Ganapathiraju via B4 Relay wrote:
> From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> 
> The HeartBeat Pulse (also known as RateGen Pulse) synchronizes the
> start of the DMAs and Codec Interfaces for the audio usecases and can
> serve as a periodic wakeup source for the DSP.
> 
> Add the LPASS VA CSR driver that models the rate generator as a clock
> provider so it is enabled and disabled automatically alongside the other
> clocks during runtime PM resume and suspend.
> 
> Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> Tested-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig        |  14 ++++
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/lpass-va-csr.c | 148 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 163 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index e609a7819e07..502acd86efd6 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -2105,6 +2105,20 @@ config CLK_GFM_LPASS_SM8250
>  	  Support for the Glitch Free Mux (GFM) Low power audio
>            subsystem (LPASS) clocks found on SM8250 SoCs.
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
>  config SM_VIDEOCC_8450
>  	tristate "SM8450 Video Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index b8590963736a..3f6a52cc7ec7 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_CLK_ELIZA_GPUCC) += gpucc-eliza.o
>  obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
>  obj-$(CONFIG_CLK_ELIZA_VIDEOCC) += videocc-eliza.o
>  obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
> +obj-$(CONFIG_QCOM_CLK_LPASS_HEARTBEAT_PULSE) += lpass-va-csr.o
>  obj-$(CONFIG_CLK_GLYMUR_CAMCC) += camcc-glymur.o
>  obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
>  obj-$(CONFIG_CLK_GLYMUR_EVACC) += evacc-glymur.o
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
...
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
Does these two registers need to be written on every prepare?


if we need to program just once then we can just use clk_regmap_gate_ops
which will implement pretty much the same driver.

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
This check will never fail as the device gets only probed if compatible
matches.

> +		return dev_err_probe(dev, -EINVAL, "no variant data for compatible\n");
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
