Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612181;
	b=3g5/zQTj5et2jZ/FO3NX1XAbob5pfkdTfzEShiZCPFoLf0o9Ol66I0umFk7fE5aeyFXQ
	 H0rXisDcpIfTUO+yZ+wVRraxsO7nZW3VaqeYadegKtsUIFW0JimI/hN5mgUsV1mWl6xKx
	 /TqVBiWYRlIb7CFy97OEUk/vhhz5+LjHeMEmgODuNdVexBvjkEo3ucZkppGdjcRs+Uvz3
	 pIgdK5wh/iTkIPFO9/l6qN/cGdn4cQ2cXKSYQjrP+UDiKKaiSKtuNusUhvlFf9tIF+zRI
	 +vsGL6giHzoEu8Tl9Cj1ismKRmE3F+mKIKEDO0DzkSFy2coC2B/eNrT3oPCm0MmDezw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ZywXvAFwEUemsHrXzBdGIC783yZetHpR4bFqH72y36I=;
	b=kk6fj5BWbgDiODdBnNfkgXrpotsMIuZZ71vTCk/ya8F9r2/9LhCVp9BKazwbhhmfRtAt
	 7c0MIgtOZJvL6k3/e3ze4SUKFdLvUU0cCVi3CWqmGJVXMqdO6scTqt8kPZwP2tI6MxZi1
	 1n6E9DOjNJcijKXZVdkj0yjh6uvoLZGaeEphqaPpk7VtbwVylb39iQQJKf6u54yLZxZGC
	 OMpwIUth50y9YBCHP4g0PXmTqE+N9Qm3uHU6Xhc4lmbB9A9c5B9rtxgw8OKHBR2CNtG/Z
	 KgHu0xYlCTTX1OsHCL0cbqUiW5QMzmKyikNOFsg+/biIMDIgC3e2AJE5gE2r6LhHpjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zJ6rQHCP;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AFE606A68B
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63AFE606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zJ6rQHCP
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49a92144733so2825681f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795612180; x=1796216980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZywXvAFwEUemsHrXzBdGIC783yZetHpR4bFqH72y36I=;
        b=zJ6rQHCPTWeIZccDhVH8VVgj6p5RW2zDrOgCbmsXc8UsmGoV9gQZatNWBwGL0guapv
         tkgTWJSV6lKpsiwyc+yee2I8+cJXUrNoro2q4hgqSyAFnCAEjPd5h1oLlyFdffW3Y4ZD
         /2LnlTOJ6ad1PdnH1cr0NRLmv+Jztq+XB1XMRaDPoUQGSo/LCtPNg/fw3ndTnPLaZg6u
         FVUaxFOzaSuAjVIe9WpmDpVbVFioYRYzrlT8RLGz4PaSkfaP836fFrdbiskG5+rmVerR
         WrV1xhpyrcAqeaVJLb2Q8M9rn4nbOhXQNlSJlxC08CCMe6HhO+KBoD33pxU2IuFEe8uQ
         noBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612180; x=1796216980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZywXvAFwEUemsHrXzBdGIC783yZetHpR4bFqH72y36I=;
        b=vBP0Hhl8mm+bvay5Vy9ePh9NnGdxKW1SAtElDopga9vX+wBYhDwZUK1rbdSCLbbtWW
         rfkhd1ZY1tVqq4twhmuhSMBMDEnCuylxcqwHLVE7cHwv25gy6oYJErJzIyGCUGu4fBqJ
         gc++adXvgs/SXSc6u+6ALRozZlxw/qGJ/owUz6W9aVh3+L5vNmAlY3m8n3be2ls59j9V
         vziY6JP4xUyq+0dB9xDir4LV+oD20zZkI34qfYsYVDqFcqaJ8Im3cp8t/aeo1EDPQf5m
         0yYqFiGj2TlfWbhPhGfQa/l5MSrgntLX+YIen5PfVU+mq1jDTRs6NMoMgS4Mkc5T3Lk2
         ZXQw==
X-Forwarded-Encrypted: i=1; AL+hErEA6rQgH6I/V6bX1bXht6qTvgE64bLIp8weVFgEFycdOl24Wiwu1ZXUUiAeyP/OPi0kAiFHJ3eIyE/blI+j@vger.kernel.org
X-Gm-Message-State: APuU4Z97e1coyAnI4gY/a284vZDD4IfYRQtICDkFXVb1UIeLrq5WIUbW
	Hd3q+8s3wxoLTuMK5PLFavyMDchvOy094amk8rxfEbayFRlz20Cv0ygBsAvzMrRD/ak=
X-Gm-Gg: AZFdTZecuA6WutyRWGAIHK8w544qNT3mZbd+SNgVJGr8FB/4OcQuD/bPdXemyMkTtBN
	V5RRcuhlFYTiTB+klR54VxMcIMAVvS/VVag4yNtbyK1UWH2tAcCrf2/U1Apq11Gv3wyrD+vNz22
	1Rw7oqjeJb+oMOZsVmG0vgk77iGxBcbZzeu4dCxdDr5LA4Ngf5Tc9oBlOvr8/IpsFcveSKiLBR5
	JolIf3VZSxs6pffs3HigLLfpxMWbhR/JFULMClOkVsgDjLkf9c7Q9Ssj6ClRz8DIK3RmetwUSzC
	XqjeK5xLD3XRbrFJKwQhIn0IRComUz/i4jcAZxkEBUboww6apC9JUk5FaCYiSwmjNMQGQOlFHbx
	XNaOqKDa5SB19xgG8LC/C98njr2k9AbW0AGXKiVenTDzZ6OZ+JduSBn4d9qlEPj3wcohx7DEOSY
	pHz6Dy+N3b/bFuuYD6bhLtbylOaDQZH0gLAqSTAmXXq0FZGqHKVLGgafWaCA2XGxWmCeTy/U1xf
	NAsKXRu5JocmymUTq9Sso3NZsEAqa+j/wE8IfaaKQtMAYWVnYIDoGl/FcGaQcAWoYn2qXDuIGuf
	1QMZ+SRB29MCg22ZtCRxmD7iSLhksqkRbkQWSC02n1xw5bgeZOrru4ykfbkofZDC2fsUVRE=
X-Received: by 2002:a05:6000:2385:b0:497:9e2a:b1e with SMTP id ffacd0b85a97d-4abb36787a4mr37263053f8f.9.1795612179580;
        Wed, 25 Nov 2026 05:09:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm35240355f8f.2.2026.11.25.05.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:09:39 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 14:09:31 +0100
Subject: [PATCH 04/11] media: iris: vdec: reconfigure the decoder on START
 after a source change
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
Message-Id: <20261125-topic-iris-decoder-drc-fixes-v1-4-58b9f6b3fe86@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5363;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=BQVsChRVKEsJHf555U+Pt2d3yuSUpYK6rZfR2Io/x8U=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBt4M0rmGalmZwbvcuBax3f7Sn+I5qKyFHbxoUCKq
 f85qjVqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbeDAAKCRB33NvayMhJ0aRaD/
 4sS8XwmgW1nY7NeT9lwRAmWJTGVRDqqmoFzKzJxsK5+ubCT3REyeTYgMWT9weJF4TwAJt8kqAVWAHF
 3N6LbMogWbeKWPwByCxFx0/Ah5YWUENjAaj3ApWHE9LjBr3mkLy5eyIVlnL22pGfJSGLiEhI6gtmkw
 aqoOMnrazNALDNrhpeF96+/CuuU8es6FOXzTWZ0IIOhaam2y3f7cCpz6FfHt9tWi6j+5s1UA6Ncrnx
 wPVR3J7gxCPrFvWfKhPyA2O16BbWST1oYjGWVmk9KjrOM2IJxFlaygU1KzspFXnCrsG0U1FrKQnM0Q
 ZG6KMJ2Co9XurxqhtEOzDH7FRF4uTKzA/LkbOBA/FrHCmljNRcz0A8fW0HlwlB3ntBkU2E3NVsBqvM
 4jB5raNFvAiQZ20sbX+HkNXb2aSCEEZD/rgBkGZrHZ01KrPum3IDowCGiaDO3ohtJDW38uY4DeEaB5
 qs+d3gsTjFoBGZFjfVZ6Kq+6X+OmgXwq5YzZr0DLsPkTBAPyu/P83f4nyCMTBmk8Gq405L9zzqLjOy
 NMLF5QNxusJPNp8eX3olguZmHcAU6txRCeECKATzk6a+hadnnlunZYnxs5siuQx/ZPNxFDb30HQNTQ
 /32NPRKyAGKsr5kc3NZEA1d/hN/XvseRBbk/T/liz985lG2winYrE0YsbSmw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The specification lets the client complete a source change with
V4L2_DEC_CMD_START when the allocated CAPTURE buffers fit the new format.
iris_vdec_start_cmd() then only resumes the firmware ports, without the
configuration STREAMON(CAPTURE) sends for the new stream, and the
decoder:

- writes the following frames with the stride and scanline of the
  previous resolution;
- fails to resume with HFI_ERROR_INSUFFICIENT_RESOURCES when the input
  internal buffers are too small for the new resolution, and the instance
  goes to the error state.

Before resuming, send the CAPTURE port configuration, reallocate the input
internal buffers, set stage and pipe, and add DPB buffers of the new size
up to the minimum count of the new stream. The attached DPB buffers are
kept: the firmware fails to release them while the CAPTURE port is
paused.

Fixes: 84e17adae3e3 ("media: iris: add support for dynamic resolution change")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 37 ++++++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h |  1 +
 drivers/media/platform/qcom/iris/iris_vdec.c   | 29 ++++++++++++++++++++
 3 files changed, 67 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 178e50eadcf7..38bdf366b384 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -747,6 +747,43 @@ static int iris_release_input_internal_buffers(struct iris_inst *inst)
 	return 0;
 }
 
+/*
+ * Buffers the firmware holds are kept: it fails to release them while the
+ * CAPTURE port is paused. Only buffers of the new size count for the minimum.
+ */
+int iris_alloc_and_queue_additional_output_int_bufs(struct iris_inst *inst)
+{
+	u32 internal_buffer_count, i, count, fit;
+	const u32 *internal_buf_type;
+	struct iris_buffers *buffers;
+	struct iris_buffer *buf;
+	int ret;
+
+	iris_get_int_buf_tbl(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+			     &internal_buf_type, &internal_buffer_count);
+
+	for (i = 0; i < internal_buffer_count; i++) {
+		buffers = &inst->buffers[internal_buf_type[i]];
+		iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+
+		count = 0;
+		fit = 0;
+		list_for_each_entry(buf, &buffers->list, list) {
+			count++;
+			if (buf->buffer_size >= buffers->size)
+				fit++;
+		}
+
+		for (; fit < buffers->min_count; fit++, count++) {
+			ret = iris_create_internal_buffer(inst, internal_buf_type[i], count);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return iris_queue_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+}
+
 int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst, enum iris_buffer_type buffer_type)
 {
 	struct iris_buffers *buffers = &inst->buffers[buffer_type];
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index a8d2002e00ee..7cf69046f036 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -117,6 +117,7 @@ int iris_destroy_all_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst, enum iris_buffer_type buf_type);
 int iris_alloc_and_queue_input_int_bufs(struct iris_inst *inst);
+int iris_alloc_and_queue_additional_output_int_bufs(struct iris_inst *inst);
 int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf);
 int iris_queue_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type buf_type);
 int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf);
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 656e69d2c942..d35a1eb62d30 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -495,6 +495,31 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 	return iris_queue_buffer(inst, buf);
 }
 
+/* Configure the firmware for the new stream, as on STREAMON(CAPTURE) */
+static int iris_vdec_drc_reconfigure(struct iris_inst *inst)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	int ret;
+
+	ret = hfi_ops->session_set_config_params(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (ret)
+		return ret;
+
+	ret = iris_alloc_and_queue_input_int_bufs(inst);
+	if (ret)
+		return ret;
+
+	ret = iris_set_stage(inst, STAGE);
+	if (ret)
+		return ret;
+
+	ret = iris_set_pipe(inst, PIPE);
+	if (ret)
+		return ret;
+
+	return iris_alloc_and_queue_additional_output_int_bufs(inst);
+}
+
 int iris_vdec_start_cmd(struct iris_inst *inst)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
@@ -506,6 +531,10 @@ int iris_vdec_start_cmd(struct iris_inst *inst)
 
 	if (inst->sub_state & IRIS_INST_SUB_DRC &&
 	    inst->sub_state & IRIS_INST_SUB_DRC_LAST) {
+		ret = iris_vdec_drc_reconfigure(inst);
+		if (ret)
+			return ret;
+
 		vb2_clear_last_buffer_dequeued(dst_vq);
 		clear_sub_state = IRIS_INST_SUB_DRC | IRIS_INST_SUB_DRC_LAST;
 

-- 
2.34.1

