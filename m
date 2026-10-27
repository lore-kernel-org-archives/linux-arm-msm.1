Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793067579;
	b=PMqtZZNXUD2Mq1YSsC3gqeccrkJ3sENPe/Tqsw7NuUTf0BlXZCxsOAKlJ+FkA9iRw/jA
	 tLGNjtqlq0jllmLykUmbCh34etQ68fPBqNKAu0uTHljS0Nmk6pmIdRDEdhjw4vm9YVRlN
	 1s2DZNNtsmP+VaoebfHN0gBpsHoPQpKUn+g/062xiijcuWbE/9tf8A9YgdsGtoi3aMhuQ
	 y4DLKZMsXnggyNcdazKB+yNDEyZW4VDtumTKKvzSRRrV9Te2Ro1GnTUzF0mq9goFc8fZV
	 n8+8dBFKSbK1RiFdcBdfafyOb8JbU5+tFMEzZIhgnzt02UsBKbrd5Z3YyNEXJdy6dxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793067579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rGJs3M9F82xCblFenHDo0jIt0qYw6QbBFb+UcxLWqpU=;
	b=M1G1CeiNNXQ4MWK50pWDz/nbId2F68KhIOlJcJ4Jf5tlBQS6ox3eoOFuAyD5UGUAQEUM
	 3RiLAEXjHy7w0HCzINXzuBMVZHfkKkvBhXxZLwFYbTfrm6cAOSG7g1brXouk/aTVzkwbz
	 D70+wLdBk3Sgz4uIqM6URtnPLw1mBVL0xjQV4Xy4xsdTPuVDjKcWgvj33tdk9kXcRp8uO
	 EAXlSDpVPTo4FVuVYQu61wsnVPST3y0o/BR6XIWmMFEDw9Vp5oy9QzICMouUWQtkWczxb
	 qngkM0vg0nbraKBn8oUaLgMw2dZUNBE7TKh3D0W7GAuVkxTECElWJHwUUUVGd8lFiZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="FytQ/h49";
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AEF606A320
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 02:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18AEF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FytQ/h49
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67999045530so3555328d50.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 19:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793067578; x=1793672378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rGJs3M9F82xCblFenHDo0jIt0qYw6QbBFb+UcxLWqpU=;
        b=FytQ/h49Nz1JtagSYrBXGqkyF0lxtTCICxee/P01w7ZJBZxW3yiFAwJAGUGiuw1tg3
         ZefVCnpJqtBK4fE/FyXSAUZ3lycXUOxZmR9nZFrmpdtOW5WWUbDjeZzpeeog9kKOpHCy
         8OEM9Vh040xMFbPlwhiELO47WE7Typt3J3uHHtcQGyvg9DvDAoFYW3dUENcYm7SA5ZY7
         CR+V3ZNfJqxDRGGLCQXdS6n4hSqK091JHhDdBWlVMGo5TrgCe9UPXTFYw5bIG/hU3Kam
         ZMqpHu0jCEEWzHwARhij7/5Ooe0aT1iBb8HqWTdH4JmPBy3Y+q5lsGnyO8fdBQkoPVRH
         Nk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793067578; x=1793672378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rGJs3M9F82xCblFenHDo0jIt0qYw6QbBFb+UcxLWqpU=;
        b=Q2m6U0jPWgEdrYD0xegK7ohIZ2lfyEnJaOCHQSkLQoK5nAaNapEZiyQIY0vs5/1H30
         s1AWoLW8n/ZG0efDoB3tc4w4JB0dMamfRvMcV0u9WGD2Q7e9WqrryO3xgxcc2IPOA5Q7
         6Q1FEkSRcaZUOv+eWEXysf7eH1xl5ZptQ5es995clAKLP7Q/iE9+dhzKO2aiJ16sD4ey
         UdnxirVGjG/asXY1kXjTftd8uzW8c/qWJW1D2gMt6Awuu+ajpK+vcIF+utZw++FuFLuT
         Ij401XN0ssZHF2aX9OjPNJyZYQT4hWRQXhEFEdYY+NkVotkDXTyIVMZQA5WIkMY8bkEK
         Ewdg==
X-Forwarded-Encrypted: i=1; AKwUvBymYF5f1Q+9Vy4Y6dg39ZTh5O/B6rY7Bz6rC/JiOJZt5A9+Bg276bNVkUniFJML8pwKrP1FpzRdu8uqMc6A@vger.kernel.org
X-Gm-Message-State: AFq9FYIyP67j6swaXocWn4TqQ1/aig8zkcgh87G6DTN8X/BBu6LVbZuJ
	0HFspOWyj23LnXnha4IYfp20KNZWShZF4RTu0lPpzgK96oJqnEw2bQDw
X-Gm-Gg: AYBFou2vtWCIvCtOtM+BH4cG1B7Qcs+FnI3MUrTI+5kuXdT3lIK0G8FBaeske0fKhTG
	2DqbzdpjOHQlfmcIzoIVSQS0GaJyxyPl3DiQxkOhsMJ7ufs5ypilqfv18Xsym2pynO954linWGp
	J1VtVuOUTCpIPGYxpFVA+kYp3rcBCjICx4S+FEIEQRR/CXaHP9JlqoWL/4RG8f/V1cC7jrwYanV
	z3onqdDSkOvxyTjluOIkI7NUyzEHJ1VxICJvrcP9R9VgvTWan6mElwI2uRpEQrCdG8/VKPTnQ91
	jhJeTxPIjPXdLFf7Q+an0mjrtHHZOSut+b6mhYidyLxTNNSM16I9e+vBiJM4IdkUvKf/RMyDgKh
	B6dfjx4mSVQ/ogWet51WEHY5MphfV9uyL681C6mGmA6ww8rLAe0i4Ynx8a3Fn1nQGOXJdCuM/ab
	u4rBZ9FJG8o6DfcLag4CParhOyNIVjiJEJGFtqWHEquBtkPT369fBaGWfpAR6Fjx9/3hlspUaKA
	0fkOqnytul5tYvTatp2L1oJTYq1AuOTs/9C4PjbTqRCfgIhF9ppMsVke70vWX6dKwD9iTTWzxWj
	OxDjhaNLKHHuL/uZ2dLJ8aauwYX+KpRw
X-Received: by 2002:a53:cf02:0:b0:677:cbfc:be34 with SMTP id 956f58d0204a3-67a454435a0mr4785926d50.66.1793067578051;
        Mon, 26 Oct 2026 19:19:38 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a6c4f9312sm909426d50.8.2026.10.26.19.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:19:37 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Birk Skyum <birk.skyum@pm.me>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH 2/5] media: iris: Update the CAPTURE stride and size on S_FMT(OUTPUT)
Date: Mon, 26 Oct 2026 21:19:31 -0500
Message-ID: <20261027021934.22113-3-ccortner@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027021934.22113-1-ccortner@gmail.com>
References: <179306719855.20070.15625203453374418392.iris-rfc-reply@gmail.com>
 <20261027021934.22113-1-ccortner@gmail.com>
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

Setting the OUTPUT format also updates the width and height of the
CAPTURE format, but bytesperline and sizeimage keep their old values,
those of the 320x240 default on a new instance. For a 640x360 stream,
VIDIOC_G_FMT(CAPTURE) then reports 640x384 NV12 with a sizeimage of
147456 bytes. VIDIOC_REQBUFS(CAPTURE) allocates buffers of that size,
and iris_vb2_buf_prepare() rejects every one of them with -EINVAL,
because it checks them against the size computed from the new width
and height.

Move the per-format rules S_FMT(CAPTURE) uses into a helper and call it
for both queues, so that S_FMT(OUTPUT) leaves the CAPTURE format exactly
as S_FMT(CAPTURE) would set it for the same size.

Fixes: 8aadfd445373 ("media: iris: Update CAPTURE format info based on OUTPUT format")
Cc: stable@vger.kernel.org
Assisted-by: LLM sparse smatch
---
Reference only, not for merging (no Signed-off-by); see the cover
letter.

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

