Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6C84D2EDB
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 11:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788865228; cv=none; b=t4xHrYpuk0iGTWJIDwPVf9ApBqrQsWXbWohsnfjTMBQJ0hz0KkhKBsqIapx+7GoWuGZ0LN9B+jqy1x4aQmHg1W3ULsYZiwJxtKZiRNko2h7gpIPTGubC3bYQVOTILDtl5p1i9VKAMmSGSF6MMHvoQWEVGxvu1lI0s/cF1aw0v3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788865228; c=relaxed/simple;
	bh=AuOGdBlVPO3/BhnPeRs0DUN8+8LroCjbn12VOX+pt+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TwOaQjj1AOATA4kOZRiFQBBXEdgN9IFxI71QB8r7fTjXrzwL+FZh8vWzY4n8oJHlS2HyiF7OOSAeNzfWtYA/yyU+Mwl0/P4DiTXrxZzuduZBp+IDf8oO/giCVQKIxDdPUqsYaxiN48TXl1Egb530LR8Nx8XdUi6N21/UYqruQZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VSokl4El; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VSokl4El"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6141a61c0so20813a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 04:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788865225; x=1789470025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1skVfny1yNuvWZ+AsoMymhBqezpvencAbLaQbwhzUxk=;
        b=VSokl4ElikFCfL1dGRg3zw2mWeNQ2jPYG8d6iV/PFaSxCowoJGsQkWbMhtDXzHt2Od
         G/zai+T/6nGJpoU83Db5NmBdNDJALUwvP3UjDSPWEdgXBRwGrvCOVXDhO+PjH0W7YWYt
         lLCIyjtBbfk7CTaa431ZiIOVfx/iqtTXPpgQJgx8InQHrTkn51vWOCkjtNtj2Nh93Xnu
         S58iAPxIl0tMNigzfr/wY09szO9tWxpqedLZRpPEN7SdLveHutp3c9eYqUq3DisUXCMc
         GYMW3hBZM1Y1Yv+cFGn2zpMrj05Ys4NEwGo4OukVi4RYgjeFiAkJck71cWLf5xNh3b5E
         9W+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788865225; x=1789470025;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1skVfny1yNuvWZ+AsoMymhBqezpvencAbLaQbwhzUxk=;
        b=oCmhmxApch1FuU+qBcaEev1D8cdqCdAIK4pD2xHLxaEufaQb76H3SYdUFkpaD9B0p/
         jeglPxJPSAxeekdzhQidXoJOhLXA0RVAmJPzsWUCTrs4HupRJIylD6hroS7KR71dR6bb
         qva51Cg5+8F61ZUEd/vbh06w4d9bEbmslk9t2x0sZTeDIpPLkd17HlCP3pH13fV3aHor
         35gXNNs5sADZIXM+ASwrAi+xQoMrhxaP+ltRqwCoDZZaWqdtqcgUX66zbQynsLAr7rDV
         1FI+kk55p0RM1UG1m3rsLapLle+XJgyEgHsOLE76LeWgUN03PNr44zB3MjISlZY1TpsF
         kDxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxT7ahC+NT1MBKPxLNODpQGmqVOy4oPWiSWyMiVmil2+TD0Cn7Fgqqaz02U59/jU6ppkLr20cBrAXEkQ19P@vger.kernel.org
X-Gm-Message-State: AFuF++l07Gxa1vJjuNhIX5613pgHDC1e6KiLsjgvbH4ZeM3e9W2kd+RX
	R1pcDkgt88Tn5PBYo23kS76PzwbOyhJGmflyY/H2jKMJLSSurxsO4bSrKmKK1/gpsA==
X-Gm-Gg: AYBFou384TIqkvaKze+OsobnkFB6Ftxz5h1kznDznO5Skl0ctK6LZIYIi+DL0c43u6n
	KV/m1e23eM8yuTgZyxB2sycBNCENtO0gHWPC3q09uJzIybJHl9Q8xVrlcOijyJMqWd2TLhVN2+M
	X7TzpSxIuhGtFh518pKzY3dxvzy2QVa/Ny/etqzcFQudvUXZjWh6TBtTDKtuqsHeurW6BtUlKZk
	2WclnNL1G5ojyiSYNR0QKiYaWBI55A+pGxMeAelUm30r+sTS7uk3Hkry8ngGZxbPcCEVndnU7ut
	CmwBf/ePRKPIlz1c4znsJ6g67rXAkSfeTI7l5+NQDW4rz+towYRnSJQO6lP1+EkRMieIpvqsq8M
	fWqPJvJI7R52eS74Rc8qLCjCowpr3ObyXKe1qvJgmk8VxXHkOv/knFgZlVkaiF51MvHm5f71EVW
	SASEljS5//M1+jgd3ZQpytNVmyVMDW+0z3qQhcTLNnS3L46u6OIA9mJkz1PLKH1kjsXRG8gGQqk
	euAfdJfZ1Xw/dgW6VZtTetB9iqfRw==
X-Received: by 2002:a05:6402:21dc:b0:6a7:453c:a166 with SMTP id 4fb4d7f45d1cf-6a83aa836f7mr25317a12.1.1788865222615;
        Tue, 08 Sep 2026 04:00:22 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6c2asm5389903a12.6.2026.09.08.04.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:00:21 -0700 (PDT)
Date: Tue, 8 Sep 2026 11:00:17 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: dts: qcom: IdeaCentre Mini 01Q8X10 Hamoa +
 Purwa
Message-ID: <ap_qwdz-3WibXRjq@google.com>
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <ap_PdUrwLIVGJ3oG@google.com>
 <dcae935c-ccbb-4cb5-a184-eb5dc2cc84b8@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcae935c-ccbb-4cb5-a184-eb5dc2cc84b8@oldschoolsolutions.biz>

On Tue, Sep 08, 2026 at 11:39:54AM +0200, Jens Glathe wrote:
> Hi Mostafa,
> 
> On 9/8/26 11:03, Mostafa Saleh wrote:
> > Hi Jens,
> > 
> > On Sat, Sep 05, 2026 at 11:28:55AM +0200, Jens Glathe via B4 Relay wrote:
> > > The IdeaCentre Mini 01Q8X10 (board 91B6) ships with two SoCs: Hamoa
> > > (X1E80100), already upstream, and Purwa (X1P42100 / X1-26-100). Same
> > > chassis, different silicon. Stubble and the DTB loader need distinct
> > > compatibles.
> > > 
> [...]
> > > This series does not apply to ToT nor I can find this base-commit
> > > in it.
> > > 
> > > Does that have any dependency?
> > > 
> > > Thanks,
> > > Mostafa
> 
> No dependencies. But I test if i can apply to torvalds/master

I can't apply it on Linus's tree so I used your next tag + (revert
for the QoS broken patch I mentioned)

The patches doesn't build, I added this for now:
diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 0cfbf3018a7b..d282ce5635d8 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -173,7 +173,6 @@ dtb-$(CONFIG_ARCH_QCOM)     += purwa-iot-evk.dtb
 purwa-lenovo-ideacentre-mini-01q8x10-el2-dtbs := purwa-lenovo-ideacentre-mini-01q8x10.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)        += purwa-lenovo-ideacentre-mini-01q8x10.dtb purwa-lenovo-ideacentre-mini-01q8x10-el2.dtb

-dtb-$(CONFIG_ARCH_QCOM)        += purwa-iot-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)        += qcm6490-fairphone-fp5.dtb
 dtb-$(CONFIG_ARCH_QCOM)        += qcm6490-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)        += qcm6490-particle-tachyon.dtb


I can't boot in EL2 (with purwa-lenovo-ideacentre-mini-01q8x10-el2.dtb):
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x512f0011]
[    0.000000] Linux version 7.3.0-rc1-next-20260904-g505bc4a244a7-dirty (smostafa@mostafa1.c.googlers.com) (Debian clang version 21.1.8 (3), Debian LLD 21.1.8) #2 SMP
PREEMPT Tue Sep  8 10:10:35 UTC 2026
[    0.000000] KASLR enabled
[    0.000000] Machine model: Lenovo IdeaCentre Mini 01Q8X10 (Purwa)
[    0.000000] earlycon: qcom_geni0 MMIO:0x0000000000894000 (options '')
[    0.000000] printk: legacy bootconsole [qcom_geni0] enabled
[    0.000000] CPU features: SYS_ID_AA64MMFR0_EL1[63:60]: forced to 1
[    0.000000] arch_timer: [Firmware Bug]: VHE-capable CPU without EL2 virtual timer interrupt
[    0.191075] qcom_scm firmware:scm: qseecom: scm call failed with error -22
[    0.198139] qcom_qseecom qcom_qseecom: probe with driver qcom_qseecom failed with error -22
[    0.227426] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x86cd79c0, fsynr=0x400010, cbfrsynra=0x1000, cb=4
[    0.291862] arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x1000
[    0.299508] arm-smmu 15000000.iommu: FSYNR0 = 00400010 [S1CBNDX=64 WNR PLVL=0]
[    0.307018] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x86b020c0, fsynr=0x400040, cbfrsynra=0x1000, cb=4
[    0.318879] arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x1000
[    0.326462] arm-smmu 15000000.iommu: FSYNR0 = 00400040 [S1CBNDX=64 IND PLVL=0]
[    0.333884] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x86b020c0, fsynr=0x400040, cbfrsynra=0x1000, cb=4
[a lot more of SMMU errors]

And with in EL1 (with purwa-lenovo-ideacentre-mini-01q8x10.dtb)
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x512f0011]
[    0.000000] Linux version 7.3.0-rc1-next-20260904-g505bc4a244a7-dirty (smostafa@mostafa1.c.googlers.com) (Debian clang version 21.1.8 (3), Debian LLD 21.1.8) #2 SMP
PREEMPT Tue Sep  8 10:10:35 UTC 2026
[    0.000000] KASLR enabled
[    0.000000] Machine model: Lenovo IdeaCentre Mini 01Q8X10 (Purwa)
[    0.000000] earlycon: qcom_geni0 MMIO:0x0000000000894000 (options '')
[    0.000000] printk: legacy bootconsole [qcom_geni0] enabled
[    0.000000] CPU features: SYS_ID_AA64MMFR0_EL1[63:60]: forced to 1
[    0.000000] ITS@0x0000000017040000: Devices Table too large, reduce ids 32->19
[    0.000000] ITS@0x0000000017040000: Devices too large, reduce ITS pages 1024->256
[    0.223762] remoteproc remoteproc0: Direct firmware load for qcom/x1p42100/LENOVO/91B6/qcadsp8380.mbn failed with error -2
[    0.235468] remoteproc remoteproc0: Direct firmware load for qcom/x1p42100/LENOVO/91B6/qcadsp8380.mbn failed with error -2
[    0.246800] remoteproc remoteproc0: request_firmware failed: -2
[    0.252897] remoteproc remoteproc1: Direct firmware load for qcom/x1p42100/LENOVO/91B6/qccdsp8380.mbn failed with error -2
[    0.261226] qcom-pcie 1bf8000.pcie: supply vdda not found, using dummy regulator
[    0.261707] qcom-pcie 1c00000.pcie: supply vdda not found, using dummy regulator
[    0.261729] qcom-pcie 1c00000.pcie: supply vddpe-3v3 not found, using dummy regulator
[    0.261871] qcom-pcie 1c08000.pcie: supply vdda not found, using dummy regulator
[    0.261889] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using dummy regulator
[    0.279415] remoteproc remoteproc1: Direct firmware load for qcom/x1p42100/LENOVO/91B6/qccdsp8380.mbn failed with error -2
[    0.295042] remoteproc remoteproc1: request_firmware failed: -2
[    0.332189] qcom_pmic_glink pmic-glink: Failed to create device link (0x180) with supplier a600000.usb for /pmic-glink/connector@0
[    0.346753] qcom-pcie 1c08000.pcie: supply vdda not found, using dummy regulator
[    0.349142] ------------[ cut here ]------------
[    0.354378] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using dummy regulator
[    0.359106] disp_cc_mdss_dptx1_link_clk_src: rcg didn't update its configuration.
[    0.367176] WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xd4/0xe8, CPU#2: kworker/u33:0/56
[    0.384583] Modules linked in:
[    0.387723] CPU: 2 UID: 0 PID: 56 Comm: kworker/u33:0 Not tainted 7.3.0-rc1-next-20260904-g505bc4a244a7-dirty #2 PREEMPT
[    0.398963] Hardware name: LENOVO 91B6CTO1WW/3796, BIOS O6NKT3BA 05/02/2025
[    0.406111] Workqueue: events_unbound deferred_probe_work_func
[    0.412095] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[    0.419240] pc : update_config+0xd4/0xe8
[    0.423267] lr : update_config+0xd0/0xe8
[    0.427295] sp : ffff80008027b980
[    0.430703] x29: ffff80008027b990 x28: ffff000802f813c0 x27: ffffc1572aad6000
[    0.438024] x26: ffffc1572a4df03f x25: ffffc1572a639ff6 x24: ffffc1572a61b412
[    0.438026] x23: 0000000000000000 x22: 0000000000000002 x21: 0000000000000001
[    0.438028] x20: ffffc1572a4bb085 x19: ffffc1572acfc020 x18: 0000000000000000
[    0.459979] x17: 0000000006af4b93 x16: 0000000000000094 x15: 0000000000100000
[    0.467302] x14: 00000000000066a7 x13: 000000000199e0a9 x12: 00000000000000a5
[    0.474624] x11: 00000000000000c0 x10: 0cf36ad3ab101c53 x9 : a7b4a80d3a726d00
[    0.481946] x8 : a7b4a80d3a726d00 x7 : 0000000000000000 x6 : 000000000000003f
[    0.489268] x5 : 0000000000000040 x4 : 0000000000000000 x3 : 0000000000000001
[    0.496588] x2 : 0000000000100000 x1 : ffff000800c8b000 x0 : 00000000fffffff0
[    0.503913] Call trace:
[    0.506433]  update_config+0xd4/0xe8 (P)
[    0.510464]  clk_rcg2_set_parent+0x58/0x68
[    0.514666]  __clk_set_parent+0x50/0x214
[    0.518696]  clk_core_set_parent_nolock+0xe8/0x1b4
[    0.523611]  clk_set_parent+0xa4/0x13c
[    0.527458]  of_clk_set_defaults+0x2f0/0x644
[    0.531847]  platform_probe+0x38/0x9c
[Many more of those also]

However, booting with the hacked device tree I am using [1]:

[root@alarm ~]# lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 003 Device 002: ID 05e3:0610 Genesys Logic, Inc. Hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 004 Device 002: ID 05e3:0625 Genesys Logic, Inc. USB3.2 Hub
Bus 004 Device 003: ID 0781:5591 SanDisk Corp. Ultra Flair

[root@alarm ~]# lspci
0004:00:00.0 PCI bridge: Qualcomm Technologies, Inc SC8380XP PCIe Root Complex [Snapdragon X / X Plus / X Elite]
0004:01:00.0 Network controller: Qualcomm Technologies, Inc WCN785x Wi-Fi 7(802.11be) 320MHz 2x2 [FastConnect 7800] (rev 01)
0005:00:00.0 PCI bridge: Qualcomm Technologies, Inc SC8380XP PCIe Root Complex [Snapdragon X / X Plus / X Elite]
0005:01:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8211/8411 PCI Express Gigabit Ethernet Controller (rev 1b)
0006:00:00.0 PCI bridge: Qualcomm Technologies, Inc SC8380XP PCIe Root Complex [Snapdragon X / X Plus / X Elite]
0006:01:00.0 Non-Volatile memory controller: SK hynix Platinum P41/PC801 NVMe Solid State Drive

[root@alarm ~]# fastfetch
                  -`                     root@alarm
                 .o+`                    ----------
                `ooo/                    OS: Arch Linux ARM aarch64
               `+oooo:                   Host: 91B6CTO1WW (IdeaCentre Mini 01Q8X10)
              `+oooooo:                  Kernel: Linux 7.3.0-rc1-next-20260904-g505bc4a244a7-dirty
              -+oooooo+:                 Uptime: 3 mins
            `/:-:++oooo+:                Packages: 204 (pacman)
           `/++++/+++++++:               Shell: bash 5.3.15
          `/++++++++++++++:              Terminal: vt220
         `/+++ooooooooooooo/`            CPU: Qualcomm Snapdragon X Elite 1P42100 (8) @ 2.96 GHz
        ./ooosssso++osssssso+`           Memory: 501.91 MiB / 30.74 GiB (2%)
       .oossssso-````/ossssss+`          Swap: Disabled
      -osssssso.      :ssssssso.         Disk (/): 8.77 GiB / 468.38 GiB (2%) - ext4
     :osssssss/        osssso+++.        Locale: C
    /ossssssss/        +ssssooo/-
  `/ossssso+/:-        -:/+osssso+-
 `+sso+:-`                 `.-/+oso:
`++:.                           `-/+/
.`                                 `/


[1] https://lore.kernel.org/all/20260429141815.827157-1-smostafa@google.com/

Thanks,
Mostafa

> 
> with best regards
> 
> Jens
> 
> 
