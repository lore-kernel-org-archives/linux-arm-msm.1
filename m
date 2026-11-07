Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013320;
	b=1yPq+H+CEkSYB3UOfyWJdIcNTZqbgSnsQ9o4FWxNTzECJ/Ido0Y1m0fmskP+twiR+tfr
	 CNsapXjRgkhEwxRX9AG3PP07SfSXPKVqpkFjZEBpWtKKTKKU8zd0IfQo6CGzM9+qsZNC3
	 s+hIrFgwtGt9hoMJhla2m69Rdn9c77mCrbx0mBKSmFNySdGBwoGg9T2PWoSFb1XIm/71S
	 hjyTbzjbpmzboaRVuMOYVIqoDcw/8JPVmkJvIAw/6q71p3nWGtt5MXVWWHym8EsoUJOkX
	 kUEWo8wK6kd3MCs+UO7vCXidHxvns7w6sJoGKHeWkA85i38RA+l30zO2C3IDEI/yLgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=pLrJ5gOP6rxYIUYYRq44GlqBmOdL3nMZ2eWc5poqwpo=;
	b=F2a7jfComMCFhdZ32vNrSTc+0j5wVlgGXK8myE6tkqHh7udMzAQyPLr9W0+s81O6EczK
	 m/Mq4UlCYuXPvMwryjli6Yeymh7lskmolCyPs6mKYEMWfrTvn6FA26MPqMqneRk91M+Cn
	 jpx+6NLwIGRgDebH8Bug/xSz+rTllz0JMjV/lwub+sKgy5GaRMyVJKZnL89U+HvAchamh
	 qh/uC9QkHTtOimyBVbjYzDMGDGVeVwOhZS0+QrOvJcqbNtHw9ZVDL2AyzQizD3/g5JBFQ
	 xAkKzSvJdrM9Fouzvj1qKJp8TqxBaxLaUsHCRjRj9hqozE1i+geCK3WBx2M65NTgLDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="scQC0/Z3";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13F5606A33C
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 01:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D13F5606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=scQC0/Z3
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so10856765e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 17:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794013318; x=1794618118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLrJ5gOP6rxYIUYYRq44GlqBmOdL3nMZ2eWc5poqwpo=;
        b=scQC0/Z3N2Eu1D4Wq9LqZbo9ZP3C9hOJmtnL/9thIMgxwF1EeMT4jJY5Ig3F+rcXSk
         /o5usjB/wiJkV0eon3j1ufnb1riextdUjm2d9uh7nNmfVghVVh0xkPUybEQInBXCURoO
         2bo+u3jVtVrxsQcc2k3tczOT7p7cRFI6TqjBfsQx5l438kj1OfJFxeb033FCheflol7x
         T9iRwtYt9zXgxg2tyKkgDFb27IFcuCEmZ4HSRJtvvEIMJPBjGrT7WSZ2EX8gPXpLCTMq
         97h01UsjzcdGYTVsTNdtd4v+ySQeRa3pQzEAewDrOxsLJO+2SKUrIIDMSPR3BLX7h36L
         qlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013318; x=1794618118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLrJ5gOP6rxYIUYYRq44GlqBmOdL3nMZ2eWc5poqwpo=;
        b=1ZID4YTV/ZsKYxYfvH3srcnD7SrPySs2yZertrxKqIr5edcdu4Jcf7i251+mz2xh2x
         1GAH+YusvO1jjCA8b8Q+hlcRBWhQASySFYqWgW8vyvXj02WbbQNmNDwuuf1jw9nnL6LN
         RZKVz+zdp1DxzLegQVsfSVBbqdYr/eCiyrILhT3AUfF9nmU0qsDm/+DjNejYFBbHR2ZC
         vCsHGKEInQFWvBW19J9/GLjz2TEzY/GItftUyZ9qGjtCily+9B6y5ZSHro2Fj0wRO+hy
         w4IHadAPcp4NJ+Z0m9ii03N1xVq+JN588idHgRRCNwWSKl8+hU9gDDe5tTNx5xQ0MqkC
         08Xg==
X-Forwarded-Encrypted: i=1; AKwUvByVj+XEQ3HvgzFIMl9toO2QmaDdEJtEn0oyCMmGiXF6kXYx2KDXZ2RpwfZlc+kmqKLR80zeitsVSMIoS7Wk@vger.kernel.org
X-Gm-Message-State: APuU4Z/o4XRPwPmjFep4gnZtKGEFMCn6uMoZEYjnBbVQvh6r80k6T+QC
	73iVUGQAS/VbyMKuIN8UaWp9Kmc/CNj6AQJanAMyXzg7kpYa54OejOPiYxsVlAXkqwM=
X-Gm-Gg: AYBFou0egt42TSTUpLNHmXkrG7/JVYcMAW331CwVd3yE4Hy4FIH6Mt645ijPdiSD/c3
	9qxjOi09AXTLgSuxPqUEsCwu8dlASHG4HCbpFJBbZvt4vI1Ht2hSKhEcowkbky/4UDYRY5SwG7K
	PFGWeFKYpbNqNfS3zwVMeqst3hal1DzGvi1PzwlNtvetkN+ETgg+OC3OvZMJaufiM1e4oWOcFzF
	8TAsywxggYuNtjPwRC6hMsUuYFBQXIZpusyy8fqry6zLvdO15eFaEmtq+T206tDWlV6XLrA1xSp
	css03OiuvjYyVPaC8vZNh/Aai30OFSaYKrN3C41Ewpqfslqc2ATS1jyvPBn6a/k70XOSK9TQjUQ
	KgIhhgIbfmtRAJ4Clav5hPNA2Zp4QSdQihZNhzIISmtSJu1jYlPvFDtR9F7jMSzZCuchymcR1/l
	0k8CxXYF71WiUXNDLyymvOzSDVkiGSpiqSea6Gbj0w1efD1zk8vLsRyTtbRfKCIOZTPioTQ5oDZ
	fJ2Has/6AfAefDcVa+SLCba/NZkskwE/7TBflRwecw8HAdHoGuxYwfGO3GQR4KgufmHvNlKV/Cw
	GM9pYhk/R/tbETc+q7d08iA=
X-Received: by 2002:a05:600c:4f81:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-4b6de69168emr59878395e9.20.1794013318246;
        Fri, 06 Nov 2026 17:01:58 -0800 (PST)
Received: from [127.0.0.1] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291531sm24526375e9.15.2026.11.06.17.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:01:57 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sat, 07 Nov 2026 01:01:46 +0000
Subject: [PATCH v3 03/11] media: qcom: camss: Use SOF sequence tracking for
 vb.sequence
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
Message-Id: <20261107-v4l2-frame-sync-v3-3-e5bf7073a35d@kernel.org>
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4789; i=bod@kernel.org;
 h=from:subject:message-id; bh=JGr52XC0KJpTg82YxpqeHAQ9Fu52VhhcuMjoPOZQCxM=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq7nh9dZbd3fPRuoeFHpwgEKfWl3byocYO+8I29
 tJCA3el7/SJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCau54fQAKCRAicTuzoY3I
 Ohs8D/4+q257p9dVJwSht9VbwKjtdYjE9JKw63jfTm47W+x5Qku4mYeJLCmjt6QK0dtgS2wDpar
 zxG+nLQws10qL8pcqDtrohM05HSplFpiZkkNLeSDQKqViFf3xf3xtTbZv9Fp+LJuDLa4jxqy/33
 j5vulkwssoebFX/031QCHgCq8CkFvRGZ+VgfniEhgKkmn6DU1BjZOWbliQs72Gk+Ug2hbF50+Qw
 wcnvyVRhX/UkUlFa7Y6XxdAYN0BTFtiebqbsyAB/w0481JgFbRXkWfaDcKzlWrBM7uK3N8+7pr+
 c42c9f/mif5vxHH/8QNAeFs1o2nNm1wcT9Cb9B75Fs0DciH/ZxD+L1JbaxpKI//ll2uOGavzL0b
 aqJSMawIfpcbJxme+MiYDoL/S8jZfSFsz4k3sS1p6otgu1CcyQyuf+YCp8eySIFO1L4qXBZ2a07
 bQcnikRgmrUixpjbRkA7X5Cwnscs+g8r6obm4D+45XNAZdkjlDghSiS9NheccL0JTnNqm7zzeCR
 VSySrbZGrLlU9SJQex12BN9BF5WMPUNKmLREzZAN0spiKchOvt1CI+MauCEaLf3wPvEHvEaK34f
 1jCpB5CUrxk4qXUdv/leI9r2sY/tiyYXnX4FWo/xs82CrxNzh4aHwA9IBDQ/c0X+KwAoLcWEyY1
 PyXfFGjsyBDVZLA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

We want to correlate statistics buffers with data-buffers. To do that we
will need to have a sequence number driven by the SOF signal.

Rather than incrementing vb.sequence when data arrives, we should increment
when SOF happens.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-csid.c    | 14 ++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h    |  9 +++++++++
 drivers/media/platform/qcom/camss/camss-vfe-17x.c |  5 ++++-
 drivers/media/platform/qcom/camss/camss-vfe.c     |  9 ++++++++-
 drivers/media/platform/qcom/camss/camss-vfe.h     |  1 +
 5 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 7f33fb81ca8cc..588122beec854 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1356,6 +1356,20 @@ static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
 	return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
 }
 
+atomic_t *csid_get_sof_seq(struct media_pad *pad)
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
+	return &csid->sof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
+}
+
 void csid_sof_event(struct csid_device *csid, unsigned int id)
 {
 	struct v4l2_event event = {
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index a9d88909d37fc..8edb258b0ae58 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -260,4 +260,13 @@ u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
  */
 void csid_sof_event(struct csid_device *csid, unsigned int id);
 
+/*
+ * csid_get_sof_seq - Get a pointer to the SOF frame sequence variable.
+ * @pad: Remote pad of a consumer's sink pad
+ *
+ * Return the counter or NULL if @pad isn't a CSID or the CSID doesn't support
+ * SOF tracking.
+ */
+atomic_t *csid_get_sof_seq(struct media_pad *pad);
+
 #endif /* QC_MSM_CAMSS_CSID_H */
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index 62c2405359a06..4972d3ab65078 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -491,7 +491,10 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 	}
 
 	ready_buf->vb.vb2_buf.timestamp = ts;
-	ready_buf->vb.sequence = output->sequence++;
+	if (line->sof_seq)
+		ready_buf->vb.sequence = atomic_read(line->sof_seq);
+	else
+		ready_buf->vb.sequence = output->sequence++;
 
 	index = 0;
 	output->buf[0] = output->buf[1];
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765f..da373024c847e 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -474,7 +474,10 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 	}
 
 	ready_buf->vb.vb2_buf.timestamp = ts;
-	ready_buf->vb.sequence = output->sequence++;
+	if (line->sof_seq)
+		ready_buf->vb.sequence = atomic_read(line->sof_seq);
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
+	line->sof_seq = csid_get_sof_seq(csid_pad);
+
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
 	ops->reg_update_clear(vfe, line->id);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index ae9dad353a378..0e2dfa58421ad 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -94,6 +94,7 @@ struct vfe_line {
 	struct vfe_output output;
 	const struct camss_format_info *formats;
 	unsigned int nformats;
+	atomic_t *sof_seq;
 };
 
 struct vfe_device;

-- 
2.56.0

