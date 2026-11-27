Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774467;
	b=fbODyc8KqDZmHuleA3C45ra+15P2NhY/RLPQtUuaQXQcSAcbVS5JjMIZHm9YFC5ywI55
	 QdNw+PMYlzlTycvSdzySAceicZDVmgFx3gujN1fpmx55rB9TrFhlYOHOCghSPdxXseiS+
	 gE8qcKKjvocqMVKlEHTu3WGkqcTRZdX6l7b00rxg+QAUJjz+q4A1WvprD/Cs63lwH4pr7
	 coZ1Y39qlCdCLgB7gHLjZ508ibFWq7RR08Hnhdn0gLdVLFfzmYR74yG08kK+URoFYhH2S
	 dZwH89Rb8yv0FjktyM0cl7TQJZKhZMIkhCK1yiIntOJiY/PZD8B+xMJtvLGnlWijY1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=K+81Uiocp4dxkgsx2JTIwt2UK6FDgoo8FjodVxd3QpA=;
	b=AHyekXcgZJaYocAjZCOfXNvwLN4KjdeFTczxSErDNIIy25KlHVD1D9ibYE8VRofU4LWR
	 pAs7iVj0x8wP8JXjothZL4tYxDG3I+9c8yqXFwlhkhpWqfTGmT566tYRquRJM+RiMa88K
	 +eCVp9d7+Ue1noJNxbOuEEDgX1Sn7xiGgp3/eHN80kZAcMWADClcUQIxO1/Bha8w7quzf
	 usFK9jkf0qxCZ8pKBu6IGzhijmBzsfahc/X/rEdLMaCkxPRixSM8DV5J+rW15+ROhCgXz
	 ww6SNeOH1x4v0rkFiM1j5UE8gr+D7ajBBlfSMWgR9bPw3XXrJ0HjCWLmCIf/dugJZ5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yr2qcLJG;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A96606A6B3
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22A96606A6B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yr2qcLJG
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso4976440f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 02:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774465; x=1796379265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+81Uiocp4dxkgsx2JTIwt2UK6FDgoo8FjodVxd3QpA=;
        b=Yr2qcLJGWt90C913ZTcfquLL9V1ErCVRN2Q9iByGp/xXDu4kOTiQ4za49q/1r9+X5H
         LUuyKJjbq9XNsoZPwPvbPOk8eRy4N+SUg6v2Tk8MlQnCEjWsMZQcCoGYZFFEu61qKJ57
         yHs8PiAGCxnflWvLqcTduOHw615SH75yv6Qhv+HEwLb2YnrYeKfprlpUIpnlT+jyCzz7
         4cPJZ0GcCSeYME5VZ/fGjdIO8RTMW2PzMe6zqE/J+SMZ4gjVTHWHb3myvz2kv8sUpmwn
         l20qWPJN2UIdMYgx0N/aVLIpAQ7letKegMjBCm2+p2CSb8tOUbPJbhiPxZSol+ldFJP4
         MM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774465; x=1796379265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K+81Uiocp4dxkgsx2JTIwt2UK6FDgoo8FjodVxd3QpA=;
        b=U0/P2IuPndokRipwcWE3ltBLSXojLpITpcUJ2ue8UiwSlMjuWDkh3nFgxP2ufKJR/9
         DfeShgC4WfFi+EQ58Y1W8pA48H1NZnGBbrVBw042Jf49e+D/R3t+9NaWv3v9cy7HBvBw
         OBHh94VTOexCnlv8oXuV1jLd/gqspWfBlGn7sap86zq0hnGLj57Kn3c3bZeAqDddiVH0
         lALli/7zJt+CCV8hmHt1Vu2t8tlAbASHAOvBdhyRaoq2n6CFKWlGNZ/HEIBgM4NarYip
         CJb0/NtRr22y9XqqQzFkYWPgPfefOOHInq27T1d76cBtzrCN8KPqOMcZSmVGcGahVwbE
         satQ==
X-Forwarded-Encrypted: i=1; AL+hErF/nCxNViLwCA6iaq6HvK/yYiPJ94eyeX2yBM2lo9BTzCBZrt04MjfBllkByovrTrKE0VMwmnGe3F9ze4Kc@vger.kernel.org
X-Gm-Message-State: APuU4Z/sb3iZwXdvXicg39sH0MwdThT18LvBKQVps5yfUW77dlF6YS+u
	LaCLIQM6x5/wqRrxAvXDinyq0QumzpeID4kWd9rzF2hOx6TVmsGvL/+z3iAiA/Vaqw==
X-Gm-Gg: AZFdTZeDzEG2jW/O2oZArg/0wCA8chzmiV6Us2J8LoLwe/pQVHzx1Y1k/uVWlgK/feR
	Yjho42RcaGFsYGxU6dwvrITj6Muk1grEOcQG2Dp8VNnWYgtbtVuoI0uJKvj4IL81OjAKnAkrRDl
	pfvBSBIdwvws5KLmemoYjXQ2XuPq6qdhiFPo1XWtNG+5WYgkcg5h2/wP91TdeAYv9cG9TGdKTKn
	m73veGj8+ZKbJMdRD0AUH5+nYY6XpJmGbgZsiSFkfADYb7yxkzKdMUv+PdzK19gDvyGYRANjUnt
	FDvWvtjGeY38k875TgpT/V5kwJmx14BO+BOQTA0gpb0LxsJxjqzaEmXtMXKPqYXCtvQQZlHFYNU
	hydbkI3ctic+4/nse/g55yj0ISfg9W3zyhstlQ77/FMJ2dSkqr4CAf/tT99u+iln5M5EJQd5Ieb
	rp/xI/Jdh9jT6qsN0gm8TKTf0VEBHBfiHen9fqELTmULAQdXQJrlInsovZsRZsnxIIUBApNZlIp
	l3zVjefrPiQSPQm2agIIWZyH4uWNBI/rGZSkIif/F5DHIgoL4z4RuVjYomAwjmD5yJrgkYKSeZH
	9gZOorOz7+8IdJCF2NDLb+H3yZ7gYutrFvhS5T7joWLwryZJ0SdRjvhYviDjFKPBo3xFrYLtbDC
	vYJ4YXcjwrdXbtUjl21q+HnhwI5XzHxmeaBB8H0DbfWB2qnLeHJYGH7YOxDE=
X-Received: by 2002:a05:6000:188b:b0:4af:e519:ccd7 with SMTP id ffacd0b85a97d-4afe519cf33mr36813384f8f.3.1795774465333;
        Fri, 27 Nov 2026 02:14:25 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm43651234f8f.26.2026.11.27.02.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:14:25 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
	Dale Whinham <daleyo@gmail.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH v2 02/10] drm/msm/dp: reset cached link_info before reading DPCD capabilities
Date: Fri, 27 Nov 2026 11:14:09 +0100
Message-Id: <20261127101417.24303-3-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261127101417.24303-1-gianfranco.mariotti94@gmail.com>
References: <20261127101417.24303-1-gianfranco.mariotti94@gmail.com>
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

Commit ed100aa239be ("drm/msm/dp: Enable support for eDP v1.4+ link
rates table") guarded the drm_dp_max_link_rate() fallback in
msm_dp_panel_read_dpcd() behind if (!link_info->rate) so eDP v1.4+
SUPPORTED_LINK_RATES entries take precedence when present.

However, link_info is not cleared across hotplug cycles. Once a monitor
has been connected and link_info->rate is non-zero, unplugging it and
connecting a different DisplayPort sink skips the fallback and reuses
stale rate, use_rate_set, and capability flags from the previous sink.

Zero out link_info before parsing DPCD capabilities.

Fixes: ed100aa239be ("drm/msm/dp: Enable support for eDP v1.4+ link rates table")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index d3468b73fdc3..e633afdf2b47 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -195,6 +195,7 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 
 	msm_dp_panel->vsc_sdp_supported = drm_dp_vsc_sdp_supported(panel->aux, dpcd);
 	link_info = &msm_dp_panel->link_info;
+	memset(link_info, 0, sizeof(*link_info));
 	link_info->revision = dpcd[DP_DPCD_REV];
 	major = (link_info->revision >> 4) & 0x0f;
 	minor = link_info->revision & 0x0f;
-- 
2.25.1

