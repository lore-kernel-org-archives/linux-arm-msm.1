Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896925;
	b=RpMvXxCa1kipGPOrABvOV1PH6NpusWXFptLPcfxLHFIGUeVXgz5DLD7l4P/L8SLEG3Xj
	 P5VaQEyQNqpWjfMyxALwMJYOcLgbYh2I0D07VQdn8/oGfYOlEE8pfFZZmI0zrsCJHqfR8
	 S7HRyAXwuZdPtgPuOOaNjSgqC4aTR6EPA6FP1YtkR7Ci0LL/kKrmC/nTIRSvPvv5+CmE7
	 thYjqKJUbMO/kseoX15YJ++djYF014nXTi4KAv5eQKZzrYkIL1ctB1kwGFS+eaVUfbDnq
	 2UWJtrMmxoiob8bsIZ+xEnHvKzOHMYfowhWQ2HM/oUMgAboPKmViHLH6jf72pu9kXTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896925;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EOiK2c3+ca2/ATYQiSDG5q7j808nXXZYs1ut1t1o3Es=;
	b=MlS8oIgY0cxPWhBPSbI9xpnD3M3JasrsNYykeawN8WpakVPZeoIbJQM8pFyRabAM54AF
	 0Rfzo78rOBU1Is1rSmnWMsFRI2SjH5C7VRB07s2Gyt/HGSHFOb+n9i0Ru3ujRpFddCxdh
	 mvdctwsKYfWTBQEiTNXt1FSdRA66vGnzXaH95WVYkoxCn7MWp5hISG6SVJe29b9jigm5W
	 qh+q6aMn5bHw/5wwv/ltaGXCIm0gFdoPzroSO1A/Zzwbkpmm6OgQ+Y/Hm+7Gk/bLdnZlA
	 Q9aWyRh9wpB+p0ZDAbH3RYYuHdLtARO3ATYblL3hsaELGujQQf3syF023KCBxfezmeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fY6CD2cp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FTliDODv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC03C606D816
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 16:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC03C606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fY6CD2cp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FTliDODv
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQaUC095793
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 16:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EOiK2c3+ca2/ATYQiSDG5q7j808nXXZYs1u
	t1t1o3Es=; b=fY6CD2cpRUe3o5DFfiF8JjFZ293O6h0KEfLnEC6mWvBxUvbKsCh
	g34slsQRdJi73Eg1GEeeVRlrLd3jNH6b0f6/2qRewN8gidc/PA1odwjCNp33Q9cG
	x9MECehBjoRGcjZhRhCO8pN6KpSns5TPCakUM5jFR/3hJACXxzJfi3FeC+i6UaFP
	v+idi/WjjBdO/zzwWf8vjKA1hpb66i3DMBQ/q7HxWBXaqMTE3PNrdRY2L8nPlOQL
	+ug/9rYwMR1sXYESgdyiSbWJz7Yto+A3WLrVE9EtQ41apI9ylns0vGGEp02QSDqb
	bVI/PR74/VTYVpscF5e1R2eAdFSJ/zCpMoA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrj43k5gk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 16:42:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd6532dbd7bso1376435a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793896923; x=1794501723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EOiK2c3+ca2/ATYQiSDG5q7j808nXXZYs1ut1t1o3Es=;
        b=FTliDODvKOiGhCrSqw/b0xTyPQCrWr8ouhVIZfNP/A5z9xN4IuVpG52Ie8O0ti4Yj/
         t5pCz65XsEdqES4Ih+hWiUyDOpdF3grd8iDpA/YnUyvTwB1xtCVkPFVJYOtaWv/fsxAR
         C4y0R4+5cMv3rt/WBqn/GkjnPV8bBNcXkRbJnJBp2+GsBDbF5YmLyYl+RcJubV6tb/wf
         J0MGhOO4DmCLWkxv46P7z2cjwTzeOjhcdWB6TOYhd7fmeL9AnMnIS9fbw1oqL0Z5YqJ/
         Dy8Qxw8jHoDIBI4YiODzGFKMmtcdH09DvxDomfHpoqwbSLKIB48dyoZggjWO45N2X+ZY
         Ux3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896923; x=1794501723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOiK2c3+ca2/ATYQiSDG5q7j808nXXZYs1ut1t1o3Es=;
        b=RzeAxQHg/YD+kmHMGct13pugrPj/9tRAdcWB118Mg4w8PGz/v2jvtsCSbPmnJF7Nxn
         9tKj2p+WTQyuaj+NC4WY+q+ppBBPpt1Lp6nl+8v7sfs2kXBstH9rNorWA1lVo0s+QJop
         FyKRcJ++lju23ZHj2gzO82rJA6KSyMnzeCr9H2AnWdIqJ3oHcVffBDXpgPWhHUBGGejX
         WwPSY1spIhc4YBt7atdVmIR/79u+MbM1i9AY+2QaW+q3wwOvIcLZtstWUKCypv7wm43W
         cY+p6cCI26dTTrQXQOWUvD/9SvsqeW9x84vjqf9ot0GMxnE428YRV0+21nikG1/Vt07/
         rzAw==
X-Gm-Message-State: APuU4Z9T65UcmRzj63iDFBrc2s6XnalZYsex7fYfhXOqc7tIY9GtOk7j
	3pZXpvAKf+MhjuzeNaU/psix0vbl1DRCIVFFiNJi0NGhJdUaGB0v/SjzcWNLzUrfsxe3l6DD6GS
	+dymLLbuqofjGH3xyazgpj5YgQDBskRoGCuiwpv2HUI7jH2PVEicFnGLNkXapix7RpmKn
X-Gm-Gg: AYBFou2ByowuKDm2kIB5DkuXTjfOKrTGPIQMz13ga5+7dgIYBvDSoqcNfW4TFdrIfA7
	RX1Jhfn2sHHCE2hvIiamwOLvv4g7+o+Mz8NXPd5FYLRMUu8fK2w2n4A/69EAi6KegvnOWRIEnF4
	TZBPE7BKzovXBlZoeeiALG+616PAQyaXIfB/4LMmI8il+HaXDdRCrXPUw1GmTJl46kviDC+gTtL
	ATr9WrEZ0sjKUQFUPW3NDa1IVqMuD9VhE1LHVyVd+vCzE8aZVqbiCNTnhzBE42LUPusdrKaFSRq
	99rmN0thkr5XOSPE9WRzD28y0iAHyLj2xIQ7g88lGrdcrG8GyejgvfbZW4suwnyMiZf8B+ls0Ed
	n1RTKl2PP+lJLksW9WXDv1ml03nh1xqWNWcPAyNhcGLmEIjA0HRcCvyvGzzQu2khQ2YFm/0HwyS
	LFg2UnduBu6hVxDpDbGC6wFJUXHYnD4IVDVSdCtglEArV/iyTzm1od26BSTtc9
X-Received: by 2002:a17:903:18b:b0:2e8:93b5:c555 with SMTP id d9443c01a7336-2ed40e29864mr1399225ad.61.1793896923055;
        Thu, 05 Nov 2026 08:42:03 -0800 (PST)
X-Received: by 2002:a17:903:18b:b0:2e8:93b5:c555 with SMTP id d9443c01a7336-2ed40e29864mr1399005ad.61.1793896922543;
        Thu, 05 Nov 2026 08:42:02 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed0f24d9dcsm19326435ad.65.2026.11.05.08.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:42:02 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v6 0/6] drm/msm: Decouple IFPC disable and sysprof
Date: Thu,  5 Nov 2026 08:41:47 -0800
Message-ID: <20261105164158.23263-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: MHuA6YgRo-n-tQ_376xVOevAURku-qle
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2NiBTYWx0ZWRfX1uxBrHAVdXSb
 XBTSj9LkdP6jXhmGvMXhfCgdVca2lF74pRsXnxoA9elailXJxlOQRJSpH7ABHOj7VPrxttkUw2x
 Pw29DUDzs7K7WjklDkcnco3uuOaMSv0wxyvIlu4lltqOHLJHt2QubEaefSBTmJTyLpuvjJ9b/Sw
 sIMjxnOniaUEtTBVcm0HrST/6lwPSW3iG/jceSpTiLjI04kwsEv0Fh8q/KQdfozv5YAkRCkM5sx
 Z6B8KYupEXnYpjPmld59yYCHwi6iyv6dDxnyLHdDNH9g1dfYNymBrDLb+dFu/CzOtPxWmoGYP2/
 86Sry2xHtCuRBGmAWvRPETeDtu9rK0Iv2g5yHnxYJbJMqYoTldfkfKdzNdWG8hpw5TTxVC3sHgq
 TqSmOzjMVmnzOfIRM3iXKAvYDI7RRd2smVVVS/9Nizq1J/88aV0H2egxUzBF419DBcP9z5goNns
 VVRJBItNK886za6zwrQ==
X-Proofpoint-GUID: MHuA6YgRo-n-tQ_376xVOevAURku-qle
X-Authority-Analysis: v=2.4 cv=SZdi5fRu c=1 sm=1 tr=0 ts=6aecb1db cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pAKKPEBcNh-_eZAUbWwA:9
 a=x9snwWr2DeNwDh03kgHS:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2NiBTYWx0ZWRfX8aaEC5iSrP4S
 QX9HrmrC5fIC7i7YChh4qj02eUlb7WJ3RS5PUOumRpl39BLskNfTGWkYaDHNoHjri3qxU/kekCt
 bg6VBGWk8SbNwIKz+1RWA7H4Vml59vU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050066

Convert IFPC-disable into it's own refcnt so that multiple threads can
request IFPC to be disabled without stomping on each other.

Extracted out of gen8 GPU state capture series[1], as other than fixing
a missing IFPC disable in debugfs state capture path, it is unrelated.

[1] https://patchwork.freedesktop.org/series/176505/

v6:
- Fix potential runpm ref leak in sel_worker()
- Acquire gpu->lock before runpm
- Fix unmatched OOB clear in a6xx_gmu_shutdown()
- Link to v5: https://lore.kernel.org/all/20261104175931.28475-1-robin.clark@oss.qualcomm.com/

v5:
- Skip unneeded msm_context_set_sysprof() call in msm_postclose()
- Fix potential sel_worker deadlock
- Revert back to original gpu-lock/runpm ordering
- Link to v4: https://lore.kernel.org/all/20261103231850.17493-1-robin.clark@oss.qualcomm.com/

v4:
- Don't clear GMU_STATUS_OOB_PERF_SET in suspend path.  Restore it in
  hw_init()
- Don't require gpu->lock in a6xx_gmu_ifpc_update(), but instead warn
  if needs_hw_init
- Move perfcntr resume to after hw_init()
- Link to v3: https://lore.kernel.org/all/20261103184713.29664-1-robin.clark@oss.qualcomm.com

v3:
- Rework IFPC disable harder to play nicer with hw_init().  If we
  need_hw_init, simply update gmu->status mask and let hw_init()
  restore the OOB request in a sequence that won't anger the fw.
- Link to v2: https://lore.kernel.org/all/20261102190010.720443-1-robin.clark@oss.qualcomm.com/

v2:
- Fix double acquire of gmu->lock
- Fix missing a8xx hw_init() path
- Link to v1: https://lore.kernel.org/all/20261101174631.23637-1-robin.clark@oss.qualcomm.com/


Rob Clark (6):
  drm/msm: Hold runpm ref in set_sysprof()
  drm/msm: Resume perfcntrs after hw_init
  drm/msm: Rework IFPC disable
  drm/msm: Add cleanup help for disabling IFPC
  drm/msm/debugfs: Use cleanup.h for gpu state dump
  drm/msm: Inhibit IFPC for state snapshot

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 27 +++++++----------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  9 +++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |  2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c      |  3 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c |  5 +---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  1 -
 drivers/gpu/drm/msm/msm_debugfs.c          | 32 +++++++++-----------
 drivers/gpu/drm/msm/msm_drv.c              |  2 +-
 drivers/gpu/drm/msm/msm_gpu.c              |  5 +++-
 drivers/gpu/drm/msm/msm_gpu.h              | 34 ++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_perfcntr.c         | 17 ++++++-----
 drivers/gpu/drm/msm/msm_submitqueue.c      | 20 +++++++++----
 12 files changed, 94 insertions(+), 63 deletions(-)

-- 
2.56.0

