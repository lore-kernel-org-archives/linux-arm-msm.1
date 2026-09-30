Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941774E3762
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 13:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775426; cv=none; b=j7FsEAkjhexymO5038jqO5Ow+hrzkqRgS6tg8u+0RqB8fYAxweAvBDPSYA0sDzbVtoGKuBP8hrPLjm4ReG6ceuKhwXypsq586MeNBkwT+DlINSAGuRLeengUo+1emAnIf4VLyJayR+87uoityJDvJd+axDzxTQkkQ9p1aAJm5LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775426; c=relaxed/simple;
	bh=5j7e0HkNKk1PCIDPhYgV70i6SghClNSTMPq1qNiKRnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qR0reyoL6Ts4iVpZyDiYl2/BuyivLNOE0AbBpR75aRkQUQX0+ve3jifd+ZDkiso0khPC81wkEXcQs2tFl/hpKKKZmWHx4zqiXx1Nvtg9I3iwuNOiVqF+drnfRJnqQBwOAE9xl9itfeUA4IcgV2Z/tY0dq7YKXk187rdVeKFR2qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=peJ03wPR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/W9VuZy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="peJ03wPR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/W9VuZy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7ovY3955028
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 13:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VOZvv3gRAV4Yfr/2IAD8LT6d/JrOTz4oDcixnCJZyHI=; b=peJ03wPRAJtbDZGm
	kt7yP0NhIl8GP6lT/NBxKbW4cypAeK9qqfurVszXhEOzw2vFIFS1JTDQpbe3v6Hb
	FGofqCVExAcLStLydz5/jCQ4oWMsY5db3Oxe+SqvIUZV9wWLEcJAiawWOg7ZnJnE
	HebIy/L4iquLbObTl9Ky3Gu8YsibeZVcCxip0Kqw2IAQoePGYu9w7wQySggVKgzA
	ioFCN+1j5P/FdfdqdkRYRUzFX/naZvJRhezc+fl8aZKRgn2BSMrjY9H5EtNsn6vD
	4/5hLqsHUDxpKcEBpKw3EHELSoNYWOebSWR9RcBzdRAtl5eyGCBkmO1c4Bl1mvD7
	qYOYpw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j97vk65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 13:36:55 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf645a7717so2188137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 06:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790775415; x=1791380215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VOZvv3gRAV4Yfr/2IAD8LT6d/JrOTz4oDcixnCJZyHI=;
        b=H/W9VuZy5BX6wLZ/p1cGwVy7b026qlYvHXhgfQQ7hSNHOl6gIDOZhEQeAycvJebOG7
         ZzK2fggkBSHLPBe6E8CT6lNI7Hj0jWxLp5KlPSnc6cBnktZy5lcrVky7GeyY8c8/++hX
         5icYsXu7Hxf9AbAdsK8Hj/luTmkPZSUgrtwVoZ08qfUdlzP2XbhNTu+7qaULi12QsrTx
         oHSYIb5eDzfwJNDwnV51GAeKhN+BA0zsKmz/H903Nsl4ZYf8YslnK7KOVbnJ/2VKoE4J
         ZcTRGJEwECSVl1KW3TipUGGWtWcwqVUKULeqiOoGgBiZesmBGeSPlfvRomR6p65xN3hQ
         GOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775415; x=1791380215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VOZvv3gRAV4Yfr/2IAD8LT6d/JrOTz4oDcixnCJZyHI=;
        b=Ooxib8MLZ36QIVRseg3G+7Sc+R5L63Wu1MwYH7kY7wioP0Ji/GgLfSW5eowysBKtCr
         aSTAZvEZ/kcA3/tysz0CQ4woQxpHLB0r4S9LZApI2oLPJvhN7Ekw9K0jNHCTnZ/R8Pdc
         q8wB/9+pwfZrxP7tL2GXBXPm/nV0um3KiA+BNzT1ICaGo5vQi7n7uWdhwBAARSP3kKqH
         jmI/SMKtjmBVVD5eghELvKALJQeyPP7BGLVoZa8RAydepUxo2P/66Q3HXsUyd7X+movS
         e/e5yoHWJJ1wUMNROU/7jxFO25gPyisL6FeRNsFk/nkwBIC6F4ooVDo3LbpydK74I1Ez
         a2aQ==
X-Gm-Message-State: AFq9FYIZDZHYVa3XKaQ0upUBcGcH/x5fnmQcgWRvQbxasyq6I/wfEt69
	syGIVtyZPnypgoKp4eEB9EDjGllKT4ZY7/4+SGXLURoSfNT9Xcdh/6D1PQ60PiHgzRIvRuDhDth
	wWJOSul8WSH1U0D5/YrCS7HeXSwjHP9nUPdToW79iq94o8wrfzFPlG2gnI1DGIr1wAvat
X-Gm-Gg: AYBFou2GDajZ4eUZOG0TgZSEJr8Fwi2bBin8LiQpwtNSP3NtE3BBqA7Rf8bk1xJLoCq
	0yZBV1bmhWUFnAvQeA0+Qm11jP98lpHa35TNRIHsgPgdNR0hnDsA3ZuMrNR9yX7petZICvwr7e4
	aopIdluqmWNdqaFXFkK94YNNhyWNVsmCZ+q096DAW73gOdYnffED6vILZCmEd0qF4BiT5f++AA/
	IXLDe3Wio7oazb2Et4HovrvpaItA+xDBISORcwtAi5rtSkdXXE11uMyGM5uPlMcupHonIikx1Ja
	5tpdhpmInP6BS/lPON7bQfaNi+clgLrcmPmSr+refeptFhC98DOa9JtPVatT8b4j1PXimLV5CIA
	9dpbj3Yvjx6xlaAPPD/E/93U+7NquT2qp/pmut44DHRtIKVMEwEPYsS2Axf0RuUx01DCnkKpHEg
	==
X-Received: by 2002:a05:6102:8097:b0:79c:99ea:2c9a with SMTP id ada2fe7eead31-7be72ab7b3emr293633137.11.1790775414794;
        Wed, 30 Sep 2026 06:36:54 -0700 (PDT)
X-Received: by 2002:a05:6102:8097:b0:79c:99ea:2c9a with SMTP id ada2fe7eead31-7be72ab7b3emr293615137.11.1790775414195;
        Wed, 30 Sep 2026 06:36:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3fbfb582sm356731e87.57.2026.09.30.06.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:36:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 16:36:48 +0300
Subject: [PATCH v2 3/3] drm/msm/a5xx: Add hangcheck progress detection
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-adreno-progress-v2-3-3882f0fcd7b4@oss.qualcomm.com>
References: <20260930-adreno-progress-v2-0-3882f0fcd7b4@oss.qualcomm.com>
In-Reply-To: <20260930-adreno-progress-v2-0-3882f0fcd7b4@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3387;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=5j7e0HkNKk1PCIDPhYgV70i6SghClNSTMPq1qNiKRnY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqvRBvIk0vfYBZyCPpYepLk5T7fPnp9O3i3128F
 XQ3bhvbqn+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCar0QbwAKCRCLPIo+Aiko
 1WhWB/9IfBV7lWmh/j4E45WV3DyfcZEOXfz0L88TOvyOABUeFhTm8gMTHo3FIwsMy9tNlo9Gh25
 jHOp4GyLRYkouATi1FpQ5Z2plLVxmukXIXntRsMlT9OmfJ49fB3u/RlpEAisih6SGq/9vod4Xy7
 faqcQDdg+9b06dMbUIXUP5skmpu9OmRLtkurVCpSDPkvnjHKdCjwK1lcEbHp3YXvJGSzLp5PZa1
 7iZtlPziQVJrRkudQv+aA4BVyV2H7fLsqm+EkJDBUSNAsC4C+nX/smW+5cuOeFRdRhE8Syi/o4O
 VEPooo9qzfFX0D8pLzClj0Q9m+3ELIsWm3pa86p8SM2Reepn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: l5DShyaWHw61hmRVONgDUv6g3_ORAHfz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NCBTYWx0ZWRfX31JoZ/gv58z1
 SdhDnn0thyloOsirBzph6Ex8+JTK6j97vJQRbKgqapju5i/OK411vZYAhWAa9DoizCUBOHDq54H
 l8eO/lWy3FAYeEFsyQ7R4FgiqY0KM+jdPVK6S/AfNzS4plMcNJRWm8TF25qA2awn73LgA3Gkxw9
 9Hp6OanzsRwhPuAEIAy4wxwCLaleUUEPg6Whynv+AlB0XmSDzlRlMl5oGVlyl8dAIMrWDFysY6z
 L+CNoC32ZPq1UJ9xqc3+KV4PuPJxJcHCDSGUHYOguR8DaYDkwsw/hk7D5qcjFUBZWIICPUy+CUG
 Fpp2z2+eNXMwj6bnFVhfBrIJJ63HJaqHDZVbYjcfYhyHvLzt8y734kLcUL/zuafAFnmY8+vlSlr
 //XJviw0xo3s9I12O2jDS2EbwxhJsnJpf8Q0auxvR+odj5Zk2eTp7Uq6piPvIl6v49zNc2Lb6OZ
 bCE9FuUsEpCB8TZsjrg==
X-Proofpoint-ORIG-GUID: l5DShyaWHw61hmRVONgDUv6g3_ORAHfz
X-Authority-Analysis: v=2.4 cv=BPImP1QG c=1 sm=1 tr=0 ts=6abd1077 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=8wNfRxjPmpLGpMwT6toA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NCBTYWx0ZWRfX/NLzD4upIOjA
 y8ZgEQ5CzDwzUkl4CEPwSQodODgg2ErQgmL3GRB3wRCn/4pwm7k4Md+d9tRZOdicHvJVaTCZLNw
 uSa6hpxGvTOEr/iOzyU3eOYo6a88wg8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300054

A5xx has no progress callback, so any submit still running when the
hangcheck timer expires is declared hung, and long compute dispatches
such as KHR-GLES31.core.compute_shader.simple-compute-shared_context are
reset on A530 while still making progress.

Comparing the CP IB1/IB2 state, as a3xx and a6xx do, is not enough: during
a long dispatch the CP has fetched the whole IB and waits in one packet.
Also count ALU working cycles on SP performance counter 0, which Mesa
leaves to the kernel (and the kernel hasn't been using up to now).

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h |  2 ++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 5d96b8f63156..9f4a97195cde 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -748,6 +748,9 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	/* Select RBBM0 to countable 6 to get the busy status for devfreq */
 	gpu_write(gpu, REG_A5XX_RBBM_PERFCTR_RBBM_SEL_0, 6);
 
+	/* Select SP0 to count ALU cycles for hangcheck progress detection */
+	gpu_write(gpu, REG_A5XX_SP_PERFCTR_SP_SEL_0, PERF_SP_ALU_WORKING_CYCLES);
+
 	/* Increase VFD cache access so LRZ and other data gets evicted less */
 	gpu_write(gpu, REG_A5XX_UCHE_CACHE_WAYS, 0x02);
 
@@ -1687,6 +1690,29 @@ static uint32_t a5xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return ring->memptrs->rptr = gpu_read(gpu, REG_A5XX_CP_RB_RPTR);
 }
 
+static bool a5xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
+	struct msm_cp_state cp_state = {
+		.ib1_base = gpu_read64(gpu, REG_A5XX_CP_IB1_BASE),
+		.ib2_base = gpu_read64(gpu, REG_A5XX_CP_IB2_BASE),
+		.ib1_rem  = gpu_read(gpu, REG_A5XX_CP_IB1_BUFSZ),
+		.ib2_rem  = gpu_read(gpu, REG_A5XX_CP_IB2_BUFSZ),
+	};
+	u64 alu_cycles = gpu_read64(gpu, REG_A5XX_RBBM_PERFCTR_SP_0_LO);
+	bool progress;
+
+	/* The CP can stall on one packet while shaders keep running */
+	progress = !!memcmp(&cp_state, &ring->last_cp_state, sizeof(cp_state)) ||
+		   alu_cycles != a5xx_gpu->last_alu_cycles;
+
+	ring->last_cp_state = cp_state;
+	a5xx_gpu->last_alu_cycles = alu_cycles;
+
+	return progress;
+}
+
 static void check_speed_bin(struct device *dev)
 {
 	struct nvmem_cell *cell;
@@ -1800,6 +1826,7 @@ const struct adreno_gpu_funcs a5xx_gpu_funcs = {
 		.gpu_state_put = a5xx_gpu_state_put,
 		.create_vm = adreno_create_vm,
 		.get_rptr = a5xx_get_rptr,
+		.progress = a5xx_progress,
 	},
 	.init = a5xx_gpu_init,
 	.get_timestamp = a5xx_get_timestamp,
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
index 407bb950d350..fb05f1ca3e81 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
@@ -36,6 +36,8 @@ struct a5xx_gpu {
 	uint64_t preempt_iova[MSM_GPU_MAX_RINGS];
 	uint32_t last_seqno[MSM_GPU_MAX_RINGS];
 
+	uint64_t last_alu_cycles;
+
 	atomic_t preempt_state;
 	spinlock_t preempt_start_lock;
 	struct timer_list preempt_timer;

-- 
2.47.3

