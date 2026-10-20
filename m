Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479275;
	b=E3LdoNEw3EH3oTB3lKu6K2AE5huAYh/OAHlU9yUWq7VoSRxQHOJQ4fDp6KHm8WDzWlbG
	 GkBgMeCapwlDFFS6XN+ryAM7EoFhiBTTro6s4/eNOj2Np+Uehz534DC7YwLwDS/NDK9jJ
	 LmixiJU2TsAgyjBoHXyfvh0HeNsz/29BhRFOraoC5WXGClfzqfUgO4n1EYD7MGXyE4wKZ
	 XVaGhMSKR3WGsWLdKnYEsvBFH7GDRUdkLczrpnUy5fsz1CM6VnD8GDC7Rej5pGIUCrIHZ
	 +opoHXfb16/Ar0kRC9Rt0vYgSxR52+bpTltMndUCZO5dEcy9GIj3bTur1UGfcu8qxfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BJjTco/BBK0P9An74sSOm1tzYey1GPlNFjyOJY9OwIo=;
	b=PoNcuZmsWKDz5sTBVetLboFb7WAOv0hVYDrKGfj40Uip4QywW+cmxJs+LrE0M4Dl9zPN
	 Ssd7z0XWZewEasDNIc2oqHT7YML7lY3N7IRRwggDUUiMLgSotpspkCV5b5l7O8Ka83wNZ
	 DOgUFKvUag7rta6l6zaTPF6ZJaItzqUakBrUJo5ppiPqVi+pI0U5Rx3KB10NOYrnxBNPf
	 4edHB0wqp+Sk0kW8tgcgRNNzuwEhzvVhxQlDWUiD9p44aj2a5yK6zrPkwtbh8hOSb/+cg
	 UFyArGpWPO8+k2+LQtlFXDFqWAaAsF3piB9H219zRqACa2SvMp3pwlDDf3WoFrfTYog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="a2AMo/QM";
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431DD606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 431DD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=a2AMo/QM
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6aa9164072cso3974741a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 23:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792479272; x=1793084072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BJjTco/BBK0P9An74sSOm1tzYey1GPlNFjyOJY9OwIo=;
        b=a2AMo/QMymtnv5ie+vYewdfNMKkN6lyKSHNxHHeG0rzLRfSkzkuxdawOZmNeGk0sV3
         PEaifSCIDOiXQEaQDQ4lERqky195FcAFGQlxwjd6pdaPlTQ5agX6VDBpIHviY1F8x/w3
         W4/bJmiZiHm0nlyEOeYGCuLc3XX/1xHtTjVb117Sw0+IE5TTN50P0XfZECym1ISC0AGS
         xwF47f/hehl98TI7P0Im8tSinnLKGs6WmnOFMt7mynGJ8hR7NJLiq9Kf45y5PHjv11av
         Oz6fy4PIpqzR3zKY3+WyyWlLp2Z5WCV+NuivX87S4oBIMz3KD/BCYKGbI3oTl0bZMNCw
         exww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792479272; x=1793084072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BJjTco/BBK0P9An74sSOm1tzYey1GPlNFjyOJY9OwIo=;
        b=mn1EXhO98nbcZLeVIcaGNkCRQrfvolb4ZaMuHo0EUeK9yvmkT956gsswt5vquMc/BC
         bxkqtVVQyQzhREFdwY3ObnwITcd+7eFIdZrjzgf+g5zvpRmauxkEQ+fyHYzVP185TgJn
         qr1wns3sfir076+YDaEuizkJYGV8oot08o4AUrTwoLY0UskxN83lwqLZ5oN4ySKJs3Iw
         g1EmpRU/M0beY+zAW2M/jUa9iA6y+eSa/Sz1ao2HCcANhlO6AxJkqHY12TT1rUxouNUf
         YT8LEsXbIn5Lgt4ik0Aftre36yEC5G2GSWsnG/ZWrP8XbiSuF2jxdIVEOgJ4On0mN9E6
         7+jQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjDheMlhgLms7bYI45IYk626eyQivdEB6r3p12DQD2pSoEW7fV3mXQM59xlQ6qView/YMkO/f3hUqfYjrk@vger.kernel.org
X-Gm-Message-State: AFq9FYLa4rNuG4ULPjgP2Dmyv4cmj6T6YPtfGiIIKPS72eAhLNFPLmAg
	+gXRe98NBEaxMLQB/Y6ieuQmeHv4c5M3r14OJnbm2ynXxwVB+7s5J1ziOqNExBglIA==
X-Gm-Gg: AYBFou0OPp2jX0lb7JE2MQ7UGgaCwFmffr0CNT6Sb/Dp3Ecy+bKj/IrMyKV3RjH/7E3
	SdzczNJlaiTwOIeUmMPPkcT8U7Xcif9WwtKvOF5ref1HeXYjbrzjO/lo66wGSG9KIb2R7mN7HVP
	/aol1sWuY9tWuVchm5mt9zHK8gejT9FX8PHSEYUjBpUKQw7YCUh29VRPPRHQdyfrjZAy+dCFWbe
	NNrXrJ3d7HZ+L2t2g1ZQji2Hdob8FR91Z0YtJECfNZRbI3qhBkp6CK0QYHOhdnNkaxlbhfbb+sv
	EBq4WsbuM1NYm7sur9gmFQoewX43oRRQlB5hlKnU/Zupq09oyILVQFzrkea0bwp4jz/fsMG+giI
	7CxVwri5kdNqrn3f8CEIHVbZ9UbwVHqC/yEJOWmA3oGm7aYgVgzUs4lX/mmR7CB5iHnswZJ5eas
	n+3OKgrsUNON7CUalun7vlyz/dvfqiP9SptxXnDr1MJQJNxUHA/DvzH2c7G40xtCPsiJR5A5fz+
	Ih1lYkGoExxWRkQu/91oKkMvodizyXCO46E5qt2gb7jpOicMgyllzB0bFYubgBZUe8SzZlk0I+i
	7fBeMzOnWvv1GMWvw3QK9FAHwe6FVIvF8zG/uIDlAaQfXJDzXvuzzPOgiaF0po3tM3Ji7/4fvom
	54btrWdWC3pb8Lmhfi1uJ3Nbzhaa6t4NtJ0zLbJIDL8bdeiC1JpPhlF3jXhBpGwNqZSJzd3iXM/
	N5xrJ1kA==
X-Received: by 2002:a05:6402:1d54:b0:6b1:b1b9:482b with SMTP id 4fb4d7f45d1cf-6b3a8155676mr6443778a12.14.1792479272378;
        Mon, 19 Oct 2026 23:54:32 -0700 (PDT)
Received: from Desktop.fritz.box ([217.26.232.99])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d6280sm4689846a12.24.2026.10.19.23.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 23:54:31 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Vladyslav Andreichykov <vladdrako007@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-ipq6018: add fallback names for the bias PLL parents
Date: Tue, 20 Oct 2026 08:54:30 +0200
Message-ID: <20261020065430.1251541-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vladyslav Andreichykov <vladdrako007@gmail.com>

bias_pll_cc_clk and bias_pll_nss_noc_clk are outputs of the CMN PLL,
which takes its AHB and SYS clocks from GCC, so the device tree does not
pass them back to GCC. With only .fw_name these parents never resolve,
nss_ppe_clk_src stays an orphan, and setting it to 300 MHz fails with
-EINVAL. The NSS clocks below it, such as gcc_nss_edma_clk, read 0 Hz.

Add .name fallbacks so they resolve to the clocks the CMN PLL registers,
as gcc-ipq8074 already does.

Tested-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/clk/qcom/gcc-ipq6018.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
index 6943dc511534f..f58000407d015 100644
--- a/drivers/clk/qcom/gcc-ipq6018.c
+++ b/drivers/clk/qcom/gcc-ipq6018.c
@@ -360,7 +360,7 @@ static const struct freq_tbl ftbl_nss_ppe_clk_src[] = {
 
 static const struct clk_parent_data gcc_xo_bias_gpll0_gpll4_nss_ubi32[] = {
 	{ .fw_name = "xo" },
-	{ .fw_name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll4.clkr.hw },
 	{ .hw = &nss_crypto_pll.clkr.hw },
@@ -539,7 +539,7 @@ gcc_xo_uniphy0_rx_tx_uniphy1_rx_tx_ubi32_bias[] = {
 	{ .fw_name = "uniphy1_gcc_rx_clk" },
 	{ .fw_name = "uniphy1_gcc_tx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map
@@ -594,7 +594,7 @@ gcc_xo_uniphy0_tx_rx_uniphy1_tx_rx_ubi32_bias[] = {
 	{ .fw_name = "uniphy1_gcc_tx_clk" },
 	{ .fw_name = "uniphy1_gcc_rx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map
@@ -733,7 +733,7 @@ static const struct clk_parent_data gcc_xo_uniphy0_rx_tx_ubi32_bias[] = {
 	{ .fw_name = "uniphy0_gcc_rx_clk" },
 	{ .fw_name = "uniphy0_gcc_tx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map gcc_xo_uniphy0_rx_tx_ubi32_bias_map[] = {
@@ -769,7 +769,7 @@ static const struct clk_parent_data gcc_xo_uniphy0_tx_rx_ubi32_bias[] = {
 	{ .fw_name = "uniphy0_gcc_tx_clk" },
 	{ .fw_name = "uniphy0_gcc_rx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map gcc_xo_uniphy0_tx_rx_ubi32_bias_map[] = {
@@ -1920,7 +1920,7 @@ static const struct clk_parent_data
 	{ .fw_name = "xo" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll2.clkr.hw },
-	{ .fw_name = "bias_pll_nss_noc_clk" },
+	{ .fw_name = "bias_pll_nss_noc_clk", .name = "bias_pll_nss_noc_clk" },
 };
 
 static const struct parent_map gcc_xo_gpll0_gpll2_bias_pll_nss_noc_clk_map[] = {
-- 
2.53.0

