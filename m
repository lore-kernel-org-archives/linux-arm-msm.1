Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795297283;
	b=DVz7cAtCBipo5kx0mPlRvBz50mww6k1bzBX0Wk2VtwL/EWzHhK2cYG0LdN/oZV/0bodf
	 oPXzLtwhp5W11af2RGFDJcq9qpQyIK5kdxRCJtp9qzeOQh+x67SUpq7lApR9XgZrhDkY4
	 cnyeZ1y5WKcI92tXqfcByiyHLOvdEz51e+B1gHiRj07Ak2tiH6dJBHFrPO+GhvlL73kSr
	 4xM/n/jCpRHK6ipTJBNlllpy+g93ifOdyRQubj6ILYJOlwaFqKk1lXwdpqZfFobx1VBvU
	 oTSeQcTF5RqfZejlISQ3YzqKMJ5+gz5ari0UzeqPtBdy+ZuzP7QOR1dzGMPK2GPXwkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795297283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9WEV8XPKYzcX6N6zxNpHeHidbIcy6IRaF/m/BkLvHTg=;
	b=dd5Z123+Wknf6F7xbx6Ka3r3FNSG7Ahoq0F1Ki1smG9gB2FxCPTwNo/G0z3JvaH8RwQK
	 /gRryBQo1AZddEh0n4UFVT5WjFbt7TLU0WX11jwg4SBMozcKFLcKUDTty7RlUZdqtkwv4
	 Q36h0vC1aVihKuUWQaaujdSCKgARplvTppPHEQH/OkPyHY9/O8LLuA1CIGoA3aDn2zvpG
	 DDk5nIC1dmrlCtP9txxFc7DONFwVEx5TkAE9XRQliSGmggLvNXXXclryEDGfyokgPjYOk
	 WkwcTA8qqpfUXJyOcuxUmIYB1VOsROVI/D4vVA3jkodNUW/QzvOXKptxZ/YJkitEOJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PBWc7NJo;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BAD606A335
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 21:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56BAD606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PBWc7NJo
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so15273435e9.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 13:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795297282; x=1795902082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9WEV8XPKYzcX6N6zxNpHeHidbIcy6IRaF/m/BkLvHTg=;
        b=PBWc7NJoNOTt1LQDytZkrYMrxkqq9vcBC+zkg2mVI8gLeipr4z6f9hYN9Xbd2GBKog
         gTJYa32Epq/sqvm5tM61PDNS6JHlETtmSvw3PbyQ1yHCtY4DLIokPnvpG7SKacDihra2
         iIYk8vJBFEzzvfFxc4yxBnkbseMp/kFth9eXySyiwbYVkOMUgbffkJIXLfKc9yQ9UWNI
         H3LdpDPu0R+9GrxmvOH7GmAZ/4uWf76udAVwECDnWT60WGIpJgnshF9bRoQLBPlD9BXQ
         5MSFCCf6F4dBpCmlP/1o1IFk6L62KEU0+Pmh9FAPPUPDuxLrKcsT3PfdHasoz0hl5uww
         oHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795297282; x=1795902082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9WEV8XPKYzcX6N6zxNpHeHidbIcy6IRaF/m/BkLvHTg=;
        b=hE7UcFNV/fCUV6LL6v4VSutV4naQeleVgcTogim/zw5usHgM+urQeo1+RDbfLeRmPr
         hXRrMme1rMILQJuS+DllwaVhpQpwJbYKsOvg7cOCQIle0vBscdFo1WHWWGIp2H8VfyFZ
         1Jq0ckfO1wlOwlbAZrQ+09RZE2OiD9GuzWdOC0B812TcqRSIvSwSamDbpHtBYML5GE3o
         tzM0XKw+cGNpcLRd/O8kkj7jSQ2yNMrCA3cxkTiNKcjwxHpiSkGvjKgdZvAOF/QuxBxa
         q6YVwAekSN0E+3wgrciXLudIrOI6wjKlguUgZqzNOBO6tElB7i9Yc6MBRP329mEbIhi5
         uUdg==
X-Forwarded-Encrypted: i=1; AL+hErH93Ej9WX1TK9HCyX64zAtwNyVFb12rztCzEZRVoOok7FhY6BmKqcfvwUuEUhivLAwwqPDLAt9WamZJF62I@vger.kernel.org
X-Gm-Message-State: APuU4Z+WtYs2HG29C3N8jGXY4eusezaQuzcDyYUFU7POh0tRwyhK54fK
	12YxexoCMUZp6Wu1fiSv7xM88+7XZnvZ6mRUx8ZWTNaKGTAsxiSO2D0=
X-Gm-Gg: AZFdTZcanYy2eQYa+bBG5cXABehqS7HaaRf20q6vWA0pMJKs3CtL7Dye1ssrZ6xcArA
	GL5TJNjjiTpFp3yHQPLy81Q6uOcRsDtKLvbWrNrlR8hwCGRZuS6CqLEknmD5DEKj41p1sMPL0zq
	d6nuPhahRfbnAEn3+23wQ0CgWAI4PS8Sce/nqr23+Jy9X15M8cwiiK4HLfYQqSb8yRXBZbgnG4w
	qgAjlvjoJ/NVIFftW1DlXPXAmsLpwksNjzLxQEmHb9V3YKai3rHGWVmgkyjbjMA5i4ecUx1oxX+
	vDA8R/PpzclE2UKlzTDCiqVjxZckJbTcj5C4all76ixlbh4xhMEkrQVx4N2E/4rVOonFnuiWSDx
	Ip2uHzuEvtEwZVSfpce2x/F9FbRbkWpzecowvmwEX6i+1IVpCTdmss6/9rdyuTgeac6JTXhtMEn
	f4/x/aIdKjusk12nTGORbDFlFiROVlILNnQGMw+xaupZWBlreIJ2G44Jlbzp3tLMQxyoOVoBhlO
	aClwKoeswYn9vtxAHOr0Lnydr95tJ2DdDUE3yIjMNqEluElQjDrLngFE2R05Qn7kvgV8xDy49Yp
	91PZh3s/2hpyparFSQ6ksEgJfpIQf7mO3C/YDzWm
X-Received: by 2002:a05:600c:3e1a:b0:4bb:6814:7391 with SMTP id 5b1f17b1804b1-4bb8881921cmr147831055e9.25.1795297281740;
        Sat, 21 Nov 2026 13:41:21 -0800 (PST)
Received: from h7015t.. ([193.207.113.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm54580645e9.4.2026.11.21.13.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:41:21 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dale Whinham <daleyo@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 2/7] drm/msm/dp: reset cached link rate before reading DPCD capabilities
Date: Sat, 21 Nov 2026 22:41:00 +0100
Message-Id: <20261121214105.32596-3-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261121214105.32596-1-gianfranco.mariotti94@gmail.com>
References: <20261121214105.32596-1-gianfranco.mariotti94@gmail.com>
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
the stale link rate and use_rate_set flag from the previous sink.

Reset link_info->rate and link_info->use_rate_set before parsing DPCD
capabilities.

Fixes: ed100aa239be ("drm/msm/dp: Enable support for eDP v1.4+ link rates table")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index d3468b73fdc3..c22a2bc9b635 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -195,6 +195,8 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 
 	msm_dp_panel->vsc_sdp_supported = drm_dp_vsc_sdp_supported(panel->aux, dpcd);
 	link_info = &msm_dp_panel->link_info;
+	link_info->rate = 0;
+	link_info->use_rate_set = false;
 	link_info->revision = dpcd[DP_DPCD_REV];
 	major = (link_info->revision >> 4) & 0x0f;
 	minor = link_info->revision & 0x0f;
-- 
2.25.1

