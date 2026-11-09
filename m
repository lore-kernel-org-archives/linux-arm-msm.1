Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253406;
	b=ipJx0OgZxB0JXeu8XNn2jgn/dQQBLfc4yXbTRQuHBugrcdMC+dPYX2wk+E2NABzPR0/N
	 ry4EVA/3gxhEpy+07v9EKp60F20QNyAr5mUWaDoQ3bqpsGBtVVDLLsXJ8rcjSO9NIf/VY
	 EfDVzBg7G6lMfbMFRMbCDv05si9a3yb95PDvR077gSlZTaby1rndmW88qYKxVs3FvWYdL
	 DNPJDIgIzNYZBy99pApMfvUSg/gKrOQEyLF/EsGETz2BxwkycdiHVGLdLiBFvSdvpn5V/
	 Sp3c1fD1PsUpGF+3hf/5fUGfNOc7CA5DsCRVHf1LkmzLLPqRjFDTiiq028lawfUUvug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253406;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=gwXVOiQVm4VQi8X9V4vmw3aRHj8H4AwzMc9FpkENiR8=;
	b=q+QjnxEYLx1CP9CZ2Mbd6U4qF1wtIsiLfNb/x5ra7Yk1nkVDjRIF3x+ybxUUark70XXK
	 8CRJmwe/3MR2Tu3RZNXUTKuffqd82ofCo6NasvrR0dnblWFqVHEeFrSV+nV2HeYtilyGX
	 p+96BcH70ujb3oCwxtzbJgd8lRPpm5rl4R31elXBshztdeMdE4GnZnCxQOGM+/fLS84gP
	 7hItqrKOkBXbFSt4MAIk98jxveza03me98VKQi3SJLwPHNwDXAr20x4CgZ+hSXuxoezVx
	 gRYjXd6XY+U5giKeuZaMnggIFOlkC4Wga7FzxvpOGIkN48V1JAwV03QulG2elVkjvKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=Llvfmm6g;
	arc=none smtp.remote-ip=109.224.244.18
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4920B606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 19:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4920B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=Llvfmm6g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794253398; x=1794512598;
	bh=gwXVOiQVm4VQi8X9V4vmw3aRHj8H4AwzMc9FpkENiR8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Llvfmm6g/KiREzL5vuYnouLQ6UkNN84Ak2B3sscy8uxR7l01uU5dg/KiePVc2WNAi
	 bbI2hbMOMtOXw5T06SpNcf1ab++c9Xs8eE2MVPE4B6r8XNsBAfl2typLARxaQZklIu
	 KvEGqltGN/IkH/fws9IKscV6f4MroVVXS/0fBN7PNYfmWPLzXGQ+AIh1lvR8NFZSDl
	 tDDTkHwPSFmAZSc//psRg3aULUMeO0OC5kRFOAAgy3A74ggsbQt9W1ObkWDoB8r7K1
	 9atPuhDgNp/rkDGnQWl6Hh+nqbR+RYAy+tT9676Afb60SPoDJO5jXZPkW9L1hh74fm
	 cmn5EIKISgZIA==
Date: Mon, 09 Nov 2026 19:43:12 +0000
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
From: Yun Wang <7z0423arsenova@proton.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Mark Brown <broonie@kernel.org>, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] soc: qcom: rpmh-rsc: Skip read requests on unsupported platforms
Message-ID: <20261109194231.1358638-1-7z0423arsenova@proton.me>
Feedback-ID: 227066774:user:proton
X-Pm-Message-ID: cef2dca80f8bfecc26460e8333b61f889d1cdb66
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Maulik,

You wrote that you do not have SM8150 hardware to verify this patch, so
here is a result from an SM8150 phone, plus some measurements that may
help with deciding what to skip.

Setup: OnePlus 7 (GM1900, SM8150), OxygenOS 11 firmware, v7.4-rc1 plus
a device tree for the phone that is not upstream yet (it describes ldo1
and ldo8 of PM8150L, like sm8150-mtp and sm8150-hdk do). No other
regulator or RPMh changes. Only this patch was applied (v2 2/2; it
applies to v7.4-rc1 with an offset of 8 lines in rpmh-rsc.c; patch 1/2
was not applied). The kernel was booted with fastboot boot.

Without it the phone never gets to user space. On debug builds of the
same tree (more logging, a watchdog and, in some builds, a short
timeout for RPMh requests) the log shows this: when regulators-1
registers, the read of the VOLTAGE register of ldo1 times out ("failed
to read VOLTAGE ret =3D -110"), and so does a write to xo.lvl (enabling
the XO for geni_i2c) that another probe issues at about the same time,
and everything that depends on RPMh (UFS, display, USB) never probes.
The log looks like the one Dmitry posted from the HDK. With this patch
the phone booted 5 times out of 5; see "Test scope" below.

What I measured on this phone, with a debug interface that issues
single RPMh reads and writes from user space:

 - Reading offset +0 (VOLTAGE) of ldoc1, ldoc8, lnbclka1, rfclka1,
   vreg.sp and gpioa8 times out. Reading +4 (ENABLE) of the same
   resources completes. After a timed out VOLTAGE read of ldoc1, a
   write to xo.lvl times out too (with a debug kernel that gives up on
   a request after 1.5 s), and only a reboot recovers.
 - Reads of ordinary VRM resources (ldoa1, ldoc2, smpa4) complete in
   about 40 us, but VOLTAGE and ENABLE read back as 0 (MODE of ldoa1
   and ldoc2 reads back 0x80000007). That matches Dmitry's observation
   that SMPS and BOB reads give 0.
 - In the command DB of this phone all 64 resources of the VRM section
   have aux data: 50 have 1, 11 have 2 (gpioa8, ldoc1, ldoc8,
   lnbclka1-3, rfclka1-3, vreg.sp, vrm.xob) and 3 have 0 (divclka1,
   divclka2, divclkc1). The six aux=3D2 resources I tried are the ones
   whose VOLTAGE read hangs; none of the three aux=3D1 resources I tried
   does. I could not find the encoding documented, so this is only what
   I saw on this phone.

So on this firmware reads are not unsupported across the board: what
hangs is the VOLTAGE read of what look like XOB-type resources. The
downstream device trees of two SM8150 phones (OnePlus 7, Xiaomi Mi 9)
declare ldoc1 and ldoc8 as qcom,rpmh-xob-regulator, while the
downstream OnePlus 8 (SM8250) tree declares the same names as VRMs;
I could not check the SM8250 firmware. Skipping all reads on sm8150, as
this patch does, is enough to boot.

For what it is worth, the same device tree also boots with the v7.2
version of qcom-rpmh-regulator.c, which has no readback (5 boots out of
5), and with a small patch that switches a resource to the XOB ops when
its aux data is 2 (about 20 boots, no failures). If a per-resource
check like that is of interest, I can post it separately.

Test scope, so that the tag below is not read as more than it is.

Tested:
 - One OnePlus 7 (GM1900, SM8150), OxygenOS 11 firmware. Kernel
   7.4.0-rc1 as described above, command line with clk_ignore_unused
   and pd_ignore_unused, Mobile NixOS user space (systemd). The kernel
   image is loaded into RAM with fastboot boot, not flashed.
 - 5 boots in a row, 5 of 5 reached user space: adb answered 11-12 s
   after fastboot boot, and each boot was checked at about 45 s of
   uptime.
 - The same on all 5 boots: systemd "running" with no failed units;
   /sys/kernel/debug/devices_deferred empty; no WARNING, call trace or
   BUG in dmesg; no dmesg line with rpmh, regulator or rsc that also
   says err, fail, time out or warn; ldo1 and ldo8 of PM8150L listed in
   regulator_summary at 1800 mV, as with the v7.2 driver.
 - Up in dmesg: UFS (the root file system is on it), DPU/DSI with fb0
   and the console, USB (adb), the Synaptics S3706B touch controller on
   geni i2c, pm8941_pwrkey and gpio-keys as input devices. cpufreq: all
   three policies reached their maximum under an 8 s all-core load.

Not tested:
 - Anything beyond booting: no suspend, no long uptime (about a minute
   per boot), and no GPU, audio, modem, Wi-Fi, Bluetooth or camera
   (not enabled in my device tree). I did not look at the screen or
   press keys in these 5 runs.
 - arm-smmu 2ca0000.iommu (the GPU's) fails to probe with -110 on all
   of them. It does the same with the v7.2 driver and with my own
   regulator patch, so this patch does not cause it; I have not looked
   into why.
 - What the zeros do: with reads skipped, the regulator driver sees
   VOLTAGE, ENABLE and MODE as 0 when it registers a regulator. Nothing
   looked wrong, but I did not check any consumer that could depend on
   the real values.
 - Other hardware or firmware: one unit only, not SC8180X or SM7150,
   and patch 1/2 was not applied.
 - A series of the exact same image without this patch: the failing
   boots described above are from debug builds of the same tree.

Tested-by: Yun Wang <7z0423arsenova@proton.me> # OnePlus 7 (SM8150), v2 2/2=
 only, on v7.4-rc1

Thanks,
Yun Wang

