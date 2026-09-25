Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51212116F4
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 00:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790296091; cv=none; b=ejUT78S7t3Xx0Tb55czCVUP+HQqDs6RRFrb4cg7uEO+jVc3ydMZKT6LeF73LbIbsalmRCQKPv/YzJxvNJofeJLHkoPkpNeJqS0hRP6XtDYlKIROLvotwMGHqZkkQmCQT/kSpXDPKLZ9IuCUg/nyOzMQs2TPX6btK2v1fvJPQ1+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790296091; c=relaxed/simple;
	bh=RRe/M59HXbxjRixy4XO5DhqWDHVyqbLcU5jbmJbr8wQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j3gnfC9lDL75+plUtUqQYV80X3xOlOq7t5Ky4ncItSOkEX1eNXV3VrxVTPUzA90ZxO468ZGs88qqm/sAXl3jmxsSEYmSCcWMSrKaAA/8kj+ZmW8Gv0ZJsmGCt74acKcxNgFl/04VrWnsvtcN63tGSD90bEGvIfAf3H2zxv+fdlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X6NrLMWq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZrBKwTg6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X6NrLMWq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZrBKwTg6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMP8tP281015
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 00:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HrTPcHVskWcs1qSOuD3ZacM1lBHxmSmBRImIrBhbwUo=; b=X6NrLMWqgqgsi08c
	wQONkTjaG2GUhavR8kVXe+kmGEPp9Uj4uHmC1rTQM7l+iMaYPREwPd5L6HoyPLgz
	wdQeiNs2VL+OaZ7m40AVG1ZhnsWrjHoyhEr9lAVRHu5QCkiL++C5tUPW17EuuONT
	69giR865tLOfBD+v8HsHLgxkGrHW7m9y8HQk+ROIV1FYQB1zbCzjRyWwhfOBa1z4
	89t1KTrr6PPMvm+GX7PfJOJrQ4NefuvSCiLD6MECKCBbeQfK1OaGR2Z4FxhaO7Zb
	k+UqaV4LgXHCpzmMvFkPyWvlfNzCCZdQkF9J2monkFatLxtR6xfOFY5yP60jlZNP
	g6mONw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce78awf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 00:28:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c58d35c0aso68829eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 17:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790296088; x=1790900888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HrTPcHVskWcs1qSOuD3ZacM1lBHxmSmBRImIrBhbwUo=;
        b=ZrBKwTg6xLErmePSm+SWOolgh70sQV5KWbTC/cVRx4QjaV7xLcwC1zOooRt09dkXJX
         cTEWXeAp1R/xGlGkk/iYsE2W98wY2gRUGBq0OwxmEc4wkhjLF2J67vD8a173B2LqVkyu
         l0riK/U11w+x2ZIXpSeGNRL/gH8M/U5i12KQ3FFBUmt9kw77Os1JytrMJICjbODJiTHN
         VQn1rr4O0r8wkAWtHE6l8XJIAMRYMOIYfRo4nKLakGJcZd7jtRQfLqNNYPxGnhbx87OE
         av6Gf+4FVD6gNx1zgsHlDvxVM/zBQ4eNRKiiSOxNslbHq3ipkUhyTYRgYliwQlqDafbW
         LRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790296088; x=1790900888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HrTPcHVskWcs1qSOuD3ZacM1lBHxmSmBRImIrBhbwUo=;
        b=VeQNbyD9hC7/KBWnxs435xZ84OJSPAtR1hFepa63AwKIOAKxNTNVmFRFTxRIzh81uB
         yprseFu1biQljPQi9+mKkE0GuEqcM2Vp8HaOl33ETY2WHCSVl6vVNdn3kwTlb/0RRJf9
         PQRcDGCspHcmzaZ6839e8ZeMMeaVB71FtUJqYTlBqDI76p4O9bXIQG2Aky7Euo/CSVS+
         AXGT6RmpA6PPJH0c6RB4bLCWHGrJzhFoIntBxE3yl+ZSkPBOUaVv7Z6LOgQc5G/vy0Ar
         xhYj/38MPA95w0r4NlnHs5Ob/Q6Ai6bRoqviEYvIdL9U1mvASW1opTMEZLQ51JhF4Ic9
         1NZA==
X-Forwarded-Encrypted: i=1; AKwUvBxhsJo9IsQ3gPHxgSdZplDQG4Nwrnltks1Yxdi64UJD3q/FAv3xaXXAQ0EgPHlm5u9sTQfiT0LqomdSJ3Ak@vger.kernel.org
X-Gm-Message-State: AFuF++kqaNUG8aoZzDy1zpvRNUxVfzRLx1nw8KQ3VG29IJu5hJazX1L+
	709/DyiCfhVBMBO6THtup3BvFIaPPmh/tJD4biYaQfOcn0891rCa2vUhZcx45vEk6t0+faiSOQJ
	hLQOR6m7iLhv1sSUh1JB3T5wyJAEZ2NTrxJv5H8g4MfDaKXPkM0DG+UMiso3p4XxyxlC8
X-Gm-Gg: AYBFou2BdQKNCDNdngGaT49OQ00KRbyYiq67aJkue0FQanGs8BeyaAcQIesT7TQKRfW
	3JCoh4ZfpcIkGJTII09OCOQ6PKceKDP4sJvtIgPuJ+sXj2Z1ImDu1KJ3JAKLgefGpFdUa+O3QI5
	VE9vRx2X5GEFi+dc/+8gDPucwxUg7c0S+szRuadaSKOLnBEoGYG1p1YhVdVsWxB9h5ceJK8+ZWR
	ldDEce0EOzpNOkdhkqAzMp5G0jIOFopoJ075sJmaVDnpTi7G1zDDWALjhxwHkCl7judzEqyAu1F
	ryviv/XW8/9EaQCK9UTbAvhdKEePxxaH6R3ojAsQBnYFnQ43+wInrldbKv2mPLl1i/XH0bD9JWL
	9TqxOgQAvJmYLPZp0ozrp77harwGy5zkyQgNKSGQNKx5RN2OIk6yv567p549H
X-Received: by 2002:a05:7300:7f28:b0:33c:68b:c4d2 with SMTP id 5a478bee46e88-3400657428emr4523859eec.2.1790296088043;
        Thu, 24 Sep 2026 17:28:08 -0700 (PDT)
X-Received: by 2002:a05:7300:7f28:b0:33c:68b:c4d2 with SMTP id 5a478bee46e88-3400657428emr4523822eec.2.1790296087266;
        Thu, 24 Sep 2026 17:28:07 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414485a9cdsm1873736eec.16.2026.09.24.17.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 17:28:06 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 17:28:02 -0700
Subject: [PATCH v7 1/5] media: v4l2-core: add new control type
 V4L2_CTRL_TYPE_S8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-enc_roi_enable-v7-1-6fa7413af23c@oss.qualcomm.com>
References: <20260924-enc_roi_enable-v7-0-6fa7413af23c@oss.qualcomm.com>
In-Reply-To: <20260924-enc_roi_enable-v7-0-6fa7413af23c@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790296085; l=7891;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=RRe/M59HXbxjRixy4XO5DhqWDHVyqbLcU5jbmJbr8wQ=;
 b=xftFkAbkXUbp95J1PXO8pyTZKOuJbPA2eWbJk86331oIp7R3t3NVXiXT5X0IdxLUWY//D7toc
 3c43yLZkWWwBJu0sdXUzst8HfRLIDLIU0us8LYKaaxN2IIfuNIQgJQX
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: kq_J17J_5LhBEKR0pe3WDVEq3rbzLjBP
X-Proofpoint-ORIG-GUID: kq_J17J_5LhBEKR0pe3WDVEq3rbzLjBP
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab5c019 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ZvH2QzoBumBvrUatZloA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAwMSBTYWx0ZWRfX1do6gPa30Ywy
 zVTZy4W4fDtlrr3sbHDME5XmeTQ/U4oGdbpOipZ0cqsLjmikFkn5MV0X9VKR4Lz1M/QX8hqMpyA
 Illfe/9oAcKa2KkUPoi455UaUPEJa6PPyQPl+hSaSHgFQRIAv1jm3MMEXSH6YltjMEx+zBQwnCx
 2o+8G/YL/HTosyImsmsTWVDXrBc520sjbEMX2AjK96pUlxp45S/SlyMxnUDZIlY9VhcnprLr48Y
 4VNPBe0Y1dThr7rZM7r9TUTFbQtGw0HFHrGecmLwumevBVkQJzQ4JFLchrKC24FRQC6sHZm6Ly8
 2EqUGrFoOb9A4gzaKe7iURdwo15K33sS3X9VTBCV/ySdCWZNdMIcQHwTkTm/I2phnbjcnnsbhvv
 0vrez+iOgZs09ElofWKiv6T9B5rSoWl7VSrsa5G30+J10Go946MD3t4qeI2VvG2BgB87X/jMcI4
 AXNA8f/WDfd3NQGHmFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAwMSBTYWx0ZWRfXykXi69MVjkUW
 W1pl477vh3g6wrPmnxHmKpXy/ciC0l3FUWQ0U7kEiLbec8MqCKL7pCC7meHW6Zr++8EZpKglFuz
 dLuLJjRhT6TUqFaoc/sgyVy9SM4kgnM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250001

Introduce V4L2_CTRL_TYPE_S8 (enum value 0x0103) as a new
control type for signed 8-bit values. Add necessary support in
v4l2_ext_control, v4l2_ctrl_ptr and handling in v4l2-ctrls-core,
v4l2-ctrls-api.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 .../userspace-api/media/v4l/videodev2.h.rst.exceptions   |  1 +
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst       |  4 ++++
 .../userspace-api/media/v4l/vidioc-queryctrl.rst         |  6 ++++++
 drivers/media/v4l2-core/v4l2-ctrls-api.c                 |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c                | 16 ++++++++++++++++
 include/media/v4l2-ctrls.h                               |  2 ++
 include/uapi/linux/videodev2.h                           |  2 ++
 7 files changed, 32 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
index 6182b4e2d2ee002c0d3562e1cc3bc2fd9c4286d6..b036ed3ec2f0744175cad1cbc4e73fe828e0c955 100644
--- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
@@ -141,6 +141,7 @@ replace symbol V4L2_CTRL_TYPE_STRING :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_U16 :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_U32 :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_U8 :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_S8 :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_MPEG2_SEQUENCE :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_MPEG2_PICTURE :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_MPEG2_QUANTISATION :c:type:`V4L.v4l2_ctrl_type`
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index d78328152b7552f8f0d30a9e2f7c104bfd4b70d3..fe5f8992389c32d8f35f432229ef2f734002644e 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -188,6 +188,10 @@ still cause this situation.
       - ``p_u32``
       - A pointer to a matrix control of unsigned 32-bit values. Valid if
 	this control is of type ``V4L2_CTRL_TYPE_U32``.
+    * - __s8 *
+      - ``p_s8``
+      - A pointer to a matrix control of signed 8-bit values. Valid if
+	this control is of type ``V4L2_CTRL_TYPE_S8``.
     * - __s32 *
       - ``p_s32``
       - A pointer to a matrix control of signed 32-bit values. Valid if
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 82c8b52e771ce9301491b3f752e501a8fe7e2434..57e1652ae72e0324742142446acf32a16b94941c 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -425,6 +425,12 @@ See also the examples in :ref:`control`.
       - any
       - An unsigned 32-bit valued control ranging from minimum to maximum
 	inclusive. The step value indicates the increment between values.
+    * - ``V4L2_CTRL_TYPE_S8``
+      - any
+      - any
+      - any
+      - A signed 8-bit valued control ranging from minimum to maximum
+	inclusive. The step value indicates the increment between values.
     * - ``V4L2_CTRL_TYPE_MPEG2_QUANTISATION``
       - n/a
       - n/a
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 93d8d4012d0f4fef004e417d0aee2ae44b1b30bd..7d41cfd7378baaa929d4da0266c45f731bb54285 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -980,6 +980,7 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
 	case V4L2_CTRL_TYPE_U8:
 	case V4L2_CTRL_TYPE_U16:
 	case V4L2_CTRL_TYPE_U32:
+	case V4L2_CTRL_TYPE_S8:
 		if (ctrl->is_array)
 			return -EINVAL;
 		ret = check_range(ctrl->type, min, max, step, def);
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 661a3a25da5220d2e824f71e68871181533e6cd8..c5df0e0a54f81c73975f427957b7c99fd421d5ad 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -297,6 +297,9 @@ static void __v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
 			memset(ptr.p_u32 + from_idx, 0, elems * sizeof(u32));
 		}
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		memset(ptr.p_s8 + from_idx, (u8)value, elems);
+		break;
 	default:
 		for (i = from_idx; i < tot_elems; i++) {
 			switch (which) {
@@ -377,6 +380,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_U32:
 		pr_cont("%u", (unsigned)*ptr.p_u32);
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		pr_cont("%d", *ptr.p_s8);
+		break;
 	case V4L2_CTRL_TYPE_AREA:
 		pr_cont("%ux%u", ptr.p_area->width, ptr.p_area->height);
 		break;
@@ -1442,6 +1448,8 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
 		return ROUND_TO_RANGE(ptr.p_u16[idx], u16, ctrl);
 	case V4L2_CTRL_TYPE_U32:
 		return ROUND_TO_RANGE(ptr.p_u32[idx], u32, ctrl);
+	case V4L2_CTRL_TYPE_S8:
+		return ROUND_TO_RANGE(ptr.p_s8[idx], u8, ctrl);
 
 	case V4L2_CTRL_TYPE_BOOLEAN:
 		ptr.p_s32[idx] = !!ptr.p_s32[idx];
@@ -1501,6 +1509,10 @@ int v4l2_ctrl_type_op_validate(const struct v4l2_ctrl *ctrl,
 		if (ctrl->maximum == 0xffffffff && ctrl->minimum == 0 && ctrl->step == 1)
 			return 0;
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		if (ctrl->maximum == S8_MAX && ctrl->minimum == S8_MIN && ctrl->step == 1)
+			return 0;
+		break;
 
 	case V4L2_CTRL_TYPE_BUTTON:
 	case V4L2_CTRL_TYPE_CTRL_CLASS:
@@ -1732,6 +1744,7 @@ int check_range(enum v4l2_ctrl_type type,
 	case V4L2_CTRL_TYPE_U32:
 	case V4L2_CTRL_TYPE_INTEGER:
 	case V4L2_CTRL_TYPE_INTEGER64:
+	case V4L2_CTRL_TYPE_S8:
 		if (step == 0 || min > max || def < min || def > max)
 			return -ERANGE;
 		return 0;
@@ -2037,6 +2050,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_U32:
 		elem_size = sizeof(u32);
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		elem_size = sizeof(s8);
+		break;
 	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
 		elem_size = sizeof(struct v4l2_ctrl_mpeg2_sequence);
 		break;
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index cec9217d97ac698cd447574f5d079dd913a9ef6f..6a181a6c6b43beae87310cacb044a0cc7ad2c063 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -27,6 +27,7 @@ struct video_device;
 
 /**
  * union v4l2_ctrl_ptr - A pointer to a control value.
+ * @p_s8:			Pointer to a 8-bit signed value.
  * @p_s32:			Pointer to a 32-bit signed value.
  * @p_s64:			Pointer to a 64-bit signed value.
  * @p_u8:			Pointer to a 8-bit unsigned value.
@@ -61,6 +62,7 @@ struct video_device;
  * @p_const:			Pointer to a constant compound value.
  */
 union v4l2_ctrl_ptr {
+	s8 *p_s8;
 	s32 *p_s32;
 	s64 *p_s64;
 	u8 *p_u8;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..ac588d0093df9cc35c11d0b9d41d052d5e800925 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1884,6 +1884,7 @@ struct v4l2_ext_control {
 		__s64 value64;
 		char __user *string;
 		__u8 __user *p_u8;
+		__s8 __user *p_s8;
 		__u16 __user *p_u16;
 		__u32 __user *p_u32;
 		__s32 __user *p_s32;
@@ -1961,6 +1962,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_U8	     = 0x0100,
 	V4L2_CTRL_TYPE_U16	     = 0x0101,
 	V4L2_CTRL_TYPE_U32	     = 0x0102,
+	V4L2_CTRL_TYPE_S8	     = 0x0103,
 	V4L2_CTRL_TYPE_AREA          = 0x0106,
 	V4L2_CTRL_TYPE_RECT	     = 0x0107,
 

-- 
2.34.1

