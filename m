Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D143E714C
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656005; cv=none; b=VrXVmeIS0dcAPAUs50NNxUXQznLPaUZbaCaApC4XBHMMyNBdIbUmVhiGlVgRU4A5GPrbxljlQM4TyXVJom1urhI7NqvxIB/eFSsBj2+Wrpos9NPtaHHanfGmvW9IooDhBmX4mKrgpeY51QbSuVRff4zdlwIpUUyhotUd0brM9xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656005; c=relaxed/simple;
	bh=K08RSR7jFMIU1z3Wf63hI19PHcL0gXlgR6VRva1a4mo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B83z/L1J+oyGTJjjz9zaZCMd1UOEXtiNy63RZFmMpXG+vZlOiRDdtrf2V/Pcj6UlZqzt5qMMJWqYuQTxiihH6cZ7eWwXz/YLgfHqLwTgc6kbLK3T7jiZRJNCUG6I/PfBf02O7ifEMuJ3Knk9Z3YnAxZVYlkJimaCqeLpR8rHRrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ab1NG/4M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BJV9i6dK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ab1NG/4M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BJV9i6dK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47XsM3654793
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:26:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GYzN3WW/T5PYDupoBOf6xq5Ubj+LwYC+2OZfV6qkjFY=; b=ab1NG/4MhyDJcwN9
	boZToEIfxNwKi0y9rPEVnmeLvuUBAk4eeoLUfwfT4pvWQO+A18Vt0/XVUGcHnu0W
	nTVnUJNwAvNribMynItPjemRt1ImsMXPnNiFoT0PiXHRvBd0fMPBwSM35c0Mnb/Z
	5hB2roNVZHv+u80MuwvpJwB50zL71ICk+fO1PggByQ3/BFuoLsR2QYH2zBrFggB2
	gwjg7yBuI9BJSmNv6gGzA/wXJnG+HSHSki9r1KPUcWJUgkZrJmEDDxUScJumsGtD
	UOfc9UTXp6ay/NtuNs2YauDHXXQgf2SaA2HWk/kEEui1sMLNgZJxJyjBDiBd/V68
	1+hLxw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew0jsm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:26:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-914489c39c4so27499466d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 21:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656002; x=1791260802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GYzN3WW/T5PYDupoBOf6xq5Ubj+LwYC+2OZfV6qkjFY=;
        b=BJV9i6dKMEr1jL3uvv6ErDF+6FYFjsKrogV4OBzYY8QGwPz9pVw74J9TvhpmQjXV/w
         X/B7Aa8WvKpU1X65mUjZt8MeuAj7AeIijEUe1UvY4Hx2J1zZk70EiiT4KTTlSiZ2nX1U
         06oMjSVGd6ilFEq/q6qV4nTtTzEZMTKN5Tr7XmYOX+6NoaG1TM2xFIz5cha+oLERXW3B
         qpU6zvJd0SIaOMIv4licB+QjG0yFYCI3J/covZ3B6t47CzEaOdnkQVooazxBlmVzrDdQ
         wc4zGiXpP1yvRV6RfU8UQvFNbDGVJzQaTTd42u2mUC79bh4OxLyS54rq+UdzqIxQMtyi
         WtKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656002; x=1791260802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GYzN3WW/T5PYDupoBOf6xq5Ubj+LwYC+2OZfV6qkjFY=;
        b=1XsCX7YS9ZaVK3KbLKwkDTumjJFY8S2YH9AAE1X7hZUaTDONyUyaiH8axSiptem/qE
         J6OkUzBEFHWXVXCL5XK6J/urrPX/qtm/WrIqCA+NHOW25rBWZb7sRSd4mHMP1QdU7Wj6
         bMa9Eeu9ORyVHpuuVmA9FWL+lEPVoUus7evxtLHSfvQK9F5hD3KnwR6DUAKJYGAifiJw
         cFrgMjUINzsna5poMRBCRZPEIIofsutnLreLz2tBTj0WiIxzN2mk+UrlBIi/53jy1MJi
         VWkp91TDJ/2ogw45Ll9KuhCNZ1UQQYc4kRrRQ5k/l6juIpTt+pXtVdg5rjlJoLNkSgTJ
         E2QQ==
X-Gm-Message-State: AFuF++mmEUSiLb7ur2XoWbXysfoAuz98dZsXDUKiW0ym7R3rB8dZUCd4
	hmvj4zXVBOzWRjuhUSGNSrQ8UcSjNOdzMJdKXWujLEdH27m7eydxEZKez8grEYP9TGoOSELiyZI
	ah3g87GdajutgEietno7Rifj6JgDYQf1xjo4pU0vGdUfwLZLQabZeLL7ZKWEwmqVylYaZ
X-Gm-Gg: AYBFou1XrAH34BXqAu2Gz9rh3X1/PuPMJMOaDHreOnwhD5sW8e5nb21eRF3O9Bz5RIa
	3zvJsOFcaNmHjZ5tWTe8ewb/f8LicRPrSJfCssd62Kp6cjzRF+o/lh+OqFLaigNuYYAfVcTrziI
	/W4wXmEU/UzCvZN9R/nYoCIvd6Y6uSLdkSqlnfD4LNl5wAI0RhQj+Iy8EIQTo/bmBVfsw615eCq
	q4dBHe06vRjXrl3z45SdfTYZDYfuoAiJD7lOhyWJZl3tHdIJbQ6sKa+LhG0ifIsjR03H+KRiY/t
	/3SwcAWFJeilLT0v/jAj6pEZitRQo4Jn051f19eq6GbSDZHre0qINmOskQVCqX9ATuriKds98tl
	CUoDZBTbrLKXBlaNgu7rRGZ6Bka6u5GVqBkfZsR5dghZpUO/lAw1BtAWuhJbJRHs=
X-Received: by 2002:a05:6214:19e7:b0:914:1807:dc82 with SMTP id 6a1803df08f44-9142f6c351fmr263711116d6.1.1790656002433;
        Mon, 28 Sep 2026 21:26:42 -0700 (PDT)
X-Received: by 2002:a05:6214:19e7:b0:914:1807:dc82 with SMTP id 6a1803df08f44-9142f6c351fmr263710846d6.1.1790656001955;
        Mon, 28 Sep 2026 21:26:41 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:26:41 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:27 +0800
Subject: [PATCH v7 03/35] drm/msm/dp: drop redundant config_ctrl_link()
 from msm_dp_ctrl_on_stream()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-3-4b81473185e7@oss.qualcomm.com>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
In-Reply-To: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=888;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=K08RSR7jFMIU1z3Wf63hI19PHcL0gXlgR6VRva1a4mo=;
 b=fyWqoVQcjO6e5YPg2W4msIxUou1AZAGIusEl9e7VZCSk+44m5z2e/n833X7kNz9T9O8r1teA7
 jnnOHqDRV8ECYAIZ8z4ZCGHduSlUQSnhPj3WgzrqYQzCKU902b9LsKu
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX+WQkUvp1WKSF
 UvmInNZZQCgCzWVFgFixlqFU+n/JTM8DIfsTg0DIKO3TdaVH+TH9pcjZdQL+L2zJr1l4cWMjHY5
 +QTIn5YpM5rgmra2F69kw66XxfFEP4M=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abb3e03 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=P3NwbF1cJ5UVZmgLWE8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX09c9+34u+6ho
 TLpZ9uDELMAKsJ2MUGotwcATKFZB4tFrkk5C0Ym8Unb/2W9eFFhO4/oajnEFKOPi7DdxqrjaUeM
 9J3oqRsujFBFwRFr77vcU0UgmL1Pno9EC0gyqsEFiYuxxC7EiGuxE6ltHyCKiARwtLlJjCrgeNe
 33e005XIOmJM4mRoWkfkYrvIk9dYLP77JytWhLoBonwkmbVaHYio8frGWdth4Gf/mvrVi9bTp1w
 AEXXOy7z6VG/MAthwIXAVXrNiXmpJf00liwaXXvuaf0MvnOmlF2rXiyM3neBe9w+DbSNsrkzpoL
 +X8NXW5/DBc+ZKXdkLlTUT1M1n05m1y0hKdGqLsigGXlMKcxFZwgOZCERCJq0njla9Lt2T9Pjxd
 3av/8zoDAG6i5xHEuAX+zhqVz0geDcbDdguqkOTRlTWd8Z2dm6eUTo6nZRAdrbHnZHg9crZhrg4
 cY/NgB33nQotX4v1uSA==
X-Proofpoint-GUID: JPoD15uT8Bf5bGPdhgLuDuSLGBP_bPOS
X-Proofpoint-ORIG-GUID: JPoD15uT8Bf5bGPdhgLuDuSLGBP_bPOS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290017

REG_DP_CONFIGURATION_CTRL contains link-wide state and is already
programmed during link training.

Calling config_ctrl_link() from msm_dp_ctrl_on_stream() rewrites the
same configuration and is unnecessary. Remove the redundant call.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 1ed713b957c6..e7bb9558c0b4 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2598,7 +2598,6 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_ctrl_lane_mapping(ctrl);
 	msm_dp_setup_peripheral_flush(ctrl);
-	msm_dp_ctrl_config_ctrl_link(ctrl, panel);
 
 	msm_dp_ctrl_configure_source_params(ctrl, panel);
 

-- 
2.43.0

