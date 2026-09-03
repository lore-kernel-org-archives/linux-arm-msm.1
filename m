Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEFF4B7175
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 14:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445847; cv=none; b=uUvm+26xiMlFR7uxU/iIG8yn0ZduGqifmQ7rtpcA0pFv6arIcm15coYbRmDN2GuvANC5tHP3QR9O9V5aY/1KXvysvM1KCyG0lRLNubTZtZw2aBluOUyj/Oj/bOWcbO124Boz11jTlwk0jCX5k26GuNC/mefhsTssURY1OxPyt7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445847; c=relaxed/simple;
	bh=3R9vIM4cAXIPD4Q/16hXtxH6BOgrzmLkcWxwv41qCrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R7PxpAWZbEqHxFkF5ZazjET176l82UgNj4QKAq6ToRFC1dkSOBun0T/vlckgMOzu4+oDJjScu9RMU4tX6ig7Z6SFwvaDi8ca9MBW+U5abnfTBJB58481LD5kgnFnOosG6sMCxbJ6KLr+3O+E4YQFrCbYprlwU+xW3BPd5aFg9KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qMP/9M1J; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qMP/9M1J"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso2303313a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 07:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788445833; x=1789050633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VvQUB0nrb39Z1KnOkiEgTk3LEVt0IMBJ5IPyGGTW/6M=;
        b=qMP/9M1JkvhnuKkdMkTnCzyMEMrpz8+KBwpgXp566zpsrrYjgHvKUx6vIWy0mJs9WL
         EjUn0ZvSIeaSLElZgP8nS35xW4wExetp+qkDOeSxNNMi0IJwAtTh/hgj08awVRtmzQg/
         yZ9fVTyOG4X66k7CrMBEM5jf4zxGqgUywhFa0H0ygtc80RNDvp9+70L42UdF7DODAd0S
         D8Fg3vMIy1wHsnafkcJw1ENshQG4VLexS67/aSfisxzEumzRYpMUd3lPKZMUlKgFE0el
         GkdqWIjLrrVlhbFBq7dsofAYFG78iGgwNHxLPEm6QzSYSpgnkoZf1H0d5Qcx1yYlm6NO
         FNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788445833; x=1789050633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VvQUB0nrb39Z1KnOkiEgTk3LEVt0IMBJ5IPyGGTW/6M=;
        b=UlF5N2CKhO5fAOukZDdOgmXp0917Wx8doBNu6e0oxRgMId6C7QSLeTIRMkBynBKmJv
         QVY8tRUH9jdmFZOgjbMd+iQ8OJL1teMbqnwABeHgkERvctAuC1Hz/zr9JX/SS9XXaXca
         9ehqYJ5h3iDGShS/dZKADopLJ+eBQZaZVPzbKslIkJIncBSxenZ1QFLpZh7lexp4Gs/P
         9VCI1OZEOMdM9zlxa8r9CVZuC82DMaLVMP/8YoQSZXgYX9jbuE6Ye1uWKJY9llltYcgw
         IAXajvDVLhoXHC5SLGVPty5bjE9bWn2IGe5/i6BOcDK3THKO1GX6HMaPHZvdovHrOPKl
         eVYA==
X-Forwarded-Encrypted: i=1; AKwUvBxZMo8jsBP/8yDHosswzxGqqgOm9I2CIVYYYqZAywGFD/mTR2u2iWXculr3aRqH7WgoUEaQeU6gFMulZt6f@vger.kernel.org
X-Gm-Message-State: AFuF++mOmFh0Og3KMWhTJnJMFwDp1YXEe4j4Y9OrSn3oSjWrzwzLKDVp
	5vDQan5SRxWWFgACMgXVspHDesT58VE4NsKpzipV76WVW5IHKAdmLkigJo1Fd0ZYX80=
X-Gm-Gg: AYBFou1OtEIzbf2u2M4SEncuzqvJQ7hrKy+dz4p4asfZJKa4fR62l+h+aco70iINxLh
	Tk1u0z63aOzwHveUcLoYSBK83a3JqqL8dNqtDBYz6OlxxxnVRU7TxgGp9Nhq8B2lXhrcuWlqCAG
	PI73Ed6kdORuk1eB9bIO1Qx0gc62jUVcm2zumqUipkNoqzwG2ci87ass9yyiTC7KIfRCYZmJeaV
	pqf2JoYEuMZTNB+aWfD1d4GUJeUCSi2Xn0wTdihInRp1Oy9OVYfIaBXV2UdSWw7narXjkCn8WP4
	lZF+2MxS4atHP4JqH05yxlmUnXZv/NBZCzOy2IN88R9Lis2Kap3N4/M36g1NjKI59r54ZegR3hO
	DG8gauTXrSEpcoBIAQd3EDvrKbnIXdtnpvASFZLLtCH5Ex885rXarbBvWnAujO5jrWBGe1b+wN+
	bGb7r8pJHXlsbtC8lbz7FO698oaY+VJES3XIXFaFqFgAPUOX4NIfWPqfs=
X-Received: by 2002:a05:6a21:4613:b0:3c3:7ac4:dac0 with SMTP id adf61e73a8af0-3d9af9ff7a9mr20557828637.13.1788445832582;
        Thu, 03 Sep 2026 07:30:32 -0700 (PDT)
Received: from niej-t14p ([112.64.60.233])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc43d42b3b1sm1032759a12.25.2026.09.03.07.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:30:31 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
To: 
Cc: Jun Nie <jun.nie@linaro.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Maxime Ripard <mripard@kernel.org>,
	Teguh Sobirin <teguh@sobir.in>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: delete timeout timer when encoder is not busy
Date: Thu,  3 Sep 2026 22:29:42 +0800
Message-ID: <20260903143004.1026181-1-jun.nie@linaro.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a spurious timeout error message under the following reproduction
steps:
1. Run "modetest -M msm -r" and press CTRL+Z to pause it.
2. Run "while true; do rtcwake -m mem -s 3 -v; sleep 2; done"

Resulting error message:
[  124.018206] [drm:dpu_encoder_virt_atomic_disable:1425] [dpu error]enc35 timeout pending

dpu_crtc_commit_kickoff() calls dpu_encoder_kickoff() to set frame busy
bits, and then arms the frame done timer. If the frame done IRQ fires
between these two steps, the IRQ handler clears the busy bits before the
timer is armed. As a result, the timer runs with busy bits already cleared
and is never cancelled by subsequent IRQ handlers, leading to a false
timeout warning.

Delete the pending timer when all busy bits are cleared in the frame done
callback to prevent false timeouts.

Fixes: 95bbde1d0d07 ("drm/msm/dpu: Start frame done timer after encoder kickoff")
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1f20695f81e3..d83d38797331 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1573,6 +1573,21 @@ void dpu_encoder_frame_done_callback(
 			| DPU_ENCODER_FRAME_EVENT_PANEL_DEAD)) {
 
 		if (!dpu_enc->frame_busy_mask[0]) {
+			/*
+			 * dpu_crtc_commit_kickoff calls dpu_encoder_kickoff to
+			 * mark busy bits, starts the framedone timer next.
+			 * It is possibile that irq happens between the 2
+			 * operations. Thus timer is running with busy bits
+			 * cleared by irq handler and timer will not be deleted
+			 * anymore. Then false timeout introduces unnecessary
+			 * confusion and visual defect.
+			 * delete the timer here to fix it.
+			 */
+			if (atomic_read(&dpu_enc->frame_done_timeout_ms)) {
+				atomic_set(&dpu_enc->frame_done_timeout_ms, 0);
+				timer_delete(&dpu_enc->frame_done_timer);
+			}
+
 			/**
 			 * suppress frame_done without waiter,
 			 * likely autorefresh
-- 
2.53.0

