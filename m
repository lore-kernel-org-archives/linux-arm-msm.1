Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928891;
	b=abznZXDUmG1Wz51xwlexFZx797USqKFhHQKFTQ1vKJWd9Ah1vlB4WJ6AZpBlAdZ5PmWk
	 j1ok5T/ykbAV97ulTLJ2D8Wo9pRbnT5DLue4DZ2puWtQ4Gas9rGgCdR2eR+pmeMhru3l3
	 3wOPe3iWm5yM67r3uf3dfxCz5xmez+EW9WtoUPY4hPpkhHg4ohR/zVdNZVgK/QMyf6cUd
	 Ja4KUsBi62yXymCS64BlukvXjOkd4taioUDXF5y3sYIUsfemY/55F6Mi4LTHqQ6xjlB4p
	 VrDfjrlTeBIytUJPSOL1XTZy1UYnMMtifFwsZIqS5epGeOQG32+RsRwkvFuv5th8fRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Zunl0JwIxmZyX8SZrTU8vwPCxpDGg8g+6cWHhDCIFBI=;
	b=LdL4aUTNO6mJOUB4xpiv2PC7v4Hb9u4+LzmjoKhph9YqJrqOpDSLEaYV8lg7KOzeQFHQ
	 6JVSUQ5fdwHPh7UL8tLVqsLmlUAYg27NTjST1JpOG5wh1QBOWgwC05saF55HaM9DTh5j6
	 kYJImtk4QRO5S7IXXqYDR/FYlUgS6Ypeg/uXwEkkQ+0OMTCMBsPLD1exD1O1mFxR+l1bN
	 Y8XJkV/vZ63leN6Hyn8ARvJOj/E3iGh+tJPU8J7AuzOdrXKGGqY4cYeXhItf2oTKjbYzE
	 IlBuhR27GNZMzMwtIY9bkknKQyzfWjYzr12lxxtuEROCZo3bdd8fSt5Auvomz36rBew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KqPStFdy;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65607606A889
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 15:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65607606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KqPStFdy
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491971ac844so4131533f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 07:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794928890; x=1795533690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zunl0JwIxmZyX8SZrTU8vwPCxpDGg8g+6cWHhDCIFBI=;
        b=KqPStFdy3f3WqOSRJP9N1ZKxFwzGuQy/WnFg9QgCCbKVO/LGT+iJBg5xxBm6lmLSwq
         CagtxRIx+N4HhGLnkQJSFKhlSRrBcgCAs8YIjkeMsUwwpTPO5j7cf/tJgfemM5H0WvX7
         KIX9zY7zvBpamca6ELDJ4U9ub1FflSYqqS9Sfrpy4meRe9sqXbnahF6t7/MnQUzAs4Wi
         +G3IT/a8A4QidV8esYPfGWyyx0C64wztSTQ1dJ04BxNdXMzwMSzufQp13QZXxcG+XmBp
         6BrhZXHgHc6vcN6HVAP5RSrCvXsX+q+lFIy63YfeSn5gy0+mWeVzX0dlx25MPLX5598k
         vHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794928890; x=1795533690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zunl0JwIxmZyX8SZrTU8vwPCxpDGg8g+6cWHhDCIFBI=;
        b=MtFRmZoVIZEdXqj+WxrLEPmBYKW05tHkHCO68TgXmccCssEOjk3ddPDxQ9PwKB3Nu7
         Ok828jAlTYYasy/b72r5YfoWyuQ0YxmfQ8TqmqXI2dDPrOzn8Shq3RY4jSZYzcqQpTcc
         hv9hhfpz4ETPYpaSxNA2yw4hTaqeYUb5eqweRl8VkQAPE32DNhmqvJmEN27tqR5y/uze
         GENUEMS9jaxGaz6pK74mXcW9bZgOX6aX//F6q/DLxQY1uOwZpO9hRlANWu+84E+rMI1M
         hAoi0UxzkG6k0u+JwoYNZp/X/y+dfCFARzUptR3+sKUkpAj9dW88XYx7o9PFz2NgfXfV
         mqnw==
X-Forwarded-Encrypted: i=1; AL+hErEct1tQ1Fp/GonmPkA497fxBWXGStBcdFubIBrGkJ3aw+kl8Au+zVrRq186iVBlqTV3GjviPK+e5fWBeQfq@vger.kernel.org
X-Gm-Message-State: APuU4Z977UGHWTs/twvPrFXwcltm7SrrRIzM5bqwyCwjgJbMZ6IOpd8Q
	B4tQJJOggqw+nU0j8eEAY295Aual+nWqOta+wBS3wwPeTC1eXO0+jKRjOPs97AGAJfo=
X-Gm-Gg: AZFdTZf6oimfzMcJ5I0XehemN/J/Deparv8PttyiN1bk3Zqt+F/XaWl+Sz8BCnwyTsw
	+/UAMEwpl8fY1gG3nBn2EOJBnwkBfHrmHXLrtH2Bu9tMGufirY7dgmsIue0RPZGpWWqQg0j63ib
	qYDdKI1JahpLok6uqcf7LwzFXDd78tkRhJbwrvHwnfSa1rIMORPX5dCnAs0TJaWQmwvZl+hzNZL
	E6AUp3qEV73GrZxvV7iiudG6NxCkP3DAyvOgPOncZBCxJ7xBuCrgJxJ6/AMvN9q1LP6sKg+SyYJ
	kudAe77yf+njvBy6/plJPH+PDgwvjbXdTMWylprX466obeWHNTWGmnOjYSqj9qDK4ahHlQMG0x8
	Sj6AeBYUzmhf1gX9rH+VSOwNmYgbBNhH3nSjg8LhFthY74odV0vLBLLQ6xFaxtGzEbCUN7lFmD/
	HgVvqvJS0Na7zoZSSJ9Iv5BVUpjXaTjwSEfISlvw1hSB7lCJMf3zizObuQc6LIH4gbuAC5PrsDT
	4bEgmtVNDGhJ95ODNuzFL7aTdNxD82Z/SHYSV+PwHkT5FmsBeLnzLtURHsoHGhmRoi68y/WuEy5
	MchpquPsvsLZHmfzFoTneg4sldGHtUDtie78gYUPszlTVB+6kA==
X-Received: by 2002:a05:6000:1615:b0:48c:466e:9d08 with SMTP id ffacd0b85a97d-49c72e8536dmr19514989f8f.43.1794928889437;
        Tue, 17 Nov 2026 07:21:29 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c607d12c4sm26703133f8f.41.2026.11.17.07.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:21:29 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 17 Nov 2026 16:21:24 +0100
Subject: [PATCH 2/2] media: qcom: iris: venc: drop operating rate to match
 spec
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
Message-Id: <20261117-topic-iris-encoder-fixes-v1-2-169ce990d12d@linaro.org>
References: <20261117-topic-iris-encoder-fixes-v1-0-169ce990d12d@linaro.org>
In-Reply-To: <20261117-topic-iris-encoder-fixes-v1-0-169ce990d12d@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10698;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=9GPfE9Ht3D1byteTL/eXGVaFjjUI/Tw8mGVDqOX85kE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq/HD2Q42sS5C6Dl0H/IYu1MmALdzdHTjv1LsVhpUU
 pyD8DiSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavxw9gAKCRB33NvayMhJ0QLjD/
 94QtNxiQt/YGoJqpOQs9Fm6fP4V1S8b2t0E0obuHeaw775X+tMcMz9M3xKz8PMkRmsh0KJQHJcfOtR
 mFHlN5M7X1YlfjAWZ5WW+qPbEd+1fDt4fjUPV0e/hDNOJLBPuqM1z+tVEtw/svmSWlySpkj0xM0m2l
 w5j+dMI/qBjY+im+dD+juvfF327pPsXQZxn7+e12xCi++Yi2ZFNtkH3psc6Ath4YRS/IwY195E5504
 qblV9OmO9Uu8o3aoqpHszOKykXGaP7d+rZaaTkGiEL26FVh9+8P8vqGf3N8vATMV/1/L4/AQNlQcdr
 GcbDRw9FWHe+5qkGcZJ7wVTeuNX1N2DlZAdZ5zQu88aXguk/jaKvRFAAGRqEQaxxDnGkcIkoxrz0tX
 EgtGEJLuzkwgIQvriyjaq9fZ+4dWIeIP3leUYt37MUkapSdJkyp+cf4AqCU7bEsbVqqB+R/t5sf8Cl
 CjSljSPJJSoOTaUz5ONLDBeot+6UZuqRVM44GhrsflQt7DxPl47So3VesdeRPU8Lc7tuIGx2uD5kEy
 2TYKrRGNnmokuGp4VGv2vF/im0EZYx+HxawrX5TYNeCNYkLY5K8LSvCywiAjFjwqxSTPQnGLUAdTVE
 /7XQx6md+yMkME3Id2ys6498uCi12J5Ok05S/UoSiS5YsCzoGfh51gBgvl5A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Per the V4L2 Stateful Video Encoder UAPI documentation:
  Set the raw frame interval on the OUTPUT queue via VIDIOC_S_PARM().
  This also sets the coded frame interval on the CAPTURE queue to the same value.

This implies setting the frame interval on the OUTPUT queue _should_ be
supported as a single operation, and setting the frame interval on the
CAPTURE queue can be considered as optional since the S_PARM on
the OUTPUT queue will set the same frame interval on the CAPTURE
queue.

The current iris implementation maps:
 - inst->operating_rate to OUTPUT
 - inst->frame_rate to CAPTURE

Only inst->frame_rate is set to the firmware, and inst->operating_rate
is used in combination with inst->frame_rate to calculate
the entire iris bandwidth in iris_check_core_mbps() plus
returing the frame interval with G_PARM on the CAPTURE queue.

So per the Documentation, the two major V4L2 Stateful Video Encoder
client implementation (FFMpeg & GStreamer) only calls S_PARM
on the OUTPUT queue, leaving inst->frame_rate to DEFAULT_FPS,
and only setting inst->operating_rate.

Since inst->operating_rate is currently useless and breaks the
conformance, let's just remove operating_rate entirely
and just set inst->frame_rate only with S_PARM on the OUTPUT
queue.

The two rate variables were probably added to allow scaling
the iris OPP to allow faster encode speed, but wasn't yet
properly implemented and breaks the S_PARM compliance.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_instance.h   |  2 -
 .../platform/qcom/iris/iris_platform_common.h      |  1 -
 .../media/platform/qcom/iris/iris_platform_milos.h |  1 -
 .../platform/qcom/iris/iris_platform_qcs8300.h     |  1 -
 .../platform/qcom/iris/iris_platform_sm8550.h      |  1 -
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  1 -
 .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  |  1 -
 drivers/media/platform/qcom/iris/iris_utils.c      |  8 ++--
 drivers/media/platform/qcom/iris/iris_venc.c       | 53 ++++++----------------
 9 files changed, 18 insertions(+), 51 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 771269e705d9..8eaeae5aff5f 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -59,7 +59,6 @@ struct iris_hfi_session_ops;
  * @last_buf_ns: start time of received input buffer for current one second FPS window
  * @frame_counter: input buffer counter for current one second FPS window
  * @frame_rate: frame rate of current instance
- * @operating_rate: operating rate of current instance
  * @hfi_rc_type: rate control type
  * @enc_raw_width: source image width for encoder instance
  * @enc_raw_height: source image height for encoder instance
@@ -107,7 +106,6 @@ struct iris_inst {
 	u64				last_buf_ns;
 	u32				frame_counter;
 	u32				frame_rate;
-	u32				operating_rate;
 	u32				hfi_rc_type;
 	u32				enc_raw_width;
 	u32				enc_raw_height;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index cf5ae420f646..d346eb668f6a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -123,7 +123,6 @@ struct platform_inst_caps {
 	u32 mb_cycles_fw;
 	u32 mb_cycles_fw_vpp;
 	u32 max_frame_rate;
-	u32 max_operating_rate;
 };
 
 enum platform_inst_fw_cap_type {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_milos.h b/drivers/media/platform/qcom/iris/iris_platform_milos.h
index 8a45a4aa9e86..e92dac972389 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_milos.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_milos.h
@@ -21,7 +21,6 @@ static struct platform_inst_caps platform_inst_cap_milos = {
 	.mb_cycles_vsp = 25,
 	.mb_cycles_vpp = 200,
 	.max_frame_rate = MILOS_MAXIMUM_FPS,
-	.max_operating_rate = MILOS_MAXIMUM_FPS,
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
index 3cfecae80d1e..5cab6df0115c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
@@ -16,7 +16,6 @@ static struct platform_inst_caps platform_inst_cap_qcs8300 = {
 	.mb_cycles_fw = 326389,
 	.mb_cycles_fw_vpp = 44156,
 	.max_frame_rate = MAXIMUM_FPS,
-	.max_operating_rate = MAXIMUM_FPS,
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
index 3c9dae995bb2..46fed17b611e 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
@@ -24,7 +24,6 @@ static struct platform_inst_caps platform_inst_cap_sm8550 = {
 	.mb_cycles_fw = 489583,
 	.mb_cycles_fw_vpp = 66234,
 	.max_frame_rate = MAXIMUM_FPS,
-	.max_operating_rate = MAXIMUM_FPS,
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index becbe3776544..e31f27fa6a15 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -58,7 +58,6 @@ static struct platform_inst_caps platform_inst_cap_vpu2 = {
 	.mb_cycles_vsp = 25,
 	.mb_cycles_vpp = 200,
 	.max_frame_rate = MAXIMUM_FPS,
-	.max_operating_rate = MAXIMUM_FPS,
 };
 
 static const struct icc_info iris_icc_info_vpu2[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
index 43460b82ae77..aebda855a549 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
@@ -80,7 +80,6 @@ static struct platform_inst_caps platform_inst_cap_ar50lt = {
 	.mb_cycles_fw = 733003,
 	.mb_cycles_fw_vpp = 225975,
 	.max_frame_rate = 120,
-	.max_operating_rate = 120,
 };
 
 const struct iris_platform_data qcm2290_data = {
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index 1096cc4b01c3..6384b4a438b6 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -128,13 +128,11 @@ int iris_check_core_mbps(struct iris_inst *inst)
 {
 	struct iris_core *core = inst->core;
 	struct iris_inst *instance;
-	u32 total_mbps = 0, fps = 0;
+	u32 total_mbps = 0;
 
 	mutex_lock(&core->lock);
-	list_for_each_entry(instance, &core->instances, list) {
-		fps = max(instance->frame_rate, instance->operating_rate);
-		total_mbps += iris_get_mbpf(instance) * fps;
-	}
+	list_for_each_entry(instance, &core->instances, list)
+		total_mbps += iris_get_mbpf(instance) * instance->frame_rate;
 	mutex_unlock(&core->lock);
 
 	if (total_mbps > core->iris_platform_data->max_core_mbps)
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 2f2c56bf9122..0db6ed1056bf 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -66,7 +66,6 @@ int iris_venc_inst_init(struct iris_inst *inst)
 	inst->crop.width = DEFAULT_WIDTH;
 	inst->crop.height = DEFAULT_HEIGHT;
 
-	inst->operating_rate = DEFAULT_FPS;
 	inst->frame_rate = DEFAULT_FPS;
 
 	inst->enc_raw_width = DEFAULT_WIDTH;
@@ -396,24 +395,17 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
 {
 	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
 	struct vb2_queue *src_q = v4l2_m2m_get_src_vq(inst->m2m_ctx);
-	struct vb2_queue *dst_q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
 	struct v4l2_fract *timeperframe = NULL;
 	u32 default_rate = DEFAULT_FPS;
-	bool is_frame_rate = false;
-	u32 fps, max_rate;
+	u32 fps;
 
 	int ret = 0;
 
-	if (s_parm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
-		timeperframe = &s_parm->parm.output.timeperframe;
-		max_rate = caps->max_operating_rate;
-		s_parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
-	} else {
-		timeperframe = &s_parm->parm.capture.timeperframe;
-		is_frame_rate = true;
-		max_rate = caps->max_frame_rate;
-		s_parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
-	}
+	if (s_parm->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		return -EINVAL;
+
+	timeperframe = &s_parm->parm.output.timeperframe;
+	s_parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
 
 	if (!timeperframe->denominator || !timeperframe->numerator) {
 		if (!timeperframe->numerator)
@@ -426,18 +418,14 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
 	if (!fps)
 		return -EINVAL;
 
-	if (fps > max_rate) {
+	if (fps > caps->max_frame_rate) {
 		ret = -ENOMEM;
 		goto reset_rate;
 	}
 
-	if (is_frame_rate)
-		inst->frame_rate = fps;
-	else
-		inst->operating_rate = fps;
+	inst->frame_rate = fps;
 
-	if ((s_parm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE && vb2_is_streaming(src_q)) ||
-	    (s_parm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE && vb2_is_streaming(dst_q))) {
+	if (vb2_is_streaming(src_q)) {
 		ret = iris_check_core_mbpf(inst);
 		if (ret)
 			goto reset_rate;
@@ -449,12 +437,8 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
 	return 0;
 
 reset_rate:
-	if (ret) {
-		if (is_frame_rate)
-			inst->frame_rate = default_rate;
-		else
-			inst->operating_rate = default_rate;
-	}
+	if (ret)
+		inst->frame_rate = default_rate;
 
 	return ret;
 }
@@ -463,17 +447,10 @@ int iris_venc_g_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
 {
 	struct v4l2_fract *timeperframe = NULL;
 
-	if (s_parm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
-		timeperframe = &s_parm->parm.output.timeperframe;
-		timeperframe->numerator = 1;
-		timeperframe->denominator = inst->operating_rate;
-		s_parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
-	} else {
-		timeperframe = &s_parm->parm.capture.timeperframe;
-		timeperframe->numerator = 1;
-		timeperframe->denominator = inst->frame_rate;
-		s_parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
-	}
+	timeperframe = &s_parm->parm.output.timeperframe;
+	timeperframe->numerator = 1;
+	timeperframe->denominator = inst->frame_rate;
+	s_parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
 
 	return 0;
 }

-- 
2.34.1

