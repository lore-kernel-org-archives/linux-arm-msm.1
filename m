Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793159020;
	b=XZAeh60xqkqbDQ7QztcJFGkZH86S2FnckjZF94tdSkeJiuQR/xIj93+7hUlrDtUz9Bhz
	 MYJ+OfvSaoMF1mjvAYS81YjMm2HXYrQF/v4hQKYoRf5067FPZCo7PXwUjePzQa31K4CyU
	 UegyM56VMWsLQg42nPLXhsnKSS7OTz58Vpo/rU4Z5p1IN136YmkKdxQwbJdNMzXZ+p+cg
	 Znk7sRH3/ZA3YbBvQ4iURsjTxXkHY9XwjF7DvBAb2XGA/J47h5K9l2rTRg/hbs8+mSrv/
	 dmkzjAxcupXoIZiCkFMxKEc5C394OarbYT3G3IYnKW27k+eVfzajPG01gAuM75mc1LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793159020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AguqB2hO77OHSGF5DZldrtOnUiAVpJyfCorfpUrLfyc=;
	b=bcQsejbN4qUIlwFx/YS7gQRjPST3oqzPgPElwfkpjOKQgNzwpYvLOkrCmDRJFRaNke0a
	 sfc5+tpE0rHImofzdmDZJbthuC48RX47ZaPOIjcF2uwTp3lQuH0vSCMIRfI1n8umYRit3
	 ZNve7Wi1O7wba3eKbIx5oOpssAs7VFWlapCTzmT9OSotaCC952bJLVxvrpOEDL9KquEbE
	 sxBLAAUc4pOCO3ZPL4AvwI33t4UhFzTCdyJQdRpLtxfF8yxT3FGiQzphyFrOcg7EtJxH+
	 xM8/x+8onpg5lw26dhsw/8E0n8TvpNjSKpA4s5uGoT/w3MgH6rTIJJD/PHBM7PrffHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UzBy48qb;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5D7606A325
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 03:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A5D7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UzBy48qb
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-917bab38b14so6829606d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 20:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793159019; x=1793763819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AguqB2hO77OHSGF5DZldrtOnUiAVpJyfCorfpUrLfyc=;
        b=UzBy48qbaAVds69XB0OB9iaLL9WXaRk77Z45TS4mH3FNhwE31+4GHHYBELtDeV2sWv
         G0MQByRGkKelSyu3+rm7xoN+8z5/BqfLjDDtaXCiaySFPU26R2FqU1rnG0f6kvc77UoK
         uamOmYRdO0pEiCkAfkTzDyKJtygNTw5MobmdUSTUs4hcfSCedtTH3zm8ScKULNhx+Sjc
         kcksRZ+palIfqZkKlIDJMp6a/PT08j9qorOU6wi4A0rv6aY4YJ7E+CDvIGxKepcX11Al
         M4B70G5ix7PbrLbYwgKVj8r7H8HVHitxe4CfLEgWRTGRPDqI+4WQ9Qg81nHrox0vu9hs
         1xJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793159019; x=1793763819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AguqB2hO77OHSGF5DZldrtOnUiAVpJyfCorfpUrLfyc=;
        b=e1nuGk/JzF5SedgMSfz9DtgdSzUuYyfF1LzxMyFWMmjjQbF/GOkRnSbULng4gb6pOQ
         YVKaPCume7QP+LMSt+v9pT1uKi+U/SI+TeejdZgn54RdXwSosEdhsJvlgeMyLo2m4Jnu
         TzUSIoUaNHoYZ9FlnRlp+E96Gt7Dtm24Blpm4aClrjbuxv8cG6vQQoTF55smeNGZsvli
         wrQ7aayKjODYy9qu3d4j4hl3M/hvCQIaQrTWvT9qh1MCKHvO5yS5xNRR8YuFQUrBBjs8
         rLyqvU0tqcPeR7H2PFdDQIhJ61xXaWFgc/SbUm7ASyMApWQ40oeAQn1z4+z/TggQGclh
         F85g==
X-Forwarded-Encrypted: i=1; AKwUvBxwvhaAcL/MWSyHbftrlT5EwtvyEuGg83/uets3sRXJYIoK/IdnV0AwSV/BdyKu1rSo/ldJ9Clc2dgGJKdK@vger.kernel.org
X-Gm-Message-State: AFq9FYKDIctzPbdQY9wyx9gLox+t0RSgegqG/tWcUj1DdClt35yNOf8J
	iDFxBtw6C2vXU2mBsBBFh0gpEM7oVR+snhvqFOB5lmuIZjN3YPGluOFtudncgxcP8RhYvw==
X-Gm-Gg: AYBFou2SWSAMrOhDXw01gvTPHb3wWLzRZbaBhUajvFOxFK+2B88RRWDasucJgWiS8qf
	JazfGoLoXri1pK3HNXnFZEl51/xA4V/Ox4iCwNWipgtaJw28RHx37oIehT67Xq+0sykhvIJDijV
	RtDTrUv1E8Ej8kn3RawY1ORS82DLYXGBO1IJu5sxLqfU+ZpLrzYJkzJQ8QluvYEhi8yYR9VV4vo
	GLzkpIOtzV5e2oKEooZto2GVf1UNySVMnNpuzsD34NSYekTN1vjvdkcQgZpHE5hTgjdYJRUAdQZ
	p1e7oE3TVNTaFeR7OQFlBRB7ZjtSrR/ZJTE7c6gNVy4TEA00Xf5ahyI7qIBqJ3NpBwubPRnwcDA
	wctAdIlYiVOCsQE/TtIJt3jNhi4t3j4YoAPN7vL62ZkhTdXYH0iKSSJFAnkAkPwrD6ywt8ZxLyN
	7bXNbCAasft8uKiSNOB1lRzuYcS9UJlmMnHP40jZl70nZljY43ouOPvz2Fuo7B9nwvpEMoHgJD0
	Hbde6BKTvc4wPzlmQ38DxzoJapbR1qGg6qtjgBFv0ki2Q6Ah83gye8ioW3CVA9vvObo7nExjh0O
	OBJVNd+WqLTC4s6PhntCoCjHhVmnA16iuIlxvv4ZFZybhjutTMKxeRnMM3FxTrvPIew2gxBDgzn
	ZAFKpxw==
X-Received: by 2002:a05:620a:17a9:b0:93a:2d07:142f with SMTP id af79cd13be357-9440896db89mr147075985a.7.1793159018981;
        Tue, 27 Oct 2026 20:43:38 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f05b20d5sm1151879485a.2.2026.10.27.20.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 20:43:38 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Birk Skyum <birk.skyum@pm.me>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH v2 2/4] media: iris: Update the CAPTURE stride and size on S_FMT(OUTPUT)
Date: Tue, 27 Oct 2026 22:43:33 -0500
Message-ID: <20261028034335.26075-3-ccortner@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028034335.26075-1-ccortner@gmail.com>
References: <20261028034335.26075-1-ccortner@gmail.com>
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

S_FMT(OUTPUT) updates the CAPTURE width and height but not
bytesperline and sizeimage, which keep the values of the previous
format. With a 640x360 stream, REQBUFS(CAPTURE) then allocates buffers
that iris_vb2_buf_prepare() rejects with -EINVAL.

Move the CAPTURE format rules of S_FMT(CAPTURE) into a helper and use
it for S_FMT(OUTPUT) as well.

Fixes: 8aadfd445373 ("media: iris: Update CAPTURE format info based on OUTPUT format")
Cc: stable@vger.kernel.org
Assisted-by: LLM sparse smatch
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 61 +++++++++++---------
 1 file changed, 33 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 0dd33ff447bb..472e8e50830d 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -212,6 +212,35 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 	return 0;
 }
 
+static void iris_vdec_set_capture_size(struct iris_inst *inst, u32 width,
+				       u32 height)
+{
+	struct v4l2_pix_format_mplane *pix_mp = &inst->fmt_dst->fmt.pix_mp;
+	struct iris_buffers *bufs = &inst->buffers[BUF_OUTPUT];
+
+	switch (pix_mp->pixelformat) {
+	case V4L2_PIX_FMT_P010:
+		pix_mp->width = ALIGN(width, 128);
+		pix_mp->height = ALIGN(height, 32);
+		pix_mp->plane_fmt[0].bytesperline = ALIGN(width * 2, 256);
+		break;
+	case V4L2_PIX_FMT_QC10C:
+		pix_mp->width = roundup(width, 192);
+		pix_mp->height = ALIGN(height, 16);
+		pix_mp->plane_fmt[0].bytesperline = ALIGN(width * 4 / 3, 256);
+		break;
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_QC08C:
+		pix_mp->width = ALIGN(width, 128);
+		pix_mp->height = ALIGN(height, 32);
+		pix_mp->plane_fmt[0].bytesperline = ALIGN(width, 128);
+		break;
+	}
+	pix_mp->plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
+	bufs->min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
+	bufs->size = pix_mp->plane_fmt[0].sizeimage;
+}
+
 int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 {
 	struct v4l2_format *fmt, *output_fmt;
@@ -263,10 +292,8 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		output_fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
 
 		/* Update capture format based on new ip w/h */
-		output_fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
-		output_fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
-		inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
-		inst->buffers[BUF_OUTPUT].size = iris_get_buffer_size(inst, BUF_OUTPUT);
+		iris_vdec_set_capture_size(inst, f->fmt.pix_mp.width,
+					   f->fmt.pix_mp.height);
 
 		inst->crop.left = 0;
 		inst->crop.top = 0;
@@ -281,30 +308,8 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
 		fmt->fmt.pix_mp.num_planes = 1;
-		switch (f->fmt.pix_mp.pixelformat) {
-		case V4L2_PIX_FMT_P010:
-			fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
-			fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
-			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
-				ALIGN(f->fmt.pix_mp.width * 2, 256);
-			break;
-		case V4L2_PIX_FMT_QC10C:
-			fmt->fmt.pix_mp.width = roundup(f->fmt.pix_mp.width, 192);
-			fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 16);
-			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
-				ALIGN(f->fmt.pix_mp.width * 4 / 3, 256);
-			break;
-		case V4L2_PIX_FMT_NV12:
-		case V4L2_PIX_FMT_QC08C:
-			fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
-			fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
-			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
-				ALIGN(f->fmt.pix_mp.width, 128);
-			break;
-		}
-		fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
-		inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
-		inst->buffers[BUF_OUTPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
+		iris_vdec_set_capture_size(inst, f->fmt.pix_mp.width,
+					   f->fmt.pix_mp.height);
 
 		inst->crop.top = 0;
 		inst->crop.left = 0;
-- 
2.56.0

