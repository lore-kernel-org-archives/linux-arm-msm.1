Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793747944;
	b=J024npAbEq8JGmXvu0IcHWiLhCWG88jZND9zuxPAGFF55o78SKnFEcKrX+iskt8FXVgs
	 KqZUbvBoq5Q39Ij5F+Kp7oASXIJ6aBpl/JRyuHtGLGZ4NH6/fSjDP/CURP8X+HySh5IUA
	 9RVZxTDR3j4/sJ1DF0nkVOMeUrQj8s2aPG/tLzQ7NCtOh6pgXTcpsQhX3VXIiEEi9xSe1
	 HLNMi1DrM1Pflxp2/nkSNyVd1j1fjSPLQY+fsE20WpO9CQlOKwff1IxRGUzFQKRoRbLaT
	 5zpmgBq4YO49AG9cBi+F34k91FMl+G+u5zRL2nNLbPYeWZnezArPDQKQ6xHWOrEKbCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793747944;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yKmSGK1vSwOyKiBV/4vQNcT9fTTMd69aRbOdB8aI+io=;
	b=W2Ewt/qVfbv7jkKa34hJYF+KzsjVF6mgx7FK9W+lsoUmRD6mDB1B5ttV1YLYoohZFqLv
	 98VaYwNaud4kRcxezs6gUgHEktVZ0gstFfXDGJoGKI4ci1zmXBQzvGKNs47+et9Wpg2f3
	 YJoBr4vi9QmDdpKWbRj+YR7EHUs80cf3nYB2vuPf1cq9M2uQ7goUYh9ap5jIU4cRXQBYO
	 2rEXxZH2ZRwRz/ubUsovp64IW1Q43XQ3FVQL5CiqmAaCFJJ52g0AoW5s37TW2C4Qxg5pO
	 JspHcoSkb5b7wXas7sSFHryYVMJx125txXMw5ly+kQiH+2mGzuiCB7+abH+1QmKILxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DCItncuV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tu3zccI4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4F8606A339
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 23:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F4F8606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DCItncuV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tu3zccI4
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKlOe799799
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 23:19:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yKmSGK1vSwO
	yKiBV/4vQNcT9fTTMd69aRbOdB8aI+io=; b=DCItncuV69iznZs6alW4tmTSTXu
	jeKuFkKmhupsaH8qeC5j0stNhCC+tQIHiSGClsutOuOdfdrtz67gDZpoY98MhHaG
	Q0K5+lPR75o5+6u+3fzgq2+Q7T/7Rz4g7y4vFs6WiKbDpvaHRVIfeH9KXhXBDH0n
	51oT8RQX1eX9uGNRAJ0WgndjcLjB97LIWzAzKDauXUPLbY0DR+gfGMbN0I8TGasC
	9NR3033q3wFQm0PeH9t25mj/fHrN3xdiKsBET6bEV1hQ6pDO+CZ+D7NHn0x6JQZQ
	k5LSX3ROjngUls+XmZerBTVbDU8eVoEVUJHuKHzNgIY8z4jaSLmfxf69aew==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2ph7gv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 23:19:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3adad90c894so215832a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 15:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793747943; x=1794352743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKmSGK1vSwOyKiBV/4vQNcT9fTTMd69aRbOdB8aI+io=;
        b=Tu3zccI4EOe0T6z7Ar0FjmNFPPRcyf2gwKn7D4kmlNZEoTkOEtrhODGFZeg9kCtiBQ
         f7dI1K24uxezkzlRt76eYkDXFLpQmUIKKlkeHSr8tbnobwUumz4uMLb0Aj8c/79pMZpd
         y3kNZeItx0yKaDTg1hxIYL1W+12x4OZCfb1O08lh9pb1RoMfzR0HRtiiT6kQVtxZ5ecu
         8DlaWxV0Zk0tpd0Txl1SR7dqlIVp3u7kJ+q5LNSUr+Hbi8XzbtLKPV8BXn01eBSTxk0k
         MzC0DdYGKNcjuyl2xl8y5NfKt2B+s7VybxTq+lRJBIKCychQnMUWnT+YQkNYtmtGr0xT
         wKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793747943; x=1794352743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKmSGK1vSwOyKiBV/4vQNcT9fTTMd69aRbOdB8aI+io=;
        b=teiaHG4okIhKjDVHgbKy/GYzUOFd5NwxOOJKpVbPWgpoQxZ9dDCwHJTvqolR4b0gZf
         0eyp5OrYUc/+34qAPSkYeTYltTXoUr/XNz06vOpWGiKFB6fEt7aTBraaU1Hf4I7OD0mq
         6m+oxUk6PoMuvs1+BXvH1ZL/fkYX3SQq5D5Ppn8RInzc2rLBp6wVbI8O4jAwoKlJ5Usc
         kcxtHiODfwxyzsnIQ36TDzguQJjSQX+UVSgq9wL3usSClVHpHs+bhUI4d4+rXfllcnXF
         H829xxd7/y9DmVf6ffSDiyLrVpcCxckpBPYx09Y0HqJmf4YgBJ5hHwtQU83LU1VJL7Wn
         pFuQ==
X-Gm-Message-State: APuU4Z+ESF05KJqZBKJgKcTJP9JF+TE1QDnzd37i8tnjalWO57OVfV0Z
	OSAfk07Hx+Y+AL9UtZH4qtJKi4oiJdZlmkxRbsj7o9VqMrr40Dj+EKdDo5kBeG+3MayvCANFrSZ
	QtK+SWTWazc1UPsZHiiX0KKugS+FXSlQVR93FbWyBwnuJKBRFLfTKASBvJgmx704VyGa4
X-Gm-Gg: AYBFou006vcpmNLP9Il+0R2Jsluo2GMbFYLZlzUCILQtXqLnmaie0EExEoC7Wnygd+Y
	w8CXEeKgJclXq7r/0zXjjrqYkEM3hq7hZCzRfhCS8Nuhgbehn9jnm7mfVoqxZ5tA65Togl0BJwM
	VRNRBOS7ZclTu7GUO4rWGXLRzmLjPrRqDMUSI/V44FAosJYjs/6FatTmksyqiUwNUKJLFYkMhY2
	H2cTj7EHXcF5tQaNT1pzYQ1oiAP6NMYhDe3ZU8D0QHs1E12PoTLQY7B/gLz/4Agbu27TbW4xJR4
	ViJ9BqvsXZnFSSNX3IhTp5Al3MiBcKy8V+tqfkv48M8zZFlW7Kad5YAlbd8tE3NHGzIx2220GPN
	MkiR/17oGAWFljn9QEmRvottPy1ri8g8eHWfDCd8mdx2HWIJ+gjlS6oSKmVMG03BcMUruBL98uo
	oXxtZn45iB2oxYgb7wIpU4IsI69pHnt0eGbBkBaSy3ADp0V60Jso3ClzHaWw==
X-Received: by 2002:a17:90b:5286:b0:3ad:a8bc:20cb with SMTP id 98e67ed59e1d1-3ae8987d2d2mr12910038a91.66.1793747942835;
        Tue, 03 Nov 2026 15:19:02 -0800 (PST)
X-Received: by 2002:a17:90b:5286:b0:3ad:a8bc:20cb with SMTP id 98e67ed59e1d1-3ae8987d2d2mr12910024a91.66.1793747942398;
        Tue, 03 Nov 2026 15:19:02 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09452d89bsm501759a91.0.2026.11.03.15.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:19:01 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 4/6] drm/msm: Add cleanup help for disabling IFPC
Date: Tue,  3 Nov 2026 15:18:43 -0800
Message-ID: <20261103231850.17493-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103231850.17493-1-robin.clark@oss.qualcomm.com>
References: <20261103231850.17493-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA5MiBTYWx0ZWRfX9+4fd+o7oO+J
 YSdDLNZaiyIsOVtOs7BoTYkznEx8AOkZ+00x5jbOsIJhzeao2pXlRUlpfs28I7enlsHEpE6Rcbk
 e3/h61hNF3o0+EX8W9pfYBzRf6lkIp+CbeRyew+gF8kDoeidmN8nbpgBFad/7gDZ0OGNgDHum+H
 DRgglM7BPVbiOVIbjmRenpU1PoCOmDgs+nXPrun3/rWeNcAWAfOJDzJS0UfsvbfaB5Zf1sUyDpz
 JP5NFmAyNsV9pA6JUdAnO7TiSm2VK8wOeZRMV1R6RhHMIhIckVZIwUjQQe43N2EqYBLacR3wBE3
 4CPkNXdOB3f1ekDMOLn2RX4q6GF24xvDNtPcQriSHAJLUndODHHCG1KLiDkHuhSfnDFWURUVgSu
 iEhUY2b/2W/gjV5jRWEboGK9cERKPaHc+8HpdJNUH8h87VDAVuEvEYBqcGqoQA5h3QkgbsXQgBg
 /4hB4liGyBGad7XVesA==
X-Proofpoint-GUID: k_V1JlIDLOIkbXfrTjeDySbw7_HrmLwi
X-Proofpoint-ORIG-GUID: k_V1JlIDLOIkbXfrTjeDySbw7_HrmLwi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA5MiBTYWx0ZWRfXzOqhfk3AciVn
 PfFU5aT+Mn5K4IPGXGs+RLtC0nhP/KVZpoby+eBaoMAvkuEXEkN/2TPBe3AfPK6wI1KPbveTs3l
 QGL2Msa4WnFMTKpwU71QSzrMFIB7oVk=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aea6be7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=vTD2gfctXtM-Q-VHBdUA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030092

Simplify error path cleanup for IFPC-disable critical sections.

Note that this moves where we re-enable IFPC until after the
wake_up_all(), but that is harmless.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.h      | 4 ++++
 drivers/gpu/drm/msm/msm_perfcntr.c | 5 +----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 0334a0f604ac..e7912d2180a5 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -399,6 +399,10 @@ msm_gpu_disable_ifpc_put(struct msm_gpu *gpu)
 		gpu->funcs->ifpc_update(gpu);
 }
 
+DEFINE_GUARD(ifpc_disable, struct msm_gpu *,
+	     msm_gpu_disable_ifpc_get(_T),
+	     msm_gpu_disable_ifpc_put(_T))
+
 /*
  * The number of priority levels provided by drm gpu scheduler.  The
  * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.c b/drivers/gpu/drm/msm/msm_perfcntr.c
index 867dd476ed88..995857273aca 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.c
+++ b/drivers/gpu/drm/msm/msm_perfcntr.c
@@ -259,7 +259,7 @@ sample_worker(struct kthread_work *work)
 	}
 
 	/* Inhibit IFPC while accessing registers: */
-	msm_gpu_disable_ifpc_get(gpu);
+	guard(ifpc_disable)(gpu);
 
 	if (gpu->funcs->perfcntr_flush)
 		gpu->funcs->perfcntr_flush(gpu);
@@ -295,9 +295,6 @@ sample_worker(struct kthread_work *work)
 		}
 	}
 
-	/* Re-enable IFPC: */
-	msm_gpu_disable_ifpc_put(gpu);
-
 	smp_store_release(&stream->fifo.head, head);
 	wake_up_all(&stream->poll_wq);
 }
-- 
2.56.0

