Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267733;
	b=wHHZf5ABuvjIZl7/e95Ha4Re9UAl/mXpOZiJtxX3pscDEfGhV0NW2wUt0FvonybA5gJ5
	 5paNKJymGiNi/WLksdUaKq3Dg7PR+1yIBEyGEtbO/SF3cWOK71qHnKGxcVjIlCibQnynN
	 uiAnlD9FCi0TIgZOP37AZgiAMD7w7UUAA2MOuV0+awQrlbgxdUPdsGoFdOPb7/Nj5dCRT
	 2ybM3juu9aoUIId18DFu9SDdPugoS8qNeGe1A+8kZ2hK10WMet+6lPdFtaJD+1M/RQyhj
	 IpvNPicArqasUOpmFyDJZ2badJbIvdFi5tI0UDEo7xRiE/48eTo3EMecs2oFKVf2w7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Y5UC01j4F8lmz2PBAs58kTyKDbkcUBqBSZpVnV2QVa8=;
	b=NUQn+D1KUYqFip8Tl08qojYEu7gM/6mCG9A7nF360/2qEPGnhbe/+7UYMq7j1avfU/ey
	 1Y6KKHzUMjGJDwZVNasnMLU+lp0w1ijH8pBgcvTbqHQxhOTRLZeEG0iygHfjVoNIP84O4
	 OCTNkfVQJOd4AX+5UEc7RF2U3v6/ir/q2uFTIIDL0QroDi1K4fHqr97zZHy4ROBGwO7EY
	 g+pRq2mqjjtyAmeasPhOBmaQ9a7k5JFz1Bpq8SuMvljcw5+3T7F8lwu2/w/m7GyGGgNjE
	 xHoPA6OX0PiAJITRUQ/zq62aIMkPSx66ZbwOBxbtC6txYwXeeHp6XUrRsN9QKCdoaVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iKU8tuov;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3372606A33D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3372606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iKU8tuov
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b042c0728so586923f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 02:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267731; x=1793872531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5UC01j4F8lmz2PBAs58kTyKDbkcUBqBSZpVnV2QVa8=;
        b=iKU8tuov9IstN0CtOvIksd/jZJFIVz+/Lpj5Oqt7C3sZU5OBRocdxyZANHhrnVs+j2
         D4MxwKsWV3zvtMcLoXlzM8fE/5WfogWTeArUuNwDXNdCK/t2U6svcy1oOKyRxNQQt0g5
         rL8dm2/tzTWZpa7152Pxxxx+7i6/Me5Rjuc5VW/M+oKRNN/25yT7i/lU/rbf/zVLcc2+
         RgMcVkVf8FxiYrQph4dd/Pd+URcuV5UH8AtP8KyV6MWo6AmCSTRQwHoouGMHIV97p8rY
         mgfXuIUjwZLd+NswUFl7WPdJ24sbDeo0IVAZAqeKC2RNY398TKB3qFrNxHqxFAWQJFhh
         V7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267731; x=1793872531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y5UC01j4F8lmz2PBAs58kTyKDbkcUBqBSZpVnV2QVa8=;
        b=CK7NQNcSXJez4Y4N7A0Uzf4ECPg1v39yVr9NMWkU3XD20myOgsDJb34sHFjlochsQN
         EJvhMBoYoYta8E3dNxPYejyWfT12ogGlDbeo4Q8Rv5ipxnZjwRoXSjAVyWMlOwVdwkLd
         /sUmYgPxWLwpFl0t8j2hrj5bCMCcpiVS+uE45ehOLig3qDhmmBLEWILBGILCkvlMhDkQ
         YRsuGOmWo8Jv4Ke9VYXpQyinjtM5OLHeFU1oQyPxV4lh2rOpBZ//9povJQJs9JWf+v8G
         reIUt3C29GDWVfTkxuEnDAxy20Wt2+8KNRNAoXMwhB40F2W6kHcK+Qp+eFOU67clJJp9
         NOtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHYJ4P9ic7TH4bein16k/OkZclPm6ufC7EKQFwzmw8kaFMgZzS48IO3Czn8NaY391SYPhH5B+PltYC5LlM@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7zVNry5mzpwZ/zQTeCLerbtEMwBju6O6iqTDp5iF+Bpanzrha
	aV16du49sh1emHu7QU8meuw5N3Klu5/PPzl9jJab4pAx/RGdHqBPJ80fwmDoj4PrutM=
X-Gm-Gg: AYBFou3ygnUZernUPw57/N9rDNRsdlTUzzFOnAe6LjLUFttlalcNIR3vw8rz/UZcEFj
	AewkQuaKODSOKkon9sygBtMJL7gQw6zo2e5A6hmrKwufCt+3Gp97zaHgT3TVU/of+4HxIlz8WS1
	lep1ZtOhdyF8IMLna0tG+awms+pRHb1Ohv3HQoCybd7tTT92HKEVnou6huSztQUWtDzdmMvbUpc
	szHhn83GigS1Zid7DfjGdQgXmO9s4msLAssEFMlh8yp7G0A5+2pBKW28KO4Q/+zop1d0KhQV0lI
	gyoDxeiKpSahAp9LaFSyvCHbPMF1tBfjLKw1kFxk/hPJ8RXraPMB4t/qKGeKBihOvbl4YxTj+ei
	8CVXNz04E2JEv9Gh8BUALL5GZU/Kkirk+rYWK+PtOGv5yBXm7SlhGkoB5pQA1FxQpXngOzwH5EW
	CT2ly3PC2/0IuTMcqfxqkKWmUd/jEEZZO0rhXszXRHAYsD2HSjrcvVPP1OT6qpvUW+rR/QHGmsD
	PyS+/gZeX6v6xy2mTBJtPOAH03RNIoUCpGOnfZi3t121jvtx0YHcaIpK//zDct3iRnhpekDZ1wu
	iQpK9gx5EChZ37d/nuA=
X-Received: by 2002:a05:6000:260b:b0:48d:ffe8:ace6 with SMTP id ffacd0b85a97d-48e5d5ab5f0mr11444415f8f.42.1793267730894;
        Thu, 29 Oct 2026 02:55:30 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:30 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Thu, 29 Oct 2026 09:55:12 +0000
Subject: [PATCH 03/14] media: qcom: camss: Introduce SOF sequence tracking
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
Message-Id: <20261029-v4l2-frame-sync-v1-3-d37992559c58@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4802; i=bod@kernel.org;
 h=from:subject:message-id; bh=wdQwdb0LybEUqhSOVKQnsey9TO6QXlFm0V/2+glPoa0=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgKcwkwKsCinUZhzf+bn8pQ23TsMcOW3S5XV
 TYvLc4zkoWJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYCgAKCRAicTuzoY3I
 OijsD/43ILDcqRcqei8pz1pYj1g/maPd6boKzdPOEBGrpudZ4QsswZPtSl6Z3ar9furlXhfmUSa
 d9zgfQmAS9IZiS8Pqb4kTe4mjwN+J5TwOxzzYNqvumVHLmzVCbuYiuFbKz7BrcujjlWfFriTtcz
 uJjQ0SzBy7M+lk6PNaN/1pnrQAyzDyHs2wYO1ApAj3XzwGexqyvxr0iXPjcN6urNPIxgDhAeMdJ
 coxaJj726xNHdpytcR11NUe4UlVqw1MwsE5fBvHgNDYpEsd70k57kn0w5H3Bvx7Qz1Z5BYAjJnY
 BL2vH0sGOi5VWMRApS62GSuXrE6YPJDquWZ8TwqcWQsY7adTRIX0GTvCqQ0V2OwANWChUW1pUY9
 nTiiMDggDt0Kw/L6ysUKML1K5n/h4w6PXG6EDZUT7vawuKwpogCKnZsOsO7l5wveWQ2BlDkhCG/
 8EU6XudAg+h4o8KIdGdGQd80p8ukt8xjRwZlpuN4cH9O3dNb8D3RopewUqJOHYr7tsEqVOuIVgo
 Fyme8ao++faC1XTiTRbOOUai8k8hpkaHGFk67lkmYt6JLqFyNY/PfZjzAbBV0KSgITFgc4lV83q
 R7LGNrj7K+l4N+Fy9r8eConLUXv2zkAyTWORdlSJ0UixeM8NK2ktp6M1U7X8yUZ5edULjPltcDA
 aZTJ3078UvOd7Cg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

In order to communicate to user-space CSI2 SOF events we will need to hook
into and control v4l2_ctrl_subdev_subscribe_event. In-line with other
implementations of FRAME_SYNC have CSI decoders which support the event
always generate it in our case if and only if an atomic user count
indicates it should be so.

A flag in the CSID descriptor indicates if frame_sync_en is supported so
for each SoC that supports it this flag should be true. Since bool is false
by default no negative enumeration of existing or in-flight CSID is
required.

Subsequent patches will enable on a per-CSID basis.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 54 +++++++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-csid.h | 12 ++++++
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index a00791b00feb7..2f1426e77e87c 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -760,6 +760,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 static int csid_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct csid_device *csid = v4l2_get_subdevdata(sd);
+	unsigned int i;
 	int ret;
 
 	if (enable) {
@@ -778,6 +779,9 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	if (csid->phy.need_vc_update) {
+		for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
+			atomic_set(&csid->sof_seq[i], 0);
+
 		csid->res->hw_ops->configure_stream(csid, enable);
 		csid->phy.need_vc_update = false;
 	}
@@ -1316,9 +1320,57 @@ static int csid_link_setup(struct media_entity *entity,
 	return 0;
 }
 
+static int csid_frame_sync_add(struct v4l2_subscribed_event *sev, unsigned int elems)
+{
+	struct csid_device *csid = v4l2_get_subdevdata(vdev_to_v4l2_subdev(sev->fh->vdev));
+
+	atomic_inc(&csid->frame_sync_users[sev->id]);
+
+	return 0;
+}
+
+static void csid_frame_sync_del(struct v4l2_subscribed_event *sev)
+{
+	struct csid_device *csid = v4l2_get_subdevdata(vdev_to_v4l2_subdev(sev->fh->vdev));
+
+	atomic_dec(&csid->frame_sync_users[sev->id]);
+}
+
+static const struct v4l2_subscribed_event_ops csid_frame_sync_ops = {
+	.add = csid_frame_sync_add,
+	.del = csid_frame_sync_del,
+};
+
+static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
+				struct v4l2_event_subscription *sub)
+{
+	struct csid_device *csid = v4l2_get_subdevdata(sd);
+
+	if (sub->type != V4L2_EVENT_FRAME_SYNC)
+		return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
+
+	if (sub->id >= MSM_CSID_MAX_SRC_STREAMS || !csid->res->frame_sync_en)
+		return -EINVAL;
+
+	return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
+}
+
+void csid_sof_event(struct csid_device *csid, unsigned int id)
+{
+	struct v4l2_event event = {
+		.type = V4L2_EVENT_FRAME_SYNC,
+		.id = id,
+		.u.frame_sync.frame_sequence =
+			atomic_fetch_inc(&csid->sof_seq[id]),
+	};
+
+	if (atomic_read(&csid->frame_sync_users[id]))
+		v4l2_event_queue(csid->subdev.devnode, &event);
+}
+
 static const struct v4l2_subdev_core_ops csid_core_ops = {
 	.s_power = csid_set_power,
-	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.subscribe_event = csid_subscribe_event,
 	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
 
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 5296b10f6bac8..2e48b08b93592 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -141,6 +141,7 @@ struct csid_hw_ops {
 
 struct csid_subdev_resources {
 	bool is_lite;
+	bool frame_sync_en;
 	const struct csid_hw_ops *hw_ops;
 	const struct parent_dev_ops *parent_dev_ops;
 	const struct csid_formats *formats;
@@ -167,6 +168,8 @@ struct csid_device {
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *testgen_mode;
 	const struct csid_subdev_resources *res;
+	atomic_t frame_sync_users[MSM_CSID_MAX_SRC_STREAMS];
+	atomic_t sof_seq[MSM_CSID_MAX_SRC_STREAMS];
 };
 
 struct camss_subdev_resources;
@@ -248,4 +251,13 @@ u32 csid_hw_version(struct csid_device *csid);
 u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
 		      unsigned int match_format_idx, u32 match_code);
 
+/*
+ * csid_sof_event - Track SOF generate V4L2_EVENT_FRAME_SYNC
+ * @csid: CSID device
+ * @id: CSID src-stream ID
+ *
+ *  Called from the CSID interrupt handler on SOF of the path driving the event.
+ */
+void csid_sof_event(struct csid_device *csid, unsigned int id);
+
 #endif /* QC_MSM_CAMSS_CSID_H */

-- 
2.56.0

