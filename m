Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686937;
	b=ZMnS/BBtEVX9UgRzOGFG9wOnRN3szzCE3Uv2mFBTRzw5IunubDT6/OJEte3jmRAipaaA
	 VEfSfjE6LbsC1lvbfYD/7TuqEISk6myR8rDnqcKUES5S4xOqa8aQ1ifDj91IuTZjktg7C
	 eaDjwBBTY96OmkuNEBWI2vs5TE+vg0ZJsh1YVCQ5DDqBLK9zDWHq50Pd+/M6d38pmDRZD
	 YCKz0nRN1Og1Ci4eidzXOd/v0KK0JCQ2XqcvkjUisuKIjZx7iBMsW5KpkaC78D/JayHZO
	 Z7+1ZoytIrgIHEOeFlWUc7iqwqhCAj6dHSY9Af6aX+hMHQzCB0sgFzZ8max8lZfTBeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686937;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=utZJqmyyJuwArTWqk4i+RMhWhmtJI/Txx/vjCidO69o=;
	b=mUtl4GU0tXfFzalhPQvlFlESnhitu8q2ksS6GLmlzBo0caoNYzLWABqeo7aLvZa18hKH
	 PIrw8mNdi/fudzohY62Xf4w9QUxzMk+CNxLWZbFUzFLtq7zsogNyhEt2lgtrxzwwX1vCR
	 Ap5bxP94UyLdE+5eU/80K9x+u9we02Ar0ZJRXs3UFk5MDvsmh8Hs0TNtKgnHQZYj4vzv6
	 r8kDkiY3U254ODPbAhFVS+Cb8nq9f2EFaodNLHfTN1eMm97kWPGddZ4vqI7rKefYrQNtb
	 IXLgkveBuKcuQLDCCCEhb8gotA+SLMOPSOZuhkXNB37Jxx+xU9i6CaE8tG73ryPAEBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PKqWAQde;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a23+nFvK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084CD606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 09:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 084CD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PKqWAQde;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a23+nFvK
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AsGO2885476
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 09:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=utZJqmyyJuwArTWqk4i+RMhW
	hmtJI/Txx/vjCidO69o=; b=PKqWAQdeMLiVQ0a+hx5LreW0t+jZuzHFGgyrHw9t
	o3eykl8j+OVVQ0Sa1pEgkVREUyXNrt8yukrZzQdOkguirnRNOpjdJj0/inkp5Xud
	CSkJEWo3ttv1Fh9WkNrxcZT4b6x+h8qpRuF/QFDsTG58CLsKIRygTR0YGAyTuIec
	RZ0fx8LbE9/iNaAxLvMrjUaTPHeJkA/F5S0LXhJmt/EWodo5uBHT3CacoZznXHOk
	I3pAmzfrF1XS6WPxi3mKr5eqRnsizA1GECVrgBZYhseIGSmXMUXrfBoLAB3LYxl3
	pTkM/M97TWzyVyZcVW/7jz4vUZmCm+P5nsLRs3e7OG1t/g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rgvbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 09:55:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-944138ed63fso524511185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 01:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795686935; x=1796291735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=utZJqmyyJuwArTWqk4i+RMhWhmtJI/Txx/vjCidO69o=;
        b=a23+nFvKBw5dxfZLHobLaraim0um9EUfsyhkpK3M3dSq8N3MCPapDsCIbZUS2CnYrf
         HQnrPL1Q5NWdQSLqjdVL/BKPjOJiuBpMK5VvKmX4T+/6TjlJgHSjwURS6OoBpbiaxctp
         wO0p5IKzMe/HPvUGctBin4kFSce+J2JGYYCIdGbYMdk1NwkKawIkKwvssNCTe7cKyBaa
         QvSG/LvaNLXe99diO4Q+8z5HX2C+0F5GWKyrQSSN13auGvbTQq64cToc/RLLJJSPrArV
         0Zv4/NH9naVqRwhO9I0cZtxEgHhhuQJrH1WjHkHWE+CwmQSu88asVWQLxok9qTh2DWRp
         pNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686935; x=1796291735;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=utZJqmyyJuwArTWqk4i+RMhWhmtJI/Txx/vjCidO69o=;
        b=P4szJo+JAmAdLO7lSqhTt2Df41SflY1vbPt+ZqDWdCr4cgWIi1zh44szlnLRoAuuO/
         nkeDk+quoAW/D9xCPERyYSOsiuBMDoohdHZW+B+VpKP/TabLzgkTndF1AcIw5ZdjnWHP
         FxT0bEmg+Ew+9znKU1clOatJj9qwOkKhzWvmS3DuXHRnXKC/Ly+8yQhYdHFe7Y0a0CS9
         FcI5CpPrnXNG2zR/gRMyu8huTrHDFXOUmh2lYlMJEJnrU26ksekkKQ5816gL2gQtd4/t
         GnNS1d5d2tU60148Be5WMvTxKGnLSc1a8dPt4/yQW0qxxvf1Uj05D/kqQfQ6OdZZQRQy
         8L2A==
X-Forwarded-Encrypted: i=1; AL+hErEKTepR11k7sLVl0k1iV8KmLsDPLxuswQ6TaNS/DCxMEg23IIGUUSaniMGunH4j9pfzfjfo8RJ5PQtLlaY4@vger.kernel.org
X-Gm-Message-State: APuU4Z+KCMcpbA9PT7sRrkLcYtd1RgBOrhzYf7SgCazYYfGxLwrEzZjs
	QNRW7rlnwz4DPOGJMOOsfBqOj4DWf5D/NEQ6qH/rDd2pOlkpMUBHFcrzJcs26k7Gm+5s2SGIoFl
	mwWIoNCMp1jq9pDj8GkzfhMMGIoRtESkwQIv2leWTF0yaIRfoE45aHd7r5/FsAwQobyei
X-Gm-Gg: AZFdTZc9yd2Ya/arYURyR2wHuMgDd70Aigpfw7MzLeB7OkATYII6+zHk/ENKRzytYeC
	Ji3d/ES8/uD+ULp3wOr197xIQxmVM3l6PwWUDIa+PGA4iZh3sOv9mURW04RP1hPOETiAgFIA4Ah
	44kHeHtZO6oQtGy8uWTcy0zKatywR81PT5+CV5Zrja7w1o/cxGOScMmkO9VQf3J6RPBmiARWVMB
	1/BZAYQ+ipq0qBHCb/MyGFeSJsqYJ9VYZRiupGrm2OLv/zFlG12JWsBgAOXmEOrIgezuMA2PWSF
	cUPBLI3M3lZqr+8agbOrvP4Ii1myoxkjgNY4GA3ojRlKU7CyD9O8sP/gX3QkcTCQ8Pvc7BvFgbQ
	PkJUlbkxpLnQ1KcEy2TpMuFfHPF6hh7nDzEjbWzfD5bQ9aC+EMO85BgGrfRrlblw1T5araC+98Y
	VjGYot7XpPwmUVf5MlBCQ25bOxXAg=
X-Received: by 2002:a05:620a:1b9b:b0:949:6898:2e4b with SMTP id af79cd13be357-949bab47043mr3332538385a.66.1795686934901;
        Thu, 26 Nov 2026 01:55:34 -0800 (PST)
X-Received: by 2002:a05:620a:1b9b:b0:949:6898:2e4b with SMTP id af79cd13be357-949bab47043mr3332535085a.66.1795686934251;
        Thu, 26 Nov 2026 01:55:34 -0800 (PST)
Received: from localhost (net-188-152-73-83.cust.dsl.teletu.it. [188.152.73.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm690184295e9.11.2026.11.26.01.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:55:33 -0800 (PST)
Date: Thu, 26 Nov 2026 10:55:32 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        p.zabel@pengutronix.de, andersson@kernel.org, konradybcio@kernel.org,
        abelvesa@kernel.org, daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
        fabrice.gasnier@foss.st.com, alexandre.torgue@foss.st.com,
        marex@nabladev.com, changhuang.liang@starfivetech.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] clk: toshiba: introduce a TC9564 clock/reset
 driver
Message-ID: <awgCFMH6xerE510f@lore-desk>
References: <20261125202141.1288493-1-elder@riscstar.com>
 <20261125202141.1288493-3-elder@riscstar.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3x9W0WwUhC0uDOCg"
Content-Disposition: inline
In-Reply-To: <20261125202141.1288493-3-elder@riscstar.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX/R9FjL9PpNT0
 rIrRJU8jPb2hb23yGUwEPZ3VMM2hmLF+XtlJBoMiCbYmXjYoU37u9Yir7d73zy8eeXhQQ05LHv/
 ZxuSMP7nrRT7HvLkU28KRF8u8GDHs9eKfas6q6l9RtrpUtKsCErAQ9O1Uqgkdi8/wNWkSfyYvbL
 XlR8MUKGTyqipPwnUlsrGBCOYSz30t7I639QbK0UgZtc9rhIbazRkHuOmGtZ3fdSnQqClI9ailL
 ckOy54J2JK7y8I4dRgzvwPMykVUz1Xo98hT4MwIB7X9p3C/BcTINhSXf8WYlcCHDlQgDm4CA6vQ
 rSW+mNc3eP0OFT3+cUvxxnoEwz4k9Z1gXpH0PFsHRlXwQc2opH+V03s1gDDsqG/fLt2iH6fzWUD
 XFE0VDZXs1JrOecY6kGe1IYtBjhOH3DhuHAJzDBT/zJ5PEdMyAqUOk+PYTgYc7JRqqtJHalHmYi
 XXadrg3WsrEsiJdEfqg==
X-Proofpoint-GUID: rXB9qP6Z42L_J2L5DCL4y-R1SwxelK-m
X-Proofpoint-ORIG-GUID: rXB9qP6Z42L_J2L5DCL4y-R1SwxelK-m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX1TZWysukYTgC
 3L6Q2aGjowU3AINY20a6S4Ae1MV+5dZ+hNAKvjm9xO5sgZmbMpkc+Sjt61mWtA1TThOnyU5kQtq
 iUeXZSXb71MBYskb3Mnd5QEgPwS8gos=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b080218 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=ee_2aqc6AAAA:8
 a=VwQbUJbxAAAA:8 a=KKpmO0RCTZ5nSEYPFsIA:9 a=CjuIK1q_8ugA:10
 a=x2vAONnnm_0Qpl89FwIA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

--3x9W0WwUhC0uDOCg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 25, Alex Elder wrote:
> Define a new platform driver that manages clocks and resets implemented
> by the Toshiba TC9564 SoC.  There are 21 gate clocks that can be enabled
> and disabled, but currently only the clocks that are (or will soon be)
> used are defined to be controllable.  There are also 13 resets that can
> be asserted or deasserted, but support for some of these is omitted as
> well.
>=20
> Two registers manage the state of the clocks, and two others manage
> the state of the resets.  All four registers are found in a region
> mapped for MMIO.  The region is provided via a BAR on one of the PCI
> functions embedded in the TC9564 SoC.
>=20
> The I2C and PCIE clocks and resets are treated as CRITICAL, meaning their
> state should never be changed (and a warning is issued if changing their
> state is attempted).
>=20
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v3: - Fixed problems/garbage in the patch header
>     - The Kconfig option now depends on RESET_CONTROLLER, and can now
>       be enabled if COMPILE_TEST is enabled
>     - The generic gate clock controller code is now used rather than
>       implementing a custom one
>     - The PLL and internal fixed clocks IDs are no longer available
>       outside "clk-tc9564.c"
>     - The PLL is initialialized, followed by all fixed rate clocks,
>       followed by the gate clocks, to ensure each clock's parent is
>       initialized before the clock is
>     - Updating the reset registers (read/modify/write) is now protected
>       by a spinlock
>     - "Unnecessary newlines" have been removed
>=20
>  MAINTAINERS              |   1 +
>  drivers/clk/Kconfig      |   9 +
>  drivers/clk/Makefile     |   1 +
>  drivers/clk/clk-tc9564.c | 456 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 467 insertions(+)
>  create mode 100644 drivers/clk/clk-tc9564.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 36107e0790780..ac27a9bf55c41 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28722,6 +28722,7 @@ M:	Alex Elder <elder@kernel.org>
>  M:	Daniel Thompson <danielt@kernel.org>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
> +F:	drivers/clk/clk-tc9564.c
>  F:	include/dt-bindings/clock/toshiba,tc9564.h
> =20
>  TOSHIBA TC9564 PCI DRIVER
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 6bfa2c8fffe1b..897f4a4c74edc 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -185,6 +185,15 @@ config COMMON_CLK_CDCE706
>  	help
>  	  This driver supports TI CDCE706 programmable 3-PLL clock synthesizer.
> =20
> +config COMMON_CLK_TC9564
> +	tristate "Toshiba TC9564 clock and reset support"
> +	depends on TC9564_PCI || COMPILE_TEST
> +	depends on RESET_CONTROLLER
> +	default TC9564_PCI
> +	help
> +	  This enables support for the clock and reset controllers embedded
> +	  in the Toshiba TC9564 SoC.
> +
>  config COMMON_CLK_TPS68470
>  	tristate "Clock Driver for TI TPS68470 PMIC"
>  	depends on I2C
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 99377a13ebc57..d67cfb6d623d3 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -111,6 +111,7 @@ obj-$(CONFIG_COMMON_CLK_SI570)		+=3D clk-si570.o
>  obj-$(CONFIG_COMMON_CLK_SP7021)		+=3D clk-sp7021.o
>  obj-$(CONFIG_COMMON_CLK_STM32F)		+=3D clk-stm32f4.o
>  obj-$(CONFIG_COMMON_CLK_STM32H7)	+=3D clk-stm32h7.o
> +obj-$(CONFIG_COMMON_CLK_TC9564)		+=3D clk-tc9564.o
>  obj-$(CONFIG_COMMON_CLK_TPS68470)      +=3D clk-tps68470.o
>  obj-$(CONFIG_CLK_TWL6040)		+=3D clk-twl6040.o
>  obj-$(CONFIG_CLK_TWL)			+=3D clk-twl.o
> diff --git a/drivers/clk/clk-tc9564.c b/drivers/clk/clk-tc9564.c
> new file mode 100644
> index 0000000000000..306781e2f7b4f
> --- /dev/null
> +++ b/drivers/clk/clk-tc9564.c
> @@ -0,0 +1,456 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/*
> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights res=
erved.
> + */

Hi Alex,

I think the patch is fine, just few nits inline.

Regards,
Lorenzo

> +
> +#include <linux/bits.h>
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/slab.h>
> +
> +#include <dt-bindings/clock/toshiba,tc9564.h>
> +
> +/*
> + * Define the offsets for the registers that implement clock enable/disa=
ble
> + * bits for gated clocks, and those that implement reset assertion bits =
for
> + * resets.  These offsets are relative to the address space defined in
> + * devicetree.
> + */
> +#define CLOCK0_OFFSET	0x0
> +#define CLOCK1_OFFSET	0x8
> +
> +#define RESET0_OFFSET	0x4
> +#define RESET1_OFFSET	0xc
> +
> +/*
> + * A PLL driven by a 25 MHz input oscillator provides a clock source to
> + * the chip.  A set of fixed rate clocks is derived from the PLL, and a
> + * set of gate clocks are children of the fixed rate clocks.
> + *
> + * The clk_hw[] array within a clk_hw_onecell_data structure tracks all
> + * of them.  The following definitions describe how these are laid out
> + * based on their indexes into the clk_hw[] array.  Gate clocks are firs=
t,
> + * so their "raw" public IDs can be used as indexes into the array.
> + */
> +#define GATE_BASE	0
> +#define FIXED_BASE	(GATE_BASE + GATE_COUNT)
> +#define CLOCK_PLL	(FIXED_BASE + FIXED_COUNT)
> +
> +/* The total number of clocks in the clk_hw[] array */
> +#define CLOCK_COUNT	(GATE_COUNT + FIXED_COUNT + 1)
> +
> +struct tc9564_clock {
> +	void __iomem *ioaddr;	/* Mapped clock/reset registers */
> +	spinlock_t lock;	/* Protects reset register updates */
> +	struct clk_hw_onecell_data *clk_data;

I think it would be more readable to have 3 different pointers here:
- struct clk_hw_onecell_data *clk_pll_data;
- struct clk_hw_onecell_data *clk_fixed_rate_data;
- struct clk_hw_onecell_data *clk_gate_data;

(using the same logic you implemented for fixed_init, gate_init stucts).

Doing so, I guess the code that is allocating the clock data would be
easier to manage.


> +	struct reset_controller_dev rcdev;
> +};
> +
> +/* Indexes into the fixed_init[] array */
> +enum fixed_clock {
> +	CLOCK_62_5M,
> +	CLOCK_125M,
> +	CLOCK_250M,
> +	CLOCK_312_5M,
> +};
> +
> +struct fixed_init {
> +	const char *name;
> +	unsigned int div;	/* Rate is PLL rate divided by this */
> +};
> +
> +struct gate_init {
> +	const char *name;
> +	enum fixed_clock parent;
> +	u8 offset;		/* Control register offset (0x0 or 0x8) */
> +	u8 bit;			/* Bit in the control register (0-31) */
> +	bool critical;
> +};
> +
> +struct reset_init {
> +	u8 offset;		/* Control register offset (0x4 or 0xc) */
> +	u8 bit;			/* Bit in the control register (0-31) */
> +};
> +
> +/* Add FIXED_BASE to index values to get their index into the clk_hw[] a=
rray */
> +static const struct fixed_init fixed_init[] =3D {
> +	[CLOCK_312_5M] =3D {
> +		.name =3D "312.5MHz",
> +		.div =3D 4,
> +	},
> +	[CLOCK_250M] =3D {
> +		.name =3D "250MHz",
> +		.div =3D 5,
> +	},
> +	[CLOCK_125M] =3D {
> +		.name =3D "125MHz",
> +		.div =3D 10,
> +	},
> +	[CLOCK_62_5M] =3D {
> +		.name =3D "62.5MHz",
> +		.div =3D 20,
> +	},
> +};
> +#define FIXED_COUNT	ARRAY_SIZE(fixed_init)
> +
> +/* Add GATE_BASE to index values to get their index into the clk_hw[] ar=
ray */
> +static const struct gate_init gate_init[] =3D {
> +	[CLOCK_MAC0_TX] =3D {
> +		.name =3D "MAC0-TX",
> +		.parent =3D CLOCK_312_5M,
> +		.offset =3D CLOCK0_OFFSET,
> +		.bit =3D 7,
> +	},
> +	[CLOCK_PCIE] =3D {
> +		.name =3D "PCIe",
> +		.parent =3D CLOCK_250M,
> +		.offset =3D CLOCK0_OFFSET,
> +		.bit =3D 9,
> +		.critical =3D true,
> +	},
> +	[CLOCK_I2C] =3D {
> +		.name =3D "i2c",
> +		.parent =3D CLOCK_62_5M,
> +		.offset =3D CLOCK0_OFFSET,
> +		.bit =3D 12,
> +		.critical =3D true,
> +	},
> +	[CLOCK_MAC0_RX] =3D {
> +		.name =3D "MAC0-RX",
> +		.parent =3D CLOCK_312_5M,
> +		.offset =3D CLOCK0_OFFSET,
> +		.bit =3D 14,
> +	},
> +	[CLOCK_MSIGEN] =3D {
> +		.name =3D "msigen",
> +		.parent =3D CLOCK_125M,
> +		.offset =3D CLOCK0_OFFSET,
> +		.bit =3D 18,
> +	},
> +	[CLOCK_MAC0_125M] =3D {
> +		.name =3D "MAC0-125MHz",
> +		.parent =3D CLOCK_125M,
> +		.offset =3D CLOCK0_OFFSET,
> +		.bit =3D 29,
> +	},
> +	[CLOCK_MAC0_ALL] =3D {
> +		.name =3D "MAC0-ALL",
> +		.parent =3D CLOCK_250M,
> +		.offset =3D CLOCK0_OFFSET,
> +		.bit =3D 31,
> +	},
> +	[CLOCK_MAC1_TX] =3D {
> +		.name =3D "MAC1-TX",
> +		.parent =3D CLOCK_312_5M,
> +		.offset =3D CLOCK1_OFFSET,
> +		.bit =3D 7,
> +	},
> +	[CLOCK_MAC1_RX] =3D {
> +		.name =3D "MAC1-RX",
> +		.parent =3D CLOCK_312_5M,
> +		.offset =3D CLOCK1_OFFSET,
> +		.bit =3D 14,
> +	},
> +	[CLOCK_MAC1_125M] =3D {
> +		.name =3D "MAC1-125MHz",
> +		.parent =3D CLOCK_125M,
> +		.offset =3D CLOCK1_OFFSET,
> +		.bit =3D 29,
> +	},
> +	[CLOCK_MAC1_ALL] =3D {
> +		.name =3D "MAC1-ALL",
> +		.parent =3D CLOCK_250M,
> +		.offset =3D CLOCK1_OFFSET,
> +		.bit =3D 31,
> +	},
> +};
> +#define GATE_COUNT	ARRAY_SIZE(gate_init)
> +
> +static const struct reset_init reset_init[] =3D {
> +	[RESET_MAC0_MAC] =3D {
> +		.offset =3D RESET0_OFFSET,
> +		.bit =3D 7,
> +	},
> +	[RESET_PCIE] =3D {
> +		.offset =3D RESET0_OFFSET,
> +		.bit =3D 9,
> +	},
> +	[RESET_I2C] =3D {
> +		.offset =3D RESET0_OFFSET,
> +		.bit =3D 12,
> +	},
> +	[RESET_MSIGEN] =3D {
> +		.offset =3D RESET0_OFFSET,
> +		.bit =3D 18,
> +	},
> +	[RESET_MAC0_PMA] =3D {
> +		.offset =3D RESET0_OFFSET,
> +		.bit =3D 30,
> +	},
> +	[RESET_MAC0_XPCS] =3D {
> +		.offset =3D RESET0_OFFSET,
> +		.bit =3D 31,
> +	},
> +	[RESET_MAC1_MAC] =3D {
> +		.offset =3D RESET1_OFFSET,
> +		.bit =3D 7,
> +	},
> +	[RESET_MAC1_PMA] =3D {
> +		.offset =3D RESET1_OFFSET,
> +		.bit =3D 30,
> +	},
> +	[RESET_MAC1_XPCS] =3D {
> +		.offset =3D RESET1_OFFSET,
> +		.bit =3D 31,
> +	},
> +};
> +#define RESET_COUNT	ARRAY_SIZE(reset_init)
> +
> +/* Caller must free the returned pointer if non-null */
> +static const char *clock_name(struct device *dev, const char *name)
> +{
> +	return kasprintf(GFP_KERNEL, "%s-%s", dev_name(dev), name);
> +}

nit: clock_name() is running just during probe, I would prefer to use
dev_kasprintf() instead and get rid of the related kfree(). Moreover,
clock_name() is just a wrapper around kasprintf(), do we really need it?

> +
> +/* Initialize the PLL (parent is the input oscillator); called from prob=
e */
> +static int pll_init(struct device *dev, struct tc9564_clock *clock)
> +{
> +	struct clk_hw *hw;
> +	const char *name;
> +
> +	/* Initialize the PLL clock first (input oscillator is parent) */
> +	name =3D clock_name(dev, "pll");
> +	if (!name)
> +		return -ENOMEM;
> +
> +	hw =3D devm_clk_hw_register_fixed_factor_index(dev, name, 0, 0, 50, 1);
> +	kfree(name);
> +	if (IS_ERR(hw))
> +		return dev_err_probe(dev, PTR_ERR(hw),
> +				     "failed to register pll\n");
> +
> +	clock->clk_data->hws[CLOCK_PLL] =3D hw;
> +
> +	return 0;
> +}
> +
> +/* Initialize the fixed rate clocks (PLL is parent); called from probe */
> +static int fixed_clock_init(struct device *dev, struct tc9564_clock *clo=
ck)
> +{
> +	struct clk_hw_onecell_data *clk_data =3D clock->clk_data;
> +	struct clk_hw *pll_hw =3D clk_data->hws[CLOCK_PLL];
> +	const char *name;
> +
> +	for (u32 i =3D 0; i < FIXED_COUNT; i++) {
> +		const struct fixed_init *init =3D &fixed_init[i];
> +		struct clk_hw *hw;
> +
> +		name =3D clock_name(dev, init->name);
> +		if (!name)
> +			return -ENOMEM;
> +
> +		hw =3D devm_clk_hw_register_fixed_factor_parent_hw(dev, name,
> +								 pll_hw, 0,
> +								 1, init->div);
> +		kfree(name);
> +		if (IS_ERR(hw))
> +			return dev_err_probe(dev, PTR_ERR(hw),
> +					     "failed to register %s\n",
> +					     init->name);
> +
> +		clk_data->hws[FIXED_BASE + i] =3D hw;
> +	}
> +
> +	return 0;
> +}
> +
> +/* Initialize the gate clocks; called from probe */
> +static int gate_clock_init(struct device *dev, struct tc9564_clock *cloc=
k)
> +{
> +	struct clk_hw_onecell_data *clk_data =3D clock->clk_data;
> +	struct clk_hw *parent_hw;
> +	const char *name;
> +
> +	for (u32 i =3D 0; i < GATE_COUNT; i++) {
> +		const struct gate_init *init =3D &gate_init[i];
> +		unsigned long flags;
> +		struct clk_hw *hw;
> +		void __iomem *reg;
> +		u32 parent_index;
> +
> +		name =3D clock_name(dev, init->name);
> +		if (!name)
> +			return -ENOMEM;
> +
> +		/* Each gate clock's parent is a fixed rate clock */
> +		parent_index =3D FIXED_BASE + init->parent;
> +		parent_hw =3D clk_data->hws[parent_index];
> +		flags =3D init->critical ? CLK_IS_CRITICAL : 0;
> +		reg =3D clock->ioaddr + init->offset;
> +
> +		hw =3D devm_clk_hw_register_gate_parent_hw(dev, name, parent_hw,
> +							 flags, reg, init->bit,
> +							 0, NULL);
> +		kfree(name);
> +		if (IS_ERR(hw))
> +			return dev_err_probe(dev, PTR_ERR(hw),
> +					     "failed to register %s\n",
> +					     init->name);
> +
> +		clk_data->hws[GATE_BASE + i] =3D hw;
> +	}
> +
> +	return 0;
> +}
> +
> +static int reset_update(struct reset_controller_dev *rcdev,
> +			unsigned long id, bool assert)
> +{
> +	const struct reset_init *reset;
> +	struct tc9564_clock *clock;
> +	unsigned long flags;
> +	void __iomem *reg;
> +	u32 mask;
> +	u32 val;
> +
> +	/* Warn on any attempt to change state of a critical reset */
> +	if (WARN_ON(id =3D=3D RESET_I2C) || WARN_ON(id =3D=3D RESET_PCIE))
> +		return 0;
> +
> +	clock =3D dev_get_drvdata(rcdev->dev);
> +	reset =3D &reset_init[id];
> +	reg =3D clock->ioaddr + reset->offset;
> +	mask =3D BIT(reset->bit);
> +
> +	spin_lock_irqsave(&clock->lock, flags);
> +
> +	val =3D readl(reg);
> +	if (assert)
> +		val |=3D mask;
> +	else
> +		val &=3D ~mask;
> +	writel(val, reg);
> +
> +	spin_unlock_irqrestore(&clock->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int reset_assert(struct reset_controller_dev *rcdev, unsigned lon=
g id)
> +{
> +	return reset_update(rcdev, id, true);
> +}
> +
> +static int reset_deassert(struct reset_controller_dev *rcdev, unsigned l=
ong id)
> +{
> +	return reset_update(rcdev, id, false);
> +}
> +
> +static int reset_status(struct reset_controller_dev *rcdev, unsigned lon=
g id)
> +{
> +	struct tc9564_clock *clock =3D dev_get_drvdata(rcdev->dev);
> +	const struct reset_init *reset =3D &reset_init[id];
> +	void __iomem *reg;
> +
> +	reg =3D clock->ioaddr + reset->offset;
> +
> +	return readl(reg) & BIT(reset->bit) ? 1 : 0;
> +}
> +
> +static const struct reset_control_ops reset_control_ops =3D {
> +	.assert =3D reset_assert,
> +	.deassert =3D reset_deassert,
> +	.status =3D reset_status,
> +};
> +
> +static int tc9564_clk_probe(struct platform_device *pdev)
> +{
> +	struct clk_hw_onecell_data *clk_data;
> +	struct reset_controller_dev *rcdev;
> +	struct tc9564_clock *clock;
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *np;
> +	int ret;
> +
> +	np =3D dev_of_node(dev);
> +	if (!np)
> +		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
> +
> +	clock =3D devm_kzalloc_obj(dev, *clock);
> +	if (!clock)
> +		return -ENOMEM;
> +
> +	clock->ioaddr =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(clock->ioaddr))
> +		return dev_err_probe(dev, PTR_ERR(clock->ioaddr),
> +				     "failed to map registers\n");
> +
> +	clk_data =3D devm_kzalloc_flex(dev, *clock->clk_data, hws,
> +				     CLOCK_COUNT);
> +	if (!clk_data)
> +		return -ENOMEM;
> +	clk_data->num =3D CLOCK_COUNT;
> +
> +	clock->clk_data =3D clk_data;
> +
> +	/* We need the driver data pointer to initialize clocks and resets */
> +	dev_set_drvdata(dev, clock);
> +
> +	/* Set up the clocks and register the provider */
> +	ret =3D pll_init(dev, clock);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D fixed_clock_init(dev, clock);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D gate_clock_init(dev, clock);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_dat=
a);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to add clock provider\n");
> +
> +	/* Set up and register the reset controller */
> +	rcdev =3D &clock->rcdev;
> +	rcdev->ops =3D &reset_control_ops;
> +	rcdev->owner =3D THIS_MODULE;
> +	rcdev->dev =3D dev;
> +	rcdev->of_node =3D np;
> +	rcdev->nr_resets =3D RESET_COUNT;
> +
> +	spin_lock_init(&clock->lock);
> +
> +	ret =3D devm_reset_controller_register(dev, rcdev);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to register reset controller\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id tc9564_clock_match[] =3D {
> +	{ .compatible =3D "toshiba,tc9564-clock", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, tc9564_clock_match);
> +
> +static struct platform_driver tc9564_clk_driver =3D {
> +	.probe =3D tc9564_clk_probe,
> +	.driver =3D {
> +		.name =3D KBUILD_MODNAME,
> +		.of_match_table =3D tc9564_clock_match,
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +};
> +module_platform_driver(tc9564_clk_driver);
> +
> +MODULE_DESCRIPTION("Toshiba TC9564 Clock Driver");
> +MODULE_LICENSE("GPL");
> --=20
> 2.53.0
>=20

--3x9W0WwUhC0uDOCg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCawgCFAAKCRA6cBh0uS2t
rAo2AQD3jqzJLhKAEQor/UcOwnEjcIUpISqricIT/yi1SQ9QWwD9FpFeI+0axz4a
DprorhdOAOe19tlszNprr4UbkRWT6QM=
=pHfb
-----END PGP SIGNATURE-----

--3x9W0WwUhC0uDOCg--
