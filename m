Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463130;
	b=36oax1fAkUpRuTeA1q93fo5cs6QgHWHUclY/zBmI0SJUyXFD8ZhmFyHdoJlFt3ofQKU/
	 JSAVvQgvfX8Ow5+nC8BFm2FCIfsBqCfPn8pl+4aIM4JbkpcVFAtBQbJCtaaRbqO95wckZ
	 4DiPTIJQ/ztDk2R3FvD6L5bmpLluQsWE6DkyscsSn98pu083o3EHjZLyMbyTriFVgVkOd
	 I3O8/5df6mKPdUFUb9KtSAA8YtFwdQPUVpzV2ApCX5BY1YXS2jacb4n9h1ElfhnRpOnvN
	 syT1JYoUxpU4EudAheky1NtXYMW+wkqOiM/M1ZYKQ2vFTPxs//J13K/BAhk+sj4nzxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463130;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KnpAwYJakalTKmDuW9ff0h5zFEmFAGhrl/uCVIa7jTQ=;
	b=WER+uPgoHWbhsbSumrTgW3oqItXPwshpd567LK+o+wpUM98cQPuW4Y4xJ1G/IrWSsyca
	 +rMOFRI8pT/OGB0Q1mtxCmDn871qADxleUciN0MgE7FyvIW84WdiEKKgvyNbDBoDwJ39R
	 FDAoOlO3wloSUDxcSvKwTpnMsumeNM1B5TDF8nfAOlnNzyNh2uiJxNhLHdvSUs7kmdFiZ
	 R66kUSSsfBGpE/+89k+BD/2YxV7USCBV5PaABszpee0gCjrgs70aZqSO3MCac2dPhIRlV
	 Cu/ubdbSDn/6rfnMugCH4yIVGku1LPJg1Vo7rPzD8+LFZ7Sh3wNKIKwn8ot4qv9mKEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H4SQOspO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YFMAy8oD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAECB606A31C
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 16:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAECB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H4SQOspO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YFMAy8oD
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD07Gr2765961
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 16:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KnpAwYJakalTKmDuW9ff0h
	5zFEmFAGhrl/uCVIa7jTQ=; b=H4SQOspOPcIFuSqCRGnbv+gWCcxz9pp5QNxBVg
	Wt+7c+7IEB79lrGWRN1OtDvOZrgFGBf6MOHSAYx7wUZ2/maUuF0/H7V/sRDOry5h
	y/MmMEW2z8NpbxWrzTmABy5LndX4HWsLOiPL52/NY7dbG6LftOZlLqRZuSOahbAR
	WG2MRdudnYH4LIWKHVczVaD1re8jC51YNAuNupL5qTLhYPVI2c9ix00hFmR00o8c
	NBxXV2mJSs8/zK7BTqWhmFmwvuq6ny6YxUr7iUzeZBA5gMgJrKZSHyX2myJRIrzL
	sgwcw9TdhdIQOHMQ7+rAyOqiJ4Pav29lOWFUU1huGBVgPMig==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6hkxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 16:12:08 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91785bd637bso55079126d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 09:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793463128; x=1794067928; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KnpAwYJakalTKmDuW9ff0h5zFEmFAGhrl/uCVIa7jTQ=;
        b=YFMAy8oD+bZ9CLRs+OJXeaRNfDTeJRn83zH5HmQTFQPRjqZTjr+P4Oddidr5y9rDKA
         0aC4sgX983gJI0LlXUHls5ojivEu3QExR/JV+wAZ94KRM8tzyPFuOfHA1SYCf4rtiGVG
         eIBut4NYCCrX69IgOzzopLwDwbPEdr3ORbbpO1WqZ7KhYHji2wlnq+cctRAaa+xQAOtp
         bPe397tGX4SLfBOLdOjM+etjE4TXgxHCBHiansg4KK0BZjm2DfZAaytguNvi2uI7Ifxu
         NEEZByj9PVGD5pktYJmvWcQRijXWNgkXjtutIvrrgg2vppgqfRJlsqFktV/evH/glQlV
         EK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463128; x=1794067928;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KnpAwYJakalTKmDuW9ff0h5zFEmFAGhrl/uCVIa7jTQ=;
        b=2ySPyLgdns0CBJAKS9ye1nCrvpj9xO9cclt1l0pTWFlZYklLptYMLFCMA207vO1fOf
         dTfx59Yg6/jr9nqxE/6xPSU88crFm+CZeFnzYVS9CJ/tWJ+7yPXrtNMAblmh3Dt1vg55
         2sjR+XUNkUiXNqM920PQbw6MTzHsLJTYGPCQdH6kBLdCVQunJ/JkO3f3WEOjIj9sNjIh
         FFjitAgb7m2mOxf88opjRS+xw3AW1BWpKUJbyRecSneUo/xoEsUzOmjTaDLD6ANTjV3Q
         ptA/WG1AOCWNEQYJqzboiAHxz/M2dJ6y/uqcnQ3T+VviKHGpcSG1QwfVWYiCjEU34ebg
         nmlA==
X-Gm-Message-State: AFq9FYIVYgW7ScbPyXn1UBp2lDMHqL3+1e+1M09+vE+2Q+8zw2lf9ARd
	INuAGFV+ykCHwEmaN5Sp9JA9fhhHD8j0ucfKYx6ZKJwC99vwuuk2C4EYLE/ipfglQLZj+e/My9F
	34HQXFhyPd1TUYcEFDd1KA6e0rItlxy2RrVTelAcGxjjW0Nmaqv1xKS1TsRikCuFFRaIu
X-Gm-Gg: AYBFou3v9Bk2e05/WgRvSHbg7gB1yR5dTM/4y3Kqa0BP1p8pnZv2VTk/iqbU5jR5EQD
	0L7UFl6k2scEXH+tALzyV3HLg4JTBaKNrKvHdT9MEOoBpJbUd6T1Oe5TQtnc/rPo2gavHTO96s2
	FHlMNJuIP/TyO/j+FXY+NxCEi7j9tkH56EsvzctS2FkR1iia+XIZkwpiJUNx+ozfs3e7NkREVZQ
	z3ZW2tZ0t96iO5IKC7RtghpFNlZXOuZdAR882g+0Ay2EptY8U5IGlfNJzRh0NeY78Jx3b+gGAvD
	KDy4heLFg6rY/ypEU86W+Ixf3tU2crFdBQRPQZniZ9D9OqUuJ0zcUq36s/bZhBPhOI3RQYY3EPm
	Zap8g9UXrp7ij0ZgtrmDXfW3WOmuEs8z2qqFz9LK/4iyTAYjBV9Pt60RZ9flY9UOtnD0DWO3EEi
	CaCppbHVfwyVdhdQ+i+BtzKsiPF4gbWBydz2xQ9/OcEGyr/fd1sltjUTHTJU38dQ==
X-Received: by 2002:a05:620a:2b89:b0:943:f31a:c0a8 with SMTP id af79cd13be357-94421630598mr826643085a.17.1793463127687;
        Sat, 31 Oct 2026 09:12:07 -0700 (PDT)
X-Received: by 2002:a05:620a:2b89:b0:943:f31a:c0a8 with SMTP id af79cd13be357-94421630598mr826637485a.17.1793463127027;
        Sat, 31 Oct 2026 09:12:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0720e3csm666666e87.28.2026.10.31.09.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:12:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/4] drm/msm/adreno: keep the GPU timestamp monotonic
 across power collapse
Date: Sat, 31 Oct 2026 18:11:50 +0200
Message-Id: <20261031-b4-adreno-timestamp-v2-0-0836856b228f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAEYT5moC/32Nyw6CMBREf4V07SW0lJcr/8OwKOUqNZZibyEaw
 r9bcO9mkpPMzFkZoTdI7JyszONiyLgxgjglTA9qvCOYPjITmSizWtTQSVC9x9FBMBYpKDvBTep
 alnnDu6ZicTl5vJn38Xptf0xz90Ad9qu9MRgKzn8O7cL33n/DwoGDqPJCFL3iUuqLI0pfs3pqZ
 20ag7Xbtn0BHw1wi88AAAA=
X-Change-ID: 20260828-b4-adreno-timestamp-f4c846391b97
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2903;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iUPiR6Fwwwm76HjO6myts5MQhGFZw924ukeGRKJiGZU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq5hNIjrJ7ma/fmE2HB2R3lfL6UedlIjnc+2MJe
 IRRC4wpS7aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCauYTSAAKCRCLPIo+Aiko
 1W2cCACK+v1s3+d/M9djYv31k3HzpmIDFp1pDkAq4m0GtcmPbfhaA/6MtYZ2BP/Ssn+9GLMvv6k
 +HG+34ddyJk+yWdeKs57i06WrvmpbnQ+OKR4TlqGCJmWFkbLKAtGik0Rp9qk1GoB5OYio0h5zZE
 11DfzWo5FnLqDks8GwB2x8O3jUQDN94WmPebQlyUi1FZv+R3zgnrKz9lle0QuRWOR5fOoS+xodB
 DLNotlmoUndNv5D4GJ2Y7f7eGhD8EkTSqRjQC/evSxokz70qNLNTiFLUDy8y1MGKE7W8Fs17Ccf
 kjfHeX4D9N+FrW6gOFHsEBAf7HPX7NDMZKpD7Ut61dSkRksw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 8JnSCq9_ZgdOp-cNuz6y_rlrlZmY47Hp
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae61358 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Laz_JB3cWz3Dvis22pcA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Vxmtnl_E_bksehYqCbjh:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 8JnSCq9_ZgdOp-cNuz6y_rlrlZmY47Hp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfX3RQ3AoRKUsoJ
 QuEMnxVmsciXq/5bLBsvhDHE9nROtyVQo1z7gnN1iH/UsbgClCxdGqiHg+q7xir5OLLJYSvoBql
 ea1aGpLHWfkkuUYQeXSfHiWdCoT7En8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfX72rIFQSP+Ijs
 I0MPPDKcz+dB8i80YVkmV7RU/9avSjG/t5+eoqUzOkCN38UOL6fxwmsBpLJzli+6avaR6xNoO2O
 DuIk4qaeMeFVk0c79s9Fh4zzMf5E2az4XiqNsIlr7OAzOBTvIpxDz1FePCN5sC4vWCZqLBBnRht
 46mzKDRG+w/8BYLasauzxAGVvEBnn/MWVtb4Ma81MziGtAF0TrJY5kTJwNfQbPNcZUiJ+fvTb2M
 yxH+aJaS+Kkfi0nVsSvOzyIivQ0khVYcTszfFadGjLGypPWJNg4dWglvxJm2TTeVMI3Asooiqo6
 CzgtEKImUPauh6/K4P38CQjTruX8eZqBlyri+R6GholozBKPBHxHXjiVOtDtC8fqnmsyg2o0jUg
 itJtWAaAzaJYQGJcSL462zeuA3Tqx/ieYMqEpO0IZiXGMX43NxeUL2PtHGJroiZkDbKsuUPQTdj
 UiQYaKdW9Q9CW0KMypQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310064

Before a750 the always-on counter behind MSM_PARAM_TIMESTAMP, which the
GPU also writes for its own timestamps, restarts whenever the GPU powers
up. This is the case on the GMU-less a5xx and a6xx parts, and also on
the GMU parts before a750. GL_TIMESTAMP, Vulkan calibrated timestamps
and clGetDeviceAndHostTimer() go backwards after every runtime suspend.

The counter can't be written back, so keep an offset that makes it
continuous, advancing it by the CLOCK_MONOTONIC time the counter was
stopped. Publish the offset in a new page that every context's command
streams can read, so that userspace can add it to the timestamps the
GPU writes, and report the counter with the offset already added as the
new MSM_PARAM_TIMESTAMP_MONOTONIC. The page isn't mapped to the CPU, so
it needs no sequence count. MSM_PARAM_TIMESTAMP stays raw. Where the
counter doesn't restart the offset stays zero, so userspace takes the
same path everywhere.

Tested on a512, a530, a540, a610, a630, a643, a650, a660, a702 and
a730: the corrected counter stays monotonic and tracks CLOCK_MONOTONIC
across runtime suspend, and the GPU can read the page but not write it.
With the Mesa changes GL and Vulkan timestamps stay monotonic, and the
OpenCL CTS device_timer test, which failed before, passes.

For the corresponding Mesa changes see [1].

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/45806

---
Changes in v2:
- Left MSM_PARAM_TIMESTAMP raw and let userspace add the offset, so
  that it keeps matching the timestamps the GPU writes (Connor, Rob).
- Added a GPU-readable page for kernel state, MSM_PARAM_VDSO_IOVA (Rob).
- Added MSM_PARAM_TIMESTAMP_MONOTONIC for the CPU side.
- Covered the a6xx GMU parts before a750, whose counter restarts too.
- Dropped a4xx, whose get_timestamp counts GPU cycles, not 19.2 MHz ticks.
- Split the change into four patches.
- Link to v1: https://patch.msgid.link/20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com

---
Dmitry Baryshkov (4):
      drm/msm: share a page of kernel state with the GPU
      drm/msm/adreno: add a timestamp offset for counters that restart
      drm/msm/a5xx: keep the timestamp offset
      drm/msm/a6xx: keep the timestamp offset before a750

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 13 ++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 21 ++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 66 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 10 +++++
 drivers/gpu/drm/msm/msm_gpu.c           | 15 ++++++++
 drivers/gpu/drm/msm/msm_gpu.h           |  5 +++
 include/uapi/drm/msm_drm.h              | 25 +++++++++++++
 7 files changed, 153 insertions(+), 2 deletions(-)
---
base-commit: d024361c631b3f020a26c07d683e5103404b0fbf
change-id: 20260828-b4-adreno-timestamp-f4c846391b97

Best regards,
--  
With best wishes
Dmitry

