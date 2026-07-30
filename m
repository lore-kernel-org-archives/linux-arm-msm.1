Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5C5438474
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 19:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785438840; cv=none; b=Wwp6guhVB/mau/9ZHEvgRTOzaTqEP2KKE7hiq8U76tmLMaX03rRYL29X9BrXcKafHYpLsKP2ZpnA7/piIpz/kK1rztUaRpsX9oZxR815AxC7TCT1o8ahkdVx2q4iD46nmiv5eFCztEeW9pmiLQpGl1HJYJN9RV+KYLqdVwNce7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785438840; c=relaxed/simple;
	bh=Topwf+V3jfuUiuzqOBdaGECWQDvVXswPedPSAJACfQo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JBoJ2BUZtHpSrtVCOZHsvmoHKl5SloYnbrFmZI9I4sBDR4fyqCnA6Dt7Z9CNsCVsALC1ryfqVw9IUqLUySwwx/SoEwhwC3Y68RcgJpQyiJaGJw4DQC57d/cg5C88FmbYPisRCplLbgb3dtCNPLiAMZ91ySjazwTGTWywUkadCJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mr2ny54t; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mr2ny54t"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so777375e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785438837; x=1786043637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RD3lmsuBeFnVrxhklpYzLfUZAUon1UxgAvihRoA5NDM=;
        b=mr2ny54tuo212MTH/DQS6J6QiCZLVFtAdpF2X6zZ2VBd91l0ooyVJiFXoOY4ptYY8H
         wvdGye81wyLx1Iuxa5q98YbSSo4I1tThXaER564wh9ZSNOZUijD57OqP+cRHVkxB0alq
         Xts18V0K6C8B+3OtGYvNkQpEzyOnpRaiuofhAf19MllXKSyQkJi1Bt/b5auSULJ4xMzF
         ACRqORVPhprh1HvL2Rc3Sk1OLI+RjfaY2XL/GiDXWrFte3xNKo/FKKvkw3Z0W0Du7Tei
         iFyzYHjE4FtiOVeumdnxNxB16921UK8RlYselZZBnSnydBX3IVFD4ECNJ6Kfu+vm0rzh
         Ukig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785438837; x=1786043637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RD3lmsuBeFnVrxhklpYzLfUZAUon1UxgAvihRoA5NDM=;
        b=HNikkK+fHDSCzM+aRsDkrd/xtOy3iRVUChZlYfqMtYxwuOxu7n1iDVexeCnvwPKYCY
         AQzuwOYfP5vJhHuY3Kgta84+cmrdmLC4Ho2etL6q2kHhBSr/ezoGhfJOumgfewp8M1Xh
         V8f4Wks6FB4kEkF8QlAt4WxLiNuzeLorKyuZ63xVHv4tnxquBkx5bjo3/97d7ugYgWJo
         z3s99RQvDb9j0i2neBgynJc5N8YVl0tIcbLtVomGctLMWBYvr+pJMZD0vP4FBJ8Fe5SL
         sD/2/AqiLWUqS4QOU2mFJWh4B1SLlpLs5XwXrvO23MmVEyLKRofj+FOjjV0XPFAxwFLn
         mHqw==
X-Forwarded-Encrypted: i=1; AHgh+Rr4Zk9JynAHe7Cn06oSUQEM/YcdiRtRM1gDxVJZw80oJaMsBZdVFfpve5U+oqumZYGFXsP527NqQ5tTAwsM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr+Xf54NdmhGCYJXmDt70h45h5349tPKCfLDjKOVYI6ZWp8VYN
	J9Yow3o3AA+OZjNqRO5hf6j/KBYgPkPVjwIT/Pf4PwM9zmh3bl0KivuS
X-Gm-Gg: AR+sD134xmxB6n97vJhD7wWMWrnAP77RVlXwJ12n6I3FnG0vrFp0aYisjt806wPWeu2
	sVRTuYJLbafvUzjBIQi7DCdfqHt8UaKYMUd7wj6rOCYm71IwFTgt3JUq21uBgqrckhTlMn9hZ19
	5iRKKM1mXrmKHbFQGnXlGlyyZGRmC2Zo4QmgrS4VQ0gA3xP+I4eJKqLo7Ctn9H5M8o+zSbYy9OR
	talD2Ak1DW1bXqZiYX0UH8AnKT/Th5GcpckCulqrfcoAlQv1/3dDQfnElm5yubiIbjWjGbDDQI/
	sZXMDhtuuGOoN7pgQKj5gV9aG51PTINNb/rrKaUPJs+4vk6HwnpTqqBAyl8xWN/H5pWrZ1w011j
	UMooIrS3J6MCXxZO6ZY00CnwTc0qdbvwAf7sQwPo5JzWFOa3ankZseb96YDRBsrRAssjo9vR5xu
	UIvQ6qEf4+tTGsHy+9mxfsqmHep3+e03/tPFxN1hX5q1YzcL8w8YSCrtbdc3mQ4nTihmrG4pdYE
	JQ9Ez7mF+ri2uY1GtlaV8XvJ1u9qrhwIDiyUctiGDc8b9+qGKk=
X-Received: by 2002:a05:600c:41c1:b0:495:5b02:23b0 with SMTP id 5b1f17b1804b1-49800eabb56mr33840125e9.26.1785438836682;
        Thu, 30 Jul 2026 12:13:56 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (public-gprs192625.centertel.pl. [46.134.91.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498011e5febsm76121635e9.3.2026.07.30.12.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 12:13:56 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Luo Jie <jie.luo@oss.qualcomm.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Stanislaw Pal <kuncy7@gmail.com>
Subject: [PATCH] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks enabled
Date: Thu, 30 Jul 2026 21:13:53 +0200
Message-ID: <20260730191353.557494-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The probe function takes a runtime PM reference to enable the GCC AHB &
SYS clocks of the CMN PLL block, registers the clocks, and then drops
the reference. Once the autosuspend kicks in, pm_clk gates both clocks
a few milliseconds after probe has returned.

That is wrong on two counts:

  - The clock ops access the CMN PLL registers without taking a runtime
    PM reference of their own, so any later clk_set_rate() or rate
    recalculation touches the register file with its bus clock gated.

  - On IPQ5018 the consequences are not contained to this device:
    gating the CMN block bus clocks makes the SoC hang on a subsequent
    bus access. Measured on a TP-Link Archer AX55 v1 (IPQ5018), the
    machine dies silently within a few milliseconds of the CMN PLL
    probe returning - mid-character on the UART - and the victim is
    whichever device happens to probe next. Whether a given boot
    survives the window is a micro-timing lottery: different binary
    layouts of the same kernel ranged from occasional failures to a
    100% reproducible boot loop.

Keep the runtime PM usage count elevated on the probe success path, so
the bus clocks stay enabled. With this one change the same board went
from boot-looping to surviving every boot attempt (verified across
three previously-failing kernel binaries, plus repeated soft and hard
resets on the final one).

Fixes: f81715a4c87c ("clk: qcom: Add CMN PLL clock controller driver for IPQ SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
One more observation from the same debugging session, for the people
who know this silicon: on IPQ5018 the CMN_PLL_LOCKED bit (offset 0x64,
bit 8) never asserts. Every clk_cmn_pll_set_rate() call runs its
regmap_read_poll_timeout() to the full 100 ms timeout - including under
the bootloader-programmed configuration the hardware demonstrably runs
fine with - and nobody notices, because clk_change_rate() ignores the
.set_rate return value, so the -ETIMEDOUT is swallowed silently. Is the
lock status readable at a different offset on this SoC, or is the bit
simply not functional there? Happy to send a follow-up (surfacing the
error, or skipping the poll where it cannot work) once someone can say
what the intended behavior is.

 drivers/clk/qcom/ipq-cmn-pll.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -454,11 +454,19 @@
 
 	/* Register CMN PLL clock and fixed rate output clocks. */
 	ret = ipq_cmn_pll_register_clks(pdev);
-	pm_runtime_put(dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_put(dev);
 		return dev_err_probe(dev, ret,
 				     "Failed to register CMN PLL clocks\n");
+	}
 
+	/*
+	 * Keep the runtime PM usage count elevated on the success path, so
+	 * the CMN block AHB & SYS clocks stay enabled: the clock ops access
+	 * the CMN PLL registers without taking a runtime PM reference, and
+	 * on IPQ5018 gating these clocks after probe hangs the SoC on a
+	 * subsequent bus access.
+	 */
 	return 0;
 }
 

