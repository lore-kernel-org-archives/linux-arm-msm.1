Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BD63D75C2
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 09:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363732; cv=none; b=vE9K/OdbrE3AmjI8JyClVXcH5ySQn/v0KTba4yIan8vIcwoxH5Xxd4ra20rKs8crxNc+7kAq9aQUL/qm0AevQFB0axbogJMwQ207AF8ujm8Ts0A6dJb1R9f+bGqO6LtyVb7id7zqGRYGWAeuAmYhBFcqfpqDSoodzoas4X+9y68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363732; c=relaxed/simple;
	bh=7ig8RKzME4Tg23U2NT0cmp9t9Bqv3O5xWJzNztTvKZg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KkRMDRj/H+W9XF649SBAInM91iBFY/sPDmx2OPOBZoDoCsoM6V/VvNNBDsXxnR7Mzu8FPASZAjeAZAGi68PRaOB8ta3IXsCMdzcCUoixfCelKJS4yVLV4Y7BcX/GuGQKqrEhaKqR1osebE/s+FLXTH/p7PTYT/GKDNtXXmB7Mpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekexX+I3 reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ekexX+I3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jTBZ3298196
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 09:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UoErLMLnc44
	hB2Tr7ICKukvAM52COTfpqVXrz+zrfqE=; b=ekexX+I3YysZfBBk6zOG1uO8NJz
	iPI1H54t6JdM4dFwlDaQALHvTbzL9tEahcrJg3mAapNZYCThy5JbeoYqMZnVugIw
	SYIyA2Rw/3ynzO02VbsA5TXb+U+kjrYA/XTyL8N00PWdMqTnX1f5/iavqHuyHKZY
	RvGvpJ0F1IMgk6ExmtGsos8BEZqBxvVfjmAZwBylL0ZEE+xePYFtAHh8w9fta6tC
	kuz8S/Pz+pTUMBRKC9Ir/xIPsOPZ0IxSIIN//LQuhwGLG2B0exeBhRQRdZ57TZId
	EH2jRHJLdE6gIjjdopXXX0/acO/RErA66Kec/7eGqjysRv72XBaj3+9tGUg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5hdcrbse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 09:01:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cbf2fd504so720681985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 02:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363696; x=1791968496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UoErLMLnc44hB2Tr7ICKukvAM52COTfpqVXrz+zrfqE=;
        b=a97MPhVRG0h4xISDNfN3JHeBqXgIU96Y84OHANPHm3+5BntI+7OmwVwRZpH59OLXe9
         VwFQf5WVk2yURJhdF3ad9bjrxhGCA+mlQNqzpAqPm9sIVpy1ADmEk9ISzVLDh89hHqvl
         fn5I7GOa3Zax+kUAuAEVO0wBuddN5okY8vDWnfcKDY1H3E8RnoMNlwvbqfBQMK/l4M/4
         NzDX9lJaW0TvsQEsfp/3foCafjyyhWfSZKCxsQoVjUj30LfsH65taROdx+l9mvJjJc/A
         UF6p1oz3OJXHzXVrWztDWQ7NJ02P8HZTem6Xd8U5UGA/yDhQY1KUIAShFUWvKNRrPFKN
         znhw==
X-Forwarded-Encrypted: i=1; AKwUvBxCFjOjq9hIaEJDBatuhSQd3w0ejon0Dtl4SDzFW+v5IJbjg5tAzDJqKiQ1WJJ/jK+pB821L50UO6Q9ImkI@vger.kernel.org
X-Gm-Message-State: AFuF++n9NfFC72upwL7q+fExEHvCgEOmwMp3RreSqeVaq1t48+3dDvAK
	4JAuNcDm1qvbIqDUs0dljghZKdg/GBE8Rs5hmJTRyZx04bkAWpjQOjlrDmctN+g6E1u+0XPRTf9
	MxY1qAD7TDP7MW9P7t7LwjIf4EL1kR59CfElQ1Q/zer1rW4lsawud2fec4AEw1PJ/hic3
X-Gm-Gg: AYBFou0pl1Z/yIdD5IXPdAkzW3DYibCFUFVn7hC9fGNwoP3sux/duYlqgFJ1PTJlkA8
	5YNALqnFIUg/7K6kWjQQIsAb3S/NeYmjR0v2p2hOpuD5lHNtw9t1fnUH9NYrC2O+fIc6D9iTxxx
	u+j0m5Q17gs/hXst1PDvGpYAE/pZeiJLQlHWKn5ollnBx0h9nfusdw9onvF069hwf0VBb5WnMkQ
	oCvOAEHT0bRSMSFXXJ8rSfS+51PJAQJdcYnNMdoh6oRUZddnWrqQg1eR6tPch7cTc4qUUyCuH/y
	b3rftOUKtVVBZm6c2Bq4JQSQbPqruFrorwoxgHtUx47BhIxC0N+Xh72OCUs=
X-Received: by 2002:a05:620a:404e:b0:93b:d7ed:ff66 with SMTP id af79cd13be357-93e9b835e0cmr317184385a.58.1791363695139;
        Wed, 07 Oct 2026 02:01:35 -0700 (PDT)
X-Received: by 2002:a05:620a:404e:b0:93b:d7ed:ff66 with SMTP id af79cd13be357-93e9b835e0cmr317178585a.58.1791363694627;
        Wed, 07 Oct 2026 02:01:34 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:01:33 -0700 (PDT)
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
Subject: [PATCH RESEND 13/45] media: qcom: camss: video: use helpers for line-based formats
Date: Wed,  7 Oct 2026 12:00:09 +0300
Message-Id: <20261007090041.3732717-14-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-GUID: fYWjiSF9mLA2y5WyVYqIBo-OF7kbpdQ5
X-Authority-Analysis: v=2.4 cv=aKFlOr9m c=1 sm=1 tr=0 ts=6ac60a70 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=qbJzVsoXupL-68DMvHcA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX3zTYmBfXoKUl
 ocPJVBJTYPx3HnzyEy4b21r98p/Dgn9JbYxYjtfjnGymvFIrxHLJVf/WOON/1qF6c2CxuxMX1aF
 e3iAkgBU91W7NvOdHEYZoKnEzVY6/YM=
X-Proofpoint-ORIG-GUID: fYWjiSF9mLA2y5WyVYqIBo-OF7kbpdQ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX7oi85KIcu85k
 jb04IP7JFb2QdxQPyG5/mNpKWSEEeTnxsuuuWtpYQS8LsfBsGd7XAUnE9/KcS4FmSgFj6Gq0UZA
 sZwBjdcs3/6MutetjWD09u6fHQHjlq65nmtn6+u2eD8+5L/WKPCvRhGw3bhQxo8Do7auQ2qAzS9
 yipkCvSH3KR8CAEodgROgkn45XWhQXbwveTQMJ9daiuXpv4M2iLTo6Os2x+1lyM1prMr40hFgsK
 hl+bWOYHBPxDVbKBju+/nfrjWbcRoSuiknt/d0JjBxiRtCZRKO1NNtVU9Juv3Q4J42aR2TCSirF
 1r+r1bXAAMnpzI0SxLwgr0dr9S4UlGlvZPwBLccErz2TvhmJxoQQ8mSZXfFJzCCQMDsJDhB7ZZp
 /7XNENfmUkaLBP77qV2ey8bxy3muD2o+tQsP3UzmAYF7lyCma5WbR1cse1qaTSk/QJSd59YyjDI
 evkUb3NPdumPmGVb3/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Use the V4L2 format helpers to calculate line-based plane sizes from
the selected format.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-video.c   | 76 +++++++++++--------
 1 file changed, 44 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index c570d7f9258c..803e5ce9b9fd 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -7,7 +7,9 @@
  * Copyright (c) 2013-2015, The Linux Foundation. All rights reserved.
  * Copyright (C) 2015-2018 Linaro Ltd.
  */
+#include <linux/align.h>
 #include <linux/slab.h>
+
 #include <media/media-entity.h>
 #include <media/v4l2-dev.h>
 #include <media/v4l2-device.h>
@@ -513,29 +515,59 @@ static int video_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
+static int video_try_line_based(struct camss_video *video, struct v4l2_format *f)
+{
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	const struct v4l2_format_info *info;
+	unsigned int i;
+	u32 alignment = video->bpl_alignment ?: 1;
+
+	for (i = 0; i < video->nformats; i++) {
+		if (pix_mp->pixelformat == video->formats[i].pixelformat)
+			break;
+	}
+
+	if (i == video->nformats)
+		pix_mp->pixelformat = video->formats[0].pixelformat;
+
+	info = v4l2_format_info(pix_mp->pixelformat);
+	if (!info) {
+		dev_err(video->camss->dev, "No V4L2 info for requested format\n");
+		return -EINVAL;
+	}
+
+	pix_mp->width = clamp_t(u32, pix_mp->width, 1, CAMSS_FRAME_MAX_WIDTH);
+	pix_mp->height = clamp_t(u32, pix_mp->height, 1, CAMSS_FRAME_MAX_HEIGHT_PIX);
+
+	pix_mp->width = max_t(u32, round_down(pix_mp->width, info->hdiv), info->hdiv);
+	pix_mp->height = max_t(u32, round_down(pix_mp->height, info->vdiv), info->vdiv);
+
+	pix_mp->field = V4L2_FIELD_NONE;
+	pix_mp->colorspace = V4L2_COLORSPACE_SRGB;
+	pix_mp->flags = 0;
+	pix_mp->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(pix_mp->colorspace);
+	pix_mp->quantization =
+		V4L2_MAP_QUANTIZATION_DEFAULT(true, pix_mp->colorspace,
+					      pix_mp->ycbcr_enc);
+	pix_mp->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(pix_mp->colorspace);
+
+	return v4l2_fill_pixfmt_mp_aligned(pix_mp, pix_mp->pixelformat,
+					   pix_mp->width, pix_mp->height, alignment);
+}
+
 static int __video_try_fmt(struct camss_video *video, struct v4l2_format *f)
 {
 	unsigned int alignment = video->bpl_alignment;
 	struct v4l2_pix_format_mplane *pix_mp;
 	const struct camss_format_info *fi;
-	struct v4l2_plane_pix_format *p;
-	u32 bytesperline[3] = { 0 };
-	u32 sizeimage[3] = { 0 };
 	u32 width, height;
-	u32 bpl, lines;
+	u32 bpl;
 	int i, j;
 
 	pix_mp = &f->fmt.pix_mp;
 
 	if (video->line_based)
-		for (i = 0; i < pix_mp->num_planes && i < 3; i++) {
-			p = &pix_mp->plane_fmt[i];
-			bytesperline[i] = clamp_t(u32, p->bytesperline,
-						  1, 65528);
-			sizeimage[i] = clamp_t(u32, p->sizeimage,
-					       bytesperline[i],
-					       bytesperline[i] * CAMSS_FRAME_MAX_HEIGHT_PIX);
-		}
+		return video_try_line_based(video, f);
 
 	for (j = 0; j < video->nformats; j++)
 		if (pix_mp->pixelformat == video->formats[j].pixelformat)
@@ -574,26 +606,6 @@ static int __video_try_fmt(struct camss_video *video, struct v4l2_format *f)
 					pix_mp->colorspace, pix_mp->ycbcr_enc);
 	pix_mp->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(pix_mp->colorspace);
 
-	if (video->line_based)
-		for (i = 0; i < pix_mp->num_planes; i++) {
-			p = &pix_mp->plane_fmt[i];
-			p->bytesperline = clamp_t(u32, p->bytesperline,
-						  1, 65528);
-			p->sizeimage = clamp_t(u32, p->sizeimage,
-					       p->bytesperline,
-					       p->bytesperline * CAMSS_FRAME_MAX_HEIGHT_PIX);
-			lines = p->sizeimage / p->bytesperline;
-
-			if (p->bytesperline < bytesperline[i])
-				p->bytesperline = roundup(bytesperline[i], alignment);
-
-			if (p->sizeimage < p->bytesperline * lines)
-				p->sizeimage = p->bytesperline * lines;
-
-			if (p->sizeimage < sizeimage[i])
-				p->sizeimage = sizeimage[i];
-		}
-
 	return 0;
 }
 
-- 
2.34.1

