Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891340;
	b=mpp1Aevbu/8d9h9Q5La/AJad9C+rgxfnkVstOWGTTGET4DqNSArhQW5oiL9RGttaki0F
	 gDeFzktaGHjssbhbHlDtR5Sv7omRqZPRPnEpLOSD93gEbENkVhHbTva2xuY5rSg5//FEC
	 E+6qc+vDaYRtqq9/m88CVwF0l/nuQlf8jLlQ8sTrM2NZL+1thgB4ub8cxpktpKK3ePvTS
	 RfgfVzvEK+uRb0/G7e1ZpZ54FKI0kwv6Qr6cDOAzU1XC9fnTO35tC7wjVBS29oxGhql0M
	 xNvx7ckpTtOUOLw1q5tNT+c2pkUMGT3kw9HMIfPctrfBK/YQct/u8edg6in3rlLLU2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891340;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=thrFFsAVoZM5qvImPaq4dRUCRKPov7KswCoNGlUYbsY=;
	b=MTJl6tdIA9vWnZ9w1EQjFlRbmbBW5nFSUpOHo8rOCFwgu9KOZvj//3d0vMYD9crqH4Rm
	 UNFlGanYPXj00SJ/Zibl5C1HYkZkopoxZy9oizq22WsjKt5ORE7FiNcXM2EVShyz/fLAq
	 5LkWcz3d8GEIHuu/ZCakNYoKMbPqsqQPVGqibz7/DZp6fLle9ZmItTJuJcHNLXUOf/mNa
	 XTuuZDRf1NWyKq+Osfrfq6o+BSQ0qxDrP5Ydyf6G2d0hOrrgTzKzYEyaqEDHFG4ocxlDL
	 oF4/jQ0hZ20QAaPnCjGCsuY1oXBfPZDn94IgyhDPZBvlqTbCe2pNxVgkoy4pbq/20BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWzqO0PJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iaHMQumY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA27D606A329
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 15:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA27D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWzqO0PJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iaHMQumY
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQApF686793
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 15:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=thrFFsAVoZM5qvImPaq4dR
	UCRKPov7KswCoNGlUYbsY=; b=MWzqO0PJdRVP+QbGlzvgsxO1MRAbzooLBcA5pS
	OBdmmqfmHqO62yEcGERruGy4eGd71G+DOPfB4C3/5KnMu/eL2CJzw8QyMJ34pJzt
	Fn0OeZcJt9oaeiwO9niOiG2B3SMMEDwD5SXUI9S5cc0bwMr9R2cX/jpSyT1Gs6WH
	BvnktwJlmOTWtrvzccjH3e2E/Pz1QTrxjgLJaNmf8QyEDtVuAgfytpE7Mnm3mB2U
	1Hoe4xwK32WN2cLPehBTGm+/1yA8tlFiQ7eWbrP1/9igTR3+RrSxuDF4UPT3TlbX
	35Ptjxsx7CE+fXe/qoRo5cKjJqa6xufXTsBrCEkvct8JSCNQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq1p1fsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 15:08:58 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9806756ea40so1588961241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 07:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793891338; x=1794496138; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=thrFFsAVoZM5qvImPaq4dRUCRKPov7KswCoNGlUYbsY=;
        b=iaHMQumY5y+8rIdydmBJXlTNVr4Jl7iVFlCfSL3nZ/D6hmS2SaYyPjnCCLS9zaryWc
         hHxz8ihKzZjkdMCcbF7whjLiqgSHWFu8w2iZo1CcK5ZWfBEdeCUR1q+x/sh3Ho7lBD1o
         ZVlRtGe9pODAJHyVKYwVitbjnXP+Pcm0MYFIK4VpizFozH2EuiYUq1v7bH1j6/9RFqhh
         RpgMJlCGRLi+w+xjkFnUZJ/9wuxg49zCfOOTawqNxxN8CfI6qTviXuLa0xA29bwqfOGq
         6ncw0hMGAUYltHt43aDNZNHSO5A4/FwnZWh2D9fePLoSqs6ze2KDBAg6UV602NmY9UpB
         0Mlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891338; x=1794496138;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=thrFFsAVoZM5qvImPaq4dRUCRKPov7KswCoNGlUYbsY=;
        b=1GotNoFBNE8CkHbOLYQgBtYhkeyny9Vqg8mVlog1CTmnk/0yoe6IGqATlN9hJmeDV8
         yDq3dpBvTnlqkyz2jvBKd5Ba5NEWDs9tQIezMJTtUCXhgz9fKkAMz0NTrQpmHOSX+twi
         gXB/YkB3x4BnEDysp5n7VsPHcP0EZgqRl7PesiydoRgjkDr36/7ZmDw4pfpH+aH6sC6f
         ucarMpLa7TXhLH2uVvuzjNIU2inaOJQcLyVnbq5S/eEjmjQaJhAgVArXMWuANIMlzeE2
         YU2mxRsYFv4ZgBbqP8n8E/xzk2J/6ZGU+fiLKk9y+Om4EYMgPdgvrD9p0+W0yjStubz1
         AqXA==
X-Forwarded-Encrypted: i=1; AKwUvByENrZ5M+bSPWWq5PpArIFJI7nYfs4zz72nmrOxDklV8wWwtnGWVexxqCNHu/SJbNzYKpkE05+ATamQac9y@vger.kernel.org
X-Gm-Message-State: APuU4Z/XzRPmi6m6TagOy9Tei1Pj1BIdVbhNhvNTVoWboADrS8ImwO+z
	BrFIlox8NuSncm22Y1mAYse/QoDWhj0Ao8c8ICsia3aoTIr6K8a6Zj4mfTuM0jv8UexrkmTqxyg
	RTgfzjCTZJRkUBfxpBEhUHz1Nr546zO6UqkCv080hd8Hu2S3fnUgqkLtcQ4HArgJIx9kU
X-Gm-Gg: AYBFou1BeF62/h0Tcur0g3ewilfhla2kH/iL03ajFdUpbrHqQvRqCc6+BjUPTGmjG1b
	FWR3Po4dthWE98U9hNkTiSbmCZGnSaLrPA7gOW4NgchSEVvSX5Fnt/BlCTWbjScSIm70JiHo5t/
	Xs/RwEC9/YPyENLClplWScGsPfjlKTuy5qaZI5nMEuBzY3hpq9q6iaGIiXan8VkQNVs9sOdTSoh
	Xe6JTliLicZQ5PGDrGUBSlbAN+fyb3+KKbX3pwdIXj/wKl0omKEcyyK55v49CkNi+y8XzEu+h2b
	lrnSRXeJTlOB7Aawno9U/TQ1DxLp3alOjbQorogHeAFsxsjRToKCYac2fpdLfZaR/he/vqvbwcz
	US17aQJ6Grw8a56GhTk0tv1pZIhr9vuEEmvJJFbgNcP2u1b9RfFni56iMel4345JblnjA11kzCA
	EPQWo6xv5Ta+yAtHK17PQnABjP5YRZ691K1WI+ZzNd1ErJ+t5jidnHyWb5Ev6GF96SlMPwqvJ37
	sNtcP+ufBT+QNVEmcu0JkGv8aS3
X-Received: by 2002:a05:6102:83ce:20b0:7d1:cf05:f2fc with SMTP id ada2fe7eead31-7d1cf05fd37mr3546612137.27.1793891337889;
        Thu, 05 Nov 2026 07:08:57 -0800 (PST)
X-Received: by 2002:a05:6102:83ce:20b0:7d1:cf05:f2fc with SMTP id ada2fe7eead31-7d1cf05fd37mr3546572137.27.1793891337359;
        Thu, 05 Nov 2026 07:08:57 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725061e1sm76689575e9.7.2026.11.05.07.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:08:56 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 16:08:55 +0100
Subject: [PATCH] media: qcom: camss: Use contiguous DMA buffers
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
Message-Id: <20261105-camss-fix-dma-v1-1-74e9ec56e518@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAac7GoC/x2MSQqAMAwAvyI5G2ijFvEr4qG0UXNwoQERSv9u8
 TgMMxmUk7DC1GRI/IjKdVawbQNh9+fGKLEykCFnrRkw+EMVV3kxHh5DRzSOzvUxEtTmTlzV/5u
 XUj41McekXwAAAA==
X-Change-ID: 20261105-camss-fix-dma-c32288664dd2
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Allan Siriani <allan@fatecpompeia.edu.br>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=AaYkjHXG c=1 sm=1 tr=0 ts=6aec9c0a cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3UBxRJvOpeY5cryqNLgA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MCBTYWx0ZWRfX9OhUgkEA4tpo
 VV+YqlQUfBAayQBQNInlSDbYLm4hxMWwntvuWbPens6dv2tze1QqbpFrmxtRECr+yQbAcnWt2WL
 UTgUKtzdHsIC8PinM85iWOFGTcGdjjjPFJF5Dww9nxVnCzWiSLXLk8e0pTavYu1NnSysZcNv7at
 JMctCJP7+IFAzbu0zY7gnD3RG2bCgT+LXcR0+xJg2XvxgnPiVLES1E5Y5BhHtFGHDtc2IH1vBsm
 kCZRgIVInjWP6tN6DEPi5ALmgPyb4nKYxWyM7dFCd4ft/BiCCQ6g3u3MwO+StQVUUlhKsJPN+87
 L2DyIUudlyaQu/HgmNbZqex29hMaFssau6AhPeR68Bl5TxMWE6LGLN5YC7VfBdwRoDIFBJWvnBv
 JabNn6GYUzMoeVxMQFUvdFQE18t81eoOtlbZqfpb9oj5Pxbl0BdWHRkoUrlvwBes/zZcnPykm4K
 evw0+HmWS5Cg4K945gg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MCBTYWx0ZWRfX+ey9hw4eryO8
 RXuH2jEg0+50FeughDJefgLKfPmvJDowSv+FMVSuD4fB6Aw2nwHLLd1fkhN2B3WAaowP+2vbh7f
 XkX+D6vvqtJ+xcLXtHJIbBTyN1wrlkU=
X-Proofpoint-ORIG-GUID: 1a2_jjLcEuXhWfny2Z5H0fBRjinKVySq
X-Proofpoint-GUID: 1a2_jjLcEuXhWfny2Z5H0fBRjinKVySq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050060

The VFE write masters are programmed with a single base address per
plane and then write the whole plane from there. video_buf_init() took
that address from sg_dma_address() of the first scatterlist entry of a
vb2_dma_sg buffer, which is only correct when the whole plane is mapped
as one contiguous range in the device address space.

Neither the driver nor the hardware can handle a plane split across
several DMA segments, so scatter-gather buffers were never really
supported here. The issue stayed dormant because vb2_dma_sg gives no
IOVA contiguity guarantee but still tries hard to keep the number of
segments low, and with an IOMMU dma_map_sgtable() usually maps the
whole table into a single IOVA range. The mapping therefore almost
always came back contiguous in the device address space, so reading
only the first entry happened to work.

Where that does not hold, the write master runs past the first segment
and writes the rest of the frame into memory belonging to someone else.

This recently surfaced as patch proposals enforcing contiguity in
camss itself, walking the scatterlist to verify that the DMA segments
follow each other, which amounts to re-implementing what the dma-contig
framework already provides.

Use vb2_dma_contig instead. It guarantees that each plane is mapped as
a single contiguous range in the device address space, one IOVA range
when an IOMMU is present, physically contiguous memory when there is
none.

Fixes: 0ac2586c410f ("media: camss: Add files which handle the video device nodes")
Reported-by: Allan Siriani <allan@fatecpompeia.edu.br>
Link: https://lore.kernel.org/all/20261104202313.72494-2-allan@fatecpompeia.edu.br/
---
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Kconfig       |  2 +-
 drivers/media/platform/qcom/camss/camss-video.c | 14 ++++----------
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
index b51745c942c9fd71a95d09993213bde4b7e877e2..e1967bc20cf03ea1b0b159c5175294eeb40fe1c1 100644
--- a/drivers/media/platform/qcom/camss/Kconfig
+++ b/drivers/media/platform/qcom/camss/Kconfig
@@ -5,7 +5,7 @@ config VIDEO_QCOM_CAMSS
 	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select VIDEOBUF2_DMA_SG
+	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_FWNODE
 	select GENERIC_PHY
 	imply PHY_QCOM_MIPI_CSI2
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 0852eb6f13154cfae7147ce39d22de64d14a5cba..5de6ff5ecc76a2863e536fca1c40ae6b2de6dc0c 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -13,7 +13,7 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mc.h>
-#include <media/videobuf2-dma-sg.h>
+#include <media/videobuf2-dma-contig.h>
 
 #include "camss-video.h"
 #include "camss.h"
@@ -154,16 +154,10 @@ static int video_buf_init(struct vb2_buffer *vb)
 						   vb);
 	const struct v4l2_pix_format_mplane *format =
 						&video->active_fmt.fmt.pix_mp;
-	struct sg_table *sgt;
 	unsigned int i;
 
-	for (i = 0; i < format->num_planes; i++) {
-		sgt = vb2_dma_sg_plane_desc(vb, i);
-		if (!sgt)
-			return -EFAULT;
-
-		buffer->addr[i] = sg_dma_address(sgt->sgl);
-	}
+	for (i = 0; i < format->num_planes; i++)
+		buffer->addr[i] = vb2_dma_contig_plane_dma_addr(vb, i);
 
 	if (format->pixelformat == V4L2_PIX_FMT_NV12 ||
 			format->pixelformat == V4L2_PIX_FMT_NV21 ||
@@ -699,7 +693,7 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 
 	q = &video->vb2_q;
 	q->drv_priv = video;
-	q->mem_ops = &vb2_dma_sg_memops;
+	q->mem_ops = &vb2_dma_contig_memops;
 	q->ops = &msm_video_vb2_q_ops;
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	q->io_modes = VB2_DMABUF | VB2_MMAP | VB2_READ;

---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261105-camss-fix-dma-c32288664dd2

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

