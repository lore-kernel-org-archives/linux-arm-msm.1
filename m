Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792622081;
	b=WNvwlbBOaZEsgsZ/sxVgUyE3+pzMZVU94IIET1guc0dHNsfSQHXU9Ufo3Op1F1YVhZZE
	 jmRQBaE8jObcpGxAk1BqjnEO/B+QvAe2O+W33094y5Gn5pkqL/Xm+Lq7fB+4CFQFHPCDe
	 2zMuTrWNotMyIkaYyFqiX/Pz5DXOpXezkbBfsIEonXChmQvSp21ux0yhqjBPBwGM6cLbj
	 +91+aqpv7mG384WwWyKpRjeUzyzYtcmYqM7Sp8vKQxPf3mPXlpk9HB8uzWXR7NAD/Fqja
	 rRYwmIEzGW5YpO6yj33FISOrFWUATQCyZLrSkC8m6meCVWJbmJQveE+9R7gH3ApMMqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=AuRFvWHYwUgC77v7Lb5XoBIxVwPZ/AGNcKHfaD3qfos=;
	b=SESkaAGYCH7y3D92SZzVtFwfxh2QJNH0Q1mvahkyFRiNiw3DQARGr/FoQw8SaY/N4w8b
	 0M0powq/5XBWZ9uBw7o3gJuCybVUWnRNUoDiZ5ufLYJyjQd1gT1P901+jasDQvWFMi+sZ
	 qUKNExs90S0v7EIuIJQxXwNtsXICDL9wERWVFYUoLORu3DnwrTw4dm2bkXow5sP+aN0yI
	 uORTM9pqrEmoqAGN3KrO61tbRiHOCCU84JDpBbJ4wzBZO4XOGxvbz2H+CWXZSGBZGAWf0
	 8aZec3cKrMEUiAiz2h70ojKgR332bRQNzGHZDguY7hw2MirKqntD4Uw5f7R4bbefnhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CEuW3BBa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C119606A327
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 22:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C119606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CEuW3BBa
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b0db268bd8so8201657b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792622080; cv=none;
        d=google.com; s=arc-20260327;
        b=ROERNRai+V8/dm3kvb6Mpsp3Mg/DZS5hzFwZH+zAM0BKscEJc0k/tTbdM9YLyhEHxc
         J5idrQg1v9NCtlqvAc2qcUlQ/Ds/oQMk1JbohgOW+IwTXdPn2EFob7nlxNTn4kYwzJhe
         GnsYOW8QrQQ42zZO2QDgO2Nqfd7vIgaKS4vefga1T5vIFKIlUggJjD1QddQO+ifMzQJj
         FpcXV5TrxNYox9PQoDca/q5q3E6GrLKOYjq4fORH6NWxfQWaA/hY2toqjgibulfo0sgw
         +uaCBXEf0kNT/TO3TVjKZc2zRD51DMKjMz0PBlNiULxnXkQW+NXD3jKzhJOfWyI0YdQf
         nfmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=AuRFvWHYwUgC77v7Lb5XoBIxVwPZ/AGNcKHfaD3qfos=;
        fh=/f0d79bMO5FbX0k0sfTbeqcfzllXQW7+U48P3jlf7fs=;
        b=YETZ2bGMGU5JxYQDrYAQqx7M3E2C/7i+XEidXAiL5dS29wSPPBoymbMBNfI3r1ogt5
         DKKeMpZDG8NsmgfOeCmPXjMpzHScyBZo2p79ccvIkhnlb28wFGgxC2vJ44PwsQpvH2RF
         oTP3cuam3mVh9Jv2YMzXXDwKYbiPgNsczAp2GOPsuwnMtBpSF/ez6YTDxyez02mL1XFh
         djbjb0cZUfU4plHdv7H8Pans9AwIixwnMrckWgV82czxOId8dM+6aS+TkLaP3q9zt+vw
         6spi/BqKrG1oxiaIF2CDccq/KKcRDaT4ojpUJobItX7j6YM+j8Y5hWnuTrX99qsDlbPM
         jESg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792622080; x=1793226880; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AuRFvWHYwUgC77v7Lb5XoBIxVwPZ/AGNcKHfaD3qfos=;
        b=CEuW3BBap+O1Hf01kaDUJOoZKbbqZjV49s+t71UQo8/iilcnvYlIhFiAzAQB/6ydP6
         s/UwiQ3rh4dbOMvBO6tsVcd+ugPK4FRoEforAAQjpwtoMJe8HhiEfc7zpmHaPyojpUdK
         Sxc4pqRJpM+BAP1/YKohMdxltQw5LCPoE9boEx69++P9XRQgH4En1YRxxnAn9nfj5mqM
         QSLXEmZQGtYl3FIKMSVrg0Amz+nww8OaJ99wx+g0O1uSJkS9VEFD4IQhhyJOhboCk6n/
         qhrrgMQBegZRGjP/zi3QW4+CQ6i7XcFjHgmhD9SGCRU1FydIcOGk6bulG6gi1tr0ml9R
         Zdqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792622080; x=1793226880;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AuRFvWHYwUgC77v7Lb5XoBIxVwPZ/AGNcKHfaD3qfos=;
        b=rfhnk/CC/zrFTC7WPY1tLL3manhs9o+BxZjkcN2iEXKMkrtmwEzf5bztJx0mb1Ujb3
         Ro6k1D/p4uefvg9klDWiWbaZLLQb0/XiB92jaaLpxhyNyS9stORYxQZmfLMFgw5quk6c
         iM1iTaQCR+PrldwzPGvhyaMTEZCsHqUQFUWqpxxpjvSibJSSXvq8G0JdqpHpCd1kS7er
         P71YLu9vsymP6x60Xtpx9q5tIx7oLTweUXZqnzdw9g1Fll8GdVL9Hpsk6E8a8tj90i4w
         lx1R5p7M8mu+dhbYU+hzgoFMuiTc7nCLhUarfc0eeo7POj5cjsNzcW++AytCWsy3dwuc
         so/Q==
X-Gm-Message-State: AFq9FYJ9wsJ+eDpNH67oMf4CKwRJRh65M2C1MyDECWpxdAIqdCqUEiWU
	MXGTu1Jb5Ybo9d6Q3dKwLLVJq3B7E/n/VsXSidoXJlyfCUAvh2YMkdn+WOPjGhxrHjBP7PyKlzu
	pspTqeA9rYioTnTw+ViC1DPHKazCyCVtayD/COhA=
X-Gm-Gg: AYBFou2AnhvqP7TvERFqJ73FArDB49/Pe9vwfPHfHeP0tOzZSHszWPoygdk1UYO/a9s
	ExMxtLiyDfXVye4P7Z0arAS8qxrN/JUcRfqYL9fL0ezdVMXOrrdFtBB7Y6ITPPqn7N//roOWIxt
	0DvgVhvCVwAwnecDOP5mqq8zi9l3Ln1RT/zoaHn//cSABdzhh2nvalIm3+AuCIXLfOWvarV97az
	kIJIHFS0GLWfDydqnxgu6DeLVGFLiVSnRrEm7554xwGw9XWx310Foo2atxu8i2y7CCzF5qJ1Tav
	i+dJzYDGblSsG8F4/3WrIWLJqwRNE9irTJ50p1DAAwy8Ox/idi+h1LQux4XbtlTf6J/y/swTlt4
	C7F1FXI22UuDIXuQapiNvhClKmpComtU6fx5Bog==
X-Received: by 2002:a05:690e:dce:b0:679:c86f:cf76 with SMTP id
 956f58d0204a3-67a0e4984a1mr1145753d50.26.1792622080214; Wed, 21 Oct 2026
 15:34:40 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Jeff Roach <jeff.roach0@gmail.com>
Date: Wed, 21 Oct 2026 17:34:29 -0500
X-Gm-Features: AclHuK-6gTLAWvDG1iuZmtARGNErn6wE5YbRJiwj9tnV9xvpJ7TtZCop1UFm6zk
Message-ID: <CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com>
Subject: HP OmniBook X 16 (X2 Elite, Mahua): DT bring-up report and questions
To: linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi all,

I have a device tree for the HP OmniBook X Laptop 16-cp1xxx (board
8F46, Snapdragon X2 Elite 12-core, "qcom,mahua") that boots and runs a
full desktop. This is a bring-up report, not a patch: the DTS is
currently based on the Ubuntu linux-qcom-x1e 7.3 tree and still
carries my verification notes. I'd like to rebase it and send it
properly, and would welcome advice before I do.

The DTS sits on mahua.dtsi, uses the same PMIC deletions as
mahua-crd.dts, and copies board wiring from
glymur-hp-elitebook-x-g2q.dts. I checked it against this laptop's ACPI
tables where I could. DTS, notes and test results:

  https://github.com/jeffroach0/omnibook-x16-linux

Disclosure: I'm not a kernel developer. Most of the analysis and the
DTS were done with an AI coding assistant (Claude); I did the testing
on the hardware and checked the results. I'll do my best to answer
questions and test things, but please be patient with me.

Working (kernel 7.3.0-21-qcom-x1e, Mesa 26.2.4):
- eDP OLED panel via msm (samsung,atna33xc20), DP-AUX backlight
- GPU (Adreno X2-85), with the workaround in (1) below
- Keyboard and touchpad (i2c-hid), lid, power key
- NVMe on pcie5; Wi-Fi QCC2072 on pcie4 (ath12k, modelled as a
  pcie-m2-e-connector)
- Bluetooth QCC2072 on uart14, using the posted QCC2072 UART series
  (btqca/hci_qca and pwrseq-pcie-m2 patches) built out of tree
- usb_0/usb_1 Type-C (SuperSpeed in both orientations, PD charging
  through pmic-glink), usb_2 USB-A (no repeater node needed, UEFI leaves
  it set up), usb_hs (webcam)
- ADSP/CDSP with OEM firmware from the Windows install; battery through
  qcom_battmgr
- 2x WSA884x speakers on swr0 plus VA DMICs
- s2idle suspend

Issues and questions:

1. GPU GMEM size on 3-slice Mahua. MSM_PARAM_GMEM_SIZE reports the
   catalog's full (4-slice) GMEM, so Mesa's tiled rendering corrupts
   the screen (garbage bands, diagonal half-drawn quads, and CCU write
   translation faults from WebKit's Skia GPU raster). FD_MESA_DEBUG=sysmem
   and TU_DEBUG=sysmem make it clean. I think the a8xx slice-info change
   in linux-next ("report the active share" of GMEM) fixes this. Is it
   going to be backported to stable?

2. CPU frequency. scmi_cpufreq fails: "timed out in resp" and "Failed
   to query supported version for protocol 0x13", probe -110. The SCMI
   base protocol answers at boot ("Qualcomm:PDP0"). The perf
   protocol never does. The clocks stay where UEFI left them (about 3.5
   and 3.9 GHz). Is perf over SCMI expected to work on Mahua with
   production firmware, or is something else needed?

3. Suspend. PSCI SYSTEM_SUSPEND (deep) returns -EOPNOTSUPP, so s2idle
   only. On resume from s2idle, usb_hs (a200000) gets an arm-smmu context
   fault for SID 0xce0, then "xHCI host not responding ... HC died", and
   every later suspend fails until reboot. Unbinding dwc3-qcom before
   suspend and rebinding it after works around it. pcie4 also logs
   "Timeout waiting for L2 entry! LTSSM 0x11" on suspend, but the link
   recovers.

4. Smaller things:
   - "GICv3: SPI 4115 out of range (use ESPI?)" right after the SPMI
     arbiter probes. I haven't tracked down which node causes it.
   - The pm8xxx RTC probe fails with -ENOENT because this machine has no
     RTCInfo UEFI variable (qcom,uefi-rtc-info).
   - The headphone jack is a Qualcomm SoundWire SDCA codec (only in ACPI,
     \_SB.ADSP.ADCM). I didn't try it.

For an upstream submission I assume the right base is the qcom
for-next tree, with a dt-bindings patch for "hp,omnibook-x16". Please
tell me if anything in the approach above (for example the /chosen
simple-framebuffer that keeps MMCX/MXC on before msm probes, or
dropping usb-role-switch while running host-only) shouldn't go
upstream as it is.

I'm happy to test patches and other things mentioned in this post on
this machine to the best of my and Claude's ability (mine being fairly
meager).

Thanks,
Jeff
