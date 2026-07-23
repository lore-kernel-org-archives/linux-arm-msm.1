Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9F732C92A
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784778769; cv=none; b=rW4JkVFK5dYXZpsjulErwpA20MzTcg9CV1O4G6QXBnm15VYhbgaoM22KDbVW27AeuVwxhV5lSIUh6n03Hv4CffIHI2OAicV0v1Xczq7JcNDicmn/q2vUE5UmJ4NYOaEoHTRT/Rb339Qr5/inwl9qilWPK8bV6VIghEE94kOTiVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784778769; c=relaxed/simple;
	bh=jlWppMMNCG4So8M5/jDBMwGAOo+9cMnyj+UZA8JE2Q4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bfprj0UzHGzT5U51V2HPPUgRmTsNLUCLINWROnALHOds7CKG1oy8fVKyRhpiHOPdtD+recUvkQjpl+irk+W1FMmxaVmLneqaztenkEOP/iB71KAIDsL/tv4oRzg/8ERWNGh+Mq7tGaN5o/f8UbWPV08kiXgZqok8rxde6aMq6w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BD4K7n9J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hJteY7Jw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BD4K7n9J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hJteY7Jw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0XbBL2479143
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OcHcMA+JRLaD5Kh0rZuCYU
	zuONUITqpfx6ybSNI25rM=; b=BD4K7n9J07O7PkJP8QIhn0PGsqXMnXbirGq8+Y
	r5laEvg0uNmdJdnecekY5m6nxLl0Jz4tlfUgZZCmzUKIEKCWLMALcNk0lET+Y1tf
	9AtF3vm5rJgmcS9osGGe+8uxpWVuBPd6RN6bpHPFu76M7vGgZekgdPGja6mUX4Nl
	fsQNOVu4krIQ5GHdAqTLpISlfgjwyjf+eTHrbER5XgM2l+uW7pGV6GmY9D1fzT/S
	Kr6dazW9sLSLSEsPd6jndf9L6Ual7EoYcXi/QH+waU8wak2HhJL3Fo8fcCyZeq+B
	wGZq5+dLIFSPcJQXscryRfiZav4NIBzxKLqJwbJ01PkdSTAA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjuu7bxwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:52:46 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-48576b535b6so108849b6e.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 20:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784778766; x=1785383566; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OcHcMA+JRLaD5Kh0rZuCYUzuONUITqpfx6ybSNI25rM=;
        b=hJteY7JwYF9bD3Vo3LeBnEjvtJR5LgQE2hMwTrUWj790pY87r1luqJ518Ay1MpjQjz
         six2sbjJ81hGCQJp2KjdRACBeoQekQCrgKUE2rPQHwoGoax7V5zAlONc/hS0u40vJFlt
         ZWTWCZGAIzPQ30L+hJjALxovEL/QUmUhGNBvHmHeNcXbVyeS9VRiXGAZM7b0d6GkMsYj
         KoRjf3ZBvM1bUtuBhbOw/vawRFlnlGpxUyArSvrV/7i/XrBJx5YK9ZpSJm+09FHRSRTS
         5LFBnc5rvDp4GAMxK/bzqwSkMH3k2DB09d0XpMtSrJ7v8qzNZnndS+KDidC82ObL556U
         DtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784778766; x=1785383566;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OcHcMA+JRLaD5Kh0rZuCYUzuONUITqpfx6ybSNI25rM=;
        b=Q33dHx6t9QKjefzg7X/hiOYUwLQI6jMKBEu3GphpQmo3tVE1BBWF366Kdr8dNkNUtT
         DTHxJIlE1nEIQkY/x2Bqa6/T/rArkN/5TM3TffZ/qh8JX5xdrV5U8c2STO0piynW825R
         CNyHJxSVKuLhC35wm1r7in+PD3SFSPct90+GVOfU1+7s/gtciX77rG33C22qgIkG9UT1
         aUY9YMY49NUDKjOLgE6HGyaVTzOKLWqVJp7suIergfGKN/jEtk4+RutDZtUdUo/tEy+4
         XhpZ+11c/aBVbs2LV0naphuAG5Bnm5GG2g/jQhOGnwztVUQugpS4UUr2r9Zl3j76sli4
         zipA==
X-Gm-Message-State: AOJu0YyAnScE0rWc+0DO0XKjXeHexXJWPDjq1HwUlWQFYjyuRlALUG6a
	wZt6LcHMuT+NtNyn6gNM0BHxPOhsNL6nQ4K4l8D1HbXedeWj3Jr6xrwtaiiqWQFQr7ITfwbn/Cq
	/gGTKSw7mhl5iUkf7C/t4TtDuAvRDhKTv8eYkm8vg1k3DSU9K2g2LomoiKiI9ly4eQYw6
X-Gm-Gg: AR+sD10RcCAtNiTVNhtq7CkUeZ7Xo1pdHHj6tLaSl+6MwlR6/M+AiUN6nk8QZAAbUqz
	01Jj/mawheck61ATO7/zeDNkp0LIVAUg2bYyXtLiPhmX5amcTwcuxFLQ/DZ0qaGAge9HhcvGcqJ
	OmBpyGtZzmyaTemP0mVgX+WJkKTTFod/45NtPQOGKIXPCCsZ+kOVuAMrdFQS2MpQBeIh1GPm5dJ
	N7VhCrGujS/aOlRc2sgP6nyHQq6VB3y8Z1jR9q1xniVX+KdAxr9nKZDNBSNrhXwjBjcyS3CROw8
	sF7ktiG6eW7AtviuT+16QBAgCqjBDF/J2dR+6w9+nPqq5M5uRPPQYem8FhO09Jsz8scsyHIKIWo
	DnOAs5HzrVwXyhzgrytU=
X-Received: by 2002:a05:6808:f8b:b0:4a4:1dd8:5e35 with SMTP id 5614622812f47-4ab352d61fbmr818541b6e.8.1784778765662;
        Wed, 22 Jul 2026 20:52:45 -0700 (PDT)
X-Received: by 2002:a05:6808:f8b:b0:4a4:1dd8:5e35 with SMTP id 5614622812f47-4ab352d61fbmr818528b6e.8.1784778765159;
        Wed, 22 Jul 2026 20:52:45 -0700 (PDT)
Received: from [172.17.0.2] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45766f238b0sm3302323fac.8.2026.07.22.20.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 20:52:44 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH 0/3] remoteproc: Improve removal of remoteproc drivers
Date: Thu, 23 Jul 2026 03:52:26 +0000
Message-Id: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPqPYWoC/yXMTQ6CQAxA4auQrm2Cg+HHqxgXdaZASZghLRoTw
 t0dYfkt3tvAWIUN7sUGyh8xSTHjeinAjxQHRgnZ4EpXl42rUBdNHnWeU8CYVvRKNkocMHSualu
 iW0MEOV+Ue/ke68fztL1fE/v1/4N9/wHUSe33fAAAAA==
X-Change-ID: 20260723-rproc-rmmod-not-crashing-d92388aa47aa
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Fernando Guzman Lugo <fernando.lugo@ti.com>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2059;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=jlWppMMNCG4So8M5/jDBMwGAOo+9cMnyj+UZA8JE2Q4=;
 b=owEBfAKD/ZANAwAKAQsfOT8Nma3FAcsmYgBqYZAKwOjLGPmXSIEMNb1IDVew0y8dQxp6Qeib/
 Zb6lZGLK/aJAkIEAAEKACwWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCamGQCg4cYmpvcm5Aa3J5
 by5zZQAKCRALHzk/DZmtxd1IEADJnVpQdpo44gSt79zRuSgntJ+9Oaay72ukWK3CyZbPDjD6/fH
 07LfljRoUZEDcfvO1DOYmWNy+GAQmmv5Ty2fekelx/ywRflJu/UXTEHZfhgMn1G1nyLX47pOwbT
 5azsNCLyE5DzDyhq+3T6SchE5fwY0MfDkMrr21b9+g52PKqzCB4QTuKS5eZGrB8LrzotYt9eagR
 HFB6xTVNswWzSmMCJc7N5pH5dr+Rp/zcoPbnCZt7U55VgdTqbhRGKBUhNXZA2DkDgmh/Sjik19t
 N7ZtEBewqUnTw1Wx+sRAyna5UPicniUMezaizwiEgddLsk+8MPKdaoCXKhzDdr8tsYWPjw6dD69
 HhzgYbvWtOFpu4k5ROlL4l4kCaKqHgRXTlTReKoNR7isUANw6hWKMztV1w8Fcpub7BcH2/1DFIv
 6EFXoFn2HOv9+w2OHLFy1TugIfjYnUTWmvKEU+8iMTug+JvZP1pYov1oIlZDEAb5Vu0ZTqdBPcP
 oxCNXLDzWdGpOv5vYBlQamzjfIhxur++CkCeWsFNqBZ0aVL+2Sob+5+tp/xtjXwKZsbNckfUgr+
 rcI07Ds26sXliU1GaEnME5xIoO4Qszw0o0WHCacvaUSZK32VFjWKsSlB4cEqGUXA9ouiU/T4UnB
 c2GjIcVr39iFAPbLKEBAHrMVc6ggdMVOH3Q==
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: LpqTL74-rphmrTw9BhhDFn1rOoomwuEi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAzNSBTYWx0ZWRfX/gXsKCUjVLG9
 tOfKu2GR2jkzsU/+TToOC9IM1FsXJLWoflEwMjFRjM6fzFxwG0NjtD6Erc1yb9WEGlnT68W2H6p
 8b82D4UJ393YqpB1GH4SIPFZnF145d4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAzNSBTYWx0ZWRfX2UPRdKR4OjO0
 BGz6QADbyOPqWQeJ9/QWH950EPYzbsIcL2ZuULSH2QGWhc4xEVPONlV4FgyUgk7rmNmLoALKaHk
 3o/jP5KzNzM3q9aQtwmUyL/O4HixvTE3i18XvA2NbVCCcMqwUxIVtJMzUh0zqnDhuuNaujz671M
 YcacYjJ6wVqWbPQOPnSeYTpPv9ZAun0Z0NYpGMiBwgMQuym/5+UbxLm8ZA3ou0aGxsAyKGZmC31
 mU1a9WRxqzpe3HndkJ3OByf1IxQWJddruJO+s4Ct8+CbHpV30zd83J1xBAHAdrNwLPYE+6UCdQT
 4ajqJvxsWkSrVx9oD5eFG8fKYpoMLry1GAN9NkQZrjYPKfQl4XR/mWLpIZ6K/2VoemW+QmRFVwB
 8RSIzlBosclNYb9rvQqQYnehcKFTWhntETld8aTcKjdyH8YUxUh4jIr2zCg7i8I4r4HR5Fuk/Nl
 uc2dim73dKexvx5ro/w==
X-Proofpoint-GUID: LpqTL74-rphmrTw9BhhDFn1rOoomwuEi
X-Authority-Analysis: v=2.4 cv=JuTBas4C c=1 sm=1 tr=0 ts=6a61900e cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=9dRw-LnU2mmOUw1Ut40A:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230035

Stopping a remoteproc that has entered a crash loop can be problematic,
as shutdown is only allowed while the instance is in its running state.

One effect of this is that a remoteproc which has entered a crash state,
with `recovery_disabled` can not be stopped, without first attempting
the recovery.

This becomes of particular interest if the user rmmod a remoteproc
driver in such state, since the return value of rproc_shutdown() and
rproc_del() are ignored, which means that the remoteproc is left running
while the remoteproc driver will unmap memory and shut down critical
resources under its feet.

Another variant of this issue comes from the lack of synchronization
between rproc_del() and the crash handler worker, which might be
scheduled concurrently with the removal. Mutual exclusion does ensure
that concurrent progress isn't made, but nothing prevent rproc_del()
from returning to the remoteproc driver and have all the resources
freed/unmapped while the worker is still running.

Lastly, another way to trigger this faulty state is to bump the refcount
for the remoteproc, in which case rproc_shutdown() becomes a nop,
again leaving the remoteproc running while the remoteproc driver removes
critical resources.

There's certainly more work needed in these code paths, but this settles
a few obvious issues.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Bjorn Andersson (3):
      remoteproc: Allow shutdown of crashed processors
      remoteproc: Prevent crash handling to race with rproc_del()
      remoteproc: Force shutdown during device removal

 drivers/remoteproc/remoteproc_core.c  | 104 ++++++++++++++++++++++------------
 drivers/remoteproc/remoteproc_sysfs.c |   1 -
 include/linux/remoteproc.h            |  13 +++--
 3 files changed, 76 insertions(+), 42 deletions(-)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260723-rproc-rmmod-not-crashing-d92388aa47aa

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

