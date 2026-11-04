Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810204;
	b=CtiDzLsbt/HCFNm5muh19KU1NtnlJXkZPTmJJFev9OIeQ37zy+95TPtIVtJ7/r1YkpJQ
	 d1DhiD3FOF4UXXZ1oU8hChsXx2ftUWdL0Lo0md2nsxlmvCfL7eiN2XhGzSZAHiNn8Tqvv
	 WoR6vpjRaxoUzKHMYyrSXs0OdOfs/29cXNtYofseI4iQ6archH9rZpqR0Kr5vLKTUVk4e
	 TqrPCGQm4h2rjuKLzUnEv6RV4MGoqQEfBnBwgC/2la88IBozBoRKTMDtHS6LjvC5yJFIG
	 SmsIssDkcbuUK4jJjVEMv0F4UUvdPtwYzqpyrXQPOpbXgnAwm2C/GQWkvqbYXZDSSRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810204;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hmnctkQOqSlcJNDZpI/f3GW8bFHAo86SA9tyubOGVL4=;
	b=tV2f02A3TnwdQxH/dpPiEbkqsOtBAh1sD3poq+5mQGCtZNGVGht0T7LamVWelYt93MnB
	 ko29XDqr71w3+Y6nmaP8lD+zi0L8c4pvXVhbkrqa88vkYjtoYZRnBPZH6pymG6xhM5bwP
	 w++LrhZvalxv9lkmWp0+g4DeX8q0sl0Ex2l/sKseO+xiWIqjdc5MdoFZphecMEBXJfaCM
	 DD5B1pZjSQSTOOJfJIMs9qknQqz8+fuS1woVpQDh2VDyRpPhPhBdAnfN588nRDZvKFLcG
	 r2IJNUGcg1ktLijVN1pRiHTpZrxCoOHU3Yh1zLxUooN7lH8k//3Z6ez8zomWANgRodg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="m56zB3s/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z9uMX0Jx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876836082BD5
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 16:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 876836082BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m56zB3s/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z9uMX0Jx
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Fj8lD1692569
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 16:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hmnctkQOqSlcJNDZpI/f3GW8bFHAo86SA9tyubOGVL4=; b=m56zB3s/GIp3aK0n
	HaOL6N2dPtpScSklVRfq9cXQe975Jw+9JBLeOADAB/o6/nr9F6EJTopuRgBAPjCe
	tdkz3U0smPlO22yX/+m4I6JhV4B0cS4fkfqZhuzA3wgSvvCK2zGCEQL4Rjs4gMj8
	jlL49/lEn9HIbmPJtRqUgb06IOm51xD2F7YPgp00E7AOqHhKzuKDfNraC59xwzA+
	4jLg/U9mAoDV0jhnc3lb1UhLdF4G2j5hlboqFB8WIb6orMaTyOGopcNTKdFCl5vg
	/eOv7WhMjImyRztmxOd5Xx26P9xoSOpSGTxrFe76rfffZccFsje2m+Ra+poM9tCV
	ykdizA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6br0jk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 16:36:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f37c94ceeso353715685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 08:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793810197; x=1794414997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hmnctkQOqSlcJNDZpI/f3GW8bFHAo86SA9tyubOGVL4=;
        b=Z9uMX0JxiyPoPUjERrk1Dr2WXSk+N4Tubi0bsIavDOKnE93SOWI/S0v1+AQUp3I26F
         +wWdr0HUf6NsQzA73kXcbaYqTsz7Hex87kpMoKz68O2ksF2tVi5RhOfvJ+zDn1bt4oVD
         9EmqntknpBjTbx5DqXW0oDJyKeVGLZFlkrEFpc/7cCxlDIbVWX/6LhaZFr5o7UNmzjux
         q0GAXoil3eHJVh8avln7iND+QR6hgcukL1cjXj5D90t4tn1mNjQClzChPZTkOowjd4yU
         uc2wWjCED5YjoQy6lW+x6wqXoMSjlrxv810JeE6GvXwtcsYhLLFS3EY0vAlqPUociUpl
         3FMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810197; x=1794414997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmnctkQOqSlcJNDZpI/f3GW8bFHAo86SA9tyubOGVL4=;
        b=SPhlxqZRug0WGqaW6bU9+2xH2rupyCDXv7oiTnCi7x72qau2jyj/O54cM9FeYcviql
         l+2+wxiqX94QnO12bi0gbM4njh3dQ4SXeyHKTNC2QTj0u5K5mxh0kCH08rhtSJRxTSYy
         V0ST6da2gsNmBP+AmcLSDF40BoOI3g05WAV8SB/4xOHpgyvFO51NSq+B9mBvUQxyaLTX
         MXbe+cUNCPka9KfhcahEKZiWLx/EE5c1zzROLVJJuC1Wevq8NBWcpli+ywEyDXgA8DO6
         G16e5Bmo7TyWCPQpouMaZ4G6SacAk/GqfN6+qoyiOkE/pBuPydCIJwANnkbJW5pvSaAk
         gVYA==
X-Gm-Message-State: APuU4Z//EPfRgpp6uYJkGFdLMZTptgkYYQqsCn07QWBhkUtd/MvALEdV
	jEgrzIqB1Lpm20IUVSsEi8I4fescF8mns777Y3zmqh2nEGtL36+ozcERN+TPt8m+uh2OXwTgCu5
	1pK3huqvQ93puSCX48ZrTN8HyU9b+VVv1INxmu2EUuWgdOGawqePg8wckXlo5M9rA1d74
X-Gm-Gg: AYBFou0mJzYv4dF3rMj22AbbwC+EhDVeUXJxlo6GyL7/xQ0s8KSH/z7pBCQo3MjwpRE
	PXYeFZoK8006Jclk4BBJGSEPExVbuG+JrsepYjG6Sz3/1SIARvPJLJLYIgSJvIxnsJ3FxoA4W4N
	rUNGW4tUUa3Mj85fD1qf6Xz3tflBVBkaUHBsTjpKSge+9HcfEhrqeyq4b+5+V/CtNL2d8zJtsYn
	6ppCZX0eqej3QH0FWIJgoq9Q5tYgTbxG/cSe5j16CLKoIhNObDetvcEFyGHHpBcXWzDjgf7k/cq
	7VC8zpcpyAeRrj+bt3DmVMSLZpLYzrhuBTjJ9kP164k+ie/T9n7ryL7Seq04AYXDY+UdAUjdVaZ
	GjQXgHmHz6BKSjYUw/tAvDyx6NdDuzeOvdILf7+/bJFv18PFte9YoRnMhIvDii3lD6FCSSaEXa0
	Dkq12L2tDXLYDVp9cMe7+Djjwybb3H9L0Syu5ObiI+talOLMHysFW8VKRXhT9N4g==
X-Received: by 2002:a05:620a:410f:b0:93e:53db:d59e with SMTP id af79cd13be357-9441338b4cfmr3099620285a.23.1793810196558;
        Wed, 04 Nov 2026 08:36:36 -0800 (PST)
X-Received: by 2002:a05:620a:410f:b0:93e:53db:d59e with SMTP id af79cd13be357-9441338b4cfmr3099612885a.23.1793810196023;
        Wed, 04 Nov 2026 08:36:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6bed64sm5267191fa.7.2026.11.04.08.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:36:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 18:36:09 +0200
Subject: [PATCH 5/7] media: docs: pixfmt-reserved: describe the QC08C and
 QC10C layout
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
Message-Id: <20261104-ubwc-format-docs-v1-5-389044012b4e@oss.qualcomm.com>
References: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
In-Reply-To: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Bryan O'Donoghue <bod@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Robert Mader <robert.mader@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5263;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1OfyeKpg9SI28jpOvwv81zI2qbKFoyNRZrDSfeIXOIQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq618FUrwLTtJam1l5ngbz7ZqLghcNF67hlfAGQ
 LmaO//9uzCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCautfBQAKCRCLPIo+Aiko
 1SqdB/48JOwOXGgB6EFrl/RBSNn5kwXfc2kHX+HSIMrob0xEG2LypCY5LwWmH9Uo7hJqHSk9Aj3
 QsRKbRqbqKuCM6z1nu03b7x+L7lj5Yi2uhYzFhQQF60hLQZya5qkEzUImUCXCQCzc17cT6yGpa1
 SU1yDT65cBLQ9YV1qFJ2J3mN2ruVM8wMjItAjpXGxFGXKTVnENuvgnH7VQpL5sltFYpuER2A2iW
 wwx79ASinjlez0l+Ev5y2ZCFlzT7uGzSc63iuJVMVxmXCxoDSXi3lPbrqRwep85zsYY085f6jkA
 ONgoRUTxdwBGgJzKLTP1Ar7z7G1QBIvrkv0OsB57uZqrbyiy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfX9wtRDycwGvJ8
 gtG030afGA3G9sugrt2lIKJ9z5MdTwPnUHQqfTr2OZjfa2RtpB6PufM4XPI9SnfTmC6/3Lj0zDd
 jQVpgxYliXXo4+WxX+9//NRK+dw7qN02Jmvbk+ugMhbsy2iPQ11nD8ORdiXP0rVApm39zGjLtcb
 xMzXmzhpHt1qaxpxA1Mmgh3SAvLDC8bCxDSTKc06W8QFYyQ7giU/z2IdZ9eUAKpQsK9pjuMKoTL
 iwk12P3STJf94rzOps905f2pzcdjdGtOlwH144m1y1XpX35Ul0ILYX+r4zQCBnzLfYalmli5PB3
 O/M7AFBT7qPqZH6e/HJ2y0iYm1445UgtOfZrTieLL8UCDvcx4Y6WuiNjHDCFEybnHu1cFEDHR59
 LG/Bc79vJQmmPmmRmW2nFk7ALbnz0+k7ie5daBrhdc9/fuB4jrnHmao3DNvu8vNgfgbWA78iHmK
 p4/M/jrkyZ51OsvLfAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfX6rXexTOMflOJ
 5psecyvwIuf5GM9mG4JoDgq+0W6ZdKnB/njS6iWrHOfuSWeQ691LNNkHlT5OlCcdja5gLtf30ra
 5FnSng8mmcMPdPw2i5RhRH1rjYgdIl8=
X-Proofpoint-GUID: OsoN7bVtKq99e7oBNn5veKY6pnHzT4kn
X-Proofpoint-ORIG-GUID: OsoN7bVtKq99e7oBNn5veKY6pnHzT4kn
X-Authority-Analysis: v=2.4 cv=futJ914f c=1 sm=1 tr=0 ts=6aeb5f15 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Eh1Ucz_HWyYK4_jupWgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040066

QC08C and QC10C are documented as opaque formats with four planes, or
eight for interlaced video. Neither is true for the drivers: Venus and
Iris use a single memory plane, nothing produces interlaced buffers, and
the display controller and the GPU import these buffers, so the layout
is part of the contract between them.

Describe the sections of the buffer, their order, strides, line counts
and alignment. The compressed contents stay opaque, they depend on the
UBWC configuration of the platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../userspace-api/media/v4l/pixfmt-reserved.rst    | 63 ++++++++++++++++++----
 1 file changed, 54 insertions(+), 9 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
index 1cf6c59f4bc4..3ff6499970e1 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
@@ -245,20 +245,65 @@ please make a proposal on the linux-media mailing list.
       - ``V4L2_PIX_FMT_QC08C``
       - 'QC08C'
       - Compressed Macro-tile 8-Bit YUV420 format used by Qualcomm platforms.
-        It is an opaque intermediate format. The used compression is lossless
-        and it is used by various multimedia hardware blocks like GPU, display
-        controllers, ISP and video accelerators.
-        It contains four planes for progressive video and eight planes for
-        interlaced video.
+        This is NV12 compressed with Universal Bandwidth Compression (UBWC),
+        a lossless compression used by the video accelerators, GPU, display
+        controller and camera. The compressed contents depend on the UBWC
+        version and memory configuration of the platform and are only meant
+        to be accessed by the hardware; the layout of the buffer is defined
+        below.
+
+        The format uses a single memory plane that holds four sections in
+        this order: Y metadata, Y data, CbCr metadata and CbCr data. Each
+        section starts at the beginning of the previous section plus its
+        size, which is rounded up to a multiple of 4096 bytes. The metadata
+        holds one byte for each tile of the data. ``bytesperline`` is the
+        stride of the Y and CbCr data. For a ``width`` x ``height`` buffer,
+        with the CbCr plane being ``DIV_ROUND_UP(width, 2)`` x
+        ``DIV_ROUND_UP(height, 2)`` samples:
+
+        - Y data: stride ``ALIGN(width, 128)`` bytes,
+          ``ALIGN(height, 32)`` lines.
+        - CbCr data: stride ``ALIGN(width, 128)`` bytes,
+          ``ALIGN(DIV_ROUND_UP(height, 2), 32)`` lines.
+        - Y metadata: 32x8 pixel tiles, stride
+          ``ALIGN(DIV_ROUND_UP(width, 32), 64)`` bytes,
+          ``ALIGN(DIV_ROUND_UP(height, 8), 16)`` lines.
+        - CbCr metadata: 16x8 sample tiles, stride
+          ``ALIGN(DIV_ROUND_UP(DIV_ROUND_UP(width, 2), 16), 64)`` bytes,
+          ``ALIGN(DIV_ROUND_UP(DIV_ROUND_UP(height, 2), 8), 16)`` lines.
+
+        ``sizeimage`` may be larger than the sum of the sections.
+        The same layout is described by ``DRM_FORMAT_NV12`` with the
+        ``DRM_FORMAT_MOD_QCOM_COMPRESSED`` modifier, with both DRM planes
+        referring to the same buffer and the Y metadata at ``offsets[0]``.
     * .. _V4L2-PIX-FMT-QC10C:
 
       - ``V4L2_PIX_FMT_QC10C``
       - 'QC10C'
       - Compressed Macro-tile 10-Bit YUV420 format used by Qualcomm platforms.
-        It is an opaque intermediate format. The used compression is lossless
-        and it is used by various multimedia hardware blocks like GPU, display
-        controllers, ISP and video accelerators.
-        It contains four planes for progressive video.
+        This is the TP10 format, YUV420 with three 10-bit samples tightly
+        packed in each 32-bit word, in both the Y plane and the interleaved
+        CbCr plane, compressed with UBWC as described for
+        ``V4L2_PIX_FMT_QC08C``. Each 192 samples of a line take 256 bytes.
+
+        The format uses a single memory plane with the same four sections as
+        ``V4L2_PIX_FMT_QC08C``. ``bytesperline`` is the stride of the Y and
+        CbCr data. For a ``width`` x ``height`` buffer:
+
+        - Y data: stride ``DIV_ROUND_UP(width, 192) * 256`` bytes,
+          ``ALIGN(height, 16)`` lines.
+        - CbCr data: stride ``DIV_ROUND_UP(width, 192) * 256`` bytes,
+          ``ALIGN(DIV_ROUND_UP(height, 2), 16)`` lines.
+        - Y metadata: 48x4 pixel tiles, stride
+          ``ALIGN(DIV_ROUND_UP(width, 48), 64)`` bytes,
+          ``ALIGN(DIV_ROUND_UP(height, 4), 16)`` lines.
+        - CbCr metadata: 24x4 sample tiles, stride
+          ``ALIGN(DIV_ROUND_UP(DIV_ROUND_UP(width, 2), 24), 64)`` bytes,
+          ``ALIGN(DIV_ROUND_UP(DIV_ROUND_UP(height, 2), 4), 16)`` lines.
+
+        ``sizeimage`` may be larger than the sum of the sections. There is
+        no DRM equivalent: ``DRM_FORMAT_P010`` with the
+        ``DRM_FORMAT_MOD_QCOM_COMPRESSED`` modifier stores 16-bit samples.
     * .. _V4L2-PIX-FMT-AJPG:
 
       - ``V4L2_PIX_FMT_AJPG``

-- 
2.47.3

