Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEE84A0EF6
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 13:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791551978; cv=none; b=H8+mNrRQElFIjEjSCTeqaSnyfmgdtwqzwg4CisJ90popDS0pB/lzvBdBNo24qgArcXhpNnLwI3SzbesUTEmUBwOKhe9zbwvOOQ4xp0T9TdNfW4q5g6lsDXDPR+p3udsgxJmzbp4D2koy4mpnB0S6OeurYRvVkm1AmVh+DjTjtXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791551978; c=relaxed/simple;
	bh=ken2V734ytFIdMT+0jjPVabtti4Q3v2Nyz4KGbup+5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lOn0f3Q16VaBTTCVND8ijeWoVCDgEuPj8e/nLZsFC4KHQMygQPYL/TJd48UXei08wBZ1qufA5G+Y/t9PWjDzt38rMqIZcp8OYsRh+hpgvGfsjEf1TohqG6dflgkOYNPKUQuadNUKMYV4+Kw4bMxRB8oUg1M1LcaZgwoJx3atuiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2I0w3MU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NHp/ovMb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2I0w3MU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NHp/ovMb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DBqET419109
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 13:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=W4UJ+4ics4oOYunJeOoO5yAh6ndPjCZP8h7
	AuddGqC4=; b=Q2I0w3MUoI1F/rcbahHtwVXf54sFuoZfhSgIlfEm78sLKRnrFHO
	IKDDGaJuMerPRnVVD0Q0Y4lw8qsnAYY/YWiQhu40AZLJ0CPoqjXF+DWZNeletpBM
	htDDiyvAsNaHfJC+9C1chg9XzcWd7hF7AAGFXvpuTisC6Eo4wlIw7d34pNiHjBZP
	12Lli7FsZLbHuMWzcRKmXca2ogfpH9RtbWyAifel2GaGlG1V9UOgu0fvkt2eyGM+
	3wHbnpIcNwc1wS/aB8nG01iEsRaauhipc2O0Nl1NKfUdHW76JABR6jRVZBVb7fCl
	m8MJvSbPjj/DuaZCzknOdmSS3hI9bIRy6ZQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ev5c1pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 13:19:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfc52ddc55so66267095ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 06:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791551976; x=1792156776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W4UJ+4ics4oOYunJeOoO5yAh6ndPjCZP8h7AuddGqC4=;
        b=NHp/ovMbJ2pibLT0edcbUbPYAzSwsctXXX9Iq9nUb+Kf0WVcXi7Te+RZV7ZjKu8mac
         yn7xRb0pU4LXe1DcADgrD2QVj4z83GLQsqQ6+1Zn4vV4CKAMfq6a3t+7jhxMIO8JNOSh
         dLlhXZOOnfV/cRGjtPwkAXxRozV6tdRDTi+6wDcL+D5ExG/T9BDdM+sJo8vcyj12yKVW
         L9iNy5LsG4ox/F56Ew6oCx/bkaVHY6601b64yIipyulZlHHTcsdCi1qElPnh5sWImjtP
         wLiLWUDzWWV0Ux1QS015oYCQonCdsxCLnpIzz+gKCi5DOPVWgEyo6UdhXjsS7UW8th/N
         NneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791551976; x=1792156776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W4UJ+4ics4oOYunJeOoO5yAh6ndPjCZP8h7AuddGqC4=;
        b=n4J519Uj1z++JMV7u0AfFBrBdE6Lcz6YPcOS2HVGpwPFMoWIiSCgYatOw2bvM+Yqrt
         UGsbZUZVn1n5lsPfL3H8Oxs/lz2tAG+n2Kn3DlgNs6IpXT3Vm+V3aGYjul1rOLl3ri9U
         Kj0ZTbYiSGHPBuJ5mc/ZXV3/lmpG5GkrA+IFmGzeiRD08/ery4sXlSqrWdaVC7tcONJR
         f+VM+8r45/aBYyx0XDDsF+YNoX1UojhYDbmoIncTIBWeqCXJZWIjCTabo4E19JeMU3dt
         Ea1XMsfKl2QmaGtvr/YTnOlfn91cnICW/6F78HJmTdZc6an6VhZyb1RertRBVtciffKK
         8a8g==
X-Gm-Message-State: AFq9FYJ00bZBqgax8Je/3k8rXHDIlSglnnhVv7NIf5FOiKCHVmB8SfnG
	yMO2ng5YpA0t3zcbzqpZGC/uZPHpItf7f+oTU30fxb8MtOFuk7H/QMBUBu2DKW8IYqnC4Md32OH
	MKDd8J6lgqqu9wuXnUiuw/1G9s+wvExMO/MHlBeIV9RE+lVDytyGi7J16Ig81gcQXRFeUaxtnkp
	6Y
X-Gm-Gg: AYBFou0hN6yCHViolZ4Pooj6I54YuvpjDqW75X65g5yYC/5kO7/Cwc9HbDD1WYAvDg6
	HhmUYwEN0QDkaai44gFb+SXrHZdOws1YRpNgfNCbRQKftg9yucDAiDp0uaRv877WzyzdoJcFDjo
	/SI0aYx+oQG+RU+pWttKv1eTjVtZrL1ackmj5UJDJsPqwei4UcVCEby47AZEaY3SupYOR/ANcKZ
	mqmsasHJ9QtsQ1mv9R1ZGLVjODmYT2mBcPRwUIKg22jKH0RyExqvyg5i6FQp49Nf01dNAoXgVw8
	9+2uRiz2zKXRpQ1+rubNkp4Jhuw0maN54B/DIp9K4B3nUepmOWCdI4pPnrZYpMW3yeGYsjXYOep
	OAamYXUbvxTh3aDkbzHS7EAMstpWB+7+GtbB6issp7P52RQ==
X-Received: by 2002:a17:903:41c1:b0:2e5:33a5:36ec with SMTP id d9443c01a7336-2e84280af99mr16694745ad.4.1791551975762;
        Fri, 09 Oct 2026 06:19:35 -0700 (PDT)
X-Received: by 2002:a17:903:41c1:b0:2e5:33a5:36ec with SMTP id d9443c01a7336-2e84280af99mr16693755ad.4.1791551975238;
        Fri, 09 Oct 2026 06:19:35 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841a0002csm9095705ad.3.2026.10.09.06.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:19:34 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/2] drm/msm: Split a6xx/a7xx/a8xx device tables
Date: Fri,  9 Oct 2026 06:19:20 -0700
Message-ID: <20261009131927.551319-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX76p+O9cg+DXD
 Df1wD8guYvnK5zd5mGB5yTkP7GFKte8aFpNb2mUULHY9kQ9eZyVpcvlIknB6heFAALZ9hrwu85y
 m1YkdlTcpxmbWu7/LfVDv0C4FCIFw6Y=
X-Authority-Analysis: v=2.4 cv=MMT1C8Zl c=1 sm=1 tr=0 ts=6ac8e9e8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=jbNVri9b6eyAa_OJQsMA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: _d9nU0pVeo1iTiMhVfqlxDa8cwX5o5yo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX/adSqC/oB861
 4KJaCdfwcKFbIk7QpJHHz/3NNdjaA8UCrooFfgSFhLl6WkY2tK/7L8hXnkrMWSo/K+b2MvpnjKJ
 M7xCXygLbJUyAj3W8pxQGEM4q7PsTWgAgHWqHCEloHIqeqUWOvcjGcjuTietGltOyYI91/FCnVu
 4xkGALpdZtBZ/Cvl60LvirtUlceprhvoBiI7XyukC0ANiSB2JGBtyLIqhBP/zvzXokX5AOC18jP
 SOqtKeeagSjzuKtQ/MB3WxTToKsH4v9h9sX+kKrMGh19b/0uGPfuuAximu8rEdiWQhGZlvt2RMH
 FTIdk/CCmftbWdC4I5N1+aErrRlZdsTqWVa8f/LtYDnK/2wJubgf2Sjmb/L6RVQ4u0EXe5ZFYbo
 K79ooPrYlvas8cS2g+DWiavF/cIh+r3Te99yIXzghyjFCN3g7uBwmRDUOojICpEDcFOOAzlRb6G
 vmAnumcHGofev6RTu+g==
X-Proofpoint-ORIG-GUID: _d9nU0pVeo1iTiMhVfqlxDa8cwX5o5yo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090052

Prep work for a8xx GPU snapshot and related changes.

Rob Clark (2):
  drm/msm/a6xx: Move a702/a704 to a6xx list
  drm/msm/a6xx: Split out a7xx/a8xx device tables

 drivers/gpu/drm/msm/Makefile              |    2 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2433 +--------------------
 drivers/gpu/drm/msm/adreno/a7xx_catalog.c |  496 +++++
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 1847 ++++++++++++++++
 4 files changed, 2407 insertions(+), 2371 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/adreno/a7xx_catalog.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a8xx_catalog.c

-- 
2.55.0

