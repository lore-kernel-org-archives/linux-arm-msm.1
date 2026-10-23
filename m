Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769518;
	b=mJ2/tjDslegYoHqzqqbZ66WgeyliwTGtxQ5PNZo3gIkN+Vc++bEU/IBVQBoENeXDFTAz
	 CanmAUKpG0o/DJdFQ0q7WQI9eygp05XM4QBtaHsaP17ktL9Tov84F967bfg1WHipSniR7
	 2cj0y+hJv2cIhNvWL+c16FI61wUhvrwGEOYaCVESkrD8ob92IbDMZ/UKMX/aDQqKM5BlX
	 6Kuc4A7LAuVJV0lQPsavejJF6iGRExfL91JFnJJuHZl8eEXvpO+irqrCBtJjQ2XJQoJkM
	 vbeJJn/oZRKaGp/auWPs6iZEnKkoLQ5NsRIcEPK83KPy7ONrtmokGGN3wzFcZ5zevEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769518;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=X0RAPtvLQwr0f4zYSkwfWymS1oxVdn0ZzLk5Jnrs+0g=;
	b=r0kQ855ZPbLSXn88BnEHCUvbDWAlYdKvs99b1YS8L+MhraTokxGW3mis2ZfFZT2GWcyI
	 rr05NLry6LUCb7qlrCegnJfAxLkkKQZBJ67eD1XQbmlyKzmoYdzfa5c/4VCidV/W1RoTh
	 lhAuhjFoconKXAz1mucH6MyEm+dg02J7sTUJfjTWUJRz45fminvD+fD5fAT+W0cxNLCWS
	 FDHTUo0BHUQOF0I98y9j+xbSKvXg50ia0lyt0vQ5a4Y0M0igbKZ+kk2MJnDMrqTf4NsrO
	 kZfKfo0+2Qcgzj6DjkXarTt5ObMhYnYJyfH0SN8OV3w6SAk0MfTNw6YjevOs6w+cm4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mYiHOJx7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ipOT7uei;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C0B60A2601
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24C0B60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mYiHOJx7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ipOT7uei
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE67jF3019023
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X0RAPtvLQwr0f4zYSkwfWymS1oxVdn0ZzLk5Jnrs+0g=; b=mYiHOJx7nxAPfLHn
	b7ASTqQEyOGZjEi9FepmOGL274DHViQKxhFSCy8GbcxMcZS1U6N+40dgRZUmu3Z0
	Lf9GcwmjuoKGIDY3IZjMefGu7NZl7Mh4r3KSnSLYjh2m99d3BCtKAtMSWwuJg2rq
	+DlnJe4ioW6hhQ0A5wp1jA+k3uJxdYewYdcKi6TVnWj4O0tVtD1YmshNvAU5C19V
	BF93yH4v9B4LvnV7vPtbHMsvAh+P3EVs/K3EoX3o/C/7nrhAe1+Fdlu5QQbFJBUc
	qcB6tV9y0lMO9sOjBeztGpNZQKiMsfEyDld7ruLxXinz47kFXQ+p29dIC207x5An
	fOKX6Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykbrjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:31:57 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc0a64ad59so157632137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769516; x=1793374316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X0RAPtvLQwr0f4zYSkwfWymS1oxVdn0ZzLk5Jnrs+0g=;
        b=ipOT7ueiNkTL385BiH7bvXsxp4rvxHSHqLhqtSp1DE0+WWvyedKFwtJq6JzocGFAKl
         99dgN130dqW7fRWZDHHQTSuntGTDpFWiW94X7RDEVgi1L0YesoJxqwyzh25s/wQ0No/E
         e8EUMCidhLdmA8F2Vg3O/eSUFmRv/31awTFJwPoiGspURk0BPyZDZCnKda9HCqoHcAzu
         DFEiQ7aniJNIKaMMRj+IEVlR9ese2qJTO1vgc307W6YTnYzByYZePsS/rB8ODJvxKBV7
         SYrYKYPsplO+9/Xu10L/+16V9AVKrPTobtFYA/S20yRCFIwzHoyaoMuuwNS4MKli0HRb
         Vtsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769516; x=1793374316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0RAPtvLQwr0f4zYSkwfWymS1oxVdn0ZzLk5Jnrs+0g=;
        b=LV+kV82qdu570bmBcIbkanDkHqZ6mKTFVkz+1YagD+eyOHnzEqlEGjt+WVPQaaALyR
         Ai2lT3TwXpAwtBdn7wlxQ4KaUTszxbugmjRnmqqhksLbA5LnoLChRnu3b86p44lNpP0H
         v05UzjiK7nCae7n8HmSf4cX2l1RljPuthX+By+gD27URjWC6r63jvYfg5pBl9uS8FgIX
         L7W0LPrIfQEQs+jClC2Gc7C4Z6fmtkaDYdOzjMJP1ZTXLEcLm98K8Bi1i3LuI3V4qb3n
         QVcXSGbf2b+rKFzmY6QTdwlBZ63wleKBcrpkQLGeNbEpx2hQYIS9acqwW0K0dD4bJHju
         KQkw==
X-Gm-Message-State: AFq9FYKCNQpEd3kyGVsLkNQjm0BCYvKFY0C2bYSDqicrZJnSlYrvt2ZO
	Yz20pPbyN73KhzYpW+b2hBRnmXtHMQLxMXgfzbXvp6wQb2o5lzTHYydj8RjOp72xNVSOK8RyawL
	Fz6h/5vnFnRjMdQ6kNU23D6WFcCx1raH/iHdBXn2p1N7eDA0dsXiPl9CNkztWdhwoDBKgjzSZ26
	eN
X-Gm-Gg: AYBFou0PJqRqpMgItfpIBL6Yqazli3RmXO0eongzK5akcN5zTOTx2gM0WxhydlFWQ3P
	aDEgPWwvxrRXqtwrjvSbFe50DhaW2yQFACXRsVt/hKsljb9daMvLnsLtANwXzd6mVRz7ap+VKsJ
	dVSf/gIz1aLxq+s6g/hF5JYNUmnkU80u9HV5I4XN1aFLNjl1D6pJZZT/OpeHhhBmjnh2H/uXKju
	aYgG9uh/HZ2T5Sx5bCLW9AX5rY3g29Pzfb56Aes/tQ89BXQqwV61GyNP5QrtFskT45PY8enafE9
	tlPwTho7nQ3dgezzvKpCubcZEm95Wgh/ADjC0BrEogTpiBncdjHB2iRoEEf2t7trlhaD7+lhFxK
	3dt6rENiN8ZiT4MkjH8yiVtu2e6HgthOgFu56YB2yR1ho7XO5MsTtPKBZbe7tjQNxyteiDUtnEI
	rFOSt/qc+6K0vd
X-Received: by 2002:a05:6102:6445:b0:7cc:5c9d:7e07 with SMTP id ada2fe7eead31-7ccc333f2b9mr842405137.11.1792769516149;
        Fri, 23 Oct 2026 08:31:56 -0700 (PDT)
X-Received: by 2002:a05:6102:6445:b0:7cc:5c9d:7e07 with SMTP id ada2fe7eead31-7ccc333f2b9mr842373137.11.1792769515588;
        Fri, 23 Oct 2026 08:31:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb0288806sm478062e87.55.2026.10.23.08.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:31:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:31:21 +0300
Subject: [PATCH v2 06/14] drm/msm: let the kms drivers clean up a failed
 kms_init()
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
Message-Id: <20261023-msm-kms-destroy-fixes-v2-6-83727c122de7@oss.qualcomm.com>
References: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
In-Reply-To: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3336;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HoBk7ONYzI5BFZMtAgm7hFiVZaXXxP5N1D12n+PHNRw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq233UKjB0AzguQYF20e8Xuq63PgYz6kHfXh5gE
 5kPH91raPaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatt91AAKCRCLPIo+Aiko
 1X6mB/0bHqsjhDghFWjXfNU0zQc5MkIGyr/gkhtFldPT4yz9VXOSKp9Bi45NVW76zBAGw8SYl8E
 LZhfWnxdEXhD1/hXnvN/0kB/iqC5CYBT9CoE+ArNeokZBFGLsD95p+3+dXLqsLrUo2bh3Aqv72N
 F+alAWrDDcP3Ht0jATqtiJS2U09LleaU4jzM1PmJW/4+yMA2PoJ1Z/yeaAcctTujmnGK0i+e9rN
 Oj+ydwq7GmKVAPtE8L7qhlYkdYfEWjWizmgryPYMTlsdgNQVu4V83jCgqyvrSM/l8MbBjcWzqzi
 izqnB9e7PpvdV37vfcqtJQqDTXWUtaWE2jSTySSVxgiY39P8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX/fqyCpx8UC5i
 rOE40sRevOCcZcpFttSeYl3mjV8tdzvoWc2ClXCcRRIkWqpNsOi6znc8t7+KK5tvAKTrS4XdD9Z
 ELVDdSM7esfpjJiIAW0rTCBLTglZwc42BOfL9fNrmH3C/UlqHTkrHnVJSOBet7hBBrMbRvfu1UR
 KYznZkt/TmSdmdk2V3yIfpe/eRKBfxYiHpT8lMIes0NjXndtppM750Zy34tm7AiELjqok+DkyPz
 q3dcW3vUA54zGE0WrGyAazUY6Yd71WryyzJGIe+IoLJCDQrGkKM1wb1xc1svd6bOaM+822+M6mY
 +brHuwInW/aXfkCmpoDxCDuBEJyw0Ufrz/z8fvIgWatofizeYT4kJY9vhiSIusS/+yqNlYMRz97
 OrRfkCX1KYlISbgmcGSuePysA4mNOY1wB+UbDYTmVcLO278Rx6KyxiliLJ3GOLjqoUuZ/mCPFVJ
 Shintd4+i/p6L62LNmA==
X-Proofpoint-ORIG-GUID: l2JUok27qhJPPW45tl54SY8aB1uDbR76
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX9Ax3xfL8OCst
 AV1JmCUG1nvSJV7AbVgY1iFDdokF0ylohwrKf3Tg2OSuf80htyOA9AXpIKV8yEBvCJ0nfLrdYxN
 qsCVe8CnZR7mh9AFXtuFJZ06vHyGZ6c=
X-Proofpoint-GUID: l2JUok27qhJPPW45tl54SY8aB1uDbR76
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb7ded cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=DqDluaqBKgvBNGcJzpYA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230060

A failed priv->kms_init() or ->hw_init() is cleaned up by the ->destroy()
callback, which makes ->destroy() responsible for tearing down a KMS in
any state between "not initialised at all" and "fully initialised". The
kernel convention is the opposite: a function which fails undoes its own
steps, and the teardown only ever sees a fully set up object.

Let the kms drivers switch to that convention one at a time: skip
->destroy() after a failed kms_init() of a driver which sets
init_unwinds, and let the drivers fold their hardware setup into
kms_init() and drop ->hw_init(). Set up the mode config before calling
kms_init(), so that it is already in place for the hardware setup.

While at it, tear the snapshot worker down after the KMS, in the reverse
order of its setup. Nothing queues a snapshot until msm_drm_kms_init()
has succeeded, so no dump can be pending when the KMS goes away.

The flag and the optional ->hw_init() go away once all the drivers have
been converted.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 23 ++++++++++++++---------
 drivers/gpu/drm/msm/msm_kms.h |  3 +++
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index a94d2888a21e..e4d61935a6df 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -283,12 +283,6 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 		return ret;
 	}
 
-	ret = priv->kms_init(ddev);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "failed to load kms\n");
-		goto err_destroy_kms;
-	}
-
 	/* Enable normalization of plane zpos */
 	ddev->mode_config.normalize_zpos = true;
 
@@ -296,12 +290,22 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ddev->mode_config.helper_private = &mode_config_helper_funcs;
 
 	kms->dev = ddev;
-	ret = kms->funcs->hw_init(kms);
+	ret = priv->kms_init(ddev);
 	if (ret) {
-		DRM_DEV_ERROR(dev, "kms hw init failed: %d\n", ret);
+		DRM_DEV_ERROR(dev, "failed to load kms\n");
+		if (kms->init_unwinds)
+			goto err_destroy_snapshot;
 		goto err_destroy_kms;
 	}
 
+	if (kms->funcs->hw_init) {
+		ret = kms->funcs->hw_init(kms);
+		if (ret) {
+			DRM_DEV_ERROR(dev, "kms hw init failed: %d\n", ret);
+			goto err_destroy_kms;
+		}
+	}
+
 	drm_helper_move_panel_connectors_to_head(ddev);
 
 	drm_for_each_crtc(crtc, ddev) {
@@ -344,9 +348,10 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 err_destroy_event_threads:
 	msm_drm_kms_destroy_event_threads(kms);
 err_destroy_kms:
-	msm_disp_snapshot_destroy(ddev);
 	if (kms->funcs)
 		kms->funcs->destroy(kms);
+err_destroy_snapshot:
+	msm_disp_snapshot_destroy(ddev);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index ee98393b9855..2f097e23e2e9 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -149,6 +149,9 @@ struct msm_kms {
 	int irq;
 	bool irq_requested;
 
+	/* set by the kms drivers whose kms_init() undoes its own failures */
+	bool init_unwinds;
+
 	/* rate limit the snapshot capture to once per attach */
 	atomic_t fault_snapshot_capture;
 

-- 
2.47.3

