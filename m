Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB21D330B07
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321332; cv=none; b=pb2p+NabRg8vjSUvClxecZqmqcud0vJZmTIYYc4U8QMOWIjAk7HdUl4PEuw0xdpuc3J/v0/dfVrnROfU/GuEDdMCHDESt7pFIDznCtgWrDp4Xi9GX6jgXnlo9k1eoHpTrgaZ4FRvZnbx1o76slJAP8UQRYV0nHJE+Z9QuJEZqJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321332; c=relaxed/simple;
	bh=k+FVZhmfVLeLL4sqJi2MC5wtUw0KJrJWpqfgNO+JoSI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NqWyMFzwEZ7U5meWa+H8ZKgvyb4AJUlzFiiWJpqoh+7LAPpQ6CG8nYEimL4dILbwqqNASRoDrIIcC6uqPAiqllnIRWlTSFfxo6fKoqli2AH0zyMh3/cPBv9M9OIzbmVF5CkUdCGAHpRmOfkP2JoPBoazbW/j/0VkxUlD4UckmMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZ3dny3g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sj7hEdt9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZ3dny3g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sj7hEdt9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtIQV2597508
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mLxHuejfrhgCMW6u/ETcstVIOqaiD87qppN
	P8Q3+2oI=; b=MZ3dny3gRGUt0GMCkKwlZxJ24ZgKjWKB98Nu00j44aFiHbGHaS8
	2Y4JDXLnfUmb+cCWc5RjSmmXa5YFsFwPrDxzzpaxugMwZiHBcn50BhtuVi6n7F6V
	WDNJ/AYwuq/Tyt5HBmubdUZiEIln1QHD3Bmok9XU4qgirMU3l0/KcmOiG8qyEBay
	quwBLUkmVHjWOf7IXsUckNEHraU1mvcx88Xsrzu3wNEuA74HsDu8B62PuVT1paLg
	aQ9599Zvv01VFGsaLoGHt1rvin53mpuCoC5X15gNK9wJmT92nxUGPpxV288Odjuc
	O6Yqf2WC/nZxarUZAKtwoWX5q6fvoOFlZlg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffrp8rsdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:48:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848544a8496so5726371b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784321329; x=1784926129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mLxHuejfrhgCMW6u/ETcstVIOqaiD87qppNP8Q3+2oI=;
        b=Sj7hEdt9REFTm4SfubEuWTxNjqm8ibKe22j+NSvHnf6a6+J7fviYlcA4FHRO1EQA7z
         uLEfruaI+vBJfFuEzsz+pRFtSGKSDyIdi0wpvmDAvuFTkgt4VYOubamFdtyI47JnS96c
         0FlJUzIXzYTxY+DOuDfpEsLdPgfIDHiRI5KcJWfl8Dju0iFB/6GlRYFw/F4hCE5RUHIi
         VQ6k3J7Tk8StJYfcL/n5Hpl1Q4i82Bt9mlcC+XbrXuYj85z2u8p3vhn9jmf6O9ovdhVh
         2Thv3rp01dgfXXAC7pTxZUdrXS+GUehOXxzX80t2rgszYShV7J9j5doNRFS9+AypTW8+
         Av9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784321329; x=1784926129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mLxHuejfrhgCMW6u/ETcstVIOqaiD87qppNP8Q3+2oI=;
        b=MA10yebTsbHzxDUdcHRDLPZwULJs1D7qzUiCwtqMkgqLLzwG/UeNzZR3fbgA194f5M
         gm76Ask4iX5yf253bEbSoShmNOSDO5EbWj6NhIvcDVxnJK3haOTnenqVP3QujdFjQZLg
         r505gDttBecsTTsWwnw1KBFnOpk4moMFTqxLjIFvHmRQ1DQ1nuO3ZHWMf4b5Kbz58foS
         dbpJ25aKYzpkgXvybTbf+edm77E3kzAZMlP0HFIh2heQ0tDUa7c0ebxnGQ7CdNmsCbaQ
         +YcTlHEJDo2D38Veh1Alv71rohSTTsDK2bwJ/A/bwSxe9vDATdDNV3mWqD5JkbXmaOoB
         J9VQ==
X-Gm-Message-State: AOJu0YyvV+gqzCF+gX7QMEjEGx42o+SWdiMlqaV3ekdBSZkx1Io9VLsK
	+vgmJkx9vA0LKg4O35WQ5kgBryt0rPyW2OnwMMQZmNNe84rXA+QowbFEXQyB/DOBwsdtcwoAzKW
	rsU1OHlsGhF0OFqFdEWHMNcBgPHu8Ss9FEvchbUujD+cKhos9x0FIFNQWKX/nErq57eNr
X-Gm-Gg: AfdE7cnA40WHOv3MKhae1K46IY0uGQ8sq57f1YZnNElRKVilPNSyjl1E6zEE+jQ2kA5
	/u2OoZW8CR9FUGRCNFIgJNjD0Sbio9bbkXt5xlkvCd3a+Gb0nsP2FtuTf8WECPu35aiRMtkIN1l
	u3Gvyd7GYibDWbGY36xOJJLYBNnUNXVLoRPKGudnve22OHl3fB1zeCFkLX3KXMPkWe7XUTIBpwQ
	juXSuT2RSvCCGhs6qa2kwk+J2Gl+a1SkpkjTOpSuhW71R9lCPCRqrud+ZJclgaYHaLd8a3abemd
	+4XcKtcecDgfBMgZuyNRv5kWq1Z7qpXVWvvCy1TWyESouTY0NozypI/7HkTM0GSmdnpG1pAtqfs
	cjhZrR4EcGIms6pLsxj6JE2rt0uEVQxCGAz2C6lEh37OPrRc=
X-Received: by 2002:a05:6a00:28c5:b0:848:2f74:1d5b with SMTP id d2e1a72fcca58-84c2954b45bmr4560139b3a.65.1784321329395;
        Fri, 17 Jul 2026 13:48:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:28c5:b0:848:2f74:1d5b with SMTP id d2e1a72fcca58-84c2954b45bmr4560116b3a.65.1784321328898;
        Fri, 17 Jul 2026 13:48:48 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adc3571sm1727254b3a.14.2026.07.17.13.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:48:47 -0700 (PDT)
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
Subject: [PATCH v6 00/16] drm/msm: A couple lazy-vm fixes
Date: Fri, 17 Jul 2026 13:48:16 -0700
Message-ID: <20260717204841.26120-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfXzEpjw3SaDdYg
 B1cq2/rETrX6qaQ7Zp4w7GF6sYDBLk9/TXd0Lv9FBc5PlyzVQzD/sLfOm3h6zYN4pfCyGgD5KU5
 9cfWizfAl9tvBOP51HZmtkRJ8u/X46M=
X-Proofpoint-ORIG-GUID: CUd4sEx9smjb68I5MYMnRXKZj3Z2e9-Z
X-Proofpoint-GUID: CUd4sEx9smjb68I5MYMnRXKZj3Z2e9-Z
X-Authority-Analysis: v=2.4 cv=fMYJG5ae c=1 sm=1 tr=0 ts=6a5a9532 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=bzYy7Z1X7KArDtV8Qg8A:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX/HfNR3xffoKK
 5OC5Qv/mVP3BmXui/nUNxOtOXGibzGoiY3kdpQW+tfKosg1yCVJ1VbrC9mO1cdYiUz5K4xNHpz1
 QZmfiwboLCYjMT13jf+qvHQrW4M/vqNztqZ2ezZPeNVOg/tMdalHiEh+oVMZ/153pK4SNtzhnsS
 gwVTnC3H28A0Q5tmm7NPboDquvoJftLnpYHeThfDvmK1hdHajyW9Fi2MZCIEZXHqBOwH65XFu4J
 azhEWZ00wlw38CBsBdQiAJy6bfKGIqWW10Tku+pKtmgIR9WIqh3UnsPQiYxM2ra6iDjpuIcePep
 JGoQPdAljBVVdJO28tylkWLLfikzZ7vm5Pt3OGrCFprJl6NBncWfSBXOutJLp8aVEKPQ11Duvq6
 Qac6VRqUTeCc4YMoeXSsTymY2ZN3xkGgVazIPRxKFkJMlE7dEQPKvvMMbdz/zHpPlZ4a2gb61yx
 c6g1o8rk/aDSskkUBvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170214

The VM is created lazily to give userspace a chance to opt-in to
VM_BIND.  But Sashiko noticed a couple paths that were not handling
this properly.  Or at least that is how this series started out.

Rob Clark (16):
  drm/msm: Fix barriers accessing ctx vm
  drm/msm: Rework queuelock
  drm/msm: Synchronize VM creation on ctxlock
  drm/msm: Synchronize set_sysprof on ctxlock
  drm/msm: Move nr_cmds initialization
  drm/msm: Remove redundant SIZE_MAX check
  drm/msm/a6xx: Access VM directly in submit path
  drm/msm: Add helper to check for per-process pgtables VM
  drm/msm/gem: Remove useless locking in GEM import
  drm/msm/gem: Extract bookkeeping init helper
  drm/msm/gem: Set resv before exposing obj
  drm/msm/gem: Validate lazy VM in GEM_NEW
  drm/msm: Allow lazy VM creation to fail
  drm/msm: Don't fallback to shared VM for VM_BIND
  drm/msm: Fix per-process-pgtables check
  drm/msm: Fixup invalid overflow check

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 17 ++++--
 drivers/gpu/drm/msm/msm_drv.c           | 26 ++++++---
 drivers/gpu/drm/msm/msm_fb.c            |  4 +-
 drivers/gpu/drm/msm/msm_gem.c           | 73 +++++++++++++------------
 drivers/gpu/drm/msm/msm_gem.h           |  2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c    | 31 +++++------
 drivers/gpu/drm/msm/msm_gem_vma.c       | 12 ++--
 drivers/gpu/drm/msm/msm_gpu.c           |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h           |  4 +-
 drivers/gpu/drm/msm/msm_submitqueue.c   | 24 ++++----
 12 files changed, 109 insertions(+), 90 deletions(-)

-- 
2.55.0

