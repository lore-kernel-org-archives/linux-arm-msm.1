Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795806651;
	b=MysbbPy5sp2+72+Iid9ACdcISfgTmBwt542wMJlNXP9UkUJbgXcwjhLp13qTHWNZ3LHi
	 ew71VqUQZsdDYXrJxfifXIQSdRijQsEV7NCp3ULyJ6T2QmbPEULtXJCRoa970CKGoZsOH
	 cPoIGK3oYZucI9PsWNsIgxvv69ouGC0Oe6qB/SwSgfJBDcS+QBYVOpXan3qNRt1owpLBZ
	 PYxF7vKGAkpYnzuy4PP9xOG1AvLcjBji7vIgxcBrS7WfPkv4i4SXTPqtqLZ/ucd94Q/Ed
	 xeXsAfzPV3z7GgqO6rLS9fmV4F3STkuKd8Gt2vf0QFC2A4xJZM2zMAnXQqoke00W/uw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795806651;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qUJKQY+6chdkwpLeZq8BndlS+hMFSdfQnsQ2JazMNJ8=;
	b=iY7u26p0Tz0hbstsroPf9YnGBvi1h1HfZK9D+w+1fG7gkhlXTBfx1RiffoWpIH0zQnEi
	 asd5aI4n3C8+2dIQC7HSNjXjxDhDcb8gUnKpHvkfzNtZdebP2VSSa02x9ovaYh2kyrmBY
	 SshKfbjMEaDT/9rP2kDQlvvVkUskNoOgGEsppBQarDVABMDB79VED5SaybWgsF/AapTWj
	 OHkp257AFNgyMl+JU5+RcAQvz44ABzK1/ZaDvUCjYruxYHt5UNEdzUYw4oTEVbkvAKs5u
	 gNihx6fGiqgD+144s+zn25HTU/dCsaVC+gGHsOeBHdp3A/BpbMOFDFW2JUQaT2P3DwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eCvRqXDb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DIntB5uP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98409606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98409606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eCvRqXDb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DIntB5uP
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpGS02032584
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:reply-to
	:subject:to; s=qcppdkim1; bh=qUJKQY+6chdkwpLeZq8BndlS+hMFSdfQnsQ
	2JazMNJ8=; b=eCvRqXDbIa3DKZBgk8oFuNz0VcpsB2ggJihA1wNBhB/S9c8C/aw
	ZB/08H4o2ShRZakLs7qc+Dfm3yi+We3BUHd/F0e+9iWl3qjK8dmBnXJi7ccxiKO/
	9zrIYIlQmSjcbwvmNFKjp7YJrRcp1TCSdrCbifdxu6gwppBYIhecZNRfkjnFmkJc
	I75yj5TtaR84S5v3Pq15gzsaJA70t9cQ40exEALvggGXUXAo/f+2VuQqLB+ds7gq
	IJkJ/oLx0HDN8/8KlJNmR5Ax0820DOyBTXEgk+k5UHi1HriTZYBRUICdzudJBviA
	jCHyoVOpwjLgl8aOpUT4AKLpgMGp0oDyZ8A==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru3bt8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:10:49 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-46509ab0149so6277847fac.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:10:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795806648; cv=none;
        d=google.com; s=arc-20260327;
        b=gagL247lksaYPPRzliv/cUPJa6jJ/MCkHvjb/IXBeNL8k4ffYMn866+WN2VStQM2gE
         /are+uFYn8BTH7pwqPeV9rEmeBJ45kypK/+p4jamUduYFICztGG1f5394XshMNmArM5y
         xWpjoivUKd5eszX/V3tDf4/QwhfZHLv0Q7rBn1f2LWXHKkyGS2CwQUevq0kC1TlyNEAe
         c4MHjqFRiqfI2k1sRndY4LIvrq/RF57UDmms0+5+bleNxeHmUKhiOKDWfCO3MyqACvO8
         2pA1PbikoVeiDPxn6fHxV8Xxb7D2QRzVJqMfTcry4mZbLPsEchCjPrp+rEbhetuJ6p0z
         40NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=qUJKQY+6chdkwpLeZq8BndlS+hMFSdfQnsQ2JazMNJ8=;
        fh=3s6LjUL/tLG6/F8WcolfERaP3TzGpn79fE7mu9AFuDo=;
        b=rCV5U9MIJ7nDRq9aVlKzI2rnXrC98v+o0Ma1oqLQ8n/xnTyL/KiYsj1YXAXMHeZdX5
         Nd1aLEpNxvIW65sEZEf+XbJVWOKlLX+fww1UA2OiZXNby8FhXDMBQwSDR4UYjWF47OSi
         S5kikij0kwFeYoR02Sl7ievc6o0ZkpsDkwQ4VQ27gftdBfhH99XXIZYwwdocEb0o2E4v
         Di+I0SGO14DsDPGX57e2G2B7T9a+uLYQzLL8cOx8j+hXzrOOLTy3ga8sJ/p2jFuudHc5
         otVJV6Xm+PM5a5aAk6w5vWJTQevjW60rs0k+CQaiobV97enxholyMw9fPu4kD0VPiL8x
         730w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795806648; x=1796411448; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qUJKQY+6chdkwpLeZq8BndlS+hMFSdfQnsQ2JazMNJ8=;
        b=DIntB5uP471BnRvvjkReF1dfWGcg7z0pqq9LaR8amAuKscao9SJkt11Z+DwwI5odCQ
         pbaz5mWmXD2Ss5v4i94nX3mXs5E7VRDamjvTKqmld6dN+xJk0eNqDOLW4jZfzJMwxivV
         v3e+kszPhHPgJhjcxFCgxs6BEvuxMnGyb6bUAxhvnsLs7AtX9VTtrt0CJuZRFJUqnzpO
         8tN0qjqqPu0VzstqsZenxifyU0CW5MfuG8lv2vChSyTqEStsunEdAlPjMWsI+OYXUUrc
         brWzHM43h7mQV6zfVLkyOiGHMHUCNsbmUWcGUejYQWvfUBkzrJ9EsXo4UqcbfGS6+F5z
         ijtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795806648; x=1796411448;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qUJKQY+6chdkwpLeZq8BndlS+hMFSdfQnsQ2JazMNJ8=;
        b=SmEi4InFqdYLZCohTftokATTNLyUAgjQfq+jixL5RXR+zrwhkmB9diJCANOBitctbe
         Ju8brKI8oMJhcPj6bEFe4kCAoMfn1o97kWEj28kuRrpj3oEFwxUm7RcT03C506gGwEje
         oLdxg/8cr2ykKmP0nwc/YzWxgAMLC1ztDd8Z0hoN+rLxobxlqaXJpm5qQzCVVzsRyWbt
         S4JCnGOgCRqyhViMaEYn5eItu8J7fy78n0YpejswwK43L9qV1k3vk8XEP1oGmI5ZvubM
         nUKDHAIk/YwzQDmKtA9QK2gcwbp7os2+NN1p+6g8OgRRI6yLn5omn26JmH2yIqk/DwH1
         WoyA==
X-Forwarded-Encrypted: i=1; AL+hErETPY/0+XoZbTsSI/rr+xKjO6D4n6DSnhTAdeuyG4tWzofp5h2NLCjkBJIWSb3cDUJfJpOL2D2/ESm1GvSu@vger.kernel.org
X-Gm-Message-State: APuU4Z+LcbZ53a4apKxDdoAautkEF19AucWySzEed4gWOZ3Dc/P9Mtcm
	IMZcvZ13xiCJYdLbzm2Oir3Z64p2At+W9lTLAxiRl3NxzpITvnuyK7dlo0fj1SRWFCL8Zz8SYt1
	Tuwpib+Btw4w+8o6UryouXakSg7wyXhoZOb6H1elhSTg4BavY9errLNYmK4P0klXaWTVBEt6PMo
	HCNVneAcZwYn/7x8ItFSKSVmsxXqeZdF+h6lMUOJSH5MQ=
X-Gm-Gg: AZFdTZdx95rucog0LhcjP8JsUhWgVRfmZ1696Yg6KsKqA4zMFR4kdbxiIv7bWVeLkPY
	9bo2avwvAq5m1jEZ4yl+6DzTtXmzLsOebknZqtp/R85T/6cWnj71KbxW0j/a/sHybzFnrPaGAh5
	nc8g0/4DdRe6VS9ThAUCg2z9zIXodn1it1tV1uhg/X8rFxE/bO2toDfAMFuNhWfGXI1GXvmKYTZ
	SMZkXi+c8G+f/Dl5H2guA==
X-Received: by 2002:a05:6870:c087:b0:4a9:58d3:b60c with SMTP id 586e51a60fabf-4bc835713b6mr23882306fac.32.1795806648411;
        Fri, 27 Nov 2026 11:10:48 -0800 (PST)
X-Received: by 2002:a05:6870:c087:b0:4a9:58d3:b60c with SMTP id
 586e51a60fabf-4bc835713b6mr23882274fac.32.1795806647955; Fri, 27 Nov 2026
 11:10:47 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 11:10:37 -0800
X-Gm-Features: Aa3M54or7po1wOJDBldCWAtXw4-4b2F5L7dB7l0quEcTlymd-Cv_Z8mSfMZvETU
Message-ID: <CACSVV03hO_QBSuk9ueAKve0PF5wkXYY0FXWBq1c3mvP374Ggcg@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2026-10-27 for v7.4-rc5
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b09d5b9 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=e5mUnYsNAAAA:8 a=AAlKfgPkOSAJutToXukA:9
 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: bfJfFzG9uNF6RceSlQRHmTFGm1nwE6E1
X-Proofpoint-ORIG-GUID: bfJfFzG9uNF6RceSlQRHmTFGm1nwE6E1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA3NiBTYWx0ZWRfX3A1Vg2akUtth
 fkcvyBG4kj+wj+o0iNphPoMdNnKa6kpn0tP1H6qn6/LLNPyAswvss5ehWh6IPR8fYdA/BWuGien
 6coyhTyFeFfszhVdx/8URXn/BgJGsATy/NItGbsZM9SlfNUZfiryF3LiTgGnPZSVWJwpfgBzzBq
 v3KPrA/qDjcrdhtzlkldZlp1hYrx5aUekFROfWOEnit11I//XFJVxG+9P/lkyHWAyg7mzBWRjhW
 G/rFqInPlKzunj4FQ8ICZ5ZssYnjbblUZF8lR0YHVXud4J9FwyTdEbBNKeWcKLxRLwsgoDmOwQh
 K7jTmdUZg7NoqKJLyVandTBOpGYW3EuoQttaoGhyNZ9YkSSRUItPHDLPBYFXSxyJa19INmwBYJD
 rkDEr+fj34GD+w+vm9/7+vV+loN+Qt2zkQ5deDkbElP5kts3o5Yd6N6+PVZ45YwNkvb6aPCZUaH
 p3s+tukozzLpzwb4Ksg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA3NiBTYWx0ZWRfX4ttjrwNvcRVC
 uqL93ieQNQ7vq8aoFLeoAgSm5Zo/dAvlhOvQ4l/mge2fj7ycZ1cbD2YHNOg1FsHrX74Uifi1GQJ
 gsE82WJytmFJaDmkHYoW3aeCF25nfok=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270076

Hi Dave, Simona,

Fixes for v7.4 as described below.

The following changes since commit d024361c631b3f020a26c07d683e5103404b0fbf:

  drm/msm/a6xx: Split out a7xx/a8xx device tables (2026-10-10 15:00:45 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2026-10-27

for you to fetch changes up to cdc466fd769b9f29887f5921d2db5b7205120973:

  drm/msm/a8xx: Add missing preempt_record_size (2026-11-25 05:31:48 -0800)

----------------------------------------------------------------
Fixes for v7.4-rc4:

GPU:
- Fix GMEM_BASE on gen8
- VM_BIND parameter validation and related fixes
- Reset preemption records across suspend
- Fix missing CLX request
- Fix lock leak
- Add missing AQE fw for x2-90
- Fix 1/2b alpha filtering precision on gen8
- Fix priority inversion caused by commit 38f922a563aa ("drm/sched:
  Reverse run-queue priority enumeration")
- Fix missing preempt_record_size on glymur/mahua

----------------------------------------------------------------
Akhil P Oommen (4):
      drm/msm/a6xx: Check BX dependency vote index
      drm/msm/a6xx: Reset preemption records across suspend
      drm/msm/a6xx: Request CLX enable from secure world
      drm/msm/a8xx: Add AQE firmware to Adreno X2-90 GPU

Bart Van Assche (1):
      drm/msm: Fix a lock leak in msm_ioctl_gem_info_set_metadata()

Connor Abbott (1):
      drm/msm: Fix GMEM_BASE on a8xx

Jie Zhang (4):
      drm/msm/a6xx: Fix GMU shutdown idle check
      drm/msm/a6xx: Fix stale boot up BW vote
      drm/msm/devfreq: Record idle_time at GPU idle onset
      drm/msm: Fix sched_prio inversion within a ring

Rob Clark (7):
      drm/msm/adreno: Soften no-firmware message
      drm/msm/gem: Fix VM_BIND range check
      drm/msm/gem: Disallow nr_bos for VM_BIND contexts
      drm/msm/gem: Decrement loop idx if handle lookup fails
      drm/msm/gem: Clear nr_ops in lookup_ops() failure path
      drm/msm/a8xx: Fix 1/2b alpha filtering precision
      drm/msm/a8xx: Add missing preempt_record_size

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c             | 31 ++++++++++++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h             |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c             |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h             |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c             |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c         | 37 +++++++++++++----------
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c         | 15 +++++----
 drivers/gpu/drm/msm/adreno/a8xx_preempt.c         | 11 +++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c           | 12 +++++---
 drivers/gpu/drm/msm/msm_drv.c                     |  3 +-
 drivers/gpu/drm/msm/msm_gem_submit.c              |  5 ++-
 drivers/gpu/drm/msm/msm_gem_vma.c                 | 11 ++++---
 drivers/gpu/drm/msm/msm_gpu.h                     | 24 ++++++---------
 drivers/gpu/drm/msm/msm_gpu_devfreq.c             |  3 +-
 drivers/gpu/drm/msm/msm_submitqueue.c             |  2 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  1 +
 16 files changed, 101 insertions(+), 60 deletions(-)
