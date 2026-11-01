Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793555364;
	b=g1qUTIAhHtYdZ6V/p+Tek7IKguQKoGvERnKw33s6+nJGkxrADic5LC4H8LAZhDqxQtaU
	 O85NW/1Sr0mQdcmhRdg02eaDnQiaosWjAeoAEwNN+IZzRVwmWLNgzMAAPc53YM23tlSHV
	 BK64tbhM6Elj2Zit6/tJzbzcjuYZ2TOzxOiChOa0Hq0YjXbJZLMbY4v/hTRpnwiR+XdHC
	 YJwUE73K1GMe+r9NNoD/oPP25eESZkGrmJsCN38rbBZH2WlBntmuOQqg5KwaTpTebA8oy
	 tXolZtz8BziLcP7O18IaT5PBL1CH+3mMXmwoI+NCWkRgLgHNZW/K3VEH1dvrASpD5Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793555364;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PfKYqLgzZzmYKZpUbUyekzc0kmd71RSx1CMCJtY98mY=;
	b=gWUyAaXhNzIfI5pKmni/eNVkq1cI5iquyQgYPwBr6XNl+AzVz/jBsekvEoSmya5KPqF7
	 3XufxBUN50ycpjpKty2t+etcFGBZ8jDNJyI0asQtclxi27rXVtPVhDFq8NJDJgBKeef22
	 hfA94I0/GbOI51gv7tIF/NWk4u2iARa9SHQHRsQq1dPAZL0cXvXM3U7XxpnlIRnfauRkF
	 y28YOJw/yRmjo8d90yxzGFLp4ibP8i4GN4ct+rAPbqdiFAd47JQ4l1maIJUbRrKjewU7p
	 M6wV1zNjchrLExWqS4VQIFZWvjb2Xbh1mSHQ5xqiidQtN4JJkw7gmk5yVlDrFiUWFRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=chtUgxUh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ns0tYM9C;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572CB606A327
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 17:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 572CB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=chtUgxUh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ns0tYM9C
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQQiG479362
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 17:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PfKYqLgzZzm
	YKZpUbUyekzc0kmd71RSx1CMCJtY98mY=; b=chtUgxUhfKLFu4EYyhY58yJJTJh
	NfS08mSF8ubxnpT5RrUk5TPrC63MrpBbf2mBqHndJSVS/AcmIy7EtrdNMXPL88eo
	0yixR1GcWGnktQv7DagFtfpTbxJXm32d+79ixb+7Fa7Sr9jQ8KBbFPj0+zAznRjy
	efJafFfOYMb9b9J8mwOUGyD11IXk4twtOpP+HianywROkdP9LcXP7bMhNIaXHM8/
	6vLHMEz6m6o5yzzC9DdDDMlV24Wx/dyIimumOsviYSaGaedkDrfpLj6p/Z0ohKi3
	sy9eG0pbctSRyUKt+poSJDwH9zFHiCeUaTaWw4nGH9/r+vyAb+Z+2M+VvmA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9m9bp8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 17:49:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae59682799so1783457a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 09:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793555363; x=1794160163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PfKYqLgzZzmYKZpUbUyekzc0kmd71RSx1CMCJtY98mY=;
        b=Ns0tYM9CULKTBopqrL2krgwAWVjHsc1t6NkUtr5J+syvpN/987MmjZQjG7OTMfRGzi
         U+K3TxIOnHLYoXgzveFlhH/gJYP1qjtlVavNVX2un0D07zuu/1CvXC5BY4ixDH5K4irX
         CFs7KKGhENTTw+HLY1qGs3kP3W36paNdCrDVXPtANx0hqllwIi6+bVR07vL+VaikZugK
         XfkdFqvukJ1bIto1eWyy5X+3yDKwNukw2WcGZQ29s8RFuxqMzm9K+dF98C39LNEbZP9m
         neKFVME2GDQsSIxOWzvgq+XQow2KFPniipo7+DmwhCZ4rVtOq3LxgC20cyK9FU4zt2/U
         pwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793555363; x=1794160163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PfKYqLgzZzmYKZpUbUyekzc0kmd71RSx1CMCJtY98mY=;
        b=1a7nP2oGJ/cDyont2j6w4HRoGleDeYdGP+AMPxlWcVQ37E/9QGCEzG97nBA+00lR78
         QVDuODbkh+ecM/9iTOmYfGp0oZBI64qeatfkSWzq8mzHULNlKGa/NhX0jgpPeL+EnnPq
         IAWLlJUiPdi86G2fr0J2ixvEXBgHOSsg49nJ28NSvLaLrDHzz6MqyxHG5tpi2yew0lN5
         NIrg93dyZSTM7g/fDRTQX649QTKXZehPyzZhpDW+B9iBpqDQXQJjNqL7ivDB9V+p9rwi
         TVTllS0tkPyuws6PMdzgXohJYspE07qf01an3QhIS4TKuJU4awBCQxCf2MTLDyr1+CQ/
         XP0w==
X-Gm-Message-State: APuU4Z8cxeqkMn+4ULWU+EPg0EKE2UgoIY2JKwuwSOZ/6BISd9r99fUS
	teBSrVNn67dzKNTtum3mV29hUGPnL2v9C9CyFZifUPwV2rnMZMJRn0LnlvtVwHGxhG6qh9P4Jb1
	eZPVIEOXDCawRLzblz2nPHmJFVqwxVIE7Bp/w8Ge561jX6dS7Yhx5Ip3oYb78LG+FKago
X-Gm-Gg: AYBFou3pEy892HkNxKI66/Xt5si92/XRABgACjzcU18sM9HO/zm6CdL73JdBuQy0paR
	Sdl73YSOQuBZmx+HYqXFqFwR1hOxqPNC8ZMIe896yKqUu+wfZGkZbyGqaQrQqeSSF5T0IraBLko
	GTfoth9hl+AbNYt3dVlgznrnUBIH4n/snR3SLpmxd6j1OQ+snnpPN0TrmGTgWv4G/KT/Niuyxja
	UDrolTsS1zZqsFN8Q+9T6ItuH7nzKjI9up2UhRkh1SeSsOVLbmD4oX3uIsYRBYV9jbLg9QUXktP
	4flaRzB9Bj+i1BwlGzqw6cpFN7IqVzVtWFuKiahBmWTH+dwIBvbPFWKvxLW2G0bH7GhxdNB21P6
	fAeMKQuYVVlfMvVUiOYqkSv4baE5I3sOtVKe/BjTwo3GxPtZZmCVwB496Xj/yufWn/PPu4O1kLH
	rcWpliKSei8puJpv7zQVJGIeU=
X-Received: by 2002:a17:90b:3d88:b0:3ad:370f:46be with SMTP id 98e67ed59e1d1-3ae8980ee00mr6291777a91.36.1793555362853;
        Sun, 01 Nov 2026 09:49:22 -0800 (PST)
X-Received: by 2002:a17:90b:3d88:b0:3ad:370f:46be with SMTP id 98e67ed59e1d1-3ae8980ee00mr6291756a91.36.1793555362395;
        Sun, 01 Nov 2026 09:49:22 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85f3e087sm6386285a91.1.2026.11.01.09.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:49:21 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm/gem: Disallow nr_bos for VM_BIND contexts
Date: Sun,  1 Nov 2026 09:49:10 -0800
Message-ID: <20261101174911.25184-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101174911.25184-1-robin.clark@oss.qualcomm.com>
References: <20261101174911.25184-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: y2VuG3OGhYRx3BjlhjVBmKCrotH_LwA-
X-Proofpoint-GUID: y2VuG3OGhYRx3BjlhjVBmKCrotH_LwA-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfXzhAItepLYfgu
 HyQS4vSd+L6f27n4h1RUfms4b5yaU7C6CihOahKVr6CivMNoNG5obBOBbG/3tqd+8Im0oGNR4FJ
 VHRlVN7UmvONQNaPqiJs5pZJvmDSzMW28FI4Q1bKw1IXqTnhtt2qzPzPqQXlr3apr9y6z+Y8xNU
 1NxRtc6TGLnzfpe0MQsr02nId3++BnnCCEgvDv0O7ybEYry0HJ8Fl2G3o9bxLr7fQqYPws7gklJ
 Iupt93VcLcFMEfUqqeoJxkLgEwnvpQ1cpY42xa9eY6A6KrbUHkhiAfO9sINxB4puFFyB+LKnfDr
 fs15wB5O20c1IZmOdtmEnPaURFweNaCgmF0Xtb9wnbgFySoA+IMdjSVNuVC0c+4IK/SKuhUrHay
 YgkGTKr5v3y++IkklFHHTxFRN+7tWDZ+BNpS8SJFMCLIldDBlb7/K+xvQDt5XQz1F1Iy89uEFHw
 4Mx8TRDH7eBnuNBnGaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfX+C/cYe0xUdla
 AYhibAC9WItDOcJBlx7Jl7R5V5USk1nTrw2v6zdVLEJP65ouQvbiTBHxbiry3fOHEKZRNW3cUU9
 Cs/Z/BwCMaRAheUa0GNVuNRhCK/HK+o=
X-Authority-Analysis: v=2.4 cv=cfVHPXDM c=1 sm=1 tr=0 ts=6ae77ba3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=5-JVGYL1QLZbPSRHqMAA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010070

If using VM_BIND, it is invalid to attach BOs to a GEM_SUBMIT ioctl.
Only the VM_BIND ioctl should be used for binding objects.

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index ff6cf39587c9..b558d07ed2b6 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -272,7 +272,7 @@ static int submit_lock_objects_vmbind(struct msm_gem_submit *submit)
 	struct drm_exec *exec = &submit->exec;
 	int ret = 0;
 
-	drm_exec_init(&submit->exec, flags, submit->nr_bos);
+	drm_exec_init(&submit->exec, flags, 0);
 	submit->has_exec = true;
 
 	drm_exec_until_all_locked (&submit->exec) {
@@ -589,6 +589,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 			return -EINVAL;
 	}
 
+	if (msm_context_is_vmbind(ctx) && args->nr_bos)
+		return UERR(EINVAL, dev, "invalid nr_bos, must be zero for VM_BIND contexts");
+
 	queue = msm_submitqueue_get(ctx, args->queueid);
 	if (!queue)
 		return -ENOENT;
-- 
2.56.0

