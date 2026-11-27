Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774471;
	b=edU2mNYLG5801vmtqD4RbaujgRdOiy0ME15FoJYfZme1IOJ92HttksJNrgveYgx9tnOw
	 iutZVIs8bSysoOej26gVAI8/OQdJxAMFZIrAZvL+gW/HS9zbEasRIWePFA3IqnAX74YTu
	 TyvWrX6gIoT5WeSVxV8/xqZldDjSj+2CbKfKadeWYnVUVxzGBzoNnn9ZsFlWOp8Tki7o/
	 b2Eal4oiMDHclLJRZ8wW4g2GdSMRk+YjglzeUnNVz0u6/fmXVdgMWenQd699kOkyxn2E+
	 9nG7j2H8SWVIqD1C7dpLuB8E9nIxbWqTNhqnmVbNDXMZkefzXnCAZDXCQp+7lOFaLIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fJUOBB8U95qqxwIcvt8j09z1Ro30l4rqtcLjgd7Ggo0=;
	b=D2i8tO3+8pYWgOTHJe8VuULB5X2SWb6qtbhW0YbsVSVeM29MDQIfyUUSiruQPHJWx849
	 DfTzEvy9WH/LPs6hPJD9nQi80GMwQXn6/IsgOkDuXkRlj0vwbee6+YKuNfmyijJp/qGyz
	 63wVF/2/bG7CONcXGoKPu2pnGxybBKRoNWanDEdgvdiHxQG91bEt0WA0AFfx63Zsv22d3
	 f9h1Mc2u/g1PRcaday8bddXuywPwy1YGgdcHthX1DHn+H/ffWAmvrcObJ2kBujGCve/j9
	 lWPqE4eUG16IGdI5UC+lCmRH/95c8aV0enIvBX+bHBAupnemiJFmgmDehMXNPU3xxgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IilvzkAv;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940E56076C3A
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 940E56076C3A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IilvzkAv
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49465892f7bso5790833f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 02:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774470; x=1796379270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJUOBB8U95qqxwIcvt8j09z1Ro30l4rqtcLjgd7Ggo0=;
        b=IilvzkAvhsgBTt47BiBoKOVmYJyeVUxy9gzsDKiu2ouCFbKX//wImu0Jyc2yZbHSgh
         c+nRkWQuYL1Tn/NDbaEK02rYlIupV8qiXghduvAEktPuemjKPmVpXXP74XuJzeeDJWqT
         ci/0kUKykDQ4OXKYNhnFRmA8eMSc0e83geGIhODU3YndMO+7gQs0P3Y2JtdV5j2fnu3g
         g+V6g3UvzLbKavBBpPcE1Z8yEvbXz+0zXSvAr0SMaKpXzhw5I8+LApZZh53nVOKtk4nW
         uhkV3T82iBH8WqmrBX1w1olbOFSegsbv1waZdy2luMhlV60vMH9R7/9/9vUAQD99CBOh
         Hd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774470; x=1796379270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJUOBB8U95qqxwIcvt8j09z1Ro30l4rqtcLjgd7Ggo0=;
        b=csFNUe9EZ+K9fx6ROf2G8UWaHAsDQUctkwsvcFj4D9tL7n8MQo006YNhCt8Xh9gIrb
         Xsf0/QIxa5lJaDZvzXkrhIlkk8XZ52bCWXMCx2TCGJaI8vMazKtbHxNCc2xbM7ep99Ck
         RD0Swk+DVJUBknUgWH8Kdf3jA/dYMbLak+6c+5Pcix7akipjgHpNuy5YY7kWtwtiNH/F
         UkDPmJjrO3V8BgpfZyk4FX9jkqi0ObKXkj6Tgkw98Le2k4HByhEw7MSk3JUcYktocq5p
         M/EI0kqqUVPGY30QEDHqMWGd8jDAruyFBbd5BVFi9COn0xlohyQYACxC+0fI9/mORaky
         2cnA==
X-Forwarded-Encrypted: i=1; AL+hErFh9EShh2cHJFOusjmz0cJO4GINyie2nnIOGnTZBfjmP7GhQdhx0/UD8Va+2/igxEqbh0UseS74jLJS4lD3@vger.kernel.org
X-Gm-Message-State: APuU4Z+z8bZEfO7E617G9MuEVWskA6a2SRcWsqxkGH86BNpsxzSvRJT8
	cLsXy6vQubBdW8baH11XGoyfQR/bL6aNS3ju90R8UCShbUIZlQ9ZQw0=
X-Gm-Gg: AZFdTZfpzio4OkywrxmY4fnb0ZwL/UAz3MlmrOo4f7CMtocnmp94Om2SDNGGiNLbh1h
	zFfFPVzwhH4n9b5stI+cAQemnULutaqtRfQVBF0Dt+PrhKdh/WydlWwcYhXhhocAX1S3D07uR/t
	UCkPs2JabsUOCaawcpkYi19iNxjpObHUSmnkkxRy6tsPtwvFqwG+p7ElqlZxjOFrGfTPqd5VWjp
	dF3Nf02Jjqt5gB6JQqI5a6/QGJAfT9CdEPrkhr3Ax0NsQJZWp+CYnvHdOOqbeiVm2QSw5RQ4lhN
	zyFbC77PjGbocPGZxF7hAmjMoCiYdUjWGy8ZF/j5nmZnDcPt8l/3clxsVjI/ElGNJPUAjnTg9KA
	D83xd2lOTXQfr7FmVbDFPTW2jQltrKAlFgNERk+C32U8J7uIkaSu5qj2YbwYq7AAlJB0FHarzbT
	EXPWeGeY0gjOupQXlOM0515C7CIMIDYUcggQw4FD8evQy+e8VP7mBQbRXauiG/NmmSvjyGBa6Z1
	EHy9EG3t5CAxKmU8IEV91ld9QXZXLA7yfdLPf5lU7+7H4CkHlnLotjxflXYmMLqUSzuFjj432Sz
	3YhhlHDLclLfyw6A4IHkCxW8FfH4C/faAZWiMqtmGR7c4xTOxGdi09Jm70A17tJiWETkX3ZBd/b
	51qneZG8EFE9HaqpAwIwj+4n0Wokq1j9Iw/lDvuM3Bea2e4KUZOzjH+506wYqdVx6T3DzixUzTg
	WF3Mu7cg==
X-Received: by 2002:a05:6000:4812:b0:490:88e5:92d6 with SMTP id ffacd0b85a97d-4abb57f6e95mr45513944f8f.49.1795774469450;
        Fri, 27 Nov 2026 02:14:29 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm43651234f8f.26.2026.11.27.02.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:14:29 -0800 (PST)
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
Subject: [PATCH v2 05/10] drm/msm/dp: avoid synchronous runtime PM put from HPD IRQ thread
Date: Fri, 27 Nov 2026 11:14:12 +0100
Message-Id: <20261127101417.24303-6-gianfranco.mariotti94@gmail.com>
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
Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz> # x1p42100-lenovo-ideacentre-mini
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index b8373740275b..3c15f984b29e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -495,7 +495,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 			dp->link->sink_count);
 
 	if (dp->plugged) {
-		pm_runtime_put_sync(&pdev->dev);
+		pm_runtime_put(&pdev->dev);
 		dp->plugged = false;
 	}
 
@@ -1627,5 +1627,5 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		msm_dp_hpd_unplug_handle(dp);
 	}
 
-	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
+	pm_runtime_put(&msm_dp_display->pdev->dev);
 }
-- 
2.25.1

