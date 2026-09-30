Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B094BF92E
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 13:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775426; cv=none; b=rWBG+hdt6tIHm3EU/ZU4zvj1DivfajWTXT2VGT9sUHR2dlcgaeE0xWC6kg19VcSxAKhG1UI34s/5UPVfz+OblArwQFGj8wfbGjUtD/j4o4OAM7VIYdzYNgz7SPPMONlKWhh0mlGaN7WJnA2wzRmzXUWT5KDzEarH0UAKFoMU7w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775426; c=relaxed/simple;
	bh=mrFjQ87puxCi5QNDllM5X4hiL/QtD1aLbA5Sw9zYT6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kon/hBS+eyPjssFLUdYs/gyfxp/l/QYBz8UqGjd7/hOdOfy35MOJCzqiTQ/Fa9tsPLthaV3u1VdWUk6iY2RsPXVrrEVBZo7H0nQc22QfFs/WwizZPu6j0QtBRifZWAc5WoCmRBvhFtLJUPWnTDKnkCoanNrZYXWxMAhUg/dojkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i8XBLEc2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDwhnG+p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i8XBLEc2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDwhnG+p"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7bMF3135730
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 13:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y3X1MILjhoW+3ywmS2mPHQTbGl5p98m6OBcUF1sWG8A=; b=i8XBLEc2/b8vgxpY
	dL3748515rFdGah/cHbYi9fKWCYvWjSyTUlpkAk5H8wddH3tBtKvLKYe+mHbry5k
	/u6md2pdyfgCloXokgKES6JLPpzPsMTj1Uhb/zMa/+ZfQWDxHRIeIAB/KJS9EJxQ
	sIvTuT006NyyDWcRdfG5KB5iravEmlhXL4qLI8md8BeHIksCpSEs5hv21WkZdOOd
	1HBHepQ601tsoklt1xyI3Sy3UfCikU9+Xvf+4WpI70gEwL/LMunIxCBvcDtvKhkk
	uonn3YQH8c8iqJDKOxWDFoLDpYJE5NoPAKQt3rQ6nG2DlEGTRrnuhQUjsMbNEXqS
	04evgg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x27hn20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 13:36:52 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf257e7b5eso174837137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 06:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790775412; x=1791380212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y3X1MILjhoW+3ywmS2mPHQTbGl5p98m6OBcUF1sWG8A=;
        b=TDwhnG+pesPyRCo875iz/5bURyZSG2aPoh+yeM7ZgC/0BcHwsiIbdiS6wJ6LQp9D6l
         irj9TscPe3ngQvLOOEuN++DT5B/zW1h8LrcMQZTPH+xxgPN6DWeOY7EBxNqDUhFQKS6j
         h+WRw4irTcptj3b5bz4ZCQLdNcS/6FNPoIZt0wSNQ3Yt7/LwtmX8zy4E5WqcXH5u898j
         ixcUS6mizQVEelt+hbtTu0czjLoz9w/Q7rRKqchh0joU3O6WXP5AESCwTAyoHWKgps+N
         leh+WyEWFpD3DmIMuTfOsuX1Ee6x8nVyAIb488hdzA9zzgFPr7UhHm4Hvdt51OnKmOMY
         ELEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775412; x=1791380212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y3X1MILjhoW+3ywmS2mPHQTbGl5p98m6OBcUF1sWG8A=;
        b=fLxNhsIlgn1DJX44UYcUxpWCOwn/FnfjE3B6AGybUixsH9dX9iSUoQQ1+jsCAAjey4
         bYDB3ampRbKNf8TSY+lMmcphaq6PHwkuW8RlvMM+a19820n4wILBt+nhZhUtYWM8IpUS
         p3j2sm9NhxaJSI4+NhZQi0O67kK1tDhb0uUvdIJmugSuJBrGtCWVi7wv1hZ6YUMdX4d1
         yKll3OX7WsC7yKctjAP+O2mcoyB+tGBZYc8GMIWcuNiidMRJZVWykVBOEvNmYePDqPZr
         TIyoTT5b3yxWkrjECyAYYlCbOTFfsJus8TxcJ9NZAlX2LRvxVvL0RiDgbunWkpx9WjPX
         zcig==
X-Gm-Message-State: AFq9FYJb+6mXP3BvdF2hQF/ym5SXfyIe6zTwdCCs9ucuZK3SiPOD1hUH
	5kPvFUbfsZfa0hWXbtkNidHMns7q9agRuUA+sQ2G7qGEyfd+aeRVgOKj0h52fueGzLzCEEV5Xpn
	HATEcP2RZmIJsGKtXsuuxsbVAt58G9iDy/Cyc/gNKfFXHiwMLpoedhyiEbwC9Fr55TknI
X-Gm-Gg: AYBFou1wAb0jyXdm4bpZFqNLmuGJbdcla/qbESjzSZAsum493Zbm6cNPG1OfeBcTUlF
	WqLe+7RN1rQFwTYKNm/fD+ljtW0VFXfrNT60InP+ipfFo689ka+0DwOHY98PYL/Mvbmxj4mlakT
	LiGAiZfYfRlyjzao5O0UYkjGXOte4CiK/oOCOgxkfKEMEVsP+GYVXaJuR2y0+yaOvhZrHKl9QgP
	mDz5+ECyOZdnnlOuPmE7il2irf68XVplfPeCIK0z0XwbEOz7YikDkWhfe8O3pf9a7TBAMjn1Gf6
	dvn8I4acxqfLTOzcctyXF/qN82bYeleyNiek4Zf9AJxX9J4jjQGmCLpY5i0uwcWBcmZxvpsGMT2
	c8t4zUW8lry5j1X6EfQJ1RfRyH6MaPeROzxNe5KRpkHFaeiKLV7qJuYnntJSJFeX1V2PyvKU1cg
	==
X-Received: by 2002:a05:6102:5cc5:b0:7bd:3530:d84b with SMTP id ada2fe7eead31-7be72eab133mr311274137.6.1790775411415;
        Wed, 30 Sep 2026 06:36:51 -0700 (PDT)
X-Received: by 2002:a05:6102:5cc5:b0:7bd:3530:d84b with SMTP id ada2fe7eead31-7be72eab133mr311260137.6.1790775410985;
        Wed, 30 Sep 2026 06:36:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3fbfb582sm356731e87.57.2026.09.30.06.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:36:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 16:36:46 +0300
Subject: [PATCH v2 1/3] drm/msm/a2xx: Add hangcheck progress detection
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-adreno-progress-v2-1-3882f0fcd7b4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1881;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mrFjQ87puxCi5QNDllM5X4hiL/QtD1aLbA5Sw9zYT6U=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9ZegfyTlZ0V0rWWbSecV00/uM+v9vzyz7FCW1a8kvkmZ
 1gzW1awk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATydzMwbCppF79p1PbBtXn
 pivEHx5knZbsv7/PQiXT88Fi+U1Bibt9ZIQybk5UFG47f9Lb6Z/+z1M/VzZlHtQKfumV0VuSJ1J
 6t39x8DozfavjbY4vP1l7Sgf2yorm12W5rZiyqPp/Gfsnkc0XMhv1p3C9sSwUenY8dc32nQUV/8
 Mr1x/K1V43PcdRQzMlzmhyy9YnwY3yDi3haQ8u9vZYsu69uffxifh9PF9WqjOsn3qw3DEy7Mz7k
 v/ZzMGfNT5FvIgTyYupYJNjn/m0NnuZzLGUNsGwjCCZRUFNleJVs8+tEp515s07dulC/5AjtpYr
 XH+UtDRXzrj3yaVtQeXyO46clSVns228Ngrl3I/fOV0KAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NCBTYWx0ZWRfX/mypay+X02Tb
 K5NM2Rk65JYPN+5Ik9O1AE5fI3nkcXhR/kpIilV9BFEEWPoEciFfsX/+CI+4/IKs1v9h13x987m
 iNCaQO1KSVdbPAmZh2ZdafA+8u7IuDg=
X-Proofpoint-GUID: vAVgJGdQC104q5-73nh-KTpQS57BmBw5
X-Authority-Analysis: v=2.4 cv=W9GtxhWk c=1 sm=1 tr=0 ts=6abd1074 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=7JSXepjcj89yP10iIeYA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NCBTYWx0ZWRfX8TAN4QMSeudW
 CpfWl0MmufbHluUnI3CCI1tXqApqOthiPfBqT1vz+mMK62+d0xqpPkB2XVW9ic2myK91Gbl0THx
 n9PHluaeoEoTRApiSO4wu6kayTFuJyisVl/U3TOPzP8Gq3akmHMvC06ZkOQfCAEVkvWcB8LZ4ez
 lxBloedIavBFivhyuZBpPDTKvWsSLYHV5Fwqv7eTAf9B5J0BxOq4HIAeHYAAUSnBRyMOATfI5QF
 Kt+ddbgL/osPpnzZEoRkDOEDCs8nF6Fa2CHbeBzI4HOGXFALrNUkpTx9C1igCITngAj1c68zv/I
 NBfNzYmtK9eKSRIRGHSBfluttm2Kxg/TzfSI52MrTjG6/duJrLbD8DMS+kjE1SeGyxALRbg7dCi
 iH8awQ1Cf1GRWWe0IELSnh5KwiiuwgzeF69+9h2cOcdKfyOVDxGCvoos8rxiZxWTSc4KmWm/pTz
 HcXzYmomj3MITFmagow==
X-Proofpoint-ORIG-GUID: vAVgJGdQC104q5-73nh-KTpQS57BmBw5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300054

A2xx has no progress callback, so any submit still running when the
hangcheck timer expires is declared hung, no matter whether the CP is
advancing. A false lockup is particularly expensive here: a2xx recovery
is unreliable, and a second reset shortly after the first one leaves
a2xx_hw_init() failing for good, so everything submitted afterwards
fails as well.

Compare the CP IB1/IB2 base and remaining size between timer
expirations, like a6xx does.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index df4cded9143f..59d2f1684e6a 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -489,6 +489,23 @@ static u32 a2xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return ring->memptrs->rptr;
 }
 
+static bool a2xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+{
+	struct msm_cp_state cp_state = {
+		.ib1_base = gpu_read(gpu, REG_AXXX_CP_IB1_BASE),
+		.ib2_base = gpu_read(gpu, REG_AXXX_CP_IB2_BASE),
+		.ib1_rem  = gpu_read(gpu, REG_AXXX_CP_IB1_BUFSZ),
+		.ib2_rem  = gpu_read(gpu, REG_AXXX_CP_IB2_BUFSZ),
+	};
+	bool progress;
+
+	progress = !!memcmp(&cp_state, &ring->last_cp_state, sizeof(cp_state));
+
+	ring->last_cp_state = cp_state;
+
+	return progress;
+}
+
 static struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
 {
 	struct a2xx_gpu *a2xx_gpu = NULL;
@@ -553,6 +570,7 @@ const struct adreno_gpu_funcs a2xx_gpu_funcs = {
 		.gpu_state_put = adreno_gpu_state_put,
 		.create_vm = a2xx_create_vm,
 		.get_rptr = a2xx_get_rptr,
+		.progress = a2xx_progress,
 	},
 	.init = a2xx_gpu_init,
 };

-- 
2.47.3

