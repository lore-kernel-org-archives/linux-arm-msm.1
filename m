Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C821DDC35
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784886589; cv=none; b=fWTU3fM1kJQq5uy5+9BhdePCOI1HeKoZO45Z4U3evxewkMjYo0K712EArE1e9Uruy76OBB0PE4eDTRoi4F2KnB4b0RXHZwJUOCQoR48o8sFmVy8Mfnlps0VJKzqk2MJ6cHDB7f+OgYIbxgyhBxfNd8HudQg81Oub6nxyjogXpqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784886589; c=relaxed/simple;
	bh=POaelFIDn6xj5RIoIscrFg/uh3pUAy65qy2po2hcof8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KDBY9RDimz2hxzkgoQgvJWadttyue8l0JeH7kK0imsq1sGa39WWbiuHuhCwlX4y3s3zIDSkQr9nZwu/XYhtsuBqeZmd9BIwKPqegV8OYBKTh9f6sTCKWHx3vBgcyrWPIh/czBhpAZKfeU9n5yEIH+CoH78EKvTDH0sQDZr6SgKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PEEzJ/aB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cMu/FGUV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PEEzJ/aB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cMu/FGUV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O9T46W3786096
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PdbeThIiYwNz1S8OkDWHvQdXI4IzkKXtrJu
	9/wgaXVI=; b=PEEzJ/aB8/Q+EGzcxN4Dc30b8PszvIVBad8PkoRMXfLDEoZZapG
	XZuWXPB5gdoSMnnPdf7biXRb3epPyjqW8rPgjclAaw1W5MniiLTfAl7gl/J9//76
	C1pAeBBkbsgni6sE2y/v9Cw5uv2ErIe2xsZTJKxl8A+301w4D6Mu7gFqfdkRENCQ
	UBy8y51MNoUGcJyYFjdKoOkyguNxqUgldlebKoNBzM+Cmkmgc3/1jjIuifb0haWT
	ZEB6CdiN0Bf9GeuJA3evYKFIlOBYomW9++YTmh+51NN3C/8BBw05IX5Tk0AuTSuc
	A/k4A6sYV/PYxRxl/7RYj4QzG6TZx3U9ytA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5f682gr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:49:47 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso420345a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 02:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784886587; x=1785491387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PdbeThIiYwNz1S8OkDWHvQdXI4IzkKXtrJu9/wgaXVI=;
        b=cMu/FGUV2tE5NAmOZCFzNgmSDUfUmMuIehZqME/b7EGk3V2b+59a/TbPSqEwGSjUXe
         ICQ3+zB+Oj0SSC+q/TrXJ56UDOJDt7XApMFMAvFMjfoQNeq0cQABC4Wy7DrEWB/et4sU
         ihTEwr+DzC+WYrmKVbKGbPPvoijlAryfpjk9vz6gXmpu+/OS765A+CYUTThARg41C+UX
         LyI36N2LcNBI3VHiooClh8eHVUMKWhl1r4wPNMRbrhHnZ8806KMLXz9+53SQvQ1aSm9E
         Give0CalqX2s3qdX+elfbakQgBT/qNqvvL7Vw5BHENAhy/+xefYySCbXTImzIDsN6Kr5
         tUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784886587; x=1785491387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdbeThIiYwNz1S8OkDWHvQdXI4IzkKXtrJu9/wgaXVI=;
        b=cD+Yd6ClDb2V6rE1QNbDn2sFbDTwCo+5ro9Yzu9S2huoKhmxCqgjratxJoAI0aYkzB
         T0whKmSimMj3XVIPGLSbFRpOWNSXifDSWA6P3TJX0FLBCjG7jpB8mYJhHAAR6Qn3wNAs
         VmCrx8cjmOlbEVOmu1P8CgCavicbWfa5SNm+4SAJX8jMyCNpZclG02fscuoGTdPTyvwI
         oKUhsZHpKlFFmejLQA3dnoHNJu198DPChI9J+zZ0KN9eUspkMggAy3Dtryej6kzVN1Ux
         bNCahi0qFSfmA3gcwrPG45xrjJI6kRx4PxTlbRHkq9Bs1/OhGvrr89kaadGIC09KiqrZ
         0MDw==
X-Gm-Message-State: AOJu0YzGdBoiX66QuZuP53/R+Al0/4zcl0toTAJPCZ/uk+p8tSRVUWFt
	h5xU1wSm3v8Aj4Fn7dfKlWOABo39+94DpQACSmaTYO3YM/JMuB3VQ+iCV1SbD2yzyfaRs1MaZ+B
	ZPsuCII9DkaOkfVKWeqDRQaRVkJZrwka42s3e+yHdOSOj5taILFN7UHDJ0P5InYkJMUsy
X-Gm-Gg: AR+sD114IgCU02FwfErH6b/zQif5Ntjt6uR7Cp5su5HIdJp5CWWAOUZh4x6l3VW9S7T
	sPTs8+JWYGey2Akd7C28JQJeUd+ATpQJVZdW3faUb1NoHpFdkD8RDakb2V2gGp+aPXdwFv9o8H0
	l7mcijgch8MKAmzbdOJ/1OHKrWSrt+yNupVods5retWe+Nog58l9l0qCpW/eSsqz2ZfsAqhUGJE
	3dbUq5/8ey3Owh9580gs/JIslCxDzrH5cXmNAeNVa0JL4qu1rqd8uot2UYFv1heQy5h1KWSLghy
	HstqJKiOLMoPeUGnG7Vg4ItLyICFJotUI/A8mu/Cpia6ZaQv1kPKvkXNgcdKahLcCCRv4k4dxPt
	a/tbuwMxe4EID0jFJxjgwJBKVtEw=
X-Received: by 2002:a05:6a20:6a1c:b0:3c3:aabb:dba3 with SMTP id adf61e73a8af0-3c44b2c1e80mr7115862637.76.1784886586581;
        Fri, 24 Jul 2026 02:49:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a1c:b0:3c3:aabb:dba3 with SMTP id adf61e73a8af0-3c44b2c1e80mr7115839637.76.1784886586073;
        Fri, 24 Jul 2026 02:49:46 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a8a7csm3961013a12.24.2026.07.24.02.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:49:45 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 0/3] Misc. SCM driver fixes
Date: Fri, 24 Jul 2026 15:19:36 +0530
Message-ID: <20260724094939.613844-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA4OSBTYWx0ZWRfX2rzoi+OfoYA3
 IHLmj89FHJTB9nOwHjNUPMJdRzTXcnrj9ODdUO9QKB545EjYMHAnIjbo7FCBpnysEmgQpSsp38d
 JqKCJhgSB1P0CZ2HJ+i5gMkowpsXg6M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA4OSBTYWx0ZWRfXybcM0OH+AETP
 WkKS6WnMSNITE/3ZinRpZyssm7dIiEqDMk3fCx6ddUXcVGV5KuVhWDx4lthWh4kZPrPN7n3+x/6
 4VymLIgp0niilE9TCKI5r+3mI/L9K2IQM93TbS/gl8tQ9ECezYyY37Z8yXLJPN6tCl3h/Trynx2
 9M8/zgbi+67ILHWg6W1e1+p6oZTjpMYNtliW5//2Vesaqai0/NuSWAnb9sEqvcv9qALNN1nvFVZ
 /Et1R5SuBeuw4XgxtRzMZXRYb+Dv9WvudlVPEaGphdSQIi8JedH8y3qztFj/VnhrDh+2kvGO8C5
 X/Ohr+8b1RwcojeQWdo3nS0A2qaPMdzRy2Sn87HiO14og5aycCa17ZzFI7jjok3FanO3eb34y28
 Y63+bTy1VyTQkuaXBxbPSJm8BoUMV5zGEOn0EEnHdOw1iikij7HF6ATPntzfh46TIpcsEAmC4Dj
 Vy5kEjGth/fvh5Mo5Ww==
X-Proofpoint-GUID: blqs2fBr9hpxOUEbp52JsFdh8DIVivFV
X-Authority-Analysis: v=2.4 cv=BNeDalQG c=1 sm=1 tr=0 ts=6a63353b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qi0AG0XSDalV9LXtG3YA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: blqs2fBr9hpxOUEbp52JsFdh8DIVivFV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240089

Some of the existing issue reported by Sasiko mentioned here

https://lore.kernel.org/all/20260624192213.C82691F000E9@smtp.kernel.org/

https://lore.kernel.org/all/20260624192418.92B761F000E9@smtp.kernel.org/

and the series is about addressing them.


Changes in v4:
 - Rebased it on next-20260723

Changes in v3: https://lore.kernel.org/lkml/20260629141750.996853-1-mukesh.ojha@oss.qualcomm.com/
 - Added R-b tag.
 - Address review comment on ret = dev_err_probe(..);
 - will follow up devm_of_reserved_mem_device_init_by_idx()
    as a separate series.

Changes in v2: https://lore.kernel.org/lkml/20260625093644.3918184-1-mukesh.ojha@oss.qualcomm.com/
 - Separated the fixes(2/3, 3/3) as per review.
 - Added 1/3 as new patch.

Mukesh Ojha (3):
  firmware: qcom: scm: Fix NULL dereference in IRQ handler before __scm
    is published
  firmware: qcom: scm: Fix reserved memory cleanup on probe failure
  firmware: qcom: scm: Fix tzmem state on probe retry

 drivers/firmware/qcom/qcom_scm-smc.c |  2 +-
 drivers/firmware/qcom/qcom_scm.c     | 42 ++++++++++++++++------------
 drivers/firmware/qcom/qcom_scm.h     |  2 +-
 drivers/firmware/qcom/qcom_tzmem.c   | 13 ++++++---
 4 files changed, 35 insertions(+), 24 deletions(-)

-- 
2.53.0

