Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793159021;
	b=DVTcz5p/f/Co/MXFX1tql/DPObhB26cZ0JqmYQ0EjMhqAD7hVkhd0JeshVJE0V3r4o1x
	 PyrGuNckthJCBVJ5FknaDC02ABkZhNYxGXSv5KqBEWo3DRx9VJ3wQHhkoedHsaZF0JK54
	 e156gnJFBK0ILqkHdnmqQNEOKnO6kZA0zgw/++tGVmy1NIAB9omA1kRQLPoHhDaSjJ8/N
	 8rsbAvaVsoef524fnEPiA0TGubw26fa17sJ8ebtzusfWRDXlx6cZfWKp1JeO8Z6jvvVtW
	 mR8bh73lE0sa7FhUg0qjhLF8PgupHd2atV+VEOfHJ2cSqpNZIqwoRoU1/4IoWSRdUcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793159021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NCfNFDiz5anKslE6LtWIXyi/+ISikbv6moJ2/L/2xxc=;
	b=cgH+7VXGpKidjolTyAjqopZB4vE8nX/toPzMzxNm9hgS7sLl9TRsJym0PZTVa/R8tr7l
	 YNHgYsK+9xeXimUElEqRo9iLD9bfkr89Xe8kdfEt1ExUD6tI+nXFoubnqN6Z7JJMplEVs
	 xYf43eSC/q1PEGBkpdU8SjA7epk1zXDrrW0VEfInjBi8m66p++Nx0ziuiBWymQKlASGY2
	 461Z0R2slHFvwea78IgWS1bjkCpV7ShYJMBP0Si/vL4Mh1nbbgfx7cAE723Q8ZRAUQfO7
	 nLlGCZHP4mlkb10KyI/sgtbPOoFCAiqiUnUAcfNlvzAaE3Zx4APIKuXyPgJxYcS1fAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wqvxGPWh;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480DF606A330
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 03:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 480DF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wqvxGPWh
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-917a64f28d0so19176876d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 20:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793159020; x=1793763820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NCfNFDiz5anKslE6LtWIXyi/+ISikbv6moJ2/L/2xxc=;
        b=wqvxGPWhyARyaD8Mng7Gb3wOuF8WnHch2DceFI7VAQTvlwdhKcLA6kLkgA1BzNUy2B
         PpSf1L+8u2srkfRpzdQMiVqrKyx7FHH8T/rqVIy9kIIyy0Rn2QkofLZ/HL8UuhHgjG0o
         4yHbl5e2GWyYiQY0JP8RDg3J45ytBUm8gFjTU36rVGFiqvLj9sERyyS7gZVoCekGeYS9
         V4ntUJt/io7lUEvn6UeIJNkQnEFZ/0Zqs764Y8LHLE8gjQ5Oq7UtRT0VcB4qAKbTSPMm
         Z20GtynY5oGmxQz+HnzxKe1J9R6bkB1dgTEzyGsp/Y8v8K8cYtaQD/T2fDRLFf0XqOqM
         6/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793159020; x=1793763820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NCfNFDiz5anKslE6LtWIXyi/+ISikbv6moJ2/L/2xxc=;
        b=ILyP8hXy6aOOMCOYvrdJRalVW3t0lQFjhETnbfW1v3G2H9vj1oih3IEMDarGGPpzQs
         oc/dM57aCYaf+y6PEXK2uOZdgLY+Yaxzxqh2F37RA4FoyEFRfSxlEAnbmXZ0oEXjy9zd
         07aie3Zlny2HQdf2tmTlhHrOOcYgRa/hXdEGObhBT6C48BqV7kJ8lYmyPtgkyHHFJRge
         Rx4DjVnM5Ifq3uOjv6yBD0OH+MgNIti7KPykLmfLxE6bFVv+O/8cUDrZGUGkGHjp7ro/
         76yNoY2i2mzOUb7bF5AvK0jdT8HrTDEwoNbMp1I6FOqSp7N8vzWeCH1vNP6TLSraEW1B
         7q9Q==
X-Forwarded-Encrypted: i=1; AKwUvByJskkWucL8vr3bHsLJVCZr863T+eRWzyKrl1ohnXHWCWLm7cXeUf00DbY4Ax4mnqSxS33h+/0dLDb1Zom2@vger.kernel.org
X-Gm-Message-State: AFq9FYLTftBf0yijFUFf6Lwas/UOCta/J+2Fnm+SptttE/KiZWtDHB5R
	Kvu6uZxvHD2psRZ5gXTkTsaG0MgVyYqITgMjW4NcVYiq2AblQzRp8NWX
X-Gm-Gg: AYBFou2/8rPxj3WsRfsYjeNjgH3RteKU/B+T9f1ZZKy+NQw219aqadB1YfmBCQYhLd2
	D4SrP+mQCekaoflOMlNpXkpSMKoYiNJCfba+aJLjMi39YkFSyAnwcsF/fRQ+aUReHl1t56/TN6A
	f8HVMsBA0CjayUesrsEqO0ZVMkbQFw7yoTTIAEBNrmeM4yFOCRHw5gDJBeNgWJvM6/s1m/jRPDc
	iIveihm8vdsdvzwKwARWF+2BiG+8sJv2o3F3rWx52RegfdG8Qgnmt2Maut44/DmRBMFcP9cXKnQ
	X0j/v4OBvgPyy7U7hq7V0uG9FGIQ9PC+tWjYfM5iLjd5YSh3tV73oqV5sQSSxcqTw15fTVguE+H
	Fnkqi2nnWlzfsOQShF8WDhFt79jOLUSrMzsfn4NVzj4h6pQojttJqMZuGtMxHOLRsrOudb7YqT0
	B7WD5QH/z28h5HNTLxzj3voZaNSUog2WbDprC4UO2SVHG7wvdlph1sCxmKESYqGDnyoEvYFbZyT
	L6Ib2nuhWGzXgwNafzAWSoOnSyeLbiPfcCTQ0Y0YunDTQiyIy8VrFm8ep5GT7igZ3sP8KUIpB80
	hb693KdOczS/HSOMKnK8kaOA5t1OPzQXPSA362ENVS/Dp2kZ2DFbmPW0i/VWzOgleGi118HV7OE
	KSfnyOQ==
X-Received: by 2002:a05:6214:2403:b0:914:cdbf:b6e with SMTP id 6a1803df08f44-91c819ed1c4mr3215366d6.22.1793159020236;
        Tue, 27 Oct 2026 20:43:40 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c755b557bsm29991026d6.20.2026.10.27.20.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 20:43:39 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Birk Skyum <birk.skyum@pm.me>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH v2 3/4] media: iris: Signal V4L2_EVENT_EOS only at the end of a drain
Date: Tue, 27 Oct 2026 22:43:34 -0500
Message-ID: <20261028034335.26075-4-ccortner@gmail.com>
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

V4L2_EVENT_EOS is queued, and the m2m context marked stopped, for every
LAST capture buffer, including the one that ends a source change. With
a stream that changes resolution, a client gets EOS at the change and
none at the end, and ffmpeg's h264_v4l2m2m stops decoding there.

Do both only when IRIS_INST_SUB_DRAIN_LAST is set, which both HFI
generations do before they return the LAST buffer of a drain. Use one
helper for iris_vb2_buffer_done() and iris_vb2_buf_queue().

Fixes: 84e17adae3e3 ("media: iris: add support for dynamic resolution change")
Cc: stable@vger.kernel.org
Assisted-by: LLM sparse smatch
---
 .../media/platform/qcom/iris/iris_buffer.c    | 26 ++++++++++++++-----
 .../media/platform/qcom/iris/iris_buffer.h    |  1 +
 drivers/media/platform/qcom/iris/iris_vb2.c   |  6 +----
 3 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index eb8de60c1177..178e50eadcf7 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -870,9 +870,26 @@ static void iris_get_ts_metadata(struct iris_inst *inst, u64 timestamp_ns,
 	vbuf->timecode = inst->tss[inst->metadata_idx].tc;
 }
 
-int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
+/*
+ * Queue V4L2_EVENT_EOS and mark the m2m context stopped, once, when a LAST
+ * capture buffer ends a drain. The LAST buffer of a source change does not
+ * end the stream.
+ */
+void iris_vb2_signal_eos(struct iris_inst *inst)
 {
+	static const struct v4l2_event eos = { .type = V4L2_EVENT_EOS };
 	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+
+	if (!(inst->sub_state & IRIS_INST_SUB_DRAIN_LAST) ||
+	    v4l2_m2m_has_stopped(m2m_ctx))
+		return;
+
+	v4l2_event_queue_fh(&inst->fh, &eos);
+	v4l2_m2m_mark_stopped(m2m_ctx);
+}
+
+int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
+{
 	struct vb2_v4l2_buffer *vbuf;
 	struct vb2_buffer *vb2;
 	u32 type, state;
@@ -913,12 +930,7 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 	}
 
 	if (vbuf->flags & V4L2_BUF_FLAG_LAST) {
-		if (!v4l2_m2m_has_stopped(m2m_ctx)) {
-			const struct v4l2_event ev = { .type = V4L2_EVENT_EOS };
-
-			v4l2_event_queue_fh(&inst->fh, &ev);
-			v4l2_m2m_mark_stopped(m2m_ctx);
-		}
+		iris_vb2_signal_eos(inst);
 		inst->last_buffer_dequeued = true;
 	}
 
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index ab8e5d953101..a8d2002e00ee 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -120,6 +120,7 @@ int iris_alloc_and_queue_input_int_bufs(struct iris_inst *inst);
 int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf);
 int iris_queue_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type buf_type);
 int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf);
+void iris_vb2_signal_eos(struct iris_inst *inst);
 void iris_vb2_queue_error(struct iris_inst *inst);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 8faf709c26c1..bb713da20605 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -290,7 +290,6 @@ int iris_vb2_buf_out_validate(struct vb2_buffer *vb)
 
 void iris_vb2_buf_queue(struct vb2_buffer *vb2)
 {
-	static const struct v4l2_event eos = { .type = V4L2_EVENT_EOS };
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb2);
 	struct v4l2_m2m_ctx *m2m_ctx;
 	struct iris_inst *inst;
@@ -324,10 +323,7 @@ void iris_vb2_buf_queue(struct vb2_buffer *vb2)
 			vbuf->field = V4L2_FIELD_NONE;
 			vb2_set_plane_payload(vb2, 0, 0);
 			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
-			if (!v4l2_m2m_has_stopped(m2m_ctx)) {
-				v4l2_event_queue_fh(&inst->fh, &eos);
-				v4l2_m2m_mark_stopped(m2m_ctx);
-			}
+			iris_vb2_signal_eos(inst);
 			inst->last_buffer_dequeued = true;
 			goto exit;
 		}
-- 
2.56.0

