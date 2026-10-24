Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792837859;
	b=lMs9Cc8+WUUs7oHTKKRzVWXbJ/cqkQxLJSX5i6xthszUL4v8jUVGresswsPgJaF5ub3W
	 hs1TqrgTLUANR1xhLevbHZOSo0WT0X0pSjuzbBPnKwj1XLYLXLLU5aC0rGIOk+q2Fq3HV
	 6ByqFLn1Vbo2b1PSON0EMvSlsP7o9qnvpEfz56iEyAFiDpH4sIvm0cESB5lq4IpeL6D0A
	 2eB/Zy1JMTXYv3dN5KUyHkI6PsHRp57pNJ0qkYZHNP7oZoS1vQmPNwS8MVz7PH64olo6V
	 w7m+5ZiM6m4PfSy4YTvXmVpzDUij19JQu1Dv69cuClA4BwhfCDCUzOxTZ0YzO6vt53w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792837859;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W3J2Hpv3nr4vSLVvjMy+VwXttjkCdlyxfB9Ss9Q/kT4=;
	b=VntXtZdZ/KU0i6/M5Tt7QxJRhPkn+Y9M6KGCPJXbOZv+QFIQqZpl7yJOWXB8dzSW41lO
	 4FJC0npyBOXfd5klEMx05Q26B5LXYnsX7t9K2TC39+ac2VjbHNVn2uBB08FXRvHBMOJjR
	 EMFEMGPO+NN1yTFjFV33mIUxTBHRfDl96CSeZY4WYvQF5POwAbzaWEW8Z25uVlFr4AfKu
	 hkvfxF/ymk8b7YZfJnTBoHKkSWP/jKbQet26Tv4m5LFyg4urpLHldEprmxyUQtMIDLalW
	 7267ShnfICofw8HLuAoR3rm4I9+/cWMJdjrUjSZcJ+82MieFRMktxFhVj+PvcfFJLQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="b2IO1Ip/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TIo1fOAL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A031606A323
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 10:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A031606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b2IO1Ip/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TIo1fOAL
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8ohAA3828961
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 10:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W3J2Hpv3nr4vSLVvjMy+VwXttjkCdlyxfB9Ss9Q/kT4=; b=b2IO1Ip/yTuqxOc/
	k6PpGXfC6zyRvx5EAyZ5wfOcuXSB0OL9ZRCWv4KSH1Q9T1T0v5sndAde6mK2JY92
	S1qjSt+rew3pujqHIk3uGOLZPf/ai/CvqjI7zCiY1SV7mL8GhnRq5zVkdODHZPev
	EuiB39D/gwfZ2uXHY2+TfN6f6Hckolh7eHaZwlCM4i6osDHM4aQKvKD9GFlLDMbz
	kD4QkMHTKcREEjRlni8N+mRneBwyuPnW902OJTK241hXZsbDczKgY9DR37MdeakS
	uPN3qkx2KinvbOXpRUpxrE/FGcp7TFuFc4Tt9N6/KlAJMA+4rJ4Y4gocRaX0FycR
	lVkhAQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgnuk8kev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 10:30:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3064640eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 03:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792837858; x=1793442658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W3J2Hpv3nr4vSLVvjMy+VwXttjkCdlyxfB9Ss9Q/kT4=;
        b=TIo1fOALGSvK1fVscOt9IWluD2DRQoh7NIcmxK/UXnbrKmk6doo8EoIVOgDSTTl6bx
         /v/CV9qizw7QTkqaoc4pUJfYDBIfKr4BcQGxRUWpVlZ/+vzy+6+X5ltR/ZqeoZKsrv1u
         Z1yooRQofAngabBWmYfWxvmA9Ctz14G4ePs5NKbduElScr2jnJz2Oz8cKuhTG8e9GpCN
         NtDo7e4qjKXLVjLsPVY6leP7EYDKR38teP33GrvGCgFTOfhdCfl10blwEkx+tItz4ODV
         kjVhfFpXR1ag+1HIEgtYPm/97Tv5r9xWb6A5OStlVVRItWZ/LBcYwaUx/nKk/+gpTorz
         YIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792837858; x=1793442658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3J2Hpv3nr4vSLVvjMy+VwXttjkCdlyxfB9Ss9Q/kT4=;
        b=aHQ4CdXLy/uLAT1MSMfEoPL8dRWnt8kJlUfSXQ+YEp8fwI89yHnbnZUow0VgI5hdi3
         erePpwCx93IZH2KtyFcTpDO7f3wgfvtNcknC6w7MgK6op/w0iswVAS6a3Pi24bzvyD06
         Bj8DzfpOWuW1nJQvzy69OQRX819GhfedjZrX3JJX7FrUxcrqL6b443TfxEE+Keifj2gF
         qdBx1t0iQO/+j+f13j2oLA0QGJNb4Or33Dqpj9pYwjLbGOsApogjyP3hgC+xOjHcoLfv
         Ip7rYc4mqqi7mYzgNnYOX7mfyCVDKa9Fk9YAGva9c9e/z/HCkFvC9c0fuVfTBm9PsPn0
         Dc8A==
X-Gm-Message-State: AFq9FYL274Pq8t7PfC3SxJp8ZaOJ1HFiVpvZAMMyWMKjEHtdI1bekJZJ
	g4wvMWrUN8XyDjCg3Bg9ec8Ly/hR7OFgFBYpa5AqWRPAK8rjKcexyPxnkOaHhtImnmZdQybPNlx
	OHezSnbsJJrCbUz6Qe75eZbz+H/9a+8c8OounxDeMVC4RgMGcn/XuWcrgGNatN5W+uf5S
X-Gm-Gg: AYBFou0ZXMOc7gK/Hpgh+sY5ZnygMkcKXNwJNlQsqpo05zHO370w7miGI64EX8gGWWa
	IG+RvZwbl9KFwjKU23WSUdfwTjR/8Yid3B41L1jaW7UdlaEB3H+Uo+ZKaCkL105vw9RJDM5VDfn
	zFREIr6gT6W4w3Glmb5eqsY9y+BS/QN/t80nQciTTGyE9FLIgLxVWG34PFP9N3ni1Y+68XR+UHr
	PpWMmek0Nsg5i7qorUhstj/GZAQ7Srspn7vB/tMNfa76ABXKPqksz5ZqOBFculy914M9+1FC/0E
	+p9w7vq6JkRd/+F7LgttDZh0pvuDvZTAdjQuZ9zIgapMW+eHEcvRNDT0iUlc4DyBWGxdabmk6/L
	3X3htbyylOCcJ/gikAUn5Kh4=
X-Received: by 2002:a05:7022:1508:b0:17f:7280:134e with SMTP id a92af1059eb24-19937025bfamr2402484c88.32.1792837857572;
        Sat, 24 Oct 2026 03:30:57 -0700 (PDT)
X-Received: by 2002:a05:7022:1508:b0:17f:7280:134e with SMTP id a92af1059eb24-19937025bfamr2402436c88.32.1792837856936;
        Sat, 24 Oct 2026 03:30:56 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d5a10csm6009441c88.1.2026.10.24.03.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:30:56 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 16:00:11 +0530
Subject: [PATCH 5/8] drm/msm: Fix sched_prio inversion within a ring
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
Message-Id: <20261024-assorted-fixes-oct-v1-5-2977f974ddb7@oss.qualcomm.com>
References: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
In-Reply-To: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <ltuikov89@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792837816; l=3775;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=/p/xExe2wnQ1Pu4lNe12i74ui9lWBHsGWXEq9LYZN/g=;
 b=hgIcpVXBteagZ4vvfmPlFpmSXbnrYhFRwM5DvkNGy7xtffRy5qpGkfxqu0prTpDW2AkWa6/pD
 Um0wfeBa7bkBJzLTWIS/wYiSFGTxf/POcyBWIkaof79aeSxwPpLDfov
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Z8Z5j3RA c=1 sm=1 tr=0 ts=6adc88e2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=F1ZHhNDtVFIJyJQHAloA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: pOLLCXYdHQBLxsj5muJdDrO0xN28wNBu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA0MSBTYWx0ZWRfX7FYHIsiS2GGl
 ISGkX/Hae7Q62/ON9xVdjFX7ThwoWDdiE/5tJLNGu/4l9Kzr+wkL3+oieE150sG9VWQYHig0eDh
 8OiWe0dHlK+edIRI9ny17SgGDG/oe0x53kdf4r82eMByuoPa89sqCNa6rYB0BcVSwbsTSosoiQa
 zDgJR36r+yICgde34O4+Ke6liJRBcwQpL74LVyxIWLfpApIh5C38ufB+deCE92AbXKRCJQ2b01W
 oHgb+vlIkQM+nqUF88GvkuVspANypvv/v/0wlQYqMUeWugZXCeLDZjrAsmD73Ng/Ri/GQbbqyHc
 nWjz7EBj72grvXaNxdRoDdQ/qPanP4rD6wPMyEWuNwk4B2iz7hSMJNBFPYFX44aqpJY5QSKqpt2
 jOgEfhjj4rZoQjJyazlAG/5GQfzqoYRCGV8TFv5oUsBUgQ+WP0cTtj8Q8GB6MBwc6KlUSeMDFjS
 kZ82mQZY70xWI1RM5ig==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA0MSBTYWx0ZWRfX6mKki3sW8T5a
 kYZ6LmINyV9qkXra8pW+AegsdY9g5fYsZ/oDOaLSPnDiJo1Bz9Tqd/ACeKpQPnz4LVOaZGwBarx
 VCXaJACnWWKdIzNp67YrO1h3GDnQwx4=
X-Proofpoint-GUID: pOLLCXYdHQBLxsj5muJdDrO0xN28wNBu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240041

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

Commit 38f922a563aa ("drm/sched: Reverse run-queue priority enumeration")
reversed the values of each sched priority. But it didn't update
msm_gpu_convert_priority() to match the new order. This results in
incorrect sched priorities within a ring.

To fix this, remove the inversion logic and add an offset of
DRM_SCHED_PRIORITY_HIGH to keep the range within [HIGH..LOW], reserving
KERNEL for internal submissions.

Fixes: 38f922a563aa ("drm/sched: Reverse run-queue priority enumeration")
Cc: stable@vger.kernel.org
Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.h         | 24 ++++++++++--------------
 drivers/gpu/drm/msm/msm_submitqueue.c |  2 +-
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index d27d54bdb7a7..bc5b31eb1eca 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -522,17 +522,18 @@ msm_context_is_vmbind(struct msm_context *ctx)
  * @sched_prio: [out] the gpu scheduler priority level which the userspace
  *              priority maps to
  *
- * With drm/scheduler providing it's own level of prioritization, our total
+ * With drm/scheduler providing its own level of prioritization, our total
  * number of available priority levels is (nr_rings * NR_SCHED_PRIORITIES).
- * Each ring is associated with it's own scheduler instance.  However, our
- * UABI is that lower numerical values are higher priority.  So mapping the
- * single userspace priority level into ring_nr and sched_prio takes some
- * care.  The userspace provided priority (when a submitqueue is created)
- * is mapped to ring nr and scheduler priority as such:
+ * Each ring is associated with its own scheduler instance.  Both the MSM
+ * UABI and drm/scheduler use lower-numeric = higher-priority, so the mapping
+ * from a single userspace priority level into ring_nr and sched_prio is:
  *
  *   ring_nr    = userspace_prio / NR_SCHED_PRIORITIES
- *   sched_prio = NR_SCHED_PRIORITIES -
- *                (userspace_prio % NR_SCHED_PRIORITIES) - 1
+ *   sched_prio = (userspace_prio % NR_SCHED_PRIORITIES) + DRM_SCHED_PRIORITY_HIGH
+ *
+ * The offset by DRM_SCHED_PRIORITY_HIGH keeps the range within [HIGH..LOW],
+ * intentionally excluding DRM_SCHED_PRIORITY_KERNEL which is reserved for
+ * kernel-internal submissions.
  *
  * This allows generations without preemption (nr_rings==1) to have some
  * amount of prioritization, and provides more priority levels for gens
@@ -547,16 +548,11 @@ static inline int msm_gpu_convert_priority(struct msm_gpu *gpu, int prio,
 
 	rn = div_u64_rem(prio, NR_SCHED_PRIORITIES, &sp);
 
-	/* invert sched priority to map to higher-numeric-is-higher-
-	 * priority convention
-	 */
-	sp = NR_SCHED_PRIORITIES - sp - 1;
-
 	if (rn >= gpu->nr_rings)
 		return -EINVAL;
 
 	*ring_nr = rn;
-	*sched_prio = sp;
+	*sched_prio = sp + DRM_SCHED_PRIORITY_HIGH;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index d307cdd17d90..8d550d281704 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -136,7 +136,7 @@ get_sched_entity(struct msm_context *ctx, struct msm_ringbuffer *ring,
 		 unsigned ring_nr, enum drm_sched_priority sched_prio)
 {
 	static DEFINE_MUTEX(entity_lock);
-	unsigned idx = (ring_nr * NR_SCHED_PRIORITIES) + sched_prio;
+	unsigned idx = (ring_nr * NR_SCHED_PRIORITIES) + (sched_prio - DRM_SCHED_PRIORITY_HIGH);
 
 	/* We should have already validated that the requested priority is
 	 * valid by the time we get here.

-- 
2.55.0

