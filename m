Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601980;
	b=D2MKn3vn/aRv5jChXrvRnr5IlOnbJTZpiiV49eUvCVdsi951zS0/35ALrPfu17Y4u1DC
	 0ngQqxnH7EinsncWRwRD1LJNn6dFdhwvdILvaswl751gcPVcQcUOd+jvHcD7weZp/RvSR
	 AcniYGDmSypmVnwqV3oRmQCPNF1Iic+UH+DqWzIE9RRoCEvtbjAE5okKssOAQhUF5JaCx
	 YRZa71xr0grsb1Fka3lgMFuriUxDTK2dEjk21hUjvHk4mkUVbVzR3DHrs7/oo+V+xeDa4
	 Kz1lLvop2KPlGpRnSq0t+ZPhVKh/RACvNSAD2TwIOJ75kqCYyv60hdS4bUuS6Gu/lUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601980;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rvEacf5HA67X3IxGNMpjqT61srhuijH4DoiDDpdhvQg=;
	b=nbdwWsXlb9PjCMv3l5ypta+bQxV+va7Uwkf6HeBO4Sxktnb92cPiKK9o+t4Tuso1Wr+F
	 rzW+HsrZtJ+CVZBL9fSAgSK/XorLIizaBSjqZNxoT4ypxST5LjTkAjr06w4YNUIiaTcUY
	 jrlRYUGEF6l6maT15buZAeGyybliTHS84dvEGaL0L4cG/v0DNoFfRiL4MEvgFjPw73t6u
	 LTUwr0N9jyabcyxbQzEWIV3tFBriyfiq/qIgm/Rkdd3wBc0W8PIelNBZvcd90dHjbk8jk
	 bDvMz57G4WNP3n4Rz3YlZY7SxLBjsBVm7F/nmjGJS+zKannnyJHcWu0coPt01nynxlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HvZt5M7c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S+AzXQRN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD493606A6A3
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD493606A6A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HvZt5M7c;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S+AzXQRN
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mlXR3611422
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rvEacf5HA67X3IxGNMpjqT61srhuijH4DoiDDpdhvQg=; b=HvZt5M7cvb95m36O
	5ovMIkHPraDyEaoFtG9TsyNAsjv09qTqXYY7qUGCPItKhVqn5/OChqTWibSmlQYH
	knc4NvwW28yDe4mMF/UknJrqIcchbk8cLe192pK96NZUmbcw4P6jmqDfQGHsr/16
	Nae7t4Im/4FZVqNqsR1At4u5sUbMhQhNohzdNOIswVlrw+hC7LWpEQNvSKsWEv+8
	ps7XeHpE6fsZMAb/K480b23Gylzt6CZaN3TzKwIRvkhNOOn/sdll8c4UA33PQkYo
	p5rjVTV7wYnBADrBkPtc4mymx1ewwLmdqUKL/TNv75GWGO2FFJpOOYu4R5teh490
	NxoNRg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsb3t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:19:39 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-92134f1eb00so79689966d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601978; x=1796206778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rvEacf5HA67X3IxGNMpjqT61srhuijH4DoiDDpdhvQg=;
        b=S+AzXQRN1BCwylBsAzwaNALXwFFD1MYalyg92TLVeVA4ZrGZiWJYvxXy/jL7uDZLaF
         dkt9gUTvZIpM3WTVPSygasOJbhKDwB6enRsrd7zFKH4jnePBSD8tIoM+pIWBWA5iPCcL
         iIWufWE9Uju8DZ2rAsj13kqsuwjdRgJ1TmXrwP7zH3ZEFWMW1e2mEpI7rK7jhDwhLsrI
         wvlij9RlpcN5OUthroo2dhbY9kBsK2AEQPnGJDqOAJfcFpBbIU/OtWt3pdZq0AwIStoD
         67IBkeedSyGxdfRn2SYWIMJYPXoUK1FGd++BbUkUBTA42pE6ukPObYDed5iq/VvhitLH
         HM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601978; x=1796206778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rvEacf5HA67X3IxGNMpjqT61srhuijH4DoiDDpdhvQg=;
        b=bKlG/qLNK2FkWhP/DMUXRAJ9RkxjHqn7l0wWKsoQM55csNlxVum3xpK7UUFJvYb36v
         yH4jh0FsXFdvApsR27y+v7kzoapfkvfKyaKDNVjGy9n5IOphrVcqMfW/+FoSyePSsGXI
         TvdSxRekQhho5OfUKq9L//rxnyNHXX7m6T3d18a4hziWAuaDQZQAAoQKpgXUG59B34Ai
         x+3Adn5wNdkrhC4bg8yE0yOvoNvZhsOkD/JOVJ9vXYcoJA88nX25I5D70QoMfFUrzFjf
         jShlMDGK5BaLbBIMq1wz43AOtqCb2sZ02L8ePMxXcOonyOgTKwVWoagMm3VxHw+dFzBn
         8Elw==
X-Forwarded-Encrypted: i=1; AL+hErFkxtwPr/+IHhQGAAtK3mexgMpjw4xjZ8/aVNWwG+I6tT/G0+yIeikv5KlFOdiCNpQ6p0C+vlde0wOx6X81@vger.kernel.org
X-Gm-Message-State: APuU4Z/F5EVZ1XDFyYVlsoXV5sVH5SVAO4YPrPXs0VRbBg9Ven89CEWC
	OA9j80cvMwAt/w/cinHJv+qlD+eZ8VWHYjvvehMf/F5QhDPioAnU61JFTAC7cw+dEA7A9MyDfog
	SSbiRm/ySxJX9QLRSLkd6mKWlTpgHGRLrz7dWaFzaKutolSMlN+9J/hjKfI3hbOaLxGR0
X-Gm-Gg: AZFdTZc5xkZkY4+ifXe7SyFACxj2geMEZ7L4ivBxRUFAcnydjbB+ufmcK6jwP4YuGFq
	3TXopoiZ5ojCnvSdvgpUCD6xYwmLJKXP6Qk7kzZY0jE5VDYCitx2SO9jSvqd39NzDBWD1FP6WrU
	Fcoc7anCJ6W7BC88bBsjLmlL1JasikQs4bnCSnerqo+jowVVlltMFZJc+cuzGwjqSnaVfzYAsMU
	pPkhpnKu+6KDb76IMP3Yi7jOjqxQdPpu7akoAvCtcyfbhmDwXcuZ+zIWzTdJiYHOAaHCWcNKjli
	CGlfgPPZRPSyyPmc5OSfXVTbOaPeNQdaQJzAhi0KKL1pTU2xhcXDvWGN/pgf3xbg2m7DJszI8pm
	aVFLkOxvSHNyfuIl3vkBipfxm+VqBGCoHkWuMhblOUfuIOPPJqVs34dqlsr6RD/ZrIlbPIT/euI
	gGyt6uW+odWOdfZchuxztNU2IIYqG6JpwDLHJSsz+LP1WsYEQ4AmdQ1ZbyTdbz13mxcS40m7RVL
	9c373TolJeUw73mK5W2oAOi6RNi
X-Received: by 2002:a05:620a:6484:b0:939:fde0:a71b with SMTP id af79cd13be357-949ba6c4bf4mr2958871385a.0.1795601977986;
        Wed, 25 Nov 2026 02:19:37 -0800 (PST)
X-Received: by 2002:a05:620a:6484:b0:939:fde0:a71b with SMTP id af79cd13be357-949ba6c4bf4mr2958869585a.0.1795601977545;
        Wed, 25 Nov 2026 02:19:37 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b70c05b9desm9342072f8f.54.2026.11.25.02.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:19:36 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:19:31 +0100
Subject: [PATCH v2 7/7] media: qcom: camss: Tell userspace we're using
 start-of-frame timestamps
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
Message-Id: <20261125-camss-hw-ts-v2-7-24c955e43d75@oss.qualcomm.com>
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
In-Reply-To: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: bYnxw73XRPrni2HxTBg253_MELaBvVv8
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b06b63b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=DYN1bkTOkzx32VtlnxQA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX3HqnGIsQ20yq
 3Gyp51i/nlMPx48yphhvJiMRJwIYUJk4vcx5zVLYa0hS2OIw32XlCIxIPdViVO2tTdendj3ULd+
 BN5wjTJkOKCldgOUOmckwYCZZwPn36c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfXxCNf3IeEqkF1
 kXpa5CItCR9437NXZWxUKBFUiYD3Uoum69GVTaEbLMDffU5Xltaz0ehdC1mUISS3UM9y7bLEn1y
 vcIXVc2DtgfR2Z67GTsVrdETcl5dZlF5Q+z/VrTuFWufTLUU863yjWWrVs1d6fUD5LZTJDqKGZK
 6jCe7BfuxFFvCL7BlUvgOvDMX3TVztnBjRpf8WegRvgDUxBc1a9D0qgnDfSA6waLmWatl7zbuts
 TMuZhFjo/FAa0ZzddewDO34wSncMg9foPecE8agb8dZ5J4Zc2Th+6o2d9VOTCYQje+uHyAcbCZY
 8DplI/T8SlHJ6EXJpEAT0nOukMsqHVRsuyKXvW3C2NMrLXclRulGZM/Cp6611xoLcsqJ0gXwJZO
 ibmYO55CAKwey/TaqQOFQ09/28jzLqSNaPeJWNShdrFoiw2+MgkfyccoheLOfqsRybPmqiIVzHf
 FNgIk62Mm8/40zcntjg==
X-Proofpoint-ORIG-GUID: bYnxw73XRPrni2HxTBg253_MELaBvVv8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040

On the SoCs whose CSID can track the start of frame, the buffer
timestamp is taken when the reception of the frame begins, not once it
has been written out to memory. Show this to userspace with the
V4L2_BUF_FLAG_TSTAMP_SRC_SOE buffer flag, the closest the API has to
offer, it is defined as the start of the exposure, which on a rolling
shutter sensor precedes the start of the readout by the exposure time
of the first row.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-video.c |  2 ++
 drivers/media/platform/qcom/camss/camss.c       | 12 ++++++++++++
 drivers/media/platform/qcom/camss/camss.h       |  1 +
 3 files changed, 15 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 5de6ff5ecc76a2863e536fca1c40ae6b2de6dc0c..4ce87527b9b984068f5c9a9cc3bbdca645cff1d3 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -698,6 +698,8 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	q->io_modes = VB2_DMABUF | VB2_MMAP | VB2_READ;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	if (camss_has_frame_sync(video->camss))
+		q->timestamp_flags |= V4L2_BUF_FLAG_TSTAMP_SRC_SOE;
 	q->buf_struct_size = sizeof(struct camss_buffer);
 	q->dev = video->camss->dev;
 	q->lock = &video->q_lock;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 26e3f2aa3ef2485e0486eaa89f93b804926b6e32..ac99e84b94e73152b82050e6c6727dec238e188b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4839,6 +4839,18 @@ int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock)
 	return 0;
 }
 
+/*
+ * camss_has_frame_sync - Check if the CSIDs can report the start of frame
+ * @camss: CAMSS device
+ *
+ * Return whether SOF tracking is available
+ */
+bool camss_has_frame_sync(struct camss *camss)
+{
+	/* All the CSIDs of a given SoC have the same capability */
+	return camss->res->csid_res[0].csid.frame_sync_en;
+}
+
 int camss_pm_domain_on(struct camss *camss, int id)
 {
 	int ret = 0;
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 8154fab54f99b12456cb377dc4ddfcadfcf8278e..da1095c436323639bc0fda5ebac8026a09565108 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -177,6 +177,7 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
 s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
 			unsigned int lanes);
 int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
+bool camss_has_frame_sync(struct camss *camss);
 int camss_pm_domain_on(struct camss *camss, int id);
 void camss_pm_domain_off(struct camss *camss, int id);
 int camss_vfe_get(struct camss *camss, int id);

-- 
2.34.1

