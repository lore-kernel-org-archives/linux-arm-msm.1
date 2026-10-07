Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4808484230
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 09:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363754; cv=none; b=SNH16CMSG8jPqPRagZMI+zuHpyKXr+LyUsQHNN3U3W3Sap2oWDAP7nekgwp3Of90sqSDeIwTxvUtz3uM8WfBn/Nm3tUTpi0pKeIinjneEEGNXlvJNTNrDqei/xJtslwDXsaz20C9cI2P7fiSrH7bUwhZ8EeNrq7JfmSPkUR3ZbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363754; c=relaxed/simple;
	bh=VOMacKAim2NeRKzYRGCKCM59giQCmbzASTn2t1LQzPA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XXlYGDij4ZVOrJEFqHi33Rgx3PJ0TXR5IXSNRt7Sf+JoxD2Y5IiPzj70RKyl5rfiV5nJzor/NLZ6GXWcknHvExbOMliSwAXo3w7aUclHOCii8V0B5OL+fZCxSJOnDGfXTMDGbalSkzHS1c7t0g47zB+7mOb8hsGckX2TLFH/7fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HH7Wmike reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HH7Wmike"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jWWV2481340
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 09:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zwweVgbuw4Q
	eHx19ruMA4VKdQmD4Y6znPZooowo2HgQ=; b=HH7Wmike1lXUF8mARPRXqCIO8+t
	1rgK5rDHsaeBo/TBKj8+bXQioYfHE8Xfq41tAckbE7N7iIu4lt1TD/tS1mWVxKYA
	eu8+NOJpPzvsPa+WwG//pq81Jovs9HxdUlJy3uWHWoR5M48M+MpAdGSe1Drj/2sT
	lv32CLUL2zIMTGYZ29UrIOd6fLWEMNv0bUsSUh2Jwhvez6bk5NWGB3Ts6VSSWuI3
	Yx2tA9ZQof6kSsmQblUslBpTB5WMYBA7pfGnDWxWW3jKU6xsHAHO4EiCkb381ZxX
	9pWuzxLDS8A0RtLZ/acsE87OwHBW5irb7cOWd/556iXUrlXue14GC8XAZ7Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c6u1cd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 09:01:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5338c215ed2so61271241cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 02:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363715; x=1791968515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zwweVgbuw4QeHx19ruMA4VKdQmD4Y6znPZooowo2HgQ=;
        b=IBp34C4GfK6w0lAnPbT/TOCxhLh2rUpleJe2lm54PZ6Ip/m0QA7hrueWpk/7gSm3/l
         1TSVd+h7INzuBwel83c5NkKdP29oUcJ2/5bjQnqyFpBMKrepbZ223mGYsGyawltwgGku
         6WTKBJzgEGY4XXxLRiCoE2YH5c0blctRhaG9QehWnMfndUTgUtQZZuJqPvUDcoSwn4KZ
         BZfciOPY8hQH7Ne05UWPfXslYeVf4hROAmztwAjmM0zQvBFO70Tm5N4jJRHEyppbpxLB
         nWEPYOU3n9KH78/aD+hwh9gSuRgUNn2yZzlihXi8FlqZNOLj02w7ADEA2wb0pBux52du
         jwhA==
X-Forwarded-Encrypted: i=1; AKwUvBxOSm+WLuaGAez81sYDdtIFjbwA/a1VlMer4W5j4dHD8wpdcdJoNzA1c5TYz2uAEg8RuZ8u7V2QWLVlqClQ@vger.kernel.org
X-Gm-Message-State: AFuF++kX8NQz/G7LMyt087K5qxd9/addkuN6Js0tFKrq5kPT0g17C9K7
	XoU68bk3PqhHNzT0IOaeR4Ah/Hun1chzQGjs+TEqV8cKPHN0I+IrrZy0lKNkt1fdYfbA9rWS6N9
	De3lJ9I3H6ekSThV0IX3bHCbTCaJ+0ipv9EQfsb49oYcqXgvy7/CBRP1yOOkkyky30gLC
X-Gm-Gg: AYBFou2dWlXcbJh9q+m9Dkzm86EAt7Ubdi81+AqMtRy0hm9IsX2nw752mTiFSr4HN29
	jbv+zlPLX6jU7yKNYZHGBpLuKMbKhmW98af8aBdvGXJKLh/uQraZOZX7fYadVM2pz32Nvz5yqkz
	D+CPIor097MRU3U5gYwE/4OPLDhesRZWKfzAorUqT+8qT1kTLlUu5IWX3rkCxEwhNEII77wYWaI
	siCF9ztZ4jat38yg/f5mfZOEYJ0oFZLtpJ3cfE+F6S/O0xiXpNV10OMTYL9vhIBnM4kp8ztZ0YA
	k6Vh7jCl1N9HnlyW2U26hrWSClvMHzMSvq4PUKowyIolwOrOFD0NNmckYHs=
X-Received: by 2002:a05:620a:890b:b0:93e:9809:838a with SMTP id af79cd13be357-93e9b8a1cfcmr290930385a.74.1791363714805;
        Wed, 07 Oct 2026 02:01:54 -0700 (PDT)
X-Received: by 2002:a05:620a:890b:b0:93e:9809:838a with SMTP id af79cd13be357-93e9b8a1cfcmr290923785a.74.1791363714297;
        Wed, 07 Oct 2026 02:01:54 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:01:53 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 19/45] media: v4l2: add Qualcomm IFE statistics format
Date: Wed,  7 Oct 2026 12:00:15 +0300
Message-Id: <20261007090041.3732717-20-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX/mFypoJH+pK+
 ab5I9xrv9slsBuPl1UlqCP3WWlxFfPU9weNry23auEABg0kCH/fbjjPyNQy/Ptn43j2+mH7KmPX
 uXg3YODooyMZQvsblmgkNjto0cNQPZA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX6t0I2c1zbolu
 JYScTS4ffIu8q/3N8wDNstTFkWuPOOHFAtIYf8xY0eqqSQ4w+HbVNSzquEMwdXcTvSrKD7s8LJT
 +in0NeMN1cSr1cgajN7E2wDL9ebu2Hz3fTW50e6s4l7IDtjOD/fj0B7YpNRw7cIDLjt1VOa2Vk9
 ROp0TrBSMwHacX408NA80YeWzbSX4jcRPIcp3oY3rDY5WJLvEQ+7saOJR7enu8k+2EGNM/KhyqQ
 VjMRP/oT6zzCC0Lxys5DzEuaBIQmFlNEyLFyCFJr5/GIU4Aj8OcGsGed10SgfjQv3/6HHwBkUzJ
 e2wH8+9ZD4ilY0ZaS3Zngk6TUdUyAxT3zC48mA6m/wtY5dXXVaOk4AoAcWGG3tGGgkD+9hhKbl7
 hMdfQcM4DS2vw8uwn6R+JqfrucolXZRhQfggRRpXCq47/RHIxcoadf2T2tYeqBlxyCtSBt8nSuJ
 Q9n9mkplM42qR+rAdbw==
X-Proofpoint-ORIG-GUID: u7aFtIiCwgE7PnE64yPl_C_0aGHe8en-
X-Authority-Analysis: v=2.4 cv=T5EZ3PKQ c=1 sm=1 tr=0 ts=6ac60a83 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=ayFhjqOtJfiHK51EeDoA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: u7aFtIiCwgE7PnE64yPl_C_0aGHe8en-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Describe Qualcomm IFE 3A statistics buffers with the QCF1 metadata
format.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 3 +++
 include/uapi/linux/videodev2.h       | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index cef1593c1835..b7173a258225 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1467,6 +1467,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
 	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
 	case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:	descr = "Rockchip ISP1 Ext 3A Params"; break;
+	case V4L2_META_FMT_QC_IFE_STAT_3A:
+		descr = "Qualcomm IFE 3A Statistics";
+		break;
 	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 70208a9443d8..4a0748b60a15 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -876,6 +876,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 #define V4L2_META_FMT_RK_ISP1_EXT_PARAMS	v4l2_fourcc('R', 'K', '1', 'E') /* Rockchip ISP1 3a Extensible Parameters */
 
+/* Vendor specific - used for Qualcomm IFE camera sub-system */
+#define V4L2_META_FMT_QC_IFE_STAT_3A	v4l2_fourcc('Q', 'C', 'F', '1') /* IFE 3A Statistics */
+
 /* Vendor specific - used for C3_ISP */
 #define V4L2_META_FMT_C3ISP_PARAMS	v4l2_fourcc('C', '3', 'P', 'M') /* Amlogic C3 ISP Parameters */
 #define V4L2_META_FMT_C3ISP_STATS	v4l2_fourcc('C', '3', 'S', 'T') /* Amlogic C3 ISP Statistics */
-- 
2.34.1

