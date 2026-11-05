Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896932;
	b=Rlr7yK2UE6mOT11XjUTh6aqGsfgi9CbQtm/UACsuwN8rEe7Zck/r2712yeGbHb+ivjy3
	 eyDFpwOmiSbFQCVM4YPv/iCO7bO43MEZTnOlskKW6y1gABxwZ86Z5tQnlO4kqTMbQU8QB
	 aHHNvtCafu5PTfvKrPA4B6z9sVyCGGuNr4V8R7qTSue52ce8O3YgIf5Vzq+FCrMTWHjbQ
	 Tv0dqVK81foJ2TSlu/ELoWmezg5ahxMvbKI3+LgZJHXb6yu1nodQpBzsOaiNymswU56uc
	 G+UnaUAThL+PZSm8wxdp2oB9I5c4TRWltp711gEWC5pFQhwtHF5ynh32mqX2qNnbHWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896932;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=i1Q64R4YoBHKvX+mYcDs4C+P4TdP3kbJ/gihntCEHa8=;
	b=1r1humurCu8ygfMMevrok4ytvYk/wFkPTBo+IPvigmU3E7y5hFcH5+NRnYvO99gEm2ea
	 uJBy9giyQbr+XaBJ8lrkLpQhzkGhkV4R4e0TVUD+879wxmRCrd5RDQCVx/KZIi9Y8UyAS
	 7xZ9XlQKQX9UbUnF2tSkQU1l+Jan17Mhzhkv4Am1uSYsGmMJ8iWKf3+1NLdq20KGPxju0
	 6p/v6POgzdzlk+FGCYDwS34CPa3Jyzrtv9e8gHPfJ5IQciIN1KRCI+0sz6Mpe/TC+w8nR
	 yA+1Bsosfwik6F9bYmAQeZ4zK5fjUryZrbfcSEMT+vbfhA7C7pFqWzbVDGOkM8uoxoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BJaMlyrx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eLk4n4Yz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BEC606EE92
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 16:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16BEC606EE92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BJaMlyrx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eLk4n4Yz
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQ7Zb4134032
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 16:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i1Q64R4YoBH
	KvX+mYcDs4C+P4TdP3kbJ/gihntCEHa8=; b=BJaMlyrx5UwYstA2cnkcjQb9j+Y
	rbctTCYC3jmToKo+/+gqC+1asUjURUuA+1yOGOh98EnSE4+iW0dFLxT/faLnF80s
	10Tqwdydgq6C+LEZHfUMvGLxERhWUU2/Yaq05tGfOaB+9Qq6D9Hf/j7R4lf2+Bfz
	oi4poDNP8cErX9m0Wy6RYEmHGLCLr3UcKRO2rxZT8a/qe1TVH7rY0LuEGLfBdH2i
	6spgN/mdiya+RaMYFFsM12xJaEFcXrX4iYZxaWwKQbRzSm0NgbTF63bpN6LwApfj
	ZtDwm1B0LCZrk35MjY+XGJPmPyx35CKpjBSjOd7T8CCh2y1rFhx5zFxyRpw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksqar0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 16:42:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so1011439a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793896930; x=1794501730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i1Q64R4YoBHKvX+mYcDs4C+P4TdP3kbJ/gihntCEHa8=;
        b=eLk4n4Yz6os9rKzAiuqGd6MNNtP4T+JxNTD/4epvuK0MMgDIAyWqt0Ieknzl+r1hpi
         NeLguO8x5WQt23bSQJ5WZ5WVa+VK89V4z0evXZiPBASOF+HbDTUCz4WGElplyswucDgm
         s4gutqi1n7hxEuFONh2Z5dqGQopT1nZOxbI9tqDdygLdEuDJQJjxGXv7kozI8EPxDLto
         jPhGFAhzaAujnZLItiU7B9zenA87bQTkeQEBBVQPRT5qtHC49QqowHlPpRFRZDCLfCsm
         UAl3hwUnFP1UHNT2k8kjIbPpx1k6jJPc/E7UGh9gAsIm1BRSRbH8p+urFa1DqfdR1bpg
         jdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896930; x=1794501730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i1Q64R4YoBHKvX+mYcDs4C+P4TdP3kbJ/gihntCEHa8=;
        b=ICbajoAJG5Mw4i4sdTjBNHb9GuywogoJsdWpJ0pPGjIMLNFAJRyBQxH3jf/m8QJ4X9
         GedE8/laGifylv8FVJxQccG25ILFIcAWFKrYFepjMYNQ82DIRHaN5FdM4rDcvh+4NaDj
         0ZWu2Z0ma1souV7Ihjg1EvDqyvjmoXIhKTu+2DMAUILpAirM3NUHyrnVrfNMxJab3kyf
         508mYg3TLn6ITCyMxYOCy29RSRgcSkBgF2GDhlWLquT/sYSeiDITI0S4RP7S8v2rvMd1
         wySh85E6iVHiid210fqqrG0l3JHucqM0cwSBVw4AcfjG8wOsHwGMd2JX26P+bUlpY1d8
         77uw==
X-Gm-Message-State: APuU4Z/z9kZzvf0oM+Vuj5n8IzvA6ebUxLWZJ9Q12xzAX2KlLLNGu0eH
	AXMDl7GcvZGy7SXWREZZHsKJM6mW6/v94DwAOhKKYy/21unlj4ckGx1zA7kqto/2lgn8S8joWLo
	ZUcwaMYygkueLWNq4liXqGhCjVBIBBeg1XI1NcYCtvLt+9nWN+40EkSAoKrIAMg0jCuLl
X-Gm-Gg: AYBFou2IKPVUShuxSaVQ79yUvRbbfQ9Y5COxG3d+iJ9ABzotXaGtXg8hOFkYWVJpwZ7
	pN7rrCdlOnqs/CqiMFgc7Kl/5kF308t13waRBMa2++ueV5nqwCzUGZZXKVzLo+GXxlykVDTc3ow
	W0gtUOj5P+oGPn5FBkXJiRXJcbT53syMSYiwJSp40C+FbD7YyJMQYCVYujmopJF78s8t/hWmp5q
	jnbVecDuQagQFwn/oeM0F4LgcC1eGOPdPVL0+VcVsbGbTWPjGdGCzhAP0f3IiSxGUSnI/jKYC5c
	qQnq1kGFqdfpWlRpr+nCVof25Ecg3RuxeTUAgWQx59QPcqJTsqCQf8abGo5yiF7cwTBryo2Bliw
	+0/JJ3zMa4rvQjymYDJ8CsFEbeTIaUDAw6fx8DrX02zYpcmUTWmZzrEUk/Xu/w2P91pp6JDFr4c
	DqKVI/aqdXae8QxpoJAD0lIiEnbN3Gy2qkE2s87btJUba4lgduVdao+I2Ap/q6ow==
X-Received: by 2002:a17:90a:d446:b0:3a8:337d:228a with SMTP id 98e67ed59e1d1-3b0afbf6995mr1859254a91.6.1793896929870;
        Thu, 05 Nov 2026 08:42:09 -0800 (PST)
X-Received: by 2002:a17:90a:d446:b0:3a8:337d:228a with SMTP id 98e67ed59e1d1-3b0afbf6995mr1859212a91.6.1793896929286;
        Thu, 05 Nov 2026 08:42:09 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm4447277a91.3.2026.11.05.08.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:42:08 -0800 (PST)
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
Subject: [PATCH v6 4/6] drm/msm: Add cleanup help for disabling IFPC
Date: Thu,  5 Nov 2026 08:41:51 -0800
Message-ID: <20261105164158.23263-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105164158.23263-1-robin.clark@oss.qualcomm.com>
References: <20261105164158.23263-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2NiBTYWx0ZWRfX4IQ3nhPnO+Wu
 jznUacTRf7DAFsWENhmAQTfG/qDYnTR9gv63bj3jEwEVHLO2L2kjQo61sjEt6Meda/TWowOcsx4
 bJsAgOnMoLd9mXlgp5PNkIb/cpAAR+e677k3hQa38SCQb4VTyAlXKwue7Yq2GcvJC9/r+ASe9eT
 V6yIos6mOanoKmUp6siSwQ1YWCJG77NfBS3y2LGJ5LDLDvb3Sv5l7zfhXP1cJrH4TiuQaCdJOZV
 sq3QJ2vApo7nrr9A61iZNOfRvK/9z183qaHb/8ZWNUe/ML/1wOgdtAPKGKE+6Bb7gzRWhTDF4x3
 /cgqtuANfKZuPlDxJ+AMJmYyLU5lYkgERLIPNILs8gYM+iHu575n/yZqvOWft54947rh3vVxk45
 xNgBk6YrCqR5NKhTiSX+KVRhqibZUfRbHqGRdKghOAjI5+HFDE1mPxs2TIuNh1L3N3turoSZOKH
 BIHgfaNfC7dOCfalBIQ==
X-Proofpoint-ORIG-GUID: LjiKc3iUB5T168kCdYk-1wWyG80bPFo-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2NiBTYWx0ZWRfXwPeAjH48IgFv
 KsyxEk7J4vfYNkg+8hxb4dWNZwTfGmwrnkKP/M4lIYZh65uvwdgXNK4IZTKJIR1834od8wSxeaI
 snxMGASFE3FRC8x4vuIVfrvYFgYZfRw=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aecb1e2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=vTD2gfctXtM-Q-VHBdUA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: LjiKc3iUB5T168kCdYk-1wWyG80bPFo-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050066

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
index d1abe0ef3d1d..055b9bffad39 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -405,6 +405,10 @@ msm_gpu_disable_ifpc_put(struct msm_gpu *gpu)
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
index b1b07212252a..23b967be0323 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.c
+++ b/drivers/gpu/drm/msm/msm_perfcntr.c
@@ -267,7 +267,7 @@ sample_worker(struct kthread_work *work)
 	}
 
 	/* Inhibit IFPC while accessing registers: */
-	msm_gpu_disable_ifpc_get(gpu);
+	guard(ifpc_disable)(gpu);
 
 	if (gpu->funcs->perfcntr_flush)
 		gpu->funcs->perfcntr_flush(gpu);
@@ -303,9 +303,6 @@ sample_worker(struct kthread_work *work)
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

