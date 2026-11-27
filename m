Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771179;
	b=3iPxMVTUFglSPdhDNCJGMd/meF3PSg5BcXvrOPrkW/znPg4d9pMMLsPhVf3N+2LVYRQw
	 XfBD79cB/mOHf/pylxcL2MWpxr1o/YFxNfqE17ki4bS/Jqu8VcARZ34ZvPqRwxTr2N8GF
	 yGmYbOOlYFlFT0XYmhsv6ELquFYTbR4sEbBapydmOS8SJWl1j0Us9KCCXrhBAaxxMPBlL
	 qzwKLQSF87Yml6jQyOMpNvvoIyOxuu0orMux2Jb/hskOSC7q6dIhLT7a6FQRt/C1uIPoK
	 4zdTVMqwy5v41V9TBAiyaWAyb7eGIjzsD7hn+yL86g1dSYiwVeVApnOVFBnkN7PJcNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=metfIbrsOxAWRmHkJSDy8voQcz9dpLZ1W5XEiDguPng=;
	b=EfQ/3kLvYoXEO6O5miJCCQUwFqumoP9q0EWi9+s5aTY2dxBAn+o9SXcBf08tCXaEuIEF
	 J4SzACvZSbDXeFewZ4dxU7w4998j+5Dlo2vbAt2u79ymbjyU4gyGCQSBUW06FRVrABhej
	 R7aPRs1+Sak83QUQKSZw2Dsvfz5HDPZbwVu5ImjkYARPS6z6/bCFYY/8uq6SY2MC5ABbR
	 7QUNyyousv72YX7T6BFjNL3vPr8HRGaPj+DWMQy/YrhoijvSH69+f50IH3npGNIdFVy62
	 Js7yY4oBHdDjmW12cSY4Pg8pDXb5X+wZ74mQ4qNSEIbiusb3We9OzgB98geGqprZ6Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DweR3U7B;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC22606A323
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DC22606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DweR3U7B
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-498f5fa5103so4662394f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 01:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795771178; x=1796375978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=metfIbrsOxAWRmHkJSDy8voQcz9dpLZ1W5XEiDguPng=;
        b=DweR3U7BtE8bHHWau0Tb74cepuCGDQEjJARIAUSz1MIqgpCY51ne75wTO33aCH/NP5
         JxuRfxpYfF7N2/aSQmK8zodkRTeBP4TgBr5TbIHL1UzTzwD0W/tvJI2VO6e7CNFEOYbi
         ZZOfRHT1NEAYsfrg/sy4jHlGi4seHz1lQpLgxuU+YXJwu2IAzBdVYBV9vBlcTwUPpsBC
         8gGBiS41vmhyV89HPdXjsvHDYfzktZ8pflSqlcMmlwc6q1qvFtgmZpIfNL5DvZAC01YR
         Xc3zKMuvU/AjjcssT8SHfNpnUsXWASfwF3dO1NnAjvucJlhgRoO8deTBFUwRref89n4B
         RB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771178; x=1796375978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=metfIbrsOxAWRmHkJSDy8voQcz9dpLZ1W5XEiDguPng=;
        b=STS1Jnf/9md7IgO+7Yqticbxi0wVf4I8p5hcM/Ui2E5ILB3WSmnvMuJcxwtd4SEO+d
         7mgMJ/1+tfVNg3CE0bZLPLtM963MxWjOZzS32MYp5amDcW1U71rfn+aj2LaSrkddrFi9
         PWH0FaoeZmsKh5bLVPelykyC46ybS8xtzvuliEfVFwsjlZc++p5Ttz/ueLGjaD3xaBFi
         vV7oD4gkYR2PBX2WybT+e2tULnDSyM3kfu+SJNKKN9Zh+tPUzjJCPROLFIO7gCadDOAx
         NHVCEPkE1rLDPDE2eb8E+aaO72ZUl888FAB0mQCH6DC+LXBZZvlG4adDnWCbq7S3ZAeQ
         fn7Q==
X-Forwarded-Encrypted: i=1; AL+hErFKwswJTtfpUpHr0BiDAAFrRkeVDlv5dWordc8cDG6faW7Xy6bczvqXwVQv5E4rrUFCUATA3mv1ms1ZalUK@vger.kernel.org
X-Gm-Message-State: APuU4Z8nFZtL0FwIpWimmHdRAEP7sADhIyik6kvXFtwep+16Bwpi9XnB
	5BUCyXmaIUNs4LZZOY/sbOp98Fq1+Cpiy7++TWPekxNWp6Ye/Uj8Tr3w
X-Gm-Gg: AZFdTZd3reu61oWiUHM8ZGazh4xRy+B2aJJPdA9VQXs+MlYMln2yOelwLuoYf+v2T4p
	RI/u+tX38hOExeb8OQT/BxOnyLD86u+aR3aNrniXfBGb/EHPkXgwP77CNXoIYgtvD5dwLzuAL3P
	AvGmXehgOlSgI707jIvrdyWV93lSe7tyDjfvLzeScoC2YJ2tmBec5/UdqSgZ0n+yY3WXtcR40qm
	meQNNGyVGQOXOGjd4dYkhafHTfE+w3EtPpJSwcBqZV/tSPptMYlm1201MyPbfKWX19SSmSmiwa6
	QyWrFPdPdGWpleWcZZmi9zhR1vrx8gTVfcRfZ7WdXK5ux+STX9ELcTUapgeyOywo1Xxp8iqwj+4
	dfG1gpSJfL/79zsMsDmGYLsAPI9O6kfS7cCcfSDJlekM6zKyR7vlsrivEJUamOBWZMAU3o6jrTM
	bgHiWbG3Fq1na6ofylS1AyJzKsNV5X8K7c63HgohyHB7pZTpKKbrKk+RW6hS3163M9fOxuVP2/n
	5u+SCOZsAO77Mu989fVeSgp6iKhOFuahqEfbyEtQm+jikwxZ2P4sguOa8x1aYM3YIAlGJE3zmwN
	hN9Yu+8/5KE0+8iRT/2WkvLb/92vHtHaUFVOXBPGjOa8uKk=
X-Received: by 2002:a5d:5d08:0:b0:4a6:4f91:284c with SMTP id ffacd0b85a97d-4abb83116bdmr53271779f8f.51.1795771177338;
        Fri, 27 Nov 2026 01:19:37 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm52415228f8f.55.2026.11.27.01.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:19:36 -0800 (PST)
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Cc: Anton Protopopov <a.s.protopopov@gmail.com>
Subject: [PATCH] drm/msm/snapshot: Do not keep an error pointer as the atomic state
Date: Fri, 27 Nov 2026 09:30:50 +0000
Message-ID: <20261127093052.1338722-1-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The drm_atomic_helper_duplicate_state() function returns ERR_PTR(-ENOMEM)
when it fails to allocate.  msm_disp_capture_atomic_state() stores the
result in the disp_state->atomic_state variable without a check.
Later msm_disp_state_print() passes it to drm_atomic_print_new_state()
and msm_disp_state_free() to drm_atomic_commit_put(). Both dereference
the error pointer.

Store the state only if the call succeeds. The snapshot then has no
atomic state, which both users already handle.

Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>
---

(Just accidentally bumped into this, while working on BPF stuff...)

 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index 850246fc89e1..c9bc58b833d3 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -111,6 +111,7 @@ static void msm_disp_capture_atomic_state(struct msm_disp_state *disp_state)
 {
 	struct drm_device *ddev;
 	struct drm_modeset_acquire_ctx ctx;
+	struct drm_atomic_commit *state;
 
 	ktime_get_real_ts64(&disp_state->time);
 
@@ -121,8 +122,9 @@ static void msm_disp_capture_atomic_state(struct msm_disp_state *disp_state)
 	while (drm_modeset_lock_all_ctx(ddev, &ctx) != 0)
 		drm_modeset_backoff(&ctx);
 
-	disp_state->atomic_state = drm_atomic_helper_duplicate_state(ddev,
-			&ctx);
+	state = drm_atomic_helper_duplicate_state(ddev, &ctx);
+	if (!IS_ERR(state))
+		disp_state->atomic_state = state;
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
 }
-- 
2.54.0 (Apple Git-157)

