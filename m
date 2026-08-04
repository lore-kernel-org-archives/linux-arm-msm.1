Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA671381AEF
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 11:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785844572; cv=none; b=DTCMEWtgkOZ0TyhU+uOUyYktzrHaIZ1pissGHfeFlW1drtYw3W/aojNvLMsjxyKKO1hTy2sVEVEguKeUw6/T7XMQgE0vpFOH8uFXDCqluxhmys35PN6HX11UuLOygQsoIc9tAvwDksTDYka/Ra8ZISB+IuLhwY0sI0s8PcDLSoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785844572; c=relaxed/simple;
	bh=f2uFUXzOh9ed2PB9UIZrruaq47ewE/vvHcYpSlqLKnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T4EiVp6+k8HQzskxLwFlV7+2kAdB306V063fFOgYYW0D/kNDoVfz0hODe7uF4WGwrj2EgujnyvNedyyBxyt6HS1iimKrW80tIwpP3AZrMeGgwR6jcDyaNL7KG2TGhEbc28QHt/jT5srgCSVJxseJ1JiwU7vejeJVMM0aPv8jUJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQ6kE6FS; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQ6kE6FS"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so4530841f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 04:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785844568; x=1786449368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hYG4UXLGxO7ttgBOjFjsHN6l7EWjIoeHBMt3IH2Ql0w=;
        b=eQ6kE6FS5C1FLTE3b0HcVxtGNGIQqeYddMidMRyegJk+PAsJ/mlsF+zSeVQXpM/QfP
         p9DGvX/p66Hj/EPbTz3x8YAUNo05bfRGyOaUPit7DCFr91pUAuwXxRIgn8wm6CIv5swS
         t4h5e5tneAkb644hRTzcfUknp4ti7UAZQCy/lSr8RoMKgt2hLLhp4ou1fxwFuTqcW8Z/
         ZMtFeZjVFMA5MjOkAHNcWL7sqXzcL3OsRaYI1KkZEboGJd9gA/aDUTpKnBdGdioccSyb
         Q2GN+5xtUXluWmt9y4K8Ua2UnzbAC0JjwSDIUN1uQRg5wyl1Ci+3twuxzAaQanPuky2U
         u+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785844568; x=1786449368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hYG4UXLGxO7ttgBOjFjsHN6l7EWjIoeHBMt3IH2Ql0w=;
        b=TV4MC1JpxHknj1eLvVFU6Lzk8pSIMt9SrQh9tMvh+yCcXIurgEq9iIC3ogn5g/JXf+
         vIpH9mWjaRIUJXPLCHf58dgJHJ29FjkPoKwzeVpNzNl0LI3z0fXl6L7YU0xlVU6gVQPp
         y/9L6+3Eozc7cau2e/MVQxel7VE23XwWhRMiEHklhRIdhqg7uu3pcBRBG9pAO6qAR10L
         oECj666M9iCNNW5/flXY+0XFpC+3Q6IgdUvY2g04Bw93lCjto5xbmWSE8nDB0AzAXk96
         fjv6L3lSGLG1sYk41ufwhF/l4UAogE8SSjMxFTcE8HhuCQe3R2khgPMTh9WzO4PQnyrP
         kN3A==
X-Forwarded-Encrypted: i=1; AHgh+Rr9ZP4PYqAinbjZbN/Pnr+ws0qREMMK4EzM8doalApPn4d32ksuNdQKWhTt0HYFJLGlv4mPoit48NiTUTtA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz71Knp0ISBCal7GIoxkONbPNYROTDYKlJpvkwD2bwO2H3zGSlj
	EewxvToVlByXthei7qAFh9bmV7X+C4w8t+4MzvBZK+9lBzlIEyXtM3+C
X-Gm-Gg: AR+sD13cQ8KRLeGeEPU5riWVFsHxVcnnEy3p9ujo5H53LJVcciAo5ze7w36gdtnMXz+
	FJV2GBKslfLO86CQIfeSFu2Z1TiJkfVnzHeJ76v76obyWmmmq6PEb13gAK0gRsaYIsWwqCzfZ9L
	fN3IwgEBFVbmI2qToTOROt81+Kilk1nX6x5KOHx/QVYdRbe8Un8I0TxTmvA8PNuLjJbYhlxO5Oz
	F7ukJAhxxbxOr/bTILHK5LAiWoa+SBQHRVX7PZ5wrSfmXxqV4UvNfsVwMQiH0O8ZplyXzGV5siX
	seculfw4/YAvg3FRcH0VDyqYmnZBIDjPbfJ32j6eMdrVLSVdSgVSi5Hb2I3XYDXceZyzWnTEeMD
	4Z5SZ4IY99wzyN4wRLwJs7c0TdamhAN0LdsebEqenuSPFzhE8Zg8WoYoQkfck9qPXBp8rDAQUk8
	ITZtErRrCsSgvWDt2rC3PqH7VYlCkYcmy8hVW46aS/Y94DihGe1zyQhknkepgf02LO0j7ZaEXeC
	v05rkS9JT2STdcK3vGxGn+WZmZQi+roCE3O/QM=
X-Received: by 2002:a05:6000:491d:b0:47f:93fc:2d27 with SMTP id ffacd0b85a97d-47fd72f08f6mr36644389f8f.30.1785844567776;
        Tue, 04 Aug 2026 04:56:07 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (public-gprs192228.centertel.pl. [46.134.90.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1abfsm42083414f8f.37.2026.08.04.04.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:56:07 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Jie Luo <jie.luo@oss.qualcomm.com>,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks enabled
Date: Tue,  4 Aug 2026 13:53:59 +0200
Message-ID: <20260804115359.16633-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730191353.557494-1-kuncy7@gmail.com>
References: <20260730191353.557494-1-kuncy7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The probe function takes a runtime PM reference to enable the GCC AHB &
SYS clocks of the CMN PLL block, registers the clocks, and then drops
the reference, letting pm_clk gate both clocks a few milliseconds after
probe has returned. The clock ops access the CMN PLL registers without
a runtime PM reference of their own, and on IPQ5018 gating the CMN
block bus clocks makes the SoC hang on a subsequent bus access: boards
died silently within milliseconds of the CMN PLL probe, up to a 100%
reproducible boot loop, depending on binary layout (micro-timing).

Take a devres-managed runtime PM reference in probe, so the bus clocks
stay enabled for as long as the driver is bound and the reference is
released again on unbind.

Fixes: f81715a4c87c ("clk: qcom: Add CMN PLL clock controller driver for IPQ SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
Changes in v2:
- Use devm_pm_runtime_get_noresume() instead of simply skipping the
  pm_runtime_put() on the probe success path. The v1 arrangement left
  the usage count elevated with nothing to balance it on unbind; the
  devres action releases it. Spotted by the Sashiko automated review
  (thanks to Mieczyslaw Nalewaj for pointing it out). Note that
  pm_runtime_reinit() on unbind does set the status back to suspended,
  so the leak did not have the re-bind consequences the report
  suggested - but it was a leak nonetheless, and the devres form is
  the idiomatic way to express "keep this device resumed while bound".
- The diff is now purely additive; the existing error handling in
  probe is left untouched.

Note for stable: devm_pm_runtime_get_noresume() was added in v6.16 by
commit 73db799bf5ef ("PM: runtime: Add new devm functions"), while this
driver dates back to v6.14. On 6.14.y/6.15.y (both EOL) the equivalent
is to move the pm_runtime_put() out of probe and add one to
ipq_cmn_pll_clk_remove() instead.

v1: https://lore.kernel.org/linux-clk/20260730191353.557494-1-kuncy7@gmail.com/

 drivers/clk/qcom/ipq-cmn-pll.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -437,6 +437,17 @@ static int ipq_cmn_pll_clk_probe(struct
 	if (ret)
 		return ret;

+	/*
+	 * The clock ops access the CMN PLL registers without taking a
+	 * runtime PM reference of their own, and on IPQ5018 gating the CMN
+	 * block AHB & SYS clocks after probe hangs the SoC on a subsequent
+	 * bus access. Hold a reference for as long as the driver is bound
+	 * so that the bus clocks stay enabled.
+	 */
+	ret = devm_pm_runtime_get_noresume(dev);
+	if (ret)
+		return ret;
+
 	/* Register CMN PLL clock and fixed rate output clocks. */
 	ret = ipq_cmn_pll_register_clks(pdev);
 	pm_runtime_put(dev);
