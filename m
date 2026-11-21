Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795297292;
	b=1oTQt1BAzZUS+BJMVPyfAv1JcFJykBCz0DB8FZ+ZKE5NaWr3hAp/8NpebsDWUyDnlw4M
	 y47cUI9TMeq19MtvVBTmauq/BXIR+lmheSCMJS13KBzImfENGtNg8m0GfR//w4MkhjCE4
	 nUxINVnhM8qUHa2xlBOLcUysML3m1ds9oKC1RbNP6rRGtbEAHY4zxh7+hGJorfB2WRwDg
	 PI4n56+lfLIqLofwQ+lgPYjjJilRNIc91R17zGtUXKr6TEpMx1coNZZb1N7TegM2YMGn6
	 SI6FWOYgcYstaXZJacndArh/0fFVfDX4jJMdT+oZIZTOBXqW1uPZl1SCHtOJrAR/LLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795297292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KZJrnhW075oTcwniS/SEMeh1Ea0hVClaPcoOIV/cLoM=;
	b=1X+NEEsisQfgwvLoHmdhPQEVxwMRtcTfEmIE7MBxtlids8iNuvoEn0qLydVQXPXv3Ruf
	 psD8hLxHDS8jNxizJkaowbNvob6uxK4vbwdqv/3ocBB3/w4m5yxRbMnvdIh9HNLkDgNbH
	 Tbo7s6EZJzKXtrHGEvN9LeAj4fpSSXPSosvoItWtkN+k1dl5WTkxVtpVctMF9iew8mrXv
	 Iwy2PsLi/aSBknhX7MHV8hLXsdMBWVVSfvTQL7PYctzWgOz8nCBEqVR+eANNKbrg2PsC9
	 YEU2EZW6BGxqlAMUzxVr4hpCZwhpcbOd9jUdrkRZG+rHMbBaPWkJI1dcVJmbQShXxEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vlIQghui;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3468606A68A
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 21:41:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3468606A68A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vlIQghui
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so18357985e9.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 13:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795297290; x=1795902090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZJrnhW075oTcwniS/SEMeh1Ea0hVClaPcoOIV/cLoM=;
        b=vlIQghuijGYLmXGtu0QLzd4j2TiMm0Wa35pBc8UediEEAGzJzNST/rgdT/kmWROfAl
         BEO36rkOCTDyQcEqsGEzAG8bSVRy/4ljDfMdOrOFEKhSjFdkyTjS5+TafuanLKGbcAbI
         TZ0qKkiM6zgqLyIDGDmDPyzFa6NNg0KLSP9G0ujiG0gUxK03Q9RwAEkD8JuoDdOjUmhW
         ksi5+y0ldwyiaLjELR9rxp0xC4I1kYam/Tutj4Bdml72xq+h1v1JJDnSzGZO73szItAV
         otme12mEh/4aS2qHhaLbGjeFa54BTisS2AkihlKQJ1nQFF4doxe5snaTadMmOFO9k4xN
         dHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795297290; x=1795902090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZJrnhW075oTcwniS/SEMeh1Ea0hVClaPcoOIV/cLoM=;
        b=ODrnxLjKKx0T491wcX/VwJUfAPCWhYSz+cEw6NdNa7By11Kfv1dvapk4mR0e9ncbFv
         7YmZ719xvugCpbOocSF7JIscTXZ9PNkZGfvjpcvl7az77TvztgVa4bTEKEdwjpl6GaEV
         jOOysh8A5K9sBiB9Ea1zXJVCJ5/ySzUcUDflMdklmzREEeCxhGNKyFlry8mgG6kochKT
         QaszHbESD9NuRkAMBYj/czxf5hidlr1knaXvB3lLiiuPcTuqJV0poio0z21xcJcoZAq9
         eq8OlGIL00d5Ltv9IPsutqZt5z0t/LyUCzrdCSDrjvIWvgfSkBmY+rnj50YhtVdR+spu
         fLug==
X-Forwarded-Encrypted: i=1; AL+hErHNkW1A3mf5oxrPl1NXDNM7mIgn3KWiKxNm221FKVncRuxm4yj9o564h5TK+0soetbR5FWj6lLtMDEHKVar@vger.kernel.org
X-Gm-Message-State: APuU4Z8BfcYE53I6DLGKYQoql3zrrKZsJ5rjnXec1hY1gAG+uNIZWdYO
	4glGXmnsxwyytw09ygrk70r4+gEsc5OzkNuo3XjLIao2VV9KG0RraIY=
X-Gm-Gg: AZFdTZfumz1J/xiO9Rcsc0Y+L+zan32unr5jsHt5TEbQS8AA5u1bzh+1EsO1q6i/xUe
	d/wXeUPWCBxRgRu55TSFqzAGqaC8kvBZQb8MFgxTnDu0cK9RXtju9ZNhZ7YqPYngtLx4ObXCajW
	ys7WyxgqL8oDAajuDzItDS7cAPnXRd5DbvQN3nPSt4COPuGQwxHWoA6/9vr4RtDMmljSvZ4AZXk
	4a8fZkFjEO9HTsWO+o3TRt2i9NGpB5D/OubKACFpPgEp/b2VHPgyUx8Hq0sLVFugphDpvbXFVwL
	PFFEEWfFLDxjzxeO8IHL01yR8RgV60XaYyddGBGsWJCALOMcLoIRLg0z2F4uRbDok5sXnXx/E3x
	Scdkf94ypTr8nIY5itLQFmaw6JZWIExtb/TzkZAwhq190KTYiafTiZ/ZEAW9fjqWviSmc18ZeEW
	lkklOTaUZMLOE3NAdM2n6wQi88ZqiFl4KvwXd2eWFDM6Ss4mXlIjXCDuKWriCKpbXBTX74o+wKP
	IiPTZHSHcLSG15TYhTvADfaTOIeaJ8d8oLjidMXsbVi/arhjuBa+3XTVGZPr2Q8g7uettEeN9uV
	0kDhnQ5s6iU9tl3prZa0FvoWXmQIwpQv9l8n+EE=
X-Received: by 2002:a05:600c:4585:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb8882948dmr155127915e9.18.1795297290174;
        Sat, 21 Nov 2026 13:41:30 -0800 (PST)
Received: from h7015t.. ([193.207.113.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm54580645e9.4.2026.11.21.13.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:41:29 -0800 (PST)
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
Subject: [PATCH 6/7] drm/msm/dp: avoid synchronous runtime PM put from HPD IRQ thread
Date: Sat, 21 Nov 2026 22:41:04 +0100
Message-Id: <20261121214105.32596-7-gianfranco.mariotti94@gmail.com>
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

msm_dp_pm_runtime_suspend() calls disable_irq(dp->irq). When
msm_dp_hpd_unplug_handle() or msm_dp_bridge_hpd_notify() executes from
msm_dp_display_irq_thread() (i.e. inside dp->irq's own threaded IRQ
handler) and drops the last runtime PM reference via
pm_runtime_put_sync(), runtime suspend runs synchronously on the IRQ
thread and deadlocks in disable_irq(dp->irq) waiting for the currently
executing IRQ thread to finish.

Use asynchronous pm_runtime_put() in msm_dp_hpd_unplug_handle() and
msm_dp_bridge_hpd_notify().

Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
Fixes: 5043357e75ba ("drm/msm/dp: rework HPD handling")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3a3123dbe417..eddeb972d6d6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -495,7 +495,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 			dp->link->sink_count);
 
 	if (dp->plugged) {
-		pm_runtime_put_sync(&pdev->dev);
+		pm_runtime_put(&pdev->dev);
 		dp->plugged = false;
 	}
 
@@ -1625,5 +1625,5 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		msm_dp_hpd_unplug_handle(dp);
 	}
 
-	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
+	pm_runtime_put(&msm_dp_display->pdev->dev);
 }
-- 
2.25.1

