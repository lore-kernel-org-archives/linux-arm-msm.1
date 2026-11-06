Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978205;
	b=vCOUm1MZGDSSx6GeRW/s1KGvoIIoJxixPcPX4+Nesj8/AYGJkX2wgWqE3zyyAe71qbPb
	 qNMUnY7mxol8ho5PpfooSKJJ+iFp/m7OXD3/ZL6agMRmWwsqg6K52LzVsntRnII9Gb5IJ
	 9YwUmymivqB4+UnWk0oZrXQ4k8Q6o1MMnuadsGGiMoItSUEmEZTeh+uCDjXQv2UXr7D1b
	 d3cx2GbFUh7mRPLpu4uhPpdfuODsVwHSxnKKzO9tlglQ2OFtqI7oua3HTeBt1UqiyQEHr
	 N4kQCWKkdRuItlQYtH3NH+J9z9V+mqF36PmEKG/1zYzcW/aakdZgkJGMlor07cRYSzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=c7DqBwfCOvSVsSgj/qzC/h4TOpHot16HRpVVgmGU0qw=;
	b=a9j1dk819B+utC/vOT5foQ65qhFBJiZScPghnVaSLJic3MBhnQu6rt1BRpXaZDD52wnS
	 LbzdFSrvAy88P7rFN8dmkmwodKoTQCM3KZtmi6aTUD6VOEtpRa5OY0EcdxHYNLwMptkV5
	 R2NB66pGR369P+B0i2p5+iGTbdEv168ScON8Bk0aNDOJnndd9CXlMmhqYujLllRCGFGpg
	 th7ntIx6xNJ0kL6DrFPALQBDALO6Sw8+WP0yeQRUW7v7wJ9lfS8vApolX9uDu7eevMmc9
	 KOnIO5lDmJm2yJZAYm/hQwwLIdqmMY+tmlFoa2F2uv1KvZjQE+tut2kKAKoSPaXcinQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Do0JzGhN;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AA8606A326
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 15:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1AA8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Do0JzGhN
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36e795af1d4so654676eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 07:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793978204; x=1794583004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c7DqBwfCOvSVsSgj/qzC/h4TOpHot16HRpVVgmGU0qw=;
        b=Do0JzGhNzVIDY8BiFnEhm2v+P6LqjF8efTg+mpnLu/lGFVMhPLcudHIw0oZR6aMZmZ
         Cx2dqeLiuUKo/D8GjF+MC9SqOo1/YXUNojU8kQxfWXY6fLVKPP4tW0Xo1APUVk1K7r6x
         MnkoXfGtNWw1exePsnFJYAePhyDDGxp15gltREqoh6/M/IJiIC32HpJsuaFyb/pSabkq
         Lkm4Jr+SbdwB9UmY1lg3IsP4DQumhurcsx1rakZr7ue5Jb7azcTV2HrVmCqbb2SjKBMx
         mADi7qeWHLhFHaL4xGBbuqsgCoOSPwXavVa2JITRk98jG2hZfpQwtFBqfu/7B/5qZLxb
         whpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978204; x=1794583004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c7DqBwfCOvSVsSgj/qzC/h4TOpHot16HRpVVgmGU0qw=;
        b=GA6W8JcQogP3TJLD29hAPQCCErRIG+R1/iaKKXSl2iiyZPt/X2lAH0KYGZWgl9IttN
         YJbt2J8vq9eqP3GMem9OQr69KRANYegF1zpN4tGGPwIjb9f6VYEUP/dwpuKG4vJJAkVl
         rXGvi7IKPdCGEVtibiGTrg/3olg/tZ1RzpXx8iB+p+rhJ50SgJ4jQUzVGbrJafdn6oZR
         i6fLvpXwQia2kXa2FuYqXCpIE1PWACaqUTrvyKXNBc0tIgmeMUQBTSU2JwaOcsFmYD8M
         g119ggU5nqNhZ2xSqGmlgplJQRVLEOlmJZ6fqC7XJrNVZePW3UMKwcaWcCbIdo8FiGIT
         cX0A==
X-Gm-Message-State: APuU4Z/mrMtZK8cgn9gTegRRXTfzwpk6gfEBmv7PeasNtMbGV19vV5D/
	Z4VoG/gmHm4BSUOC6Z/Npfzf1AWldP4hXRRBvzGqeWyW+96YeGFz53Np
X-Gm-Gg: AYBFou3x6k3gG97uyeNpbjUGMefGBNApQ0T2sW3ro0mrX6vYsaKkHPSjjuFs+Z8Xx5X
	YJgx6H22eCtTGxPznnLiXkaXZy2/i6CzTcx3FVh3QnB+g1FuVUn8qmS8NrZgeYuGQn7S7LILRqi
	XqkK3r6OE/8VR/B1Wk0E6b7jEb14ykaEwf+rck+++8th92o9cihrlxc4J5nPNRd3kxHEgQoH6ul
	u+oYmfOjl6RjmVd/aHDt5GpgRfzrSK4qy8v5n4p8DwR4y1uQBQL6fTP22WpzCgV7GzDMxXIVSYe
	EifHhpuY0+wU9aG60WcPyMOJs80SBUms/LSPVF+5Aj1zK7BJ9ktdkNQSIEpcTY52sI0I7zlgNFc
	AlFGxWIrIyCYsabwDHxh+gwJ9qRnpIp6dF0UKE1n/o4v6PJdd8J4o4ASiNs1c3N0JaC+2w/SZTR
	XKFhkd4qoXSyLFTunudzyTXas2puFPmky/lpnRQfd+uTHg8Ynqjab4ybwZ5pv4jwqtc5C+BAEcr
	l1HvCfkNDq2uPhZjSFKBsrHZNzci/B071+nyrerzsOwrmcB05WPC92bkgF6MxcNAUWAikHZtklo
	lOgZ0Lmqi1XPSWsL9a1/9hL+XOwP6bu0xriQRFQrD1+j9ISFLg3wQa9oJGxGbhHpLVfgVe8g6ql
	Au8H2/DM=
X-Received: by 2002:a05:693c:87c6:20b0:36d:be15:2dd6 with SMTP id 5a478bee46e88-36f786b80a3mr3656191eec.11.1793978204009;
        Fri, 06 Nov 2026 07:16:44 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.221.122])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm7581500eec.18.2026.11.06.07.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:16:43 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Fri, 06 Nov 2026 15:15:40 +0000
Subject: [PATCH v14 5/8] thermal/qcom/lmh: Add support for Qualcomm SM7250
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-sm7250-v14-5-7d167e993f9c@gmail.com>
References: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
In-Reply-To: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Sreeshankar K <sreeshankar0910@gmail.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793978147; l=1842;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=nrvB5zH4Ws6lN2/TYy6n3q0Zl+5LhXT2AF19e7i0mWw=;
 b=Bg26cDWip0StNiuXBGFDPJOYA7KHd30tYkjhqU1XZP27OEap2sAlfVjbtRada9ecFjGKKD0gE
 WxgM/5NqCakBw7UEG/sJYuE/yYsOf69BwoP7gnV/1MR0D6xdbLwbf3h
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Qualcomm SM7250 features an asymmetric 6+2 core topology where the
Silver cluster consists of CPU 0 to CPU 5 and the Gold/Prime cluster
starts at logical CPU 6.

Add the SoC match data defining the CPU-to-node mapping (CPU 0 to
LMH_CLUSTER0_NODE_ID, and CPU 6 to LMH_CLUSTER1_NODE_ID), and register
the "qcom,sm7250-lmh" compatible string so both LMh cluster instances
can probe and register their respective DCVSh interrupt domains.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 drivers/thermal/qcom/lmh.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
index e160ac477..d3e6084e9 100644
--- a/drivers/thermal/qcom/lmh.c
+++ b/drivers/thermal/qcom/lmh.c
@@ -110,12 +110,22 @@ static const struct lmh_soc_map sdm845_map[] = {
 	{ .cpu_id = 4, .node_id = LMH_CLUSTER1_NODE_ID },
 };
 
+static const struct lmh_soc_map sm7250_map[] = {
+	{ .cpu_id = 0, .node_id = LMH_CLUSTER0_NODE_ID },
+	{ .cpu_id = 6, .node_id = LMH_CLUSTER1_NODE_ID },
+};
+
 static const struct lmh_soc_data sdm845_data = {
 	.map = sdm845_map,
 	.num_nodes = ARRAY_SIZE(sdm845_map),
 	.flags = LMH_ENABLE_ALGOS,
 };
 
+static const struct lmh_soc_data sm7250_data = {
+	.map = sm7250_map,
+	.num_nodes = ARRAY_SIZE(sm7250_map),
+};
+
 static const struct lmh_soc_data sm8150_data = {
 	.map = sdm845_map,
 	.num_nodes = ARRAY_SIZE(sdm845_map),
@@ -124,6 +134,7 @@ static const struct lmh_soc_data sm8150_data = {
 static const struct of_device_id lmh_table[] = {
 	{ .compatible = "qcom,sc8180x-lmh", .data = &sm8150_data },
 	{ .compatible = "qcom,sdm845-lmh", .data = &sdm845_data },
+	{ .compatible = "qcom,sm7250-lmh", .data = &sm7250_data },
 	{ .compatible = "qcom,sm8150-lmh", .data = &sm8150_data },
 	{}
 };

-- 
2.43.0

