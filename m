Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795728621;
	b=CJ1B4AAs0vfMJrBg6o/8jJwnyCP/fsxV2SAS0maOKOTydVpNniHfcINtBPPRch1IoCt2
	 mSwPVoUr1x6MsSfiJpr/Kmr0cshiS/Su5546mkQ8VHjke8J9B4eBZ/FeAurR+emAGt33E
	 kMAkopMeYb7dA5eLrRwt8l+cEocgsw25nR5y9glmm6cibBfcclaAxslmpviw6fniJPd7l
	 kMaRnwB4m44mStxhO0FTkXfXH7rHjqTmhQ4yk4s9PqemxdoeFYKA9zWi74UW1gKrAlAN/
	 gSs/FcGrBEGVCJC6IeMDptC25eCcMnzuD4PF65SWgqvBAIkO2Ajrun6UwgzlnStsKgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hEM7O+SfQ/P5il8iwTrMriaGVNGLOg5byRDEqHK9yNo=;
	b=fgeiP3zi90sxH4k6CLIO72vxpTqJoOo3+sdi185lULSG6tWWwfBuvF09xloH1hrwXZP1
	 BNd/xcFwVpVsI4xsXG/8/2fM263C2zk+lgQFXJ+VJIM5XWdRenIynvCNxaXYnvXhNIkCH
	 iS9zdtAMl/ObQOC4vwP4YUIEAoEdgJYbSN1Urzc6V6HA02HBl9JA8lrQLv+QMcCzq4KPb
	 f+qj8oViVtmOPCTmgOde/EPgkejMi7kwlnb3JhktCXiNJfMwRWhzC/6ZtqxVrSyDyMX3h
	 VgXf0ijvy3qwTSbYE9eSIsSeRchULV332Y3fkSj5bH79xiOTX9XrOd3y09Uf8jcvMVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=URqkVqlt;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C975606A688
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 21:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C975606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=URqkVqlt
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso5034439eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 13:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795728620; x=1796333420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hEM7O+SfQ/P5il8iwTrMriaGVNGLOg5byRDEqHK9yNo=;
        b=URqkVqltcCp6tYYsAnW+MQMrKHnDknW44h9foigyBf0TJ4Vsan3Gf0UJirvtTJrt+J
         WujgepDn5L1petCEPYiFNlMT5fuB0SvwDJGXp162y31T8Bs8yaYmrUEFvwwN6FzIi5EN
         pGMomnXg+xik5H1LgAFV11e9EMNllvX5OJLO6+gB5tNg27ZsYKiLPsePkNnFKysZM0pG
         BHtAKYopBgeT3gFvf5NVSIvDG+UV4nFQxyme2MGRNK1JdDXrpEL/hdv3TfES9+VLZECc
         3LMskwwIkyHJeGjW48E5I7suk/OqXvBwrvhiVTlFL8yi9cPrAW26dltLsE6mE48AT0O4
         4p2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728620; x=1796333420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hEM7O+SfQ/P5il8iwTrMriaGVNGLOg5byRDEqHK9yNo=;
        b=rw1MJkRPgqNSC5IZLJIwNTpboarE/jdVLhnqrKwu8Q0OlzUn6vWFIT/LZAUw2tHacW
         qC6xMCUIQDzJ6K4aVmDA2Y3vFSTv+c5XWcOS1rGDZbleo+M9YtKPjgc5kSnhp9jG+u9k
         r38GWL7pmPzDacPYB2HzcLlyKepZ8jyazpDuNi2n6kcKoHNyVwHFjPOKyx7EhYqx7+81
         wU7HxM6o4GTD6iyvRwH3WEox2sXTbibEmDSSRWWHjey+QW1G4eFY6vIdE1AklAd2Ys2m
         G3C/HCZULB33jP8b4nGyzyoC7ljshUFoarrDb96r3jFPUTpOzWdgUlwi7fwgm7rn37Cr
         txAQ==
X-Forwarded-Encrypted: i=1; AL+hErFfT5JvkER2zdixfAJHYfA0TaV8/OPdhxwV0G/vXjqRwiVSHe4hYs8Haen5EfOjbTHnlPmwn0szhwZPo1tD@vger.kernel.org
X-Gm-Message-State: APuU4Z/5SuqBe7ylY86hV0SRoL9FDgP67q9Zlmijq49aORM4PEq1dXc6
	FPkD7W0E+/en9lExPQqrqCfT7GQ7E4Uy7qgDdYj+62Y+EBLF85et99Kk
X-Gm-Gg: AZFdTZfuOMM40zLbCKkXT0TZn7UIYVNwvTJMKNnoqoio7oUaRxiljXjLtBQt0OxnuN+
	MI9/fWhgP+dJk2vUvC4OwNMlKiyVcDoLVU7J6EMFRozj5onfit8v2f+jrufdZQdVhCd64ZWUQAU
	XZz12Uyc+NCzxYjT5I6e3N9Dbd3ZrCmtDvgUJoX6zAAaNO/cVmOrWdwJ3bYpsx9CxMSDV6X+RZx
	EhvfjHE2fEBOy7Vi5MBxamKSov2Y79iqvOugsFYXH7WdRhd/3uKhwoKwMs0iTZEUQdKsTiDRJ4g
	zxTDBvN2JHzdqzLJ/H5Sygl0wCIqZLeBmGAzPt5psMTeCPkhSqmCTjWO5uokQ2DY19ASqLQ9p4s
	p6vbwPOczTa/VgowJ9BnnqwfGR/+v6vrcca6jtb454eQH8NSXfqdNcpX9iFywrffSCflglrLH0C
	jneh4CNpmfqtBsAJUhw8E2mlriijs3zb8cxpWmYOfyx7AsoGcpQphqzV+urzj/WOlMyQHcdRe/l
	tEw/kTKeTGPa4Sy83xIKV1tAweqD/AXUClysDTulEKLjeYJlenF9VeaSkKccyUzvG02KOpymTjP
	0GG5jxh1jFBfrzcgTAfg0fKv9eELYKz3I04t2LYyiLwcPyKX+Y8kd5GMk0gFIFAtK7APkYGH1o0
	NUy7Nr80fHTFkdu6swLbAU8IkuQrGh9XMvHtF67Jb
X-Received: by 2002:a05:7300:c38f:b0:386:e4ce:7524 with SMTP id 5a478bee46e88-386e4ce7546mr2012754eec.36.1795728620238;
        Thu, 26 Nov 2026 13:30:20 -0800 (PST)
Received: from localhost.localdomain ([76.33.234.50])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm33434219eec.9.2026.11.26.13.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:30:19 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	bod@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	stefan.schmidt@linaro.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2 3/3] media: iris: fix out-of-bounds read in gen1 sequence change event
Date: Thu, 26 Nov 2026 21:29:04 +0000
Message-ID: <20261126212904.27207-4-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126212904.27207-1-dennylin0707@gmail.com>
References: <20261126212904.27207-1-dennylin0707@gmail.com>
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

iris_hfi_gen1_read_changed_params() walks the properties of a
HFI_EVENT_SESSION_SEQUENCE_CHANGED event. The number of properties comes
from the firmware in event_data2 and the payload is never checked against
the size of the packet. A count that is larger than what the packet holds
makes the loop read past the end of the packet and, if it is large enough,
past the end of the response buffer. The values that are read end up in
the formats and in the crop rectangle that user space can query.

The same code in venus was fixed by commit 06d6770ff0d8 ("media: venus:
Fix OOB read due to missing payload bound check"). Do the same here: keep
track of the bytes that are left in the packet and put the instance into
the error state when a property does not fit.

Fixes: 84e17adae3e3 ("media: iris: add support for dynamic resolution change")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 .../qcom/iris/iris_hfi_gen1_response.c        | 73 ++++++++++++++-----
 1 file changed, 54 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index ffa98139f0eb..a5b43a408e55 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -34,72 +34,102 @@ static void iris_hfi_gen1_read_changed_params(struct iris_inst *inst,
 	struct hfi_framesize *frame_sz;
 	struct vb2_queue *dst_q;
 	struct v4l2_ctrl *ctrl;
-	u32 full_range, ptype;
+	u32 full_range, ptype, rem_bytes;
+	u32 size_read = 0;
+
+	rem_bytes = pkt->shdr.hdr.size - sizeof(*pkt);
 
 	do {
+		if (rem_bytes < sizeof(u32))
+			goto error;
 		ptype = *((u32 *)data_ptr);
+
+		data_ptr += sizeof(u32);
+		rem_bytes -= sizeof(u32);
+
 		switch (ptype) {
 		case HFI_PROPERTY_PARAM_FRAME_SIZE:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_framesize))
+				goto error;
+
 			frame_sz = (struct hfi_framesize *)data_ptr;
 			event.width = frame_sz->width;
 			event.height = frame_sz->height;
-			data_ptr += sizeof(*frame_sz);
+			size_read = sizeof(struct hfi_framesize);
 			break;
 		case HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_profile_level))
+				goto error;
+
 			profile_level = (struct hfi_profile_level *)data_ptr;
 			event.profile = profile_level->profile;
 			event.level = profile_level->level;
-			data_ptr += sizeof(*profile_level);
+			size_read = sizeof(struct hfi_profile_level);
 			break;
 		case HFI_PROPERTY_PARAM_VDEC_PIXEL_BITDEPTH:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_bit_depth))
+				goto error;
+
 			pixel_depth = (struct hfi_bit_depth *)data_ptr;
 			event.bit_depth = pixel_depth->bit_depth;
-			data_ptr += sizeof(*pixel_depth);
+			size_read = sizeof(struct hfi_bit_depth);
 			break;
 		case HFI_PROPERTY_PARAM_VDEC_PIC_STRUCT:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_pic_struct))
+				goto error;
+
 			pic_struct = (struct hfi_pic_struct *)data_ptr;
 			event.pic_struct = pic_struct->progressive_only;
-			data_ptr += sizeof(*pic_struct);
+			size_read = sizeof(struct hfi_pic_struct);
 			break;
 		case HFI_PROPERTY_PARAM_VDEC_COLOUR_SPACE:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_colour_space))
+				goto error;
+
 			colour_info = (struct hfi_colour_space *)data_ptr;
 			event.colour_space = colour_info->colour_space;
-			data_ptr += sizeof(*colour_info);
+			size_read = sizeof(struct hfi_colour_space);
 			break;
 		case HFI_PROPERTY_CONFIG_VDEC_ENTROPY:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(u32))
+				goto error;
+
 			event.entropy_mode = *(u32 *)data_ptr;
-			data_ptr += sizeof(u32);
+			size_read = sizeof(u32);
 			break;
 		case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_buffer_requirements))
+				goto error;
+
 			bufreq = (struct hfi_buffer_requirements *)data_ptr;
 			event.buf_count = bufreq->count_min;
-			data_ptr += sizeof(*bufreq);
+			size_read = sizeof(struct hfi_buffer_requirements);
 			break;
 		case HFI_INDEX_EXTRADATA_INPUT_CROP:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_extradata_input_crop))
+				goto error;
+
 			crop = (struct hfi_extradata_input_crop *)data_ptr;
 			event.input_crop.left = crop->left;
 			event.input_crop.top = crop->top;
 			event.input_crop.width = crop->width;
 			event.input_crop.height = crop->height;
-			data_ptr += sizeof(*crop);
+			size_read = sizeof(struct hfi_extradata_input_crop);
 			break;
 		case HFI_PROPERTY_PARAM_VDEC_DPB_COUNTS:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_dpb_counts))
+				goto error;
+
 			iris_vpu_dpb_count = (struct hfi_dpb_counts *)data_ptr;
 			event.buf_count = iris_vpu_dpb_count->fw_min_count;
-			data_ptr += sizeof(*iris_vpu_dpb_count);
+			size_read = sizeof(struct hfi_dpb_counts);
 			break;
 		default:
+			size_read = 0;
 			break;
 		}
+		data_ptr += size_read;
+		rem_bytes -= size_read;
 		num_properties_changed--;
 	} while (num_properties_changed > 0);
 
@@ -170,6 +200,11 @@ static void iris_hfi_gen1_read_changed_params(struct iris_inst *inst,
 			event.bit_depth, event.pic_struct);
 		iris_inst_change_state(inst, IRIS_INST_ERROR);
 	}
+
+	return;
+
+error:
+	iris_inst_change_state(inst, IRIS_INST_ERROR);
 }
 
 static void iris_hfi_gen1_event_seq_changed(struct iris_inst *inst,
-- 
2.43.0

