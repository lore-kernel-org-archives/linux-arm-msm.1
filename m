Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E4C3EF0D3
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656087; cv=none; b=oX6e4a+Aztz7Gw8459pUt9Smp1pvLx0iSiJXvZN1ZKFErgCmJ4esx1oK1qJFIwJ9d/376DrkmfUOzfUhBhN0iiI6q1O6SpzYRjCK0kaqSt9CbIDJmGjVdOhWZiTT9pISOloAhXtXAY6rNL/L7+uc2B8k1lWVWNTUFhik36M9LG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656087; c=relaxed/simple;
	bh=RFTciPI+nxW5BGq7bvVuLZ5n+fGy2vZwA3KysuQPE2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gZTV05uWjRks8sMHC2iB8xu2JPqiE/y0W6GXHxZ8l2eTbYDnuDMoLpduNKhsTOMZSNSypdihEKK/LiHRuOcauHTLSg4zeQKU5QRESQ7Ukm9RS8njIm1iWDN4X8yANMP/5adcZEyCPfHPBzQLjqpqjGTuqv6bcFCl+KWXD+LxI94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JXhUrV9W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jbT9kaNg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JXhUrV9W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jbT9kaNg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47lfG3655328
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5i86ADppHi1rPUDdBO+P0YYM37FqBEqSi4JIna7g85E=; b=JXhUrV9WX+8SdlkW
	l/kztBKEDeXYOML2v+4d6jY+22/2fIWsytujgg3vnEj4hIJP0Xn1JJW8eU/hygi+
	zDWPM05/b+T56RbCsxceQ74BrSnkfKwn6vrBKR/iKe9KBnjvPvRf1ZsoiL8Ohe9J
	S4B/C57+F1k6KBjMfyJgXnQAQu8yAY+7VHs4P7zJLQ+ROVM2paSc81y6cZC0j9Eu
	3xBDzAUfPtoi6ocBlpapfAqw4z0os4Pm00zQSisLw4uJgDTkHgaCGiboTVptLMmA
	YrvQB0RKeMid3rTi3m0jgQNunauEM6DwdpW9dILS1L5xMdk17dX0DUMlE15zG4w1
	CjO1Fw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew0jya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:28:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93bfb2da664so1088017385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 21:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656083; x=1791260883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5i86ADppHi1rPUDdBO+P0YYM37FqBEqSi4JIna7g85E=;
        b=jbT9kaNgyaWHcixmc9Ko1yjxKT/HvDVBEzz7128Rp+mMAUkdIQrDwRlKfhuaLKYZGw
         RZ11+Wa0AxAj8DNxum/PnCNpF653KAyN0CEFdIS26xgn71oaI+uJ2DrGtIaK4e0dstBB
         gFATXP/w95nZ67UyzWTUiw/OJUhKqvTzCKOcx49Jru8v+ORWf+tleqOvTl5a2yzL41qx
         9/mFy5qbY/L6/WFkkqKOA7yPC+0n9MwdLgLFl7Ij8DajfpxCnv30JWJtcirZmPrRqdd+
         3QVnL14bzxhLAv/MLTvWKtU1nKHR9qzZoYhk4UFyDU42FPf0h4D8rTd1FQvAyIY0EuD/
         to9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656083; x=1791260883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5i86ADppHi1rPUDdBO+P0YYM37FqBEqSi4JIna7g85E=;
        b=qPjzr1Or/MxQbSqSAUdGVxIIYpB0p+AfZX2onuBvlDo3w/n7iX7FrfxCmwnHeRu7UI
         Bx4zJXiWzFS+pkPgzcsUN+gRnWzMou247AQBAaLjjXRZIgTmC9SP3+0hJZlNp1Gl+UV3
         UpwJ8mvpZKawY81rBqttNucnAJ/yPYMGJrhHJylHjm7vwP9kbhq9hlnlyZF23gVp+wFd
         h1l08iEqWqVP1pdLIf3wd2QtiaoS/7PVaYdKqm9D55VG5rL+lltzor1ZNXiiH+bggyb4
         xhQ3rDrtHdIPDxJoJihA3mCQYQZ7scJAsNKlKshllT1OnZ/EuYpE4/ERbuwBb5jFCAPE
         VEsA==
X-Gm-Message-State: AFuF++nhj37zPgD01CMGQj879fRkDON8pawDkRYqifZvb+G2xs3Nltu0
	wEgaEOdaXThhH+5c134IXURA1DrsKsN/z41HF7yv2Gf6DOm3LKnGo6G0YmsCVFkbRA6PT187GOk
	dWu2QZfQX+g7nwA3w2GCYbeu8erFj2Z+EgQCCwPPoL28PffnGl9Rc4tOPYjmXxdj2N0KU
X-Gm-Gg: AYBFou368FkmgyAAJyHTdWZlD/a9ubOFiIrbhihapCWW9AJ2JERrskbfC5jeqUzWQ8h
	G11c3KJbZc+sLuA+/KUK6897JIpWUGE3IRtUgihIvG80YEWg1qTuuh+s+Pb3NVsGWW79zXm/16K
	o2rEnJxx+qXNe7R+SV8mV+ZCWmHAWSywaWV7gD9pXcUb/0M2021avO4AaIVTjxLZqO4xZsaEsME
	LgTXDNkCZUZJSnPwYCZarkrBZdIrs2jviF2bsyZCPCT3HMwrKo4WfgRPv79VtoU4zaMWPesGWLy
	pJEeasyx5ZyJf1pQxijkD5WaFq6GSigeF7EBNjnXI1RW7vF4UCLfnB49y7oKy7MHwu0hhVMcy+J
	yy8sPRm32PDr0smh1soyE1A7noBqSz3VyiWHqotO6rI0qgpq5jIX8KzovJLbYP1M=
X-Received: by 2002:a05:620a:6602:b0:939:f89:3688 with SMTP id af79cd13be357-93c47498f78mr2243576085a.42.1790656082735;
        Mon, 28 Sep 2026 21:28:02 -0700 (PDT)
X-Received: by 2002:a05:620a:6602:b0:939:f89:3688 with SMTP id af79cd13be357-93c47498f78mr2243573985a.42.1790656082256;
        Mon, 28 Sep 2026 21:28:02 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:28:02 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:44 +0800
Subject: [PATCH v7 20/35] drm/msm/dpu: pass msm_display_info to
 dpu_encoder_get_intf()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-20-4b81473185e7@oss.qualcomm.com>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
In-Reply-To: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=1951;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=RFTciPI+nxW5BGq7bvVuLZ5n+fGy2vZwA3KysuQPE2w=;
 b=0ZpsaYMN1m/MNaf81oF/EXLAIvZEeuCkX6yO19dzRJ8r4d82ydlMdvRiZ7Z0HfczW4rySQgOa
 VP/5H8V6lcKAHnU16naqGY8Ktu7/z1Egq49zy7x5RPqbrXYfMy+athg
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfXxx3m+ppS4IWl
 PROcB6UiXbR4srYFcNhuyWsEgL3FgF7JPzVVaQqN/XUXJjQbBxBBZanwxjZAUB4XW1nm1uUwA3v
 6D0Z/YSTag2R+3bfsTNTXkMOYtUPsow=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abb3e53 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TTd-C8IxYANZTSfMnlIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfXzhsuwzdaR/y/
 eGZOXJwDoK+V7rq/lFrqZX/1opgRc99qp9F0L9CesJmKK3kg7PkNvboN/ZITIDsWUTXeUJOormv
 ebv3pwGLPBISApTxz5lO7TOBXslunZtTcoxbQxNiQeUdAFE1N5OXW2UOyKAB+D0LIxGDL0qYL/w
 conK7Fwqefy/+ofWsvDuAfuOUtgBhEI4QdM9zGJKt5peuqc1eByv2mr3s460R1vWSKXWRr/C3t0
 uTTqE3f09zeeCOvpwFftqUqFNP9VY5Uu93Cx9CHXlaVDtGSnVwDp7t9WG1S03SHzSP9KJpKR5vL
 HarFarDev76RZNzxki/shTiurkCoduDbwCyW1TjuLWEfLkDI1U4uIGaCx6Ebaj95hw8NWCmsnxl
 N0oxiOynueYIXo9FBulQt/afBN3xxGfwM/pI6zNnvxmqBSdVSyGQIorODhAn1yxtYOoFOQ5ET/U
 O3CKeH6IcpgmUbLbRDQ==
X-Proofpoint-GUID: bg2G9CJwtEs4sRp1MM8KybojbiWGaCDT
X-Proofpoint-ORIG-GUID: bg2G9CJwtEs4sRp1MM8KybojbiWGaCDT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290017

Derive the controller ID from disp_info->h_tile_instance[index] instead
of passing it separately to dpu_encoder_get_intf().

This removes a redundant argument and keeps all interface selection
parameters in msm_display_info.

No functional change.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1f20695f81e3..91cbb0ca521b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1437,15 +1437,16 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
 
 static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
 		struct dpu_rm *dpu_rm,
-		enum dpu_intf_type type, u32 controller_id)
+		struct msm_display_info *disp_info, int index)
 {
 	int i = 0;
+	u32 controller_id = disp_info->h_tile_instance[index];
 
-	if (type == INTF_WB)
+	if (disp_info->intf_type == INTF_WB)
 		return NULL;
 
 	for (i = 0; i < catalog->intf_count; i++) {
-		if (catalog->intf[i].type == type
+		if (catalog->intf[i].type == disp_info->intf_type
 		    && catalog->intf[i].controller_id == controller_id) {
 			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
 		}
@@ -2674,8 +2675,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 				i, controller_id, phys_params.split_role);
 
 		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
-							   disp_info->intf_type,
-							   controller_id);
+							   disp_info, i);
 
 		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
 			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);

-- 
2.43.0

