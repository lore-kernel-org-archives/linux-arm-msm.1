Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466056;
	b=z3AYzQJfCgmKqafH6Y/Wb7Kxi8s1nlQiyUyl4A72vxQSgNw6Mrc/BYIfY48ZMj0sLTUb
	 Iy1HO0is3nt+ikBaWrTatIZfVlYACcxuoTURVoo1UH5Rk5t526G7s//e8GRfrTE4UvWLJ
	 MEYts2cP0964eTDheh6Z5YHBTQcwkL+Tkeb/YY2KBj+aqF79tzPjsbhnDBFVyxBOPi/S0
	 acGYY3ZHssKOmBx9w1+NoIbaDgLiyyAW6XO/7FioWdMKYitgbWRTqTD1AOi68mNOGvsuX
	 J5uCdB/rryVLCyhjoYpx5yG1mb3Mh0xj6BNDPlYhXyeMwppTJbS/82l1KGp4OhuLOUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=jmJspXYhqF5Ifm6vBoYFDWnnVcY5oxgK5Qh3Vesxuh0=;
	b=iruR29VoKeig6ksLIUtwPcMYYBk0Msg9YS9L1l/Soy6g8SlKyASjpuqQ45uCV7E5VcbH
	 S5KexGybrOatXf2c3x3S1v4cmdfZVkRZioqhcQCDCuR6dk5Md0qr8qwujWleXoIC8vk6V
	 XMB49cgDTz3FrDkCo5fSKgCNcNe89fWUF8p/AovqNQ+PaRJX9OXAem63doNOhJxBTjye8
	 xse5uN+3CkCNwHOGPJa7dUbbf8Gotfc6KxKQqXoXKwgJS1kq4FTbXnIhx7Ut8DyGaYLdt
	 ZT8rYMom0jrP81uXNG0EzZHWjLqyqWRreHUBBBAozIMpihb4ga9vjh4WkC1zYDbngSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqHfWJa9;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4BD60A2610
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB4BD60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqHfWJa9
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so36604365e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 12:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795466054; x=1796070854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jmJspXYhqF5Ifm6vBoYFDWnnVcY5oxgK5Qh3Vesxuh0=;
        b=eqHfWJa9Wea/Fb3/RD4KYoNZlniZ37XLDzgSuVOIwm9447N4+odJLiA9+zkUe8O7X8
         pK0pzNZwfoFcU2dNJid5h6+dBt/TBAwVz5J5T6E+Boe72nNC8S/RYIm3Egeli4/IEMgA
         kMjdkocnsr/jvd8VxembzJJFNYf+KCwWAEdQP5wt6SiDf20JnQi1dTcd+XnXb/P19sdj
         mlD2MvXC8CBGvpHU3jm2kIMGANo69DZbATy6WMiPUyFHx4o6VMlPn0bU5asxKS4JoHHh
         SRDGprAGom/o6GTtJv7uVF3N3HmCr5Me8w2SGAictAeM4pxXxdh5NZwEa1Iqxd1MlJ5A
         eZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466054; x=1796070854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jmJspXYhqF5Ifm6vBoYFDWnnVcY5oxgK5Qh3Vesxuh0=;
        b=vvWVVAum+64qHcERMQiaKZIVbfee9QLII8xJOB0usJX/ihYHFrNYaz6SoD/0wZehiT
         miS5BY3vsVPjB6e+Bek+N8KjB1ddRtt/ORopBPKE7RnThy/3JVIh87lkCj9RP8rf397t
         glILq3rJzsdmL2itgDj+9Z7tOICUqmgEiBISJXFVoFcqHLPz8r1l+n5oFGVg5Dg7cP+l
         Je35xT4wvdSdExvrKxlS71MxeHtD5EZ60qt8ybCfIMY41vcaeDrLPo4PJxh8EbOIIZ7c
         cIMrm12cQQbBrXgkBnGI3gcrxN4vNkzpJ3KnkP8ZbxwxkVcNNvIgW+oKKJ18G9kI4Q6o
         7o1w==
X-Forwarded-Encrypted: i=1; AL+hErGoIh8nnmR5dITq1qxeDzbS3SHP3ZDOtfKLujT2Dm/6irkrmTU0wDfk2iheTNQdseNE180zO7CydUaaGQ67@vger.kernel.org
X-Gm-Message-State: APuU4Z/5jGNTxBXky5UrwgSNCY5HPcCctnaOlxZgZLCfPQ7tga0w93oW
	WfEAE+su/cSwqkagAps6SlFDnulThTy6wOm4047WFA0NSJpgkF+A/vGB
X-Gm-Gg: AZFdTZf0S2qly0ZWs+EO01ffpVcnfeQ4rdkEwVsCRxZKR3cbvu1/Nbd9ZqHuVYZPqKH
	IBufk3w2UrlWLDal2jvwBRp2kwZFDa0RAGeqr2/QV2D9HRuo9gvT5Bl7PthcQ9ZuoNkhDIOC7uL
	m0Eda10G8CdLMEF4X1dv2JjKONFzvLuXLK4aCL1NST2cV/bUfTypAKE8Y6CPARzO6/d0V5mxTzi
	SXEqL0JJ7kYQmYgm3fwr1v3Mk8crVN8hE2X7OogEeancfvF8yJ+ZFrSrW9cTAb4x8GqnPdRyWEC
	P/8peJBGUq0BRByxOVTu0A7E4FHkUQJaw3yiRU4XYy12M5SNmS/4kwr8ZS1IxUJoHkiC7fAHjj4
	5wfq59k/RAZrc6D9BEPSP/Om5S9l3WgvKlObYa9une9Q0fXcO5GYP4S3AdUNPCByRN28p6CJtBy
	3ry0tYmvaAh647hLCf9rXNfevepTHgMYqfDOuUBKk11U0p+6F8p1kPU0ryxw382o5eZoXXahleP
	zM7RANXYSGciQoPBcAkQ7DQ8VpdgNkZCzzuai5c+unRywUtozZeZVdst8j0wUYadkMJ3fcwZq5J
	0/dx80MlK5o2JqhYXAEsI76BNdZhqEs=
X-Received: by 2002:a05:600c:820e:b0:4ac:da92:2bd4 with SMTP id 5b1f17b1804b1-4bb887c9936mr256814445e9.1.1795466054054;
        Mon, 23 Nov 2026 12:34:14 -0800 (PST)
Received: from unknown.local ([151.34.53.154])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm515946805e9.13.2026.11.23.12.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:34:13 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
Date: Mon, 23 Nov 2026 21:33:56 +0100
Subject: [PATCH 4/5] media: ccs: Make the source pad format follow the crop
 rectangle
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
Message-Id: <20261123-b4-ccs-imx376-v1-4-2b26850a6f11@gmail.com>
References: <20261123-b4-ccs-imx376-v1-0-2b26850a6f11@gmail.com>
In-Reply-To: <20261123-b4-ccs-imx376-v1-0-2b26850a6f11@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, stable@vger.kernel.org, 
 Gianluca Boiano <morf3089@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795466045; l=3197;
 i=morf3089@gmail.com; s=20240402; h=from:subject:message-id;
 bh=AfhBJJT/dYmW+sBV6vyFvVaWagbgV6JhE5LC9kE6/9w=;
 b=nA+mPZum9SfgJ6ZaFHnBsjvxZSARCOiB7wSvuXdYHv0c3WlskBv1F9e4K0z64Lp5zVi/LfWCS
 bsfvfP9bsrpApXIBaGZJ8QAEOn0BW8kIsqyx1hwoN5rRmPBZz/5icF1
X-Developer-Key: i=morf3089@gmail.com; a=ed25519;
 pk=HsGrEQ3ia8BGGGO8/nUM2K2UX9JKvRPV+nbrVDGrYhA=

The size of the format on the source pad of the pixel array, and on the
source pad of the sub-device that is the source of the CSI-2 bus, is that
of the crop rectangle on the same pad: the analogue crop of the pixel
array and the digital crop at the end of the pipeline, respectively. The
format was only initialised from the pixel array size or the compose
rectangle and never updated when the crop was set, so after setting such a
crop the format did not match what the sensor outputs.

As the format of a source pad can not be set from user space, and the
format of the sink pad it is linked to has to match it, link validation
fails with -EPIPE for any crop other than the full area.

Update the size of the format when the crop is set. As the size of the
pixel array format is then no longer its native size, use the native size
as the bounds for its crop.

Fixes: d8bca3ed1d70 ("media: ccs: Use sub-device active state")
Cc: stable@vger.kernel.org
Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index a4af27de5453..acea07d906f3 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2541,6 +2541,14 @@ static int ccs_sel_supported(struct v4l2_subdev *subdev,
 	}
 }
 
+static void ccs_get_native_size(struct ccs_subdev *ssd, struct v4l2_rect *r)
+{
+	r->top = 0;
+	r->left = 0;
+	r->width = CCS_LIM(ssd->sensor, X_ADDR_MAX) + 1;
+	r->height = CCS_LIM(ssd->sensor, Y_ADDR_MAX) + 1;
+}
+
 static int ccs_set_crop(struct v4l2_subdev *subdev,
 			const struct v4l2_subdev_client_info *ci,
 			struct v4l2_subdev_state *sd_state,
@@ -2556,7 +2564,9 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 	comp = v4l2_subdev_state_get_compose(sd_state, ssd->sink_pad,
 					     CCS_STREAM_PIXEL);
 
-	if (sel->pad == ssd->sink_pad) {
+	if (ssd == sensor->pixel_array) {
+		ccs_get_native_size(ssd, &src_size);
+	} else if (sel->pad == ssd->sink_pad) {
 		struct v4l2_mbus_framefmt *mfmt =
 			v4l2_subdev_state_get_format(sd_state, sel->pad);
 
@@ -2579,20 +2589,21 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 
 	*crop = sel->r;
 
-	if (ssd != sensor->pixel_array && sel->pad == CCS_PAD_SINK)
+	if (sel->pad == ssd->source_pad) {
+		struct v4l2_mbus_framefmt *fmt =
+			v4l2_subdev_state_get_format(sd_state, sel->pad,
+						     CCS_STREAM_PIXEL);
+
+		/* The size of the source pad format is that of the crop. */
+		fmt->width = crop->width;
+		fmt->height = crop->height;
+	} else {
 		ccs_propagate(subdev, sd_state, V4L2_SEL_TGT_CROP);
+	}
 
 	return 0;
 }
 
-static void ccs_get_native_size(struct ccs_subdev *ssd, struct v4l2_rect *r)
-{
-	r->top = 0;
-	r->left = 0;
-	r->width = CCS_LIM(ssd->sensor, X_ADDR_MAX) + 1;
-	r->height = CCS_LIM(ssd->sensor, Y_ADDR_MAX) + 1;
-}
-
 static int ccs_get_selection(struct v4l2_subdev *subdev,
 			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,

-- 
2.56.1

