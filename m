Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792819200;
	b=AQtSBXOCm32x8lsh4A17r1TDJTLjKOR/X2JHhW0hDSuBhW4G34CwqcS2qXO63CX58Cp3
	 hhRtMYgsqbBsgIhW3KmPTHt/3LGKxdqQyn5fYu22ZaDnjvs+3+3p3hJOlRZVKaIdzefaB
	 GVzDNzEJJ6Zwn4O2Y9GC/bk2NLEjHpJ42L+ySqiMC5M2e+IYMOIbziBUyXdREXFeoAQkl
	 NS16sAgc78sl7HO/yVxFET+upWAQixYf+fs33doMkRTmTXmn0Rd2CfAA5RVFgrboiBoVN
	 HBZ7gnJbyiXQMriJha+44wSSAmlrA6+T3SDyuzLibU7qljn6NS7mIsLOgr+MMWnsmhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792819200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fBJqAEswmSE5diZ2tydC9GmlpfM+FyzcsAh2j2PMbx4=;
	b=W3eqWyRNJGBMQaD6WCon2/bJTNDnKuIAGhv3HyXNQV7qUrIhx4OmWTXi3XXvw4jx7fej
	 q8BP44WbzAC93JN9zlylLxhAqdDkdw9Diac0hSQwmQTMrpcDhmi6EI1h2R+xRDbgTztP7
	 xCZFmLtLwq7QzO1APZO/qvgFU8oKnINjlMXl8TcYsaXsxid9BiSU3bnD1fMrsfi8CdjYq
	 KLtPnHO/PILCiEt6GeIjdMWOGfYoNFG8rJG3sKlq7EUjd5C72Vl/xeqJvcKwhiwHh2hfM
	 E8Me9YGrVPaD6lmEfm2yhpJIVkfuIyvl6FBCgu9S3br5RXq58SU0U4a+w8IKXZRsG3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J69tgr+s;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3912E606A31A
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 05:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3912E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J69tgr+s
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so694713a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 22:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792819199; x=1793423999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fBJqAEswmSE5diZ2tydC9GmlpfM+FyzcsAh2j2PMbx4=;
        b=J69tgr+snbLUEdiCtVBtlylXGq6D5ivjGJZ2MKRec+C/sQP6YRMkEJB891XQOZ53sq
         F17WmLp3YSMojh5vjm8We8V0P81CZn0fKw7na7lTnWek7D6tJG/5fhS12gnKuTZybkDV
         ZxvHos3UYOso0IKSj2nGWZhJzgZ5fLaRGzyv11WzcBhA4MOIpMz7hzirxMowzvcP68iO
         J54arCBDV3b6v2nMCMGhz4MIx19qhN29L3RSVre+tRtgv3ab00rHNn69zgSnJc4u0TMK
         xbFnrMAqX9n/nlvPE6P44DnunwqgnZ1ZfvbirreRKlabYR9HBMw3Wue8X37i8Qydic1h
         At9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792819199; x=1793423999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fBJqAEswmSE5diZ2tydC9GmlpfM+FyzcsAh2j2PMbx4=;
        b=2cfWjOSpSqm1wQ+5JvCaPUcR3SIwfioU0PnPz+Nx6vD26lxjVzyyZvUbzgqpLG+vqh
         cUWylj1R+vSfjeVWv6/zMamrkUUhtd/Iy7LcRbnOhvEWMaODGWpxLjTMi8351olynEp0
         zZ0oIlT8vP3eakCzqvs3Ubz98duZTppKPEzsgZzmG3jjHk7Yzge2JwK/dZUYYmHSaJW4
         y7V2MzieF98OkzUTakxyFUmi1RB7gUm2Zowm/pafLM/BdXAa4iQlMhOtKYSSUmhmDw8x
         5eeRU7K4IuFGbBxt1VRCQIQ2i1YhPfotDQ3PhC0yDZPWlo8uf27thPIFmtCDlObd8Jor
         z54Q==
X-Forwarded-Encrypted: i=1; AKwUvBwHy4Ns8PO8nImAg+QlQ8yBbDOzRdUGvH1c3quI9OUGF1ywQW4MQVlBMP6G4ISCG37bPlAmGnX1PkrgOHe0@vger.kernel.org
X-Gm-Message-State: AFq9FYLw4OkM9X0u/6XMLpSD37az+1hhOrKUd3wcwTV28ZW0H1Z9XyKr
	2YDDceKdfvbF+h7+oCAqvtzD23s7vvgCYz+2GktbbCQq3Hh0K3OSYKUx
X-Gm-Gg: AYBFou2RfPOV8/ZXlbSXBmoQ3CeV5O/9dXGzDX2MyqQQEtMGhU10/+NMyaOCbUNbHfP
	b6W63Db3risgTnnRS1Er6AM0JcHUpFC5OnAU2sUBYGiJTFRyuXz1fhQtBNwn4oemt/yeA/L3Y4P
	j1u3QsNYIyhtX+silQhjj8hd7i/37zzj0H3TNU1LmOGGwYVSqXH3kVLcGq2jIbhYmHkvG/eWLYw
	2FJ3pgiWJ0Al8kSSQO194JqjghGTo7v63Uzp/HSqk6m+Muw7ukIrl/2+6N3HKfu170K7KyTOHF/
	fyBvQm0ogqETYihdddCPpMPev6n4a/02xMY339siyq4zImURyrU5yDBdRS4SlK9X0Y6MOCgOW0h
	Kv1VSVUyWfj9e3TNrUNUm3Sa+MG+rzkDhkf48rUIPHYE9ILHhXR1op2dKUKiRUPGOv/VenoQ66m
	3hKY8wA3Dhxgy6GFCdtgacyVE7L2Tvoq1ttstJJB83AXmOUkJOIyAunRSq/37JZw9F6mB+SILAS
	W4d9UVgjxt6FgIBfO0ggvlKJiBtOGoYQlG1o4Jh8X2QU/9pp+XsUHCQmyFuajBgYylagM4=
X-Received: by 2002:a05:6a21:1f83:b0:3e1:1faf:eb73 with SMTP id adf61e73a8af0-3e7e84e47ebmr598064637.38.1792819199414;
        Fri, 23 Oct 2026 22:19:59 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36ada2780sm241619b3a.20.2026.10.23.22.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 22:19:57 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: robin.clark@oss.qualcomm.com,
	lumag@kernel.org
Cc: abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	yongxing.mou@oss.qualcomm.com,
	val@packett.cool,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/msm/dp: hold one runtime PM reference per plugged state
Date: Sat, 24 Oct 2026 14:19:52 +0900
Message-ID: <20261024051952.2006-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

msm_dp_bridge_detect() takes a runtime PM reference and keeps it when
it leaves the sink plugged, so that the plugged state keeps the
controller on. If the sink was plugged already, the plugged state holds
a reference, and the new one is leaked. If the sink was plugged and
detect() finds it gone, it drops only its own reference and clears the
plugged state, so the unplug handler skips the put and the plugged
state's reference is leaked as well.

detect() runs on every probe of the connector. When HPD comes from a
later bridge, such as a USB-C connector, nothing else keeps the
controller on, and the leaked references keep it and the MDSS core GDSC
powered after the display is unplugged.

Hold the function's own reference for the duration of the call, take
the plugged state's reference when detect() sets the plugged state and
drop it when detect() clears it.

Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Depends on patch 6/9 of the IRQ_HPD series v8 [1], which stops the
plug handler from taking extra references; only detect() is left here.
Dmitry, feel free to fold this into that series if you prefer.

Tested on v7.3 with 6/9 of [1] and this patch on a Lenovo Y700 Gen 5
(TB323FU) with a USB-C display: booting with the display connected,
plug, unplug, quick replug and s2idle. The controller suspends after
unplug.

Changes in v3:
- Rebase on [1] and drop the plug handler part
- Hold detect()'s own reference with PM_RUNTIME_ACQUIRE_IF_ENABLED()
  and take or drop the plugged state's reference only when detect()
  changes the plugged state [Val]
- detect() now drops its last reference with pm_runtime_put() instead
  of pm_runtime_put_sync()
- Link to v2: https://lore.kernel.org/all/20261007155848.106-1-26rote@gmail.com/

[1] https://lore.kernel.org/all/20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com/

 drivers/gpu/drm/msm/dp/dp_display.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ed899fcc9189..5f9402921efa 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -908,6 +908,7 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	struct drm_dp_desc desc;
 	bool phy_deinit;
+	bool was_plugged;
 	int ret;
 
 	dp = to_dp_bridge(bridge)->msm_dp_display;
@@ -915,12 +916,14 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
 	guard(mutex)(&priv->plugged_lock);
-	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(&dp->pdev->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
 		return status;
 	}
 
+	was_plugged = priv->plugged;
 	phy_deinit = msm_dp_display_host_phy_init(priv);
 
 	msm_dp_aux_enable_xfers(priv->aux, true);
@@ -970,7 +973,10 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 			msm_dp_display_host_phy_exit(priv);
 		}
 
-		pm_runtime_put_sync(&dp->pdev->dev);
+		if (was_plugged)
+			pm_runtime_put_noidle(&dp->pdev->dev);
+	} else if (!was_plugged) {
+		pm_runtime_get_noresume(&dp->pdev->dev);
 	}
 
 	return status;

base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
prerequisite-patch-id: f2dbe1f42c357bb1d32081f58660ed1fac8f7777
prerequisite-patch-id: 358e5f35d442041b88e52d8e39a564a053a0f990
prerequisite-patch-id: 9860b9acb12b1c2652e4e9f4860968a2ca3361f0
prerequisite-patch-id: 53486e695198f785401740f7f4372bdf335fb620
prerequisite-patch-id: c8e551a07553f7dc107063a1dbec1d415184f97b
prerequisite-patch-id: 1a6251919897ca5e8b12a63774a833fd8460c67a
prerequisite-patch-id: 846ab694795c6bec123d1dc46d7a53097bf594bf
prerequisite-patch-id: 2a058aa8309016f424b1d4ca19a9b20e92f4d8b6
prerequisite-patch-id: 76ea1ecf4e1d83ce2e5730aa36ed1a4524f15e56
-- 
2.43.0

