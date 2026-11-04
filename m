Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778382;
	b=q/NpPzBMb/Hyt5N9rO2lpmeZKVEvZrQRT9Jkug6rqOTDOFfWmngGDtF0ikSn+FcW6Mt7
	 v5AhSd7etX28Roo1qFnSAihMi8vGTCKQkdimDJmjqhPAUEM6l7V6V+rCdkTwTvkvsbdzg
	 v3rM5YMfm3yp3k7snlQepK4cQJh/cgYYm3vXulsoXMhaUMWgLyC+uQF8e0gpmI7XdLQV8
	 kH7cUJi6PRBQrbK1RboxcFwN6xJcAlKzSawRVXgp6G5Rl4oV8F3Tjdrbhq7mn1vnDoJSW
	 dinEqG2PBsXOMb5OtsMmWqkRPm277Qcbw+GfEYn1OQLqqy+Xg+ieJ53Ek8IX0BQbCoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=S+x6qxNQDI8X9419/RDkU2EfFf+KlNnBBqU1zpiR2vI=;
	b=Jl0ZkRQ66QIOjDgnf8kP70asJr5Bk4Ec4KJsD6BxeSjJhpKFIYDTpijPI2aZ9d4uhZU+
	 ga0TkqfUkj6nMTODk0Oiew952jsDdgmHMxv/8zdTFKhAX0YF0sGKKyLE/mhBRtPIDRn2v
	 uM5csa5ig1aEjB8iCcZfZLqjDygn06YgaIjkn/C22JtFg53Mn3XrUzhC2VGOqx3aUlqAt
	 G4tJoXIzGhaZzq35zMlYVz0JVq9hPRNWEVGNeUU5w8puwE7IKj1/lJupYFWyZjBAH9jeK
	 Et6nrO4f1yuh58bkUm30MILRTgowo/RpYyJgWUcx6So48443I3DRZwqlv0C2nmJBmtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GM7iVvK6;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD5B606A32F
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 07:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AD5B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GM7iVvK6
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36c9a93a1abso315389eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 23:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778381; x=1794383181; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S+x6qxNQDI8X9419/RDkU2EfFf+KlNnBBqU1zpiR2vI=;
        b=GM7iVvK6UGYRfYwjGjDsFFI2QHEuoujWoCh40Qmzr1fDH15kAebXMOgCnPY5D8V439
         kvgWs2/JaP+5cpassEqcTJGtc8zSW3MzM2RGwkdt+9qRvNtm57hC/PNnJg8fXMyQLjdH
         4SKdjED2hlEEsWx3fMa6kUcHH1XlcG6WRBr7+dJ6dCs4Bumf7LB1nfECl7S98FDdL7jL
         27fK22PiLvGeQIHsxGwIuW7a8l1ZgPvE3bhzlG2ZLMcrYU0hLiyPuM4eapOdkXrpEiK7
         WsqraqrmeUeyHPe7l5zASGpwL05PIzWcvY/1ezmt5qMwY6AOwVie2HCuca87Kz6Ar1Wg
         3dhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778381; x=1794383181;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S+x6qxNQDI8X9419/RDkU2EfFf+KlNnBBqU1zpiR2vI=;
        b=DNl755UW7dy4h+qZy8NlqWkIRrH7dFszj5XSslxzm9urRR91um8ImQ+jtAru3c3U4w
         oKe0Zz4RQxnBLY9SS52+wVO0i/4Vk7k5EVbIcXL+LkTfTKsUImLlB6I1qSzcZB5aD7NM
         bm4xZPSKnlcX9fevKU8tWS4QVUVaP/qNZ5gWFCjN4ggSjA6+q3LAUJyegGZdVtHtjfT6
         28pvNNpF5oCdVdLFhKQJgnHhCgR/ubAp6kxDkMdOYWlI+yGBN6zq+zxnUfxdFFRIHRMS
         HOA9qMQ5p4ybyBcnXZFmxqv8rZizIBr1xyOPVQ+kf4tnKea6LRkQmcG+br9gijOe8SDY
         EsMQ==
X-Gm-Message-State: APuU4Z85U5iXPE8hEIPooi9FG3siSkcetArbjWtTjkNo0FPZakkB9g1F
	somaPpqhQzY2/aIQAuhlnnEJkn8O1qkvDql2rs2ZuT7itQ7D7NZC0XTA
X-Gm-Gg: AYBFou18/6K+bBURr5/5wM11/6g5eNZ0eUmb3/zhW+0awj9JzKNiPhPCk9hF5lH+rTm
	nQtgStrY8E7AkNo3oQD+LDraEM4EW+4h9w47+rQsjZEWAI1rCMR9hqQUBOnr4aGaOksTd+geyGm
	8YqK9EyB7INfI/mMhLlIoP4hX+C2SDNfVLQN9M4U0U2421AWB3IcWt1nouk2YiCFFAUT8v1zYR1
	v+L8+RdOe9YhQvJbaHGaYt0R/0DTuda8lg26bIzMVXEWkS7xAQe7N4sF2BUfzeNFhVXKv7fLUiY
	gCMKxTkLTGlinrRhEyegesruNLRtblXCseHwXUuUCwEhrnaR50aRvV6T1s3St8o3yUut/RdAFvh
	e/afKXiLWEUsWGdtpcERfpEL4+wAi9FPWsL7ZCCW6sYl0/t8cx2HkpzRtaFqPFbKXQYRkx3PoMH
	YB/zQo3HEjH3G5mpZp2EmS+pXigPET0nxK2bEfsof0tFiv1kNutx9tcfP86d/10b1QHXSRq0SD/
	f1f7IjmTxfQXe/z14sUUJwBODhDXS9yfHe+VBJnigDn+cM73zuRkeyXlvr/bpBwWwU5E7YW2uKW
	8k6Y5aI6C4kwITyiPx/wvMAMIyqC5syaz72Kh3cIptnxEYILEmQh7r+L2zSck/x8yc5X84JjzBh
	Tkl6ePw==
X-Received: by 2002:a05:7301:23a6:b0:36c:a39e:fcf9 with SMTP id 5a478bee46e88-36ca39f00ecmr2531535eec.8.1793778381456;
        Tue, 03 Nov 2026 23:46:21 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.204.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a67edsm4566016eec.8.2026.11.03.23.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:46:20 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v12 0/6] Add initial support for Qualcomm SM7250 SoC
Date: Wed, 04 Nov 2026 07:46:03 +0000
Message-Id: <20261104-master-v12-0-57fbe9eef978@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIALzi6moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDI10FJSSM
 xLz0lN1M1OAAkpGBkZmhoYGJrq5icUlqUW6pskpRimWyUkGickWSkDFBUWpaZkVYJOiY2trAWA
 Gv35ZAAAA
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793778372; l=6866;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=R1dhX5JbUMHvKu/MupaHu+YfQPZ+VXmXHq+cGAjavtA=;
 b=wTe5JCMSJDIBrfir08X+CflO5XCH+38PYn1/dbIo7kqXlXBKhfzYT0p6fZA4vBcS1d+x8ZviW
 ap932+ga3SoCl4nQUY2POWiiy16YDK+rlegZDJZCvMnr5sSYRVQnA23
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

This patchset introduces foundational upstream support for the Qualcomm SM7250
SoC (internally codenamed Lito).

SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
and 6x Silver Cortex-A55) and Adreno 620 GPU.

This patchset is organized as follows:
> Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC,
RPMh clocks/power domains, GCC and cpufreq hardware).
> Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
interrupt controllers, clock providers, power domains, and reserved memory.

>-----------------------------------------------------------------------------<
Merged patches:
dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
soc: qcom: socinfo: Add SM7250 SoC ID
dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible
clk: qcom: rpmh: Add SM7250 rpmh clocks
dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
pmdomain: qcom: rpmhpd: Add RPMh power domains
dt-bindings: arm: cpus: Document Kryo 475 CPUs
dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC

Pending patches:
dt-bindings: clock: Add SM7250 global clock controller
clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
dt-bindings: firmware: qcom,scm: Document SM7250 SCM
dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
dt-bindings: thermal: lmh: Document SM7250 LMh
arm64: dts: qcom: Add SM7250 devicetree file
>------------------------------------------------------------------------------<

Changelog [v12]:
[PATCH v12 1/6] dt-bindings: clock: Add SM7250 global clock controller
> Move dt-binding definition to qcom,gcc-sm8250.yaml. The device tree
schema of SM7250 matches with SM8250 for clock-controller node.
[PATCH v12 5/6] dt-bindings: thermal: lmh: Document SM7250 LMh
> Add LMh compatible.
[PATCH v12 6/6] arm64: dts: qcom: Add SM7250 devicetree file
> Remove cluster wise sorting of cpus.
> Add LMh node.

Link [RESEND v11]: https://lore.kernel.org/linux-arm-msm/20261029-master-v11-0-2c29e382162c@gmail.com/T/#t
Link [v11]: https://lore.kernel.org/linux-arm-msm/20261016042432.824-1-sreeshankar0910@gmail.com/T/#t
Changelog [v11]:
[PATCH v11 2/5] clk: qcom: Add Global Clock Controller (GCC) driver
> Drop hw_ctl clock branches
> Populate default values for GDSCs

Link [v10]: https://lore.kernel.org/linux-arm-msm/20261015051926.13752-1-sreeshankar0910@gmail.com/T/#t
Changelog [v10]:
[PATCH v10 2/6] clk: qcom: Add Global Clock Controller (GCC) driver
> Update .halt_check and .ops are per the review.

Link [v9]: https://lore.kernel.org/linux-arm-msm/20260901092447.3028-1-sreeshankar0910@gmail.com/T/#t
Changelog [v9]:
[PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> Make all clk_init_data instances const across the driver.

Link [v8]: https://lore.kernel.org/linux-arm-msm/20260901070717.20513-1-sreeshankar0910@gmail.com/T/#t
Changelog [v8]:
Same as v7. Resending the full patchset as v8 due to a transmission interruption during v7.

Link [v7]: https://lore.kernel.org/linux-arm-msm/20260901064357.20055-1-sreeshankar0910@gmail.com/T/#t
Changelog [v7]:
[PATCH v7 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> Fixed missing (struct device *dev) in gcc_sm7250_clk_regs_configure

Link [v6]: https://lore.kernel.org/linux-arm-msm/20260824150156.1310-1-sreeshankar0910@gmail.com/T/#t
Changelog [v6]:
[PATCH v6 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> Make all clk_init_data instances const across the driver.

Link [v5]: https://lore.kernel.org/linux-arm-msm/20260824130437.2771-1-sreeshankar0910@gmail.com/T/#t
Changelog [v5]:
[PATCH v5 13/13]: arm64: dts: qcom: Add SM7250 devicetree file
> Reformat multi-entry phandle lists (domain-idle-states) to '<&a>, <&b>'.
> Reformat multi-entry tuples and string lists (qcom,pdc-ranges, qcom,tcs-config, reg-names)
  to one item per line.
> Enable QUPv3 wrapper globally by dropping 'status = "disabled"'.
> Move compatible property to first.
> Remove clock-frequency property for timer.

Link [v4]: https://lore.kernel.org/linux-arm-msm/20260821154030.2514-1-sreeshankar0910@gmail.com/T/#t
Changelog [v4]:
[PATCH v4 04/13] clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> Update .fw_name with .index
[PATCH v4 13/13] arm64: dts: qcom: Add SM7250 devicetree file
> Added missing capacity-dmips-mhz and dynamic-power-coefficient for cpu@300
> Added power-domains for cpus and apps_rsc

Link [v3]: https://lore.kernel.org/linux-arm-msm/20260821081125.4522-1-sreeshankar0910@gmail.com/T/#t
Changelog [v3]:
[PATCH v3 04/13] clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> Updated the way of registering critical clocks.
> Made some more clock critical.
        GCC_VIDEO_XO_CLK
        GCC_CAMERA_XO_CLK
        GCC_DISP_XO_CLK
        GCC_NPU_CFG_AHB_CLK
        GCC_CPUSS_AHB_CLK
        GCC_NPU_BWMON_CFG_AHB_CLK
  These clocks are flagged as critical in gcc-lito.c

Link [v2]: https://lore.kernel.org/linux-arm-msm/20260819152545.3934-1-sreeshankar0910@gmail.com/T/#t
Changelog [v2]:
[PATCH v2 12/13] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
[PATCH v2 13/13] arm64: dts: qcom: Add SM7250 devicetree file
> Added SM7250 cpufreq hardware

Link [v1]: https://lore.kernel.org/linux-arm-msm/20260818080754.4362-1-sreeshankar0910@gmail.com/T/#t

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
Sreeshankar K (6):
      dt-bindings: clock: Add SM7250 global clock controller
      clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
      dt-bindings: firmware: qcom,scm: Document SM7250 SCM
      dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
      dt-bindings: thermal: lmh: Document SM7250 LMh
      arm64: dts: qcom: Add SM7250 devicetree file

 .../devicetree/bindings/clock/qcom,gcc-sm8250.yaml |   13 +-
 .../bindings/cpufreq/cpufreq-qcom-hw.yaml          |    2 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |    1 +
 .../devicetree/bindings/thermal/qcom-lmh.yaml      |    4 +-
 arch/arm64/boot/dts/qcom/sm7250.dtsi               |  795 +++++++
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-sm7250.c                      | 2278 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm7250.h        |  163 ++
 9 files changed, 3262 insertions(+), 5 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261104-master-5cd2d9cb0ac8

Best regards,
-- 
Sreeshankar K <sreeshankar0910@gmail.com>

