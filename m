Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792837826;
	b=282pI6tapG4HHN6Ltxb8z2ZvE3HErEjbi20rF4M5LR7OBmKihvIR9PWz8nt4bg7UD5hL
	 wmqf4ZITPcfebXkSwqcHntoZ80W0HuqZgxa0c8+60MXU7KX5cL9KjtFGkIzozz4q5b76k
	 HNtDFC26k1hs6xgCN9Hek/fm7UXT9LuU+/2+sNK0Xpeuy0nYdp/OJn9Y7WB87DAUJ+dq2
	 Hsiwpbh45U0CaKu8d2SmfSZgYxY9EknGShsZG7mFwPx7UclXegp2894ECfyorxOtw8kqu
	 769lG57tBgw3PkWbvj8huenEs88DniQnnseGrv5Bgo2HTF0khas5RjwYCIcM2ZHAJ5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792837826;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/wVlxKd4PkmwhXBNUJ7fMa3qr0NTWTnVoH3SdzxVHFs=;
	b=GMGGBt7eFVif4ikXMsVmJ4OiqVr6cD+2HZh9aHhl7MbyPOqOyE4XmPT6xcyXSfnjlASd
	 JLLYgwAphA26idoDWVTxzbqfjx+KC6kaExoXFZUdlxwxJOqZYjNbWD1WmAtveiRvMon9f
	 PzcBVnCAozw9Lexv9tSXWt2WBwamBs7D3Vm0NrShJx/f7D8pdx+9VNCIJ95qaK7Ydej2l
	 5ii1T1/LLC9gTgy18j7VW9pP95rmSH2wMNcv4ALjBltmtJLOmYJE4/zA8pTFwR+EJGXmY
	 HvU5bkCHCPM+K17gxGPn6VFNjDVL06IxvUDlqsis3S3yCSF9APiCTmAlqrionmsSiZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JR4Hm3zr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DzzHCrAO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12DA606A31B
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 10:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D12DA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JR4Hm3zr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DzzHCrAO
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8nx1w3827070
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 10:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/wVlxKd4PkmwhXBNUJ7fMa
	3qr0NTWTnVoH3SdzxVHFs=; b=JR4Hm3zrxlzl2KROHpnuo/Y+G+xQY+Rh91SDxh
	ON4UdTwTEdaqJo9iJhSEbsGUlpGIbY4BuOplsSdlaKfUjrBRDh/MsilEspyGibnn
	mxm/tnTSi9buCG6ZktCy/Bovfn6T69LLChKI/WW0N4xZSoVs4fsrvQGscgr7O4wC
	hz+Xz9p7GHUdM7xI/Dzyb4MKTPYdOwEdD9GrSF6y3vG9NUHCrF8meBfKP7g2m2uU
	4X5u41o4jum14bv0E5/llNPLeTVVoKPsdgWMGLSC0XO1YZqi2x433tWiTAgeyQRI
	xTsMeiItdEBRC1FOz9ru9KgfikouDDoiEV6FNMkAUCpqu/ww==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgnuk8kcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 10:30:24 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-18b5ee75447so6376313c88.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 03:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792837824; x=1793442624; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/wVlxKd4PkmwhXBNUJ7fMa3qr0NTWTnVoH3SdzxVHFs=;
        b=DzzHCrAO+wWJ9hl3A5fYeXoASNYXjYMfuiSYwyipIuX2XjjkWba5XHXufvad2eus9o
         6IKLtnCgbBddgkktNkNKKzYoNcs0Mgq9PMXRSYcSM08eFur9NOO7n/Fgj8uBxzP9VRrm
         6k/qJtNWqnNwB9bZx5qd0dfUfs4mre4PYTSd+Twp+p+RnH0P0DqStDSMoUv9nsuILfLt
         Zwaaqq5SDaqzdZcj1Re7UlnYDKZfv1xMLxE0sCZ07xWVOU1S0SxUcdbMA2gOthX940OD
         eSYQTgjZlejz//UT/2NN3r6AJxGyeSozWOJwTYIHCttcTPis8iZekjEaSsB7uXNs+Uzg
         eZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792837824; x=1793442624;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/wVlxKd4PkmwhXBNUJ7fMa3qr0NTWTnVoH3SdzxVHFs=;
        b=qql3jqNQdpkhrP7rE/ek+gMEYZHKMttzX8o3E3u7dz+phP5n/TxAttEIxX6n0oLPeU
         zJ+Thbqqr0HrhVNBBgNuswAYRi9LfBUtdpYQeZHCaO30TtXJFgYDtfkrijFjSx/BdRVw
         ZrDb0JrmSci4rV/xBfZIIeAAhBKTlhrWei7uk/x2+PQyD3CSYgImoA7xye+HUgyDyDye
         WIr2Z4pObjFNepHfnx5yXbACTkNFzv2MJXdX4KWptZud1N7x87n0Ef3onUHtEggHfiEh
         EN+qIsatQ2++xZ+sAigd9jzRa4UM6THTUirZE2RZl2LpGlONPuUu2lBjNhXvkBFq4rgu
         hVhw==
X-Gm-Message-State: AFq9FYIPCGWIts70Vln4FyDRn/IEx29v1ugIjQe2AUexAvAbSdhukRT2
	Wm3PC0f1ILOhZegGSVbWWRQ9kCnlviOXlc5GnRbDGEeMZKNpS2dU8Yfc85nU0whZPt1SoOEPzmi
	reAJJzHOM42OMnIdph4hV0h2Gp4LJUhJ51jk1h9EdDwCbme6eb3Ed/4zYMK0bXLWXzVHD
X-Gm-Gg: AYBFou0v5WcUWoWKmB/F37hLdcSgBP1m3YGdhO6DXrqit7cCoou3BHtMnRBxTv0WVDP
	isQOCOJ2d70XTBWLntqE94RDqERVpJwz7zv4W43L3vCOkRShh/OHxIP9sB/ecZEcu38V5A72lAo
	byEtN8pf31lHvmXHhVJyGwqGRab7zQj3QzMJZ/D69wdptVy+ohvKhV3662jz1+JgR5q/fooK7Zd
	IP2aeFbFy2R5Izmb3gx0vnoEjHXJRjRxogmewWlwgN1di/1a8FyKqj6O1f3onRxuQ/atNxwdFyS
	GXK9txPvD4KsNSC8y/yuthFnwHIXBMqxgZUE9/tmDIpHuIMuAfsa/JMSAhN9oKPcMYbAfA51s9w
	tIARlofuc3f1BcNl3GPGCaHA=
X-Received: by 2002:a05:7022:e806:b0:145:287:ce91 with SMTP id a92af1059eb24-19935625d41mr2734525c88.14.1792837823985;
        Sat, 24 Oct 2026 03:30:23 -0700 (PDT)
X-Received: by 2002:a05:7022:e806:b0:145:287:ce91 with SMTP id a92af1059eb24-19935625d41mr2734484c88.14.1792837823386;
        Sat, 24 Oct 2026 03:30:23 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d5a10csm6009441c88.1.2026.10.24.03.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:30:22 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 0/8] drm/msm: Assorted fixes - October
Date: Sat, 24 Oct 2026 16:00:06 +0530
Message-Id: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAK6I3GoC/y2MQQ6CMBREr9L8tT+h1YDlKoZFLYN2Qav9xZAQ7
 m4jLt9M3ttIkAOEerVRxidISLGCPinyTxcf4DBWJtOYVjfmwk4k5YKRp7BCOPnCerJXDWvRdh1
 V8ZXxO6t3Gw7OeC+1XY6R7k7APs1zKL2KWAv/+2ca9v0LYIEbl5UAAAA=
X-Change-ID: 20261024-assorted-fixes-oct-1f981e99e677
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <ltuikov89@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>, stable@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792837816; l=1607;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=DyAgCOzQ7jVke1cRXj/xTsJaF/hpi2aekJSSNzd4H64=;
 b=eu3K02JLEDdzVu5Op//bUgPkD+OTgh73R+Jfv3KQZyWrr6XdtUexLwemhR2MynagjAeyPluZt
 ymCt0lsJwx2AGx3D4eD5EXwFhu8lHy0I9Lhp7eUEkpOJtwiJhFqc9nI
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Z8Z5j3RA c=1 sm=1 tr=0 ts=6adc88c0 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=HoIANuw4g2egeWD1xvoA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: RhLe0lysXchirzQOa8kGhY_FHSubRmuq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA0MSBTYWx0ZWRfXwAvara1orLtk
 MnS2cnDoOBXvp+6wi3XO4Giwpk+fOiyOU2Fz6Au9Q23v6D9/b34+N4C4FdLnO5Z7wWybSZQb0o5
 d9/2sIRSJ1e82HIjRFAo52sq4c5ElsI3tt4+gTlxjo7jdIKKyI1vq294MfvdNRDZqDnmFBoytgL
 On93gU+k/8n+j7W5vPra8j5vqRyQERcrL4aVRBZEGJ7ufPM0npJnLuTXIl3n5IP+dym1biRtjEy
 6K8tpnm7MfS3yLi3LQLKyeYQAS6Vf3tfY753DALnYuZapcqLnYEVBhlNOUnq3ZJykYN+L0ep5h/
 U+kGPANvWixRE9UrrNb+azT3iJ5czA8g46gJvuz+J7N5lBqX+NRuuSp5SjE8KFGbqT7JaJUOjJm
 9cUfDOstGKECrCLP5jxNrTAr1X5CEninN5J0VedzxHvYwHnIZ3BZPZZF36rc7P0U1npG9sYabb5
 wOceA0Pneg1L9VDSdzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA0MSBTYWx0ZWRfX2QLKfsdOrAva
 Y4FTKGkAGQRbyzLZQGMtmVVIWn4uWyt4TUwdFei7zIeAzNOROLzPCBUevFnmI6IqMG0UBvEG3nZ
 hUJUp0O+5cwAk/kU9vRYKEXob96WFLs=
X-Proofpoint-GUID: RhLe0lysXchirzQOa8kGhY_FHSubRmuq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240041

Few assorted fixes for drm-msm driver lying in my stack.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Akhil P Oommen (4):
      drm/msm/a6xx: Check BX dependency vote index
      drm/msm/a6xx: Reset preemption records across suspend
      drm/msm/a6xx: Request CLX enable from secure world
      drm/msm/a8xx: Add AQE firmware to Adreno X2-90 GPU

Jie Zhang (4):
      drm/msm/a6xx: Fix GMU shutdown idle check
      drm/msm/a6xx: Fix stale boot up BW vote
      drm/msm/devfreq: Record idle_time at GPU idle onset
      drm/msm: Fix sched_prio inversion within a ring

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c             | 31 ++++++++++++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h             |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c             |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h             |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c             |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c         | 37 +++++++++++++----------
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c         |  1 +
 drivers/gpu/drm/msm/adreno/a8xx_preempt.c         | 11 +++++--
 drivers/gpu/drm/msm/msm_gpu.h                     | 24 ++++++---------
 drivers/gpu/drm/msm/msm_gpu_devfreq.c             |  3 +-
 drivers/gpu/drm/msm/msm_submitqueue.c             |  2 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  1 +
 12 files changed, 73 insertions(+), 43 deletions(-)
---
base-commit: 77cb3534193b758eaecd662a610a3a1bffde43ed
change-id: 20261024-assorted-fixes-oct-1f981e99e677

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

