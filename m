Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267734;
	b=nuxOKDtgi9pmWDXhACs9kK63EZDScbLsYss7SK2wG/kyIlu1Pw9uL0wt+OvOcZfw0Xv+
	 PQEj9Kv0JOO7MpQKe8EI6k9+ZtMLxPl7gbCdeE96yhaiCpmbb9x1eq/GTKPM6pLSL2kRd
	 4OnCUssOhawSJIx63D7CNspSnURVmxtlhtDPBbw29xLc9fjOeUSwjtjze9RnpyjYMXxxw
	 RB3B414MhNPNlqK/+DyEaQo6Zs8jvlpWlJlh0DHV6iXufeBGMemTwzBtpq9Lfqr4b24Oe
	 gu6rEJ5ihCQgiEd42lkzY8l3snj5gmHSkCyKbbgadTTYAfOU815+m5zY2B4FhuE0tPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=yNxEyWKc+R4VLP5s9P4J22F9yK4hSBR4X99FbRTlsDE=;
	b=5tFVe7pKRyfsaNE+FLifiWMx6XKz09sXcml8uBVivvGxO/xKln0Eywhbdi7mJue3CfzP
	 s4ZMJkOLarzjgNiTnzTEBl6Ka1Zp28Rn/ks1pD6VOQxEfbrapCxrFcShe3BfIgOv6MjKP
	 Yh1jkP/aLokG6HWsAqgPbdw81QPMgv7BqcR+7100+uRIwQO0aiyXpcvId7KXtQyaoUTmA
	 GskSx5xN08IYfMe5f81laASI/+h+7JZuYyhDl0sESpd9CO12LD9kxGQhsf/V8Wv0iOUL2
	 MkPZ5VzJRDkwDg2poMEzl9Vn2y12T+aieFAKXURICV3AXRMngZhqSolvJdCHT4OFkZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YkqG5JES;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B2E60A2637
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97B2E60A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YkqG5JES
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so2772515e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 02:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267732; x=1793872532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yNxEyWKc+R4VLP5s9P4J22F9yK4hSBR4X99FbRTlsDE=;
        b=YkqG5JESY+ZyTYZFuAYU8DT54YRAQ2L7KMrEKDZGV1u4QzJFYzz8lL3q0ABqMTwh3Z
         +ZDHxFwJgpVEb5hMje9YVT2OfmxCoK6ehR6onQCsF5uS18jmi+bZpgg6PPoDL07Nps2k
         iul6cWvdavPG51aPj0vM30t36yl+PeKa5zUEKdZjC8rWejcUHFEzIHujKIYginXSVtjg
         Fks3WASElBK6eULLvGYM29qwLQwg9rnfROAXtqhfXzOhD/rimjWB+fx7VcLG29NqChVK
         aagye4JYc8xkwi8fo/vsqK3o3bRaaJMXGWUQB1RrmUasAB/9yENkQWlw8R4dK7vXd87m
         IliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267732; x=1793872532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yNxEyWKc+R4VLP5s9P4J22F9yK4hSBR4X99FbRTlsDE=;
        b=ugkf49YwtEKncjHo/nwzveiH+txrlP6KEi8xYViox/Kl06YW1TN+qrVghmUzHgYtDe
         4b2Jqs0YOQBL3XV8Qf/HBwoAE7WAuUTEUt8mRzJW0MtY2hn+2O0PLMXyUq9Mvo+cGSFx
         XqxRXt+/RZTHT8NDdS3z9nMKCmYz3awxRnPVsgsdmqhPRqiVl0JHegWqOr9IDSzOb+Q+
         aDjJawhOeJbZBjYQG506k5pOtdO6t6laiLjqZfKXO+HFrl7zJ7aYHdLDXZCaHItp3q8e
         6++HcMg/Y3kgD04DZZE1kHd/L3O1v4S+kjSEmGrBD2ibeZPPkzSxhoz9SRcHN5VHhOAP
         trrg==
X-Forwarded-Encrypted: i=1; AKwUvByTrQAtkNQSJofV8bmnCJqQeqRoZN2htowLUJBItR4z7CsFshlGx6WEtdzEcfBEEeneM+lFwn6OpWC0NpA+@vger.kernel.org
X-Gm-Message-State: AFq9FYLj2wBN5TbYwHIfXK+E6EAK7hF1K1NjP3zuQ05utufOiYFmrDHn
	EpP7K9dJljisokhqbuTPHN1Ur87UgCq8H6lzD5CN9en8/NKXyLAcPNathqmvsJ53yjk=
X-Gm-Gg: AYBFou1AGsT8Vx8w1uj5P5nBgfyYcBQEt63H04ORodDT57ckOi4R++cp1+omezQC9d5
	VUQ9cZ/b7xrEJ6cnUVWJ8KDqUQrPLhz+OHJVe5SgaK2bmLYpggCi6H/ZcGD+Cedy1AXyz0tShaQ
	5Dh9FakEbo3kcT5wtaElGNRkHR9gUtuPwyOdgM6V54qzXK+4aOFxBlWbTP1oN53wc2NUEkZwp5d
	oAOykYojZiGpnTdy3puN4+Yw2QJhM8RlJC9Jds4GSfiWZiPmYZl/K6t1KF4f+WuROfe1nOaYf5C
	4Oy34b4sSExUkxTIDxFYGB5SGBlLLdzdozU5+eQ+S5E+fZxFrZ+T7pedRl1RVrNq/q/4La4qnnh
	a52UXPzg0lqlUvX0r4vE22jNpnrvkykBRH3b+gWnq7L18eYFoJ0QLP/U0YbCqGMvLackI051oXN
	3nGCy5wNv5eWZXo9FxjXXnfrlxZHEnK0EWS/nss0ODfR8ocLHcWKRuQ/Om2/s99sMpjj1H6nCtM
	/AbLIalWfu/2lk6InXkGMwiU5KWucohlxQfHW9F+Czs1kFzn7aC0ott9zDrBWCMgwr596iNIKSu
	40EpGaWnG9R572NpN6g=
X-Received: by 2002:a05:600c:560b:b0:4a1:e04f:15c7 with SMTP id 5b1f17b1804b1-4aa8a1e908dmr36079575e9.5.1793267731849;
        Thu, 29 Oct 2026 02:55:31 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:31 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Thu, 29 Oct 2026 09:55:13 +0000
Subject: [PATCH 04/14] media: qcom: camss: Introduce EOF sequence tracking
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
Message-Id: <20261029-v4l2-frame-sync-v1-4-d37992559c58@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5319; i=bod@kernel.org;
 h=from:subject:message-id; bh=zyXYUcMToDNC/JpUQ8ditIJsrso8lEHyWxHeVo1kRE8=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgKNGGGVTPSITk19XkTcF2RgMrrN/ySkHecK
 nzRPKTchBqJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYCgAKCRAicTuzoY3I
 OoJoD/9i8WhxD/ivSijLHU7INwI8Z6eqwlpwFzLYPVMWkr5M5j5UeFv4+VY8KlSwgQny1SktXj2
 PEwexAhmtKJ+NXXuHity0linaaB4hf1P7wkZhuklYDfBriRLQJVHCBZdftqrMpTW29pvxONh3RD
 AUxz73wwIdqzsjgwQMHM9UZpApv9y7jhZ/wqHto6dDMSm1Ey4ZoCPpBGIhyKHmGrGY5i/VzTdTF
 v9xtcM447kv+9JVO4sn8fQApTFiiP9vC3MVEmAwEjy3kFSMs9UX3pHpK4nwM9ISkwkv+45nJufh
 pjHfXOgK7EVgSWra+pKQcR+ztEU+aea1kM8SpWcEslHyEf9rEuRLTAdqRGkkru3yBoKt2lxteAI
 u+AJCxMY3z6AzEj8ZWE+kX9sCJ5MA9wmnjc6upgGOj+bE7e5g1ecWZaIwrcRa7JcEHM6hqXhcrr
 lV4+hDhrK2c1c0kEo6YT0w0QynLwq5/V86vtAEn+P36QFnAoz/Wh/QHKrdbcKvuEHT/4W1M8dA1
 17cRwFQnBaJ1TYT9RRothCYSPUBGwuaIz3m8W9nAzVL53vbx8CBx5VHcuf6CjB853ZRfZnxPgCl
 OOZyjER1ZzGtxlyRIhaEi7CNWxJj3GGkfbKpMbtJwmQzA5Xp2iiSP7zh64wwTuKIPkCaVbGUp5M
 b3Ao4NZdzlI6JnA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

We want to correlate statistics buffers with data-buffers. To do that we
will need to have a sequence number driven by the EOF signal.

In fact even without correlating params, stats and data the vb.sequence
should be based on EOF not just incrementing when a data-buffer arrives.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid.c    | 24 +++++++++++++++++++++--
 drivers/media/platform/qcom/camss/camss-csid.h    | 19 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe-17x.c |  5 ++++-
 drivers/media/platform/qcom/camss/camss-vfe.c     |  9 ++++++++-
 4 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 2f1426e77e87c..2564eeea01d73 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -779,9 +779,10 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	if (csid->phy.need_vc_update) {
-		for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
+		for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
 			atomic_set(&csid->sof_seq[i], 0);
-
+			atomic_set(&csid->eof_seq[i], -1);
+		}
 		csid->res->hw_ops->configure_stream(csid, enable);
 		csid->phy.need_vc_update = false;
 	}
@@ -1368,6 +1369,25 @@ void csid_sof_event(struct csid_device *csid, unsigned int id)
 		v4l2_event_queue(csid->subdev.devnode, &event);
 }
 
+void csid_eof_event(struct csid_device *csid, unsigned int id)
+{
+	atomic_fetch_inc(&csid->eof_seq[id]);
+}
+
+atomic_t *csid_get_eof_seq(struct media_pad *pad)
+{
+	struct csid_device *csid;
+
+	if (!pad || pad->index < MSM_CSID_PAD_FIRST_SRC)
+		return NULL;
+
+	csid = v4l2_get_subdevdata(media_entity_to_v4l2_subdev(pad->entity));
+	if (!csid->res->frame_sync_en)
+		return NULL;
+
+	return &csid->eof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
+}
+
 static const struct v4l2_subdev_core_ops csid_core_ops = {
 	.s_power = csid_set_power,
 	.subscribe_event = csid_subscribe_event,
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 2e48b08b93592..7abbb602805dd 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -170,6 +170,7 @@ struct csid_device {
 	const struct csid_subdev_resources *res;
 	atomic_t frame_sync_users[MSM_CSID_MAX_SRC_STREAMS];
 	atomic_t sof_seq[MSM_CSID_MAX_SRC_STREAMS];
+	atomic_t eof_seq[MSM_CSID_MAX_SRC_STREAMS];
 };
 
 struct camss_subdev_resources;
@@ -260,4 +261,22 @@ u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
  */
 void csid_sof_event(struct csid_device *csid, unsigned int id);
 
+/*
+ * csid_eof_event - Track EOF
+ * @csid: CSID device
+ * @id: CSID src-stream ID
+ *
+ *  Called from the CSID interrupt handler on EOF of the path driving the event.
+ */
+void csid_eof_event(struct csid_device *csid, unsigned int id);
+
+/*
+ * csid_get_eof_seq - Get a pointer to the EOF frame sequence variable.
+ * @pad: Remote pad of a consumer's sink pad
+ *
+ * Return the counter or NULL if @pad isn't a CSID or the CSID doesn't support
+ * EOF tracking.
+ */
+atomic_t *csid_get_eof_seq(struct media_pad *pad);
+
 #endif /* QC_MSM_CAMSS_CSID_H */
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index 62c2405359a06..bc791a56edbab 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -491,7 +491,10 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 	}
 
 	ready_buf->vb.vb2_buf.timestamp = ts;
-	ready_buf->vb.sequence = output->sequence++;
+	if (line->eof_seq)
+		ready_buf->vb.sequence = atomic_read(line->eof_seq);
+	else
+		ready_buf->vb.sequence = output->sequence++;
 
 	index = 0;
 	output->buf[0] = output->buf[1];
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765f..a4ecfb151242c 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -474,7 +474,10 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 	}
 
 	ready_buf->vb.vb2_buf.timestamp = ts;
-	ready_buf->vb.sequence = output->sequence++;
+	if (line->eof_seq)
+		ready_buf->vb.sequence = atomic_read(line->eof_seq);
+	else
+		ready_buf->vb.sequence = output->sequence++;
 
 	index = 0;
 	output->buf[0] = output->buf[1];
@@ -508,6 +511,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
 	struct vfe_output *output = &line->output;
 	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
 	struct media_pad *sensor_pad;
+	struct media_pad *csid_pad;
 	unsigned long flags;
 	unsigned int frame_skip = 0;
 	unsigned int i;
@@ -523,6 +527,9 @@ int vfe_enable_output_v2(struct vfe_line *line)
 			frame_skip = VFE_FRAME_DROP_VAL - 1;
 	}
 
+	csid_pad = media_pad_remote_pad_first(&line->pads[MSM_VFE_PAD_SINK]);
+	line->eof_seq = csid_get_eof_seq(csid_pad);
+
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
 	ops->reg_update_clear(vfe, line->id);

-- 
2.56.0

