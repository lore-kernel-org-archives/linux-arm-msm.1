Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469951;
	b=i0Lh+ogS0ab2ZxhqW3GgaB5bNNce0vXlJE2xTSx9eNAUZwoqmy9jsBGLQ7KmhBekEpr/
	 ZKgkzJWTHd43hzSqDopuo6mhO+Gk86wq1BS22Xb9cYuevZ3/9by6/O47Zro30u2ARQ2KL
	 0L9AqzxoVEcq1DEx3TDI/QncJYGF2np8Ap0Fmch5UUGqXyuXzGzpsTQUfKqxBhg+mSOIw
	 al7pIjLAcrjvXtwYMbQALg6cwjolBr24YD6W/5cnUAUAruZx5Suc7B5R0qUnRtUFFkvgj
	 XVnlXF7/GpOQyzF2n+pD/XmEMlzu3i3cO/YACOmprr2SKMaxKb9kN2zLrn8IDDjz0sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=qVNYeCbCbAXxmLLdlIMU9oCrRe4PBlONcsIqJq1mQ30=;
	b=P1VgRNVlCc61qooToxjPJNdVcNaxp6HCvt0UtDIcxJ3LT2NouMuo2o7p74g2DysNz7yO
	 9P27KwCT5I7jcfdSuDzzTUNq/2poRM1UZZmJ7CGZQ1znv+cejqEzNFPSPp5/vUn1orAyY
	 rAijomNGZ+QL0zhunCW686GM6yf5DR0Owbm3hKK0qZnIVglf/sPmnQzd/TleuedNYKIHb
	 Oqtaar6fPFRNUcQNzJBE5mwih75tHBjKbQ8oRMxCl4HJOB3tpMf/5L06rUspSD3RIYfqB
	 PyzMV6lGlSg9hKR4r7pf4NcXUvQxa9lrcBSr0hVzA8M0BPVn37C/SyKUx1IIAuTlPFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=W8w8QZw2;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71B0606A8A9
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 07:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D71B0606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=W8w8QZw2
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b600fae14dso1525633b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 23:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794469950; x=1795074750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qVNYeCbCbAXxmLLdlIMU9oCrRe4PBlONcsIqJq1mQ30=;
        b=W8w8QZw2IRkbztOp3R9wwg/Z2c12illDRT/XSU3wrNofve18je2aIWKZIX6DWYSfo1
         F+qn+b/r8nn8bh6RpHH7L+L9v272TxG5JrgX9Zzggls6Pud8V9PX1UxoSeaN/nxC+QMu
         bdzrb72BnzNYw4jjMJFVCO/QMcFMxwAtrZyF6TmkmY6g33nRz6PMgn27jw0FMvYyZYda
         T8niFFoUUh9tF0nppPb2hek+UySyoIvNrrGRj7RT7+OsvDmeS6sYJvyAq4vMHI6UdTxn
         wIhYe1mH3M23a4ZADCfJe7T+3V9ZVmdUCxdPX1vh2mjqx33fVVLSL6DPn8Jlq0Q2WaPj
         MjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794469950; x=1795074750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qVNYeCbCbAXxmLLdlIMU9oCrRe4PBlONcsIqJq1mQ30=;
        b=F3pidWlEKCQqgav2M92SOx3pSKWXk/Yb3TOwonm64qXDnhkpYoF94q5+/j8q/lGeVf
         ilWQRPS+jV6YuiKvJg+m6q9e4IZro4YiS0Oay1CRanvUkvzrU236PgdCC1AgQ46nXiji
         iRkZFejsCdfofskebCq9ANChq1SncBfF+O1WSQ5VtVn9wORZb3cO7eA1NqoPgiyZmyZ5
         mlz4lGt2MUysZ993X5vOZLxgkatQe5xDJlmZjqyxDsD68yXqNjRD9ZJkxYMyRFnkU6e/
         fV/IOJEv+EhrdlGwkbFItUZItuZzVPjOoxjdKsE9cd4NyF+F8LvtkLgmKraAybZIVfp+
         MZEg==
X-Gm-Message-State: APuU4Z91DpMIQV22yHPyboIYDmHDEZ3BO7NY/hIAFGUeJfoK1GsJXGjR
	0WBG5ORTQW0H7ZsUliVVdJtbF8e0gCVNkT55WflgmtuyG8tnhrQwBW5oZzTS7NIJnLY=
X-Gm-Gg: AYBFou36wwu8TUYC1PfjI1KXGO49x6EG3afXpwtDjURzok92ATVb0bGj3e2BFWnM1md
	4PHgUncAFBNzy5FbDeLjvUVy/IcTQkTGBXvlasAfT4j2dSLVLxf026lzcVI/HPNSZ9PtNYCZDCT
	Ok7O536sg0g/u3TqGQ4AH0tgfW7FuUwmqUj9vlflQThrkLwgOfwOCj0GcA7KSY6YyNETiOFbpXl
	svlbz9ISGzW9ktWGX+3t9ymz2v8UI9W9x/JvdaX1izGAQUbXMlqTf7RGmwwJFmS1w6s3TUnPK4b
	4GKONf77ozVZnHnB+utKQ9JsJO07UItmAXHvejC80j6bjfcI3Q4EbL3vlwYFNmKKS65im2jMNGH
	S34aoxAuOE/tg/3wRsol47U0TiDb8QE+6E5561x4w9/aRRkZ2N58ozhxC0QpOrlqhrBT55m/ia7
	kc7hekaWsy7PwEW91UHPVO3CruYCRDcG43NYE7T4NnkT2oMwZ91FHuRmEXG3LYm09l8RMXhdUsN
	/FndgHuM/9k0GhYHXvQWgwjcm6mFMZA+lYhxjHo/+nl8/nxr0B6tNsVmxl3X7LxELi9hUabmc6G
	6awdVLjdbH2b58FEXUcJ9ciJ3v1sKA==
X-Received: by 2002:a05:6a00:3d47:b0:88d:8074:1a9e with SMTP id d2e1a72fcca58-8bc1a39e51amr4637834b3a.3.1794469950174;
        Wed, 11 Nov 2026 23:52:30 -0800 (PST)
Received: from [127.0.1.1] ([116.237.168.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab5f3f99sm3131256b3a.51.2026.11.11.23.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:52:29 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 12 Nov 2026 15:52:04 +0800
Subject: [PATCH 3/8] drm/msm/dpu: support mapping framebuffer to 2 physical
 WB
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
Message-Id: <20261112-cwb-upstream-v1-3-a6a88d928aa4@linaro.org>
References: <20261112-cwb-upstream-v1-0-a6a88d928aa4@linaro.org>
In-Reply-To: <20261112-cwb-upstream-v1-0-a6a88d928aa4@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794469928; l=3088;
 i=jun.nie@linaro.org; h=from:subject:message-id;
 bh=n92yISLOg7FxejPirqGSQZt1WBDSmToFc68ZG69Z3/c=;
 b=mws8i9pwyAQijwBNy8Z8yQ+mt7XdSqf5wyM9PZaWS1yq6P0SNsYZMNFdVdkUnMWPN+tJAYQAo
 x+R/Jac9QhhBo8GGUWT1LBG0EODqgus7nnM1BOZcMvK2FPuXtIF+vcZ
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=O9aRQ3+xXWihQiRRgStCET+eFXx1EZs43Fh0Xh+8Bu4=

Only single WB interface is supported in writeback use case currently.
Dual WB interfaces are required in quad-pipe topology. Map framebuffer
to 2 physical WBs in low level, with master physical encoder to handle
high level communication.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 29 ++++++++++++++++++----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 22433bfbea1e..7d3528907670 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -188,9 +188,18 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
 		cdp_usage = DPU_PERF_CDP_USAGE_NRT;
 
 	wb_cfg->intf_mode = phys_enc->intf_mode;
-	wb_cfg->roi.x1 = 0;
-	wb_cfg->roi.x2 = phys_enc->cached_mode.hdisplay;
+
+	if (phys_enc->split_role == ENC_ROLE_SLAVE)
+		wb_cfg->roi.x1 = phys_enc->cached_mode.hdisplay / 2;
+	else
+		wb_cfg->roi.x1 = 0;
 	wb_cfg->roi.y1 = 0;
+
+	if (phys_enc->split_role == ENC_ROLE_MASTER)
+		wb_cfg->roi.x2 = phys_enc->cached_mode.hdisplay / 2;
+	else
+		wb_cfg->roi.x2 = phys_enc->cached_mode.hdisplay;
+
 	wb_cfg->roi.y2 = phys_enc->cached_mode.vdisplay;
 
 	if (hw_wb->ops.setup_roi)
@@ -206,6 +215,9 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
 				     perf->cdp_cfg[cdp_usage].wr_enable);
 	}
 
+	if (phys_enc->split_role == ENC_ROLE_SLAVE)
+		wb_cfg->dest.plane_addr[0] +=
+			phys_enc->cached_mode.hdisplay * format->bpp / 2;
 	if (hw_wb->ops.setup_outaddress)
 		hw_wb->ops.setup_outaddress(hw_wb, wb_cfg);
 }
@@ -369,7 +381,12 @@ static void dpu_encoder_phys_wb_done_irq(void *arg)
 	atomic_add_unless(&phys_enc->pending_kickoff_cnt, -1, 0);
 	spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
 
-	if (wb_enc->wb_conn)
+	/*
+	 * For writeback with dual HW WB, only master WB is needed to handle
+	 * high level task.
+	 */
+	if (wb_enc->wb_conn &&
+	    phys_enc->split_role != ENC_ROLE_SLAVE)
 		drm_writeback_signal_completion(wb_enc->wb_conn, 0);
 
 	/* Signal any waiting atomic commit thread */
@@ -430,7 +447,8 @@ static void _dpu_encoder_phys_wb_handle_wbdone_timeout(
 	/* request a ctl reset before the next kickoff */
 	phys_enc->enable_state = DPU_ENC_ERR_NEEDS_HW_RESET;
 
-	if (wb_enc->wb_conn)
+	if (wb_enc->wb_conn &&
+	    phys_enc->split_role != ENC_ROLE_SLAVE)
 		drm_writeback_signal_completion(wb_enc->wb_conn, 0);
 
 	dpu_encoder_frame_done_callback(phys_enc->parent, phys_enc, frame_event);
@@ -484,7 +502,8 @@ static void dpu_encoder_phys_wb_prepare_for_kickoff(
 	drm_conn = &wb_enc->wb_conn->base;
 	state = drm_conn->state;
 
-	if (wb_enc->wb_conn && wb_enc->wb_job)
+	if (wb_enc->wb_conn && wb_enc->wb_job &&
+	    phys_enc->split_role != ENC_ROLE_SLAVE)
 		drm_writeback_queue_job(wb_enc->wb_conn, state);
 
 	dpu_encoder_phys_wb_setup(phys_enc);

-- 
2.53.0

