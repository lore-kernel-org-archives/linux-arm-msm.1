Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612186;
	b=D8Q2ztiuP4G3sh45qOcE9XIGmADsDbQQAb9PA/AVtH+VStGjB6YoYCy7e3QcWtmgWbj/
	 7Tpt+qOKzpTzow4C0ruasjhafOcFVGV1gjA/a7V4L14RyoPYiM3rVJcwSsMIm4Wcjb3C3
	 0AP9JE/u4XD4uoaA17CxLvtIlCsf6a5QVhRZW0+76h301aWr9N89D3kGT9fKRrp4IMQqF
	 CoxbrGqsI1m8C6zoGZ2PneBM7DKFYLSyohDBYoKbYjN4ac/bUMnKxLHQ6qLQYHpuwYVGV
	 wL4UfDzTQlATLLzdgIX8LUBJuJuOn7yMn4qu/Gj4sbGkzglGTDx0lG2M6+vRw/HaDGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Tbq3WArIKfshci62hPLXBd6m9hDUDlRFQ7rBlDH7S9g=;
	b=wr5gujCRkNQh130XgMAerUTEW6zJAGpxQkaFCsNfCtMFM7jNfUdntmdmj+mariv0dAXj
	 n/H4njvvll7tQxauWEd2nwsajkdSLWnLH4BqoVAid5n/cCrJ1Hd0ynN4AvZbJakoftw7x
	 yAJFQQ/RNsbNUcbbKaLmqfAaBTGboDLUH6PtqHub9H4zKxtruI/0c5jUdWiRLS0QeZVLC
	 0XZ/UJ5YRlAvclahBJuhFpQEP8lHp7xVOcsK6M4/gW2tRdTCPtUcuykkDVWwmiITg5dzM
	 Kb7rE8iE8Dsh+T474r3/+ACT6D/nkpXi6aeBN/Uv6LXGfGDkVbR6jtPhBuMUR+HL2IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eW32hupK;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8D8606A687
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B8D8606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eW32hupK
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so4441013f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795612185; x=1796216985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tbq3WArIKfshci62hPLXBd6m9hDUDlRFQ7rBlDH7S9g=;
        b=eW32hupKCdsxdS9qiRfXt8Mx8t+jXTwM1HVS1XKXBrr0sZ2GVqOs5NrZnlyHATrIZb
         brqiWcj2erewxmMGn2pBRz+tp4593jq5R3fPl+r1DeR1b7jpNNRVWWhHsTAgxaaZSXmm
         HsxQITQpCCIRm0najVXKNpQPOgMplIDzKF/gkq+SNtUBy4aWgVFfFzimQzswjMPeih5F
         4bFiYeXVnP7FpLG87E8UtWj4fRrMpel4j4FpuyHXS0uxIguWrrMo4zRPdEkCEEMwYdyO
         Q70jEYOWeTvVEKLlf0XxV1OxeyIBSZ7b3IL+Lmshdga1UJIoVpD6vjHba732S6nKQ2J7
         pUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612185; x=1796216985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tbq3WArIKfshci62hPLXBd6m9hDUDlRFQ7rBlDH7S9g=;
        b=oPT28PhLc3yrYxLi+m2nYDmlKH95x+4n8bf3wmQ9ZKuMeDP5T8SCAx1Tu13IvWUvOh
         +pjlqpM8Pp8uTtnWQ7pDaBTiHv55i2qrZndai5MXU0fbv5sSRnSUkSVcw6D8X2MFp8wx
         UXzrdCesLiUPhSxVA5cysl6ACPzuKpvgTa7e9fA6gJuW5+otGLPOeGgijUTkxjHdMKhq
         hoPRJX22s4q52ac2iMNfo/FUGdp04mbb/fT18b0vR31VwIHbFFNFPjxbd5IxtCEOgBUv
         O315l9QHbQYjMFOJwqvmRLbhxMyg5D9sm44lbreA4hbIwiZ0Kk+sBtugqOsO8nHdRF7L
         LYEw==
X-Forwarded-Encrypted: i=1; AL+hErEKF4gm3TWVdkgdJUc7nJL0qdTj6sJVHqto7pZS7af0CkmMqqf1S3Q+auseINW0rUTlvVnYXXYuWZLlbEgq@vger.kernel.org
X-Gm-Message-State: APuU4Z/sjddwKLHbyyCBCBEq7deVC04sCcTglljtrCcWl+K5A8S/buY+
	Bdm7KFPt1DaEUFrx1veYOi9YT03wnrqVRVu51IDCP4MsGLCfcdXaiepv/bjwQKggSls=
X-Gm-Gg: AZFdTZdbg7WDKwE5U+tKjdRiBbzndnnNZU3B7brZk3zJixg4qUBwqsoLV/6uBlP+5Q7
	QXNMgbhAp5aLBomMtsQio7x0w8YfI7ZBF0OZtWxl0beCN0iPH9/2hCTiywOLGj5rbOcTCYGSEKo
	Pu9aYnbjNDH62I1iYK0l14bQvWXsPCJzekIq6lNR9hNK6okpS9/QiRATkJ0ghP1jW2za8QpX7n+
	XvB5eqGNOh7bjrdcXiyxr04brDXRFUvZ+prxlWeJExfTlu/fYM2afaBkywYjEjukw5eIA9HSMpa
	0gucyCSeNezSYwIJGTBeXHmIwNuwmkjh9OGeWBLmCjyBLiLDd0WTjh7Ar3KKSq8aAY3joKpJ6M9
	u1n2cfTFh2U5C+AZSCgAFF2ErnOa1xnUcNGtMDMiqNhPIZyzxyqJ1w682qiBmAVvipmsu3yGNU3
	zJ5chAN7qNEtLLmT23LdVhc3PKZow2yMriB6DcNhGDK354VsW3PHYWoWP4A0l1+I0KOmevoLC5V
	dZL9TyF70f1gROAFJ/O4GkXQuDOYysfsd9BtwiAWsAIaoo7L4xUNcKTpTnQ9fXSnaD+9hiiAsmU
	Gcf9KCtvigbI1u8DLhaF6rx+z7MGu1tSjZgRc5saO7YpA4sMOQ==
X-Received: by 2002:a05:6000:288c:b0:4b4:2ce4:6dc1 with SMTP id ffacd0b85a97d-4b42ce46e7cmr16774660f8f.44.1795612184622;
        Wed, 25 Nov 2026 05:09:44 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm35240355f8f.2.2026.11.25.05.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:09:44 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 14:09:38 +0100
Subject: [PATCH 11/11] media: iris: record the LAST buffer returned with an
 error
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
Message-Id: <20261125-topic-iris-decoder-drc-fixes-v1-11-58b9f6b3fe86@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1445;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=fpGCW1w6dJjhk8t6QuHx8IDTWoFL99bE+EV2naxWqHI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBt4PULAdNJCktlHUSosC8YCjaC6SZvkTGl6mH6KL
 wW8B1I2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbeDwAKCRB33NvayMhJ0ZstEA
 DEIz3NUZ/hgsVctmVX2LgyCkOUFHaQW4KPS/Q+AocRwkK4ypqI1NzYP+EZrILd1f3MfWCOZzfcUgHq
 Gp6pEr6yKFQBCQvQdfchV0G14tiz/+G27ud4amwXPu+f0+F2MHvm8llG15OGSpn/fKwHF5P26lEGPx
 6fd8BFReoK/BG0sgv1AzW+peKUvdHsS6dBkZAgJjZcrOr5XrRPZmco4NS1kGN0EwrdyOoZ2j7i1jQn
 yUT0X2ouyQBNTyGGwza+468jCWX/NjYBKBy2VDAK8nVhjJ4b1hIC4wCE9z6lBA2g1duMnOXlzTw/BP
 ISG6B46OxotDGc3imoRtd59RpwMH84uKNQPv4nVUkmNG4QYK7lEjWizhVdWQ8yejKy+w35GIf7hotJ
 Alq2/ThKBj5W18nduzWm15dzs4lnXvXOzXbOAmQ8sl7S+iYO3xN4XYblMu41Quz1CEItd3bqedNCLy
 xPin6YJKdTKAty0YUg0qUwAJgWjesxghO9Qw17RHmvaL3BB/Gdns655fXAJYJ77zJ9pz62zWAr/W2X
 t+oN1i/mtuwYZtyYYcbI57O3O4EmaFGVb0r0ouZwp5EH0l0Wgr0OHIyIA2MuXWqwdoT/FY2t3lzLem
 196vC3GHvkbOqFDh0QvvCuqQQCFKgam8StvV3R0Hh6ut8x3kt0bq/tji80ug==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The empty buffer that ends a drain or a source change can come with
V4L2_BUF_FLAG_ERROR, e.g. from the frame information of a frame flushed
by a seek. iris_vb2_buffer_done() returns it without setting
inst->last_buffer_dequeued, nor signalling the end of a drain.

A client following the specification may queue its CAPTURE buffers again
before V4L2_DEC_CMD_START. iris_vb2_buf_queue() then returns one of them
as a second LAST buffer, as none was recorded for the pending source
change.

Record the LAST buffer whatever its state.

Fixes: b791dcfcba3a ("media: iris: Add handling for corrupt and drop frames")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 38bdf366b384..b9ec8d0cce83 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -951,6 +951,10 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 	vbuf->flags |= buf->flags;
 
 	if (buf->flags & V4L2_BUF_FLAG_ERROR) {
+		if (vbuf->flags & V4L2_BUF_FLAG_LAST) {
+			iris_vb2_signal_eos(inst);
+			inst->last_buffer_dequeued = true;
+		}
 		state = VB2_BUF_STATE_ERROR;
 		vb2_set_plane_payload(vb2, 0, 0);
 		vb2->timestamp = 0;

-- 
2.34.1

