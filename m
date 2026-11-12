Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469983;
	b=FOvYAyURLL0pvPfuRfWZADRRBZdggES3ITGt+s3annQb4DGllVr8teMRGX1r4kktfMaG
	 VZPB9RBnCgsqP+WjhPOyil3UIEh8ostHzZFjMIy5Mj/B1akXMysHbryjI7IGv7/vFvgVm
	 d71rJQRbYuGnu+/AFfU48DpqX/kICgv80m4hYzwmCKmscAL0lce3vV/e9jCOJDFAUoNW4
	 C9mY3Z8MfTPX077buTBR0OdDPBXh2xzYWnK5nQdW4OkXVsXkWQgsq+dQglhulDKfmTFBq
	 EvjVLA5zOi4TM5K63nlhrUlhChqkou5MUs9fEZg/32mVo/L4mVQz4RWzi2TaCS8qCXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=M7aNgwut6Pkc4vihJRTUegbGMo517hIzijJR1eDiHBI=;
	b=bxeTd2gpBlmKKq6YeHt/fbz/B2g4eQOWJpX53hC3x0wQzJOZPGt51eyilBVJyiutFj8r
	 sv733qWzDFuooZhAzM+U/IVCmfW0G5CKU14+q5kAaHsfJYCcTUIFkP4v0SPco5NBgWsND
	 wZibTXoitfGsbO2roL3ykvAmNFFsbQDzLK5KGgG8BZq1o1YxYeq7MWP+xsJYzNbE5uhoy
	 IzEcyHj8hKOigahpZ++FBiHc/wQoRC1q+ynLt/TXYEfGHtbKPPzgeN5fR0obnJjcToPPu
	 BrQVx4GQpDMKTfxD58Bv/zEXha8PkZFDBtbmmqvj5TVPETz0tqNfA/Y2Luvul5tsrHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Rb+EikeY;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2D8606A32E
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 07:53:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED2D8606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Rb+EikeY
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc147d86bebso344573a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 23:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794469982; x=1795074782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M7aNgwut6Pkc4vihJRTUegbGMo517hIzijJR1eDiHBI=;
        b=Rb+EikeYH2msmOML0IpVzbXgegGDdmInjPT2PLcH5pP/5NJzRihQHXU0qHOBbfZOrE
         Uh40KsIecUD5th33vwzerwQGtZ6AQzjuNMXfeWCbQt0ktOfTZRP6Qwpa8tcu3ML0rSs7
         2byz0PAxSekGfTSx6DqWGErXe9bTRmV/uIKZGQH08+xGxVW7WoD1cw6Q9rusHWDOo6wn
         EFA18kU0YilYCyx2ks7KBg6zidjRdJV5frg60zTnw+NDIyuFcE7OcGxkml63tP6OXdAF
         X/o0iW34mEwuqhjFk+Q42AH2S1sLrBf/A1wH0tlMlIwK/v5NVe0rVNhyp++0arVYR0XB
         uiBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794469982; x=1795074782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7aNgwut6Pkc4vihJRTUegbGMo517hIzijJR1eDiHBI=;
        b=KPqv0gHLrkDBhpwECPk4VBcMW1r8NrlNQwF+6hIoH9F4yZgpafyYTgw04Lio4nM9+L
         NevuseONCWHmeH+M65t3lCvHIygtzE8/HwcD1WxlfVeFRBzf/ry6YhbjXt7k0Pv9uI0p
         TTRNJsE8ppya4lux9pH3KzewW4bRoBjRmPeDT+TJUFaItq7K2krhdp4wbt8JFjvtthqs
         90SJa32DRx31n2zXQS72MqfAD3qxtXAmaCYfJx7qqKmjihCkcLCl9O8k/1btViPwgImp
         bdlaT2ebQU1/cqmoOlVGcnMiAelTYIBUg1ZFXaw3i1dt+x5NaJsrbcAvjWTlYitl037T
         1iHg==
X-Gm-Message-State: APuU4Z+GX/Ot3ikIA0LkG/GETk2K5DPYSRCkbKbm6GpdBeqXRba1geko
	AynPVMF9xHfPH1wjjgL1n7Iz2aD7AnwdVCwuxfe4McLlFOXTH7yB99OUgjRbwowyt6Q=
X-Gm-Gg: AYBFou0tZplxLRtS6pigelT7PheADZR4l1P0aKL0KJuy/1t+E9ciHrBMua0BIWncISu
	tWE0nF+uuUaHhApLE6eMTP3gph5wcG1uKmS0o06ZOx96K6uNuOF8npTdf+LSt3DWI2ItZc0D5G8
	py7ymbjioRLO0f70LjT5dM0J8ESDs/D1xXFg3r5PXfRPlpdId92RXT7uf13SqCHpXOT3exR9Jqx
	08HCOxmwm4dwQVEaWRlBxIaeD/t6ccAhuYV4kxmR46MtitYkJM/yGFKtybHLGFmszIhuRg1Qupw
	0zRhbxjbsPxlC/rokkq85IqmFPhCjBm9GrthqGbyJ6xpcbx5n/yJbkyF0dO1OwlHI1/VcY5c4Dm
	weBCrh0qpk+FNZIH76RIhc3ys/1Uj0IOGIPihTrm3DwSRsQ/DOLylW9s1ojqrUA+fgJCKnUDFRM
	K0WBkYU5oDLgXpPfntt65+hWE+ulVhbwwlbrmkOTNDeOO6NONu3U0DKWs1pb9tal5achA7fl8hd
	jrPBIAlSubGPVa+pzg/K6AQ4mlg4iqxD8ZLQ21Ixsua6q+/CDGgK6Eko4J/dyEBx1SC+P6HCeIw
	0IYC3bf8ZcIlQ0gWYNzQzEEyi3kyx2nnORbyTk4wDkAwVGszdP0=
X-Received: by 2002:a05:6a21:3e0b:b0:3de:57da:7fa6 with SMTP id adf61e73a8af0-3f631b8bac5mr1129232637.39.1794469982178;
        Wed, 11 Nov 2026 23:53:02 -0800 (PST)
Received: from [127.0.1.1] ([116.237.168.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab5f3f99sm3131256b3a.51.2026.11.11.23.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:53:01 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 12 Nov 2026 15:52:09 +0800
Subject: [PATCH 8/8] drm/msm/dpu: Add the all WB interfaces for sm8650
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
Message-Id: <20261112-cwb-upstream-v1-8-a6a88d928aa4@linaro.org>
References: <20261112-cwb-upstream-v1-0-a6a88d928aa4@linaro.org>
In-Reply-To: <20261112-cwb-upstream-v1-0-a6a88d928aa4@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794469928; l=1060;
 i=jun.nie@linaro.org; h=from:subject:message-id;
 bh=b7WDt00uQDDX1aGwCR8y+UiMnK66w5MHAcAsR5IgoCY=;
 b=JFbfRJDpW8UqYouqr6SrrMmcYZaVK8J9uqILmonXoCX21jGi5cYcWkFvkU7POyec+KG+7HOU0
 HPjiFBu634wAJqeSBX2CGYMriG/EIPVgTAnM6RKH6qIDj+heWRXaub2
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=O9aRQ3+xXWihQiRRgStCET+eFXx1EZs43Fh0Xh+8Bu4=

There are 2 WB interfaces in sm8650. Add all of them to support
quad-pipe topology.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 2eef5f69832f..e9fcb402a34c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -315,6 +315,16 @@ static const struct dpu_dsc_cfg sm8650_dsc[] = {
 };
 
 static const struct dpu_wb_cfg sm8650_wb[] = {
+	{
+		.name = "wb_1", .id = WB_1,
+		.base = 0x64000, .len = 0x2c8,
+		.features = WB_SDM845_MASK,
+		.format_list = wb2_formats_rgb_yuv,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
+		.xin_id = 2,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 1),
+	},
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,

-- 
2.53.0

