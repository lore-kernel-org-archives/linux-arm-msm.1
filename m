Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972695;
	b=XtwGwqZ5zed0EjPe+/xBSgykbnkLome0yDG6jaLhF++6wBDX6TtVle4VLuYP/gryjSDx
	 pt2IQj7EZx1Kz7jIxet5oGkDqxoLXFWGSKV3akWgz4GMOZSylUto568C2D4JkkRmdQ3xd
	 ST5AB6PDWViDU3QXNhAtvclyMryXgwSIIG4vU3B8dek1LSW7ue+oM8uM02Rrv2+4VZr10
	 Vu8mSXa/oZXmWZCWB7jDhqEHcp0zoK3F3YMgGWjmePhbbcDJnXWDbbOBumZnAE4hiFn0l
	 ZNcRtWm7VyZZYfP7PjozN70LDClIZumh2Gl9u7sGI5vFpF5vECaFRa/hgEB0eQUTKSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972695;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cMGWArbInFfU56ZSuyy57z76nw1Q/B0mKQVzCGj4gek=;
	b=5XYXQtneQqxNRY3cX70nzzE7D0I/KqMfNxpcgMa4wWeEXsquxF3UeBIKDqjA6SL1RD4e
	 Evu7t/fM+HehSNM1lG8DH1Dtrece3BsLEvsdDbsaYZrgM6vsTOHP5hHlS5C1fUJ0YveYS
	 47tkKRCT+B0QhqgjHEiI07fL3ardQhdbo5oM3ksXU7VLZsfq/Er6Yq3Pd6roUvAHYmDjb
	 evs5oXXOcXUCrP5ymRjcAYZ1oz7WUDcAz4xmh8kz5+ZRmcKXe8Ddhsmb7EwswuoEyXbtg
	 9HkNMGAspoEKjUOZGbCbs/sEU453D3hX6SClV+ILUdxNVyi46vhM75a6YNZlDGuVWVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tzq6u5mM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifTEe1QO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA6B6083612
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 13:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CA6B6083612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tzq6u5mM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifTEe1QO
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APCuL2076103
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 13:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cMGWArbInFfU56ZSuyy57z76nw1Q/B0mKQVzCGj4gek=; b=Tzq6u5mMsJ9yzKJx
	10rfn7hWFlrl+4uV5O7yRbkf5OFW1QMdWTQcnAiBpTUCIVj2aH95BFJMGli27USs
	E0JqDVuUhWw3NYWH90IEGLBRblSKSoCB2GTDiPabFQvSA8pRny74HAQ8/nLhukDx
	FkRKe2881SuQrtuQDn4NlXLOeli0wp/JXjObNnkkvTJXmY36WwsAq93r6EYa94Xj
	HLhn0CYjFQdl3sM+dSxMIk0AO6GAgfUNQpV1yrqxI7RCuUi4X2ubhrhy8z5aGcHe
	k0dpAUU8DLGDQXB9myTxKBuK3hkQfjFNERTjfssf2HCaXMXeOZSVAWj9ata1r3Q6
	7Nie9w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pcaydd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 13:44:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so155244485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 05:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793972693; x=1794577493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cMGWArbInFfU56ZSuyy57z76nw1Q/B0mKQVzCGj4gek=;
        b=ifTEe1QO7wjMSgHxJ61OeYd65zPfmLuPylymanR3O2gJBMysIhiqkDPQ99M3m+c89E
         pIbJOlScgnZAotmDS94Tis6Wq9v6uFxWENCycPL93SOkZvWao5s479v1TZ9VFY7lIRvo
         VlYKz2llrJiPIaOpiF9cb/j98NRodSEaRwHWE8d+oEpw5OwcxKuQgDzhtm8CNiAy+JhP
         vZpeXGqRT9nTF3MPiimRtNfk1VJix09k5MzZtv0cxFZ5JqfQJdOZHndiidBDipLb7TTf
         mSjtM8DOToBOdsah6MKwEqbAMC4gFQ5xzeXAvKxbcQQkmVM8g11PsQFPHIXbG9VENMsy
         OpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972693; x=1794577493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cMGWArbInFfU56ZSuyy57z76nw1Q/B0mKQVzCGj4gek=;
        b=sNVFnjJ2+zN6ZExM3dH/ZTTGkHi3c7wA6fqZyCupujZyLFgAUiVi3zqfVM317kmX3e
         fVW7Quu3MCWblIF3O4OkyNuTrTFpn06ObxHtq35AjaqRLikCDWHNw5sAVTo0NVZSmPu2
         g2wwjMdPE30oCUaWBWZanJof31964/lFqjb+WmACBp0q88DtOAA0RpYYdm9IPxtQwXsJ
         y5AbwRUDFKnEu4E7JMZmR960pUE05QbIfrv8pcVyFvsFsGpL+tuB5e7lT6UY/Lxd1d/i
         BUOCetyofc3J2rNqyt4ITLxR2c9OtChAdu78sbllBJ+1fIadBGn59n/U1nPed1xraye0
         g+AA==
X-Gm-Message-State: APuU4Z/Qe6I2BEfq1q+FrzwGipqKh38kOTVsv4VcxNJqS/Q4rApTqO8v
	oDGLFBihT2WpNxTQzR/kp7vZvqNBxgV/IZ5WFtdqJmFT2owsQkcQAh4KQ3RK0ZJS3eEYIJRTDZ/
	EK5cJLwxI8/8aHWN+FptwGZztsg6HscZ3nJpix7jhQQYbivZSeRt2BdiHkQH8cY3K4RtP
X-Gm-Gg: AYBFou1sn5x9lOcwdVZQE4I4rK+JubhcrGt5oys8CTbMOYXlZidJPEHdoQ/fXylwXU2
	bCLp5o+764ker6kIPlxrbbI/HrWO+XCyLW17XgXqu+uhvuLEtv4GJLLtDgzl+wh6UEjFzX4NZsR
	ZabI435qkj/efIZcRw6pmJbf+9bBPriQZ+EdXdrWVBwSAYaRR2F67aLLeBhqfeRTHy1FR2LprR5
	z6c/rW5/Qj1scdMYguBePcRz7T6id/0TQld1YwlQYmTy9WimG7vsnDLVf3aXyvt5/Unw1iI3/JW
	jzrO71wJoUeUhPnWaxV7k4Ex7kazdb1K83gp1VaEMZ17VYpBx50ix7Uw8wFGxYJib2aeSH0e3yi
	yEfGgGqmEnif3682Pip8UGGXtWt/+k1gbwNNinXxNiQ33bW66Xnz+zJO+MOZzv+5tlYmn5FPiMf
	ZZYRdRV1swHqsJI9jdhG5icimlP7tMd6o8JVtqSiA/8Xuxtbvyw468e0Wgs74icQ==
X-Received: by 2002:a05:620a:271a:b0:93e:c12c:f12f with SMTP id af79cd13be357-945f3631799mr344980385a.74.1793972692921;
        Fri, 06 Nov 2026 05:44:52 -0800 (PST)
X-Received: by 2002:a05:620a:271a:b0:93e:c12c:f12f with SMTP id af79cd13be357-945f3631799mr344947285a.74.1793972687619;
        Fri, 06 Nov 2026 05:44:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c003055a5csm382747e87.13.2026.11.06.05.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:44:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 15:44:12 +0200
Subject: [PATCH v2 6/8] media: docs: pixfmt-reserved: describe the QC08C
 and QC10C layout
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
Message-Id: <20261106-ubwc-format-docs-v2-6-82949f88f030@oss.qualcomm.com>
References: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com>
In-Reply-To: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com>
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
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Robert Mader <robert.mader@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5342;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oufDthB7YeDdLirPSwGJfiDiJMRXmbblsnYc5GIVcCM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq7dm6s+PXrSOIvYkMo0otYumwJstunDxuMg8An
 mz9B+Mnhd2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCau3ZugAKCRCLPIo+Aiko
 1c2QCACoHzDU8tM05kGPtQOJguY/awpHZnGl4M1B6ngb6r5IY6yedWDjfHCVdiWrKwpjHTReknn
 ZBZMYt7o0pTBEIFJC7FeB3iX5fGSR2auFc9/3WbG7RLc4H+s9651VWxPyniD/pjHIO1Y7MhCvk5
 2Xacpzuu90iX4Y0hQWDvgEJfZK5I8NpFR4ws0YpZ/q2V4EkputE8TyYD92q7/UVbuT7R0Pfbng3
 CSISTsDI8Ir5nVHpRJOywmK7ZAR8KY/lmH4g5pZZOIU9mUTk5LFhJragEjgxl/hfT0hln6wfHyt
 6p2qhXN20Uv3Vz80P9sPw0ZgB7suipVCTNBnGuzHE2bmQlk1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: fVW-lmnqHlYERqqUOM542RUSWsWLOJIK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfXwdeE66+bbzGh
 Uxw146EIYC73IEDCsoggBpS3lK3fZ/4nKQJk4hMwi4dwb48spobzPAivTTVTEiu4qnJ7lrIqS+P
 0aybn67gcHRqeBDGKQDQYWZTDGs1+bUYGjjdp8sjau2ETndIUFQup6Nc+I0bWjLLLSQsmfqjGyZ
 XMpcY78ddJmR+aItPGuZYjsRB+TuUuFmVVn5POoFb99IjAQjLc+LA4dnFYI7WAW/NxNPrsazAAB
 ekwgwrgAGpHu4RYP0Sta1EGJXlKgY86b1+IEyl5WdGA2TA9M81bAnogyNexNhADulSWYIgIK8b3
 dTl/tQwR+1CiJtEjcm6zo9HkOrXq/yXqReGtCEQ5Q2uljovLIsT2AQY8Ii/gYRY2UuxL9qm81TV
 ZZSidmLtcXxaqe6ibIRZrTaEkxeQ48n3nq5BI0ytL0vhFZ6dpcK1qRNqwaUrixb6HIxvgMcCTh6
 ttc2ftJSsB35D+0YBwQ==
X-Proofpoint-GUID: fVW-lmnqHlYERqqUOM542RUSWsWLOJIK
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aedd9d6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Eh1Ucz_HWyYK4_jupWgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX0PeQ7lVj30mS
 1OYp2L/+PBIdVZICoRBKIr+X0/fM+oAbwYIw9q+qUwESvPGFkjysLnaalYEGmCVpw+iD2NN3/pN
 OmebutbuRJZ4DVVL5xVyTlOHCklpFAE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060054

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
 .../userspace-api/media/v4l/pixfmt-reserved.rst    | 64 +++++++++++++++++++---
 1 file changed, 55 insertions(+), 9 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
index 1cf6c59f4bc4..ec67a1bd7743 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
@@ -245,20 +245,66 @@ please make a proposal on the linux-media mailing list.
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
+        This is the P030 (TP10) format, YUV420 with three 10-bit samples
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
+        ``sizeimage`` may be larger than the sum of the sections.
+        The same layout is described by ``DRM_FORMAT_P030`` with the
+        ``DRM_FORMAT_MOD_QCOM_COMPRESSED`` modifier, with both DRM planes
+        referring to the same buffer and the Y metadata at ``offsets[0]``.
     * .. _V4L2-PIX-FMT-AJPG:
 
       - ``V4L2_PIX_FMT_AJPG``

-- 
2.47.3

