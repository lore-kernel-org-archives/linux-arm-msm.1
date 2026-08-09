Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942E937FF66
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Aug 2026 16:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786291824; cv=none; b=YWdMsugK9yt4B75RZXIrYTmD/IiPAwib+8clORzXy64nh0yqUvAbKiUV7e2RbOblqwERq3SV7AYZR9X1YGovc0WGNyfX+Jo31/aF+MX8qRRgg2OCNZ5NJg2/8+iP63wFD1BX/Ym+rXDshdKSs3xcMT0zNDdL40NBokpehUlkBgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786291824; c=relaxed/simple;
	bh=l/ZEGNAFzHMfVmvEPvd+GUW3qDLOebeT6rsXYOA/+FI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ldP63jN9DVKGSM2yHb4g/QIEHGT5ATM4G1x7RHiM8GinjayA6xjeSIzs8P341f5iHIJQN8jRWJbIRDfFus/gL+310E2CzfN8YNA9wIHvbM+Q6l/wIS0hmfVhCqFPbgDA5HILZ/cN0eNxIwi1GNKap9ssr3DUQO45iCVWnxOtP/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QarT4dWv; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QarT4dWv"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954dff6536so9191875e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 09:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786291820; x=1786896620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nbYtX7IeMY65jB+ZUUL86KrBb5orkg6y9aQT1NrIByY=;
        b=QarT4dWv4O/TCgXP9Y0p7473UjczdHZCcAQv3NRfcddtK/85XSBdqanpv0qqnCztKQ
         /hvwqfG3+wD8hgqiTAAWD3z2HyDA7B5BrvlmzG2FZE4AVWDL+YndJQgicRdAUvxY3mbW
         BL8N6iUT3xDDqV4F9J0oGGrFPM8zjmK6MkmyoVk6Ize5XeyAm4iSVzcI4tVkRD2Eh11m
         acGNzX2heAC0AM2UGQtKcssQ+MGv+FwCwNrGa1Hd9ub2Jg4IyYgYtxhX4tV+NLvxee97
         6r2GNjx6OrniMNdIIms1DRI2hHncbaAzTaf7u8HMuUi4FE3/cAKiU5YZaRJ0E1FyloPK
         jCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786291820; x=1786896620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nbYtX7IeMY65jB+ZUUL86KrBb5orkg6y9aQT1NrIByY=;
        b=lH6F4OtjHqYMocNKOiVTRETv6+7bJIA7X3QB7+tkyxk9iqBGlqETNt0xHlwgOmpR37
         LOWtBo3RREZ4B9+L2wV8JsIQLwIs2ASx05KRqf6uyNdgaE+dIQvCIpxEz4hYPrOD6+KH
         7HnCD63wX3bhwUkra6O1QYwh1QHBJ0nGW3RxMWZvevFZ3jvi+sOS9pGfOPpWapKH5fEq
         tH2K/KIlf/8nbcUX79GepvRJOVSnrrLnZphbJWI7m7snYmeXeUd5TT/T11MwbUpTzhR2
         jv8SkN1FlIksBE4S9EvJKnmgO0qbKZCn8tD9qEQKK/H23if249JNRTszpudimLlWIVFK
         K/sA==
X-Forwarded-Encrypted: i=1; AHgh+RrYaDsVLbfbjQ1VsBcaVq5qUZMh7VrAg+P/kWzDxRIFVd9lmINY87MdsE3WhXHVkAzPJokr1EirzjrnbEW6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+wsMq/JfSE/DfmCR4A0UjJ5DlNZnDTtHdwBlEjBzI2qFt2L6w
	I/jp1A9CsfshInubvtFL8LEyM7OtVJXpkbtXygXQLRquQUbRDzvHb2Ev
X-Gm-Gg: AR+sD125gsyLq/PwEsLxozZFziL2d1tegskvGPFm0f8oYX2DrCNZ0Gu91I7L+H5DTbQ
	2RIF00naivwtPiK2RB1tHWHWeYZ/EsxcAPPjCEj+UZLRlapF3djUPeGFyPdpcvmv8p94ZbB8ycQ
	6UZy5ponM4Z184RfW9+95493S3hD/0WgXl4I1VQ0wcIFjkawi7fgXezrMt/aMNxSmoLgDUKn+WW
	TquX8GITN+2bCJPNRvU0Wbf7UNxRg7C0mYK15hZex12sSaFd1GT0dKxJjoofktVQkoYgTWqjdb1
	UxP2VAxnxbs4n+OqblcGXtIgfQHpjdhAHWzBWFRwgeGKl4wEyOQ8F0AwqhumC46tSi+TlCp64Fa
	q0jgtj48pmOJw/+P3HK/c+Gw2h6fhsOKyRnw7pnUSZOZtAx9UOTv4/+FRNSOxg3hLPugzf76Oar
	mqpY+t9q95CMFiuc1I1xXOK4RcB0U5OL71L3Ujjrlqkwv3feHYPXL8ljOPOHGOp3hG4srR3NnOM
	ZuXAxyzk/0=
X-Received: by 2002:a05:600c:c4ac:b0:495:48d7:f178 with SMTP id 5b1f17b1804b1-49959e2f17cmr252118915e9.11.1786291820114;
        Sun, 09 Aug 2026 09:10:20 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan ([2a00:f44:cc3:6030:e52b:e2ed:f4ea:2bfc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995bdc433bsm227957375e9.1.2026.08.09.09.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 09:10:19 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	Jie Luo <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks enabled
Date: Sun,  9 Aug 2026 18:10:12 +0200
Message-ID: <20260809161012.378743-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <fdc4410c-18f3-4f34-8519-deb37862477c@yahoo.com>
References: <fdc4410c-18f3-4f34-8519-deb37862477c@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 8/8/2026 Mieczyslaw Nalewaj wrote:
> Given the hang is reportedly 100% reproducible pre-userspace, is there
> a concrete next step to root-cause it, or is v3 the right call for now
> with a follow-up tracked separately?

There is a concrete step, and I ran it today on a third board - this
time with no code of mine involved at all.

Hardware: GL.iNet GL-B3000 (IPQ5018), a supported in-tree OpenWrt
board, running the current bone-stock OpenWrt snapshot (kernel
6.18.41, which does not carry this patch). Out of the box it boot
loops: the last line on earlycon is at ~0.39s (the final initcall
before the driver probes start), then silence and a watchdog reset,
100% reproducible.

Adding exactly one thing to the kernel command line - no rebuild, no
patch:

    initcall_blacklist=ipq_cmn_pll_clk_driver_init

makes the same image boot: serial, SPI-NAND, SMEM partitions,
remoteproc all come up.

Combined with what we already know from the other two boards, this
isolates the trigger fairly tightly:

  - cmn-pll probe runs, last PM reference dropped (vanilla): dies
  - cmn-pll probe never runs (blacklist, clocks stay as the
    bootloader left them, i.e. enabled): boots
  - cmn-pll probe runs, reference held: boots - verified on this same
    board today with an image carrying v3 of this patch and nothing
    else changed; it comes up fully (shell over SSH, NAND, remoteproc),
    and clk_summary shows the CMN block bus clocks held enabled by the
    provider device.

The only variable separating the dying case from both surviving ones
is the AHB/SYS gate after probe. What exactly performs the fatal
access afterwards is the remaining open question - and this board is
well suited to answer it, since it has full U-Boot control and can run
experiment kernels from RAM. I intend to bisect that next (my current
suspicion is that the CMN block AHB clock also feeds the register path
of neighbouring blocks in the same region - MDIO at 0x88000/0x90000,
uniphy at 0x98000, CMN at 0x9b000 - which would explain why the CCF's
own runtime PM handling around the clk ops cannot help here). I am
happy to run any experiment Jie would like to see on this hardware.

So to answer the question directly: I believe v3 is the right call now
- three IPQ5018 boards, including a stock-image one, cannot boot
without it and the cost of keeping two bus clocks of a small block
enabled is negligible - with the exact-access root-causing tracked as
a follow-up. If the follow-up ends up pointing at a cleaner fix (e.g.
describing the real consumers of these bus clocks in DT), I will
gladly send it as a successor.

Thanks,
Stanislaw
