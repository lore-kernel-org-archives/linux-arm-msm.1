Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076811;
	b=FmJ9Xf6xbJ7nkKoH0NP/lVJdSi2uIR4yWRlklfOnTE6+t82W+GKu4dJ0q4GtARH/8crk
	 kCzWNZg6dVTFDUcVNFf/qho4L0W2zRE1Uz/dM9REXiALlpmdbPjTmtJ7fV24BX0gfCcBI
	 Q56zF68aNDOUK2A9keq1DDC+BwIsZX/VV64Zl6tVgcRkPIVixzcXE+xwy8fMvumOSCkwh
	 f01t535XgPK1Z0jIeAkhAGj6Gry0BVQUrCxpCQ3+DtyAVYQlHdIrYOLK8ypQoVz8L5tLz
	 /2f1/eWgiVcYpE7HY16zMQ0p7qITVjDaA7q4N5JGsaC/Lb6w+EfxSatgYIIg/6TsDsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076811;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hRRZQX+eqmNzQk/wsKwwDxPTTQ7ZRNUbWAXYNhs6rpY=;
	b=N1eIYBJZ3d+8cDXTnJT8AOzCSdvC1zLdFdK6gzgBtUI/+2WbGEs6vexY7K5Obfn2yLz7
	 VBBvSOOW+SumpAu2J5pggw/jhcCCp7ucmkGcNPNFHO6+Leli84nZ94uodaE6463P51wwF
	 49KgERsiviXL7cChNrAw71jHSSkOPfCyY2UHn6LDgizE5IsVA5voLLiW++ReY6TWJT2dG
	 Oun3LJYZXIWkkJn0/k3o6iE4NxkdYB1XIFwpWoGPTVbxAIC2VTvKv0BppGGKbZw2aIjuK
	 Alhe9jBF5sB3FHakfXy6rQBJ3ixIrDRUZpdb5PVOs+1aL8h6bPdvMailUcCg1bQ1aHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cx8Su9ej;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TuGQ9qA7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3029606A333
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3029606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cx8Su9ej;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TuGQ9qA7
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vOuI2194705
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hRRZQX+eqmNzQk/wsKwwDxPTTQ7ZRNUbWAXYNhs6rpY=; b=Cx8Su9ej9UYA9n5L
	sFyvr4m+ES4lorAtxwkrziULhfrMIObrCYkcL+9KWnYMwTN+IH52Bn04RDr9rwBZ
	FSl8PDMPkYRuFCEovEQv4dn6DagEBtliXyVt6Fv+FpXplhOYadN4JkzB2AgvyWdE
	DTyDzUQrFIryjMN6A1QI8FoQpRySByzkpr/kDTBT9kbTQG3ZunadYPKEw6KevaQ1
	5/pF2T2GYpiBV12oBMsqpaWJGjmOOV6gwD8RzcfhHYF7WaUQw6HobRMWkNtAu9Gr
	yP+3cb5DCphERfXy5MwZYmFP91Pbz8bToTOfBo3xbkCQMC1nGjElgV4TbdZ3Xa0p
	6ESA/Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1e5qv09a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:26:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9210ec7cb34so3852006d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 00:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076809; x=1795681609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hRRZQX+eqmNzQk/wsKwwDxPTTQ7ZRNUbWAXYNhs6rpY=;
        b=TuGQ9qA7ZcSRrMY05HDqdNtnie96VISGrPF0wm/CvsQ26iTy67b3qFnMPMcOBKQwVd
         mwtbVQJWnFubv6NMdb1W/vLuZ5J87hZA1fezidX4RMi3ucFBevpso024zsEeOnn1mjMc
         5i8Z46Rgzzsg80n0JwCMYKbL4Pnp7EpJX0yrLOD9MadFgUu8LsSm8lRTF4fRkuA0qwv+
         QsfdNdKhAFGFwpdKSsmRjWfR65ZR4TPC6UB7n2M425CLQv1iCgRQFr8tBDc+mHFNshkc
         ohLwb98Ic0GEDGY/vNs8lFmFESzx15JetzbvRXJJNq4v909MXp9dE8k400S8f2gPgECq
         Ohxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076809; x=1795681609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hRRZQX+eqmNzQk/wsKwwDxPTTQ7ZRNUbWAXYNhs6rpY=;
        b=l6BkGlNuVKNhxmeA8xXiV55FegLmv+TV1ovLC5KumZhMkBYUnHoOKBAVyqI++sO/xX
         BMNAGQfEAvyrcR3zAe8EURI02WNddHiMaybno0J0eU21zVuXK4zD4GFB8e1q26CB1SWS
         hxp9FPg+KyRp417FlrokzLe+Gy1u049wnt2qqhx+WfrDqAUJIjvbSkjM2ZN6PPcB2aCM
         56d/d0i7hil5Ru7PMvt4xrQS/cD4D5IccOoRvmEihcz9Z9AnPwX7k4XToxL4jimJ7Tot
         oYfKxwK5jKw9zBGLqUUdQ4NY3Fxr4NhUV+2FUyrvbLtTdrTBTN8khjPY5Vj9UixKEHmX
         eRxg==
X-Gm-Message-State: APuU4Z9ocwLevCIm7m8mCAGQdPrKk8KO+l+Yb0UrkiU99PmetzrNqLLo
	D6NjkN+NsXDCH2HOcRCBFbSlO2WbGv4HhKZHnGUXEP5LOC8Rr3shMTMKp/VPcq1cT8PExqsRQkz
	XzNCUPXxz8Ybu5+o7uf532dXnOYfCrFlt0JUihlJLmmLdiEM89duI0NXcH5hVh5rQBfWQ
X-Gm-Gg: AYBFou15tTJlsPiNJqWjJP8YEk4g1aYzogYlDyvtIdWt+Z5gIJjO5myeoO0IvuWLHJ+
	HmuZV/KhACzEJ+uLcj+duiTMCBvsZX0RExLSr6lX/h0tB96IjbeovoiWxW9UdO9Z1c3h6SFKFGw
	6KaifKQDsh4QaV3ICAFjfEn53jxEZoEMt+OK2da/7pwh98yFqrW+XFNeSY1EqowY/S37Xs3i4iG
	9fqzjil4v6CjSR4GGJoTIxlAs8Eaw2uGcLEhZKjn6Sskc48JPaPb/AqmFL9ISKso3Var8dggYpu
	YCsn5zcsoat5s+LF3M6NcOednNOFAxMm+qn7rDsAPNnc0ktzqs44csMIc26CxxlhU8CxGU1Hx1t
	rw3g6izG/1Yw9MknnSx/H8PUKHaoPt89Q4RdAQv0UGATs0pr333WiClibVeCrmyqecHrR1NONA3
	27S2uGfXk69rbAxvykGg0PRQEQVJH+/PmZRMJf
X-Received: by 2002:a05:620a:170d:b0:93f:2f48:c9e5 with SMTP id af79cd13be357-9499975fc72mr1009161185a.34.1795076808821;
        Thu, 19 Nov 2026 00:26:48 -0800 (PST)
X-Received: by 2002:a05:620a:170d:b0:93f:2f48:c9e5 with SMTP id af79cd13be357-9499975fc72mr1009159285a.34.1795076808337;
        Thu, 19 Nov 2026 00:26:48 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:26:47 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:29 +0800
Subject: [PATCH v9 27/29] drm/msm/dp: ignore IRQ HPD latched together with
 an unplug
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
Message-Id: <20261119-msm-dp-mst-v9-27-ca61be4edfc3@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=1164;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=5iWOkKJwZjnY1MHKdY0LsxV2ilvtdmCr7FzSCJb+B/o=;
 b=+zIMf5zGBx//vypOrS4PVt6cpbzTe3MZDukk6V4mfXDnjTnfRsqMWRgejWZvmLKPaXjq5GNAJ
 ZVSCRiJQu0oALuXQqstiRumWW4q0nXmNbDKwqdZoOL8bBGi/4FXPQf5
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: csO_khCVSp0yJ2wNeTLSm3v2_cfjsVxr
X-Authority-Analysis: v=2.4 cv=c5Q+0h9l c=1 sm=1 tr=0 ts=6afeb2ca cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=GWmhsmQFvB3G8ctGRoAA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX3LjZVtpW419T
 UXGIBv1yE93z6ualKzr71YkAHbRSlb3LCAJBdbG4R7z1refLtAKJXyHBhp5UDpuOHsf1YZYUKtH
 GPLAyqUcJ5elgQODxiMJOaVz7iJccSM=
X-Proofpoint-GUID: csO_khCVSp0yJ2wNeTLSm3v2_cfjsVxr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX5jUcziY3GU0J
 A/iWt/RlereVP+fC0tQxeJKGxrv8VISETHIQSmp7G8eJ2N2jKI6OgtJz7MswiATyHwj/XVb5yd1
 oBiJV/2HxYgvIIZ6uB2FjA4toRJb/Zfcj6yPc9HXebV09+azoOQEnsx3LcjvmRKWncYFdlnWBF+
 eFT9syKcbPtbgzk+J6bSQ0GI1HTLtolqREC7RMzNoEOWaHYfraZXw3XcXQBNnB6SLzCO6KJdZhv
 rVuRujTpHvdq6ocMFKBYK9t6AGy4FMkxhQzjWElnVM0AOJNurhQG897+Y2VX5/K5q8i9mNlp6xi
 /X4kIm31kaCiOmkmIQDlF/E+iGE5qpMLAnuXFjzydyinORNzGdlWCzt1qRXTATaL9h2QoiiXNC1
 lFp6NoQoXFLQ/O2tM5cayrO6GctcR6KOp5C9giQfDOfeQNnaYSVhhNwmas8Regx/e518yc2uYk2
 XmF5avg3fr7Hpb9Y9yA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

IRQ HPD can be reported with a plug or unplug event.

For unplug + IRQ HPD, ignore the IRQ because the link is being torn
down and the IRQ may be stale.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ad8c30a8ea79..69d5ec4e175e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1131,7 +1131,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
 		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
 				      connector_status_connected);
 
-	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
+	/* Do not access a link torn down by an unplug latched after an IRQ. */
+	if ((hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) &&
+	    (!(hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK) ||
+	     (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)))
 		drm_bridge_hpd_notify_extra(dp->msm_dp_display.bridge,
 					    connector_status_connected,
 					    DRM_CONNECTOR_DP_IRQ_HPD);

-- 
2.43.0

