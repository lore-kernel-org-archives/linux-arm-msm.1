Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469962;
	b=xaJvkP1Z/NovGZqu28njpbc9hsqjHIqC3v2c4jDH4tcZO6TkW8Nc+sP3kGBhZSPidNa5
	 6Prbw9EaXfLFl0q6Mr+1whiaRThB6jCzYIXxXrgQX4I7txg7CMkzZACZo+HsCw8HAF/CO
	 JGFVEED6BMrt24y2VD1GLhSdB6x9cOXRVn8eHPIeHn2csM0r6XMp03T4N/UmzcaOd9QQn
	 FRJDD89sEb5TlfdvVznmH7skAzjCgiEkCIK5iU0wN/udHc1iWyAWnCj1hIlAPyNq/hswo
	 TGeUPM2DRx4GuGPyuSzOdTfuv7/A1+K0j2bEahDylHL8qD/hALUTi6rtX+BurJIFV4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=MfIiMtH3vcQ8rnl3Mz2iz7HrvbyC+ZkC2w1Z98pOQoE=;
	b=rIcrbjWxIpPxUzTXDv5ymFUjQsDUqwYQrXHEG9XB/bZD91eMBx35eKkaVMQJL5Sc+lF+
	 QvobJoHzHydU3QySyiUTIgGLLhjqXJBTIVGj2rdTJeHB967deP7Yg4cYL5zWQrSX0+Bz1
	 TpLdUlsXNFuWY8RRTT/PQO813fKCrszirrSpcyi9ZvamDCLmy3WEDDBbI2Hv9z3Xg/j2r
	 ZP5+e6++GJ/2Fa3NIUOJJZ5JJPugMlqcSDaF8EQCbZcvUOZhpj9StE31r9+fFBkJ3ohSx
	 /iA/lc3Dc38rGcI8T+q4M/wTxSC4B97F5cRuPQBgJMYZCc2AA5RGBOVo0epOiqsjArw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FBvRObHc;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76977606A327
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 07:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76977606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FBvRObHc
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so350181b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 23:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794469962; x=1795074762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MfIiMtH3vcQ8rnl3Mz2iz7HrvbyC+ZkC2w1Z98pOQoE=;
        b=FBvRObHcaGUTLBOh5MpYX4l3YsH/d9FuewJxp3uPDj5v4U6Riz/gxXk9PLIUIZcM6j
         c55xYENrxWMXDVY4q1Gfs8bf6tnZQ5vg4gh+/sePoFnfiyMH0iad1S9vYjiIYj0Y6Fe2
         E/LYIpkDkwOqFaTvfeCngK23KdmGs8RIXLUF61TwZ/1Bu1UIvK8ok4vMQh0HWdde+Ojp
         TkPORE7m3x5J1nz2liUAFVJHs4yoGc1Yyh//5j/lMojaaBp2KFVE03etrfEJcqS+zlBP
         3NLXlfVBNq46i0WtGzlxrkHCtTDzyVFirWuAA77hX2e3/FN2+pefslW1DEx/wwYXWVtO
         yBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794469962; x=1795074762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MfIiMtH3vcQ8rnl3Mz2iz7HrvbyC+ZkC2w1Z98pOQoE=;
        b=LqKYruIHrLuZkmD8BsXpk8uQaDhrKHDtjswPC3K9AkE20fjR1pH1Dy21XY6N1RsU0+
         F96qRpd0wX6ib3s1pTRO2e8ZLa9m6OezC9VgeZkEBuh8b+ThQxB70P1GNYt9c6IRwx2I
         1JRq0UeziRl5oG9LB8/9u5eDhCEulfViys62csVP88XwuQdN8PMtdUPGrFHMux5CyEma
         Q0vY7WKb4i8faBdeXKdQiJ8Mu3Lib/ajfqNyedLgkyEzc6E4cXNvHqkYJR4RYV4awQRc
         HWA29MEqKduAbJG5CX1NplqxDFkEQBC0nd2CnmfLQD2n/gIcliyzSdiJm/KWgGLeYnp8
         VyvQ==
X-Gm-Message-State: APuU4Z/SIa7qykGEBoxFh+6/EBlOlL+FNY05nAhQ/9OQuAUDYJAJ3Tn/
	F5zsYg4Lnq3lYmMXSDSoOlu4wlpAx1djv1fNjK/QTtSilMi+aaBcBh7Llm9E0A1HvyE=
X-Gm-Gg: AYBFou0wGFuxZ5VneaTX35EDt9ZyaT8xAUWE4moVC87+9QhpGx4YiuRZYig2HEY4B+3
	5agjbPhjBKy3oaWYruXwr082/AfZRR+Ys2gC3FIqXntd9CXzXfqRGptdG/BQ4c290BTO6gXWoyI
	2jfMCm7mg0umcC+KBngyTjBB3hv6M0JAid17scjmvcB55qLdStZKUlcrH0j5oqYrvnrbXsu840h
	/LIy+5UnnlEA6Ou3lxUewwZKoxlkY1cpxPJQVyBzZwnTWWjPaEFGuL7serGzQGhduKmPNjyDjMx
	oraQDZRNsOWykfxc+Fi+Ea81DLA3iXuKtHQ9Nvjvm65TLfXE/0S1p5lQj7uruIYGivP5c3dgY+M
	xXmQg+eZVVv6sKnmgTkHPNSCFMzVfeXDGL+twE2eDLmgY/+c9S0Lymsz88jErIkdg1SdCdOudAj
	+QkG5/WxT5IiOtOAV9QfsTOiPuVW4nHwATT7hg8cI9yjsn/FftGhcu7jHKWVDnRkhhbsR2rGcrY
	qvzKEKZhRr/oiS2Rpxe/wS8MbGZG8O9AfR0y60IkMwqR/Nni8C1N2bo0L0np/8XsGiaNxrzWcGv
	DlteQmTjwfFjjosigIiQdR27bTQNVUBp8yDU+cGd/ex6xvwdrgM=
X-Received: by 2002:a05:6a00:b41:b0:8a0:3617:b53a with SMTP id d2e1a72fcca58-8bd5cc7ffddmr1156441b3a.18.1794469961776;
        Wed, 11 Nov 2026 23:52:41 -0800 (PST)
Received: from [127.0.1.1] ([116.237.168.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab5f3f99sm3131256b3a.51.2026.11.11.23.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:52:41 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 12 Nov 2026 15:52:06 +0800
Subject: [PATCH 5/8] drm/msm/dpu1: Support wider writeback width in dual-WB
 case
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
Message-Id: <20261112-cwb-upstream-v1-5-a6a88d928aa4@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794469928; l=1480;
 i=jun.nie@linaro.org; h=from:subject:message-id;
 bh=b9gZBtsMHkv6i4rFUNaaYmsibNAluP0D+iRz7WdouOA=;
 b=nriIuNstQpH6u1NeHbBWbbt/EWyGeA/Ja61WQashquCcYkdMxW4+ytxZE/H0TKh/NUh1w3eVV
 VZeK6dZRQ9mC9DpmXS95dnr/dImCWX4Ploqmh5peeRVL9BqlJ2sbVRP
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=O9aRQ3+xXWihQiRRgStCET+eFXx1EZs43Fh0Xh+8Bu4=

Current width limit is 2560 with single WB interface. 2 WB interfaces
can double the limit in quad-pipe topology case.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index e7b09013ae4c..b1177e4bd16e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -14,15 +14,11 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
 	struct drm_device *dev = connector->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
+	/* we support dual-WB at most so far */
+	int wb_count = min(2, dpu_kms->catalog->wb_count);
 
-	/*
-	 * We should ideally be limiting the modes only to the maxlinewidth but
-	 * on some chipsets this will allow even 4k modes to be added which will
-	 * fail the per SSPP bandwidth checks. So, till we have dual-SSPP support
-	 * and source split support added lets limit the modes based on max_mixer_width
-	 * as 4K modes can then be supported.
-	 */
-	return drm_add_modes_noedid(connector, dpu_kms->catalog->caps->max_mixer_width,
+	return drm_add_modes_noedid(connector,
+			wb_count * dpu_kms->catalog->wb->maxlinewidth,
 			dev->mode_config.max_height);
 }
 

-- 
2.53.0

