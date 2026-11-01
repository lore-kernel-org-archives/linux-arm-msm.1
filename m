Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793555361;
	b=GMQ9pYIKOLMGCDkaXIY9c6DsUxCQqNegFJr5UlGc2AT7mb2SLZ/udqZ0zdMd52+Z6/D+
	 sJE3vTV89yiuIcjrQLJ5w4a83207VTq55cvZJkq32K+0PmF0Rz14Nov+hE63X8ySuNcxk
	 BX5ezv+oUwLBEHI43eWlTOHoFTQND2sxzpGONk+WQptAr8z3aVMei1NkJi+8TT+2+YSLW
	 vUoXhSJzYjoUp87bUOPpBPWmkPlFKYWgXLKoYqrQdYEPYAikKv56wLjISJuSCpdtMM5nR
	 KVctGRsR8eQuVIc4f0BjXMU9jJoqRVbh2l45/C5YEFrUdV+s3RoxzN5RIVfyjgTnO9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793555361;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eRBBLyXgoGNjOAAFhgT9ln3GRWnTRQ+4p63Ap4PYjlo=;
	b=YPbkRxS2xyuhLTpO4m8hOT25m/TycwOhVHdeXQSHQSwdcz5n/EJGYuxdpHPBMR7Vg+VL
	 0Ptf5oYhRjrO1Mn6WTc79Ad5YAdXWbQd4u5Sbecnz2doIK7YH2tpdXVMEUzAfsHpai1Xp
	 k5tAcewWfUFi0fujomtBUw+AcyG9ThvrhfkmgO+4Do+2W3spJ5ozPq0waszGw24jeJ8pR
	 D4os54AOcgAtWKIG0pyYeMZXxCR0ud9ubxjNCRKlzWO/xkwF0cNpF7t82OGjlY2NTyzOc
	 qTXmI4I5qlyR0KOqdKMgpHVXSfwKHhy2fCFQfsPSbC40o5KfgEsk3+9VYHWLTgpW9EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WlaZpbf6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XU3o+lCq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DE3606A326
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 17:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1DE3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WlaZpbf6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XU3o+lCq
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQLhF1413764
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 17:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eRBBLyXgoGNjOAAFhgT9ln3GRWnTRQ+4p63
	Ap4PYjlo=; b=WlaZpbf6sr3Qw7oY+kmmDcq4qX9PRr85c2F3YM1ihxFYiqvnNgE
	vS9x9eIeOogeRzMeuAIXCTJppwmxoGPrtmPsWITWiz9U8GY7JiPsJAVN4S0/bo45
	ZwugHRhdaR+fLT1wW40qR0Nz65W+E7riGeuGqG+uPDrwBtLPRzRlYK4IUVVau0OP
	IKfjWM9ot9vCGvyPMSno7GC+Qv475egI5DJM5/YwUnTrlGvPrPEV7+Wms0lhqchK
	NaDq9aEd2mgIGYvXOrG/YIWAzzA8lT2oSO4kSIKhjagvtuLgIhu55bPy1xa9q2iZ
	VTsybV5vOoTMx4fe0IPCiQs3XNmNMmAH5mQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8j2uvtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 17:49:19 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdaf2a74482so1195566a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 09:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793555359; x=1794160159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eRBBLyXgoGNjOAAFhgT9ln3GRWnTRQ+4p63Ap4PYjlo=;
        b=XU3o+lCqGmg2lvlKM7jKPmPh5T5qajOv9MYEFVixe56artC20+Kx4NDY2t+ERG5frO
         CJyuRtITa6TZ+BttHZAEeoxxf15Y0lUQ3dIFQGB9x+JynfO94vNxbgwbeAZYcDbK7OZL
         pD0bnq2gBLCNzPOyxohifPkI7IcOdFg8jJXfH9ykkDF8IxZiv05D0sAV2GzVHjXVvke1
         tROLkOLoWTLTw4/MQZshKpY2vIpRHEs/Usbwhctwic9JKLFNYWQI9i4GrT5Mml6JBG7P
         PzUgqs33B5LwkPsgb0ofmp24E/gyq5KzajpCZyDfDmCO+HFuODIKEnyzXlZfSc5ZETk2
         8bjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793555359; x=1794160159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eRBBLyXgoGNjOAAFhgT9ln3GRWnTRQ+4p63Ap4PYjlo=;
        b=T0sUh+DKtXhIbJb+mKPLvP//LQMRAE+P4qGIFOxnkcD8oz1s8psauSeVQVU3EcfKYe
         hVCWWD63GBhMAdHf9Puc1ohyWPTrx7XHppry7vibN+A1IE4gy8iIdoQEsYjowJZrd9Er
         y9dnegH+68dm2v/4/jO5fJXRsnlRxBKvDHMsUQw5tiF/jAvt/7umkmiCakMTbhyDZDQA
         LkJ7PKigD4TdwWVdDT2FBEnVhRdZRKKBhA8VCWyVm0vfcPw2SrMIzXFX8AGGcoFLOAfi
         9gFx0Zux1hsvTrcSUjNjMuhOCalTBx+ofgD1U5q6ZKjQpP6eEb8oFncrgddL+I6ass2h
         hkRA==
X-Gm-Message-State: APuU4Z8KbTspc59w+uSDY85LACdj6ySExsl3xnTxNPCo8ks21dpRdbKc
	OgJq1xOnSD3T6clNCx9FoQuMFkTWu6AEMAGbWn7H563csavM1CQ+VfynEidQmyu89AaAwTEIN9l
	alzy1oOxjn2nzEwOxKlOFS8kdxohPZcNiHftx4E/wyhWfiziZ6DzIH9HyWYy9BSp4ez2+
X-Gm-Gg: AYBFou3ZllawaY5PdKVrbCBRa5JyMHHsZD2pUx/x88qp1BSkt9WaD6niIaudFrn308r
	SMOdiFn2LIAxRhp9AzdFuMUwWAqmk3Ye1jtWlHvgEtqJpoKYX4N38uukArxzKGDF/9qqG7ST9fO
	zdSI2LRj4MQjbwne44fc/uvDRKBPeZ6W1Zjga04QP8C7IatG/yar60jpFCbtv1STTZS4RkGYi5z
	0+RDoFU36cuymaRygvmjaZN7klUpJHww6kZ9v4+G7gutYU0wHbhyIA30J24lnAdmIcDSxiZJidN
	fKp7eveFtcgCXVWGae16CObqRSQg84l4yG3eijRSBIqSuIwbUFFQGto+3CxfeE2z3GdOXnihcWH
	xrsEcvPTZ6tC3soGUS792nD2fG8SYR2EnaB8ydyE+G2qNbQ6MRZPpH7eDgboriB6XcVNxYuWzlN
	H4Aj1wSp5KO31g68bb/kNrEX0=
X-Received: by 2002:a17:90a:fc4b:b0:3ab:b64:5893 with SMTP id 98e67ed59e1d1-3ae8981bf35mr5877676a91.53.1793555359267;
        Sun, 01 Nov 2026 09:49:19 -0800 (PST)
X-Received: by 2002:a17:90a:fc4b:b0:3ab:b64:5893 with SMTP id 98e67ed59e1d1-3ae8981bf35mr5877667a91.53.1793555358863;
        Sun, 01 Nov 2026 09:49:18 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7d5b8csm15640105a91.1.2026.11.01.09.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:49:18 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/2] drm/msm/gem: A couple VM_BIND fixes
Date: Sun,  1 Nov 2026 09:49:08 -0800
Message-ID: <20261101174911.25184-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
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
X-Proofpoint-GUID: PIF2vhzj-yP_g-9EeKIOcXyaEVLnEvHC
X-Proofpoint-ORIG-GUID: PIF2vhzj-yP_g-9EeKIOcXyaEVLnEvHC
X-Authority-Analysis: v=2.4 cv=S5RMU4sP c=1 sm=1 tr=0 ts=6ae77b9f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=Q19NxXnSNVhgB1yMlDAA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfX+2fwpQ2dYYw1
 OSd4/SqBQx+7UJJ0fAO92sJ4ndhnQTKZgdd8sqKMG+8dn+bDgXDDRBlWyW219SIufY2E1t2VARh
 jZO54xrhA+Cz7BTglhSKAvj+9NJeBvk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfX3ZRlnkIN+ic0
 fMOGj1Fnhia1COq1PGCFgFjkD+2R4mqEc3RkGI5Yay5jBcAz6aSl7t6UCzYbc7rrdq44uoR+VQb
 bT2VkwnjNqIrXjuV/D2zfjJckvcJum88MJdSnU2+ZvSAMfKFgLuxTQ1zbnUIzIYO/zjAs1UQrys
 RmT+PkBlEiD9kQdHdvLUc1OuEb7R/bPKKQDZpIqrRviHpgp+ITPB6om++YmT7cFR09u1pc2TXQb
 jOsY8MoY5r/5Z6RiGFvM3FPdNWkfI4m9otVkY+DuF9ykAht3E26LPcCz4RHt+eaS/WUjWPWy22V
 8q5YnMIMs6dgWINMSIpQAZvq2Q3fCcBxSQwVDB/6H6L+V/3ArThbFKqDY0Cb98gUcrMIvC+uJc3
 AqRP1m8kObl2v3ds7IFU6tqxiDaVLGzyfXYRbZL9HI3le3E/peLoOU+ynynz6++rExF5FVoKHqT
 xWr/4BPIzmiv6m55SAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010070

Fix possible overflow in range check, and disallow passing BOs table to
GEM_SUBMIT for VM_BIND contexts.

Rob Clark (2):
  drm/msm/gem: Fix VM_BIND range check
  drm/msm/gem: Disallow nr_bos for VM_BIND contexts

 drivers/gpu/drm/msm/msm_gem_submit.c | 5 ++++-
 drivers/gpu/drm/msm/msm_gem_vma.c    | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.56.0

