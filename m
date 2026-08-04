Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EDD480335
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 20:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785873950; cv=none; b=tJ0FTS6sLi/VW8ddcniEUstXaBn7ILy+7IPlnKKWQtwhTMQUzPy0DXqwCcwSbnxwu9oC0Y0mJtWwkQGUAU4i42LQkTmrqmo6eZOD3vcf59IQ2tqp3OHrPHEoWtZ3U68g6jI4Es5CBf3r2zssIDtbCoXUOf1626es9I9ExJ7l3rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785873950; c=relaxed/simple;
	bh=Pqzpp5CiOdBEwanqZAvhsKmrKnq8DBykbBPM1VfjaS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gAVOJzp2tJpnR++2VKUrKgr8MScVfH0Xe70kBhCiLsH+DGbUuvAkT6pYiF0fWvH+Kh5BiiTGxRF/KE09Q6wweTs+y1+GfT1sWWjLFR/7x+93eIJC09MBJKivoz5aH/CY3Fc6nkt9+mADPup9496lai7DBAOoFsbfzob2B2Lo/AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gJqtMplT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KaSfrnmE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gJqtMplT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KaSfrnmE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674JlNI9434231
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 20:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZO1O1I6lioD/8HjLvXmSj7ziruFtL/ZfoqPHc3483dk=; b=gJqtMplTxHFBVdHI
	ckjRs6unICa01RNU8qFXhYC3be5rW9xGdZOde436GWNnDlJYvK65+1IRY5yWSB7L
	Fy0q70b+YFLPyEe7DUjT9D+O5ydNS3u5zVAnBOaJIP8LezFERiXBxf5x17aJjd96
	eqfVGymW9wGce+B4jkUvsaOWRv+baraqCP96pngMQ2KS3Z6aQz2f9iPMXDPjqXHv
	M+kq5NqYHtMXWZZAE8AUk9AGrmIX29p21A0DbGTSWc00eefpILnexZVWfdEnBZCU
	Tf99u+yxeCYjt6h9a9pUCknQ1F0WXR6B8oVPyTmvOCFCSNnGx525r/A9fd+jwtYE
	o4wq8A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum568vjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 20:05:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-384cb1637c2so50109a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 13:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785873947; x=1786478747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZO1O1I6lioD/8HjLvXmSj7ziruFtL/ZfoqPHc3483dk=;
        b=KaSfrnmExIBIyfI6Yy8SQDs7oufzZ3nNAbI4BOienL+qTSwX+s3N6DkKLyAr1xq9KT
         1NrVndZ2PmNoBXO5N9L8xpL/p+APQF/+FXgV3aVvK1GUrlJDGqfOYyeM2vr4j+KxC9/N
         kQdaPA89bp8GYgsmSXRNlo17JvpL8s6dxqMm2sKDG4ORXFsS00LkCanO5bSqFJpWvpLi
         YnwfbwpmMy8MfNPcML3lRzsj/O3cqkRw6jXD3/mKR4HW0vyZGYNrrXnTuigiVd/7mDBV
         9EK/Fek+IcPvfsB6qxO8GB9Nz0Ki74fqYQWNrdqdOGFUqrl0vjQ8EVH+6edW8pSw9dQi
         w5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785873947; x=1786478747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZO1O1I6lioD/8HjLvXmSj7ziruFtL/ZfoqPHc3483dk=;
        b=Chh/Z9auYuQe6WWyUi3o1j80HIORoYzafRZ7ra3laXe+p56MOmKq+F0GKrsge1MQTt
         MJjQEO+heY2swWx+y5xDucapKk2bv6H4wMTKtLOl9YgghAkqNHY2sxQlFDAFQV9cYtdS
         hvJu7ravX6D5r7lJDcxQfPdcOzpeovphfMbjLkRY572f/WsamUxaCBUFXeqmN0lgchaf
         UAPpLLkfPr/LR17JHUzVJB3bvbjTGQN/GaPlaZkwoaJkLq3mpJhtX+7moQNE7/hkC5wN
         1bBWz60pizqESuZ0LiQETBAc+WpKn9Y/5dWc8GsElUEM04Okxr3rC5PlGUqT+NvSN/kS
         6LxQ==
X-Forwarded-Encrypted: i=1; AHgh+RrpWCrxDF6gI4hzxGMdQmDck1jEKsXizL1FTw+5ODQ2q/c8L07bD191v4fqTkR/jI2uVoUGyEG2i3FKzm9B@vger.kernel.org
X-Gm-Message-State: AOJu0YzzVibo8SmH+jivdmODb0buW8mnZ4k2qsvAK07zNP7ZlN7Ny1JL
	GBb+3WG3o4Zdthzr8Mb5wHPtg24qNv+u1XfjcKbqX9Nrv2CFn1R9Y4m6qz0gfPEGGLov6jQfX22
	/UiTE59U2510DR1suO+VbsIMPO9I23yq2mGLnwa+sGwtWcdQZVCh6bgC99wHgWpTxcq/1
X-Gm-Gg: AR+sD10o//jQ/0lNLekpq7MF8Pq5M8lZ7oDgdBkmZfJ+ZzS5Xkq2+Km/gLc+fyFoKwm
	RnbT77ORyZw1WEaOIr9ShzvXBag4X4rdZQAr9DQe6Zr03zArTABe9jdtCON1bXByjCJXo7oaRRu
	7oVKW45wKxp6ME75AxgXDR+Me0ayURBI0TeFWzqUce5HN62jUr3QmEBgYLGnIcKTnnGOOVtoH7D
	Btr1yHW5xZIbEoOippfJZkunwslocPIm4A23snKeGvh/i6K4jUV7P58FyewUzMqibZWIOrhat3c
	YnsJUMehDStm4UXDVKmc2c8PlvIi/uNgMnDJ0b56iyya5MpIn9R/+sGonT4KlUvFqpPF0mRIyU6
	ypjaPgg0FbAgsj3eWr1hpGxvlgJH8ulhODTCrESbi8BTSmCF7dqGiw7VVK7ak
X-Received: by 2002:a17:90b:1848:b0:381:77cd:38ca with SMTP id 98e67ed59e1d1-3903c7395b1mr1240108a91.4.1785873946648;
        Tue, 04 Aug 2026 13:05:46 -0700 (PDT)
X-Received: by 2002:a17:90b:1848:b0:381:77cd:38ca with SMTP id 98e67ed59e1d1-3903c7395b1mr1240090a91.4.1785873946188;
        Tue, 04 Aug 2026 13:05:46 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673be99sm14457146eec.15.2026.08.04.13.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 13:05:45 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 13:05:36 -0700
Subject: [PATCH v3 1/3] media: uapi: Introduce new control for video
 encoder ROI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-enc_roi_enable-v3-1-e03b622a2d48@oss.qualcomm.com>
References: <20260804-enc_roi_enable-v3-0-e03b622a2d48@oss.qualcomm.com>
In-Reply-To: <20260804-enc_roi_enable-v3-0-e03b622a2d48@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785873944; l=7668;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=Pqzpp5CiOdBEwanqZAvhsKmrKnq8DBykbBPM1VfjaS0=;
 b=M1m0QqWT8IOAh4OXmxV4Rnhm+HJhVMBuYDGWYSojVO3KM84Ghqrz5BfYCf2BDFSklXFxnCUxj
 lCgTST7e9/VA1WmaR2RYsNeQsAM1B3ouYJLiUo3Rvvmc0f6L6uCEv23
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE2MiBTYWx0ZWRfXzVeGmA0/ZTce
 fC/EcBggRnIXpT+cwNWv/HBtdBO8rSINEyBhmG/7frm2wN8cFcHDbMgLXrE2xACrAprCbMfII5c
 Xf7LlG9KWNtX+4bjXMonIUk+mz+RFDRgVyL64mM9kDO4eVPnf7/8sYQPrI2bglQSBpyYH7uXg/9
 M/514ZZM0puOCX78c5AcTi+5myU8LBTN3UNykYPtNFIsvUOw+InfxUb5+r8Ikpfb8Sqr8AWEqvi
 srTlBIvxyPht6BSIX41F0xeyEHfnjmjk+ZumqvyL19eg72MDD6cmaWSaiHFZ/Py1EZEly2sIDWD
 oyH8QiMn91SR+t9fhDApwjwU5XkJcc3QQ115RW8MbS6B9troNln9NJaSUztm1QB+YCMohGvONCv
 /Opin4kZXlT5gBDr7du/5e0xdiC2zrmRByZps+Xl024NNtXkwR0vY7k8dKxseEcuIYZZRK0Grri
 VX/y2YbmFSLmPC0rqrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE2MiBTYWx0ZWRfX5pPeb5tW43nf
 3ts+6XnMWqAG24g54APBqvHun4PcxfM+PrGPJykreJ4OFtjvN0pEj2i8nYoq0EPhRGIYI2Eqmrd
 dJxnbfsb6IX3iQmaNt2vJYGTe99la70=
X-Proofpoint-GUID: AM6n6ZTijbH32MR9gLOoUSu1bDZaQiyF
X-Proofpoint-ORIG-GUID: AM6n6ZTijbH32MR9gLOoUSu1bDZaQiyF
X-Authority-Analysis: v=2.4 cv=GL441ONK c=1 sm=1 tr=0 ts=6a72461b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=o2p6THidDhOa5OcZzacA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040162

Add custom control, V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP for
video encoder Region of Interest to allow applications to specify
different quality levels for specific regions in video frames. Define
V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE to retrieve supported MB size based on
codec from the hardware encoder and set the corresponding ROI MB delta_qp
map that adjusts quantization relative to the frame QP's base value.

This enables use cases like prioritizing quality for faces in video
conferencing or important objects in surveillance footage while reducing
bitrate for less critical areas.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst       | 19 +++++++++++++++++++
 .../media/v4l/videodev2.h.rst.exceptions              |  1 +
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst    |  4 ++++
 .../userspace-api/media/v4l/vidioc-queryctrl.rst      |  6 ++++++
 include/media/v4l2-ctrls.h                            |  1 +
 include/uapi/linux/v4l2-controls.h                    |  2 ++
 include/uapi/linux/videodev2.h                        |  3 +++
 7 files changed, 36 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index ab865a1a6ba929f1725ce2ab0fd3aeee4a69329a..0f8179de8f742253a5152231592fb8b4355298f7 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1674,6 +1674,25 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     Codecs need to always use the specified range, rather then a HW custom range.
     Applicable to encoders
 
+``V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (__s8)``
+    This custom control is used to set ROI MB map delta_Qp for whole frame.
+    The frame is divided into a grid of MB Size by MB Size pixels (MB Size is
+    obtained from querying ``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE``). Each block
+    is configured with delta_Qp in raster order. The valid range for delta_Qp
+    is encoder dependent.
+    Applicable to encoders.
+
+``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE`` (integer)
+    A read-only control that reports the MB Size used for the ROI delta_QP map.
+    The supported MB Size depends on the encoder codec.
+    Only square macroblocks are supported. The value returned represents the
+    width and height of each block in pixels. The ROI delta_QP map provided
+    through the ROI control must use the MB Size reported by this control.
+    The number of entries in the ROI delta_QP array is determined by the
+    frame dimensions and the reported MB Size. For example, for a QCIF frame
+    (176x144) if reported MB Size is 16, the delta_QP array must contain
+    99 entries (176 x 144 / 16 x 16).
+
 .. raw:: latex
 
     \normalsize
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
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 327976b14d50b73a631e4d2ed95d9f4d146c45ab..a1806ddbc797efa52e83cd3f685ef70d5b5483d2 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -64,6 +64,7 @@ union v4l2_ctrl_ptr {
 	s32 *p_s32;
 	s64 *p_s64;
 	u8 *p_u8;
+	s8 *p_s8;
 	u16 *p_u16;
 	u32 *p_u32;
 	char *p_char;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index affec0ab4781507be761cb791ff737460acf9cb7..00a2c48630bd198faa9a2b833a9aa346d8357555 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -920,6 +920,8 @@ enum v4l2_mpeg_video_av1_level {
 };
 
 #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
+#define V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP  (V4L2_CID_CODEC_BASE + 658)
+#define V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE  (V4L2_CID_CODEC_BASE + 659)
 
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..3ed343f8c81e0c9240d5a7e5b2dfe365a529fb6c 100644
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
+	V4L2_CTRL_TYPE_S8		 = 0x0103,
 	V4L2_CTRL_TYPE_AREA          = 0x0106,
 	V4L2_CTRL_TYPE_RECT	     = 0x0107,
 
@@ -1997,6 +1999,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
 	V4L2_CTRL_TYPE_AV1_FRAME	    = 0x282,
 	V4L2_CTRL_TYPE_AV1_FILM_GRAIN	    = 0x283,
+
 };
 
 /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */

-- 
2.34.1

