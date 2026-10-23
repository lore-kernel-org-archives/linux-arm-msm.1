Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797598;
	b=4PMeJDVTmlARKligIqd/X9Aga0JvbR6maXBEmGUgpujXouE4i5ExybktM5pl4sv1lxe8
	 JjVxwk6gilumUrvShNcBToOf8IuqOsoaAYdwGZZ3Hf5vpuBh4sbVN86eqKTBPzMQQaivy
	 fQ4MfkDfyp/1onlIwBSO7gvkwzul/rQVPyP2agccgF5L5+t9K4fWIl+/g5SEOuJauEzz4
	 c+mSNkPrV72M6FvCgUQUU87Xp8LfAKjle9i0zltCn9wWFNDTrgtb52fzQQfPskFopH35x
	 Vcuk0Vi6qdTwagzcJkQkKwg1GX2BhlSw0MBywrgtVyqZczaIJSJDsl2z19dCnxtDn5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797598;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=g/gKhJm8D+3RUy70YA+6REMKGfetc5twJCUNtCBa9Ig=;
	b=zZfB6Clewp8B/9cDN4cToI1s1OWAkuBxrFY/CeMqvBaDiqyekBZshRLbqTX6/lMx9Kgm
	 ln/DDDpDIH6COLRXcXlO3SHe1LM65w/NhzHD3UrwKK6J21YFer4lVHFyDkscEiJsSSuy4
	 VhTujs8qUGNbHdFNzeR+5EflMuwOkrzq+WbPqeC/9dJMz6O/FQZNufCB5lRxpRW89UKqm
	 hJloTTcjS7qecpK627fKh6lgyQ87Dtgt8mZLJTjU6wiPSBTFTjVR1hLwjE2+U0wwEJUfc
	 pT9MuhpvdXHbQmp/Nb+3WTkLlu5aPJqjYYg/XNt25gEq/trfCX6h5EcTHIMfocILsiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kfdOx1yW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z8jjBef6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E77606A31B
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12E77606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kfdOx1yW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z8jjBef6
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvOFI886330
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g/gKhJm8D+3RUy70YA+6RE
	MKGfetc5twJCUNtCBa9Ig=; b=kfdOx1yWsKH5kO8t2nKjIKyFi+wwE2Ajv8a6/O
	lzDxzTN+KKnFtBEBpQjz5V6/WZPacGHgWLJt9IFdP5RfTT0iD+PmQNWbRltibQ8J
	I49LFVoP6yNgbcRfCOJ3zfstDI8PKvo55gH8zAYZq/TUq2NZZiS9JWdd99mFGzEZ
	SmUb+N1Jz5PLjd/GpgbRFW5s7KYjIHIZU1/YDURd+BSLvcQkxZR8HW99qiPWagJu
	sM4KXAiPhFgegKIS4E2y3wH04oXmo+GUpq6FUXW/T3m7TglEvUm4qaj2UrfiP1ik
	HsrMphpr898vjU0l8OT0PSI4rRbHTworzaFsxjiYsEBx+Fig==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw28gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:19:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1e62510cso354946285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 16:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797596; x=1793402396; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g/gKhJm8D+3RUy70YA+6REMKGfetc5twJCUNtCBa9Ig=;
        b=Z8jjBef6XhMtvQ3kTef23MSQl88aAQTNTVsBsI9EDZrEbgpVlbQ1LzsFPoXsDaQJZp
         jJa4sGJeRxXm9NKmmd6uvQtn1Az1zyEDDIKAqoxhtt+V6ukwX51nnfvKYa0Mj6pof6Zy
         yQ7ICfRhzs4PkOhVBdq1XWUNLbe7+FIWUXpN7ieY0oxa2WkFQwSETOnZvitoK31KVKp5
         +UkT0C2eh45cvsKNGk9UB/XzFG1ZU+IQnn7TNOH8vZXbsNgABGv56JiD0n2xIT9GY3dE
         zyd/rS0981sik8fkyr/+h1URiWmmlLUgylcgeH1j/irGlm8KRqjoVye7toh/Id3vpJbI
         7gWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797596; x=1793402396;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g/gKhJm8D+3RUy70YA+6REMKGfetc5twJCUNtCBa9Ig=;
        b=ytDxSBqJdNd8tCyfnCto4kpios3ifWrnx22FYdWT1XrixU8s+vZHJ9Su+ST2tqBhmo
         6ACizQygYgz1HU/aO6uUyw3u7FjqeU95aJ3EGuWr3uj04NZRDCzowoTiPgWHvPi2+ujf
         l0TyL2CQfgc/iq7raM18nDfqbC6THXQqpqzrPdDK2S48BlDa1JkP6vGpmMk89LtxNGYh
         WmrnAbUhKfE5y/ItQqyuyMwf8R6psB35lhgKAKcq4uwhlSB2ZcBXO3KL8vXp74tgtrrz
         MX55Vwkhx4IDVDQkdbYCs+XmEPODKTNfbt2hGioa1JhcUWafxTVclyr/X8yGVgOf26P1
         CpwQ==
X-Gm-Message-State: AFq9FYLFxkoGhUPfRmUh5WvV2ckqfXksjwB7L3oG1qpyuzGXZxCAPcVA
	QeUID6QRvTULR9iawibIFr05gqTD89BjzKDqKFPb5+iDULM93UD4M2SwCpxR6wow4dKuMVqDIUX
	yUePe51Sz57KulGUdN/JHut4KD8hkvyr5eQy9XfqJXQ44OK4jH+w2lC047hdcBMPudIX/
X-Gm-Gg: AYBFou1iIMgjK34STPltE7X2a+G3WS1JixyR3v5sVaFx3LD67uuw9QWeWlmG07vVfIZ
	UtJ7uAwZeV2Gm6QutlpKtZQp30FC/tQI8mvIkdmJTgOagtHZUob6ov8uYkYPIgEKlwlupSMAbRh
	WM60anEr6j4ytnuaxH0K+1SlkiuRlFkt3YP9xdW6iKN12QsbDmzulw/lsFZMCDXdtm/DNqGs5Kn
	ytFlWCO73LMzJvnjRKh+faHQ7VrXKVJPWACWRyJyxjV5GsklAsRZBl+eM7bNXVhInUACMOgkx5V
	eWTSUnt/1iZqbRTg9VBsf9DPR/zzz3rnfxQXeU4Cme87PBmfbkBKDdh8wH5Y+i9VFLJ81qWr1f4
	gQzNxbNBDfAHrqMDVInLIo9H5aYftqRV7Zt1kpjiTJFCDFkTY0otS6ooex8YSp4QJznYxhKxeht
	H3FSq1qbh8bKjj
X-Received: by 2002:a05:620a:3704:b0:93f:3193:ac02 with SMTP id af79cd13be357-940ef980186mr85586285a.51.1792797595996;
        Fri, 23 Oct 2026 16:19:55 -0700 (PDT)
X-Received: by 2002:a05:620a:3704:b0:93f:3193:ac02 with SMTP id af79cd13be357-940ef980186mr85583285a.51.1792797595526;
        Fri, 23 Oct 2026 16:19:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3a58sm863811fa.24.2026.10.23.16.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:19:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 00/14] drm/msm: fix the error handling of the KMS init
Date: Sat, 24 Oct 2026 02:19:33 +0300
Message-Id: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAIbr22oC/3WNQQ6CMBBFr2K6tmY6NVZceQ/jAuigVUu1A0RCu
 LsFNy5kM8nP/P/eIJiiIxaH1SAidY5dqFPQ65Uor3l9IelsygIBd5BpkJ69vHuWlriJoZeVexN
 LqGBbKKuzYq9F2j4jzY80PZ2/mdviRmUzwabG1XETYj+LOzX1ZocC0AuOTkmQBDssjM3JmOoYm
 DevNn+UwftNOmJSdfgDw0UYJtheGzSlQrRk/sDGcfwAGjs1uiABAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5666;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y4fDxGfpbq/W/o8WwgBUX09912j7OPaz0X+wudJs32s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+uJppx48xsLonjOrx30k1Ri4C1eudk/9xeMN
 VTOZLSC/+6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvriQAKCRCLPIo+Aiko
 1V7MB/sFaerdhZNYNUGblQ1JWAgjlUreKqOUHRpUXsSfYPZ42gFOgnJ2sgwP+YLzlwYER0Lcug6
 DUwP/3CeVTKy316RYuv7U6TZpKnNfVPwWtdIJzcHiW9yeL3ry0rVI6QHGWr7idrQm4kDwmsrmMd
 Kfk84BCI4PXGlexaoqezoSd6XAWsRRu61vf+j1E6tW7lB72FWX0oVAscwee27ktY1un3qJMA9fN
 upg5d6vP3QJGWNHM6SHDA+91phWrA2zkRvl0FdewBDUJB1Tml3TdpXU/KnSAVfthLxhaJocG/pc
 VXn5mWRSlbzmg2E7/LUt+pTirm8z40IFCSYaQ3Z9qZo6MLj6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Qxc8pVJp1kadz-1aYGJusNGGyVY8jxyT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX4ID4ZKC65CSz
 iT77O8+FPhmHCNWfjwga/6ELbohdzadZHzbvJp1KfyBcUvPFVcDu6GSVq2wYFfcRgNgM3XWbvu2
 z6GEbnX4z3J0ozDZPZVzvvrh4DIZ7Ck=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adbeb9d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=SeckFaocyGfTZ33SJHoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: Qxc8pVJp1kadz-1aYGJusNGGyVY8jxyT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX7cdrKoLP785X
 OVI8kJSVSahixeW9kiF8xnBEnDRVjXI+jk9ab9FYBBZOTmaNyecBc8kS0M5OwKv6BmldEarXSoZ
 n0bXDQuzQRA9Pk0wNkmh5Uy1AAMI/ZCkvj+Cb5KbJ/EcpG2yC4GF+t8dW6x+W/TFzWvtqa0tWI3
 gqzi8V/DyLXjjD4mTCnZSP6EAyhB39F1p37Q7PKC9eU66qjIAndMg8T7baltaC/AS95yYp6/IFO
 RcJzcvkG4L5L7Bg4FKVs/8FZSVa4hgXtIjOhexg4BPUcgnJBjIr8pRYXP3fK/0bNO+pYRbDb6fS
 uL0yq1kZUUgPHLJrrzOoutgycF326gMRCzAtPEvFIA0bfT7gg21DxLZgelsLwu6Oe45oLDYhXFP
 y+Mh73og7r/Zb0yTW/n3n65vYeJdDpz9tghRBRSdlJnkIOTJNMJVmk7Yob9F1ltf+6XPR0LgGOt
 4L2TRtbb1yP+lIhwEAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

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
Changes in v3:
- Rebased on msm/msm-next, fixing the conflict.
- Link to v2: https://patch.msgid.link/20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com

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
base-commit: d024361c631b3f020a26c07d683e5103404b0fbf
change-id: 20260930-msm-kms-destroy-fixes-0f04b1d39b83

Best regards,
--  
With best wishes
Dmitry

