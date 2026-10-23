Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769506;
	b=ZP10wKiXips6Ac6aPjlF67eFnXc3uHGraej+bKqcGutxsp3yGZNxUMJ9XNBHTt6mcs8s
	 5Xv28HU3+5k74dtUSgbn9kJneaI1aXoJXBOZ7HJMPbBKOjWjBuCZ4D7XrhMEwcoQKcOQB
	 OjxJe/BI4ZVpaiImRfKR5N+hHzh10jND56E9Sgr/tngv7xU1SAHUeHCC2TWBXuigfzsI4
	 vnah3pHIx0thXZckobZnKHYC3IETMYwwAI1NgzlFD0S+eFyt0RJMWLmZ4CyJijh32L49k
	 Ou3h/96JH8SjNcwrU7p+io90QPpJ7KpwXkRec5dR90H0YyljiX7p5LD8wEidIr3M/PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769506;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kDlqVW0McES5V3a/+nyRYCxkrvMkRIcQh+e7PBBpZos=;
	b=xWuT5JgLUhnqseM9ebBmnicbzr3aOclDi/PKXkzDaaGev4USj1Zxv/EJQQcEYD984m7/
	 htLbM7YGeiXEmdMdVAOvu4dgmm5ZjhlUcCcXhdZAFIuQzzIMyO4HEKIs1OOWI85nPcYG2
	 p9whXCVExmQZU9QCnwgz39QeOLyZYjQHGE5PJoa3iO5Licj9GQuG0nMt8oSE57IsVaUJ3
	 j9op1tuym3w1L+zU3Lh+aHjDGalDXVuyrEuxSsvdgpVgm2vmcFCkmVGa8mZhGzwVSui3Z
	 qZgVlbsDXNnFBOceewAxASVpK2m/3ljU381XF3pYZzgJ7zPwFPIYSeVHpzdQ28FCJOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Em7RNhvu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U3RtL5So;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854A8606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 854A8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Em7RNhvu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U3RtL5So
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6BWW2999843
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:31:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kDlqVW0McES5V3a/+nyRYC
	xkrvMkRIcQh+e7PBBpZos=; b=Em7RNhvupOZAMXGTj+n77Rq5sGycH0GWO06z4f
	cWLMU0gv4M0dMe6VVSqme5Aky/ZcZpS4AktwuVnxMZ9ZEFarNRdACYG6K4U3Va7X
	rAGmxH1dxdYEHIkI3nQAr6quSHzjm+K7fbKdcGZ4qntbzFRBO64ThLXehvuVD2VA
	GkDQcJzHr0z3TtfG/yaQyKEBJ66l4yyIhSH8dZ1DmRVwS0Y+yhtPvyxkIDmL3iPR
	v/X3kis3aw3oHESVHSgwR5AFpVU9ycSULtvQ7Md44INitmWIVFqoI6BVI/K514y1
	em3yG9LxuFvz+XA3A7R9sx8emzZpE+Ssi/VAoRrJbe4vfqQg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7cn0q35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:31:44 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc23a549a9so871832137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769504; x=1793374304; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kDlqVW0McES5V3a/+nyRYCxkrvMkRIcQh+e7PBBpZos=;
        b=U3RtL5SoQKP8sPnr5pexG45fo/Xirv1HOgi9fGNe9PLR/rqXcrwMhJ62ZN2fxG+c/D
         H5DPsStZhkp9p1DXjwO16YpZoKn0M4LVPJzf76/c290uA4z6Od908W2LHVNt5JiJKlL7
         necQv9qGLeUlAmNMqu95vEl7dMjp2uZ4OVi65c2MGn1bgS1JVGv6f6NI3ykBIIQ+hexC
         Q4amiDq4Qnm8UBIF8FfdHDfOLUcrXbojk/e34wmAakDYzAWq+3TJmrSa2s0hM7xLcJFk
         uiD7WgFIS9+kiQW0Hj2WNAEK90KbdMzNoFq7tRJliiO12g29DYJOs6QFn4KSRbPS67xG
         hAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769504; x=1793374304;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kDlqVW0McES5V3a/+nyRYCxkrvMkRIcQh+e7PBBpZos=;
        b=Ef6zfDCSO5ow9CBq2qgRZoKYcBMzNwi/WYgkmC/ZacBN63X1nRvTnRHbI5es5FyJt5
         TSP/Xp/8JzmutmRATcyFKx9VCfh1q4skAY+/ybosi49c6Nt6Y6S07aF4qkjfBTZ1EB4r
         6Y3hxaO4sZSv55Pgf/yIio+Y0aDh2wxKuf1YakVhq8X5lvXQSmok4jW6lFsKMPaynXJu
         T2eia4RSBHQGLW16pe/IFhYaL1TIAInuwBn5R+yKsvojB60K5TCvG1tbbLPT/5srf38f
         +OmNIAlqyGK46emV+7S0nxtUqvVG94iCH/XLWGc7z/cJyFMmmtwdcdLuVN5c5Dj8TOu4
         Bvmw==
X-Gm-Message-State: AFq9FYJp+HaxWpSZNKGa67iBUIjcO31ZiZezCHPhhE2t+64S4sh7an6s
	48AeyO4H7SI+DuJgEaRzb7c22A02bCbaqmoNWyq12AEAzTARHNh/mHfNAN0EOsGbjmDvqxW5ch2
	MS3VGLIR+8mK1VIcSTNKj9ZMyMeVktdG+dhbtd1VDkj2DUQ842UcBXmR+ufyEy2Nc7joC6QUBy6
	V8
X-Gm-Gg: AYBFou2psDwE9WfvodbMGXcOHU58Mo/rT6+f5d6XWirxx4CJPkZvlThFuMgXaLtlKzQ
	Io5G6cebCjcsX9lWApTBBW6a7qE4q5gMeGKAXPvW5Fdc1YSHhHf8Ky+JbeljBUJh5VM/Cpdjv60
	Bek18jFdWha31YQMrpPJc9Fl8paLT6f71Hk/TWJt0/iWkRC0aMe9KV/3sZG6fH/46sTAqlErXvx
	ZkDNjfOf7fbl6/D5K0nsCSis/AbNWgZcpH2lKcSqdHH0M/WQlnH0FiPFR2ovSAoSU0zlqjeLX0z
	S5cLNsLIS6fS4iWxF4DZTm3meLG0r92K8Vz2OtbukFrNWgx1ein/vBqKfAp1+qXHjFFu2kT6j/8
	dENSW7TNnQim+ijcAArHzpNzYRJTcDMjTwKYXCCzCPzrNYMKJzzy9GIqZKTuejBJC6KnjDp+1fg
	Pm7fIThC2HXc3L
X-Received: by 2002:a05:6102:3fa1:b0:7cc:56a:58d2 with SMTP id ada2fe7eead31-7ccc3355b61mr1118695137.31.1792769503736;
        Fri, 23 Oct 2026 08:31:43 -0700 (PDT)
X-Received: by 2002:a05:6102:3fa1:b0:7cc:56a:58d2 with SMTP id ada2fe7eead31-7ccc3355b61mr1118674137.31.1792769503096;
        Fri, 23 Oct 2026 08:31:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb0288806sm478062e87.55.2026.10.23.08.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:31:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 00/14] drm/msm: fix the error handling of the KMS init
Date: Fri, 23 Oct 2026 18:31:15 +0300
Message-Id: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAMN922oC/3WNQQ6CMBBFr0K6dsjQGhBX3sOwoHSQqqXaASIh3
 N2CazeTvMz//y2CKVhicU4WEWiybH0fQR4S0XR1fyOwJrKQKHMsFYJjBw/HYIiH4Gdo7YcYsMW
 jzowq9UmJ2H0F2h+xeq1+zKO+UzNsY1uiszz4MO/iKdtyuyNDVH8cUwYIhLnUhampKNqLZ07fY
 /1svHNpPKJa1/ULSf8PyNMAAAA=
X-Change-ID: 20260930-msm-kms-destroy-fixes-0f04b1d39b83
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5493;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=M57gplkG0ukSxOkKtxGJllo7AI+MFjzExO5iAjYAzzI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq233JNZ06M0UW3zkKIvHjcFm/9braXahFmAvgZ
 uDUZbWa27CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatt9yQAKCRCLPIo+Aiko
 1etnCAC0H5DhqB4biySXjyXXEIO/R9vuQ1xdKIgFrGzYHtyNtj10lc8t0q7F/qSRplazmqbU7tn
 FnfpyONSvB0rKR37xuPoCcHe1zCPd5KU0KpA7h7Z8lbqJLbCMsNnt6c9PE1XHJ/2+WegRFNEL+H
 jx8pztjMsEFUbwuC06T8PKUeuV0uoQ4zMAUJP6AUDseNaHwd9wuB5TbPRyGAfzW5cCv1A8cZPay
 q1l8WdNMULe1kBYFwo9Qx7eL21EoYul5+FhAz7tSMIKWdSzPqMq06zefPRcp60s6Dh/aTyXRwB9
 xLuxZGSQb3bM6Ym2tUkITWUGA+kYqCZCJRly3+x7t6lsRLiz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX9F+SB2jtnl8C
 ReYZNonbGCkK3FnogC1H0I+hw9/tJvAvGMHnAkOfztcOeaOQLHo3emgJ12e8C9/XWVUJEhjxFz2
 oCedqJuDSZNvD3tqf8IYDYWRp57ManB3aRoDMhXlnDeWQbtC2Lid6z95/+Q6gtqKj5wB5kcaRMG
 p2zvoDTPctXtYa/6iufouN/JFeVD6/cB20OpqqyGSmr12xW4smx8CWkhp7mtSXQUZEOAzv0SueM
 TF4fwJd2byDX0DMYNl0gQx4ylBOXhV+/d8fhy1Nd8BlxnN0ZtzyULaQvKBNAPcbtB6uXvzl/OVy
 +6hC+w3WLLhwCr8x0dlqdY33r7EhV0i5AeG9A+TTsjHLTdrs2iFBbdM79Xo4E60yRiA0jMBUzPM
 0O6Ysup8Cc7vLCc/lh4Izdf6DQIjKHloCW6sJDz5MoIyKHISAr1u8/MPGeW1AAD7rNoIT1PvLL7
 wZpcY4aGKKWZuz7Q7qg==
X-Proofpoint-GUID: A-sy8cqlM-t-N_WNmpmtk88i9mmb5KAY
X-Authority-Analysis: v=2.4 cv=a9mlZkSF c=1 sm=1 tr=0 ts=6adb7de0 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=SeckFaocyGfTZ33SJHoA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: A-sy8cqlM-t-N_WNmpmtk88i9mmb5KAY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX55tna2vha9Zy
 GWVogojqYskztocLSXSk95RIopay6DYsFhvGUDlzdDoVAFp6ZF5iCHzcm04dy9hHBSWSenPhlp/
 b0HK0zh5LaaqqdUn4gtfRVlGLHYZFnE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230060

When setting up the KMS fails, msm_drm_kms_init() cleans up by calling
the ->destroy() callback of the kms driver. That makes ->destroy()
responsible for tearing down a KMS in any state, from "not initialised at
all" to "fully initialised", and the drivers get it wrong in several
ways:

 - dpu_kms_hw_init() and mdp5_init() already clean up after their own
   failures, and ->destroy() then finalises the global state object a
   second time;

 - mdp4_destroy() dereferences mdp4_kms->dev, which isn't set yet when
   mdp_kms_init() fails;

 - msm_kms_init() leaves a NULL workqueue behind when it fails to
   allocate it, which msm_kms_destroy() passes to destroy_workqueue();

 - msm_drm_kms_init() hands a half initialised KMS to the full teardown
   of msm_drm_kms_uninit(), and the snapshot init ignores the failure to
   create its worker;

 - the IOMMU fault handler and the DPU interrupts can queue a display
   snapshot on its worker after it has been destroyed, or against a KMS
   which is still being set up;

 - the MDP5 driver appends its hardware blocks to the arrays in
   mdp5_kms on every bind and overflows them on the next bind;

 - the DPU never cleans up its self-refresh helpers, whose delayed work
   then commits to a KMS which has been torn down.

Most of these were pointed out by Sashiko while reviewing the "drm/msm:
fix SMMU fault dumps" series, which has been carrying the first fixes.
Rather than teaching ->destroy() about ever more partial states, this
series switches the KMS init to the usual kernel convention: every init
function undoes its own steps when it fails, and ->destroy() only ever
tears down a KMS which was initialised successfully. This reverses the
approach of commit 93c125e4ea98 ("drm/msm: don't tear down KMS twice when
KMS init fails"), which moved all of the cleanup into ->destroy().

To keep every step safe and bisectable, the drivers are converted one at
a time: a temporary flag tells msm_drm_kms_init() that a driver cleans up
its own failures, and both the flag and ->hw_init(), which gets folded
into the drivers' kms_init(), are removed once all the drivers have been
converted. The last patches fix the teardown of the DPU self-refresh
helpers and follow up on the new rules: they unwind the DPU hardware
setup step by step, disable the MDP4 vdd regulator on teardown, and drop
the runtime PM flags which ->destroy() no longer needs.

Tested on DB820c (MSM8996) with both the MDP5 and the DPU drivers, with
failures injected into the msm_kms_init(), the MDP5 kms_init(), the DPU
hardware setup and after a successful kms_init(): each of them now fails
the bind cleanly, without warnings, and a later bind attempt succeeds.
Unbinding and rebinding the driver works as well, except that with MDP5
the HDMI output does not come back after a rebind (its extp clock fails
to enable), which is not affected by this series. MDP4 is build-tested
only.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Added patches which register the KMS fault handler late, reset the
  MDP5 hardware block counts and clean up the DPU self-refresh helpers
- The unwind of dpu_kms_hw_init() now clears the drmm-allocated hw block
  pointers, dpu_kms outlives them into the next bind (Sashiko)
- kms->vm, kms->wq and the timer workers are cleared on teardown too
- Moved the MDP5 counts fix to the front, merged the error exits of
  msm_drm_init(), clarified the fault handler and self-refresh commit
  messages
- Link to v1: https://patch.msgid.link/20261003-msm-kms-destroy-fixes-v1-0-e062b7dae77f@oss.qualcomm.com

---
Dmitry Baryshkov (14):
      drm/msm: fail the snapshot init when its worker cannot be created
      drm/msm/mdp5: forget the hardware blocks of a previous bind
      drm/msm: unwind msm_drm_kms_init() on failure
      drm/msm: order the display snapshot sources around its worker
      drm/msm: clean up after a failed msm_kms_init()
      drm/msm: let the kms drivers clean up a failed kms_init()
      drm/msm/mdp5: unwind a failed mdp5_kms_init()
      drm/msm/mdp4: unwind a failed mdp4_kms_init()
      drm/msm/dpu: don't tear down a failed hw_init twice
      drm/msm: tear down only a successfully initialised KMS
      drm/msm/dpu: clean up the self-refresh helpers on teardown
      drm/msm/dpu: unwind a failed dpu_kms_hw_init() step by step
      drm/msm/mdp4: disable the vdd regulator on teardown
      drm/msm: drop the runtime PM flags from the KMS teardown

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c      | 73 ++++++++++++++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h      |  1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c     | 68 ++++++++++++++++----------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h     |  2 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c     | 52 ++++++++++++--------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h     |  2 -
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c | 12 ++++-
 drivers/gpu/drm/msm/msm_atomic.c             |  1 +
 drivers/gpu/drm/msm/msm_drv.c                | 29 +++++++----
 drivers/gpu/drm/msm/msm_kms.c                | 55 +++++++++++----------
 drivers/gpu/drm/msm/msm_kms.h                | 19 +++++---
 11 files changed, 190 insertions(+), 124 deletions(-)
---
base-commit: 5e4a3f7b262060d70cfdc7889cfe0f4aba9ea3fc
change-id: 20260930-msm-kms-destroy-fixes-0f04b1d39b83

Best regards,
--  
With best wishes
Dmitry

