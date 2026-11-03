Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731667;
	b=M185t0fX373mXwWtGV2EZodbVVf0E2h7Zs7mxYvPLdffNv+qoFY7PfVxPAe4qhXbEEl7
	 VA680SaUnrC2A3J+RBEt8YiZeDJZDoxXwF24oG629YoUoJWhggNrmuQdYa/IpmuBrPSWD
	 lBHMpAy9VRf1Ry7cZx1qZSeJ951vZooYqAni1ULjnZOhZeVwYnMvKHD473kZOP/D9dyWy
	 MgYhBdSbVmgK1R4rpRXAlDK/MeDApwGeVjP6godDcNRmKDY2q6Q2cYo8WOWB0ZeJgqy7T
	 Li6j/nYx/ZEDy/6BrwyKZFgynebB7RuQTAzOFA4axtVA5jvxqiKehc0kxvLjqhInENA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731667;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yKmSGK1vSwOyKiBV/4vQNcT9fTTMd69aRbOdB8aI+io=;
	b=Eb0zIBoItEx8gUCVp5V76f/P2BLuTmf3/Tjivfj0TRHyBxePzRHQ4rnZVjXKi6Wltp5H
	 DQ27zkwwtoTURYX1mR0kDhdYLYeiVSVZM7sUoOhDnWBt04lVXajxZcjIAv4DSAOgYaYSf
	 +4NVEQdr4qzHd/b6WSimupjAoWaTNfLjJFHWDU60pz5Bq7ArhxbIGpSWE9SEnbfpOG6dh
	 7GRldI4D0kfQ/66vL2ZAX+Dj+epQEBgKisywhBQzg/bI4/4vUUNZoHig5GOoci+zQ7+hc
	 mjbNl+iaaITEf+1aDfxe2TpaMxTgaThDZ5UBKfWnQ9GzaBJNaAQyT++5qnmtkqnRcPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cz+enp+8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CafXZnDr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099B7606A33F
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 18:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 099B7606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cz+enp+8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CafXZnDr
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IZ0Z23675764
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 18:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yKmSGK1vSwO
	yKiBV/4vQNcT9fTTMd69aRbOdB8aI+io=; b=cz+enp+8NeRPsyQqCo+pZ2rWniP
	Hj6irvUsKPfl2Hxi+Vz5RjIMKmT1zRtWOQQ5PjYlmPy59Ok4QXw4w3NSkeuam0VZ
	cbgNScVhkjb4TAlA56zbdeN5eYhTxeTQmiA6gIAtqGF4HowtyvtBPfY9tgd1AyTU
	XKV/7kUIcrUoOiOr0rKMUW/NULIBchuAbDLJDUq9mP5R6QmxTq3lpmBSXtR4l2g7
	EVBUXNceI1/qjSq0ST05zoFXJ4iUjG1UU7xWucVWwbS5GErewOPTZ1sjdIr2hMnS
	ijfE+zVdzCHtiJyJDBggUbgEHFD42aOF+utv0vCK1/eHe3MsBiNLsmwrsbw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhyph4nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 18:47:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe5dso6133058a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 10:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793731662; x=1794336462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKmSGK1vSwOyKiBV/4vQNcT9fTTMd69aRbOdB8aI+io=;
        b=CafXZnDrWvbaGfXBRJKSkJGbQr3UGx88b5Wz1rGo5WKRcuvs0/BLyC7LwFbi29df9D
         N9VnF2yORvMDp4yfNhKj5lmaJTO8tmA/LVVopVenPuATHuqxIeEKTnPcisi7GRKPUnKt
         64PWRlpE4Ri+J5gY6tIydENdben7LH98CEeG4LoR+Bh2LuSvu1holhjTyjZdd6QlWCb9
         3mkHroJ+yd2vQY4EHDgf6zF8UnQR93zd8+fzS2rjygq+s+uC8Z/XiABSntm5wjZ/qvxU
         pVOGH6aKPz85C8R8k37IZyj8B4suOaHJ0q3pviHDhSq/uCJozDGfI9oSgJFQeOvUojYt
         /kkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731662; x=1794336462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKmSGK1vSwOyKiBV/4vQNcT9fTTMd69aRbOdB8aI+io=;
        b=aWqsNVvb3ZdU2eF7ISu+oRubYeqa3NRSCpbvi+SNLeVIakK8dVWaokZrBes+S+W+Gj
         oXq8FCPd10wpnN/v4twpTWMB5LCqNEmcuA0uxa3fMAY6WRHUcJ43fm6n1DwNyPRi2G8W
         gaBrdLCCxzNpoeNFgJsmXzrvgFvCy7GljhEqAAvzbtnoIABY17FU6H9Gb1hjVD34nC8T
         /snjcPR+rO0/S9avSmwiwOHGK+wGaW0jhzpwalkvAtBhIbreUFbUi2jA8mArO9fNgsDj
         YjSub6a2kHDmUqIp6adW5HmzueGSe/Iy24Wfs88B1oDNSYvm3plO0qhcwzYQTR+1Pu8W
         gGBQ==
X-Gm-Message-State: APuU4Z89VF6s5o2JsWpxR14zpQbhOsn7Rj5I4C6SGqfecHmF0cO2TKXh
	CyXx6sWYObnlIqwCjuvxJTqOPWPIzfkC9f1o2XPrPjTXN2DoDWugb5um0us1XsfWxeayPK89q3R
	lTxrpCyPSPpaxi1erC1NdeXyfmZcDCi3NXnrTOEAZwLOGn4ya+PPkyKPTyzexveCzJK8Y
X-Gm-Gg: AYBFou2jtLYwBmdrxzu0DL4i/CCkSmlFHVFtNuym76oHu0hfs/3Wr2RSld2GRT0tQnc
	OAif82E/cxAc1OE8rGI+Gm4RZp7vX7Ydt6fDREbnti4xCQa5ZJTCsUX3z+e84UeYQYPVUdI0yDB
	VrsxobA5QOdGUP7Av6TbxahV8CM5cJKaYidzgHYIx4GZpbCakhpPiJXiGN17r8b1/5F/DDYi0ph
	E59OGxmM5Gd4eNgnsvfmgYQPTCmeg9VOZaUQaX2JoADuKbwQgHKbIQid59/AZIBDfCzwpLXpVJG
	NBD+bm3tDbEM/8wD2LBuEBlMZYGlIWoNA2eMBWu9lRmnA7MvS2tVWjFNgwJpCTNoEqn4fnpguCN
	Fpe2rqT5tGH71BkLPdjDwkgYjkKXBxB+oZomFMG3oQdLBD1tReRkAhBK6alNpt9dyBZbvLiZK1x
	t/lkPd1kfo15NwWAmUVTBkXGf/PqNXARzWuL1WZR0IAsmOvOog8mKNBHpmkQ==
X-Received: by 2002:a17:90b:4f87:b0:3ae:5572:c4e2 with SMTP id 98e67ed59e1d1-3ae897e5685mr11081765a91.57.1793731661756;
        Tue, 03 Nov 2026 10:47:41 -0800 (PST)
X-Received: by 2002:a17:90b:4f87:b0:3ae:5572:c4e2 with SMTP id 98e67ed59e1d1-3ae897e5685mr11081752a91.57.1793731661350;
        Tue, 03 Nov 2026 10:47:41 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c7e087csm5545438a91.4.2026.11.03.10.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:47:40 -0800 (PST)
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
Subject: [PATCH v3 2/4] drm/msm: Add cleanup help for disabling IFPC
Date: Tue,  3 Nov 2026 10:47:08 -0800
Message-ID: <20261103184713.29664-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103184713.29664-1-robin.clark@oss.qualcomm.com>
References: <20261103184713.29664-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA3NCBTYWx0ZWRfX9KBb08tMXKGy
 G/bHZph9n9I6piETlSg/TJsAwEM9qtu2QUA+Iw9vMMGd/tuGXZiifyrAezPFjKRMMNFq0eOBfeG
 QYjd1lFM5IsGx8C10skM6oX5PBY/j0g=
X-Proofpoint-ORIG-GUID: imU_LGaYQp697IoU27qt4_an1mmzF1-I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA3NCBTYWx0ZWRfX+QwrzZwuhRtH
 jQ8yRHThZIPeGkX1MI2Wj3ZxF4UBNR/mxtPWyT3KRO2iGH7Vi1SAp5T+gDpWerVopshKZ6QMnWC
 uN6ifsbpTFG7ZAxrp5l4Il5sCND65Zw8/HXcXkTNLyAo8ECJ+GzLsEBsGjCOsZcLvpdhlLbMijE
 3bTaeqdoVuWoG5mnM4IMNRlZnlKCaSe/8UZ5MLJRQGZOfybzLEoLvjlIOMe22LnVUOdHyKNMPCx
 OfquP75XHsHO/rAo4ZrHSInNTJyZ6AUWZoZetggY3XpCsbbMGLYGfuO0rblzG2WmURSWK4PvcT6
 6TE4DvToZ4jad/WCIhX4ncQqRoWKDDo6dO4LyA+wVOwZRYZf6F7yzREe5k5niwkhC0cEs5rDI6o
 KH40pgBX6DlfK3UjrMBRz+yb34BHCBz+UYTwGQzj5aXC3W8nRNyL8Z3iqSeaQC5Z5ABkIrZYOcC
 ivaTGapdU/8zbbsRWNA==
X-Proofpoint-GUID: imU_LGaYQp697IoU27qt4_an1mmzF1-I
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aea2c52 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=vTD2gfctXtM-Q-VHBdUA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030074

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

