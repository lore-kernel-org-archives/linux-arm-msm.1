Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793067580;
	b=WxZ2jYMJR2TmXJs6gAzpJP+sAdtFa7TPGKbp1O38Y3vdFQZZjFYq20HeON/cfGq6i2xO
	 nte7SEccnqcf/uuVOCT1yqVWY6awyBwDknrerzbSSJhgHRgljyJ7dAWHVtjQWUJMJEqWW
	 pku5Bf/GKyNj1UxNEMbiBLuLZktTVyZZ1Wm4jIJaG+xbU/HTrwea3In7cNphP47mV/GFv
	 +9hGn/ur+/bluDQa2O4ys1RD1ntl2WQQRW/YQX1yqjYVyYFs1AaXUEFb9ID2D4IyPgkBt
	 d7B/fxVfBujcRQceM5cjya7k7ixrGMQX8UDU60YVUs48kfvAeR1VlkGopxntrlZnuSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793067580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=02DoDBYXgSGZJPDz/u6weuFYgJ6DKUvigv3cQqnkKS4=;
	b=lAqlmoYycOh3zDLbd8wDUrRI10FzP1Ih8WPpQ5MWTnedLYDOeItlj9kRA93m1NExAYbL
	 nrHAC6voHVC5Ja7hBM3ZfiOQtBGQVMX7H7s7tkr/4j9HMcntZbeXOZmL3as66wiMmE5f6
	 9SqyIxHteSeqv+loCAFNvwzrFmdvZzs1/xDtGOPfiGsv4m4BEkqpJ+IT4WTdC+Xl7/j3S
	 kicmB70TlfvE+V5qzmKVW2LHnwKcS23U/D5jr/QAdiQN6o9BIOSr76ULFpcKVIZXfqB3x
	 S2bIDOt4ohjgfwxLQogJ40vQ19pWxp+nlGdKTpFbw/a/mhp1xSdzGYsCY22HNDOKxbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EW9DbpFb;
	arc=none smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58615606A334
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 02:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58615606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EW9DbpFb
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-677d35fd1d2so3581389d50.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 19:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793067579; x=1793672379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=02DoDBYXgSGZJPDz/u6weuFYgJ6DKUvigv3cQqnkKS4=;
        b=EW9DbpFbHKXQXQ/RHiPbBwK9v7nJzRpsH/aW9voJvE8LB+rbn/4jh3R1tuFLrAupKd
         BRRSD4ZCf2wdn10g5zA+UPiaUMsrR59KGryWUI6V93gttNBrVFPJFJrlpzgXN9504ooE
         16S4h5eLIStCNFh68H7/NLjHayQkj61q736rOSmk6KxjOKQ8vcTW6ZF8KNPWhnDlsJG7
         3Hk/t0y4PV6FI/i7OMWath4r0dax0yuaFkLQPhnrKUJ989NYyt3pFsmExZhrQjbuqZAi
         f1rIjkwLKycTzwCPFekufS4yY2605Dd4fx6U7/MUTf754BkZUCqenbqWB88kK6eDTMZA
         7cKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793067579; x=1793672379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=02DoDBYXgSGZJPDz/u6weuFYgJ6DKUvigv3cQqnkKS4=;
        b=WVQd9Y1s78OXAfbRAurWDAUWBZ+Ex2FIEJayiLOteFqh/csN9ZYy4rfQJH/ZbE5Zwu
         NivRqzsfreTAZH5bvDAOo2pWR7JvuR7qWlTgDNjrrirjmnyYjWhHBm2eEeMUfwgDiZKx
         nHmyCWzV+2fS50ktWCXO0TKS+SBnmOR9YK8tUczJvn4amnArUjXkZFwSGr9eq2Oo/t7r
         SUdXd7R7ZOuIrfEsnVf9uM2C20ONsvrt4y2UbAe2EYAezcVWrYOVm/m2Hh+SA+0QzTl0
         o4QFkzplNsdBD2G/dEESp6ketKOuHY//+xDrZaRUS9Sc6K92gqiVYe0Y/EQTFRfI9keS
         Sm0w==
X-Forwarded-Encrypted: i=1; AKwUvBxqrg4jcdb6Bj5u7j7hY7gCctL6VdH1ElpAueiHXXhukYVbVi4/oi3Gp3IuGlVU1Uevho8Ez6vTTlvRGhng@vger.kernel.org
X-Gm-Message-State: AFq9FYJL3lCgSJrzMGTZfSrN8ucl38Nfu/PLeRovrFcj+GR99/ALjhme
	alkx17AYhWE4yzH/fbhibJ+KhFsxSCDeBiM4xDycJ9KYhCKxdwxbcZypKkci82zd4cQ=
X-Gm-Gg: AYBFou1oRon5BlYX0Zmj7Ko3HFoWJr21DyTjI8wDQRjXFZpo847GPop8LroaJYrklox
	5k4Rez62LPHWyy7gZspDuJRV4wEpdhFWdxVXUyBf+RRt8NO9503wMSUCX4tyYj3G9dTuhypqKZ0
	E0FJWnWgZNQNqIXZgwXP4h3i/i02y4dMuPEwzUpVjehqDYMtzr/bfuj8EmmtyfHy18ypdOCSByR
	b+ZpygPkvRy6oVPsDr5AX3X0HpOjurSv04QcZp2X41ClpKGdZjZqDmqNPbcKm01t4LiCrermG7G
	p7TUm6+F73KGUHtdWgtoR2Dw9yeYHA7YK3hxGWAywxD5d/LxpkIS0wqKzbsHd3xlUIaaqUMElSG
	2ZdNLI8olu1Hhw0nHZ4L7FXkzsxqxaKJ0dnujDgBOgztasTuXlGuOwLmoAMcK8UUAFCpgXGJU4Z
	aHUp2l+BgPXChx6AWvu5bTcn+dz/fgBjT8nIUjYWd92eCdnF7Y2W+uimawEG6js8PhPizwzlPqN
	M7GRp2lMtQTtZ79ubebMqiYelIx3S+pkJsk5moapWHq20QNRM+llX1Botz1mcHpy8OaCHBUAHUO
	XIIeWZf+pxOP+cEtJV2EtKI4SecYSoLXMg==
X-Received: by 2002:a05:690e:43c6:b0:675:449d:3d74 with SMTP id 956f58d0204a3-67a6c3e6b46mr593353d50.92.1793067579275;
        Mon, 26 Oct 2026 19:19:39 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a46235de1sm4219122d50.13.2026.10.26.19.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:19:38 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Birk Skyum <birk.skyum@pm.me>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH 3/5] media: iris: Signal V4L2_EVENT_EOS only at the end of a drain
Date: Mon, 26 Oct 2026 21:19:32 -0500
Message-ID: <20261027021934.22113-4-ccortner@gmail.com>
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

iris_vb2_buffer_done() and iris_vb2_buf_queue() queue V4L2_EVENT_EOS and
mark the m2m context as stopped for every capture buffer flagged
V4L2_BUF_FLAG_LAST, including the one that ends a dynamic resolution
change. In the stateful decoder interface the (deprecated) EOS event is
part of the drain sequence only, and a resolution change is not the end
of the stream: a client that still acts on the event, like ffmpeg's
h264_v4l2m2m decoder, stops decoding at the first resolution change in
the stream. And since nothing in the driver clears the stopped mark
again, the EOS event of the drain at the real end of such a stream is
never sent.

Queue the event, and mark the context as stopped, only when the LAST
buffer ends a drain, that is when IRIS_INST_SUB_DRAIN_LAST is set. Both
HFI generations set it before they return the LAST buffer of a drain,
for the decoder and the encoder alike.

Fixes: 84e17adae3e3 ("media: iris: add support for dynamic resolution change")
Cc: stable@vger.kernel.org
Assisted-by: LLM sparse smatch
---
Reference only, not for merging (no Signed-off-by); see the cover
letter.

 drivers/media/platform/qcom/iris/iris_buffer.c | 7 ++++++-
 drivers/media/platform/qcom/iris/iris_vb2.c    | 4 +++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index eb8de60c1177..ff2a1b331ac2 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -913,7 +913,12 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 	}
 
 	if (vbuf->flags & V4L2_BUF_FLAG_LAST) {
-		if (!v4l2_m2m_has_stopped(m2m_ctx)) {
+		/*
+		 * Only a drain ends with V4L2_EVENT_EOS: the LAST buffer of a
+		 * source change is not the end of the stream.
+		 */
+		if (inst->sub_state & IRIS_INST_SUB_DRAIN_LAST &&
+		    !v4l2_m2m_has_stopped(m2m_ctx)) {
 			const struct v4l2_event ev = { .type = V4L2_EVENT_EOS };
 
 			v4l2_event_queue_fh(&inst->fh, &ev);
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 8faf709c26c1..b820b3e43910 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -324,7 +324,9 @@ void iris_vb2_buf_queue(struct vb2_buffer *vb2)
 			vbuf->field = V4L2_FIELD_NONE;
 			vb2_set_plane_payload(vb2, 0, 0);
 			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
-			if (!v4l2_m2m_has_stopped(m2m_ctx)) {
+			/* EOS ends a drain only, see iris_vb2_buffer_done() */
+			if (inst->sub_state & IRIS_INST_SUB_DRAIN_LAST &&
+			    !v4l2_m2m_has_stopped(m2m_ctx)) {
 				v4l2_event_queue_fh(&inst->fh, &eos);
 				v4l2_m2m_mark_stopped(m2m_ctx);
 			}
-- 
2.56.0

