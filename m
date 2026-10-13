Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2DF3D47C0
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881105; cv=none; b=jVEK2qcHj7oTqfF+rfDKQWHUC87rQX/AXM65y6g8tYYCr8X6YLdwr8mnKxey+96V6y7lWGf4A05hdvWnm/0+luq99jSZ+SwZgHQXMB1pQRsSpD/QnxKNTsrHkBIxegEmkBGj+EArP2zbnVCz71VIBzmxoNtmn3cK4IgMId2ntuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881105; c=relaxed/simple;
	bh=dxKfeZhOUBfoOABK6avNg8yWkrNm3eKo5a6h24zOq/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JJNGaUQV5/un5OUFP+N/oz7YvCjrhwYcMaY7N3FiyjZdJSJtldtatkvfNva4KH1cczKO1AQcNI/wLLBtkHZdDssXP4rsi3kL67aPKJsquClk+eTWoC7Fz7A1oWlwhxHEehiMdNc3vlptA3hBnBg6L6DAQnniLhUdaINK9x/4Z9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=GDqUeDk+; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="GDqUeDk+"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b9d8055dfso2043682f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 01:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791881102; x=1792485902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uy6ZTAPdrtna+roQ3ha5CHRS7kDT58kkQWnsjxlLZa4=;
        b=GDqUeDk+AndIxvEEdMCxwBWMMlD4q+YQ1qFje87u5qziNnRcyA2BTYuszow3cb84S7
         +D26tYiSan6svgPs2M6p181CMDIsyQmzAf7tCA7gC+VSjyP/IvTVvQT71+oMwJye31Zj
         NzqQGubBxnbBKWEnwOYvF8HjwGCS6/ocl6n7mJdmeevZf1+3uy2Dz/s4H8v5uJyVDSSc
         QSTz0OQMEbQPKJIe9cBQx0g4+JGu34/3TjLB0tS6ALkAkRj+Tfpr2rj9HDa9bbFBpmFf
         sMS7ystL8y1KcV3e357VNbPTIGdGYHVl8F1f2+1oGRQtcWPptm7+8Cz1LraDIPQnQQLa
         GozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881102; x=1792485902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uy6ZTAPdrtna+roQ3ha5CHRS7kDT58kkQWnsjxlLZa4=;
        b=mCRaqJkuv0MFbxNuASCYJ1JJ/CoG1s/ugz/AQlxdoXluN+inDoxu0Ks9/cD2eoW8jd
         41IAZ7mqcXv12kM2UxTSZ5xksk9ndM+Ml5stcZ5jC8K9qFlYleWR7RplD5sIPNxhKWbf
         8axyGMLV7sxJRvRYP+dRxzxmxHrMaCA/PtwXP/d7a6ndnuwQWX1AQOoVk+ogq/ZMG8m0
         UrgJbENULqDkCUGH6KE3gMfHfZICd4xufTAXK/RxVVrvFjyHGlsKRfSMbAL/j68/EPM8
         sDhsFgjrgqBlekqIPRIyz1+sWcOJtgmzG+pAGokf9JZhjaayHi0RIVxF9iy5UsSAPgN+
         UltA==
X-Forwarded-Encrypted: i=1; AKwUvBwTZgAHBq1xFA2HKaeFM+kEKHARblUvy8wOmWf/lPTJJEaWpMDYemKEcURhKPtr1SJveuZ8QyX8Zf0LrGw/@vger.kernel.org
X-Gm-Message-State: AFq9FYJ06B/+GA+LTtOgq0A95yHfhdDx3wfGsO2vtCa3V4bxfivNEhun
	0Rb6mAi+wLuO7CU8M4mAOt7y85iGGNov8LbZIR5G4jPSl9osZXGCYGc7s86EcwaArRA=
X-Gm-Gg: AYBFou2xQndbN8IavACdNe9p7JLw4bZ/aErWledYH60QqBusSqjsrbzjLASgLNgJyL2
	nztlaKlCYo7jm7r2OZNkY1168w7IdQ3QwQ1k4fQIGpRtEWaxtcRugP2g7h1IRPqTqHMGru5Ma2d
	F+Pc8WWlDZUTVx+Uyb9Cb+Rvt5cmp5c+eWnvyvuzUa8gvbpR5Xhv3n5oLds3QmGyx+G3FrfZlR3
	nVE/NNwz7bfueqRTl/2lfnl9hzW/zP2afWzPv0ozjQu1+p6kkLD/iWHer2Wp/CRcoXWc3skOw5u
	17ICv6/s8SrFjvghibiwaIfJM2XbGBtf12+/WB+7RPcxp0vol6VtWVkRvCiF8gLdhMuY/V9C2Nh
	geNFaRlwmCKjqUZloJQWQz7ZCsfBti2CxjFMkMINGrw/KKX9pTky/Uqm88gCmgT7OwuC9NhZerw
	EeKChiEVY9IW7tPrN4rXsA7vAWo77/dyVsT3i88XeIUvmeRQl8xDpGcDSTM7j/WC//YyZPNJI6P
	LC8JVzk7njgE3LfwyjjwFC8LNW6HLh5ElfyOv+hKzOC3d2UWoCxplnB9FyHB1uA1DocrGB11Gyl
	OEaNWlhSKObhQiiD+FRHfET+V8I=
X-Received: by 2002:a05:600c:3111:b0:4a0:159b:d2a2 with SMTP id 5b1f17b1804b1-4a18e4e14e8mr216701755e9.29.1791881101852;
        Tue, 13 Oct 2026 01:45:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:273c:cd01:6dd2:be4f:50f7:7ed8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c85009csm271888055e9.2.2026.10.13.01.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:45:01 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Tue, 13 Oct 2026 09:44:47 +0100
Subject: [PATCH RFC 4/4] media: qcom: camss: vfe: Add the IFE 780 pixel
 pipe description
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-sm8550-camss-ife-v1-4-d50de00077b7@imd-tec.com>
References: <20261013-sm8550-camss-ife-v1-0-d50de00077b7@imd-tec.com>
In-Reply-To: <20261013-sm8550-camss-ife-v1-0-d50de00077b7@imd-tec.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

The IFE 780 WB gain registers only take bits 31:17. A Q10 gain there
reaches full scale at 1.0, while the 0x1000 used on the IFE 880 reads
back as zero and every frame comes out black.

Its demosaic also leaks red and blue into green whenever green sits on
a black level pedestal. With AR1335 colour bars magenta comes out white
and red and blue pick up half scale green. Subtracting the black level
in demux + BLS fixes it.

Describe both and use the description on SM8550.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-780.c    | 3 +++
 drivers/media/platform/qcom/camss/camss-vfe-880-pp.c | 6 ++++++
 drivers/media/platform/qcom/camss/camss-vfe-880-pp.h | 1 +
 3 files changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
index 032786c4ed74..63fee6ab64fe 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
@@ -238,6 +238,9 @@ static inline void vfe_reg_update_clear(struct vfe_device *vfe,
  */
 static const struct vfe_pp_desc *vfe_pp_desc(struct vfe_device *vfe)
 {
+	if (vfe->camss->res->version == CAMSS_8550)
+		return &vfe_pp_desc_780;
+
 	return &vfe_pp_desc_880;
 }
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c b/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c
index 87e6a241ec05..2d58d31fddec 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c
@@ -374,6 +374,12 @@ static void vfe_setup_demux_bls(struct vfe_device *vfe, u32 code)
 	writel_relaxed(IFE_DEMUX_BLS_PERIOD(1) | 1, vfe->base + IFE_DEMUX_BLS_MODULE_CFG);
 }
 
+/* IFE 780: Q10 gain held in bits 31:17, its demosaic needs the black level gone */
+const struct vfe_pp_desc vfe_pp_desc_780 = {
+	.wb_gain = 0x400 << 17,
+	.demux_bls = true,
+};
+
 /* IFE 880: Q10 gain of 4.0 */
 const struct vfe_pp_desc vfe_pp_desc_880 = {
 	.wb_gain = 0x00001000,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-880-pp.h b/drivers/media/platform/qcom/camss/camss-vfe-880-pp.h
index 0a5ee6d85312..90e118fa5bde 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-880-pp.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe-880-pp.h
@@ -12,6 +12,7 @@ struct vfe_pp_desc {
 	bool demux_bls;	/* subtract the black level in demux + BLS */
 };
 
+extern const struct vfe_pp_desc vfe_pp_desc_780;
 extern const struct vfe_pp_desc vfe_pp_desc_880;
 
 void vfe_880_setup_pixel_pipe(struct vfe_device *vfe, const struct vfe_pp_desc *desc,

-- 
2.43.0

