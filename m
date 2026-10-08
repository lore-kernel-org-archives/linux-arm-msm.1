Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9D5493D34
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 10:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455661; cv=none; b=JJ3V8cIkr7bh06XAcUZywf5d0ExbQrxwVreFOznX2L1oOWur9P0lOG8uPthVAdXY38da7m4XksigMx5inIL4qFvdtp7eBzf/olxEHjsudmWJn0df057pm5iVIQmjPq4eccl4PWS73lsEv5WuWCIKt+KX34Al9qdIv7ey8BhCSQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455661; c=relaxed/simple;
	bh=NjtMmGGe9Z6SsWAnOywBj2B/KK6ioQeD8WkEr0YiNlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VcaxV/7sycK+M4LMqvyvYMejt3hxIb4NQgX6D2uAe2beV6/YnX44oFcVcEnJm70ytPaEOaIQYcfk6xRo4YBv2pd89lODe+zaPDAGM9+yHAl3Tv/kSpldk3ZeT9Vl9Xp8seoXRkbymgbdAYmmelSLd4CA0uNh/00/AlX+LJvBQgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cAacpQ3a; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cAacpQ3a"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc7d6ce0b1dso97930a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 03:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791455660; x=1792060460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BRmkdeiD8ReZpDPX5N50tNchauYw/eSsVXxk7TAzHQQ=;
        b=cAacpQ3aIoksykuxOchV5x69Sgsyn/7AjkuGm4/HLGEukwtdyGsV1MRi0wmr/0UK54
         AKbwNJ1mr0Utyd9dy+GZQFde9ERwfkOZGflqJIKaoVkZlpEJMSMdz7mmEnsSPavmwyUC
         ykmCj2t8QX9QVjOdA0fELEIK+otJPkcizCFIy5C8drCzOmNXssrLDOrUf4uIGeitcSCh
         n0WmZoRJdS3yxWuacHn1oq+SNFdD7YZoIMopRbB7HoQjmh4KT6eNWYag6HRej/jKQ+2B
         QIxa3reJOciABkFyRJmk6yVjr4YHPoQ6rC64vxVYljISWe97j+l4h5hxzdlZzb6I2kPA
         /T4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455660; x=1792060460;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BRmkdeiD8ReZpDPX5N50tNchauYw/eSsVXxk7TAzHQQ=;
        b=DjTo0nMosbdTeqDxMCtWtI002NiiO13lRVab+Ck9Z0DTfsfn+NbceObfoZVFLiL3R4
         xgFNOdMbrqFDI2BSWwd5KwRz3GaYV9RZMEFcaKgFQGmU/4NbOhmdtuS2oMLpsdJDZkWv
         ezaiZT3vAEeH4AddZZWUf7dMt9eeymPE0V9WAnIyTWdvlRWmjF5tpg9QclYs7eEl0cNb
         FEyJsxcWB9vI79nGHBXTpsgQg2D68p2Bmb4TYRv+7cxu3Uo7vVZoFzc8r1bjLh0F058q
         tEtpH8rYGj6+iJ+LOdH7qSF67TWAoXKsI7nauUwhUeyd+2gCDYrLyVvSDOSNTXKsKaoc
         E9IQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzWjen6FxPjA0cSmf2YTXzq10db9dYDs5PoT0XzMminkjQToLEFtj5VAspCh3mfT2MSinzR/kgitgFiprb@vger.kernel.org
X-Gm-Message-State: AFq9FYJ29WtQlNf9YSu1hm+B/PsgJRAvxo4MpvfYONuqKG5I2DyELFpU
	s1yCS52whTcM4UlGriYXfW8Ng22BZrgIqic54pAYTlRZ1e6ikC2iok0R
X-Gm-Gg: AYBFou2AAi4YEaCM8ffJHKmO2PFP+m0jRywjZCrVLJES/fDKerqiYmdG1QHDYmeaRE5
	qpt4vZ3NiTbFlGnze2qNDojdC37F8yDrMRG14ujfr1HVyETcyfV2V6SzVdjcrZQY/qpB/IoHRVj
	U9Y0jnyIU1jbGs+Nb1E88KrBQsaoglcMsBtUsY9TV1VubK06VK8JlXkepc4FUvYM++pOS20vRrF
	K2WjUF43VVBfFjaYIEgW4gM7EUMHC3CKqM4zDI3tzWDGVjroA76+lNjFQOwhevyshMNG7WoOyFn
	K0+lp9EnGKI8rxH7DNPQIgzdrsezAGpy+yjTyRe+bLGMdHDY2aVaaQknj63pxB9TfEAAa0Q/vSZ
	/hgqzApY1r/K4xcb0nYCqPN2nr6VG5qMKnFy1nwm96p5Kh9r3osExXWxgy82kLRpBIfNkbSE+aV
	RqhdJO3O2ylKGJAKKyAy5oZQCkWX8fWrCkZUuCPjwWuPJ9qD7Sm/3sXBo+L1R3W3Of+204KwsO3
	v6xr7BrHgNzyZoECwIanTMO
X-Received: by 2002:a17:903:1a28:b0:2da:dd0a:99e0 with SMTP id d9443c01a7336-2e7ff49616emr28797475ad.2.1791455659602;
        Thu, 08 Oct 2026 03:34:19 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604b63d9bsm22860405ad.84.2026.10.08.03.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:34:19 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: kaipeng94@gmail.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v4 0/2] Add device tree for Acer Swift Go Pro AI (SFA14-11)
Date: Thu,  8 Oct 2026 18:34:11 +0800
Message-ID: <20261008103414.6170-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006085425.40450-1-kaipeng94@gmail.com>
References: <20261006085425.40450-1-kaipeng94@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kaipeng,

Thanks for working on this device! I have also been working on a device
tree for the same laptop; my series is currently on the list:

https://lore.kernel.org/linux-arm-msm/20260929103053.10241-1-liujianfeng1994@gmail.com/

Since we are both targeting the same hardware, I think it makes sense to
consolidate the two efforts into a single series, as is the usual practice.
Below is a summary of what I found while comparing our versions, hoping
this helps us converge.

A few things I noticed in your v4:

The vdda-phy/vdda-pll supplies appear to be swapped on all four QMP PHYs
(usb_1_ss0_qmpphy, usb_1_ss2_qmpphy, usb_mp_qmpphy0/1). The QMP PHY expects
vdda-phy at ~0.88 V and vdda-pll at 1.2 V. The same issue was fixed
recently on the Purwa boards in commit 7c1d0ef2969e1 ("arm64: dts: qcom:
purwa: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies"), which
includes the reference mapping used by the other X1E boards.

The &tcsr QREF supplies are missing. The qcom,x1e80100-tcsr binding now
requires the vdda-qref*/vdda-refgen* supplies, so DTBS_CHECK reports 18
warnings without them. All other Hamoa boards have been updated with this
block.

The series is missing the QSEECOM allowlist entry for this machine
(firmware: qcom: scm: Allow QSEECOM on ...), which is needed for
uefisecapp / efivars access. I'm carrying that as a separate patch in
my series.

The three PTN3222 eUSB2 repeaters on i2c5 (addresses 0x47/0x4b/0x4f) are
not described. They are present on this board and feed usb_2 (webcam) and
the usb_mp ports.

The displayport-2 DAI link is missing, so audio over the HDMI bridge
doesn't work. My version also sets sound-name-prefix on mdss_dp0/mdss_dp2,
which is needed for the DP audio links.

Two nodes look like they may have been carried over from x1-crd.dtsi
without being verified on this laptop — could you double-check them?

  - key-vol-up: as far as I can tell this laptop has no physical volume
    key (volume is an Fn combo on the keyboard).

  - dmic23 / "VA DMIC2/3" routing: the mic array appears to be a dual-mic
    setup beside the camera — tap-testing around the chassis only shows
    mic response near the camera.

On the naming: upstream asked me to change my compatible to
"acer,swift-sfa14-11" (my v1 used "acer,sfa14-11", following the DMI
product name). Acer's support site calls the machine "Swift SFA14-11", and
I couldn't find "Swift Go Pro AI" as an official product line anywhere.
Since our series use different compatible strings, file names and models,
we'll need to align on one either way — I'm happy to go with whatever
the maintainers prefer.
One question: you enable usb_1_ss1 with its QMP PHY in USB3-only mode
(DP input port deleted). Could you share what it is wired to on this
machine? The only USB-C port is on usb_1_ss0 and the HDMI bridge is fed
from usb_1_ss2_qmpphy, so I wasn't sure what ss1 connects to.

By the way, your EL2-mode testing is a valuable data point — I haven't
tested that configuration. On my side the following is verified working
on hardware: eDP display with PWM backlight, I2C keyboard and touchpad,
USB-A ports, USB-C with DP alt mode (video + audio), HDMI video + audio,
speakers and headphone jack, WiFi and Bluetooth (UART), webcam, NVMe,
GPU and battery charging.

Happy to integrate any findings from your testing into my series, or to
review and help with yours if you prefer to carry it forward — whichever
way the maintainers would like to handle it.

Best regards,
Jianfeng
