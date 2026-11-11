Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402337;
	b=06PLc/s3qTncSVtWQw+EzHVZaIZV/XCZoanWUwlpAQUVSEBMlAWSu4I68+1XMtWoCrn0
	 HaZyiy2gsDALCp5oMZLBxVUdfERNCEPgMxhmfH4Yb1hwQQQdZdDsSNhvms7iOJGnBf1m+
	 AByLh5GMXdgiAvhKpPCUTexKG8SZJwM6KZiAu8k6I1qMaen+atZ5WV0Se475rGQ1xmSpG
	 adyIhu4tLo1EB3WYMVlsBR+0StN3+IFMSWwd+uO376ofwY+KfQ9N7JgwNGXh9XbGKiNst
	 PqiN5MdUBOuE/Zrxm1aCroHZ6mO3Op4KbtfPSAJhuXZ38mQRWk6luc5acG66EaV+I3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402337;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hDLeoRycWT9SktFPdwCLoZ37ME2W+Lxacb6xfAmuc+I=;
	b=CBqjzMVyF5hz6Lammf8r7lFJxLIdgZ3xJbHPPPntO3rwnfo7O3+BYZMoDMrdDsBw1Ay1
	 abLidD4xhkw7uKqt5Nv0KThCTWFUvYx1Mq8BD6xDKfI5pWm34CTM4ZdF6RW2+GSPuhVfp
	 MCETZVDIFFRetWLx1TLltNMUtqUYZpdJuGvqUJmYftTLx2ydIfc1FHXpa0HRd5lCdfDGY
	 NOmVAztcOnyK+uWbFebo5bJQklD5mePVQxCRmNnX1t1bZ+9QR8WqcM32k5BoOvJ5V4xXm
	 GtMCXrZc1eU6n4RHMn0ordTnf0kxtc2gUmRssAX/RT8uvxa/wcCcdD7lcpgtFMpEljA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mge3O4Cw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="FkcWPml/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D349606A334
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D349606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mge3O4Cw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FkcWPml/
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZ03A2286883
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hDLeoRycWT9SktFPdwCLoZ37ME2W+Lxacb6xfAmuc+I=; b=Mge3O4CwSJkvft/M
	0oULLG3uxOE3oRd9OmqHOc6ZLnVhTNWkBctwmxVN1uEjgcR5GeY6h7EVMbRahlm6
	E5aCb0iW840dXFUSH0TmnYRAgtuf2iVUovfsdy/Fw50fOqWy0YIyUqRmmgzh+YEM
	DA5UvugwCKzvfMQxRKoLf283EVC4NQrKqeS5yl9hsOd5ThOYbzxF/nXyZ8FtADfm
	hTzHFV0Ufopkxf22HKBdlHrJ8UleYb1fqWe5TXSzTST6xWIhsfnChWJZVKbCJGJ6
	pam1beh7NBu6e1pJ9NS4IRbt99jfIokbhAu63j5Pi6otuSyowaOxoPsJhQIVsjFB
	zfLeWw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksm9940-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:05:35 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eac41ff334so2901266e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 05:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794402335; x=1795007135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hDLeoRycWT9SktFPdwCLoZ37ME2W+Lxacb6xfAmuc+I=;
        b=FkcWPml/MyXGx4siWcLpo8fEfQWFuW6V8WU3xuJWi6ZENtK7PsZbZC/OOSztI9mI+0
         0khbTwz2lOsmv/E+bW3AD4DMYGiUbqX5gZcjjalPdSuIWNH5XHKLbuTj3XPe+/Gu7lwW
         CHYO/UCkUUGJiXl0G2NxYWzqZTVw+1BHJV59eKTwkDHfP7v8r39Z5TDUsGuIgY/Wh5i6
         ATU+WfSW68VPLDcGCXEQvxJbzCQPrX3bR05Ry06sF9x4uRzslZ5w/ldf/M2BLcWE0BNc
         GI9Q77Cegk2ivrt1SBek+Whr+qOSz++i3ANc1/DCc1hpsl+oQVkVvgOj6eKzwbGFDvPm
         YX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402335; x=1795007135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hDLeoRycWT9SktFPdwCLoZ37ME2W+Lxacb6xfAmuc+I=;
        b=IlaRAFhqwIdR2RPnk/0cNWjFtqsKoFl+skZ55v2JuTyjFahfWofxKOJcM+E23Y5VJA
         2b18whY3Qta+nPP68DFnQx8yaFpAsODVHQFsinax34BkWGiePXNO8GH9MhzKMR3Tv+y2
         9KhdnirwOXh7Mic2XRgf6qoh1ardS/AxhSmjxuwRlnAHksQf6cGfUie3vMIRRrOsXUFy
         Qjp3RDA9XacrUMlPmlc5ggp/6/X/EVrOTjWKl1dQyq8m1JLv4Qb7srrppZr8sQbr8zbt
         qYPW/6k6zaqYUQWCe+r7vNu0FOT/+eX1uLyxHhcF9LGc/i+c5JWuLtebPFbqNglD9Jv6
         czIQ==
X-Gm-Message-State: APuU4Z+v3L9ZH2Fl9nIhzD4UweOpbMGLupX9CdetvtmuR07uiyT/SMzY
	x8wr+zNXjMve2P0j01aUtKz3/VxTboNerKo40R99is2L8A7TqzGSiRrMzS0RlRte571C50Djo1H
	iL1gxhenj2edT6pUYgiibQQUgADcmb3U/GlLbKSunbmz0BsQNvq7dt+//yGZMZ7pmjd2+
X-Gm-Gg: AYBFou1JyC/i/AHmP8/tFF+fZjlyaBjGAYPq08HUxIUByacA9pyKJlVricrJO8TnM8I
	+8ptdIObGhnybRAScx+CF6uQPIC2LmL+VNYpWHTjbn+nxKDkoQHDSa7lf5ya6dh0WaT51Hg3men
	lhHLPUwF+A2bH9uS1tWazBDsRivaZ6R/16KVv6dTJE1UKoivkyO3Nbtzt6uJBdpdu469/qrLXJU
	0zxoBxerh2JaFlmiTsJrrrSmIQvh33AW5vCIxthQ8njdLi0frPW9mVyb32S++EM7LohbXrh27f5
	oL5XTmjfTjHcEDaNCebPJbeHAFbubhggyUqZr1I+4vuo5/rZzhysYFWfYL5MEwqVaCm/XJo+ijQ
	ac7ckHSUg5UBXbtXdLzV5f7hDi3VJXTjdy/eMnxSdYpLPvMRqo+9y7Xap7dH1qghhcP78pfoLYK
	ACFpvREexNkUNeDolLzUsUo1PuCiazIHRUAzX0HWu8jRvlb7OTNmaR2gdTy9jPIg==
X-Received: by 2002:a05:6122:6b8d:20b0:5ea:dc36:245b with SMTP id 71dfb90a1353d-5ee1c474bc8mr607063e0c.18.1794402334788;
        Wed, 11 Nov 2026 05:05:34 -0800 (PST)
X-Received: by 2002:a05:6122:6b8d:20b0:5ea:dc36:245b with SMTP id 71dfb90a1353d-5ee1c474bc8mr607007e0c.18.1794402334231;
        Wed, 11 Nov 2026 05:05:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c15d368e81sm391858e87.21.2026.11.11.05.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:05:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 15:05:14 +0200
Subject: [PATCH 1/3] drm/msm/a3xx: report CP protected mode faults
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
Message-Id: <20261111-a3xx-fix-me-v1-1-d81f50f1ba1e@oss.qualcomm.com>
References: <20261111-a3xx-fix-me-v1-0-d81f50f1ba1e@oss.qualcomm.com>
In-Reply-To: <20261111-a3xx-fix-me-v1-0-d81f50f1ba1e@oss.qualcomm.com>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1193;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4Y+Iv8q+tsWXTJKMzXRLMGryRf3mAZDY044kGmA5Nag=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq9GgUTPifT2R98oLnAuweKYncAzC263DJMOnx9
 QaisRxcyIaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCavRoFAAKCRCLPIo+Aiko
 1WaLB/sEAJNtbNDwO4OauPCLF+uCRNRvoFmLZFRL7gSi57adZOlEkNx+JKqvx9S+op/InytelPD
 zjekmDD8voqBhuE5S1cl4OeGWPSXUOg5y2anGXeAd59Ti32LUWq4kbvSkIqtsxL9cFewnlAPMGx
 2JLzspBz2ZcIvMORoAKhyv4YiflsYOzq9vNS00bySGQqufZHJrKWBrQi7AvChRHsekN8lZBNejn
 IgDu8/mL/lWbPs6anNZ4aY1X5Ozvaf4Okg9HsIzpKooSLbg1+wzpyykMY+RvAeP1StAZJ1f7eRO
 XqmO0SQ303J+I5Wx2lIJgaHw+4lBz6/B/YLTkLuP+R6hWRfV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ILG-1038ns4_EiLXNmn8DXjzaX55y0P3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX4nXacV5eLlNQ
 HKWKjASpetCcuMIW29JuZYfvRIihIPslfAUMjrursbXid7+PsgsnA4fJWDXAJmhNyUqyagwbULH
 4aMJrFPmEqklcR4CIb0b9Kwf8bxBTT05ZRmgbTLJm9jszCSMsoN9VQqISvi08PVkA6OPuebUZMt
 coJuHVvPXDgMZacwjbdqShJL5C8Qfq5LA8rgsEvvIyzKqdtt2AQVOH4F/aWwYh6kGu+JpM2TzCP
 fBKVS4+sIY9knJocxQ5IhugmhGVmlvZr6M1cnbRVPSJ78TGeR315zZ7WlIqhE1TGA5UTPOZIwOx
 aaEwRKnBgAwyS6gsf/EQpSWKok3GhfF4STmm8R/bwUYAck9z2OMWrE8Z/GAFe6gOCjEtd49GLvf
 9lwqa9SKlmIB17XO/VMJI1MLNyUEIzjCOwOcCCMEfkvhP6i7rTS1XnX4tgnDcmkgbGYKFDI2B78
 tEXFsDj7T3pzI5PlNYQ==
X-Proofpoint-ORIG-GUID: ILG-1038ns4_EiLXNmn8DXjzaX55y0P3
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af4681f cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=0SDkzDXPlMfVP_Iu0jUA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX5gqQuMp6OBkk
 TfPewjKz4DstWAg7M+Zm4TGsOOpgPJ2sjIJ9lLRTDRYaPeBnN4to68tHwATwJTED5cifNs5bbgp
 0HhSsfayNlo/+zw42z4/cpRJpCM8p1w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110052

a3xx_irq() acks every interrupt without looking at it, so a write to a
protected register shows up only as a hangcheck timeout with no hint of
which register was hit. Print the faulting address the way a4xx and a5xx
already do.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 160d302e16a3..7e03b7305493 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -419,7 +419,14 @@ static irqreturn_t a3xx_irq(struct msm_gpu *gpu)
 	status = gpu_read(gpu, REG_A3XX_RBBM_INT_0_STATUS);
 	DBG("%s: %08x", gpu->name, status);
 
-	// TODO
+	if (status & A3XX_INT0_CP_REG_PROTECT_FAULT) {
+		u32 val = gpu_read(gpu, REG_A3XX_CP_PROTECT_STATUS);
+
+		dev_err_ratelimited(gpu->dev->dev,
+			"CP | protected mode error | %s | addr=0x%8.8X | status=0x%8.8X\n",
+			val & (1 << 24) ? "WRITE" : "READ",
+			(val & 0xFFFFF) >> 2, val);
+	}
 
 	gpu_write(gpu, REG_A3XX_RBBM_INT_CLEAR_CMD, status);
 

-- 
2.47.3

