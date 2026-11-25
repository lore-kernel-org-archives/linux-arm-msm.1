Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612181;
	b=PZ7VOmQJ+pHhic7YYA2aVAjYS3OZTP0S9/R/uG111UCWtJpaQ951VVlZo6tw2S1lNKaO
	 761wdcAebUp1DTJq9PpKWo8U4dEjsjapXhetId+d6RUu9vfntbC8JEYKKvTc04wvvgS5L
	 Pq9BhcK3uuoqdbXj7Qno3ODqk1birPu08/09RhxFCWyy+mDD9OMaQHRyfiliyu3u2vkw2
	 423nqvgwwax9IyNUdMBT+XYACAfnGpXNUDHHAG1HAQNiGVTOAvzU3QxBmUoOoSwa5a5Ik
	 Le5gnJFKWggtqh2MmVE5ddTV7GCtFdMnSR2zDTPKLhrTVbAamzbxS1wUAm3fZQZHRnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=1JnaOvzbLcP2sNcJP976acP71/2cngYyNJU+YtGyJdk=;
	b=mPnjXQ9BYHoA5DL6Fqtj5dZeERIjLLJL8W4EGZovwRg8cujY5UOC4KTUwBDDmQC7SYok
	 HK9U2jTlhtVDY17bn1Ny/XfP6xdC1jIfLlYTcw1nCJzC9i+RL31bJ3oxNN14ynuvC14WB
	 gmJErQJqz0YFtZplKCXZRDxxD5ysXsvObruu+ro2tYzZcW9KbiXv4TZC8fUfjXaHnKiT0
	 HchXJv46QNMT4vjba3VK7uAA0yntn+yctC0r27D2CT6mvBuYX+LnwqNv3+CYjMBEqefWX
	 T8tKQWTSbe1GP1tBxMIvG8URws7pK2/XyPmCPaRNPVGgNkxaJeHXWdAweNINNxfDscQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EbaI0mzv;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32AA606A684
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A32AA606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EbaI0mzv
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a32576da88so3309487f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795612179; x=1796216979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1JnaOvzbLcP2sNcJP976acP71/2cngYyNJU+YtGyJdk=;
        b=EbaI0mzv9QD673NFTbDjtC8hootssIeqFAp+yVWUM17sBxfOH9Ky93rUtaqMVmDcGu
         jVgWphl8Z8s4K8Ru/UixvMwj2E+cugNqVG+PWjCkyHU2FMrahqn+ZdI98Owi7wscYJxA
         bhpR/WxYFp1kjnPJH0PXi1KMrYmiT+tVkLm+46VLyhTW97BA99B14AIT3ofwtXpPeFnS
         JHOta2tooiSV04y7D4s4jm1muYBKsQpHF/Sy14h0x3NUgXhorXjrk2FhiWuBXrxYyBZg
         KE75pcKUKq2NOzN3IefjdQkGIwyg9dGIFqIvxOXCk04Os7xamg+q2+U8a/jDOpJLuQ2t
         5r8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612179; x=1796216979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JnaOvzbLcP2sNcJP976acP71/2cngYyNJU+YtGyJdk=;
        b=rBHhSQw7TJi7zZbkJnW+VlWXu+hmT8BQ3mhWeAXXCvfVaYY1YY5/1DMcEO6wdVm0Fs
         DDPuQ1sCCE4tibuAvyux4vUQBWC+0EebSuG2W7TbPRmep3mW+DqsEAzoR2jWO6jQTCRk
         JLNNTikUlgLxEu+p+KvuMvso0tJQ4ZBa9eHKEeZ1ziGvFbvZ1zxrajMoRGFeebyqFqMp
         ZcAxYe8etLKEtwISFDE+3AJ6FWvupHH1XRhnP3Tt/EALHXGjB1B8jAz3x/3xc+o189rc
         Okcr4BOETqTeqFJsc6YQZXnGib8JiqkSw3FmMNK4OOZBNre0fPvhWecswO8dXpvZa8/g
         CGPA==
X-Forwarded-Encrypted: i=1; AL+hErHqCxJLIFuS4UoVqZgLhVTI/6KzaMX9kU+hJlpmNWz5FMwuuniFSqAESmZpweakzUA2U1aXuwxejg6o3C6L@vger.kernel.org
X-Gm-Message-State: APuU4Z9QPoa7wMcwVFi73zXIA9mUd06uoCWiBqFpk7Dj6U+nS0e2Y5mX
	+gs2IfAPxHSUv2c+L1CTy9+L9SXVoUi1jvOwX2nRe4TLYHY5xA8FCXC0QhSXgySCcU8=
X-Gm-Gg: AZFdTZexjGF1VOldpGCx6u749SGfUSa8r1UaZwwdIicbKY2p29deVMQ+BZZaU8zpl4w
	/DSTJVgxIyx+c7UtQl2MdbB4BaoD0jXrtaLZ7iKj9X48Itlz/jmdjlkuP/pTEZA0kPWeSLUj/Hm
	GFbDxZLIwBAb6QHyJVkktYkPVkW83LohzuXxENW1ECeudW1I5fSLW0It6u15jXoZHj419wjdWJ7
	1TsynJxbUes9OIGNNRsT32equLWYo6N+geyGd/dpBe6nsI8t7ZVKB4svUfEqtAzTMBO8t4LE5MH
	hD0pHYssQ+q2znouhO+AO/DgiN61/KCTyjMWCyXP2UjgV5XcZ6L0L8HS8Cl/iYHWIEkWdgOEtOP
	FgEsFcj+2k1KFcf6E5WCpDNDbKxV/EtqhkhxRFC2JiWt4PF52fU4RmoD+vR9Hsi81Qq+nmuuDO0
	LI9ApGU0eyL27NeMWMJgHYjTcKOMMMJ8pp8I5Ed9IX8NSVmqs86bGcZuz/l/u4dG+3sr3SrEmEK
	J5lNvziliXOXFYcmWbMt+ayGenPLqygthNmwoxGIUmxqknsHp8HeH4B7Yv+rV/puqOacjqYwLAB
	2eXAgHIrMxJbu5Gprcn+bC+pSZAGS4TKl7fS3GoG/MuqucONgA==
X-Received: by 2002:a5d:5888:0:b0:492:5ef7:5d98 with SMTP id ffacd0b85a97d-4abb6651686mr32474274f8f.38.1795612178820;
        Wed, 25 Nov 2026 05:09:38 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm35240355f8f.2.2026.11.25.05.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:09:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 14:09:30 +0100
Subject: [PATCH 03/11] media: iris: vdec: update the minimum CAPTURE buffer
 count on S_FMT
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
Message-Id: <20261125-topic-iris-decoder-drc-fixes-v1-3-58b9f6b3fe86@linaro.org>
References: <20261125-topic-iris-decoder-drc-fixes-v1-0-58b9f6b3fe86@linaro.org>
In-Reply-To: <20261125-topic-iris-decoder-drc-fixes-v1-0-58b9f6b3fe86@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Vedang Nagar <quic_vnagar@quicinc.com>, 
 Wangao Wang <wangao.wang@oss.qualcomm.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6575;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=nYHUBJsHcHafB3LNG5mNYke12OYzvMxrg+k8D9QxsnQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBt4MXnN1nigUPpWW3dPL+MKiiCTJHAKjfUO9u/UY
 oJgrCM6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbeDAAKCRB33NvayMhJ0bj8D/
 4iDBarraz5ico7ycdwYYlX1R1NgLLT5oViAQt8WW89zNnpOQiCfTHzKUw7RaYpoGBng1e48pnHWofO
 V3YE3iIWkRk1nXq8V3kT7V0OcRN9tOg6yhHAidAodKjYZ7gMWJg1nbsn98wKsRuQIePSiAuYCILrn+
 rRoyMTWUnjM4skJqegaFFG6EqexPAqrpJEANY+YmdDHcb/ydebr69u2GCBmAAIDSNsbi5/26f0Vq6A
 GbRDs7SIvz5A0MczQzlET2cynDY4nlgAQQ7lXFojqLduQ7aOFGo1VCg0KpNysbIa6yjZEfYuDv4rGp
 iFwx/9z8iYYN9RYMxGZDzblO1sQL+dNFVktSeUSJkw6PAlNwOKxYKxEuCV+I9UIgpAfqAS4f3ss4R0
 DSm4eJ44iRrxBNmpxcqZfm6PwLTlDmkZYQRXVj3zm/uj36JAG0Mniuy8QySnpVa0e0LEmhXfN71RGX
 TyhxhnQTxsOl/Ybhp624KISG9FcQXYcMfIbpYY1YMaG6o6wnq+y8kFM+hJl2wfYyfr0wMcZ1bhFNOn
 8xSiVjtEUGEyGcE+552iCzv6TeOXNXg2IkDdvcH+tSrnVHYkDkqRxEhEGg9Vs90fjkxzAfg7bE1Brm
 Y0Kysqx5HhCBsEw6+wuaxT/pttcMU1+5eR7qqtm3y7rNeQ7R0oJzpx6V+PDQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

V4L2_CID_MIN_BUFFERS_FOR_CAPTURE and the CAPTURE queue
min_reqbufs_allocation are only updated on a source change. Until then
they keep the default of 4 while S_FMT already computed a minimum of 9
for VP9 and 11 for AV1, so a client that allocates CAPTURE buffers
before the first source change gets fewer than the decoder needs.

After a new S_FMT(OUTPUT), the firmware count of the previous stream
also still sizes the CAPTURE minimum, the internal buffers and the
minimum output count sent to the firmware for the new stream.

Update both whenever the minimum is computed, and reset the firmware
count on S_FMT(OUTPUT).

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../media/platform/qcom/iris/iris_hfi_gen1_response.c    |  9 +--------
 .../media/platform/qcom/iris/iris_hfi_gen2_response.c    |  9 +--------
 drivers/media/platform/qcom/iris/iris_vdec.c             | 16 ++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vdec.h             |  1 +
 4 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index ffa98139f0eb..70b97902ca2d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -32,8 +32,6 @@ static void iris_hfi_gen1_read_changed_params(struct iris_inst *inst,
 	struct hfi_bit_depth *pixel_depth;
 	struct hfi_pic_struct *pic_struct;
 	struct hfi_framesize *frame_sz;
-	struct vb2_queue *dst_q;
-	struct v4l2_ctrl *ctrl;
 	u32 full_range, ptype;
 
 	do {
@@ -158,12 +156,7 @@ static void iris_hfi_gen1_read_changed_params(struct iris_inst *inst,
 	inst->fw_min_count = event.buf_count;
 	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
 	inst->buffers[BUF_OUTPUT].size = pixmp_op->plane_fmt[0].sizeimage;
-	ctrl = v4l2_ctrl_find(&inst->ctrl_handler, V4L2_CID_MIN_BUFFERS_FOR_CAPTURE);
-	if (ctrl)
-		v4l2_ctrl_s_ctrl(ctrl, inst->buffers[BUF_OUTPUT].min_count);
-
-	dst_q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
-	dst_q->min_reqbufs_allocation = inst->buffers[BUF_OUTPUT].min_count;
+	iris_vdec_update_min_capture_bufs(inst);
 
 	if (event.bit_depth || !event.pic_struct) {
 		dev_err(core->dev, "unsupported content, bit depth: %x, pic_struct = %x\n",
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index b4fe9066fcb8..baaab9608da0 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -537,8 +537,6 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 	u32 video_signal_type_present_flag;
 	struct iris_core *core = inst->core;
 	u32 full_range, width, height;
-	struct vb2_queue *dst_q;
-	struct v4l2_ctrl *ctrl;
 
 	subsc_params = inst_hfi_gen2->src_subcr_params;
 	width = (subsc_params.bitstream_resolution &
@@ -661,12 +659,7 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 	inst->fw_min_count = subsc_params.fw_min_count;
 	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
 	inst->buffers[BUF_OUTPUT].size = pixmp_op->plane_fmt[0].sizeimage;
-	ctrl = v4l2_ctrl_find(&inst->ctrl_handler, V4L2_CID_MIN_BUFFERS_FOR_CAPTURE);
-	if (ctrl)
-		v4l2_ctrl_s_ctrl(ctrl, inst->buffers[BUF_OUTPUT].min_count);
-
-	dst_q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
-	dst_q->min_reqbufs_allocation = inst->buffers[BUF_OUTPUT].min_count;
+	iris_vdec_update_min_capture_bufs(inst);
 }
 
 static int iris_hfi_gen2_handle_src_change(struct iris_inst *inst,
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 472e8e50830d..656e69d2c942 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -63,6 +63,18 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 	return iris_ctrls_init(inst);
 }
 
+void iris_vdec_update_min_capture_bufs(struct iris_inst *inst)
+{
+	u32 count = inst->buffers[BUF_OUTPUT].min_count;
+	struct v4l2_ctrl *ctrl;
+
+	ctrl = v4l2_ctrl_find(&inst->ctrl_handler, V4L2_CID_MIN_BUFFERS_FOR_CAPTURE);
+	if (ctrl)
+		v4l2_ctrl_s_ctrl(ctrl, count);
+
+	v4l2_m2m_get_dst_vq(inst->m2m_ctx)->min_reqbufs_allocation = count;
+}
+
 static const u32 iris_vdec_formats_cap[] = {
 	V4L2_PIX_FMT_NV12,
 	V4L2_PIX_FMT_QC08C,
@@ -271,6 +283,8 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		fmt->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
 		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
 		inst->codec = fmt->fmt.pix_mp.pixelformat;
+		/* the firmware count is the one of the previous stream */
+		inst->fw_min_count = 0;
 		codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
 		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
 		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
@@ -294,6 +308,7 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		/* Update capture format based on new ip w/h */
 		iris_vdec_set_capture_size(inst, f->fmt.pix_mp.width,
 					   f->fmt.pix_mp.height);
+		iris_vdec_update_min_capture_bufs(inst);
 
 		inst->crop.left = 0;
 		inst->crop.top = 0;
@@ -310,6 +325,7 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		fmt->fmt.pix_mp.num_planes = 1;
 		iris_vdec_set_capture_size(inst, f->fmt.pix_mp.width,
 					   f->fmt.pix_mp.height);
+		iris_vdec_update_min_capture_bufs(inst);
 
 		inst->crop.top = 0;
 		inst->crop.left = 0;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
index 5123d2a340e1..4b903da58056 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.h
+++ b/drivers/media/platform/qcom/iris/iris_vdec.h
@@ -15,6 +15,7 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
 int iris_vdec_validate_format(struct iris_inst *inst, u32 pixelformat);
 int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub);
 void iris_vdec_src_change(struct iris_inst *inst);
+void iris_vdec_update_min_capture_bufs(struct iris_inst *inst);
 int iris_vdec_streamon_input(struct iris_inst *inst);
 int iris_vdec_streamon_output(struct iris_inst *inst);
 int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf);

-- 
2.34.1

