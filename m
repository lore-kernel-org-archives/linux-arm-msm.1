Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469946;
	b=FChLuDwWiLVL+k4JKPlP4ZBEXa/fYXFYnQ33kn9DWzRtARXyfkzLvGwOnF5n3E6ip8+9
	 krFQqwoWGwLqr/HLtTAGRPuLIIxLgp7/2IWS5IOwSDEp6n1STb2RD9XErm8+qGlDIi6ip
	 8UPVZYVLIWcaLhYOLcnUE97VibsLB+D+/BzeMmAK5b/18HzkUnEUKp5N2Vwtahh/szU3/
	 UV9q3aRyWrutSG//2kQ5IoRgQ8pEl7uS9pex4zD3sj56QwJV6PDp3fM3rRiGR8TM8pE1C
	 qIdR6yAUQM06EGnrN2uJeADx8cF5DEZqkdMIjvfFYcStimdSXIBeg6J2inp5CstLUvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=MeMBAMo08wUuxPAalzAqVHvt8LiRWsl/qLA1LJ6ugek=;
	b=kPypPqIf4m7TTW1VkZO/y6M6BopT3kRhcC1kKN9tH+X6kWbj45L7nlzwyZLTKLSPm0dS
	 rA1yDnc2rIyVDejgs3o0lNOT2PqWvTPL1wZ6/hSQfQMS/N89vbPHaDFwfQJ1IO1r/PKOA
	 GA+a/4avFE/g7BzdRWVIi70Y2BkF/qqYOBC7ZdiPcEPJFqb3fnlAgWAtYtf6GinYDbQFv
	 D01rbWx5wd/H1OEi/95WQ39OEaz+JxVpQWjf9l76Oqy+cVPEj3uIfw3YJTl9jJdNpuh8C
	 d7vrZCKVby6IrAt0z6htz1tP7itArSaBiyFtTPDU/HSaxyy/uDP+V91wtgWxHT58tCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UBogsQ3f;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EDD606A327
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 07:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8EDD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UBogsQ3f
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so3238124b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 23:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794469945; x=1795074745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MeMBAMo08wUuxPAalzAqVHvt8LiRWsl/qLA1LJ6ugek=;
        b=UBogsQ3fw/cqvqtoKAvJlqGEJUrT2itHn8Af4zANdJo8MoF0/opJKQp1XQTWANstDD
         1Q/jDDORIAoitLul2Vxm2qNciEXMM0BOznAlIznUIYbTzJrP0i+uqFHH/1R6RzV2FFeV
         EmYCxsmE5DpSjO6fCRnVSOMrazqb8xRNOyqJ6WQjK3EbVRMg8WvFzjgUK4MZq1uH4ttb
         LK/EbgOJ0T/wn/efzm/m0QQ+NZriEQQ84CaCk6ZqhNoN4C0yoQuCFvipyorLzkaAsEGg
         ltOaE4VhPWDnk1jBrazmT78qoXPE6HqDn9ShbF6N5QOnq5TiCWeI0i46MY0UJKg91h0D
         oriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794469945; x=1795074745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MeMBAMo08wUuxPAalzAqVHvt8LiRWsl/qLA1LJ6ugek=;
        b=xdtehqe3kDaT3fDNaIZFjmLuwTAcWtCNJ0IuC8zwrChL2P08KFikXBri9SDtQbvVv2
         wiVKqKJHdFv5TnJ2NlI9RmoCNHMoV1PxzoYrjHGwoD7mOSjgT3+nFN6xzGTVPBU4dHSC
         nJ+v7y+hzjkPX+FZGV2thrjTrL7jAla4J28akdrDc3XdMNQIsudabplmc9VGZnK1iu+N
         OvifJUHGjKb8rxoRU0JTMtP9AMMZQAl7cBC22d2iYvhoZ8tCLbRxSOQkzJTaP3mdYsck
         0GdERhRMaSWDUkKTzucsChiyuNUViiUbckuWOgRAh2Lctl7lxWrHDgI+hPIX7lcibyF0
         a66w==
X-Gm-Message-State: APuU4Z/2jmEbgmdGZISvpaEuSposWCPnEhdVoyOGf8cx2H21zW9GQX4R
	i92eUQ77swDVi2SJLxuETUxuMiVsEa+6EFFHFiSmdY141yhSjlctP5xaN/mS6vC5jfU=
X-Gm-Gg: AYBFou3NsL+Zizi6dOmyWp/+BOQ0h1Dzpqq3ExIDewwDbl05CbR/095yiq3S5Yzm4e5
	tN474D9fVfj8F2rdG0c9oGEwFvvEhQCGxUhJnls6KdouBZiuNAqEDtD1X1otRlWv2Gwo7xnvLND
	Y+6ZhN/ctMVeG4xxsgF3uOdfmWi3LuEOfDmK3CrwTiISTyMkpb/DEM7vLLSW2sOONZ8WVrWHiq9
	KbUM/oxtoV2VwHAuuf9+QiqtqbMAS6r7ucXGqpEqQcpfsxrG7Q7WxcwSR2JKn8RydBUhYsqnkTV
	kKGHo6iyBspjgHDX2+sx1dlphXT31Y6dJYgE55nIjqzHhzlJlCergFN4UjrDuV83DIJWYUe+Eut
	ujok9a0+mkmq2IImpEGFE6KHxdqtDRC0yWQT6Qxt/uoXBRizCS0PfP5GXlmTjNmWwSpXiRMAoQp
	fo5CCqLY4IHBuHquwq2Dsv8N+PiTfqQ6KDgjYqIvgoRc42OxUot4xixMbPSZ1NALM4wNhhUfb27
	1iJGtvAjPP/5ahCw8U1OaCYEPDhu8WbJPi3d+A19WpPNvYoKym7SgSz07orzNrb83NvfP88+ZM+
	9Jm84yA8sjGjiIzPOYZS9omhLAauWQ==
X-Received: by 2002:a05:6a00:a27:b0:8a0:76ea:36e1 with SMTP id d2e1a72fcca58-8bc1887692emr4823477b3a.7.1794469945271;
        Wed, 11 Nov 2026 23:52:25 -0800 (PST)
Received: from [127.0.1.1] ([116.237.168.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab5f3f99sm3131256b3a.51.2026.11.11.23.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:52:24 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 12 Nov 2026 15:52:03 +0800
Subject: [PATCH 2/8] drm/msm/dpu: do not use DSC merge_3d for writeback
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
Message-Id: <20261112-cwb-upstream-v1-2-a6a88d928aa4@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794469928; l=893;
 i=jun.nie@linaro.org; h=from:subject:message-id;
 bh=JycUzHXZbsiOgnzk6rE/otCXrlxkOXnmr2QsNNi2O6I=;
 b=LQqbXTQ2wMNTqJqqSec4r2cPKc+hwkaUa6aAoVc9FArjsp/chYhwbrHeYXtQunux8vdhNvuWb
 4/TnnWFTb2xDJQ1E2wtc7Zn5+LoI+PVV74D/zYkWWH7p6jg8JhO/6iV
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=O9aRQ3+xXWihQiRRgStCET+eFXx1EZs43Fh0Xh+8Bu4=

Writeback does not output DSC-compressed data as it is meaning less.
So reject to use DSC merge_3d for writeback encoder.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 53d0ece792f5..d455845ba14b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -624,6 +624,9 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
 	int i, intf_count = 0, num_dsc = 0;
 
+	if (dpu_enc->disp_info.intf_type == INTF_WB)
+		return false;
+
 	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
 		if (dpu_enc->phys_encs[i])
 			intf_count++;

-- 
2.53.0

