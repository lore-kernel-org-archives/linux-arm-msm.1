Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7823F50B432
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057796; cv=none; b=MgwWZNfscvbiIoI5oyXbGpMQe1b/6R2qhOwcgneTR1Qux/cJ3Jhkdc8XKIAqfaqIB31CdXs/lDFW9+MIqTf50vAIiUfJcDrCQx2zTZMZ4Eyte5vhZjeG1JyhkH55f3LV81rm9ArfMJI8TPs7JJGqjclwW7/BEzOPEZHGe62ule8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057796; c=relaxed/simple;
	bh=XvgF8W41tbW2lHMVahBlNpldH+YcMd6GhMO1LMhmmQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kTi3lsDETTzStDzOoDqCRv78NqMtoJjzqMtOrCNJ/pVpf175oSn5bl0fA6xr8cKy2aXxauK/vqXF2vyBZ8TYrlv6VWrcb+4vOBxgOtRL6LfsxakOEQDWsbt3rB2UeO1Yga+eJQNv+0mqjsD60cQz+xhX0hsF4ierALgI2uZ3Ggc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=eNDcIh1h; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="eNDcIh1h"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso845248f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1792057793; x=1792662593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJMs8A9Ik9OWOlzlXjQ55DgLEVWbkbVkWzr7Q1/LXyI=;
        b=eNDcIh1hoJ8vA1phnbTk72RnXHYklVjdn3+7LUg0Z/KUaiQUd3SclE63xHRHLsBb1d
         HjWD/iynYwgBM2M9JcSbdw2EPRZB5uT2XqGsmk/H4pUINhWZsMnI0WDcKuvuwZXRcL8L
         Gw/c2TLsQZNvOcRyW/vtAkiry0i3acAU/Vy9AleLCjpMQrF6Xbu90QZR3aNujgvDBhMv
         7TFVIJzS3aTxiD4GHC+TmK6DiXWvwEAQROb3GHu6yKn7rVYYChlNkrfk1S43OeVVzCLd
         v3u6wvATNL2cf8Dm1zgcKYsiFUXnBJiR6CgqNlYEXaLwyXCKD32mKu5uDTOqp9DxeI7K
         ZDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057793; x=1792662593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJMs8A9Ik9OWOlzlXjQ55DgLEVWbkbVkWzr7Q1/LXyI=;
        b=LZhVQN35t/bE3Mt2pKpTnH8NsDCHvOZiPGySPlnH1MeHAbnz8CKgrMBzp7ErrQWeXF
         c1Mi6SDSCsbNHdtnKfn561jNdM2U+hM6O6VDtHrvnlfedD2iUohHHsEngx9kP9aakyA3
         XVEQiYwyFk80fwUCBz+0LgN4Wn/2mHgcsYGLuqW4Hozfozbo2tuUC1IK8h5BK9hU7CZq
         +wfJAJ415/Ft6JM8c5DUOxRrb6V3EoTQTG4JHN+z7p+UJTsZqXn4svWIk/d8ExFeNbAV
         oIkzwbs5m3jk5Pv5+2VXbxaIakHTvPzdB4D0RK3p5/PwX8YZJFrJgCrFAT4l0ULciEia
         HwtA==
X-Forwarded-Encrypted: i=1; AKwUvBzVR7W/hhRdg2Sw33mXPurx2D9SGm8v+dsKfGwhXC4LdquX/V//Sswrm31gMCOAFbhlH9E/YLDL9X3A98uC@vger.kernel.org
X-Gm-Message-State: AFq9FYLuhHlYYl162iFJuB+FSweD1UaCU/Mnuy0sOAGsJSmbOKJQ0KlX
	wjkjL3VtyTasX7y0Aj7gYy2wmmw8C1Zq9lIi3YNxYNL5Y/v1B/IcK29MVmAIF9mAHdc=
X-Gm-Gg: AYBFou1PgOHy8D7m9zCbXnjPEUKE+po7YxMMA3PDjqwqH4ZBjVGZ0Fu9afOV5aj9L2M
	nNS8Ak/v7ZvNfJNI1m3AE1Nd/UmHD+prMMfdZJKNIOFFS6weHRxsRLIRKToZOJLld7BwO/6KTsE
	VMNLROIivQYRpGi+mTzM66nxjzwjHxqUKI9EDRIsG18TVu0NGTNPaGXiUmQUPerV3avKbPc2aVr
	RZ1NqvF0f87mVu+bTdqZMIseaLpAXdpfLS9FmIjmwfAXVSadaKeBYVgD9qyQ6mHtvLIkKOGcmJz
	+GYiUX6RrIXxwIfUAD0I4LRI2AeyuLREECtsbmnTUHpYNaJuXTFPHHUjyE2jg0sPK2W5Mg8L2tV
	00mguCeDRyQLmJl8QWg/pyMAcVWwBZOw5kOxVxL6E2zeUpTjgnO7CpeMBBePg1Ty3fjxVfc3PSC
	PtoeBR/SMimMcGbZOpFuTGVLGClxiuDqc4OqeqpKq5N/mrHjNT6OY61PRHqprgPr2BvNDE8Xwaq
	Iqjidqf+p/simjZRcU0GnGU7W/bBvu22fGYgY1bLDo5vzcsufx9HWoVZ6Kb4A21/vCgnadS4N8M
	mY/JJ94PM8630M9iZwV8OKTuyn4=
X-Received: by 2002:a05:6000:1a8b:b0:488:88ec:59c3 with SMTP id ffacd0b85a97d-48dba9bdc75mr37096945f8f.14.1792057792694;
        Thu, 15 Oct 2026 02:49:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:273c:cd01:737a:1f7b:d586:a293])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc85b1sm16926246f8f.54.2026.10.15.02.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:49:52 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Thu, 15 Oct 2026 10:49:31 +0100
Subject: [PATCH v3 2/3] media: qcom: camss: Add the SM8550 CSI TPGs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sm8550-camss-tpg-v3-2-00fe06a3c557@imd-tec.com>
References: <20261015-sm8550-camss-tpg-v3-0-00fe06a3c557@imd-tec.com>
In-Reply-To: <20261015-sm8550-camss-tpg-v3-0-00fe06a3c557@imd-tec.com>
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

