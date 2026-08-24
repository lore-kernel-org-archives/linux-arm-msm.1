Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE5939CCE7
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787557516; cv=none; b=Fra1njq/77p/IbhylxZGm6oWsmtACYAiRI623gcq40nPyDs5WuuXGSRKAOfvlrf0A8gfz4iGPtSoMAc4eG0x+pZLuQ/xh6fVOHI/lB1ogOed1G7wBvpi21VXnZlfD4jminIAklO1ezpCmLdArzxScUroPLyXjH4oSupgwheIbuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787557516; c=relaxed/simple;
	bh=nLRufELRkMPwM3rgysQpl9/ztKJ92O6YS1CcjcB1SXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxNBGLklos+o3+rMDtGaiog9rMrXXzkFlX+EhRWnYefw0GuBtXuk6PYAVOl7OxTT2DfxWs2pptrDlNlUMapb9JmAAhSaLHTrP9Fjx/44ANEiUj62EmIALxXoiUGMj1qCiH0aa1gOrv+PbmHzOqoNK2BPFfvdCj8nVa5Z2J3TLR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cyQZBhV+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=flM1AOa/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cyQZBhV+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="flM1AOa/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O7j5qp1184973
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:45:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OBEO2yddjoRYR/362AQj96X4
	fgKk2EJOvMsZjHeZg7w=; b=cyQZBhV+e0F00QCVxVnZRTOKfyCWc8t78J4BWLPL
	NpYO5Q1tpeVJ7VfIZ8as3elNkwZFgApYtx9y9z8fyuEprhnhVgnGBnKJz9C4nu2T
	Ki8ygGUPKTYNSLCdUAr2b47ftMMcHYd2TfUtqwdG4jTPaFfE0VDj2tGQ8gYpay9k
	Qe7Ue33Tmy3WRd82hab0LB58AHgDVZkeMkadNpqpKhjf+0LKcUtGmnvqzGgVPhUK
	L9BBSO4bhNyvzS2euUBVYylDt3eVNjIMfpPnu5Vu5NlY8Acq16rGoEmIpWZqTy1K
	Xmthi3tlfxf7JQGKyM8X+rrlxicoilqNjbJrmp8W/VZzIw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf001f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:45:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d28f8737eso59252011cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 00:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787557513; x=1788162313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OBEO2yddjoRYR/362AQj96X4fgKk2EJOvMsZjHeZg7w=;
        b=flM1AOa/MA03QFnmnCnvL8JoWbaz2GL2BLJG5HG9qUc1jUYNsSdayjqy6Gu7CKqPOz
         eE2wO6FPLYeCKMKwNF0BLK5qNB4ZJ104LkTxEkQCBkJEFbutnvWfRe5RLXPS9HZynF7l
         3KIO3xHyL4yp3IguCO8Oo5jmRGVOLfHDo4ZiDRjBSixNlqp7fn4DH/s+YEDgt++1aUVB
         izL6UjCO8QReuPnTAMa1dPcvajd2ULQ/+pAc/k02rfyrWwtdcHu2ljvJYZd9m50y7eGH
         gqMWjelYe6iiFZZOTty4Hb59PL2dQ8+BHr3VCpPoSzUISYoONc4YC6kqQT8M4A5Hh7QM
         mBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787557513; x=1788162313;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OBEO2yddjoRYR/362AQj96X4fgKk2EJOvMsZjHeZg7w=;
        b=f4uetZnSNYgYBBDRD8Zley6oVT6xFmw4ihKKs3Zz4jaAgBjGhGdBrTGKoZCNqV3Uq6
         RuNnzYAuLW+djHtIJXrqcUQoBYHKJwBv2w7WF9ErRkYnoFiCZe+x0p69qoabeI4et8rs
         iOGIMfiGIU+0A2iv678PWeXxlls91B9wowFiiXv0nDHjHIui6/38d+otYCxfIATq3Op+
         avNcKQCv6TIkcL8WNOgKCeOob3c4VHtiVLDM+oMqASRjHvPnV9n41MpGFOwA3qtLoOn4
         1pD+XBN7sJI9TAyrGo5jVfGbdUqCddYotFfb/Kj0F5tWr6m11613tCytPH5O97Kz+IR5
         Oahg==
X-Forwarded-Encrypted: i=1; AHgh+Rp0WOozMNDteYyq00wLY5vPwqRInIJMM40mPTuvHco4+eT8CeQjbwP7IdjTw0o3Kk2bs9Dpwc4NvUgC2f4a@vger.kernel.org
X-Gm-Message-State: AFuF++nDl5F17/PHagXUYUNwVTgrNcVuJ1STArR55Uzw7X+yjMYWKDFP
	Du5chUxeh0/a4byws/jZpanbahwRTURQmgN2KsM09pLxoUaGdsGaXen+ZkAw5AoQZ49P2P/BYLe
	DNG+f0WIU3xvCw/tK+8XlSc+Ga0oI9lNkNElytXAVRBrutRFH6PcU2f3ke3Y4bLNdS1Nl
X-Gm-Gg: AR+sD12uKLpmB73nq3bESuE0WWf7gGIseVkSMkNX39BNz/LgegpQRcky9PRkla6Ct1k
	3fQdL9V2wq/jS5lfkceu4YgeG7crChR8SkzDrE6uG5EchLZsqzdQyz78KHyFGxJATEnJc9ZLThJ
	0AWoWD1aJ1uOhA7Jr5f9J8cfiANeQQGJzdvBDh2CK4EjIPuBpmQQW7gCnXPLo04mbMnwdpr7pvY
	OoCqETdYcNCjPAYe5u1GVFliaK0uwwT5Ijtzpd2MBMwSOoPwZNCw1bcwPEn4Y5Ld6QkkF/mfZqQ
	Ri6gcMTfEBJRZBjJiXmq6807kTsTpKSdEMlZvePsoaeA7MTFQbYmJWLSMrkyplkMB5lMFhxJDJs
	uzAkejS02ZOf0OFE=
X-Received: by 2002:ac8:7e95:0:b0:52d:9a3f:85bc with SMTP id d75a77b69052e-52e09bea1efmr168583271cf.18.1787557512927;
        Mon, 24 Aug 2026 00:45:12 -0700 (PDT)
X-Received: by 2002:ac8:7e95:0:b0:52d:9a3f:85bc with SMTP id d75a77b69052e-52e09bea1efmr168582861cf.18.1787557512434;
        Mon, 24 Aug 2026 00:45:12 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b59fsm1270001566b.12.2026.08.24.00.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:45:11 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:45:08 +0300
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
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 15/15] ARM: dts: qcom: Add initial device tree for
 Kuno SoC
Message-ID: <2gvwwqbqknmxweztazdyex7wsbzyr7pxta65st7hvaohuq4xmf@3aqohho2dl6t>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-15-196e2b306368@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-kuno-soc-support-v3-15-196e2b306368@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2NyBTYWx0ZWRfX7xJnxBc3Fm0v
 6K0k88kAj82pxo1j1fkxOzwa3ibeJoPgX623q4PmzxbRyOYFa26BU1wYIBqg7smIUqsSJbKJI0R
 xlIwqDJs7FkO7NruLG++FUqereBr8no=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8bf689 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=0woZI7LFW-Y1d3ldtK0A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: W1ML4eKfqGsEmFxluslsjIgMNb-ZAU8O
X-Proofpoint-GUID: W1ML4eKfqGsEmFxluslsjIgMNb-ZAU8O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2NyBTYWx0ZWRfX0PcyAB7XKenm
 UmUcOL+nT8r9WCDZMJST8lSxT9BrHforHlthBK9ATnVj+Z+vtm6Ji3QJKZNneInq7Q3lvuDF1H8
 IY5RDYGaaAwkwoOuNCCDy5/+06Qh740cbuAjlUwhR5rRZSX0z7eNaWEOmEjjcQ7kKqpEWLuy6zl
 Kr1FoR9wcSsJgB/lDYxdCshFwy7n+zYm2juAaShzLDutF9uwrkrOpKFgfWbX/5kibxM/qh1P70k
 cHoBPz6TiWJcZslpDmpsLrnQ9lns+ZEChx2j1OChZYrBBAJyemx3ZR+Kopkq1D7nhm2UkXhCD3/
 flbC94gi1gN7zq7YRFhYeLCAn01TDMfCQBnl/Y5If3UeD6cHav2DT1zIGfKb7yczOCyRGMKJu1g
 ydv7IiwHq7WlW4JXWelWOjyXaXFKl89zuNSHxaqF7CHE+lOv4N6a2OkM4AChNaRfOgW3uimyho5
 zUmHuR1I7KfOsgeUuZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240067

On 26-08-21 21:39:08, Hardeep Sharma wrote:
> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> 
> Peripherals included in this initial set:
>   - Single Cortex-A7 CPU with PSCI idle states
>   - RPMh RSC with clock controller, power domains, and BCM voter
>   - GCC (Global Clock Controller)
>   - TLMM pin controller (110 GPIOs)
>   - Interconnect (aggre-noc, cnoc-main)
>   - GENI UART console (QUP SE3)
>   - SMEM, hardware spinlocks (TCSR mutex)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  arch/arm/boot/dts/qcom/Makefile          |   1 +
>  arch/arm/boot/dts/qcom/qcom-kuno-idp.dts |  25 ++
>  arch/arm/boot/dts/qcom/qcom-kuno.dtsi    | 422 +++++++++++++++++++++++++++++++
>  3 files changed, 448 insertions(+)
> 

[...]

> diff --git a/arch/arm/boot/dts/qcom/qcom-kuno.dtsi b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
> new file mode 100644
> index 000000000000..d430e65e08bf
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
> @@ -0,0 +1,422 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <dt-bindings/clock/qcom,kuno-gcc.h>
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/power/qcom,rpmhpd.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	interrupt-parent = <&intc>;
> +
> +	clocks {
> +		xo_board: xo-board {
> +			compatible = "fixed-clock";
> +			clock-frequency = <38400000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;
> +			#clock-cells = <0>;
> +		};
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0x0>;
> +			enable-method = "psci";
> +			cpu-idle-states = <&little_cpu_sleep_0>, <&little_cpu_sleep_1>;

Nit: we usually put these on separate lines.

The rest looks good, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
