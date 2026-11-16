Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807288;
	b=Zr7IbXBC2ZG2mshANcZkShz1E7zhKkPapPeBo8AGbj+1IcyoHDCEo4yhoCwMPeSXi7b0
	 KCqf10F2t7ao/mIcG0XZB1/e1rv9nWZ3Bd1/T2vQtYq08v/OrCAeqWayjbuLzrPTthh9u
	 flt2GYwGRmvnJ2bXjCfuAlX7MbpkYkZZoI2nN90EuRm+10DjAlbDa1Sed0DSLJJ0am48m
	 cq7PxN/N82mX6xxYSTPrn5n0hvXuboofceyOFSC2i8RelGSd7RgVWT5RwfeY0XZrEQOJQ
	 OaQb6rL9Qkp6rKQQX0wOrWrnS1oMLZn5Z5g4Kr5S/6Syh0KupcBjx1zl+5hcux7jYaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=5rM15kA/3Ad56jxYSDQHLL64BhEdYv0msAd9naeCreY=;
	b=iY5uorQsfpYdsSxq9IFfmDqBmuaht2n98XQ2VqpjuoGR1bab5omsjD4NADRPwkIKmRtS
	 4HXTGhN6S0ZFHe9DlB+V99uN9lRV5KPbLO6RJpXyMve8YCCtwpR6QoBs5m2/bpXqjsvJg
	 4IAFb0NS1uvWgKLzlezbWPP4AiQLYmA0Hk+FH/SlPtVY1mDj2gVZt+YQs+RX2P2MmhuHi
	 jV6/9Xb9T7pa1Gss2313cTVAlpA5kLtsvJWxeel7DAjTXfYT3ZXK41Owi0JHwSDE0jK38
	 fKEyDhCn+aR2fX13xxNk6at3TFEhEhYJCNPFgE2DJ0etURH1h7PJ+ygL3X1egeY28zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n+2iokkR;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FAB606A32C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61FAB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n+2iokkR
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3acec6677so4114593c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 21:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794807287; x=1795412087; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5rM15kA/3Ad56jxYSDQHLL64BhEdYv0msAd9naeCreY=;
        b=n+2iokkRZK+TEW9Uoe26sTwdl6Bu2lE99yd52n8ChO4uZf/u1bHjSHp9yfWrGO+EJv
         TyBoKf5NgbgZmI2rrUP37IdSsFFGvHtw2Il30IWRQMQ0THhAI889Np7KNzJziB0B8GSf
         dwUwgj8GGLSzqPEDC+lRKzbY+m0+IPxIou/SLQxGSMaONwaWCGWJznb/uDeYBS+DFFrU
         zIAT4/l/1rBUEMkQ1w7uHPVEdNhbMTGN2PeaaQ5ZJCTz6jI8TiALOncGRYpE0dDQgqTu
         xkMsBK1BKkC3f6hx+mqGYqDFRtZgXQBEiVJZLnnkFByT6qnL0bNKZ8FoUERnH/xFLJOC
         T2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794807287; x=1795412087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5rM15kA/3Ad56jxYSDQHLL64BhEdYv0msAd9naeCreY=;
        b=gM/6nztyRL+FMOBwd3DwQiF/XUvfLDlEC0vmzCXJkfY3lNgVPftJDY3ex14u6dKeId
         SJ0mPCJ2p7wl/JnvTneV4jKghPZtSsIaaok3lmEEqR9p5gOtiTvylJ44Lf915Pf+xurf
         ln7LbkBFA8DRVbhsZCP8HChs0QVxDezz8VCa9AcFmNOPYe2iYh20UXcjQPMmVs8Cs6Gt
         3no6adLIxvmiutMtSMauqmOzoPRkCO3q8Vn3+/upDtA2DqJwxe9xDQA8EqQRwxulgOny
         J3Er1pA8uaMVs6vU6UEERcfGS1x3V9KYsOHN/VxP41u/MNBM/nd+YzPWHBRHEmlHTfRS
         Fi8g==
X-Gm-Message-State: APuU4Z8VU851gg0nyIvfnk7RChNJc60fwebXXcetVVqoaPHMCzDrljZD
	uuB1KUn30E+qmsbcsDFdlsxER+oSvVwn589kP2Vlgcl6htp7F5XUyqcP
X-Gm-Gg: AYBFou0nqaSdVFU8HonBzZmrferr1qFD8R/pp7Ia99FaViEI4Aqp3LHkw/9R2LVOaf4
	5WeY0Oe9PViNHn6bJtloT+CTbLMxidsKKmHRpIu9hh49NBqMcfTmBnDM9NZaGYdmT4uruxVuB7c
	Zga3PSB7YeTqx0Ygp3Julp69FUvwQ7c11x/Re1Cci+pK3MlbXPmnQ8soVYlGRZ/d7qMyfBxr2zb
	tTirzYTZ2pV7LQOxiF3iSSJXe8qE/yJOihgoJ6h759EROiuEIHQKKWeasmlMUt40c+s9Q+aQO0D
	UjlhCtjfPZtjPPLfM6bSjkrdj9FZ/0y04bvMG5f/VZ7dQ1Tq0vUqQR5A0OQqulZ0k0uVRgBkCGs
	TVZn3Yf5Owh8kn1x1LNz4iVlx17ePy7Cyw9xC0mXwd65oGVIOAE2x3ZRMqe+F0aA5Y3msgiq6wy
	Jdmy99oJIiRbPfPrfv5bkWgSopE07/tWBWaoRucSWYFL7+pO92U8vUV8rOjMFb5IXk39oiRUbcm
	1hXJHmUDgq3joyPthsvm5205a9eHnpY6RAuEwNh1qMN1D47uQMe7M4L2Vp3mokUbdV7dasRdahh
	D7D4fCjJthxa+zMFac28QhxgWJSeVal3edHRFop5rW6rzc9b5wdNMpm6NXzgpcicLIHf7A/IXyn
	rlubRzQ==
X-Received: by 2002:a05:701a:8148:20b0:143:8860:afa1 with SMTP id a92af1059eb24-1b50316df64mr9955968c88.46.1794807287090;
        Sun, 15 Nov 2026 21:34:47 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.206.8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm33463380c88.5.2026.11.15.21.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:34:46 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Mon, 16 Nov 2026 05:33:49 +0000
Subject: [PATCH v15 5/8] thermal/qcom/lmh: Add support for Qualcomm SM7250
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
Message-Id: <20261116-sm7250-v15-5-6acbb232fef8@gmail.com>
References: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
In-Reply-To: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794807229; l=1844;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=0aHr8uXlv4TK4AaeOqsI9fktXurd8KpAEVij0MwE3+4=;
 b=oyZWGR5pSPPZX77WXX7hnPsAue8+y2mhe7hy1SG9KxFMmCj1J3kYO2QrQMMnapinDlETzfF4o
 2MdgrgZPGK5Alfe5SOZj3BGrFM1mZYVwWDCY4CWaT3pkEyqJeLR3wgt
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
index 9d66d75d8..cfb498f69 100644
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
@@ -266,6 +276,7 @@ static int lmh_probe(struct platform_device *pdev)
 static const struct of_device_id lmh_table[] = {
 	{ .compatible = "qcom,sc8180x-lmh", .data = &sm8150_data },
 	{ .compatible = "qcom,sdm845-lmh", .data = &sdm845_data },
+	{ .compatible = "qcom,sm7250-lmh", .data = &sm7250_data },
 	{ .compatible = "qcom,sm8150-lmh", .data = &sm8150_data },
 	{}
 };

-- 
2.43.0

