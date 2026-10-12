Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6391847DD6A
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813138; cv=none; b=QRE0eRtgEIxFhvPaJ3x1VMtgPWhxEG7o3N7wH0wAwUs37ZI23O/YGJ6x3rf9vbnILizbLeFTfPlcSSuj3M4iBWx1h5whloUZHy8HcAjIe957TnTSmPWP0EtkIe3lYdYZpP08yzqEyCcZAqjUBCFDitIzo7qxN6mjkkzzcAOahL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813138; c=relaxed/simple;
	bh=XvgF8W41tbW2lHMVahBlNpldH+YcMd6GhMO1LMhmmQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F8oGD5XTpGZrQwlY39o25z86Lnt4GMqW0G62riAQEIyVvGAWPg0YITdefuhISa5D4YS2F0L10RFpZi4Gccvz9s1jfeYnZbaVPxtVbZNZ4hWZKyim+bVf7SCd5V366NndcEeZIzf19ZxpKv/14/Q8UChazzcqhITbXr4gKD11eX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=NesgzA9v; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="NesgzA9v"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b0946c2c2so1092460f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791813134; x=1792417934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJMs8A9Ik9OWOlzlXjQ55DgLEVWbkbVkWzr7Q1/LXyI=;
        b=NesgzA9vqb1/X6EzJJ1AiUpBokHcMgKVFQDgOFO/xHL/z9gbj/0hltm+1n5SWbO8A8
         9zUGL0dyIA5XHmquCymv203Ko4rr9ItaNtKsGUDQF8AXm5t+VydPwWiVga9gC0PYpj7B
         c2GlgT0qZxlqXKABanP23HXbiswZ0Xxkt1P5j99LOTASIWZx5ssqQYTqNV/LRmCd0jFd
         9IRh8YaggtDrf+uXMqp7BDvzr0ThgtznI3dP+fsV69LPOI+K6XULXkFRHHLWQS+V4Erg
         h/+TiZu1OSZRivIqBG057PPw4blkZT38tgthcyUU3Xxpgh8CM0nk/z3qPgzOLTqQHe9I
         AqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813134; x=1792417934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJMs8A9Ik9OWOlzlXjQ55DgLEVWbkbVkWzr7Q1/LXyI=;
        b=tEYjSinY4r9InrmWmPEhtFjvISgvwTGBXr+SFQOgavxa63/8zuZFo+XvDHCz1GJP4A
         047NHfow/EHNLapCtJ8mITXSYdR0UlnPK9HDefXekBO8E8dcJub4gekADBSL5htRg0k2
         g+TWtnLJZBOHGvxfjhAmdj3NKfuWVBVHl2Om8YzME9tk+aQCf4iaCwVZwzpaL78phTyk
         AaooLgPZQVEiHcFS7FYA07mqHzbcB94Vvpg5IQ/XQNcXPvtAFoN19pM5iOexWzPG8TlZ
         rXnVbGcgXVrq6P9N68sXflXnHxNr5EEXf/f3OIV9g0PnVR2V72zn7HP7aYH4VNsyTZf9
         O3fg==
X-Forwarded-Encrypted: i=1; AKwUvBxYAnFdlUPxtVQ+y7xj+8O7YkXQeBLhwxycMScu3fxg5l+sbba5C3ToyPQYkgFeDTVFkIAa406CE3HLBn4B@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2dOiEpMPEYXPS5i8XYnQV9BzPSZtErU/xVKyUwmXtHwB1CI5W
	fBiZgdfPHB76YovKfjN4B90bEFrC+JX/9D792j9o8Bezb5RUZ5Jmv72npxYwcDPWa+Y=
X-Gm-Gg: AYBFou0I6NrQHNeHqKHt70/Fw12zsGQ5A1FT5DQgq9as3yQiRPn+RmiG23ONS7o9NnJ
	4zLJX5+c211HQaiwKN8hy5iDauE9EzFX34RnmV7OOh8rliWrQWZe8EfuxjQ2Wh4+s+gfCJWRnIN
	uIdNG3VTijEyakn5E5GRPxsBBnoZ7ondPt/RgK0MF6dHzLfCDdZ/ESaMVkmU2EGAAth6fKPi7ZY
	uI9HOHjw7xJeKV27F1oQVNlL3LYzO9XYebPBy3lQZLSM0b0yEtyDMNNc2gmDDvnokTUwEedycGY
	wgHSgQLMzZpZm+fugGfwoZLssPhlhvyueNnh5/Ff4GoRidNR8FWV7gnN8K2QqxnQQYMaNSRTABW
	/QSUYJnrD1NcFUF03liXiYzecXVdqqEWvyaIe7mgvUehhYRmdNjdzKShguHs1EZm9FxpBKG6+nw
	mSWBPQe9P6THmivu8RvYHTsOTp7KMHa6HDrrLAiINblT4TRTRWWvYP6WpL7GkqygM3giR4kktEW
	8SU4mmI/Rmem72j2hhyChsy4WxJKcdIchbKdkl4+1ppIZyHpVbAN4LahOAx1ePSLNGpII02lGBx
	OvZuJAkCfNUGeDNnsDTPWA==
X-Received: by 2002:a05:6000:2002:b0:48d:b940:af77 with SMTP id ffacd0b85a97d-48dbace21ecmr16666213f8f.36.1791813134645;
        Mon, 12 Oct 2026 06:52:14 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e3519sm21355523f8f.16.2026.10.12.06.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:52:13 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Mon, 12 Oct 2026 14:52:01 +0100
Subject: [PATCH v2 2/3] media: qcom: camss: Add the SM8550 CSI TPGs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sm8550-camss-tpg-v2-2-06dbbe36ecd2@imd-tec.com>
References: <20261012-sm8550-camss-tpg-v2-0-06dbbe36ecd2@imd-tec.com>
In-Reply-To: <20261012-sm8550-camss-tpg-v2-0-06dbbe36ecd2@imd-tec.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

The SM8550 TPGs are hardware version 2.1.0, the same as x1e80100,
so describe them with the gen1 TPG ops.

Assisted-by: Claude:claude-opus-5-5
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 drivers/media/platform/qcom/camss/camss.c | 50 +++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 5128dae79103..70f327484503 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3553,6 +3553,54 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 	}
 };
 
+static const struct camss_subdev_resources tpg_res_8550[] = {
+	/* TPG0 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csiphy_rx" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csitpg0" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+	/* TPG1 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csiphy_rx" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csitpg1" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+	/* TPG2 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csiphy_rx" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csitpg2" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+};
+
 static const struct camss_subdev_resources vfe_res_8550[] = {
 	/* VFE0 */
 	{
@@ -7245,12 +7293,14 @@ static const struct camss_resources sm8550_resources = {
 	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8550,
 	.csid_res = csid_res_8550,
+	.tpg_res = tpg_res_8550,
 	.vfe_res = vfe_res_8550,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
 	.icc_res = icc_res_sm8550,
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8550),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8550),
 	.csid_num = ARRAY_SIZE(csid_res_8550),
+	.tpg_num = ARRAY_SIZE(tpg_res_8550),
 	.vfe_num = ARRAY_SIZE(vfe_res_8550),
 };
 

-- 
2.43.0

