Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948596;
	b=x18jWvJxjP4Ev1Fqq442Jf3R5y88Z9+tT//B/AVcH67zdHW2IaGj3N5rY+gID02erqrh
	 Sd5eR8a3ZB0a63Rke+daZFNhgAVVZZjkogU/DxekULkuAxGu1TWcDlBCrOky5oyw2toW0
	 +wpZefQeObdQkV/tCbjERV3DntWtYzzdWM43AcZldGd+J5IPYvVUhWdOXj9Ul2Cn9GUFC
	 MdHibhOJBQWZZ5mMJe9zqPRVnDfbSY3tIyDBlP8lQRreFUuGH0ALezifZQM4qS0qnb7ZD
	 WFjY1InpNl8G7BfcMqtHCVUdWCB6ykyJBIcvvLVsRa0Wiq9xOCf2dyu+zP1xjgSd3nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hEM7O+SfQ/P5il8iwTrMriaGVNGLOg5byRDEqHK9yNo=;
	b=DmAfy51AWezx9TqKbVcHHVZdOhBA+Rd42aImV4XUpsSbyUJs9RvALsEw+y8hFeI50O5F
	 LH78ygsLTbtVVvpGFsV1QEZCy8GiUXTE+Pks5PuWKFG1NeSgQQKHrENGCTEA9i/TzWMi1
	 LmplQWv6IAHPLq/kYgPcbxRvdV3eZsFG1AWOIojFzlaj/GslPxrcORDxRG5d+u/jPF5Zg
	 reoV56trkl6hxH5obn7tq+wU7NiCopZPR3iYuK3q7b51IrSpchZXYk46umwLgnByFUdIk
	 T4Adhqfxtk9Pwh4bHZOp5I7Ym2cmH2bxViBRxaaKYCelBTCaw+zDpyuoNXKrYljKBzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLNQ5nfb;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3080606A88D
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 20:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3080606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLNQ5nfb
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-3818b9f0083so127478eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 12:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794948595; x=1795553395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hEM7O+SfQ/P5il8iwTrMriaGVNGLOg5byRDEqHK9yNo=;
        b=lLNQ5nfbKi8F59LyfWYawqhvhrT2KprwXCQRkhMPXDLJdENW/tW7ZQjjPSDpSx06hw
         8QpJnHYOngvA5o3KG5KlQjgG7pdVtWanlvysavS6SdD3FpGCkg0aDZvPKXXKMFU1pERD
         cX/IfWPbFmxt7IL7GGNmVyY2sl4+8ok8syOrNTZyY92iJpPqLfU9nYgDOQAC45arAbdX
         OiXBsQ22BUqrgo/q5kockOLIWa8XjE9WUgMACGDvIZDaplH7SbMqhHH5nDRBiW+/fp8O
         4wzuGJDIPeo6AykG0NWXNGe9eZdDX29QEuZkPCHoel5XTLml4RgIiY2OCjDNPHtpbUVJ
         2Oog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948595; x=1795553395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hEM7O+SfQ/P5il8iwTrMriaGVNGLOg5byRDEqHK9yNo=;
        b=bs2GPKQ0UEDza9RGbpx4tLkWhuR9o/94jFfMXLrc8T5MTtGUBdIdKQR9WZsBX57385
         3VS2312CA2awfmMcnrPxhREhjIxnzGfb/YXPh9JvW/sjn+yDFS1bvcphNukhNtYm3y5M
         ddykR4M+hjzEWHAoXINZILyjQa7NoAigYWuMwDGwDfK7p/drjG757WOKLw1oMDdK/wDe
         4V9sbh7W7afDyMpdpL/ycGKBhWf2Cq3whgNZtCirdjijg3B8nOWMzuPkw4M4ffOJnNZW
         TB6UMyc6BJcLcSpUmLfT36McHwe7+Belw/rqAqejfojnfCW323vg+U2kVVLxfRgE010Z
         lGHw==
X-Forwarded-Encrypted: i=1; AL+hErGv8iC4wFbKwKGXnhAYuhKLVkGOoKzV7sNEdBX4OR5Lc9MuObzvyPR/3kV4uyp/S/avvifroEByaYy1u+Vg@vger.kernel.org
X-Gm-Message-State: APuU4Z9l6sleVO0TyVv62tYJoriVIYRs6ogyj8yvKxOd4WZl7IG6ehdQ
	RDhSgj2UmzD2fc79TnTuDIFc6/mOdk05j8pKUyRBp4vvdSP5sxQeLlNy
X-Gm-Gg: AYBFou1rF1rgsF071uD1JtXZv7Vy4LM2O/Rps8TuKnpT7IMc6O++l4NbDUjnNjYsto4
	SBlPUMN8+Fep1DF9F/OirpU7IVNVL+0qCXHuJbVOdYy2BJjh616wdUtQ7KFoj8X0Es7TpcNlyKZ
	FJDg4F87B15V5XaSmM9XFGhTouyCx3G0RsFPoMseuMPDC835Oao6jDdK1FZ2VsxkHUGZXVQ6auw
	cChiQsEmS2E+K5cI2zQWDGEgnLVFa2jPiW+VwlwJ3YBVQq/OwmXvmwyD3oz8Cgyc2JfMZ9G6CO7
	X2D8XCNT14VPsYQoTKd3Hd5JX52OTdjdcBlfKmjt9B1tugG5yVesddCgrvGZ4ccZYkjbWfbeMEN
	Aq3YvD+3byBMGfr42sHTzIggxsVUFOV0XRQdG+DrF1bCfeD/hM4f3qzggpc1h2uQ2V+ZdGQyCDs
	rjh5Fyh7Oc9MnqXBhOT8ajdp2AcjHatOhNhu+xq/HsxtFhGpeO6oHM1tCzyKUrLufVjCrGV7BFi
	6kkzzf2mgatdlz2Qkym7vD1On/wiONEAIY+FEcrmCgeUb2tQu0tKJ6XbrF+J9PxoixdphtAm3c5
	T6WU3JqHea/p+ItgX77/MJZ12QxHl6bUiNqVlQ0YkITzGoJOhY7mPbbeCT6XrzsLO0+Fm1l867N
	1wIQhox8x5yE+7/dsCB6GuDr8jeqScqNwn2PEzXQ7brEQEBi32bZsG4lLSpc=
X-Received: by 2002:a05:701b:424d:20b0:199:7dff:f9cc with SMTP id a92af1059eb24-1b543c4406fmr654577c88.42.1794948594727;
        Tue, 17 Nov 2026 12:49:54 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm989029c88.11.2026.11.17.12.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:49:54 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	stefan.schmidt@linaro.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH 2/2] media: iris: fix out-of-bounds read in gen1 sequence change event
Date: Tue, 17 Nov 2026 20:49:45 +0000
Message-ID: <20261117204946.21359-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117204946.21359-1-dennylin0707@gmail.com>
References: <20261117204946.21359-1-dennylin0707@gmail.com>
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

