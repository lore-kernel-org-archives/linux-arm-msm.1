Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810856;
	b=4fX21rzER9CpOiR7dgrU3AR+MJ7zPl0TjRYxFYtvZuXDlJHZs4ZiQqp3/CbJ+XNkwIjY
	 EGRo769muOZ42+D/gS+vl5j+gYgeHFeyzyj4/V8jhoUAFD5V4SzLoBZkNzhjjezlAjhO7
	 1tNaVBO3JZidG2B1a9KHT7kC0L5+ul2MkhhJcaSlEy1YyfGTCyv/6uDURdBHyjZkhMntJ
	 OZUKL8pw4scikWA/QpyWCktkyU1PNruQmnC8ov7YynmQoDhLHxjE2fjP1Tx5479o1ZmfF
	 ym8Rxv4QSz9XV2s/zd5wPBw8NKH2tILBfOilzLbzvxSNkne4oWhzYuGj8RVlwhqt2tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=8vSo5PyKnquWojnlUKNTbITLgcvow3SdQj1P0U2fTNA=;
	b=c5gYKN04xrPnx9WpkyPnPmBm3M4+NAfl+g9/FqvGD+CXIyd5/FNbAonU67DDnAK5tWlp
	 oMx2H2ke0SdTW74t5OvrksTXV4lrIZx/Eb+Taxgwzem4x9HkSBIZqL2T4BI3fQ+JJDhje
	 KJuYWWY38FmvwEomwDSim97k7nDDIXRagkMVv7uks1d/BGQUoMGnCiM0lOqiuZSzUHWKY
	 9F7U3L0myZ/aW8yy/rhPhLQhL6B6vOace3JtAfhSwmYA1CJZKhGt4H0+LdzMFHhcJk9N6
	 y+vZwszbTDLtu5Qu/LxusNyC25RO/uzmiIwgX5chL76Adwxa+q0g0jSQKPgWVt6FB1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jJUdT/Bm";
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3F9606D806
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 16:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E3F9606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jJUdT/Bm
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15ea896ddc8so1598765c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 08:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810855; x=1794415655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8vSo5PyKnquWojnlUKNTbITLgcvow3SdQj1P0U2fTNA=;
        b=jJUdT/Bm5BSfggP/3oMzI7shF08QAY1a7CC1Y/0EE0NWAzgoC0hvdiGxFJFZDoaMpd
         WfKBaXOd/bllAL/Qo3P1GuN25EXCu11jNFNhwzMQtGVhfr2ukq1k9Ak8rsUe06FEdJPu
         Yd/5JTSJF0Es3UPj06F9a4a6FJHEMAw8S4bUb0E+M4nHv9TI61jpgfOoPs6dXeQgNRvX
         WF1F9RxGR8Wh6j0ASkmYPu140n16p3s7qlIVgF7Jb/CPxeO6oE0Wwm2dIodAbpO23nQT
         jkrexWypvudowL1U5BI6d252hDYryR1qHXUtBWbe7oLyu9Y5OpqVevFXBDFIKSGkO2cH
         GE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810855; x=1794415655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8vSo5PyKnquWojnlUKNTbITLgcvow3SdQj1P0U2fTNA=;
        b=nlH83dRl8gDh1cdbr35GKKQ2k+B/lhXMHWkIoU4yPBxq8C96VcHzTgQ4Jum4nJ0wbl
         k5h1qy4ZiywfG8w6FaiEFgmrfh7gs9IkC762l+Dw77loZkMU/CYdj/H/4q2cldLXlSb4
         nIvGtezRhK1IDzXFBMhUTozrK2aTvj8C+Kojt/6EOFl4hBi444KWxLprs3HyOOykRAZU
         xoLL7HHAanlzAFHMnxOQYGiiYdLT89inYVL1h6B8YgWsKWiF3goENbtNyN2JquDgtugf
         De+su/x2WlSK1SY1wMxrCn+6gXOtb5OfM2vPPWe+R7HgI7gdGyP7AUiFly7ru+PPohmI
         v6YA==
X-Gm-Message-State: APuU4Z/sHo6x3bDBa46fh9NFMagJVRNiNxmbwDuhFlQJ9ZFYgjCIkUjm
	iz2dGU3ontnUN/lUzSTJpCryGnUvOlEPiBh+jUSIHcGUAnIr4aiMhNH+
X-Gm-Gg: AYBFou3zAZpR38U7cAG/+sM2SI8ieBguRCYCTfchY+gNu0NRq72oiOeAPNAgcDUhky+
	DInuda88L7MXTq/cUsbMJL+r2GiOnfthAuiz+GepA3kxJsnwV+vDpBJNXxuQkUsGk3Ye419HRap
	6amaYjVuS+wm0sQSGO+la7MpACFiwHzbcHG6ogQ9z4ZpEzrQRfyWxuQ+tpNHXirjLRMv79i1zJg
	+k/+l/M8jjV1WtRarhDzHYde9BjbIta484KGXaDkHOb6ADv1cHfref/CoAdH8beXJyq+DAWfI7K
	0+Ybvf9mzGwehKw57d4jKYoJwXqWDz0YaOjIe4boeYSBDE0fNEE37nVAfnU8xfCBXyQ2zHItOtF
	NWyz29OWlmYLq8XO6zATlVdTtQL7OwGCECqTv8nRPxA29Mj5hDOZBBjaTO9txOps/n3gmJ8Revd
	W1/bnyZA2MJcsUnfr9GeV4ToMSR387vvRNShotp3swarYWxtl7TUHgHZKrTxhuQP3DjZBT/4Jsc
	SlJ0iPm9szGySMrVOlnFk+iHDiAl5ESnPHGs2GeOJs8ir4RPyhsxNoKA26AZ2Y4StRoBTkk3HtX
	VynRw6RflpebNkI5ts7w+JUZud+/0GNminvrLbsgBMXYf7zuhP0fkhpmt3RpP44HNRxG6Yqf0oH
	jto2v96c=
X-Received: by 2002:a05:701b:4513:10b0:1b2:490b:6fdd with SMTP id a92af1059eb24-1b2490b7174mr2802961c88.24.1793810854626;
        Wed, 04 Nov 2026 08:47:34 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.207.207])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c57430sm10839666c88.18.2026.11.04.08.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:47:34 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 16:46:37 +0000
Subject: [PATCH v13 5/8] thermal/qcom/lmh: Add support for Qualcomm SM7250
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
Message-Id: <20261104-master-v13-5-355b65c6f764@gmail.com>
References: <20261104-master-v13-0-355b65c6f764@gmail.com>
In-Reply-To: <20261104-master-v13-0-355b65c6f764@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793810796; l=1940;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=CFhfNpAR/hsUoYP+FpbYSd22wi56uWW4Vnq2ksqBL70=;
 b=AHV5arLvLuQqAMLn4qDczJBTrUzBqyZHmum7vYKn9NSDkm/FNjxIHZSp/eoAIkIM4IVrypzxN
 KTUVsrytn6yAlacDB88TgXiRGdRNT7Cl5IXO6NA6AoS0kuPs8fkybxB
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
index ef49ed1c6..ad6d34b8e 100644
--- a/drivers/thermal/qcom/lmh.c
+++ b/drivers/thermal/qcom/lmh.c
@@ -110,12 +110,22 @@ static const struct qcom_lmh_node_map sdm845_lmh_map[] = {
 	{ .cpu_id = 4, .node_id = LMH_CLUSTER1_NODE_ID },
 };
 
+static const struct qcom_lmh_node_map sm7250_lmh_map[] = {
+	{ .cpu_id = 0, .node_id = LMH_CLUSTER0_NODE_ID },
+	{ .cpu_id = 6, .node_id = LMH_CLUSTER1_NODE_ID },
+};
+
 static const struct qcom_lmh_soc_data sdm845_lmh_data = {
 	.map = sdm845_lmh_map,
 	.num_nodes = ARRAY_SIZE(sdm845_lmh_map),
 	.flags = LMH_ENABLE_ALGOS,
 };
 
+static const struct qcom_lmh_soc_data sm7250_lmh_data = {
+	.map = sm7250_lmh_map,
+	.num_nodes = ARRAY_SIZE(sm7250_lmh_map),
+};
+
 static const struct qcom_lmh_soc_data sm8150_lmh_data = {
 	.map = sdm845_lmh_map,
 	.num_nodes = ARRAY_SIZE(sdm845_lmh_map),
@@ -124,6 +134,7 @@ static const struct qcom_lmh_soc_data sm8150_lmh_data = {
 static const struct of_device_id lmh_table[] = {
 	{ .compatible = "qcom,sc8180x-lmh", .data = &sm8150_lmh_data },
 	{ .compatible = "qcom,sdm845-lmh", .data = &sdm845_lmh_data },
+	{ .compatible = "qcom,sm7250-lmh",  .data = &sm7250_lmh_data },
 	{ .compatible = "qcom,sm8150-lmh",  .data = &sm8150_lmh_data },
 	{}
 };

-- 
2.43.0

