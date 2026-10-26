Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793019482;
	b=G/lLV++ys9RJbgiTJnBLKlH+Qlzo619VDdkPaCU9buIOKG3ip7POfw8uPGzp2Twu1G6e
	 dxVbov0kCQ2KxROiKRq31L7cnUZsxGscXrOAFlzYafQzpED7qPhd0SDXgBPCM97f0FP83
	 Qaz24VJWVzqE+n6R64gvbi9NGdnkbDgBW3FuqWCELi4dnKM+LvG/AKPzUsGT2fdvw8CSi
	 QXaf0Gl5E/BcwK8tOBbDxd0N7qqIB0g4fUGXZTaqmSJ4fxYbdumH6WYhtK4HBl1FONe8e
	 zjGei1qg2jmOkRFzQAPxR95bZB9oRWnMH8XzxLa2Gm7ntTlu3iMZahxXEmT3EN3ByoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=t6GH884chvgzD9Ofd9SmMJ/+b4uyUbpGX7r6FVPRzJk=;
	b=Lg8vl6nxkckssqzHPSmZ3lf6pJMWexKYJ3oHCNGBDL+onQp0COh3TPdFpl3F722MERli
	 BIwUsQMtsBnhfHHSsagYBQw8wfLGMId4m1U4JOt9ZgAjnVsLz4pwZohdLoopHre/EDyLY
	 g+h5x/wdJ7an9ExPXdzrFBKVue7/SQzZwZgdNnyXe0GDgThFRkE4bRvbufZVgyqPVnpXS
	 2gVASm8EKx8vjS5L15/pFh9QQx6NxNX8jgSr18cBVTNWMIqy7jka/g0erFqs3fEbpkMNE
	 ZGKqaqO4BtnP408gxAO5aLfhTLTHHz8moA22ekZxBe0KjWrYPpM9gE6g17QjCZbKRZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VqO1lUQC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45AF606A325
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B45AF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VqO1lUQC
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b170129413so5743128a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:58:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793019480; cv=none;
        d=google.com; s=arc-20260327;
        b=GSX0ZaoTRMmxdtwu4H5WHi3mdCm8dJAUiABkZtPXCLqoX3glkr+/bRCrtuqPNS4w2a
         B9LGu/1q0+3+xMAPOXEo8vIwgcqFK/3xmMe1Yxkj3+TmWyRS4UHZAb+v2bqZyifT0DIR
         RMnQI3qoRNwPPdh3ssKynMlHVyk9TxuriUzoka3h1z6PYwLqM7QO+gM7hp+2r/tA0xJS
         4n6uOxnYCZ/7I7VYW0C06Bm29RH39lJcZ3bcmRM0cUBZ/broRO8LzOaZlSOjc/jj9QKm
         Y8FSUW/EnayaXxbsD6OrmPE5KutJN4iUrblK9LcCnYll+e6RKeBbTkP3FeKBOSkmzAue
         TP4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=t6GH884chvgzD9Ofd9SmMJ/+b4uyUbpGX7r6FVPRzJk=;
        fh=1m4WqbIQM3yMSihP9iKeKySYMdZ+/EoSks5oFIZ5U+8=;
        b=qFs7tmUAGFLBH20iPCILAQo45tWdepw0vhbJAt0G0nVjl3jgI1drzWAI9uyRMUrtqG
         ekVQ0jDxV/5X3ojoB4dwxIb9zG78Bfw1uVi/Ffj654ZA80wQv936ecL8lXOJL968t5zH
         O27Oy3FF+FVg1MGhRr1ccABWj8+uhX7LiGfXJWIx0AuckuC3mpdKdrH7SC4z1ke8Tef/
         gSShoobtQxqccr+1OeqZpkbexRBCsVN3KdEoECPKI3p0ezdjPVRcTz76h4t+UnLJEZv9
         JHPMedpqCpUb8SazDzROtVvHIMpJQYXD6OGOx46jWSgB7CeqSazla3mYx7/rf7eZ94fB
         yisw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793019480; x=1793624280; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t6GH884chvgzD9Ofd9SmMJ/+b4uyUbpGX7r6FVPRzJk=;
        b=VqO1lUQC4/ZB86Bob7PuaqandeKM0dkfftYDf5kB1TzT/vAYMZe3lWFJmSvZDNQ2p9
         sDs/pmOD9xySol00LCkT1+BYr+oRmPmkkXNiLVRP6PmngB72HdMm5g/SZzk+u05QZrCu
         dwTKE/BsTEwIbISZ1/SonNGe9z5faC+s6z1Jaw//IB41QqG1RqiHUDmeu26WlXOt7fbL
         m5pscN98Aazfrf2wgOXYqTbTd3iEaeou3IvdOMut0xwuS7UcIdRKxvYt+4f2c8tojo9g
         8aPAA+x+JKtNX97Dq/ubP+/3fbU7CMAUbo4Ix4cYJ0fz/o9rvSxc3VtFQJlOuo3W+3ok
         8StQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019480; x=1793624280;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t6GH884chvgzD9Ofd9SmMJ/+b4uyUbpGX7r6FVPRzJk=;
        b=2BBr4vLNA1haiU293I9bbtt84iJRqCOxWyKXJqmsieBGs5RdUVK/Ec8IjsKhujxCOL
         mOLXl6t0G3a2UMjjyb0pZgvovKqgTR41+i56gzWdiCkei6IP4yJ/C4pAxDpjWI3ruUIm
         EzLdnHw3wxyY5A192PM2oOVNzQeliVFgoGkkr/3obDr6+n52OTmQKC88aKj20kz7ZZdk
         hSdZQ7BONQFYF/hC43wk4S15Vw3mfoOiyP4AqPV7oy+yFl46yVegX6ngy69QY5KpbPtj
         2tk3iPWuIYh87QHJdC8H0pgKoWEV6xkWiRmz50OmtEN53vvzmpyoMfwVwBUqZgHnjmP+
         4VYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxFvVObLQ7GJk5/rEOHfBkudtxs/Xu6vSlLTGklQf1lRheiT3h94waSR9ERk9codfenWZ4dDT4grv2L0ZZ@vger.kernel.org
X-Gm-Message-State: AFq9FYL1NFwI2iEs3/Augf222bzeQjD8tOwJ4a5XrwOSEaom1N2i1LBq
	sW8zqPxb0jfnOPcAxuUdByjSm6zPMnxFiwNDkxuCrIAZJtH5E7H58c1NrypPVeqplad2xFj+OkV
	IZsQWOG9qwZl4UYFBKsZXUhkbiMmdEWI=
X-Gm-Gg: AYBFou3M8G8zCayltWNK/FlxEtx0fpuWyx6puC0GxMNPJzZ5Y2NnCvgvpuM5Naa6FEc
	oXx3H7ns5O1+BAbde/kEe3Z0NamyQos7K1s1PjQQ308g7vUklD50q0MhzxukTAj/n/ssEZTtlkX
	vvPFXyhVrUhTp/sDO/VtPGGdv5fdyaegX7LZ3I19i5Ir5+Iuq3u+51EC2KHfY3AwBv8BFDG5BsK
	0j+FSpL3EGdyCyug6TiKPq2RjWxET1kIsSRKIUU80ucP6IErFk5snYVCWS0v054ulZLrLto6Axz
	NOB/IYAY2vIG8pGnLfVcG0eK2UkrQbI/bppzjov/roK+/K1hw9nt9ywCs35AV+fz5475qLoQLoc
	96CFQ4k4GfbO4Iw9ZvQVLRC5NzhyClTKC8KFkdEEmc4ewkFpeuMY3U2NHZAOpukoE1F7K8jYTBy
	QOuYVfRqKmTCi2AUmuveWvimtVVz4=
X-Received: by 2002:a17:907:6e86:b0:c3f:c878:7c1d with SMTP id
 a640c23a62f3a-c46bddb3308mr817681666b.9.1793019479919; Mon, 26 Oct 2026
 05:57:59 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016042432.824-1-sreeshankar0910@gmail.com>
In-Reply-To: <20261016042432.824-1-sreeshankar0910@gmail.com>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Mon, 26 Oct 2026 18:27:48 +0530
X-Gm-Features: AclHuK-qVOdu5LbOqp6_F0580cdJ42kSYQZoFTTe2Es-FxZ1SlI0qmd8PhmgExM
Message-ID: <CAA-+ukL=H6W84__TtD2C5oxbRr7jgsDqOj=2KN4rMtJ6wBgc=g@mail.gmail.com>
Subject: Re: [PATCH v11 0/5] Add initial support for Qualcomm SM7250 SoC
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org, 
	konradybcio@kernel.org
Cc: danila@mainlining.org, davidwronek@gmail.com, mani@kernel.org, 
	robimarko@gmail.com, linux@gurudas.dev, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Oct 2026 at 09:57, Sreeshankar K <sreeshankar0910@gmail.com> wrote:
>
> This patchset introduces foundational upstream support for the Qualcomm SM7250
> SoC (internally codenamed Lito).
>
> SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
> octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
> and 6x Silver Cortex-A55) and Adreno 620 GPU.
>
> This patchset is organized as follows:
> > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC,
> RPMh clocks/power domains, GCC and cpufreq hardware).
> > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> interrupt controllers, clock providers, power domains, and reserved memory.
>
> >-----------------------------------------------------------------------------<
> Merged patches:
> dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
> soc: qcom: socinfo: Add SM7250 SoC ID
> dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible
> clk: qcom: rpmh: Add SM7250 rpmh clocks
> dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
> pmdomain: qcom: rpmhpd: Add RPMh power domains
> dt-bindings: arm: cpus: Document Kryo 475 CPUs
> dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
>
> Pending patches:
> dt-bindings: clock: Add SM7250 global clock controller
> clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> dt-bindings: firmware: qcom,scm: Document SM7250 SCM
> dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
> arm64: dts: qcom: Add SM7250 devicetree file
> >------------------------------------------------------------------------------<
>
> Changelog [v11]:
> [PATCH v11 2/5] clk: qcom: Add Global Clock Controller (GCC) driver
> > Drop hw_ctl clock branches
> > Populate default values for GDSCs
>
> Link [v10]: https://lore.kernel.org/linux-arm-msm/20261015051926.13752-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v10]:
> [PATCH v10 2/6] clk: qcom: Add Global Clock Controller (GCC) driver
> > Update .halt_check and .ops are per the review.
>
> Link [v9]: https://lore.kernel.org/linux-arm-msm/20260901092447.3028-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v9]:
> [PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> > Make all clk_init_data instances const across the driver.
>
> Link [v8]: https://lore.kernel.org/linux-arm-msm/20260901070717.20513-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v8]:
> Same as v7. Resending the full patchset as v8 due to a transmission interruption during v7.
>
> Link [v7]: https://lore.kernel.org/linux-arm-msm/20260901064357.20055-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v7]:
> [PATCH v7 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> > Fixed missing (struct device *dev) in gcc_sm7250_clk_regs_configure
>
> Link [v6]: https://lore.kernel.org/linux-arm-msm/20260824150156.1310-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v6]:
> [PATCH v6 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> > Make all clk_init_data instances const across the driver.
>
> Link [v5]: https://lore.kernel.org/linux-arm-msm/20260824130437.2771-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v5]:
> [PATCH v5 13/13]: arm64: dts: qcom: Add SM7250 devicetree file
> > Reformat multi-entry phandle lists (domain-idle-states) to '<&a>, <&b>'.
> > Reformat multi-entry tuples and string lists (qcom,pdc-ranges, qcom,tcs-config, reg-names)
>   to one item per line.
> > Enable QUPv3 wrapper globally by dropping 'status = "disabled"'.
> > Move compatible property to first.
> > Remove clock-frequency property for timer.
>
> Link [v4]: https://lore.kernel.org/linux-arm-msm/20260821154030.2514-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v4]:
> [PATCH v4 04/13] clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> > Update .fw_name with .index
> [PATCH v4 13/13] arm64: dts: qcom: Add SM7250 devicetree file
> > Added missing capacity-dmips-mhz and dynamic-power-coefficient for cpu@300
> > Added power-domains for cpus and apps_rsc
>
> Link [v3]: https://lore.kernel.org/linux-arm-msm/20260821081125.4522-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v3]:
> [PATCH v3 04/13] clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> > Updated the way of registering critical clocks.
> > Made some more clock critical.
>         GCC_VIDEO_XO_CLK
>         GCC_CAMERA_XO_CLK
>         GCC_DISP_XO_CLK
>         GCC_NPU_CFG_AHB_CLK
>         GCC_CPUSS_AHB_CLK
>         GCC_NPU_BWMON_CFG_AHB_CLK
>   These clocks are flagged as critical in gcc-lito.c
>
> Link [v2]: https://lore.kernel.org/linux-arm-msm/20260819152545.3934-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v2]:
> [PATCH v2 12/13] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
> [PATCH v2 13/13] arm64: dts: qcom: Add SM7250 devicetree file
> > Added SM7250 cpufreq hardware
>
> Link [v1]: https://lore.kernel.org/linux-arm-msm/20260818080754.4362-1-sreeshankar0910@gmail.com/T/#t
>
> Sreeshankar K (5):
>   dt-bindings: clock: Add SM7250 global clock controller
>   clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
>   dt-bindings: firmware: qcom,scm: Document SM7250 SCM
>   dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
>   arm64: dts: qcom: Add SM7250 devicetree file
>
>  .../bindings/clock/qcom,sm6375-gcc.yaml       |    4 +-
>  .../bindings/cpufreq/cpufreq-qcom-hw.yaml     |    1 +
>  .../bindings/firmware/qcom,scm.yaml           |    1 +
>  arch/arm64/boot/dts/qcom/sm7250.dtsi          |  771 ++++++
>  drivers/clk/qcom/Kconfig                      |   10 +
>  drivers/clk/qcom/Makefile                     |    1 +
>  drivers/clk/qcom/gcc-sm7250.c                 | 2286 +++++++++++++++++
>  include/dt-bindings/clock/qcom,sm7250-gcc.h   |  163 ++
>  8 files changed, 3236 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm7250.dtsi
>  create mode 100644 drivers/clk/qcom/gcc-sm7250.c
>  create mode 100644 include/dt-bindings/clock/qcom,sm7250-gcc.h
>
> --
> 2.43.0
>

Hi everyone,

A friendly ping on this patchset. Please let me know if there are any
remaining concerns or if anything needs to be updated.

Thanks,
Sreeshankar K
