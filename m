Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646034;
	b=ezVyu8l0L+8PKkwmEU1mpe+xhU+i7bvclBrBaHYk7MKVFN1uk11vK4QOIWQIpjEkAEpF
	 RJyShzeqPqR5BUEw8vqGGO4vBEzE98wfobr5ZQejP0GBBViljqUAin/7Rjgh4hnguYy0z
	 nDULbQb6+UNwdrUvm7hbNJRDGbLFwEP69bjqZq6p/9wQQU5A5Y0ZPOW6jHbN2mX4X6Fbf
	 4mrnlVxvP+dyIrX3DLsKIv+lZqBLjx5PsiAc8lKRKu5fdjxyuZJywXbYAXVFfTiS27GQB
	 GXK9Fix5Cj6lxyNqI6UByhzfh0auYspfXa6953KQPBCIteUCOt7tcgD8EKzx+QYEtzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646034;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rxoPTuCm5jnMt/VDeTNC1QYpW68FPUdXFuvA3Ncyf5g=;
	b=AFpb5OMRqlCyfL5Vvl0+qDAaxQkHJx5faBUl+1NxnDONdJAWmJSC4JayR/0aiUgE8732
	 xt1lhiODmsSsM36gYqUH3MuvEzH6Hi+riYQdxxyCz7KMgq4cr+hi9j0JY2AH+ABGKIpOs
	 PIXdZNyrFGiIGo6h4DzHlLhtC5OpW5V7EHCiDWZ5Lir8+vFJ5Zd/f/X84FhQvzN+YzcCI
	 rDDJTh082LSObqs+6N6HmnM9rgPxMNbby+AN1LDtZnDFX4xAfqjwk16cTOnebvWOuWdUh
	 c9UUi1PlDxrcv+HfkVCf4IiFXw/1s+GwxYqLVuOVkj45UDzhqBezX6e+geV1d6RnJOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GgBr25bF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fniTRdUL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D25606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 19:00:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15D25606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GgBr25bF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fniTRdUL
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2Iswix3129110
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 19:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rxoPTuCm5jn
	Mt/VDeTNC1QYpW68FPUdXFuvA3Ncyf5g=; b=GgBr25bFRLP0IAUuXFu0m92G9xJ
	WkAbzzxapuqVVpxp6QTZ7Atl/tpBJfdDX4ym+ZolImpVlp9TwWYpMx/KlyjczB1u
	plqk7jaUhArgUjotWs2rekgEeHpUEY6bgZcKltIzGP86I6qjZn1dg/z504jN6l0u
	Br3Xx65Pc6pPQYtGCSESXv6SyCsLS9cpzsTdOK7k9kYw8WIHu82yBf2MD6/6yECk
	vV2pdKrTQZ+I54O7uZWW3wnK4uvhkg85Oac9AxjYRYyPr9W2qvsf3O2avJzMZNZ/
	BzALXtkxM3+RrGeyxhwipo9UvjzUWAG5QmKfJ/uoI01SrshNSxgUbzx37EQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07eg0wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 19:00:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e818ca61bfso35175575ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793646018; x=1794250818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxoPTuCm5jnMt/VDeTNC1QYpW68FPUdXFuvA3Ncyf5g=;
        b=fniTRdULIfS65Wq4hmaIB+giMThVAIT7HSx0W8fAFUAafMLzDnFbYds/F38x45gMPC
         8ygBcdcR1bzhsNRSHnFXDATNyBJeY2N+cxmakvCb7mRqsmbGfResJdKS52ukMj015MSP
         UgwUHjVThSSxxS1WfsyGzWcJOut/47PRRzKXpj9hcnY109PYspE+CZU1EPX57D3Rt5qF
         5wC0fv60xrodNHRsV1kB3KKhct5ZyLW9mgToZA9k5t+2DYzWoHFM0w3f/AkpcBdVFQtr
         uRnxy2h/t1sIte7Nk3qH1gq6gou6bf68dL89CmjK8K8OWrKIUQunpfKYJ+OgYOdCf9Rp
         aMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646018; x=1794250818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rxoPTuCm5jnMt/VDeTNC1QYpW68FPUdXFuvA3Ncyf5g=;
        b=j63jGQ72RUQKFHkc/RcEnyREBvRPE/TmZKNP7V5SPQx5smkxyRSjgV+VXQ9tYFmhbB
         Qn+VzhaHsJ5FrClF58i30M5JL8Uzop1VhR50Cf7PKOizt8b7sIscRjKbgYGxLfUKuGTH
         JZe073IgAVQ2faxhQ+amsIbMzqT9hn59KR4kyFELZy6FtTWCbE2yFqDxVVe/w2tDSgRx
         K7VCXp3Q+p8WNt9nYZ6IFHibXOLTTioZeijM+WFi+RYSDdbGRkwchgD3NYu8umjpM7EE
         4DLqO6zXQEnKhu+Jst+2LiD5qFwGAFTxLytwRCq/i6a3P1xIvMYZI9pGucsTVNtTai3J
         K99A==
X-Gm-Message-State: APuU4Z+eO2wNX5KqWbALv8MgeFYU6gBQD8J4R44Vdi7V8zYIOiHs5kgo
	kGFAgFwBAOHmVNM50BD7lo7n6wACJDJRPXxUjTej45LDVvlRicH4ksHUExEmD2ArdPde7+Svrg2
	HAdigfiZuUp6aTuGnoqzO+zfLCNU16NFfcvABux+yQenG3g6iBmTfWlcIOM+H4Fr3nLDi
X-Gm-Gg: AYBFou3PA2zOJd97sE8Iov/JcYTpTMnPTjLNz9MyY2LZ8OQkvuaYDDJA3Mdomjr51s1
	tLMl0NJFsmhGUS14oe0Fwok6m0tSoh63Jy2742sgj4MEDatB9AuTIsWRamvWSAI7hdPpUOGKRY7
	wpo4fe26CXVbcAs2qO3i8o41fddF4JKg96V8pWqUeB6rwc6ISN3HF4FUnwRjOSryAbPi2ufgqOt
	DOyODCdLlojP8YspmzZ3+zQRT/1GXyfE1VbKOI1bFm7NIthfd7RYfcMWLFgUaknH25jgSP5Kx35
	ZSZdSVLArVhz9wcjAkoOon8Szqk9rXUyfZFOMU4YLyMjfAg7emee/aIirHfLWfpgHXZjYi/zMnl
	B06R+GEcOZbKuHHBt5Cr7MWejPH8Ue4GgS/gA/yDqvgd1Edcx8r/CyFvnVY2jau/77bhEbodtcw
	pC7jBKmFdTODPcCLfVSye5pg==
X-Received: by 2002:a17:903:b8f:b0:2e9:5ed2:c3a3 with SMTP id d9443c01a7336-2eb364bfe04mr105228895ad.37.1793646018396;
        Mon, 02 Nov 2026 11:00:18 -0800 (PST)
X-Received: by 2002:a17:903:b8f:b0:2e9:5ed2:c3a3 with SMTP id d9443c01a7336-2eb364bfe04mr105228505ad.37.1793646017926;
        Mon, 02 Nov 2026 11:00:17 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39230bbfsm31091015ad.19.2026.11.02.11.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:00:16 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/4] drm/msm: Add cleanup help for disabling IFPC
Date: Mon,  2 Nov 2026 11:00:05 -0800
Message-ID: <20261102190010.720443-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
References: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA3NSBTYWx0ZWRfX96swTsKzG+ox
 eUPR+k9e7uO7Ek2+B5t9uXmbdLYvmutQUrh8zPGah5msOQrpluqfE1vKgjMme347hg0OgIUZo+E
 vTrYRLIgWpK2hw+xZrDyL9onSzkeqbsxgh5a8iIxvPoDb8+T5NrXa42o48BMezxngnKQpbf1HaX
 KKWFEPWFYu9qY2d9R5V+uWVflhuG5FRQivmJB1A2Ntf/0iKYc/XrACcZ9NzUu+J7E0bCD6DgiXd
 dKcP2rHdDjKQ5v2jLHWFRLKOaN6HOi5BG9K5mOIPIPPZhWWLAMgjD6fMCPk+BM7j7xVqznJzk1b
 DgJ0jQwToqrAQ9pSEbRL1XIlGF880uI6uDK4gdlfwbUXKFSCbxvcd0/KDYdkW14PlWUPMZOHZWc
 FeJBai3MWKhXUKQMwPJQO5fKQWXV0aakRDCbLQTn00SYUlnti3icGyWoCXRc0QahV5oCQ9/hIwS
 2Qby6B44R4lsR3B4e/g==
X-Proofpoint-ORIG-GUID: TuuA_z-cqjU3nrM7K1KYGmsNJ7dLXMxP
X-Proofpoint-GUID: TuuA_z-cqjU3nrM7K1KYGmsNJ7dLXMxP
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae8ddc3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=vTD2gfctXtM-Q-VHBdUA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA3NSBTYWx0ZWRfX/eocW5aZZJoi
 VVbl2UFUg33lWPKoh6tOAxgQrLsk66v7WG45kBAacGbHsUFN7R0JtvvIVaMXM9oXl/OmsgsKjjO
 U4kUnevknZeWwgdsrBY0fKK6qBz8qsg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_05,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020075

Simplify error path cleanup for IFPC-disable critical sections.

Note that this moves where we re-enable IFPC until after the
wake_up_all(), but that is harmless.

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

