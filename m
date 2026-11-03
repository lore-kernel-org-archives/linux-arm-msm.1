Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731652;
	b=wjV/xk73GV0pUXjkk7HSjniD5guVszh6PrhFll9VZTsNgunEK56R/W5CqkjedwG38uq6
	 cehYIp7ZW8vVUifoaYpaurJVFNk+U0WhSZzcgi+w8hlFSQwRuJ/e/ESVaTavcyWLfBAkh
	 dM/cnrYjj659snKiCxmf/Ul1ftmRCkuMgHGSHGbedl8sRtav6/2AN0L6mwBN3miDEDK8B
	 mVVe1ws4KYSRlJLsW/d9sFCgMsSTjHG1uzzhAe8bYLHs7p+xQYVB9uq/AvXNXn24Zbmmv
	 DphmpU/DREgwyATfkVM43FulBwOZnT0F9/2FnjGPnUeSJnHYuHJdCZo36gyMGKNfb4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731652;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DAZJuTvAB1Yu8kSVtfgthhDvd6V0vylumBnuvWXr9TI=;
	b=mQGJhcZxJeRWsWAhaevYXlQ6u5U8JwBuQzbnJDuSOTeAgzfM1NbwhdKqAPVlI2trLQD5
	 129WKImeVW4GyRT7KJP+PUzTpetS5GvvgFH/zMyFco/G4XlwXhHa0k4KgiAosoj6e9NrT
	 9sg4WG+1+QEgALgbbCOSBrBttGiOv2jMuE2hUE5I/gCpaxVpDu60LyuBpwigmPsnqQMgT
	 Fqf6vphC/U1ukYHoLqzee+1qvNUSK0sYg/qAROpLgWxzH4Do6x5Cq04ebHXmGEFj6nrps
	 Km8x9cfzkJNlhA73rhzHa4wJVEVF4GUrAOH04SihK8QpR9Chz+2FVu0FwjBka9AvfqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cs9l87vu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZknTAng0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B545606A329
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 18:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B545606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cs9l87vu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZknTAng0
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IZV3i086844
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 18:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DAZJuTvAB1Yu8kSVtfgthhDvd6V0vylumBn
	uvWXr9TI=; b=Cs9l87vuTkVvXKfErCXerHgC2IEiwf9KS52H5bytsUWb1nIYeiO
	8R5gWcf9aiG2Mups64cNpuDlIMYznsKj4X23Mexik38GsLJlZprq8BIrp+SKrAlN
	PvVeaw4dMGvv4EePRj2A9B647jR2lUJrkDvoUfGSggQ4VwoZorI4D64RcysvcOLd
	BMRZ738q2vRZWisPF4CCIAUyTfwGk8YKMPtiZA5tAOWHqE5wb8ssr1v3zVWx8gH0
	6Yjb1RMpwFpRhOjX58cr2sjV5GaXX1KUzwp/fCFjL6FEvs64NCjip1PL2SB7bdoP
	rwZ9VyLmdMo8H6Em6LKpTGCrJ2H4MWveSGg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m9bwn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 18:47:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adc5b185bfso4759719a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 10:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793731649; x=1794336449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DAZJuTvAB1Yu8kSVtfgthhDvd6V0vylumBnuvWXr9TI=;
        b=ZknTAng0kTRZRP7PvXua5u6IbEskliyvhnLkzoM7/HRwKe+pYhRjE2Ss+WlKJAK30z
         OI1BFfZBfmocCtE+3q05CxKwiUp6+T7kC0+D/nltjNNo8NoQCxvHqeRechcPipleU9nS
         EFOT5NuDlckeN/3A4Eecbk9Mmi344rX4HbKu9LXx4rHK7DVq11vpYwKY2Ro2hXvDTQlj
         5ipYuHeX3aC4KCI6asQZbi0fpHpfDBy6WiY/S9JNY+Vy/rIt8J/LcJeACAB0VngwyqjM
         1A0yRmlpGqrJl2fkYitnRm9DgTC2vVlAJTtm3j0Lad+dMaGxbaxd2MZDQBptmtPkcBab
         PIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731649; x=1794336449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DAZJuTvAB1Yu8kSVtfgthhDvd6V0vylumBnuvWXr9TI=;
        b=Ezp32ABhPko8gibLiD1RkoMnuu8gwT1Hcc6GmmjmCJ6E1j4Npab+hDNvkDZBVODwBK
         0lM2Y2hy4KpmV3Co1nAnUI4rXety6wmPYxrAcMyXXmDeeVDUJ6qmXw9h0bVC1fJk1Ex6
         3vhuJCfPBFZPaQb/8l9EOfwPGvA+rKBM8IB4GTC+raQcxuw9rtS8hE/D+yd5MMoSg+GP
         hWRy4iW/Bd7lWglzXE0/1cVBLXucPEIcAxdQ2tV097BNrqFahYAm7Ua5T8lWNj14iFA3
         1OzlP5CKs18c5uVw8DCVlNPPVlwf3GILH1SKEpjw3plUab9FwvqpLMKiCU8SzYHZVBLm
         6tlw==
X-Gm-Message-State: APuU4Z9lL0t2wSGtk3t8bhDnIW1gcy6hq3/ajebaqrwG2DTmr8kVpOc/
	DXZSIpZCkEv3HS/kJ1HjnakPQYmw8T++T+7MycN6hEC6K6gy9jwwDrK8Spxvd5fpBtEQdD22DHj
	By0S+F50C9gAD3tQZ545H3rIEnzRlmWr74A96kykHFUdHTrhcYLf6F0Cb1o6knisTypLl
X-Gm-Gg: AYBFou2UyX1vnaJZqOjpTrp+VGnvPQ4W1pZ8FgPhpvPXkqmEWFv89fEHV6i292M1Rv6
	2UGNeAPCW54+1rF1Q9GC5+XCZgAt4oC0SiajMkzSF+alpYokIgwYNKWspQ7zIpagoOckL0KUMb9
	BjM2LWtlqr8RRAFAI2WDs0i2Y8xw1A6wRHj3Xm6/jhSQqx1X/ox1unK6e8B8tQ9DvNUuNeLtrYB
	VHs8odIYps8I4RbzWVLPsnlgXmr0YmrI8gAOpl4+MZI9vHCSu42JhBs2i6MaXcGqLzbUliYFYWU
	rc+7fPz+AAbD9KmxZfe8cYY4Dmi0JmOlCQi6pjIcNHJEV8K1Nk/nD5J2PKONG3gIDlB71dTfKNn
	Qhz8nOatY4T168N4LojHzVC/gOcRpb+RpryRMHxmTJoysFIlZFMLLJ3BV3y92fIVH18gqTecb5E
	nr6+thKHLIoZ272IkVzDypRGaKAKA5HNnGGKAVhfg4MZZJglzVrJEnK261pwg=
X-Received: by 2002:a17:90b:5868:b0:3ac:945c:7f69 with SMTP id 98e67ed59e1d1-3ae8980a25bmr12072910a91.66.1793731649194;
        Tue, 03 Nov 2026 10:47:29 -0800 (PST)
X-Received: by 2002:a17:90b:5868:b0:3ac:945c:7f69 with SMTP id 98e67ed59e1d1-3ae8980a25bmr12072722a91.66.1793731643317;
        Tue, 03 Nov 2026 10:47:23 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c2ab1cdsm5704537a91.0.2026.11.03.10.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:47:20 -0800 (PST)
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
Subject: [PATCH v3 0/4] drm/msm: Decouple IFPC disable and sysprof
Date: Tue,  3 Nov 2026 10:47:06 -0800
Message-ID: <20261103184713.29664-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: lQUKIsDM0tRCgFs_vv8Z_yEG3TDqTkI2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA3NCBTYWx0ZWRfX5ssfNIdTSHaS
 3B7Q1aFEe6BQshNyl1tgb2Dcdq9uUtH91M3PyQ0Zx0S8me5Q7rqHOvA+yQqGDrH53HKyPmxHM24
 Xac2vMeNXl3Kt3qVUeEunoTYMrKT4KI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA3NCBTYWx0ZWRfX9eOmFkCuNG5f
 lau0lUNBapYHMle2oZguXwsKim1AHOOFARpq1HoMzOGop/c9uBHmppuu4wJAYk+oD4yjP9KbTUH
 Vu1ZGpR1qz0E4qhRAerYx19riIDAKCjvFq7X3P2HdncRJVXhIYHJ/Mcfa8k9s4LG8dCHU+wJqJr
 uUxwS3AGIk6LAFYy0AVbtVEoxkpz9HpTwJbGYUfnLxm8SVmonrq/WS3YYaKTWXuG2ZPSCRVTFnJ
 iFLTYdzQBsy2LVRYjaWt/OLJRMKLZ0coxna6UhktLreKxgpFVLq4KjvatCndn89/UfhEjKtdvTm
 0HFlj+zWsI7YXxWi/OoVs8aQvRNze8RvcUJ2aWSnMy2ts0iCcmts9dQgMUm9cnoUhntJjB8yyQu
 8UIJ4P4HWjujahsGGMyplun8lgyGiRGdoxCuNJFq/fnRHBee/nc/AXUCCDcBK/5WOv1UB1A9Jom
 aA0y1Xnhu5WdDjBye4g==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6aea2c42 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WAnUiRRfp7J0bigzDMEA:9
 a=rl5im9kqc5Lf4LNbBjHf:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: lQUKIsDM0tRCgFs_vv8Z_yEG3TDqTkI2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030074

Convert IFPC-disable into it's own refcnt so that multiple threads can
request IFPC to be disabled without stomping on each other.

Extracted out of gen8 GPU state capture series[1], as other than fixing
a missing IFPC disable in debugfs state capture path, it is unrelated.

[1] https://patchwork.freedesktop.org/series/176505/

v3:
- Rework IFPC disable harder to play nicer with hw_init().  If we
  need_hw_init, simply update gmu->status mask and let hw_init()
  restore the OOB request in a sequence that won't anger the fw.
- Link to v2: https://lore.kernel.org/all/20261102190010.720443-1-robin.clark@oss.qualcomm.com/

v2:
- Fix double acquire of gmu->lock
- Fix missing a8xx hw_init() path
- Link to v1: https://lore.kernel.org/all/20261101174631.23637-1-robin.clark@oss.qualcomm.com/

Rob Clark (4):
  drm/msm: Rework IFPC disable
  drm/msm: Add cleanup help for disabling IFPC
  drm/msm/debugfs: Use cleanup.h for gpu state dump
  drm/msm: Inhibit IFPC for state snapshot

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 34 ++++++++++++++-------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 ++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c |  5 ++--
 drivers/gpu/drm/msm/msm_debugfs.c     | 31 ++++++++++--------------
 drivers/gpu/drm/msm/msm_gpu.c         |  1 +
 drivers/gpu/drm/msm/msm_gpu.h         | 30 +++++++++++++++++++----
 drivers/gpu/drm/msm/msm_perfcntr.c    |  7 +-----
 drivers/gpu/drm/msm/msm_submitqueue.c | 10 ++++----
 9 files changed, 73 insertions(+), 58 deletions(-)

-- 
2.56.0

