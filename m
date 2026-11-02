Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640009;
	b=bDFj0ns46OJ8JJQJHV9/iWPbkBbGW7ao/Xzo2UA3pQkeLaOJcVd5qxsW1uIAs2c1502E
	 yPle3LqQAySohnPkDKNsrxY6zG9ypUYJQBfKQlNJIjRSjwOM96eZhjwvlz3JGcJzrnh/l
	 j0HSUfDnBCt1u0iM1jlvti4YRlpmIi81z+LWVb3bjYdfWrvjtoGPNd1aqHy4PZTPs7XMj
	 6K25WFwENqxj7EW6tLBh2Dhh8u1NWz3HJ85MBiuMuWWOlNa+odyU8rKTfReEXVFCmKhpF
	 DwRpYu97aGWfdbcuKuvfM0ffxTUAJxsMePkGeUVT7wrKd+K15WXwI8n+4eItqi9816A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640009;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MvyBPhX3FXrO0Az/fY17mKualm8a8erVyVPUaeQCugU=;
	b=r3Lv6bpQZx6I5o6HLoN0RHvSg1QsdiQ8TeMkAO5OKaPxyK1kxqVRLpDfn9iK3qRquQa5
	 a/NPSY2oxWFTJdFsfwwLIN/GCkSiqa/33kp1S7LPT+BiFn5AovmD/Jp+CByiUQ8ZfGBcz
	 m/rbDm2D9A4R5k3nIePMpwJeYObY/9+P9n4othAPyN8tBa47HP9m55PjWuemhHlHlcF7C
	 zE3t/VB5zNhQOujnA1wWAaZYWnfbTr/5F/eQyaz7eCgaKKrfv/w+Lr4z3arJhtBiRDLFT
	 BU2UTVc3Rhp05W2jGZC1F4SNovpg36RVYxWUKVUXgoi1kuNljv2Xbg93so8ooX8tWQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="BRLe1t/L";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VUgdPr6r;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0150C6096239
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 17:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0150C6096239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BRLe1t/L;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VUgdPr6r
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2GYteI1222691
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 17:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MvyBPhX3FXr
	O0Az/fY17mKualm8a8erVyVPUaeQCugU=; b=BRLe1t/LFtTQtlIXteozw6MOBCN
	REU68L19mcByERTTW0XagIqobsC6PEkD6XtgRfY3sNFXdz0Dm7i5iKhfgPmthsHO
	hHZtau5AlhCG9arqdDRVjz9b04g6LZF/uBPjscLb3hNMQWaON3ZJ6tL/ZgToVdN9
	VU68ggxsZLmOOmKFp7Refl1mNTSDLxxwN99FQApWx1UH1z/jo8kdyH/KdGRGEalP
	VLc3IEI8CEMgI/bN4Xh0hTVerdHiZgMn0608mt5wmJBenxyXWABs3Oout5SVGXZL
	TyzvndfeUJKrdNw0TZOeF9tOdstvjY9f+Gzy8gt5aiNWnZDXkb+iCrUJ+3g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1tvy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 17:20:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adc5b185bfso3538328a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793640008; x=1794244808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MvyBPhX3FXrO0Az/fY17mKualm8a8erVyVPUaeQCugU=;
        b=VUgdPr6rY+RxmApV6nWj3MTygB46wxIfanOkLkDIUlWk7wY2pnNGHo1ac+BUGZZd9W
         x099Etj2RgmHOBdu6JeAxljgoOOxNSfb5Tm7V1xF+evYeCkzYqmzi4V2JhkhlBSXrTZp
         17FzG3nenJWHT+cXoMbznG1Pb98V7cnrCDdR0MXVhI0cr5wL2G7N9cc53j6EfGXut/Zu
         klcsegOzzu5qrScFgMuClRM1+cDAVUyKPMzxJSW7T9SluPgmEmcz1ig3psKSNUfbWyRv
         xcsq4bUHh7GlAYAddBazhlc63payx4szyZIDaGGNk+SaMKcXA8he79hcD9bgesH/WIvi
         bJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640008; x=1794244808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MvyBPhX3FXrO0Az/fY17mKualm8a8erVyVPUaeQCugU=;
        b=cHSuYqrRYuI53ZQT/V28VycN58ANdJmQuRkVqZWw73B5+l4N+9mhZEbgnOzJMQw0hB
         LS4kXqvJF/2DDCRU/x6MPmN04Z+imT6WWothHw0BMfWbig3wiogdMcvUhFzVaCPrEsVY
         HIqPIQMFxaZQClPZrGeV9olRJeuknxIHiJ6+hIWaHbniywPL14ptDganRZDpwKxTCCzw
         P9KgKFt0EgvZquK6e4pKxuIDcjmCvtCcux2VEC0OvuO2uC5RiP9SBs8BfPjLOz9XUzaG
         NaeI8KpIHt+bIsgPD/Q+8xTDbaYB2yZgMj0uc0OOtoUaqJSgecQ6vE6hEKNN7/H3Mr8Y
         jbcQ==
X-Gm-Message-State: APuU4Z/fqDj3JnhZD3H2oOpGfqnLUFr761PabFvE7M5GDZaO3wREr9Be
	Q5IP71A72cqrpPesSmPouvGwHb9q7PK/nmjf79iJMbFmff4QRLh93nwfa2hxLphoLrFj23TCCjf
	rxOSat54I4yvOzw/xmCda3M3hjbEkNnoFwXyBu1lhFjjlbSk1fVfXrCW/Le4QbopoDi5c
X-Gm-Gg: AYBFou0t49v8MaCY6A3xz7dhhcF4LapI6Mef5MfljQGEmynXCIpKnlbkpgiVVHFzan5
	l5EOAXJO1B7KGq9slB0jiMDHZofNdq4jodjJvctJvJ46cuR6GhZwO47RHe+E2+JqWhhbfuk+bxV
	3KnvVo/hwCDZDXWxIpcqccfuPHkJhbrutTG6KJVAmHUEyVSWf9C8i2eEf9yoj14JNWWH+LP0Bbz
	ujW/Ew/ASgqASRm+Vlmlqx8esnDd7EOcntMRIz8K5hTvPk6UJ6yqOLBY+kM2DjnV8t3f0C/TJQr
	6cTrr8kXFBXi7YLeSZVYMYToSu6A9800D+FaLyThqwzyDFcI55dSUqkOJjy8caWGasr94B08wac
	L7y3iqlKuFPb4hg5RcdLgDYEz9UMuPeLrnblqmVkszZLN8trZ6xH49WEs2h+i79PtLy5SIA/WFN
	X8wsMtrkfZVAftI+G0X+LxcQ==
X-Received: by 2002:a17:90b:33c1:b0:3a8:59d3:5317 with SMTP id 98e67ed59e1d1-3ae89751035mr9022462a91.32.1793640007638;
        Mon, 02 Nov 2026 09:20:07 -0800 (PST)
X-Received: by 2002:a17:90b:33c1:b0:3a8:59d3:5317 with SMTP id 98e67ed59e1d1-3ae89751035mr9022428a91.32.1793640007103;
        Mon, 02 Nov 2026 09:20:07 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c666cdcsm89644a91.11.2026.11.02.09.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:20:06 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/4] drm/msm/gem: Fix VM_BIND range check
Date: Mon,  2 Nov 2026 09:19:57 -0800
Message-ID: <20261102172001.508440-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102172001.508440-1-robin.clark@oss.qualcomm.com>
References: <20261102172001.508440-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: zmeV7FKpKNtcamsuYs6mWXZN_lCbgiZk
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae8c648 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=BFYDg4fWK-pXFiMG0zkA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2OSBTYWx0ZWRfX9V2FaXpfni1Y
 GadT1C5nPYf74vdgBhy0QmqQdlH3RqjBr1bST2FiD5hu7FmlTkYPv4pzMGxfD4SmqexL9TBKcz4
 uIiShCkfSL5wROhR3kKeUaOW/zzfS05jv+1mbTNkCEWGLU19Db2ymzy2blPVz/7tezAS5n1px1V
 OwU6vVSduVO/Of9y0VQbfkIhkRTc+ZjpDS4c1Y0O8YRP+tiKn/PE3HbqZYTSnoeNsjZm/n4qOkQ
 EBxI4/ltrEwsF1+A4/jNKAzyH4Ktf4znRldvbI4MCHF4WJ6Ija62oQ9T/frB+rfwKl5u+mroCeb
 jJfjohuyHT8Yr5VvV2KscIYDqCtWmlwJTjCZAiYiRd/fGVYmKZs0r1M4sjnnb0FcDr1FtNQjkpu
 TegG9sx9giVGHSbDTRtLgm9/57bktfRuDWb8E/4IbKP/JS13/tzHLquLislL230qY1HRQNCCcAR
 rplfwTgqjG23aBmhLSw==
X-Proofpoint-GUID: zmeV7FKpKNtcamsuYs6mWXZN_lCbgiZk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2OSBTYWx0ZWRfX/VEGW95nj3jA
 2CBKDYPacl8/j6HvHM0iTRZ1JMUxFL9qJmctrNBXzLfSeB0WOKjktB8MD95O4W4nFj6/rz8Mwbt
 cF/gBZnOgBz54mgAFAOvjcrM/Ef4m1k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020069

Use size_add() to guard against overflow.

Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Fixes: 3a3bef68a6c1 ("drm/msm: Fix missing VM_BIND offset/range validation")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index f687a629629d..bd1c3ceeea51 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1012,10 +1012,10 @@ lookup_op(struct msm_vm_bind_job *job, const struct drm_msm_vm_bind_op *op)
 	if (invalid_alignment(op->iova))
 		ret = UERR(EINVAL, dev, "invalid address: %016llx\n", op->iova);
 
-	if (invalid_alignment(op->obj_offset))
+	if (invalid_alignment(op->obj_offset) || (op->obj_offset > SIZE_MAX))
 		ret = UERR(EINVAL, dev, "invalid bo_offset: %016llx\n", op->obj_offset);
 
-	if (invalid_alignment(op->range))
+	if (invalid_alignment(op->range) || (op->range > SIZE_MAX) || !op->range)
 		ret = UERR(EINVAL, dev, "invalid range: %016llx\n", op->range);
 
 	if (!drm_gpuvm_range_valid(job->vm, op->iova, op->range))
@@ -1118,7 +1118,7 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 		op->obj = obj;
 		cnt++;
 
-		if ((op->range + op->obj_offset) > obj->size) {
+		if (size_add(op->range, op->obj_offset) > obj->size) {
 			ret = UERR(EINVAL, dev, "invalid range: %016llx + %016llx > %016zx\n",
 				   op->range, op->obj_offset, obj->size);
 			goto out_unlock;
-- 
2.56.0

