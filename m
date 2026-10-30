Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395201;
	b=fxzSVTkaEiT3evzv1hepthfdMsJYw3fWfE0Sr0WBuJr+qNOecMpQ9kJVdno3lyfdx6Gj
	 pJaBLBk3u2UtPf4ZoRoVGQNw6O9WDfvK2hIoNt7vbttcbgG9TcT5VQf8uVHMlQas8K5Pl
	 a5C7cVpbqI0+pGqq3BE/RqGlcN2FEs8SzImThCPmol5rOJqQU1Kf2oc63pkuYYXjBOWpF
	 UYqt9t/MJYzfVabNj27gVVQUV7vWdIu4TCshfEIDxaz/82XxIfpcKUGopPfVlqCKXMN0L
	 oGGVSpeVIcEwsruJibvbm9KcrwnLj9Ci44wN+GwOVbR0zVderPnmrwLWAcV468BYlSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395201;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KTqlhnQMr2NCQesTIo4IGBobCa+G+VXCAaqS3tav790=;
	b=EULj/4XvZ7qDXEj1drZNn5xSm/TH8bZS734+XZ+M9iwXrWBhd/oLViw6OsMwBkZKoc3u
	 2M7y7ReD6L94poQtRQwkGpKnnnJftTb9JeaHx5Ve8wxX3X/CeB6BBGjQkS3X0RMLOMrgd
	 KgLMIj+xDkSJEJlymKNqQPpVaTyFhEjzbCDv/0S9Dkw6OpxOkrkzyH/UUKNzGFtIzADwt
	 G2Q7ZW6V1RVzRZOYgUGMycHS4ps13huCgcsfeNnpMPsy/Uf0Ve+Wulz3aENfQ/V+5kKZt
	 xofx1XzMsKKQ2yxO1sANv2UZ2072yh0bEfv8rnygJ4CfU0iAA6/ylMyndKxbSnImH/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5pJfXVM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X2OJf5mn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC54960A261F
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC54960A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5pJfXVM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X2OJf5mn
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULJeEd819319
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KTqlhnQMr2N
	CQesTIo4IGBobCa+G+VXCAaqS3tav790=; b=N5pJfXVM0HBJFm8p2G1mlZXXoO7
	Z8NRcrfRVVvd1os/tteLSOSeR5g3vpNeN9eBz5LNsBZBwvi9Ozn9xCt4fK4Rk2JP
	ZTT8o2qOdLLIHDj/j+33GTGyLOhQn0N5rXkfU8RWRmtipDDpqNtMu/tcEmbqBxWH
	oXkxNp4AvGFXDg/jyfolrVOyj9vl/rxQJfdnff79LNJQKJFHBJAFyKwO2U0nYQXm
	kicYBFbCdrenW5oTn6GRd+ITFoMPUaoPbfk3c3c860/TNsT+HTyn1mbZ7hBbaOf7
	OjMkcKCSvOVMUZkoQXB1S4+clhDyufwvm52yHRYgH16Gl/fGHzPJdIoELNQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x101a2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so1082284a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395199; x=1793999999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTqlhnQMr2NCQesTIo4IGBobCa+G+VXCAaqS3tav790=;
        b=X2OJf5mnGnmnlg8CA6kIkIgB0oHizsrekDTDQAqrURUgVMVeXiRmtUvcDRPbMOrEoA
         b+WzZEyMFT5RK99AWPy+ns7SOmX8rdWLVmbZc90D2jCpIhsky2nL87ELG25FtkKlRfQm
         IWfvJBO7FOWy+xcqduqMTfT9zUrwlKEDrudrV+TxA1qVKdQIH9rTuWDcCC/Q2vUlm0r9
         7K8Fz5S0QnePeti3GaWu+ad2LbPOFG5Hbn8P0UrO8zz0IajdcMGEF2HXCaDX9CmCSeU0
         k94PXMoJhsjINdp8KS9aLinoPI5J4uMQMRMxk7mSq3MBxrVj2QeDoN1D5N7Uq1XeD0Z/
         FnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395199; x=1793999999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KTqlhnQMr2NCQesTIo4IGBobCa+G+VXCAaqS3tav790=;
        b=wp/MqKtQEjYvW2GkcqKLWlwAUSwT/pIqa+QdVQ1EZ1d5Nta4HnP20ovOBHAuoOowno
         C173YmvHBUDIy4kUimKbpl+2nlVIPZmlYw9LbJgI1Lbq8qHK+RTsTiOxVwtFs4vAHtOY
         kuASqRaD1tQRc51aetlqSVcYW6hGpUSp7/9axBo0mE11j6J9GJxNXG8TTBPYzbfnoo7D
         f3Q6X3gyUBgzBzjPV3Mwpvr5+VXnNnQXq0Dut+gX3J29q0Q02rQ1sfVGuf/Lmrs4rQX6
         6MQj+B5OPtuo7Gc5gdX1LxHulKD29xjIxurNNDeEyexZp8vNCp/msDQ+0lSK2iMbtktR
         HV/Q==
X-Gm-Message-State: AFq9FYL6PbfNCxusHnvYOslNhxUZfOL9Ce6TqFi0+IYiT3WIUJVQnEyk
	W+i1KkHLrd/Wni6u9QmklUuBkDtRmWrgBsu7+zDF8Hw+vjLF36og/smuWB6NEPVTQIaWYtHZDDS
	7PWmwlipDpelm0D/22WlhY/XJx2/CYYJta+PmoY7Otyil11mbBCaWzugdVXTNVS6s/1u4
X-Gm-Gg: AYBFou070sT1rucaaV1IPonx/Bh83i5V5eADhMnvwx/7zfLETi5M6Fqx4mWsP9qmt0Y
	FVlFfNG1UoQYD6cRLq7v47rXlvqMklMPNK7fNjsbs2L6Ts93LbsDsNkbxaHJ4yEqZcG+QP4N9Am
	FQSe/wfpjLKwa6+ULKGirMDhwnBiUK4/up2aXCREhJe1PZh6co+//PSwLstL9eMR5pho8hufEPm
	QdYXWb/I/mAwLTighbAv49l0BaZPuSdd2zo5kQyg3+Zzb3Pzp0OLpf7pgEvVsd3uHpAv08FIZtC
	EUMk0pA581ktid2hiLToTGdPSTMYPReQUSqEXi6NbQl4cmlgutKPCG3sW5DXBvWtNa2S95S3fm/
	NNUEkHlBhMy+XxZROAz8FWIdZu7slQ2DzYmN69VIBfYqwnAgt31Bb4FBiruwda4n5wGSfIE9HRf
	VhcdESS4kIbNgvigTukli2IQ==
X-Received: by 2002:a17:90b:5111:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3ae89772eaemr2722433a91.34.1793395198900;
        Fri, 30 Oct 2026 14:19:58 -0700 (PDT)
X-Received: by 2002:a17:90b:5111:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3ae89772eaemr2722416a91.34.1793395198373;
        Fri, 30 Oct 2026 14:19:58 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8805ebc8sm2580145a91.3.2026.10.30.14.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:19:57 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 13/19] drm/msm/adreno: add temporary __maybe_unused
Date: Fri, 30 Oct 2026 14:18:15 -0700
Message-ID: <20261030211928.45761-14-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
References: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX1Qq7JSHamyom
 uiDV2ndMbNLl8ShEZ3bSBoCGwF5juCOEcaheLUscz3nlyVGeL5YQw1sSnhvK6+DyX5Pkrj0rkNA
 n9HLwVOsCygOzhNUbFcD/n7bu3kYSOoMkz5kML4Kkr2VqiXmdGrVum1ts1BEFzgsknBfr9oY4Z9
 JT/vIFbX4HwkdLCCkjMXsaL2MTt8BDKERUkBi3/H7TgtJ6UxEHQogCmiRyc9aJImkq2UoFn0sBW
 /9RT0PTuCMeHNZ7xZd4eoK+5/MPL1MnUsnyFsTkRaO90PeXqhv7Knp/Vq7kXYGDjPzJLANJclGt
 LpGFm5rGapNDbd7AN/n/OKIbWk9CtVQ7KnRyvhFF66sP5ixhr6M1dLFNJu0mP6xdmoeYnll6CzV
 dfcoSrPgwkpXzsRSsv+VVIlnG1Xiag==
X-Authority-Analysis: v=2.4 cv=CLG/zhrD c=1 sm=1 tr=0 ts=6ae509ff cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=SI4bJWXHUBEfUJKjJlYA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX4GEoNSm+02ve
 2EyPYpBI53JPHjeAvKFyvw7Cz6EJvmXm/UMhEBTVk2bUdZb6opexMdrzm1xabz/M7Rs+eGsG3IS
 6M0kSY22vTeFlBmHq+KgigMpZTyP6Dg=
X-Proofpoint-GUID: H8EMcj0OaCBHpecXX0AD6NRTc9DQ4CmU
X-Proofpoint-ORIG-GUID: H8EMcj0OaCBHpecXX0AD6NRTc9DQ4CmU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2610300085

To keep this series bisectable.  This will be removed once there maybe-
unused protect tables are gone.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 6d6e4c7cf919..c43efb85fde7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -168,7 +168,7 @@ struct adreno_protect {
 };
 
 #define DECLARE_ADRENO_PROTECT(name, __count_max)	\
-static const struct adreno_protect name = {		\
+static const struct adreno_protect name __maybe_unused = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 	.count_max = __count_max,			\
-- 
2.56.0

