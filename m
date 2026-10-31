Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445754;
	b=Vkv249qR305dV4VKEqs5o+6Qe009hwql1aPPcjKFdjpV0o+ysomEQCciwo2nBxMDwrAb
	 nElWTD1uwpcM+ApTc2WSlAPiXLb7hlkA/HfoPY61jswvFubiajJFQ1rmoXg84rJJYHvRN
	 9BKv+ylP91w91FsHLWZJ+UidnBkswpv0o9AuPkYjhPSS0xVgjzeh2IpmSf3XJUH/39hdD
	 U9IalQDG+v+fS/yLCqPDR/jte6aiWp2DPtZYYHakROPck0uB+cFMDcEwYPaV6f4Oa/dDy
	 vFdA+cEh43K/omYC3/wdIzeS3F6LCB20Gvno/GCzm9o9Dohd9K4XGjKst3/0/u4lAng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WLBh5BTo8i0xLs394OGDtDxi2667Fm5jki33+xLbOY0=;
	b=vRPRpqLhRMGtFEgEpISyiTAIbozThRPQ2367bQO8J1O4WrH4zHX2tR4s7LeuH8aTgGnv
	 BXt3BsICxAkTLB8MeDoIqm7MsPtGNJk7t3Fw9ELyp+TkOGG815g6LSN/C7nckJf7f+AQp
	 MWodMSmYnAq2sfIS3C0qYOHofTlqgmydawBBQEgJb30W9S83ckCHw9ZgZAG75wle1RFBT
	 HhELyauKjyTiSHhg7HZvqDx6o4RU4K9Lv2Z9+p27OIdAL5i+Qnsqlwvpmg/bk5ReXKNWd
	 MrkTfdutWLs1bIfyolGtOIU+ZX7zu+sCQKOdauPIWFYao8sU0bZXbi9Ke3n+h7aODEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="Q89w/7x0";
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16690606A31C
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 11:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16690606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q89w/7x0
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ab3fc6e388so1889711fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 04:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793445747; x=1794050547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLBh5BTo8i0xLs394OGDtDxi2667Fm5jki33+xLbOY0=;
        b=Q89w/7x0HRK2iT442mfAC0Z/blCfysHmO3lk80m/FjOgkZKEmLtVzj32YWikPqRi4U
         qutZF3q5D/mioJ+i5+kpgidXSzYCX9N+Rs8ZJFLCO4ha7GztoVnDD24V58VAfSdNeicv
         SfjVD36PkV0w7XlWvtZOjTCmaieBbBrOGzLq6Z/pO3IPAKij9Vz7xRLV1mGAi+uX2zMT
         vm0pPHf+yZAFjP9Y2TQFDgOKcj0d7eVx3h86k5+OnW6Rcc/GZLOSbruUJXAenQ76+R/P
         nAW0LGVBxP7mpY3I5VysYCyAXBQ6ysEpwyjDMOR/asLyzfE2LbcQFrwEEk5+TrIU1nUE
         q5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793445747; x=1794050547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WLBh5BTo8i0xLs394OGDtDxi2667Fm5jki33+xLbOY0=;
        b=K7bM8hfCp4ip+xhVFcAh6VprRkJ/P7tLtyk2WilPd6Ie/9tOzA6zw9tn+3FyfGvT8K
         EZLol+JfJKEJmyEfIrnwO0o2gAhxW/hQBsTzLjQP+PAPEZ+5d5tZVH06fRBUjX55t1QR
         a+OplcweP7W43NHAW5jFcXuKg2lb/cF2/YqNgWUGk78DpGzolJlFEt5ApEzF42ZidcYH
         kCjqf7hUQs7PLkJPNg+YsNxsJ5QebmtQPT8Bte7wROYfnO55XvB4gxeeQ8Q031TOsytH
         e1XqXMI5+BkaSO0XSNfmt9MTy/+HZiHhMhL8OGE4ZTkcgjHSNk6Bcw5objMRzrsb+PkW
         ep8w==
X-Forwarded-Encrypted: i=1; AKwUvBzjEWUYgANsp4VhyJXTU3xpbSwq518SluMrKBz18PUS5qQJY4eXaInAndpQdalhy4N+35auF4kd70nFTZZd@vger.kernel.org
X-Gm-Message-State: AFq9FYI0KrpbkebBq6kDItrnzjYcUc18AH9l1W3tbX2IZBADzMjXit09
	+rBPW3dByA907DqF59ItaKS6MT5BpclhbEnD06P4tif3WPPP4A8MVRUCPAMBmSiEYXM=
X-Gm-Gg: AYBFou2HAgZFexAZn24NrovkrkRSzWAxeuLnHyNhktoq/Tln9GlC5JQk/OrHUeLYrft
	+fFsQp/edvr3tvaMwx7PnmbNi0z9nV0RN11IqdiGCHPsSqcVI/RN2Q8xoBfjTXUQzVVsODKLt0F
	xm2rcxnnS3CYMLO5FY2xJH8id9Vaer00N389awP7n5IlA6+fflLkd+Eft9sHUmyo25/y2wymOPP
	ehSYdEWKQ+gMXN2SFfbK7nUb4B3jAm/j1uvkSm8baBxDDnRmz12DZdgPtHTTbxh0JroZpepBtzf
	Axhxo8kzZGyijCdDrUhbQ/ZqyKehiYX8dbJryBvookbAtyt5151vN6UrjqNWzxDK2aVLERttSQX
	pqRhxfooPkgvIwp6uaaVgHDmNNAGpggYU1Dpp/T5yP/QibZIMShnze33wnB8DnZsCZ6f1SQUEgf
	QDwVdiGX1ho8qFXqRNXulAxrjWAdgzLvImJT+Oosu+IKAJ2xzXVAnndUmPnodjdRvYCNCH/DEKo
	lQc2K8i5DlXa1eAxlFeMs/KTe2MbTrXOKhzXWbejNJbcbtLhC/bBf3Jp6N7MiCIh05oGpA49Ovs
	kDGsnIL6rKPUha6+x8CjW7Al2tHC3+5JC/LiQykMbRDoOm93DyqTLaqeFterguB1+/onQw==
X-Received: by 2002:a05:6512:3051:b0:5bf:b9ef:d033 with SMTP id 2adb3069b0e04-5bfd9590eedmr2006098e87.5.1793445747319;
        Sat, 31 Oct 2026 04:22:27 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074aad9sm538469e87.75.2026.10.31.04.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:22:26 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 5/6] media: qcom: camss: Add SM8650 TPG support
Date: Sat, 31 Oct 2026 13:22:02 +0200
Message-ID: <20261031112203.545319-6-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
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

Qualcomm SM8650 CAMSS contains three test pattern generator (TPG) blocks
of hardware version 2.2.0, add their resources.

CAMSS TPG on SM8650 needs the non-real time CAMNOC AXI clock to be enabled,
otherwise VFE receives the frame start event, but no data is written.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 53 +++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index cf4687a20dba..9eeb7e4a7315 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3423,6 +3423,57 @@ static const struct camss_subdev_resources csiphy_res_sm8650[] = {
 	},
 };
 
+static const struct camss_subdev_resources tpg_res_sm8650[] = {
+	/* TPG0 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csiphy_rx", "camnoc_nrt_axi" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+			{ 0 },
+		},
+		.reg = { "tpg0" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+	/* TPG1 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csiphy_rx", "camnoc_nrt_axi" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+			{ 0 },
+		},
+		.reg = { "tpg1" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+	/* TPG2 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csiphy_rx", "camnoc_nrt_axi" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+			{ 0 },
+		},
+		.reg = { "tpg2" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+};
+
 static const struct camss_subdev_resources csid_res_sm8650[] = {
 	/* CSID0 */
 	{
@@ -5786,12 +5837,14 @@ static const struct camss_resources sm8650_resources = {
 	.version = CAMSS_8650,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_sm8650,
+	.tpg_res = tpg_res_sm8650,
 	.csid_res = csid_res_sm8650,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
 	.vfe_res = vfe_res_sm8650,
 	.icc_res = icc_res_sm8650,
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8650),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_sm8650),
+	.tpg_num = ARRAY_SIZE(tpg_res_sm8650),
 	.csid_num = ARRAY_SIZE(csid_res_sm8650),
 	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
 };
-- 
2.53.0

