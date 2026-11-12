Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469975;
	b=vrm7EvV9r3AH3JIGCJ8jdQQUPg6qLKkq5MZRvtrT+gq3atq09twHwG4u+pJQrgNlgQs2
	 4guU8d8Fahil+pBvkfJUMQLef1q/pw7tdGwQBJDOO2yxJ8qxdXXjYOqvxxBJmjmJARnnt
	 c1G99/ptTvFXk9l/mICy6s/tc8pzvSRD6qkmchHMw9gxkusytW5W/l8anp8ROqVlXewed
	 FcyNbFeZYgwkUwl1SNtyfN/zOkfQBISeN3t7Dhn9nmBYJOIs0vv36WcjN9W82RBoH1X1/
	 WNESGg7cfXqMd495zCzsdT7V2klyNMSncpmAYFv6Zh1Z/cOX0Bxpt0w5TIRJA4UVVHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=JxZOgh8Tz9Rs+HuyIZTWtrxpzparsBej/GhOgMZ7srY=;
	b=VoV7XGJjsFZTCvnZaawYJWd3nnLAFj8CQQZ0MF5H12n4WjfE1W3FeCt7DS386IoXyiR3
	 NMkpiopYBKbWHTa6GN6CKwznL0NvIJzD5yI1O4IMhtqKXDGp7dP0Z0HMwzTbbgFR76aaL
	 UkklXSQsAD82YZBKXH1LIx+mXU79kDdB+oMEGpA5g5u8Cl2FEbn4lX1yhxjbyyflON26I
	 1lpj0dIw5NC7C9zA3izOXdUG4tCi0zUX7tr5ijw5PKAEiUH3Sh9D7B70OIUbUbunjTssx
	 QdGaW/aVsDbBqpM1i7ucHNAm3aDdjNAproGAFQPcnAY/5GWpldphV5/766wYZfPd11Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="nXIA1/dw";
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3526E606A8AE
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 07:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3526E606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nXIA1/dw
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so1845576b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 23:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794469974; x=1795074774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JxZOgh8Tz9Rs+HuyIZTWtrxpzparsBej/GhOgMZ7srY=;
        b=nXIA1/dwI8aBbje4oneHVZT0CmWxD4hmB4d1XEqasuK0bcXE2qU4Tjj2oF6TVcSUtL
         FtNxJWzA1w9INeeR91E4XbWrqnx7wXu6+cfmI7orv5MZFvneEo76RCm4KhJmrTdrFJ7z
         P28JGNGD6XAf8v9drbWrYUQie0SOc3/r4LVJBVl5srLW8sPlRGOCI/6IMNbIodMbErAj
         nTiKDwAmFTvu1kwXXvKSQHJQyhjeq9ry4899ao25WXbhumCGIxFGgmcQSCLNVjxRAW4r
         XW0gCHIeTxvzHw7NqtSHi6sof5BZZczO6S4lSnVEA/doVeqjY7fo4PbrZ6C4Nye9C3wk
         MlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794469974; x=1795074774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JxZOgh8Tz9Rs+HuyIZTWtrxpzparsBej/GhOgMZ7srY=;
        b=ZvWnkpX+JZX0PRNyb+1rc+OUunmDVW6z7fCqy+nty5B8RraRC9Iz0T0+JD4IHEHLvf
         ExPCgDyQD112MTIkkgMb3mXDSVvMMl3NijO/I90BS7yh6teLFi8JAtRwEcDmWGmtPrtd
         nsX13oU93TpDxs5fu6xBwtXDc87VubbGfH1oInRYRsrFypn0/On7yyOte4O5aXwJHTk5
         VesxmyHnBiOQ8Vl+SuvbLNBWQ6urRFiOt+alXOdzmb2X5XAEZAAkaiugL73xewXixLK2
         86O3oWyvCeSMRi/SMXFXUsDLp9uyLBucY8GyTA3t8FH4JhXnW3Zx0EMhf5F8MSsEBpNS
         DLug==
X-Gm-Message-State: APuU4Z8xjQ2DV6fvjXeNwQohWEvCvxeIJwdtwpmTUKJ3HFGhkP3Kwe2z
	CZMB8jcm/0m0Q7KpYKG06Tu+pvlaeUhqdXjbvWkBa3A7QmxgL3GV+gi6wYpH3EUqUUM=
X-Gm-Gg: AYBFou33rW/R7neaaRXyi/9JlRu2jMz46Rjadak9NAmNO6hpdlb88tAJw7PabueFttD
	tNgtd3G5XHG8+Gc7Bz8ffGiKuoE+6A5AXSXAotCwcEgNu0ZfEjSxqV0Xa71WuXM3gh/8Tp33kup
	Hp+28AI3UTZ8lGl4+rUBauW8zbGGKwDvjeZrXXZWCe+uH2Dd3FeAk86lqNkfuIIGemwuwhMyj7t
	PCsjiy9xGH9vr4qK3jaki7hJQAtCRtGRBXe6h/vskozKIPSEvJ1raDrPIe+t2/2fE4/hHgLZQMD
	B6LCBjws9Qw3/XIbtUrI9A9ZCbaFtquczwHFmQoGXBPySfIWgDuv2Qz3baqP+c3oJkpPEli18rP
	XSdrUmKKj4w10XCTsMq3GW2XJsA2D+CSeafqJcCDXhw1cpFj9De0jTVNKJJbYPPb0B4e4F21J6Y
	kH2o8VQPEfLud0IKVHVIupV+xK7CJIDDU5WfLHo2e9LxosO71Sv/da7yBNbml8/JIAV8b1bL+tm
	W6alRgGQKelxGLQFF0NurWk9IXXmodJZsnG36NWblfnHnbbJsoGFrKAkDjVnJB5TZbpWmPxVr/n
	ue3v5p13JQXrADftdg2QHMu9jh/XpA==
X-Received: by 2002:a05:6a00:17a8:b0:891:6d3e:3992 with SMTP id d2e1a72fcca58-8bc1cc6884dmr4894574b3a.46.1794469974348;
        Wed, 11 Nov 2026 23:52:54 -0800 (PST)
Received: from [127.0.1.1] ([116.237.168.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab5f3f99sm3131256b3a.51.2026.11.11.23.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:52:53 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 12 Nov 2026 15:52:08 +0800
Subject: [PATCH 7/8] drm/msm/dpu: ignore merge_3d flush bit for non-CWB
 INTF
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
Message-Id: <20261112-cwb-upstream-v1-7-a6a88d928aa4@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794469928; l=2914;
 i=jun.nie@linaro.org; h=from:subject:message-id;
 bh=9Xse6MQZpCn/nWHqVpI3yh8n18tnb7floW0gWgsrbFk=;
 b=i7Cde9Pr5WbrvmOjjlemGCENIVjn01Df8Sd/E/sUaTSMCbGcBNbCN53IsaPLoFcCriyFLRaqk
 8xM0X53dmrNC7YVgZiskcRaKzoD0TPlSO3Tc/LFitAjwMcms3SQJjYF
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=O9aRQ3+xXWihQiRRgStCET+eFXx1EZs43Fh0Xh+8Bu4=

merge_3d flush bit is always asserted for DSI interface vblank
wait in CWB case, while there is no visual defect actually.
Ignore the bit for now.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  7 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 17 +++++++++++++++--
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 2f19ecfb6020..1a294f817972 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -3050,6 +3050,13 @@ unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)
 	return dpu_enc->dsc_mask;
 }
 
+bool dpu_encoder_in_clone_mode(struct dpu_encoder_phys *phys_enc)
+{
+	struct drm_encoder *encoder = phys_enc->parent;
+
+	return drm_crtc_in_clone_mode(encoder->crtc->state);
+}
+
 void dpu_encoder_phys_init(struct dpu_encoder_phys *phys_enc,
 			  struct dpu_enc_phys_init_params *p)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index b8c8222a03b2..34cde9a64d25 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -354,4 +354,6 @@ void dpu_encoder_phys_init(struct dpu_encoder_phys *phys,
 
 void dpu_encoder_phys_wb_deinit(struct drm_device *dev,
 				struct dpu_encoder_phys *phys_enc);
+
+bool dpu_encoder_in_clone_mode(struct dpu_encoder_phys *phys_enc);
 #endif /* __dpu_encoder_phys_H__ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 2ac517db50fc..7b310fd5db34 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -534,15 +534,28 @@ static int dpu_encoder_phys_vid_wait_for_commit_done(
 {
 	struct dpu_hw_ctl *hw_ctl = phys_enc->hw_ctl;
 	int ret;
+	u32 mask;
 
 	if (!hw_ctl)
 		return 0;
 
+	/*
+	 * For CWB case, DSI path always report timeout. Workaround it for now.
+	 */
+#define  MERGE_3D_IDX   23
+	if (dpu_encoder_in_clone_mode(phys_enc))
+		mask = ~BIT(MERGE_3D_IDX);
+	else
+		mask = 0xffffffff;
+
 	ret = wait_event_timeout(phys_enc->pending_kickoff_wq,
-		(hw_ctl->ops.get_flush_register(hw_ctl) == 0),
+		((hw_ctl->ops.get_flush_register(hw_ctl) & mask) == 0),
 		msecs_to_jiffies(50));
 	if (ret <= 0) {
-		DPU_ERROR("vblank timeout: %x\n", hw_ctl->ops.get_flush_register(hw_ctl));
+		DPU_ERROR("%s phys.split_role %d vblank timeout: %x\n",
+			  phys_enc->parent->name,
+			  phys_enc->split_role,
+			  hw_ctl->ops.get_flush_register(hw_ctl));
 		return -ETIMEDOUT;
 	}
 

-- 
2.53.0

