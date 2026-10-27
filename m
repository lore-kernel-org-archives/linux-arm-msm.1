Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793067582;
	b=Qe/KtwxtJl963jMJ/JFGr4CjOZt1Slq4R2ULFeO2K1eQh2ieJImbFq041OUO5YIiwot8
	 R56RdiCxLHZBmUe6MJg9Ub1YfSZJxmycaDgHxrxc9Jjxhf7fw8aS6HiCAktvE7UqZJQEl
	 S8ivFdPzUmxXZssC+Epj41MQw8GR3ZE1NqdwjdKf7Wo4hSc1eYAIDAh2up0ggFt1qEtX3
	 xByH1LhXL6cefcrNIv5StFcjdpE/35ty2I4T9t+HCELAh9obxko2D8qV+hKCjXbPluFcs
	 IakhjW5h0POrnV0FurbtL/alsw/MMCPTaFFVJhxmhTV4fOkM/Xi976xoQ2MNjMFUMAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793067582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8sPZW7BtjLgIfMNQPd2G87W+N+MdCTWgP1ukE8s6uFQ=;
	b=Tla/kYDQq9cjwDQ2+MrmK7MqxUQSbiN4mccjzeSrJFu7TLxk1z8MQBxOeKQDPaMH6KSq
	 qIgZmfRg951mEN/sAkQVZEOhwdMyItywjKlNKGA4bisJeqbJulWmGFQYUj6pMNnTEa7ni
	 J7JTyOKF/Dk7KR5qCEtlx70tEUDZNE9KWj3WuLMvOcEUec2oKnok6KvxWnmADS4fE2wxl
	 HTIpBBmYP4w0E80VOfQ1RbwXEU66akggiFuHTQ7C4OAE3d+ARsKdc5ZccfbMpbu3BHvqx
	 bpUt5/5/T13khutTc++5kuAVMRm+GDJLrQDcampAo7or37tBNXVwtI+DbbLz6CsVvNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Nl3RMrvG;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC59606A32F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 02:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DC59606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Nl3RMrvG
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8871ada1a26so25412037b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 19:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793067581; x=1793672381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8sPZW7BtjLgIfMNQPd2G87W+N+MdCTWgP1ukE8s6uFQ=;
        b=Nl3RMrvGrd70mj1q49iHuIq7nD3Q/0BwiIEstw7zlVxq1Wu6bNG/3Mw5J55VrsVKmk
         ykjvUsA77JFdAWkZUkNVD6/7k7JJ2Dv6lQLSJkilS4ASgQR6keNuiwy1V+ObZ6AjP9h5
         sgUHZS2B6K1exF0R9alf8sxBMoEZ3+6ctFIYZojl+iF/EDIyxoXLiNNL0i5L6WK0Gx+s
         nBu0UzJv872pi7OuxvwHIHCJDJt59/yjxoXK3pWJTDV+aTzKvQUnWvBnJlvqbTj8EskV
         68Sdvazpv0aPR4SVoxzKitCPy4QVb5IXRr98kcUczQkePL5ah6HakDhuXs9JuKp3pV1I
         5efA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793067581; x=1793672381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8sPZW7BtjLgIfMNQPd2G87W+N+MdCTWgP1ukE8s6uFQ=;
        b=DHIlOjvSnXuKwdhbSVfBU0NA0wPkqlWkFkdciHyi6y4GAgr5Xr1FJl4yvWezoXtVTh
         9Q8+EiF9IcQMxdMN47pJYZi68r5GBSYqciT5lmTp0iKZCqn9dGYZ+1gG2PhwiK5ORjNA
         15I+NOe6V3nZ766dZFWean/A8i4T7tpXN1rQaIZvJU1sIrmjBfsYmaZxTuGnAyzKe6QW
         y54PAMJDZka36Z2pR7feae83RdxLgG0z0cDnt+D0vYh4Vo6d7hbhaEiLzwN1sV0THkHO
         5NpCmHLeYPAiQhvJj45tdi+hvWYPDG8I6fL+vQiO0CP/yBAjv2K505Zd8Abs6j4SJ7JK
         izDA==
X-Forwarded-Encrypted: i=1; AKwUvBzHkIP02iuQa4TZPvK5t3c7VPWH6QgGy8rtRIkzjhmi/vy/QDM36ttsJ4GQUvSA6FDu9ZEfsMukpyDYtFLD@vger.kernel.org
X-Gm-Message-State: AFq9FYK2BkJMeiteJVn7UHONOrRhvQ41VtmDvhdZDxlsv4K/6dZK4Yhc
	Axea0HT9ASbQLsjJ6PeScncm/FaFSseNhS9Z0ajl/v5lO98u+edWWU0A
X-Gm-Gg: AYBFou0p4pVajOAEfHV6DmetKnkae/5Ol6NoT8vAhzfNipFwRNKvs/jsQzoFf6lYDkq
	+R+YesEwqF77EdD9L3F5d6K2reXxGnIQShpqeXY+cYG3KZHlHiYxw7gzMyxQX53bN+SqGFXissY
	Qg5Xn2xDdqGX6fXdQvplafYn78uLZq+79+ClhTvjVZHvpXJbAjObVW+Gen01ALjX6doSZOYVesw
	MGeNgc5J3iSr6OxpHHC8fnsV401qKg8EmWHHVKywng/XnRK+SBRzE3fqkAh15HEGGRN1iw0iuwd
	HXjszlJA0ZuueIgkX/Yuwiuitud/QTk8pY+aMshp6hve0gRr0kCbxUsjZWxOI+OqbmH03FNjNDS
	rvzNXM3cgPWBubSm+RZreAGDigzlFkkORqpYRrkYrw4i5k0bLNJKXVoolDAuyu1BMQMWvwv0Abe
	Jj0ESXWIFUDycS32Qon6v5Cphb5jFbCzNp+VHeTy/dZNiF7m7oJQvuMj0bi8fihLqUZ8gu+Z6Fj
	0CFS1/eY8eL6prVwHvlEm0Lhwzna6bUJDEuNBypIb3FZA4eG0upXmhZUIUe7pstU/ePgDizq57m
	pknDzvBGPUa4Lm4CqpLRx67AaWYkVefZ
X-Received: by 2002:a05:690c:c354:b0:8b0:d421:e024 with SMTP id 00721157ae682-8b166be0d33mr40575747b3.44.1793067580715;
        Mon, 26 Oct 2026 19:19:40 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a4626fb03sm4215129d50.17.2026.10.26.19.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:19:40 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Birk Skyum <birk.skyum@pm.me>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH 4/5] media: iris: Let a resolution change drain before stopping CAPTURE
Date: Mon, 26 Oct 2026 21:19:33 -0500
Message-ID: <20261027021934.22113-5-ccortner@gmail.com>
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

The stateful decoder interface lets a client abort the implicit drain of
a dynamic resolution change by stopping the CAPTURE queue, and ffmpeg's
h264_v4l2m2m decoder does so about 10 us after it dequeues the source
change event. If the stop reaches the firmware before the firmware has
reported the end of the drain (HFI_BUF_FW_FLAG_PSC_LAST), the firmware
returns all capture buffers without that flag and
IRIS_INST_SUB_DRC_LAST is never set. At the next
VIDIOC_STREAMON(CAPTURE), iris_process_streamon_output() then finds no
completed resolution change and resumes the firmware without
reallocating the internal input buffers. The firmware still returns the
PSC_LAST buffer it owes, 1.3 ms later in our trace,
iris_inst_sub_state_change_drc_last() rejects it because the input is no
longer paused, and the instance goes to IRIS_INST_ERROR: no buffer is
returned after that, and the client waits forever. Completing the
resolution change at that STREAMON instead, by reallocating the internal
buffers before resuming the firmware, did not help: the firmware then
returned nothing at all.

Wait in iris_vb2_stop_streaming(), for at most 500 ms, until the
firmware has completed the drain of a pending resolution change before
stopping CAPTURE. The client's STREAMON then takes the normal resolution
change path. The wait queue is woken wherever IRIS_INST_SUB_DRC_LAST is
set, for both HFI generations; gen1 sets it in the same event handler
that sets IRIS_INST_SUB_DRC, so there the wait ends at once.

Fixes: 84e17adae3e3 ("media: iris: add support for dynamic resolution change")
Assisted-by: LLM sparse smatch
---
Reference only, not for merging (no Signed-off-by); see the cover
letter.

 .../media/platform/qcom/iris/iris_instance.h  |  3 +++
 drivers/media/platform/qcom/iris/iris_state.c |  8 +++++++-
 drivers/media/platform/qcom/iris/iris_vb2.c   | 19 +++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vidc.c  |  1 +
 4 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 771269e705d9..1013ed2911a1 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -7,6 +7,7 @@
 #define __IRIS_INSTANCE_H__
 
 #include <linux/kref.h>
+#include <linux/wait.h>
 
 #include <media/v4l2-ctrls.h>
 
@@ -56,6 +57,7 @@ struct iris_hfi_session_ops;
  * @metadata_idx: index for metadata buffer
  * @codec: codec type
  * @last_buffer_dequeued: a flag to indicate that last buffer is sent by driver
+ * @drc_wq: woken when IRIS_INST_SUB_DRC_LAST is set
  * @last_buf_ns: start time of received input buffer for current one second FPS window
  * @frame_counter: input buffer counter for current one second FPS window
  * @frame_rate: frame rate of current instance
@@ -104,6 +106,7 @@ struct iris_inst {
 	u32				metadata_idx;
 	u32				codec;
 	bool				last_buffer_dequeued;
+	wait_queue_head_t		drc_wq;
 	u64				last_buf_ns;
 	u32				frame_counter;
 	u32				frame_rate;
diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index 5552725c614e..dd8e0093b972 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -209,6 +209,7 @@ int iris_inst_sub_state_change_drain_last(struct iris_inst *inst)
 int iris_inst_sub_state_change_drc_last(struct iris_inst *inst)
 {
 	enum iris_inst_sub_state set_sub_state;
+	int ret;
 
 	if (inst->sub_state & IRIS_INST_SUB_DRC_LAST)
 		return -EINVAL;
@@ -222,7 +223,12 @@ int iris_inst_sub_state_change_drc_last(struct iris_inst *inst)
 
 	set_sub_state = IRIS_INST_SUB_DRC_LAST | IRIS_INST_SUB_OUTPUT_PAUSE;
 
-	return iris_inst_change_sub_state(inst, 0, set_sub_state);
+	ret = iris_inst_change_sub_state(inst, 0, set_sub_state);
+	/* a CAPTURE STREAMOFF may be waiting, see iris_vb2_stop_streaming() */
+	if (!ret)
+		wake_up_all(&inst->drc_wq);
+
+	return ret;
 }
 
 int iris_inst_sub_state_change_pause(struct iris_inst *inst, u32 plane)
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index b820b3e43910..bc2f201fea0e 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -228,6 +228,15 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 	return ret;
 }
 
+/* a source change whose drain the firmware has not completed yet */
+static bool iris_drc_draining(struct iris_inst *inst)
+{
+	enum iris_inst_sub_state sub_state = READ_ONCE(inst->sub_state);
+
+	return sub_state & IRIS_INST_SUB_DRC &&
+	       !(sub_state & IRIS_INST_SUB_DRC_LAST);
+}
+
 void iris_vb2_stop_streaming(struct vb2_queue *q)
 {
 	struct iris_inst *inst;
@@ -238,6 +247,16 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
 	if (V4L2_TYPE_IS_CAPTURE(q->type) && inst->state == IRIS_INST_INIT)
 		return;
 
+	/*
+	 * A client may abort the drain of a resolution change by stopping
+	 * CAPTURE, but if the stop reaches the firmware before the drain is
+	 * complete, the resolution change can never finish and decoding
+	 * stalls after the next STREAMON. Let the drain complete first.
+	 */
+	if (V4L2_TYPE_IS_CAPTURE(q->type) && inst->domain == DECODER)
+		wait_event_timeout(inst->drc_wq, !iris_drc_draining(inst),
+				   msecs_to_jiffies(500));
+
 	mutex_lock(&inst->lock);
 
 	if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 05aab6e3005d..0df0a5915e16 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -201,6 +201,7 @@ int iris_open(struct file *filp)
 	INIT_LIST_HEAD(&inst->buffers[BUF_PARTIAL].list);
 	init_completion(&inst->completion);
 	init_completion(&inst->flush_completion);
+	init_waitqueue_head(&inst->drc_wq);
 
 	iris_v4l2_fh_init(inst, filp);
 
-- 
2.56.0

