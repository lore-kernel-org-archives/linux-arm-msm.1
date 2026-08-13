Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBC033D512
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 09:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613641; cv=none; b=iKMmgJK2DKGiRlSKp0ABHGeFdPJrp0q8A3jbD8Dbab3cXpCTfnvkxJsjarIOdaqyaScUqXzhe19pBz64Rfk0oVqIw0MJGAgvkmVgnSHMkZyqHUGIH+0gQrLPaFcFp+1f9m+nRwyG+AUcVE3zq7N2ws3mzu4BVQKLtelOAWnu2hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613641; c=relaxed/simple;
	bh=+ZgFLg7gIY5JDQcE5vHq/6gvkTIVFTG38fLPeRay5vE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mEYM5cH6twNIt/qO15JleL3Vh0Fbxf66DO9YyZquLER2qNY0BidN4/v6xvUjd6FUQucdMenZTbKiFSPryNe6yJZCkiouMY3aRa/c4SAbWPrpswZewHHr6RRNvrhLHetdxFtZ3diUrwiUanZ9Wh2uBY534WjfSSY+KBgfHRaEKHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ER43EA1Q; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ER43EA1Q"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso17426665e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 02:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786613637; x=1787218437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c5eTL5Dg9sWmgGrhxgyFjWTtSF0PKadkaOt/bUjAbeg=;
        b=ER43EA1QEJ4iPU61YeNeI+fCmaoK4zFruFuC7PU5m+Ig4UMnMZJNklKmUs9cLnVFGj
         ar7kJD7ZYQee2w2oae+SbZy9ibqI9OS6WQed0jgDWPxo+IQUK1cGm+d4+l32FT2iffwV
         /b4rAisX+yyTpyMBBRoYQlrCAkadlnTpetKFKIsM62jSVl9VqRZVVYJCB9MUSAis7i8s
         uUtAxiEhrkcAkyDcp3MqzBMd2MPGG2IUqFgk1xuKsEY5W5n+9Y3TTNFfdUZqoYyY7Io6
         mDxfiZ0cTQ2BtupZv9zu4qIjiHktS0ZZF9S1z8c3BtfFN8woghG8t0uwx/K2uAtBNcG4
         mzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786613637; x=1787218437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c5eTL5Dg9sWmgGrhxgyFjWTtSF0PKadkaOt/bUjAbeg=;
        b=L/v4AeeNJCPlPOeEVqxHz6Y6KIXGUaoGnnYOpcCmYSZl7mf4wnLFUUIVY4tGzurRyO
         QV9UNA5nL9e3zWPS4aZvxhcNX6ES7PBMrdmjcmrNz6D14FsaH+mrdoe93ApobmsBDIG4
         HEgCtdbNgq3VMxhVfyBvBrDb7PkqZ7tbBcDXBkEwQ69o9OGKjG1O5UZxtnh6ichlx52T
         BqPuPrIvzfAyFdb1yBx60UJfxyEBmn2EIAJfTHpQ+lbAlFgQ1NCP/wtH+U6PzZLDe0oi
         PEez7R/2H1xivLkrwUe4ufvdFmQ56LeqnS9/nZlaCwuI2yd2A6kFMvR/pGckjwCQ9Tds
         cW7w==
X-Forwarded-Encrypted: i=1; AHgh+Rr7wQGaqpPs2K0pTk2YuSxM7086JvwWbRsHp7gMg6kh2YZPJfocZ/qc0KitddWCrY8qRw5GOWDjXygDGi0e@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+4FS91BYUhZtmfX28CP51FoWWQK37CAEVneY81JYhifXF3iKH
	r6JUH71BuCL8mkBGkGbFR/M1dhRYw8rUsn9GdqiW8GJe5iQsGvVr55GyswZNkxVa
X-Gm-Gg: AR+sD12yi2u0Nvnl5/ieUYRWwh6KRUprKU5jgXGkolvMrLJ3JYa8yQQN73ww6iZASHx
	wVSI/ZDUqyQKBSkqcpcr0kjuwwazH0OnJGC4RZSPaIaJK23SRjHNbF/78/jD+7BdNkLaNbWEZUQ
	me0ruAMZ8AMq8PDUuwc5Dbm5MTy7atFIwS/J4HvWCpNf5aDr2/A/jhOBsJn3qsn13ERO5IW/Fgv
	HyAzqsR7gXK4nlv4B6V69tJ1Ag9HXhBQaYpyMY7mlZxN9gFmXGDbYA0cQ+BRDxgwtNUlpmgWufk
	SF2qDFgE1oCplAKFbzUS8YHONFiyQ9lEsKfOtbMb5LsgcVVH3dDLeZ1VIwCyq3EZ8HPsxp4dko0
	DOzojgTasraBVH4FlnPm/T898s1RBt4DS2mc/UHAntd9yL47nPwEMcQibWM0myQdHZXEaJKoySZ
	a/HMCP7cBWCINB8tZFn3oSGMfvoz8/LyjdpIZm8jNblECuwSHpYJgn5VzjCDp+spwW1VtC9ER6n
	TIts1Y9cAM=
X-Received: by 2002:a05:600c:c4a2:b0:495:4572:21af with SMTP id 5b1f17b1804b1-499821c9ae1mr45551435e9.9.1786613636864;
        Thu, 13 Aug 2026 02:33:56 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan ([2a00:f44:c11:c9a6:c3b1:3676:6b5e:baa3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981b03cd0sm54464975e9.1.2026.08.13.02.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 02:33:56 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Jie Luo <jie.luo@oss.qualcomm.com>,
	Georg Seema <georgseema@gmail.com>,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v4] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks enabled
Date: Thu, 13 Aug 2026 11:33:51 +0200
Message-ID: <20260813093351.178419-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805193638.15327-1-kuncy7@gmail.com>
References: <20260805193638.15327-1-kuncy7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The probe function takes a runtime PM reference to enable the GCC AHB &
SYS clocks of the CMN PLL block, registers the clocks, and then drops
the reference, letting pm_clk gate both clocks asynchronously a few
milliseconds after probe has returned.

On IPQ5018 that gate races with early-boot activity on the bus and can
hang the SoC: boards die silently right after the CMN PLL probe, before
the next initcall gets to run, and the watchdog resets them. Whether a
given kernel binary survives depends on micro-timing, ranging from an
occasional hang to a 100% reproducible boot loop. The failure has been
reported independently on three boards from three vendors (TP-Link
Archer AX55 v1, GL.iNet GL-B3000, Cudy P5).

Isolation on the Cudy P5 (by Georg Seema) shows the failure is a
matter of timing against boot activity, not a steady-state clock
dependency:

 - the probe completes in ~628 us, pm_runtime_put() returns, and the
   board dies before the next initcall starts;
 - stretching the end of probe by ~15 ms (first unintentionally with
   debug prints, then with usleep_range()) makes the same kernel boot
   reliably;
 - on that board an enabled UNIPHY0 node is what arms the failure;
   MDIO0/1, GMAC0/1 and the attached QCA8337 switch do not trigger it.

The armed configuration differs per board: on the GL-B3000 the failure
persists with UNIPHY0 disabled (6 of 7 boots die), so the gate collides
with whatever bus activity is in flight at that moment rather than with
one specific peripheral.

Nor is a delay a workaround: replayed on the GL-B3000, stretching the
end of probe by the same 15 ms - or by a full 2 s - still ends in a
watchdog reset (8 of 8 boots each). A delay only helps where the
sensitive activity happens to be finished before the gate lands, and
how far into boot that extends is board-specific.

Consistently with the race picture, gating the very same clocks on an
idle, fully booted system is harmless: delaying the gate via runtime PM
autosuspend to ~75 s after boot on the GL-B3000 leaves a fully working
system (runtime_status "suspended", WiFi serving clients), matching the
module-insertion test on the IPQ5018 RDP posted by Jie Luo in the
review thread. The clocks are not needed in steady state; it is the
gate landing amid boot activity that kills the SoC. The window between
the CMN PLL probe and the first reference taken by any consumer is
exactly where the gate lands, so no consumer-side scheme can cover it.

Take a devres-managed runtime PM reference in probe, so the bus clocks
stay enabled for as long as the driver is bound and the reference is
released again on unbind.

Fixes: f81715a4c87c ("clk: qcom: Add CMN PLL clock controller driver for IPQ SoC")
Cc: stable@vger.kernel.org
Tested-by: Georg Seema <georgseema@gmail.com>
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
Changes in v4:
- No functional change; the code differs from v3 only in the comment.
  Commit message and comment rewritten now that the failure mode has
  been isolated: v3 claimed the clock ops access the registers without
  a runtime PM reference of their own, which is not accurate (the
  common clock framework wraps provider ops in clk_pm_runtime_get() /
  put()); the actual failure is the race on the gate transition
  described above.
- Added Georg Seema's Tested-by from the OpenWrt pull request carrying
  this patch (https://github.com/openwrt/openwrt/pull/24653); the Cudy
  P5 isolation above is his work, quoted with his permission.
- The idle-gate / boot-gate measurements on the GL-B3000 referenced
  above were posted earlier in this thread:
  https://lore.kernel.org/linux-clk/20260811195317.128954-1-kuncy7@gmail.com/
- New measurement for this revision: the probe-stretch experiment
  replayed on the GL-B3000 (vanilla put plus usleep_range(15000, 16000),
  then plus msleep(2000), everything else stock) dies 8 of 8 boots with
  either delay, while the same 15 ms rescues the Cudy P5 - the basis
  for the "delay is not a workaround" paragraph above.

Changes in v3:
- Fix a reference leak on the devm_pm_runtime_get_noresume() failure
  path: v2 placed the call after pm_runtime_resume_and_get(), so an
  error return skipped the pm_runtime_put() further down and left that
  reference unbalanced. Spotted by Mieczyslaw Nalewaj.
  Rather than unwinding explicitly, the devres get is now taken before
  pm_runtime_resume_and_get(). Both helpers undo their own get on
  failure, so no error path needs cleanup at all.

Changes in v2:
- Use devm_pm_runtime_get_noresume() instead of simply skipping the
  pm_runtime_put() on the probe success path. The v1 arrangement left
  the usage count elevated with nothing to balance it on unbind; the
  devres action releases it.

Note for stable: devm_pm_runtime_get_noresume() was added in v6.16 by
commit 73db799bf5ef ("PM: runtime: Add new devm functions"), while this
driver dates back to v6.14. On 6.14.y/6.15.y (both EOL) the equivalent
is to move the pm_runtime_put() out of probe and add one to
ipq_cmn_pll_clk_remove() instead.

v1: https://lore.kernel.org/linux-clk/20260730191353.557494-1-kuncy7@gmail.com/
v2: https://lore.kernel.org/linux-clk/20260804115359.16633-1-kuncy7@gmail.com/
v3: https://lore.kernel.org/linux-clk/20260805193638.15327-1-kuncy7@gmail.com/

 drivers/clk/qcom/ipq-cmn-pll.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -448,6 +448,18 @@ static int ipq_cmn_pll_clk_probe(struct
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add SYS clock\n");
 
+	/*
+	 * Gating the CMN block AHB & SYS clocks is only safe on an idle
+	 * system: without this reference the gate lands asynchronously a
+	 * few milliseconds after probe, in the middle of the early-boot
+	 * probe activity, and on IPQ5018 that races with other bus
+	 * traffic and hangs the SoC. Hold the reference for as long as
+	 * the driver is bound so that the bus clocks stay enabled.
+	 */
+	ret = devm_pm_runtime_get_noresume(dev);
+	if (ret)
+		return ret;
+
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
 		return ret;
