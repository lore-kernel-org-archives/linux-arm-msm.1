Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802501;
	b=zdnFPrX+zCPECf5UniF7NBQMLnlTxogpwfGaxNVWOZq6hEhZI2X/SM64hfKMYDfUarYj
	 UiuLcw6/0biZiw3xleWMZIL0nC+D/CX8Fowih2MaNb6iC6kLds43u8c1hBQhBsOjooM+7
	 xvpuk7AOYTR8dzJ2WRHgGpAG3csf10dW2nT5qV/X7MWQ+gehehJSCwIObjfhM4bwKfyOD
	 VwQ8zMnCTXY8BSuJqr62bw0/Bnk2N/Ekblw1S7meI7aPWLjrMK3Q5mqr77rTz7hUNjZvl
	 rS8h3LBUEUYDTZpkBd4Y5gkmmSOSiJBODfEsLYfXm7N37mdFG5GDvssxT6x4RpavL8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=fsNoUHPpGo1gHz1gAcdVPTu3hkJcEuLuYD2db/66XEI=;
	b=BudQhjpcNQFRq3CtmRKXcC/+LYCVNgZh3njKeqES8L892pbETmKPtKGrwLz0TVZBaZhC
	 2WzpLUG5OBkR4bjymi6k3GW4OuVRnmbRpBXT3iDpuFPXJWyS7B8oxkojYKf8yje65rFMC
	 XKLUNume3uUHRZnYELTmgo6DkRuUmA7OzL6uXaTjbc11Sf2dkvdgYNdQ6P9kDarfm/F2n
	 VtodbdYkyBGVkoGPSc/IemXLIofLWcmdD1ypr9T1IzFwJ7yo6sap/naFu/4kx95UefXw+
	 pqBvkN/VHfE49cQ0GLmLTEx7J1rXVNgNNmHaoN7rufNVswzt50/lRmguqrrozFMl3cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dKxCSoOQ;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB340606A326
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 18:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB340606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dKxCSoOQ
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso44773575e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795802499; x=1796407299; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fsNoUHPpGo1gHz1gAcdVPTu3hkJcEuLuYD2db/66XEI=;
        b=dKxCSoOQwJY4+C9ZrIn428uzPaSbrcuceYsjSLJIHTG8/Vl6PTA1WVNHaJUAa0sxVo
         zs6EqHR9E8Wyd3mJva38/SQrjM4FzsDZbINuoFZNtQ8nQvSmGrlwYddn4uvg5mwizuFp
         qsJhus/e5OKeyi5ElnkQ/2rMAH9ojoBaSw2eemDnCwYzeOGGufOxFE4fIhqxEeLu28Sh
         guhaJd8c/DYLGSEEhLiy6uOGH9zL8hGUt3r/fKFRjlOch5ZidbPnbvaq4aB6RWgjnKLu
         BaC2/RRPWCiW5kxsgkmSK34Bp5u9asihDQaF2LtMYpORq68eZwqB2dqUuwTNJ9iQs1eL
         +W8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802499; x=1796407299;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fsNoUHPpGo1gHz1gAcdVPTu3hkJcEuLuYD2db/66XEI=;
        b=Lr2Rccul8xxku2s3+patt9j68K+RZtRV2PRg0Ur7eHpwwNm48Cou7O25lOfPJuHDIF
         BBF5ukqrlbWVIIthKeLNYKsZBssCoqPyDxakbD+YcqRWQCHUHFhoHJYC5ttNp6Bvhgit
         AvAJpfwnhH55bcQ4kXUSjpTPeNR9rAIlE/1t7Q7pa83Yg4KfzLVx1/o/uokYmGb1izu1
         bbK2Rd1GhSDNh06jdpqhDqf+18FRyu1bSoazpEmEcJdDLSgIV+vzeP9qFkBZ7NFEKd+t
         xv1Ug6eOUshdpUXSYV8XZ2EbZwUL1Oyfq5EHZ+a45zg4F5wnqPOC9BxW4YRkf4IBFmhQ
         JNyQ==
X-Forwarded-Encrypted: i=1; AL+hErGMawjlZ/Ao4WhLbxVVRgnNJe8BVOQJoIeEwoCyA4gonFYc7+0pqzWhXQ5Xw4IV/59stioL7QaHGdr1dgZ+@vger.kernel.org
X-Gm-Message-State: APuU4Z9bDehbrwnZ2LvExYQlHNXuROlJgOnOwPjalxhKjoRqEgKoY6+g
	yOonyZQsBNeWluYyuv5iJxAarh8uvlp5fMnpIATGKKgyGluDoZkro6fqnATVswadBYVYEd/INgD
	2EMbrPkY=
X-Gm-Gg: AZFdTZdSzPC5VSrdl/+2Rv7l9ZFugzn+x9tewvJWdqt4W9kbriMCPd/rFLifsCUHfeT
	U1FqSdsBNey0g7nge1fmfPQsaBF3GLppO5NthIrvxJB7F/ekFWr3+RHKK2MTQCrn6AgdqHBc9no
	Q08D5PCartAPrJGc46s7l4dVWDlEZK9qXFZgOzqHqsJ+ljPgESyPYFDVYKwsfcIEy8cHba4c1JI
	yUZOdfKnkrMtSUlzYZBvpdK381xlwSHiJtODN/7PuiZyVHIhOBwLn5psHXhlP0KxWFOtk8Pnlej
	2x5PopUIbYf4Iv7Oqqw41nJujVxdvOIY6buf70Qgqk2OfIO3u7iO16Uxd5jC4rGkhOJ7QuuCRog
	N/gFZXIZPRTIhw/Z5XM4Q59YxDNuoeC9idi8gwd92KkbjORNIY4mHw5OEwqEBCFPjva9yIBVip9
	qbZJHOKmb0XE6Iu4jKwKvtEh8j8/saAPSGENYizoNGHR7SoIRWihnNMcOfTf6jJ59Xv9Db0drVH
	RyPB9ZHzsaCNjFlxXi4/fQh+3MyUsjgLM4183SYD6J8xnM5t6DEGCougfSuVrdJ7Alo9OsXnm81
	hw54Kn8JUG4UHNGTBFlGr/WW8MNHITSVP7k5NOuDb3vdwhYA
X-Received: by 2002:a05:600c:8486:b0:4ac:aae6:6401 with SMTP id 5b1f17b1804b1-4bb8880606fmr521206445e9.12.1795802498933;
        Fri, 27 Nov 2026 10:01:38 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm832738955e9.11.2026.11.27.10.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:01:38 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 1/3] dt-bindings: toshiba: introduce
 toshiba,tc9564-clock.yaml
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alex Elder <elder@riscstar.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, andersson@kernel.org, konradybcio@kernel.org, 
 abelvesa@kernel.org, daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, 
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com, 
 alexandre.torgue@foss.st.com, marex@nabladev.com, 
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261125202141.1288493-2-elder@riscstar.com>
References: <20261125202141.1288493-1-elder@riscstar.com>
 <20261125202141.1288493-2-elder@riscstar.com>
Date: Fri, 27 Nov 2026 19:01:35 +0100
Message-Id: <179580249573.2809466.11034484697919897942.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6124; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=geWxMicG6uVAdhcEualT0NzvyoAmaPCiuckBB8B5yvQ=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcRxul7Xh+dZasndPvIcma4mp8cO+Pq9KHrhavfhO6K
 e9E7PaJHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZjItimMDIuUQ7gT3BbFLlqw
 7s2d/5M/7/KoX7shWK5yVYKMkdrFVDWG/65Z13T7Xl9l7purknKx6MW58le7Tt+onPdZf3bbpYM
 tDBwA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Define the binding for the clock and reset controller that present in
> the Toshiba TC9564 SoC.
> 
> Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v3: - Added Lorenzo's Reviewed-by
>     - Changed to @kernel.org e-mails for Daniel and me
>     - Only the gated clock IDs are now published in "toshiba,tc9564.h";
>       the PLL and internal fixed clocks are implemented and accessed
>       only within "clk-tc9564.c"
> 
>  .../bindings/clock/toshiba,tc9564-clock.yaml  | 73 +++++++++++++++++++
>  MAINTAINERS                                   |  8 ++
>  include/dt-bindings/clock/toshiba,tc9564.h    | 40 ++++++++++
>  3 files changed, 121 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
>  create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h
>
> diff --git a/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml b/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
> new file mode 100644
> index 000000000000..026ed949f0f0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/toshiba,tc9564-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba TC9564 Clock and Reset Controller
> +
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> +  - Alex Elder <elder@kernel.org>
> +  - Daniel Thompson <danielt@kernel.org>
> +
> +description:
> +  The Toshiba TC9564 is an SoC accessed by a host system through the
> +  upstream PCIe port on the PCIe switch it implements.  The chip includes
> +  an embedded PCIe endpoint that provides access to various peripherals
> +  within the SoC via its BARs.  These peripherals include a simple
> +  controller to gate internal clocks, and a reset controller.
> +
> +  The TC9564 chip has a single input clock.  Internally that clock is
> +  multiplied by a PLL, and the PLL signal is divided internally into
> +  a set of fixed rate, always-on clocks.
> +
> +  The clock controller exposes a set of simple gated clocks, which are
> +  controlled by two registers.  Each is derived from one of the internal
> +  fixed-rate clocks.  A total of 21 gated clocks are implemented within
> +  the chip, but support for enabling and disabling only a subset of them
> +  is provided at this time.  Two clocks (I2C and PCIE) are marked critical
> +  to make it clear that they should never be disabled.
> +
> +  The reset controller uses two other registers to control a set of 13
> +  resets that can be asserted or deasserted.  Here too, only a subset
> +  of the resets can currently be managed, and the I2C and PCIE resets
> +  are treated as critical.
> +
> +  Clock and reset IDs are defined <dt-bindings/clock/toshiba,tc9564.h>.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: toshiba,tc9564-clock
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - "#clock-cells"
> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@1004 {
> +        compatible = "toshiba,tc9564-clock";
> +        reg = <0x1004 0x10>;
> +        clocks = <&tc9564_xo_board>;
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065..4d1f4cbfd731 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28332,6 +28332,14 @@ F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.yaml
>  F:	drivers/media/i2c/tc358743*
>  F:	include/media/i2c/tc358743.h
>  
> +TOSHIBA TC9564 CLOCK/RESET CONTROLLER DRIVER
> +M:	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> +M:	Alex Elder <elder@kernel.org>
> +M:	Daniel Thompson <danielt@kernel.org>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
> +F:	include/dt-bindings/clock/toshiba,tc9564.h
> +
>  TOSHIBA TC9564 PCI DRIVER
>  M:	Alex Elder <elder@kernel.org>
>  M:	Daniel Thompson <danielt@kernel.org>
> diff --git a/include/dt-bindings/clock/toshiba,tc9564.h b/include/dt-bindings/clock/toshiba,tc9564.h
> new file mode 100644
> index 000000000000..7de8c8165199
> --- /dev/null
> +++ b/include/dt-bindings/clock/toshiba,tc9564.h
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +/*
> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
> + */
> +
> +#ifndef __CLOCK_TOSHIBA_TC9564_H__
> +#define __CLOCK_TOSHIBA_TC9564_H__
> +
> +/* Clock IDs */
> +
> +#define CLOCK_I2C		0	/* critical */

Name seems a touch too generic.
If everybody named clock this way, we would be very likely to get collision
in the DTS.

suggest TC9564_CLK_XXX

> +#define CLOCK_PCIE		1	/* critical */
> +#define CLOCK_MSIGEN		2
> +
> +#define CLOCK_MAC0_TX		3
> +#define CLOCK_MAC0_RX		4
> +#define CLOCK_MAC0_125M		5
> +#define CLOCK_MAC0_ALL		6
> +
> +#define CLOCK_MAC1_TX		7
> +#define CLOCK_MAC1_RX		8
> +#define CLOCK_MAC1_125M		9
> +#define CLOCK_MAC1_ALL		10
> +
> +/* Reset IDs */
> +
> +#define RESET_I2C		0	/* critical */
> +#define RESET_PCIE		1	/* critical */
> +#define RESET_MSIGEN		2
> +
> +#define RESET_MAC0_MAC		3
> +#define RESET_MAC0_PMA		4
> +#define RESET_MAC0_XPCS		5
> +
> +#define RESET_MAC1_MAC		6
> +#define RESET_MAC1_PMA		7
> +#define RESET_MAC1_XPCS		8

Those ids do not belong in include/dt-bindings/clock/

> +
> +#endif /* __CLOCK_TOSHIBA_TC9564_H__*/

Nit: missing space before the closing */ in the comment.

-- 
Jerome

