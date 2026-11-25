Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601588;
	b=InWQ/6JP3dAa43U0Q1tDjfQVrHUQCZvngTiP/dB/wrwGOrVE4p0Yr+oqRvckebuK7KCx
	 kmxaO1PrJYM27b7dOuBcRhOYESH+pPvyZ9R6nlJem2p2NHqQmlwSZu+p2dWaZ12roSwhB
	 6mmeu/BKQeWVE8GtzLxkiRHQH4VtRyqgynVGqFbVj0CF3Qp6/ztoq1dHP3Bt4ZE66BYXq
	 8xSQMMbo2VJNTdqHgbhjOqsCWZ5FTqKJvRxDmxYsYJl72RGu/2drtfgS1xfrDg79bzEuz
	 V2/y/n16BoVphL4jiua0fWKqgu5LWoas9NkY+DSuZnkSJS7ZPAKacangbLmLdZTWomQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0m7khPEiz30Rha/KLLauj8YmgXwFrxSFcaLFsZWMMU4=;
	b=cUebwLy5aheZ5SHCCl5HXuGvngUi1KSFLK9+pNE9grGeFrJusVMloiEKJByXWrDUe5u9
	 VW9SjH986Te8mOD2lz8v64G0uyo2mBWjiyE9iUBpr5PtvMVHiS4wsmojJapDAXgcFFTVu
	 2/Hz5sy+VuIjlLqTD6jhjuIG5P2M1nLvyRqOu1VLvYo4uP1h2JVZ/y1rgQee9eSvdGTju
	 c/uVuVKk1EO9JR5MNT4AWCiT7qj/F4fQItoa4SJQJ5ycaBIbh2CmFRzxgNoXteqYipTGw
	 DjLe3yYDpiV1HkGGE+yRPtP6gMV3gpkryPfhvhCWBfeyjP4j5w6SGQ+X6n982L8pLiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BiS9y+L1;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DAA606A329
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4DAA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BiS9y+L1
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a32576da88so3187523f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795601586; x=1796206386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0m7khPEiz30Rha/KLLauj8YmgXwFrxSFcaLFsZWMMU4=;
        b=BiS9y+L118TIRP/O0b4oS4RsYpCngmE+0RVEsHN1hRbh4oZ/at9HnPZK7uA9x38xNE
         gkPyonDnsXNpbGOibvyBwiN35fQEg/U121wyqkep1i9z1bPZ5s+RuGcmN1PxIGA6aYcq
         1X8IYy+AxaG7SyEf3+W+jrq0ynXilC4OqgWz30AH1k61a/FvEq0aDvIPO6WaXlGtF0SV
         qryaCDQL8fNkIx9mDDbAKoQd+gSIDIsE5ePnYZCHD7eZ6lwGHZxGJSFK+tZo/new5x0d
         /YrNeC4hYrZsGD63r+dRLOPUXtt0mmiJMydCG7x2v41A0At/tjQ0548tXkthjhiGdri7
         /rXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601586; x=1796206386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0m7khPEiz30Rha/KLLauj8YmgXwFrxSFcaLFsZWMMU4=;
        b=FTk48WVy4UqEmky40XRuhc0HTGRqWTWoUjKakr/X6y/OU+3LyJarEw77g2sgKBs2el
         jruv+FEZm/a09Ivx7J4uxRJSCwEs/zU3JC8zg7QzVqG8YuddOuVDAXX2Yj/XacOXehLW
         ZXgj76ZRADMEfVGZKlzOnSH+rls0gkXRe20SecQE6+YiAuHG8RrrJjOZl/flXp9o99PZ
         nNBcQSnJP2TQ+coIh8eABmyXD0rtp71QixueRZqnueqYtDzTiiBToUMa9kwrpYwFjdWV
         gJrnoeNAgk3rpAkSSmNtdnRw6KmfXo1/qTDlJt/WYvk26eETjh+5ifQIANe7VOrpJKgb
         TvcQ==
X-Forwarded-Encrypted: i=1; AL+hErEEA1lReywCxW+FxD6DtVRraEMuaGnghovWWlo0s6DnCtIEAV2UtBl7lhkhtqwWmRMQKac2UGN/vlGKcY7/@vger.kernel.org
X-Gm-Message-State: APuU4Z+2K0V8LDWch3GyxqgJYgMtpzKAwbdEUmro4LLGwfxILLzNtcuY
	1+UotuSJKKnmPr2rUhRleCS0H15Yo3Hkbp66mkysB9uXOh9Jnz3SWIzDGfkXW4nJSwY=
X-Gm-Gg: AZFdTZdBDovdIJDNGjwL0CFAT1iEaB1hAt7PrwcWoOWcXTkp56GgRoE8Io3jVUAgXor
	WOr2CFfi8+ASW3dSJm7w4Z6C7csCR1kOymBdaDWkTgQ4nSOPELA4AnvhmS/+q9W+UMo/7Gyet0C
	enW45FzEFlq2gUp85UNi15lq3FoIMebu8ZmhV+U74kEwSyGea81ousmzCTdnPOgMukRM5Y0XpYt
	uydACIgo6QBx3NvM1D/u8qGMhqQLhBeqZ6B9aYI+Y1lIGwM3m0XQ3CB3rX+cswk9RwvkVSRvrxd
	U6Kl58rEaVYzoLZgl4M2qBE9JPLMC4W13MRIxk2c1z7qlYUsMDb9NmXZ37aNV4+5Iuog5pJgiCy
	SOGgOHolpB4a/6SQfFPqgqJkiEXSIiDA05eSX98PskZSdsVBXBqvciuh9bH7u3CrXzIUOW+QLxp
	YwZzqNXXw0XJXciXPpVsGE051k6P6JGXM/wna+JQxLmM1WsrP+XlJHUKJUZwLhysS2jAmYP+aDP
	G9+Qc72D2hGqqE1XsW9fRDxLs7cwJjt5l1Z5eVY/GRTa9QoOiaraiYB3RmHsFkcNLvjlvP0bb+g
	64nf6iU8q8gzGXRWHkgOIhT1cCPKxXrJVQdYDRRNLzb8qKz/bA==
X-Received: by 2002:a05:6000:1865:b0:4b8:75e5:301d with SMTP id ffacd0b85a97d-4b875e5306amr7387173f8f.0.1795601586248;
        Wed, 25 Nov 2026 02:13:06 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm31713382f8f.18.2026.11.25.02.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:13:05 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 11:13:00 +0100
Subject: [PATCH v2 1/2] media: qcom: iris: gen2: subscribe to the picture
 type on the encoder instance
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
Message-Id: <20261125-topic-iris-encoder-fixes-v2-1-fe6af9761f83@linaro.org>
References: <20261125-topic-iris-encoder-fixes-v2-0-fe6af9761f83@linaro.org>
In-Reply-To: <20261125-topic-iris-encoder-fixes-v2-0-fe6af9761f83@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5466;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=UV1P82q5MEsZSCbv4RL6iiC5cp7Sf9M19lFf+zkJyBM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBrSvoAM77i46zPuYqHDGTaAe5WgLoMQukeX+jO5Z
 E8nPLZKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawa0rwAKCRB33NvayMhJ0Ua4EA
 ChMIGi8rCsWnbUWh14gNKJulszTw2Oyg6Q1iTDYks3VZW1VHe+aMsEwVi+YQWCzJBk8bht6BKuyzUM
 trSoODLzLaJxT5kaRUA4AdVqB/FIHEvoKy8vnvTp1c3vwrmvChGQEcomEZjwi+xWBK63N/+FbaJFAK
 sO2+smYhrL8jcQFu21wXNqR2F9P5X+Gf4kD5+mcW/+plpk6WqXsdy2AsMA58X7t5u5d0bDbg7wraaO
 mBLeCdbz6IceA4F9Y4hvJIE8UbnAOL2AVJcqmRW2E2XgvRAIjiZ5GFk9Jv5GeykdgOC2TkGkn9vf3P
 weraHrvXjOOHY65EDN67/BoFmeWAEt64DXpPxO+MSFW5RF3HaVV7FJj/SlOxoh/gzcf2bB6PlNT1lh
 TAoYmyShmedCPcb4jCoTUw/F1SFzzmBB8x61N80kfbHjdZVdJkHQBYvjgTvYvR3CQYBAvnCHp9Gvhq
 t1asEgyndVZldmbIS5Bx1/4IIS5H/YftwbCYZJMQE2wT+I3dyi1/zB1der8A6v2wiZOD0qUjF7obJY
 fLRY2oE6nRUtwYuqOZ5C8NQ/JRW//eAv+JhBkuGwZ/5PqECuS1ZCVKCIXfhkIGxHMjXWi7ZpaEQuOI
 gCCWMGWPqKkSUCAW4ppXVGRkWDPjnspzZCoIou8U7xw3+UptElWWsEJeSKjA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The GEN2 iris expects the HFI_PROP_PICTURE_TYPE for the encoded
buffers, but HFI_PROP_PICTURE_TYPE is never subscribed for the
ENCODER instance in iris_hfi_gen2_subscribe_property().

Add the necessary tables along the vdec input and output properties
table for the GEN2 hardware.

The tables are aligned with the vdec and downstream iris driver
implementation subscribing to HFI_PROP_NO_OUTPUT for the input
queue and HFI_PROP_PICTURE_TYPE for the output queue.

Fixes: 92e007ca5ab6 ("media: iris: Add V4L2 streaming support for encoder video device")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 23 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 15 +++++++++-----
 .../platform/qcom/iris/iris_platform_common.h      |  5 +++++
 3 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 79bbd06ef8d2..3b0fb408f05d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1906,6 +1906,14 @@ static const u32 sm8550_vdec_subscribe_output_properties_av1[] = {
 	HFI_PROP_WORST_COMPLEXITY_FACTOR,
 };
 
+static const u32 sm8550_venc_subscribe_input_properties[] = {
+	HFI_PROP_NO_OUTPUT,
+};
+
+static const u32 sm8550_venc_subscribe_output_properties[] = {
+	HFI_PROP_PICTURE_TYPE,
+};
+
 static const u32 sm8550_dec_ip_int_buf_tbl[] = {
 	BUF_BIN,
 	BUF_COMV,
@@ -1985,6 +1993,11 @@ const struct iris_firmware_data iris_hfi_gen2_data = {
 	.dec_output_prop_av1_size =
 		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
 
+	.enc_input_prop = sm8550_venc_subscribe_input_properties,
+	.enc_input_prop_size = ARRAY_SIZE(sm8550_venc_subscribe_input_properties),
+	.enc_output_prop = sm8550_venc_subscribe_output_properties,
+	.enc_output_prop_size = ARRAY_SIZE(sm8550_venc_subscribe_output_properties),
+
 	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
 	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
@@ -2032,6 +2045,11 @@ const struct iris_firmware_data iris_hfi_milos_data = {
 	.enc_output_config_params_size =
 		ARRAY_SIZE(sm8550_venc_output_config_params),
 
+	.enc_input_prop = sm8550_venc_subscribe_input_properties,
+	.enc_input_prop_size = ARRAY_SIZE(sm8550_venc_subscribe_input_properties),
+	.enc_output_prop = sm8550_venc_subscribe_output_properties,
+	.enc_output_prop_size = ARRAY_SIZE(sm8550_venc_subscribe_output_properties),
+
 	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
 	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
 	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
@@ -2920,6 +2938,11 @@ const struct iris_firmware_data iris_hfi_gen2_ar50lt_data = {
 	.enc_output_config_params_size =
 		ARRAY_SIZE(sm8550_venc_output_config_params),
 
+	.enc_input_prop = sm8550_venc_subscribe_input_properties,
+	.enc_input_prop_size = ARRAY_SIZE(sm8550_venc_subscribe_input_properties),
+	.enc_output_prop = sm8550_venc_subscribe_output_properties,
+	.enc_output_prop_size = ARRAY_SIZE(sm8550_venc_subscribe_output_properties),
+
 	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
 	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
 	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 388a36ff2b07..6131d22c579f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1059,12 +1059,17 @@ static int iris_hfi_gen2_subscribe_property(struct iris_inst *inst, u32 plane)
 
 	payload[0] = HFI_MODE_PROPERTY;
 
-	if (inst->domain == ENCODER)
-		return 0;
-
 	if (V4L2_TYPE_IS_OUTPUT(plane)) {
-		subscribe_prop_size = core->iris_firmware_data->dec_input_prop_size;
-		subcribe_prop = core->iris_firmware_data->dec_input_prop;
+		if (inst->domain == ENCODER) {
+			subscribe_prop_size = core->iris_firmware_data->enc_input_prop_size;
+			subcribe_prop = core->iris_firmware_data->enc_input_prop;
+		} else {
+			subscribe_prop_size = core->iris_firmware_data->dec_input_prop_size;
+			subcribe_prop = core->iris_firmware_data->dec_input_prop;
+		}
+	} else if (inst->domain == ENCODER) {
+		subscribe_prop_size = core->iris_firmware_data->enc_output_prop_size;
+		subcribe_prop = core->iris_firmware_data->enc_output_prop;
 	} else {
 		switch (inst->codec) {
 		case V4L2_PIX_FMT_H264:
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index cddab9a9c375..cf5ae420f646 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -303,6 +303,11 @@ struct iris_firmware_data {
 	const u32 *dec_output_prop_av1;
 	unsigned int dec_output_prop_av1_size;
 
+	const u32 *enc_input_prop;
+	unsigned int enc_input_prop_size;
+	const u32 *enc_output_prop;
+	unsigned int enc_output_prop_size;
+
 	const u32 *dec_ip_int_buf_tbl;
 	unsigned int dec_ip_int_buf_tbl_size;
 	const u32 *dec_op_int_buf_tbl;

-- 
2.34.1

