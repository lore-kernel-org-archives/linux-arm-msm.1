Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810204;
	b=mmuFPQ25qQyXlmjZxH6R4SDfTTEq8PFO6l57Q0fJOhPnOInhFS59+hqUVcHT7+e5C/ER
	 5gin4ugh/wKk5NPXYIb+PznvtuAO3H+jum/bM05XumKieXHop3pMP+0VY0Ebr+dcSpQRK
	 w1ijr1/sI3v1vJIK2EUFTgD1tzCHaEGaFfWz4Ym6w1mNJ54VaG4VdQ7DRmLPDbxxUCoyQ
	 h8dnpHJca/Rehry1U59sIgtLWh40JjTvHxgc/9QqoOrtVMpFm+NTjmefXemT+oHE2sQ0g
	 hQKpNvfTYRQNrCfUUby4S25HyNaYAARLnkvZav2kHEQ+CBzWqq19/x9Kyvq4cQWnIhg==
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
	bh=ux2INFN8CyiFYeuZ7exzPWUq7g3zN6LyU1Ff8oDXkFQ=;
	b=vuW2DLh1zgg8cQXInIqMekqMW7LkXaduz9xhVYNxM6o3QiDrlkDtp8eImu0x4gAY4+et
	 lBzSIH2J9+KNO91t8ZFueWcM7LY5zUDMBfHA3RW60kK3leqVwe1apqi3QRt/22ZHEkGzJ
	 C2eXCYPKnxCP2fGyO4066LKHP4g6YALKEXSvkU7gJ0sxwrCcYTZEnQQuXFU7n2+l2/xXU
	 voBaKNF55RCMAAwSlYFC0Df3iCxawMiFVLZ84xaadvVCsZiASZnmupTp9YqmSltni1Tfs
	 UOcrbHK7LoU1h70HoKvC/eNysC3QBhU52T2yY55PSuYgSg84d7Ilk5rgYVVEsxHGcKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WT2CMDWh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JhJWHzdd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F80B606D810
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 16:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F80B606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WT2CMDWh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JhJWHzdd
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FjXAU1692882
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 16:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ux2INFN8CyiFYeuZ7exzPWUq7g3zN6LyU1Ff8oDXkFQ=; b=WT2CMDWhY2Op9Xyh
	IiUxdKXgoQeqXjqsxA/EomAxX0dwvRY0fyZYEQrHhtGs6x8tKgVZbQre95stg7MA
	yjaPm2n3CpdorQEaCBmXwmpY+pUZBsXQ1xhLF+GvVJZZiDK4mYW5UPSxRTqCbvkc
	ScygtmVdO8SZRqrc4f2oJG8Xoc++EzXKhJzZDoeK0Ca52IGdq18FIvuaqaxASb8U
	c4Rx6yIWT1ZYFuNHkmxP202s4pDUzIqr0zq5qxVG6EW2w7C7FMSfMdqinAUjdzFA
	/X5usHRUKG1JxXpGPMig1PU7hcggIRO8w5haRGTxnOkR/AhDl+5L6p/7LHy4o9+K
	cqREaw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6br0jky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 16:36:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91e81083140so9795556d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 08:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793810202; x=1794415002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ux2INFN8CyiFYeuZ7exzPWUq7g3zN6LyU1Ff8oDXkFQ=;
        b=JhJWHzddBWqzkjmyp2ATBWIejRJ0r21m3t6WS0Gz0O2uEInaPjnMRQqndGRQyG6R/g
         V0//2r8O3Najy9VECSbK9QX/lzGBjBb8x3Pe7CuPQgl4Hp5/f4dRS9RCFa/44mR+sfWh
         lXxn6JBM4CHnPKczfrYZwUf51lRcdV4YLlxoQNCADAQO9UiR3DspCow77Bj/JPiAZier
         wa93dbfV3y5xlyO0naaDumW6U/yPf/pqfxWNMevO7yYUxripIW3jdHdEVPZimVMYwY0c
         MSCxJJ8h+zzntG8KSymzD5UJw+PkZ7UqX4N73Bk0WEAlW6mdefOeOKLeFNTEYkxCp3xe
         hZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810202; x=1794415002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ux2INFN8CyiFYeuZ7exzPWUq7g3zN6LyU1Ff8oDXkFQ=;
        b=lL+5Me9375cykPzwKPDPzl/JzbT8V+sAZJVTOAWs7uHMg46lBihT/XzjjCssBC2sEX
         axZNF6xPf0Zgwe7xomoBgaN3OOG+Z6mLtFG3VlYKJtbqa/tZ+PHAm+Pq2NZomDzLyo9y
         w0b0PgSNblV1GveDa4TUiFM/ttr67weeEt4QUrcmzaEBUE/eENcTsKUDm3DCYpNrovvo
         vy05py5NfAxjvKcwq4hRX57tXLKPXw0IbD2PMmwusJAoewb9kY7m02dZcx/7+2M2aMY1
         hx1UzfMl4LwXiho5xO9OnCQc8umyYs4uAmn5zLwboUsAdsxhfqrZcmB3eENAU9jwR8er
         +5eg==
X-Gm-Message-State: APuU4Z/xtm6cr/xxIc1tyWC0541soFHzoAnyFmXf4FrwTzfJameDJPmb
	kIltB861lLn19Ey7cREqNxtJT7tV6KPiOgB5/4Ru5eK/CE4ZQnnoR/9PHbE2ouSDjlC8n+ogfDE
	0ppKYoUM1wARaJBfn863XDXvBubE4Kik15K0tvMLejRjkDp5aUnRqgQ9kAk6+rDvA0UCX
X-Gm-Gg: AYBFou3j89ydESsEhTtXHwIT/049xC9iA5iMQcqLPpgeXC+sLSm4FZEwARVt7XQrOSW
	Vjss4l3T1aFAQIP3hp/Bbb+bsgadLbStyenWwRfxiL2nyD/GB/CLO4k2YDdwA6rbDmWRCN1ilXX
	V92aursuOR6Lgurmll/3t/BPOkTJCO0IGnKUItPp1Z8LZRHdrsh19cxdzkjbgQ08yR8tLmLBl4j
	NSO3s/Ca8cBdB3R2WwTRhhmj2Fh3GWy5zF2eh4iNH9bCE8brKii5bVBKswcyQ7BBPYb6bmvecr1
	95VACLRBqJzizPpKKS/eOlZEzEkPvPlFsqHDobUh/KcD+j3hzg6cNG39fExvOWYyJHL9w2nCzZY
	Cxw03SJw8cBDbSVxgvwT5AktZlqEHfqZwDBlq1u/lbOo4QdYczLxafHVnfMTE/suYrljfWw3eT1
	WNin2A3VkUsNdQyXxojUxq9hAeKdnzSgXv6kSHD+mYc1pY3VL9h2m5V6NRkgc9Zg==
X-Received: by 2002:a05:620a:6484:b0:93e:bbda:dd06 with SMTP id af79cd13be357-944213d6502mr2696744185a.0.1793810201636;
        Wed, 04 Nov 2026 08:36:41 -0800 (PST)
X-Received: by 2002:a05:620a:6484:b0:93e:bbda:dd06 with SMTP id af79cd13be357-944213d6502mr2696737285a.0.1793810200934;
        Wed, 04 Nov 2026 08:36:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6bed64sm5267191fa.7.2026.11.04.08.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:36:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 18:36:11 +0200
Subject: [PATCH 7/7] media: qcom: iris: describe QC10C as TP10
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
Message-Id: <20261104-ubwc-format-docs-v1-7-389044012b4e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1043;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SvZh5CRN0P2j/QuhEyRL6uJjDqO3uIDgSWZSsRrj4Y0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq618J4cdRibKnf+VJdjtS1BHyTFVpV1dzNELR2
 sAszpWufteJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCautfCQAKCRCLPIo+Aiko
 1el+CACvzc2zdVgKhNCjubf5o6mOt8oT+ot2JHTQ/URq2MH+m54KiYmLnQO8taUoZ5mmLRhQCS4
 eEQFd2jgxfjAWgH9V0fKM2K3N22ASgSAERYgUzcNOgQpsj8yZviB2vJyXTnCcvEfoo6eLTpcWNV
 lUPQUDoQWJZJhMIkukDJA7hG/h0bcab+y7lXWI4g+dzEzhsgNV0HEtUvG8w4JsgVjqNCgbcGwVn
 ah2I2cNbktErN4rBGlNJKMojexlV1JetVHM4SBnMYNXGdqubKJz27mp6WJ+EJUnVGPr6vrD8vnX
 Q1HH568jwfqpcxDrkdVBw1coCUUX/FiQw561xu5hJ9IAP2YZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfX71KLvBHJl3ag
 YOc5z3kTJtCBbsjhVglJx4g7mD2BKd0y15n8gSLXs/X2pukGLd6jfo6+F6lAxOJwB8TWQsdg4St
 OTS2p93VIgIeydYF8Gia3eAojWcfExS9DH092/jwXPS0nvuIhlk6tY6K/o1f5JT4Ycar0AoLJG5
 rezVraCw6rP6VSP3btyb62L5QUX6igV+dh3SQvOfUEeDjtVNoch3ECVheFoN+EVfdRU6lTUL8zu
 sMElOK6UJmpKhJqAtxekcyrt0ETxTdeRi1LTt8OrH2VXbwammsCUD82p/jsklO2ICdpEmKRnMYS
 bIG01cFhzZRZYu2o0cdUKdWyYdVq4s9jArQ3WQW/9Ib5BvBxyzRQUQfugKHAy4S1Q0HA4fWzjmY
 rrI6k+A+8QkQhZlM3vAv4H4Q8d3Y4EzupgTGs2XAS4ucXhA35nCSYwW4j4/6bt17fOZceM9sGwX
 jUxRTnpW8Ot4ITR9FLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfX3SXH/rDi4T42
 ybo8MJUi/VLS19NY3+vmrW5EnFpR/yafraXgG2iQihJg0q/ep5BTVPFjW706CraOYywMu7UihRz
 PGhARO8juJI9EBqwrOcYWYOp0C+6XhQ=
X-Proofpoint-GUID: IODv5d7p4Fvs2Uf-8n2qZea81Lz6oUyV
X-Proofpoint-ORIG-GUID: IODv5d7p4Fvs2Uf-8n2qZea81Lz6oUyV
X-Authority-Analysis: v=2.4 cv=futJ914f c=1 sm=1 tr=0 ts=6aeb5f1a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=w2mF-G9HTFYObF59u-MA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040066

The comment describing the QC10C buffer layout calls it a compressed
P010. It is not: P010 stores each sample in 16 bits, QC10C packs three
10-bit samples in each 32-bit word, which is what the stride computed
below (width * 4 / 3) assumes. Name the format correctly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index eb8de60c1177..ec2bf2a2d953 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -266,7 +266,7 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
 
 /*
  * QC10C:
- * UBWC-compressed format for P010.
+ * UBWC-compressed TP10, YUV 4:2:0 with three 10 bit samples packed in 32 bits.
  * Contains 4 planes in the following order -
  * (A) Y_Meta_Plane
  * (B) Y_UBWC_Plane

-- 
2.47.3

