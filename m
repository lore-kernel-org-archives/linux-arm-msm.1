Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635808;
	b=5eZyrwCv6hlLHthMzPNS4fUHSdO+Y03w5rt4qlCGWbdPRUIqmvArHUjCN9wCJBo7F5mZ
	 qj2BSmtqQE33TuhMDdjSN4ph0HERZ2zC1tPapOnYjKGLWK8j1cRXE2M6M0oiUOcAlBfAc
	 fEv0Fqa76IV0aDoovv0bT5HtHRF7DEN984KOYvgsayGHxtSzI4NzmsyB4+bJeevSLRSyV
	 jvRXIwaRo5W5jMyReE3mpVU/97MDHBEGdLOr0zEbXq8B6S0SquEtPRIK1Bsdl2GguCbCb
	 H3+DjQCMWnPkHG1HKgZq3FMPWAYdgMem8jnMlXsqEivprdZTAbzqTLyLwYvVfDC1whg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635808;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j6Jl9fkeKPAkBraVEg5312er2XpFL9q4OtT0Sa3z2xY=;
	b=JXWV9/0ObZ7ynYP4oF/VozBrQHLgxIFgzE4zYwV+N+WwGk4YehuEbblXZuBSub40zIJn
	 SGxH5MeTmoSGlUn/YX9mIn9sbIKCV4WMnRXA9jLttp6CDAtRlwbyqtGU/1xx/CqwM7oi5
	 UrcOPlE4ahGbgusaHiYaKOQfqyaTMQ/+5z4vYBe4APtWasvU3YEN3lL4slBW+scqYNM1c
	 ZkiYiAE7Ua6rquridMtJwfuKE0uhTTKBB1OuG8PGcDNkH+9w4eIWYG/+OjUSym8/b8yE7
	 Pre2tw6JucObIHRFPv32XYpTNd+LB0B2RwpD7bKjXuDq6X7E1HBiLQoDqQeQL1bF6Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iQAra2AI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vk1+4iwR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A7B607E0E5
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 16:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35A7B607E0E5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iQAra2AI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vk1+4iwR
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2Dp4Fc894009
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 16:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=j6Jl9fkeKPAkBraVEg5312er2XpFL9q4OtT
	0Sa3z2xY=; b=iQAra2AIbNq7/30+mFcpeYfq9txDZiWaxZX56k+zgD4aaH3QmtG
	sSyfI9l/UKfP5b35RjEIjVJ31+mbbmtOt0O0Sl83IjDK3H0w/QeIbzqouR+OoC/z
	K9SZ6MhYI2PStZ48RHqM5QXaAtb/a1BLlmnCsYbaQZJJkXOaZfbDPEKrX00mM9OM
	9MaTABy81tXnFraL7zYFxpZhPzJEYBURF/Ywzl7Y6GN2G10yNDzHPe6zeErdw4rk
	xucPoSWltAoPDtIGoF0J3v0fLJkHCoRBN6z/1By1R2nLpqqWmAmWz9b2U9SpGxSj
	t18APwdWBp6wxUQoKRglKZfxxdBys4HJ+Sw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvsrw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 16:10:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e869e00005so50313065ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 08:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793635807; x=1794240607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6Jl9fkeKPAkBraVEg5312er2XpFL9q4OtT0Sa3z2xY=;
        b=Vk1+4iwRt0c235+iKeNZ07PbKuwm3Qo04pk5zlfZ8XS/K7Rd9FEUDtkFDsfmDyRX1U
         RJXtXJx+qobW8aDPopkLLfFfnxWEX5BaZTFF61PwH6/kNagkKiG1CH9NWQj7WF0x7tuo
         K1hbo31Lg9YPba+58M4tsC3V/PHKQdLivyleONCFNY5dqlRcAzleUCyrw3BvGtw5BomD
         GiBnS9KJwn7Ve5Fh4rOzponkHycooskgvyiNUHsAi15ZREryK2Uq0jAoiqeAzRC+pzh5
         SHJRWrM437ZwmaktlWTO4WZXcjggQRNjH1lfJ1r5WF/K3h5jTwqDTkZ1bFOI2iPX9HiQ
         EI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635807; x=1794240607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6Jl9fkeKPAkBraVEg5312er2XpFL9q4OtT0Sa3z2xY=;
        b=J/HpjvCwO3slHCfPhefAa25JhQP8KYwkZVhUpddEYTlQziFtZH2uBcjNgGQPuueCYh
         ylIQeuEgC7gz04xbMDMoBj2YrGGASWgP4RY+CX4dW1a+NucrkUWZOkCDQndydUWXivaj
         Q6yURrj5kurL7IPxy6NlNM8k+Iag/NxQMmC9T44r3ChRu/ahYzcaoOuzEcNkangvjjrN
         KWcbsCUtBQ4Ce88H7mZ8bM+FkgNKxqQSp59BdxLOILnnq9KRGqCMaM0WN/BjReixm8rR
         J2O6j/T0cS8ys/Re3CvENwgIlUIOjR73GKdjzFAy508qDkb7sesewZI37yjnpByTdG4J
         hK6w==
X-Gm-Message-State: APuU4Z+Zr9GXdCMyuPUWQNCrb7hQkIpeUdUPvGxX/bAbYpzBp1TXEFT5
	xY2pHBc1Nv3xQ0TurAdvnAmBNyoFUrsIGKncmQwZi5NQbgMHOXWeEtPqvWiohszuGby5y/4Dr9i
	pDjxd5U/gMMrXAzcmBBj99LC06/KATG03Y0s5w8JXXKzMzC1ByWauYVfbX3W0xvdKcuXiO39m4p
	3hcJw=
X-Gm-Gg: AYBFou2AA6wu1qMfPCakQCVeVHZkt8OQyTWy5Wp4pu0HpllSzkkgUQ5SRQW/ZXWXBE/
	4B4WSv1XdpT4qR//EUV+zWPsSQooxON61WoyDSfU4tK97tCvmDy56k4PAXN1OfcrXjtdVO+sU4J
	buIHwS7TB65Rw9SkJ54aO/iinI7tXABZ1L2Qe6hchkwYvUSjVfvXGuHJd29eDIUeTi0htLWBuMN
	Hf4PdUqwKC8GEz7YnYWI+GvgpLtGXM7zkDdZggwIbIVMk0tZzdY5YUmtoo6BYnH7K/6tL3vT6B8
	s6HMAXRocpX7S/JR8zjIa6+KWuFBmMXXmNJNXjugC8BJS07z3zk4enUE26WoV/TqVe8sahg38oj
	Xs/1vWjA1F6uf7/4Pq1Z8O2geOIhX3jVDvKCh+mqX6MCPDPDgxQa19FVG3Ak4CI5aCglgmXjwYT
	KsOuNUq+MxobdLFI/ITWutRA==
X-Received: by 2002:a17:903:3bc8:b0:2dd:c100:4248 with SMTP id d9443c01a7336-2eb3647079emr103787405ad.44.1793635806561;
        Mon, 02 Nov 2026 08:10:06 -0800 (PST)
X-Received: by 2002:a17:903:3bc8:b0:2dd:c100:4248 with SMTP id d9443c01a7336-2eb3647079emr103787015ad.44.1793635805968;
        Mon, 02 Nov 2026 08:10:05 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3928d821sm29672765ad.56.2026.11.02.08.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:10:05 -0800 (PST)
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
Subject: [PATCH v2 0/3] drm/msm/gem: A couple VM_BIND fixes
Date: Mon,  2 Nov 2026 08:09:58 -0800
Message-ID: <20261102161002.497152-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae8b5df cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ygTbR3Ydg0thdFsOExEA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: aRFeC0KHM_vXtvdbJaIr8lzu-jasns5-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2NCBTYWx0ZWRfX4vBZdYBlWj0O
 OTOyvaLkDPxOgYGsy+7eprfP3WhpjA7j99rnH2/n61YtVqRr0bGpvCefUXghaCWlTLxb1GDsnfI
 GZwot+xtc+n4JgQMJAqD9oB3sWMDDkk=
X-Proofpoint-ORIG-GUID: aRFeC0KHM_vXtvdbJaIr8lzu-jasns5-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2NCBTYWx0ZWRfX5pTtc4IKBZ71
 nGK7c+LxBfe4KlcnpQrqO4oNdnOvH19UQhcEHNsvljmhBPSZq9w1mf4R23Kw/hctB+4JSrlPSGI
 2eNYcu6ZeR6TBp1xyS0CnxA7hWuFONy1xwRY8ES+WMeCCuMrAVkKRSTZYPHKTB4mFgCqg62nkCL
 8nvdo9ahT4qTp7Par9/MEh+ATxg9KkxhuUHVg40xPXi2IunBoXjVA1l+cE+f+8aRVIvTUL/atUJ
 687Kt1CGV7bQHlxgyWEKkYrrCLNn9ErBR0Q+UN9h6rQ7ZZFjTJw9wa0BffjJEYcDItVMcQ6KLTL
 6nMIICcQqlIuk1bEhcTtCWp8QuXJH52vZCBMYz5dFrCWC3dAjuJJu4//hLUH6u4+bQjOLUwrGzr
 r1VV5XGRy554VsLDQu9zt1/Po2whx4H+RCVFXaEJ5llauUPSge3E6QuPCchv1SiJbD5POqWmV0l
 pKzYWbGvzDTR9KhAavg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020064

Fix possible overflow in range check, and disallow passing BOs table to
GEM_SUBMIT for VM_BIND contexts.

v2:
- Also check that range/obj_offset are not greater than SIZE_MAX.  It
  doesn't matter currently, but would if an armv7 system ever added
  support for per-process pgtables and VM_BIND.
- Add patch to fix handle-dereference in idr_find() error path
- Link to v1: https://lore.kernel.org/all/20261101174911.25184-1-robin.clark@oss.qualcomm.com/

Rob Clark (3):
  drm/msm/gem: Fix VM_BIND range check
  drm/msm/gem: Disallow nr_bos for VM_BIND contexts
  drm/msm/gem: Decrement loop idx if handle lookup fails

 drivers/gpu/drm/msm/msm_gem_submit.c | 5 ++++-
 drivers/gpu/drm/msm/msm_gem_vma.c    | 7 ++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.56.0

