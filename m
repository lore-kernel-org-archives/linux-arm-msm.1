Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=94.100.137.107
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794122609;
	b=LAHfW1freAg5H+cVOj/CRxN3SYFrmaIpbaS2ywTSqG1tvVROCLzt3x7WGPsHOOVPLXiB
	 CQtoMbaqBtlkEDmalRZcT9mwCqUF0Te9MsZ0bpu2d+PQLzjUpdmHniSQ/d2RhU8QO0O1z
	 Aig7TgMh5N/2uUun0AxNg7b07bvLqSWCSZVrZcy0TqW5TrpFjk+SJUwALdOk0JnxWfvqP
	 2gVQzx6y+zVbGiIdrDhd0yYD8QLGL7vJfZw8y+jmPCeVAQi0qFbo4zy35sCom5UxtGWok
	 0xrIvlwAYT1Fp+kIfdFkPR1ZXZttlHlz9PO46I4i61m6wsQzmXw3h9FaZacqW0l1ilg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122609;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-cloud-security-sender:
	 X-cloud-security-recipient:X-cloud-security-Mailarchiv:
	 X-cloud-security-Mailarchivtype:X-cloud-security-Virusscan:
	 X-cloud-security-disclaimer:X-cloud-security-connect:
	 X-cloud-security-Digest:X-cloud-security:DKIM-Signature;
	bh=iF3RZzWU8Se+cRJ7T9+DnW6N/jqKZYCmrKktze3/CIw=;
	b=wt6EMAVpFObmYTviN5uWYLAQePb6roY4a2I3VIyq5mUwFKiMGNsv9M9gmhViI5GOq741
	 v9MUy81v/baHvZos/Ji7g/RG5hycdYZfYL6mQo/1Oyg9r2DmEstMT/0C0023X3ppG+tI0
	 kZtnaDoHxS8o6nmiNpaIBhtaSp5ZisLT1HHbiAiYQh4T9W+MzxOUvbkoma2xDgJPmOJuP
	 YMiDudzee9ceqP51egBUeiCrj5D6j4oymsR+FQpaytfcV7EaUk1a1KmrIE1aEWB7jWgu9
	 RBx3FqARX+6SwX1HVtRB33pFFeO3ikMIgW/VRMO3XkA1BsdkXq+ZclHtRi14R0Z9Xxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marcant.net;
	spf=pass smtp.mailfrom=marcant.net;
	dkim=pass header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=gandalf header.b=rjYxRW3p;
	dkim=temperror header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=hse1 header.b=sLR2NpNT;
	arc=fail smtp.remote-ip=94.100.137.107
Received: from mx-relay97-hz2-if1.hornetsecurity.com (mx-relay97-hz2-if1.hornetsecurity.com [94.100.137.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE39606A332
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 07:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CE39606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marcant.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcant.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=gandalf header.b=rjYxRW3p;
	dkim=temperror header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=hse1 header.b=sLR2NpNT
ARC-Authentication-Results: i=1; mx-gate97-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=217.14.160.69, headerfrom=marcant.net)
 smtp.mailfrom=marcant.net smtp.helo=rossini.marcant.net; dkim=pass
 header.d=marcant.net header.s=gandalf header.a=rsa-sha256; dmarc=pass
 header.from=marcant.net orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=iF3RZzWU8Se+cRJ7T9+DnW6N/jqKZYCmrKktze3/CIw=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version; i=1; s=hse1;
 t=1794122594;
 b=XAqB7X/iJbqWQ1J5B0iEHx3bQHXy8u0ajqyUmaxWwVTHXbeCtaoqcDehvAyNGmC4RAnDZDeh
 3GcQR1QQNt6kqKhlAdDz2AnBro32ZfGGU4o3cNvaNDZAEEUKMpMiuPU4ox8yrthyLVtUt2DWr8L
 CG5ag+eUY9oGgXcpzOpMJD52ih+uHPZ+n64kggvDdVGWBXzoUah8TY9hxjnBWVnQ5bDtVWht1ZS
 LDmFI8gdGR5ulyE5zICyClCaybxcDO8cE/pSZz3Tij89Lf9YcJ+WzNcxxvKqj/KM1WhIMsmr0hG
 prOF82f/J6B1KRjWLx9P2DVOu8trLnmGKc9dLvKi/h0Xg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1794122594;
 b=PpVKbgUSe/PdiRnu1AquVHZWJT8c7KZkrkoeuCMT+Y62aES4Jzy7oXRX5aaNu8OXA/+AeXBF
 mrc+L02gDqzaGHyA6nOCjOqPMRNVjL65rGDY3z4ylWXjakA1D8GCwNLqTX7j33HZmlnmSmna+C1
 RVnETYkFix7IL1nuc55Kwuy17fQDasv3rFurYw0+xHSFTi0bu5M8XzmhSzCEas7/1Ip49yAc9vg
 X+yTYFpqCb/61UYGEyWM114w1JZJx4FlLlOKjgxTG6HT9wszMSM3UXH7iEIZqsSGpUy2z1YjocA
 Eh14a2k1yoX/olHBsO7/+GQlH/5piNWyr4YU8abBBd7kA==
Received: from rossini.marcant.net ([217.14.160.69]) by mx-gate97-hz2;
 Sun, 08 Nov 2026 08:23:14 +0100
Received: from futile.kalnet.hooya.de (unknown [192.168.203.16])
	by rossini.marcant.net (Postfix) with ESMTP id 267AD961A85;
	Sun,  8 Nov 2026 08:23:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marcant.net;
	s=gandalf; t=1794122583;
	bh=iF3RZzWU8Se+cRJ7T9+DnW6N/jqKZYCmrKktze3/CIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rjYxRW3pASk7MhXSwxWzzAGXCF+Vo0/6lTj2/f6KyGwBSeLmxSVouIdlwT+IL4N7Y
	 cKoxLp33+LGzGFpWGu6Lf8FF1MBFN0pxp5tbSFR43xLMpeJC7+G54conQEfyZcznG2
	 ir2JNWz7eB9lcAqLl9iw0V5m5CyhAaPCPeRQVQXE=
From: =?UTF-8?q?Andr=C3=A9=20Valentin?= <avalentin@marcant.net>
To: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Julius Bairaktaris <julius@bairaktaris.de>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Valentin?= <avalentin@marcant.net>
Subject: [PATCH 2/2] clk: qcom: gcc-ipq8074: keep port 5 on uniphy1 at SGMII rates
Date: Sun,  8 Nov 2026 08:23:02 +0100
Message-ID: <20261108072302.2311227-3-avalentin@marcant.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261108072302.2311227-1-avalentin@marcant.net>
References: <20261108072302.2311227-1-avalentin@marcant.net>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:avalentin@marcant.net
X-cloud-security-recipient:linux-arm-msm@vger.kernel.org
X-cloud-security-Mailarchiv: E-Mail archived for: avalentin@marcant.net
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate97-hz2 with 4jMksM4CWhz1xmss
X-cloud-security-connect: rossini.marcant.net[217.14.160.69], TLS=1, IP=217.14.160.69
X-cloud-security-Digest:0367d61256b76bfde461c7e6b794fc63
X-cloud-security:scantime:1.650
DKIM-Signature: a=rsa-sha256;
 bh=iF3RZzWU8Se+cRJ7T9+DnW6N/jqKZYCmrKktze3/CIw=; c=relaxed/relaxed;
 d=marcant.net; h=content-type:mime-version:subject:from:to:message-id:date;
 s=hse1; t=1794122594; v=1;
 b=sLR2NpNTznTlAFMlUBPIQOkgcjXuOPy3SeIq2dtR+9GIXH90jWNv4e0TO4wFnU4itnng7o3M
 VCUWFcagZp80xL3vIeVam8duhZPdkqexW1+S93FQKSGHZPpBiAqfGKbVNB3wab1xmKZkd3Ksypv
 pv14Ly+wItKv8gJUZ926g0zuciHB7sUFL44a3/KeAqHTYJ5wAw29Z3tp8HyYCukharaNe0AfPQS
 sP2IacdrqPywW9I8P+mQkLEz+EHshyeJw77EIn4Jm+MBMWPmshRqA+KvFk5xVi0DJ+OPbcKvAk+
 REFYXvOGGGmW68NbI7tY2AGr0+iQ8qDXurasmnaUeuE7w==

Port 5 can be clocked from uniphy1, which runs at 312.5 MHz with the
PHY in 2500BASE-X and at 125 MHz in SGMII. The port 5 RX and TX
frequency tables serve uniphy1 only at 312.5 MHz: 125 MHz lists
uniphy1 / 2.5 and then uniphy0 / 1, 25 MHz lists uniphy1 / 12.5 and
then uniphy0 / 5. __clk_rcg2_select_conf() takes the first config that
gives the rate exactly, so once uniphy1 runs at 125 MHz, a 1G or 100M
rate that reaches the RCG moves the port onto uniphy0 whenever uniphy0
runs at 125 MHz, and otherwise leaves it on uniphy1 at 50 MHz (1G) or
10 MHz (100M).

Add uniphy1 / 1 to the 125 MHz configs and uniphy1 / 5 to the 25 MHz
configs. They go after the existing uniphy1 entries, which serve uniphy1
at 312.5 MHz, so that 2500BASE-X keeps its divider, and before uniphy0.

The port 6 tables already list uniphy2 / 1 and uniphy2 / 5 next to
uniphy2 / 2.5 and uniphy2 / 12.5.

Suggested-by: Julius Bairaktaris <julius@bairaktaris.de>
Signed-off-by: André Valentin <avalentin@marcant.net>
---
 drivers/clk/qcom/gcc-ipq8074.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
index 1329ea28d70..fb172b9aec0 100644
--- a/drivers/clk/qcom/gcc-ipq8074.c
+++ b/drivers/clk/qcom/gcc-ipq8074.c
@@ -1679,11 +1679,13 @@ static struct clk_regmap_div nss_port4_tx_div_clk_src = {
 
 static const struct freq_conf ftbl_nss_port5_rx_clk_src_25[] = {
 	C(P_UNIPHY1_RX, 12.5, 0, 0),
+	C(P_UNIPHY1_RX, 5, 0, 0),
 	C(P_UNIPHY0_RX, 5, 0, 0),
 };
 
 static const struct freq_conf ftbl_nss_port5_rx_clk_src_125[] = {
 	C(P_UNIPHY1_RX, 2.5, 0, 0),
+	C(P_UNIPHY1_RX, 1, 0, 0),
 	C(P_UNIPHY0_RX, 1, 0, 0),
 };
 
@@ -1749,11 +1751,13 @@ static struct clk_regmap_div nss_port5_rx_div_clk_src = {
 
 static const struct freq_conf ftbl_nss_port5_tx_clk_src_25[] = {
 	C(P_UNIPHY1_TX, 12.5, 0, 0),
+	C(P_UNIPHY1_TX, 5, 0, 0),
 	C(P_UNIPHY0_TX, 5, 0, 0),
 };
 
 static const struct freq_conf ftbl_nss_port5_tx_clk_src_125[] = {
 	C(P_UNIPHY1_TX, 2.5, 0, 0),
+	C(P_UNIPHY1_TX, 1, 0, 0),
 	C(P_UNIPHY0_TX, 1, 0, 0),
 };
 
-- 
2.47.3

