Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016576;
	b=cNW7LOl6+hS+QWbPw0pV4gxiUYPYr4c4S2nh8xcYAFOEp+E4Z/HDz/Ojj/SnJziVQkWp
	 qChYBmXWFcskCWDycUT0zPjAOQVnocmoFXNNWG61S/rTraMlJuzNRu0UKgvZo5n7ASLDM
	 +RCMbxJckJjYrbxpmHea+wTaom3lxoM1zZzA06YKVpSlmlHhf+85eeZ6Iu+ImnmV9Tx5L
	 gApYlTlfNrEEpmHoDVoH4SbbWeoGyJzLMKM64hw+uTlCiD+PvvPKfX/Y2WT3wjDpxccwX
	 RrFWn+AuWzT2NrhKvVCv1vYcGXpkrj7PVEKs6gtSvgvZEfv/PADzUWUo/n7UwkZBdQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ldjmu4YxDeIPKd/4OJCM5t43rtkZTUWpd+k6Mdr7ueA=;
	b=pixMu0V91zkc3u08BQBw5y89vQ8T4kcz2GHFaTGuVMt/NywsLO2gA1GheAR528+RRSvF
	 sl4gvl39NkBSJHEyT6vbHLCr7+QG1AMScLNnHYCJd9EUHyDqHeheQUbqIbs3z3J4Fblv6
	 iehM2Hlbx0b0uCUXX4I/hnUFxecE+BsjpcS05ZyC/T9IaXjHUBWOfYt/M6F21JQOnTvfJ
	 WE+aTm2Xab4/j4DTEQ4TL2le8bdUwdWV7lhKSoSXW6gSD2s6nxxETT2wBUevoOyu5vDcY
	 GXW1wJay16z0DOMdrgYyIV4jcvbJxJejr6KlDgdBeAsfnExGGkjqZsrAaUK1yGT0ALw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iIUte97a;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105D4606A334
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 105D4606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iIUte97a
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so27738375e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793016574; x=1793621374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ldjmu4YxDeIPKd/4OJCM5t43rtkZTUWpd+k6Mdr7ueA=;
        b=iIUte97aZggi1ofFx441f7srimg+KRDXl/VmYiuWpcYhadX+Ovwfl4Rh6DwuiJo3Yr
         B6X1SRL1QwmK1NMBD0B9Q443BGgzJTdLi+MZCawjeW8rN90arvLoMnrtTpJc7/mLluS4
         TVxwb82PiDs7/jGS9D5e5z+nMd4j2zGYcmvtwiqzFC9q+AzKtbc0u3feJuOs9cjhQyDl
         49qgIVHn1kly6YBjJCy9qpQpl8DOvzZFmpOBvIGdf5dbFTx4OKjtpmvG8CyNceLUNMSb
         JWMhYaKHBzu1TsYp5uIqVXGuUTnWEgON/ZpQPtZ8AhZAE3spwZVntcErtvMPpPR9vwzm
         fWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016574; x=1793621374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ldjmu4YxDeIPKd/4OJCM5t43rtkZTUWpd+k6Mdr7ueA=;
        b=wEpl3fAWIOySSeFAlIw2Lx3CR5h1dSZIfl2xDuFUj89oFYU7Z9QXm+lGy1mcx2OlVq
         xb/JnJDYwpS+VlW3j2N9rJBfPVTudZcMyaDLO77Yb2xOpg2RGXhLHu5TUDyxvXSWJ0uK
         W7oIJHrGXwNhyrsbVLM/1N/m1d/DdZ9zwK1MuPPqOy4FTYTMqyORoBfwetCK1/6NqoY7
         x4dxATN7Gvz9ESBga4Q97c2dYz+bxv+xt3P+0Nhc/WYRHZkHCA+ek2nEbTxnpgrBSBXz
         QYHYl0eEVuUIVHirU+bz9wB0UB+hdqRTd+oOWJTaGs+ZosaUQ33XqtCBmgoLRrdW5pkQ
         vKdg==
X-Forwarded-Encrypted: i=1; AKwUvBxa4+1gVL53TJGU9ofvpTbTCmimGsZ9rwGLsBaqB2P5u4sqqEQdrOeczpw1t6zpSNWDvog0Me7uP4Lw46Fu@vger.kernel.org
X-Gm-Message-State: AFq9FYIKnlCG0uU0XlKxMcoN+TzXzDicTyigOa19YD2TboTIDX1NIMsU
	Mjuaa1MS5XIPmi9Rj8bQBwAYoNpIE7X6+oMtgSiiLADjwTmbJPw6x/9Z
X-Gm-Gg: AYBFou04DOqxz3m04ixKzPp8GNGAFrGnAC5NQmK+WyeC4zyXXz9mo1eu/8XBvYGriIv
	pQop6LNsJ1eUzCrgUdO+2vBLmgZleosP5iKF4RhL4OTuQHJrckOzFWTsua/YVvpZSF8sHw58hbr
	DV6xaZuAMdcsSlTF03IzJKjKLjsMgtMARZXpgV0chQoxNewHoScMor566w+vobDoQNtIPXtJ4UR
	BWqNgt1tVX4rxl+iDjdJJL2pkMiEzz+UZAxqPqzzGpHzsI0YaMFHE1Cq70ZIt6aSIeJyIDds8+L
	uyW+oOyRdBXE6Rnj3dk/hKNwQ6hDINSeczknz6PDB0CkR1KKcSiH8DvsKEhRtCXKucsyz8dF1Zk
	0Ms4AB8lrOhap6Sa/MHgDFMtpePO8gguWEmHTVu2mbOfNAZz37PXhmkAX9+zMQp4aZLA4bxR4DX
	IUyLTTeeHCleLe7xd8oVdLh77Tsx/SNt+o1pD77vZZhenYPObjN+NX2XI/1N1gWxJrai6XYiTtx
	m1ghH8HAStWO+RkXDVPO7N+ZZe7n7c4H75gUJiwDGMgxqL9nqirJZ3xdRlOzrePqCHNwryvU2N4
	n7wPbplA7uMqe8apzhECm47QjfgEOxO+eJ9U/xtZ9uUCRRJkkmlgKbWzlx+1hwH1FLKsk1UHAlC
	1DwW+
X-Received: by 2002:a05:600c:1987:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4a35ac3a7b1mr111607605e9.2.1793016574151;
        Mon, 26 Oct 2026 05:09:34 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-14-234.xnet.hr. [88.207.14.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a00e1b0sm152200695e9.3.2026.10.26.05.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:09:33 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	ansuelsmth@gmail.com,
	john@phrozen.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH v2 3/4] clk: qcom: gcc-ipq8074: Align CMN PLL inputs with binding
Date: Mon, 26 Oct 2026 13:08:14 +0100
Message-ID: <20261026120920.1667982-3-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026120920.1667982-1-robimarko@gmail.com>
References: <20261026120920.1667982-1-robimarko@gmail.com>
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

The GCC binding names the CMN PLL inputs bias_pll_cc and
bias_pll_nss_noc. Use those names as fw_name so GCC resolves the
clocks through DT references.

Keep the existing .name values as fallbacks for older device trees
without these optional inputs.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
Changes in v2:
- New patch to align GCC parent lookups with the binding input names.

 drivers/clk/qcom/gcc-ipq8074.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
index 1329ea28d703..68c080d49154 100644
--- a/drivers/clk/qcom/gcc-ipq8074.c
+++ b/drivers/clk/qcom/gcc-ipq8074.c
@@ -1132,7 +1132,7 @@ static const struct freq_tbl ftbl_nss_noc_bfdcd_clk_src[] = {
 
 static const struct clk_parent_data gcc_xo_bias_pll_nss_noc_clk_gpll0_gpll2[] = {
 	{ .fw_name = "xo", .name = "xo" },
-	{ .fw_name = "bias_pll_nss_noc_clk", .name = "bias_pll_nss_noc_clk" },
+	{ .fw_name = "bias_pll_nss_noc", .name = "bias_pll_nss_noc_clk" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll2.clkr.hw },
 };
@@ -1357,7 +1357,7 @@ static const struct freq_tbl ftbl_nss_ppe_clk_src[] = {
 
 static const struct clk_parent_data gcc_xo_bias_gpll0_gpll4_nss_ubi32[] = {
 	{ .fw_name = "xo", .name = "xo" },
-	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc", .name = "bias_pll_cc_clk" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll4.clkr.hw },
 	{ .hw = &nss_crypto_pll.clkr.hw },
@@ -1411,7 +1411,7 @@ static const struct clk_parent_data gcc_xo_uniphy0_rx_tx_ubi32_bias[] = {
 	{ .fw_name = "uniphy0_gcc_rx_clk", .name = "uniphy0_gcc_rx_clk" },
 	{ .fw_name = "uniphy0_gcc_tx_clk", .name = "uniphy0_gcc_tx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map gcc_xo_uniphy0_rx_tx_ubi32_bias_map[] = {
@@ -1463,7 +1463,7 @@ static const struct clk_parent_data gcc_xo_uniphy0_tx_rx_ubi32_bias[] = {
 	{ .fw_name = "uniphy0_gcc_tx_clk", .name = "uniphy0_gcc_tx_clk" },
 	{ .fw_name = "uniphy0_gcc_rx_clk", .name = "uniphy0_gcc_rx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map gcc_xo_uniphy0_tx_rx_ubi32_bias_map[] = {
@@ -1704,7 +1704,7 @@ static const struct clk_parent_data gcc_xo_uniphy0_rx_tx_uniphy1_rx_tx_ubi32_bia
 	{ .fw_name = "uniphy1_gcc_rx_clk", .name = "uniphy1_gcc_rx_clk" },
 	{ .fw_name = "uniphy1_gcc_tx_clk", .name = "uniphy1_gcc_tx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map
@@ -1774,7 +1774,7 @@ static const struct clk_parent_data gcc_xo_uniphy0_tx_rx_uniphy1_tx_rx_ubi32_bia
 	{ .fw_name = "uniphy1_gcc_tx_clk", .name = "uniphy1_gcc_tx_clk" },
 	{ .fw_name = "uniphy1_gcc_rx_clk", .name = "uniphy1_gcc_rx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map
@@ -1842,7 +1842,7 @@ static const struct clk_parent_data gcc_xo_uniphy2_rx_tx_ubi32_bias[] = {
 	{ .fw_name = "uniphy2_gcc_rx_clk", .name = "uniphy2_gcc_rx_clk" },
 	{ .fw_name = "uniphy2_gcc_tx_clk", .name = "uniphy2_gcc_tx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map gcc_xo_uniphy2_rx_tx_ubi32_bias_map[] = {
@@ -1907,7 +1907,7 @@ static const struct clk_parent_data gcc_xo_uniphy2_tx_rx_ubi32_bias[] = {
 	{ .fw_name = "uniphy2_gcc_tx_clk", .name = "uniphy2_gcc_tx_clk" },
 	{ .fw_name = "uniphy2_gcc_rx_clk", .name = "uniphy2_gcc_rx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map gcc_xo_uniphy2_tx_rx_ubi32_bias_map[] = {
-- 
2.56.0

