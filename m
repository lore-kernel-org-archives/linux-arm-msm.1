Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076779;
	b=ofn6tSIRb6NCERtrU04s7yj4ioLBPaiOdR1eJN2P48r8YiBiIPZmysY8vU/OpEmmjDV+
	 7Bx2Quaro28bW2VEXLZtJKuXiUCSczf5HSjZkU6nZAlEqduRqEVN3hKf8bhLjMJh7CwEI
	 SmOHWMbRdnyCpAGFuBEwVxj1mMgdIwtKPTq3eEXrPZTV179h9o3KR3ptd0RgMh/GCM3uD
	 T8WxvRRDfdms2eYcef9qI2abnqxqMJDmMq9Ea15mZwtv/s9YAQ1u5Ktn4orFD5zVMwpW7
	 JF1IQ7Oy7NfOYz/JQXB7HcTFlF/woe/uA1I58QAElyZmGprMd2CJwRdybpt7S6W0PLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076779;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4eVE8ncFYWRc1l8YtvIlOlgRd2mH+LH7ZL0TkktaXXE=;
	b=ksHOvdT+VWnth4dLaCXhn5RdjTUovzGFl2hxVje9trHfOyRLMw05n6lsfdJw18cuiYQ4
	 e/REuskf7JvgHtr3oSFv408qni9NfW+xdXlPF4umhKERK9oLlruil1rdD9egSEyrtQ9PP
	 7b32JFI0PWuC+c5DbyBqCn5SadSSOcWcd1GD34tdc/+wP43tQZl6bt0ovfTnhiENPYwnH
	 ZJRvVhyqQ5ezFnDoFcrfbsJvv2QWDmQL8dYoyWHuqwcK2Imy1/ODerQgidKFzV7uEjiZA
	 5lUS87tKa2V9U8MKNM5qtp4ryJbQ+D1kc2sDpvQukGbnJsQOQ4CgZ4JSy6qgNMwevSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pp1J00u9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dre0TCay;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6309E606A326
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6309E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pp1J00u9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dre0TCay
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6v7lD2030654
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4eVE8ncFYWRc1l8YtvIlOlgRd2mH+LH7ZL0TkktaXXE=; b=Pp1J00u9fA8SJCDx
	ggblVMUXKNxb8ybWFKYkzggI3UNVukysf7YCkcnJ08vZezSGm/6NVqp/6+tBbjAQ
	uAK65K+9mhHzt1a9weB5fjp/OvaOtcFIMKHdQMJeU9lMA+6MEXWY1A1HoJQwN2C/
	ODnMrlRQnm43kGsHZsemrWT4d7hLHnXKom1JhlR7Ljsas86yllhP4LkDwDJHiQqq
	BlFdunlRFLXbFzoyz1mVpT8mMLfZGcsnB025N5NLwkr6XHVQNO9gJrNT1dGiMIxE
	kOA8FLxZxA9qkSPHkmJDBYvcsCzHGCrZi7LnIurlzMA/0YDXTgbAuzGkY28ix6ce
	9YMjrw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3kuewx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:26:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495a1f5e47so335385285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 00:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076777; x=1795681577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4eVE8ncFYWRc1l8YtvIlOlgRd2mH+LH7ZL0TkktaXXE=;
        b=Dre0TCayyRTq0kWVG2dle/dIPa/j3QWS9fyNh8xJa6ni0PScQHHHzJ0ObiiuJ34j3H
         v6st8bMBkOZfxkY6eS5smiVGhgZpJUWR4bo29kfHe2yd/EC3RhK9TRvNoQ+P/V7Tus1t
         cBnXsq5LsK/d81E4Y+VrAL/cBEAbfAKGRG0zNDPzArmwE+AQY+Rhw1b5b7ingDXeUDA0
         6kUMxeP+C3/O7DR2q+WSqoRJMIdHJB2KYLT0DUJy4gwFBCK0SW3ADKm+5KPO9GQpa3ka
         ENA9stUTQo/SwBnjpkaOIg5OzQqU6MVAzu3tQhsTDKTqHJbworA8MWO6l56z2aa7zLKC
         xB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076777; x=1795681577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4eVE8ncFYWRc1l8YtvIlOlgRd2mH+LH7ZL0TkktaXXE=;
        b=qlFbE0VdCKs6i5+ZO221jgw5OO6TQqzCUCn5G+HgXPLtEg1Lz8UZl8UX5tR536vwuK
         x9H512ymQNa99uBiIEAjzL5AX+F4/XWvnKLMd9xKot2S+IOpVQcmkQ2SFnAPvvYx8CW2
         ojixERUAzGR15PI/Qq6LluRIfE25h77d0QFS3aHNjd2NWKdXy1T7QRin8sJWe+bjlFeI
         5xJFQTnd5Rtz1iNRteD49dI6TudKkNAGeyWCku6Sv/Uj6UA/ju33bQZOHWfkjE+IL+Kc
         Kjav0qIuXlva/gF7PWp1MV9yJBVsqRGgNeH40xnkjbclcnDigkB3qDQJSmJUzyoQ5/qz
         ujyA==
X-Gm-Message-State: APuU4Z/tnzI6195DV4H1z+Y631530DWdAs/fB4rFv9AMR3xOXD7grz+9
	mK5fFtCQswhkGitpFEQvARoGTnUJ+7iwxLTMSZuDGiI+g7hxhrcdROeUJbUFLUMnQkAuxDH1CnQ
	M8tqex48njfvZQ8DZxbV17rjMT92oXF7Ppta55mAV/V8M+BnTKGeq7GsznCbu3qY5YDNP
X-Gm-Gg: AYBFou16qX4jbe5Fav+q8rzjLNn0jDrvkbd9qrmAtfOerkC6M7SHE8M1rPLru7MQIyc
	1nz54smBoHMMaNXkQG89PQGH2EN/8aMG5PuhrWOr4v5y9wtLV+JFKXK2gwfvovh2x1fP9R5Fhk5
	b87bt3aRb7FT6gELN1elbbAY9GUB3R55kNxrRrdJ67ZVkUw/yWXjv3Dzov6VABxVkaKxQ6XkpbR
	NlpYIK3StrSXrPUToif+7tdeoyGKVNLPgNJrijaO7qqwSU8kOtr8O6RMTt2Y+v7lIOiarq4jWAA
	XqmDJp5nuBD5t+g1aq3Ym0cawvyHrdtL5bBQvjjU6+JONvmQ3VEEniR7h/56vwhVck2S+wpawGd
	w9MS6HPLWLxB6D1MzGT1HO6c73QlaGAfPqKeMV5wLrTywHqMw60F2Auzv4fEawqSSXrurznwEu8
	bSsHCxIn6yuKAw3EgfiudwUbl480hQa8wTE2x8
X-Received: by 2002:a05:620a:4110:b0:93e:e425:22b3 with SMTP id af79cd13be357-9499965853fmr934792585a.82.1795076777185;
        Thu, 19 Nov 2026 00:26:17 -0800 (PST)
X-Received: by 2002:a05:620a:4110:b0:93e:e425:22b3 with SMTP id af79cd13be357-9499965853fmr934789985a.82.1795076776624;
        Thu, 19 Nov 2026 00:26:16 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:26:16 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:23 +0800
Subject: [PATCH v9 21/29] drm/msm/dp: add HPD callback for dp MST
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
Message-Id: <20261119-msm-dp-mst-v9-21-ca61be4edfc3@oss.qualcomm.com>
References: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
In-Reply-To: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=6603;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=JfZ1P2UeAniFbd+VES9wo/hKrnJLS0BWlRsQ//HuhC8=;
 b=ychOUgCzF83lMbRTysKJ5BunX/yDYM7zPWhrIhx/lngZLovadmrVpwMhmJ1tXkQqHtvbq9vjR
 bsf5eFIZ9ygDcW0X6NNJhNiTqg14usueO7O2oL5ntKzLV061KNf3xc8
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX0pFPxe8oJ1FV
 oiHckJ7thY+aSXX8sQfNYjPNle2M56czrKS/kYBbXqcEn4A2r0+z7FX7hM6SlfTAmGA8SOIZhMk
 dadjjUegwPb0EOxa7x5LtR3VZYWGuRw1Gc8UpSgAzhaB8ITAvKtjUQ7JBC1IaRwLrvH8SU4VHqG
 6O2q/oG08JYsW8wkaZ6Ffx3LKwxpZmty3Vrzr2g+22bB3G6rV7cjjq8mtf/HZhU7xE1pU/4oia7
 K94ftip5lPEeOi2hEs0oATuk5CmE3an/Et+igR5lvYdAqua1EcDJJeOaRp0INKV7O5Ii3/FukB7
 eIlwARlJghEdpNw2eQMXeQAFrr8xTT3mxG3aZpR/CsMtAI+RTQ9J7rUFbJSzy5iZDhM9TiMDFOm
 g9HZ//G4oCR5ZyVlW/3oa4V2ncUC42UgOyoBcd7HZgJISPVnQOWDDeVNGyhMxDUPKwRW3LC5nfD
 cSWL6Xf1wb9McFwRSMA==
X-Authority-Analysis: v=2.4 cv=Wom+otfv c=1 sm=1 tr=0 ts=6afeb2aa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TC7KtrVTTV83HWuqwI4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX2+zL9xqSg9qn
 KG0lBkuGeHKZD0gyLt8jWp7MAy+tbACGS0VSawW4mm6uG2FM70gWI7taZfOKaUvbnc2LNOTXROl
 Pf/pxqCe9+Pso5yg+5sVxdIH1r+4LIM=
X-Proofpoint-ORIG-GUID: n__0DDBzji7hLk8rF4n9L7FZuEJBmLB6
X-Proofpoint-GUID: n__0DDBzji7hLk8rF4n9L7FZuEJBmLB6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add HPD callback for the MST module which shall be invoked from the
dp_display's HPD handler to perform MST specific operations in case
of HPD. In MST case, route the HPD messages to MST module.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 21 ++++++++++++----
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 48 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
 3 files changed, 65 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7bf24cd2bae2..75eaf739b86f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -529,6 +529,11 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
+	if (dp->msm_dp_display.mst_active) {
+		msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);
+		return 0;
+	}
+
 	/* check for any test request issued by sink */
 	rc = msm_dp_link_process_request(dp->link);
 	if (!rc) {
@@ -1078,10 +1083,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
 		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
 				      connector_status_connected);
 
-	/* Send HPD as connected and distinguish it in the notifier */
 	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
-		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
-				      connector_status_connected);
+		drm_bridge_hpd_notify_extra(dp->msm_dp_display.bridge,
+					    connector_status_connected,
+					    DRM_CONNECTOR_DP_IRQ_HPD);
 
 	ret = IRQ_HANDLED;
 
@@ -1318,9 +1323,15 @@ int msm_dp_mst_register(struct msm_dp *msm_dp_display)
 
 void msm_dp_mst_unregister(struct msm_dp *msm_dp_display)
 {
+	struct msm_dp_display_private *dp;
+
 	if (!msm_dp_display->msm_dp_mst)
 		return;
 
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	/* HPD is disabled by drm_kms_helper_poll_fini() before KMS teardown. */
+	synchronize_irq(dp->irq);
 	msm_dp_mst_mgr_destroy(msm_dp_display);
 }
 
@@ -1755,7 +1766,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
-	u32 hpd_link_status = 0;
+	u32 hpd_link_status;
 
 	if (pm_runtime_resume_and_get(&msm_dp_display->pdev->dev)) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
@@ -1778,7 +1789,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
 		    event == DRM_CONNECTOR_DP_IRQ_HPD)
 			msm_dp_irq_hpd_handle(dp);
-	} else {
+	} else if (status == connector_status_disconnected) {
 		msm_dp_hpd_unplug_handle(dp);
 	}
 
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index eae82e857c84..15405080107f 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -15,6 +15,8 @@
 #define to_dp_mst_connector(x) \
 		container_of((x), struct msm_dp_mst_connector, connector)
 
+#define MSM_DP_MST_HPD_IRQ_MAX_TRIES 30
+
 struct msm_dp_mst_connector {
 	struct drm_connector connector;
 	struct drm_dp_mst_port *mst_port;
@@ -36,6 +38,8 @@ struct msm_dp_mst {
 	u32 max_streams;
 	/* Serializes concurrent stream link-state access across streams. */
 	struct mutex mst_lock;
+	/* Serializes HPD IRQ handling between IRQ handler and poll_hpd_irq. */
+	struct mutex hpd_irq_lock;
 };
 
 static void dp_mst_connector_destroy(struct drm_connector *connector)
@@ -358,6 +362,40 @@ int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
 	return 0;
 }
 
+void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display)
+{
+	int rc;
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	unsigned int esi_res = DP_SINK_COUNT_ESI + 1;
+	int i;
+
+	guard(mutex)(&mst->hpd_irq_lock);
+
+	for (i = 0; i < MSM_DP_MST_HPD_IRQ_MAX_TRIES; i++) {
+		u8 ack[8] = {};
+		u8 esi[4];
+		bool handled;
+
+		rc = drm_dp_dpcd_read_data(mst->dp_aux, DP_SINK_COUNT_ESI, esi, 4);
+		if (rc < 0) {
+			DRM_ERROR("DPCD sink status read failed, rlen=%d\n", rc);
+			return;
+		}
+
+		rc = drm_dp_mst_hpd_irq_handle_event(&mst->mst_mgr, esi, ack, &handled);
+		if (!handled)
+			break;
+
+		rc = drm_dp_dpcd_write_byte(mst->dp_aux, esi_res, ack[1]);
+		if (rc < 0) {
+			DRM_ERROR("DPCD esi_res failed. rc=%d\n", rc);
+			return;
+		}
+
+		drm_dp_mst_hpd_irq_send_new_request(&mst->mst_mgr);
+	}
+}
+
 static struct drm_encoder *
 msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, struct drm_atomic_commit *state)
 {
@@ -473,8 +511,16 @@ msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 	return NULL;
 }
 
+static void msm_dp_mst_poll_hpd_irq(struct drm_dp_mst_topology_mgr *mgr)
+{
+	struct msm_dp_mst *mst = container_of(mgr, struct msm_dp_mst, mst_mgr);
+
+	msm_dp_mst_display_hpd_irq(mst->msm_dp);
+}
+
 static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
 	.add_connector = msm_dp_mst_add_connector,
+	.poll_hpd_irq  = msm_dp_mst_poll_hpd_irq,
 };
 
 int msm_dp_mst_mgr_init(struct msm_dp *dp_display, struct msm_dp_link *link,
@@ -506,6 +552,7 @@ int msm_dp_mst_mgr_init(struct msm_dp *dp_display, struct msm_dp_link *link,
 	}
 
 	mutex_init(&mst->mst_lock);
+	mutex_init(&mst->hpd_irq_lock);
 	dp_display->msm_dp_mst = mst;
 	return 0;
 }
@@ -518,6 +565,7 @@ void msm_dp_mst_mgr_destroy(struct msm_dp *dp_display)
 		return;
 
 	drm_dp_mst_topology_mgr_destroy(&mst->mst_mgr);
+	mutex_destroy(&mst->hpd_irq_lock);
 	mutex_destroy(&mst->mst_lock);
 	dp_display->msm_dp_mst = NULL;
 	kfree(mst);
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index 822d34cd6ff5..3bd3e66b4eac 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -12,5 +12,6 @@ int msm_dp_mst_mgr_init(struct msm_dp *dp_display, struct msm_dp_link *link,
 void msm_dp_mst_mgr_destroy(struct msm_dp *dp_display);
 int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
 			      struct drm_encoder *encoder);
+void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
 
 #endif /* _DP_MST_DRM_H_ */

-- 
2.43.0

