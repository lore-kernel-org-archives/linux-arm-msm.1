Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516B83ABD8E
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784527921; cv=none; b=KuaNQ8VpkxRp7FPdemY3NiCIiS1pdLDD2N5a8kPfGRtturWnwVQNNVd2GARdhG9IgEclSrmnA21JX01nDlfi1RxdmVhdU6bK+IdfDuxxsQ/lnSOLe2eQm+viFLf4zB7PVlZgzjaYeI4rPi/8jnsGkL9nXmXDsIOgc6gJkeaFNqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784527921; c=relaxed/simple;
	bh=4C6nVgcTW+thgRB8rInVDfxhuZ+n5lTL6ENDh+EIJeo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=APrUzNTyiPRQt4C19QTfXU4fZBtdKpvPbpQ/fW5L2f7syX0a5ttAq9xCZ+VYkQn08A/41bxLVc8GQu3EIFUyo80lOC1du8J7n3Cjl2uFH55GQBGNLrmwdKWocseFZWRgJfnUpbaHAfZ6lzQ66QG4eeb5SeW9LeoygQ0xTYZXsvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lVtcxryq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bucj617L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lVtcxryq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bucj617L"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNsKX8657582
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ZkQwyBXdXdbZK7rkpR73PpIwuDrFdUuinUJFVkWC24=; b=lVtcxryqsDSsnTjw
	PFLn8Hjh6OcJfEqBoiCVvv+nGxsOl4OI1D1jZv87n6+T3jMrGzFtNfIQ7cNHS6Lg
	1/5hTl/LjOF/j0JcQrfDMiMLhaBmKLrN0IB6fiSFHj5nSQKBzWnWHcVw27PqBnRW
	xWP3oeb5gHJ0u9Br2B5lozei+GMb4K7NHabGR03ZWYR1n/0US1/xHSpP0KIVdIOH
	6BdhTkTApxN1kz+cWeEn67XBWixlYzsgZHfLE6DKMLBP2qDLiM7++BgYbwmLzWhV
	+sP1AIJqB21jPRqrDiwIfUPlkLD+OMXuYw8hkrDvXIqlbKobqKiA2Ze7QbxtyU8C
	d8/oCg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2chmm5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d7886cdso81077451cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 23:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784527905; x=1785132705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ZkQwyBXdXdbZK7rkpR73PpIwuDrFdUuinUJFVkWC24=;
        b=Bucj617LrAgixYM27S4Y9rmlTfzuWXccPIaAWVTRsQUY3xQTn7bhGJi/2gykRYVVAC
         ENmzmfQIQ5CfXBBIPxb6XMkz7UvHgH8Q0VskCE9IeWu1rR/M7YKky0I8X7BvolFvuvqq
         vHx1fHZtU//zlr7Ri//wQuHNi2Nf6yjOjr1FbU+0YE9304kAdSddrqs58xTTnIqad7fO
         jMJ0FNkuD1LKpVb+jesrzRzDCrIkE4HPUMiy7HKwXmD5MYA4QmGgAIMYKUb1YjWkyVMo
         LuV890zHT7kmt4P3qbrzcggdxEz5LTBO1Z+WffEiDj+tGwhmXdiTqOdWoHn7sOOqT+jP
         rQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784527905; x=1785132705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ZkQwyBXdXdbZK7rkpR73PpIwuDrFdUuinUJFVkWC24=;
        b=KNbcBSetVI0g7O1jPJZl2kadbvfYHKwPHrQJ26ISCuETxk1iuMLmw8smZ1EfAyeQB7
         w1uHVyYf+kL0u/V0CFnRlcMSY0XiAaXNQYjZcW8ftTCtYEsmLPnLNg4RaTZPHQFai3nn
         Pd7Se9DJGaWfb7HFqm5BoRmD0+kbbffr3z1Kru9uPXirLWVcGrvvuKiZevgPrm1XLJyR
         vCZS7ay6kbC5U5JRbkoS/SlgkEoYWFKKY6/16kp/eKFHx/EoCR6+w2W3HAtR3zNyZo3G
         LH39xIuoJYyaOxrE9VjgA1HWK1NOCxcJA2HjLIH9wnInCdAE71Z8jNatwGO+JAq4F1Fw
         xqXQ==
X-Gm-Message-State: AOJu0Yw9RUQ3Ifvc8UVptmO597RlTCEGwU2epShIUgo+sCrRuhTGAfHJ
	8CFztzeKAXyA1gkNPOFKRam2ccG73VIJLFmIZ8JBXWrkHBFL3RSLZcvwcESpU41JPUtXwllLz/a
	i+1w0vxzFPxREr/lEROP0WCrZCp0xUrKfkgiR5Vyu0mLy+NzsNzU+gq6J03jdlIlTXewyWNHWD0
	EB
X-Gm-Gg: AfdE7cm2k8r4ymzJ+xqJz04kDhHsp7pVELVXTNde5NDYKFJXXfD639Ds5jcWRCrRjKT
	AtXCUIFiweora5NCLTpnb7hOww9vTfiubJRYxkWanEKiIWZIkQrPnB4cB9yMA75u6L0RtZ/QAGp
	G79EuJpgGN7kIfR+rdtVhzrHrwGvYAWGzQBAj8aXXxnJEMk7xRl2kVku+UByOznzyqLxAqG0TSK
	EZJioMQY02CB44+CYa9OHvQjAR9NWsdNartpcanb6Fwt4PIyZY8EHvMVFx5vJvGDkz7dLVtEj5h
	J4LSNtdlKN2nG4lqL9UMyZMpDjxu9C/YzaKya6QyZf5TAy5SAoco7DgPdd0tBGSGHo54xfAiwHg
	0+op5H6Q8d4UauajJW0tGLF9DgJWgkApkbvgVAg1/0mx4W4gkm5tIb+IUEaPgJmc=
X-Received: by 2002:a05:622a:230b:b0:51c:19af:6330 with SMTP id d75a77b69052e-5213b33bbedmr123147141cf.36.1784527904665;
        Sun, 19 Jul 2026 23:11:44 -0700 (PDT)
X-Received: by 2002:a05:622a:230b:b0:51c:19af:6330 with SMTP id d75a77b69052e-5213b33bbedmr123146921cf.36.1784527904346;
        Sun, 19 Jul 2026 23:11:44 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90778588a39sm84793216d6.20.2026.07.19.23.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:11:44 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 14:08:19 +0800
Subject: [PATCH v8 12/15] drm/msm/dp: simplify link and clock disable
 sequence
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-dp_mstclean-v8-12-bea261bf4e7d@oss.qualcomm.com>
References: <20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com>
In-Reply-To: <20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784527840; l=1745;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=4C6nVgcTW+thgRB8rInVDfxhuZ+n5lTL6ENDh+EIJeo=;
 b=B3Syo+/mknQQIe6IKqp1uzBpQ264ooLumBdU8/54Wne+5QjAVw83eN+GHaa4TpsIhnA/d0AH3
 zIBzEJZJwZ+BKLSCAmv8Qynmfnfh2V/7dS2rLnlKt6QvMljmJ42YTlu
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA2NyBTYWx0ZWRfX29LNxo1NlJRL
 RUT/rtZF7TjqHFtKYmB1JNB/fK1kfexThKBsp0HV7fJ3NDCWRuSYCXQP3U8Ef6IXfbogx7E1g1F
 R99oHSIXRx+xZ4GDa4uJxVmpeyhfYn0=
X-Proofpoint-GUID: VCmsMtWcLLnziSMJjKoPFHQUxnKvJe8x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA2NyBTYWx0ZWRfX7RqCeScTooNX
 5F2ARNx27M+77hXFkO2qRzm6sApq8JysmbP+grgkfjq1nIeeSEQZP6SiVOTwKlsDYCTPidIbLab
 Es4yYLM8rMJEp0OD0CwuFOcWiHTvd9YCPYFv4F3VEs6wFU8G/doawqVqH/fzTPlETCHrKU4buPK
 VwLAQ240o/IKvoXRaZtHcjh7G7Yf/r3nF0SmQoS0qMrsJcmbxYwF6SwEy7WNmdlCDvANBlS+zQ1
 kXX6sHxJl9MQVRGfBT44Fe541IIX40eeGB1i1ddulYDeBOgmDEPvC4dgBTRmv0j50hlJSnHRxrr
 v0nnE/ktsdGe8VD5UYk0ixVtk9SXoTH60MhwFx8aBYEMU1jAvBxmSySEvmomJvVV2uIL1aXUQJL
 tHo0HPaphD2IimBZ6tRN65LR277yDfS1is7OBcOFxeSwrbm2K9N21h6afeSYzegUJOhsG+iV4qy
 89xwKaBdLTLUM239y4Q==
X-Authority-Analysis: v=2.4 cv=T5K8ifKQ c=1 sm=1 tr=0 ts=6a5dbc21 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=FrCxesj2aA1etRkkIm0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: VCmsMtWcLLnziSMJjKoPFHQUxnKvJe8x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200067

Move the common disable steps out of the sink_count check to make the
flow easier to follow.

No functional change intended.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1ecd700a474f..d1a3a6f6c303 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -718,27 +718,19 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 
 	msm_dp_panel_disable_vsc_sdp(dp->panel);
 
-	/* dongle is still connected but sinks are disconnected */
-	if (dp->link->sink_count == 0) {
-		/*
-		 * irq_hpd with sink_count = 0
-		 * hdmi unplugged out of dongle
-		 */
+	msm_dp_ctrl_off_pixel_clk(dp->ctrl);
 
-		/* set dongle to D3 (power off) mode */
+	/* dongle is still connected but sinks are disconnected */
+	if (dp->link->sink_count == 0)
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
-		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
-		msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
+
+	msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
+
+	if (dp->link->sink_count == 0)
+		/* re-init the PHY so that we can listen to Dongle disconnect */
 		msm_dp_ctrl_reinit_phy(dp->ctrl);
-	} else {
-		/*
-		 * unplugged interrupt
-		 * dongle unplugged out of DUT
-		 */
-		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
-		msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
+	else
 		msm_dp_display_host_phy_exit(dp);
-	}
 
 	msm_dp_display->power_on = false;
 

-- 
2.43.0

