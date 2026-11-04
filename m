Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815178;
	b=Var0z6IvUcLdxPoyX5kt7tkL/XH8b+xBgG99kxuCKJ5DpptbZ9mQgj18FQ0zZspge8nb
	 ovR3+roiiNP7oE73sTUeBH05ZuKZpzQRFZ9dhs1jtn4sEDgBaZhJ41nkTwa+M203ZDKWj
	 EXW7dRy9U19/tQZJYT3asCAQgDqgDHPeV7Nss6kLGfn09kQWu4jPG0FwkhlF9zJC4PZ0K
	 odjSXuYpx666a8ZjdIJoMoEqvroRXTHCqAwwP00N7kNbdG08ZRf+yPVmueO24ouuT9jom
	 OgriJML2apNCeK3ms899NfJO0FfthrA/M86LRCzJIvkGc8LPN6otoCGKT8RSBPxbjKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815178;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5+3sqVVx174xGzueQiCtrshPuIkjtTQfb0DeYdn+Lz4=;
	b=kKQlH9gMUHdWkjojwFV0QawpzjMRRFn0LfGC01fgIF15Do6Z/mIMkPST5evzYl0N9pns
	 D+tlTrk0XJBCRLWgANbxGMklw9kL2XzfmnyJWCwnxmlKpbDBs1dZVUqB8qJ+AiuGjs0xt
	 kU53l0Fp5CUVUQIxAkvQ4/1OpuqOXCbDhZdxADyOWTlauC9a2FSpqdiSWrqef1PodO301
	 OyW6r3UZe2ccbZ2uZ23gpY7xU2icNfJA96I7ANg33qKJ9veQt+e+LOD+EIyOUab9S3wwf
	 jtDbneeIZqvMKrKxh8xLR02P8gHGAt+YSCT6mAbAmBzMpOH7BSsKi53jemsHLd8AX6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="O/dpN8H0";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NIXzCZVy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C0D606B20C
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 17:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09C0D606B20C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O/dpN8H0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NIXzCZVy
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FjCU92828774
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 17:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5+3sqVVx174xGzueQiCtrshPuIkjtTQfb0D
	eYdn+Lz4=; b=O/dpN8H0mOaJJ89JyMkyasvH1NlbmWSGJAmQDqv7lxJtVs+9cAA
	ZiwoYESzNAWct31WZ24pRpLsMDtZ0aMOHx6ewaetEO3OHZIN/FQOIwEcfTRlrzy5
	6yC68MIstdSXTfeexIHSKXIsgXf60snG9gt/nwEzuga7PE+APECG1pyf8gAMzCdb
	iNxvjmJS0EfCvZWEqSX5mFVdiymmjYCc4DV/wDThEoMn/YEwa94BVy1XGZACHDue
	8n64dnPgHc2JL+g5rhF1kIYZQkpJ2LtFtN08PAAd6lthKQgQ/sPFgCXoIzQADPa0
	Y5CllG+qvNmzR3v9edHZF/6t0G3GUK/etwQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr284t1tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 17:59:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e8dd9b9743so11535745ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 09:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793815175; x=1794419975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5+3sqVVx174xGzueQiCtrshPuIkjtTQfb0DeYdn+Lz4=;
        b=NIXzCZVy/clI6W64yyFWyVvEfPU4GPu2cnCHmP9sdxLfXrUTjzFGkudT1tajFfqZey
         k00CPba2at1b1CdfDwR7B9l+wbBiwd/kw7iQGFpOkd76zcyVK/z/dGttCTyQ/pxqYNfd
         3gUZRuHHpR849LnIaAJoBe35aRec2cXaKH7DiO8MLj038yNNiB8+7M482EidJoZlwORL
         4UzGyM0ngy6xwyjoTC3W6IPUQz47SCT8bIrImtHZ0PR80yZX6hQql1XBMyVPRy95ygWT
         Uq6y2XanhdzURcdOOs1JY6/exs7V6XmhR8u/gcCMAf6MZ4LmRPRrugwIe5nXEK835td7
         7w8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815175; x=1794419975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5+3sqVVx174xGzueQiCtrshPuIkjtTQfb0DeYdn+Lz4=;
        b=lxbXL+kGv0Qsy+3xpUcc0Ei9dsY2OyUB6RcmLcrb/V4DQexv2IxTwQw04wn8fa702+
         qHa8U3piwW1XODjKXy2qWl+lqcHDgoLxftyjEXAhyhgcanKya74uBNi37hKjdjgsD+kG
         JRd+LV31ST0KQ2S8HZMTmQQg1cju4ZO2NX6+LkEoxrcbF6pMBS0RMxzMEiKLfX/OYhc/
         qev8C3VzI4onhJgshgA9k1fjC7La8bEiwyyT6IKjvvPiUh8DDKTqocKYBS4Bb/aL3Eg+
         la7PwlNx9ukSAVhAJ1aBHPd7msbKv2va3aYspKJlaeN75vX7VJF6kNCSO3MEd8s5996D
         ioVg==
X-Gm-Message-State: APuU4Z8jC2ZOw9eK37GBcsclFHjgKgGk+C1RSi0HI/wD0BwwEJOxUL/1
	mzZVMRPBxD+kM01OZp9Yj1OXdfInYmMixzOydML9Q6okf/MH6SyM5g6zd7xsyY6wYNo9caGBHpi
	nyGAgIjt0fywoC+bpJyMAX/5WRnFk9njSix3kSYgzVNvceWyY8TkEUjHPvhJlO9DjokJA
X-Gm-Gg: AYBFou1iv2QfkStycJeKOwHW8Jc9TEe0g1ySN688t3/wVJzrFZ+an1mOzCeTl5bWn2Z
	8ILSK+K0HtbLLm3jXXENocDr6s4jMp04kFcCGgItU0XVhOmGbcRiPR5Zhmiqlzs5c4d1q7GnF3O
	n9jtCQM0O5uBRhfOX/cGRkcXmiZLE7yZLNM++mNCV3UuYXZS28NyP4x//HTGxEAJxr3hjXZD1vK
	4hgY3s6N1bhbfdobYzmgBaE7n2A/jsdtoXYofYhoqq67N0WdZo5KMbKuM8sGBKomxzgYxTwR6T0
	+Zv83TjQarjw1KKkMBcv8/1DFIZcl7/EIF2kNTgXN0PzlWCrwwBCyT0yYleU5uW+EVzaQDQZbC4
	XLytbzMmmLFtaKDsfgXVYArgD9Vh9cKWyd8qG2rTPZ8FedKJ78MrymbA6kvexLaECNGUoJ3h839
	yScoPgkH8kKrzi5XM89IeS2AhbcM8nw52Viq3oik0g5cY1SSpzkIr84LdCjV0=
X-Received: by 2002:a17:90a:e7d2:b0:3ac:4e18:2390 with SMTP id 98e67ed59e1d1-3ae895743d0mr15100125a91.7.1793815175137;
        Wed, 04 Nov 2026 09:59:35 -0800 (PST)
X-Received: by 2002:a17:90a:e7d2:b0:3ac:4e18:2390 with SMTP id 98e67ed59e1d1-3ae895743d0mr15100096a91.7.1793815174616;
        Wed, 04 Nov 2026 09:59:34 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31cd6c0sm35077a91.13.2026.11.04.09.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:59:34 -0800 (PST)
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
Subject: [PATCH v5 0/6] drm/msm: Decouple IFPC disable and sysprof
Date: Wed,  4 Nov 2026 09:59:20 -0800
Message-ID: <20261104175931.28475-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=JdQpPkKV c=1 sm=1 tr=0 ts=6aeb7288 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pAKKPEBcNh-_eZAUbWwA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: jZqXkmyrLoD-k2Ri8ospzAj_L5MDYIHF
X-Proofpoint-GUID: jZqXkmyrLoD-k2Ri8ospzAj_L5MDYIHF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfX8RjFu6R+hi29
 TK3/mk4RtxY1NOxGt6VrM6/hjl24XiS2kh/9dFLmpApHhP1/gOkAXEXkdHj2VvFOO5JVPbz+zJn
 NsHP32/alf+aBSa6IGbesrhaFP32AMnHO3PS6okkv/zosFehq5YFOd4FdXltdbujmIcnNOTdAT+
 BVQGzr11KVEOEAqUzrDRVPk8vFMMsmnS97+Pcu/8smc7IeVY3eYfwL292YJAO3Zyd6IDJIxdFwX
 qEtJLUnlyl8RcnxfJXTFSujVVHEqFE17X3t6002uvBKcwUGVe4A+Z5ryR5ZEXtb7X9Xi0gy8VH9
 DESmDxMNfBVLlSynClxZ68WbycnEj2qQm0O7WLFL0U69wKEuU6w+JFWnjvD+XdnzXUJY7aQBx1T
 y8Q8FZDva+29h7h5ZGDPfrwJVPKb48SN/S9R5lnbAk0W3OaVj1qJdyqTpzwy2mizVs99b4No956
 fyWeNQ4uAB/USHd3mwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfX43UTC7cLzNcu
 V1tw8pVAviSDlTaa5IEklACsWJp43dktCju9EvEUb9d8jRgR48qZyqZQIo+UTEMrT2H3aM+/Sft
 kkYd4SNFAn3SLygSXlTMc69vK9qAoto=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040071

Convert IFPC-disable into it's own refcnt so that multiple threads can
request IFPC to be disabled without stomping on each other.

Extracted out of gen8 GPU state capture series[1], as other than fixing
a missing IFPC disable in debugfs state capture path, it is unrelated.

[1] https://patchwork.freedesktop.org/series/176505/

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

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 28 ++++++++-----------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 11 ++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |  2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c      |  5 ++--
 drivers/gpu/drm/msm/adreno/adreno_device.c |  5 +---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  1 -
 drivers/gpu/drm/msm/msm_debugfs.c          | 32 +++++++++-------------
 drivers/gpu/drm/msm/msm_drv.c              |  2 +-
 drivers/gpu/drm/msm/msm_gpu.c              |  5 +++-
 drivers/gpu/drm/msm/msm_gpu.h              | 30 +++++++++++++++++---
 drivers/gpu/drm/msm/msm_perfcntr.c         | 16 ++++++-----
 drivers/gpu/drm/msm/msm_submitqueue.c      | 19 +++++++++----
 12 files changed, 87 insertions(+), 69 deletions(-)

-- 
2.56.0

