Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FA83BCD21
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 19:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790020612; cv=none; b=aVBEDyMbTX+FkPkvKwBTbCVarIkP3xEBVtX4BXLBF6V944SM5vK/f8nKuZr1vW+vQryJ9Lw6HIUo0JZ1rr5KiSGeaGFuhlSpRBUmpBgFr5Q7en7YMDXCemS8d2xodNPx9FdthPr2fzyiFyeJedxOauJ7o9DlFyJ98rwJKgDL4Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790020612; c=relaxed/simple;
	bh=jw+jxCR2PVIzNGd69gg1qpULHC1tzwtA+58JXC6Fwfc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Iy9sCrexN7qbNwjZKn1J03iL8h9FbNj3HaSXn0ez3yEremt9fDy/9r443SL0UHslApam7hujtUZLAPBoaSoH6CuS4htyGwUdv0EndY9Z68ynfCSgprNGi1OuJ+i361SyxAiMdvPkjmvhgChqFiAJiAzLM/tzFRqfKMjpTKHZq5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UeLh1QpG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WD+FvOvG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UeLh1QpG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WD+FvOvG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LHS2O92317887
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 19:56:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ADyJs5uQ6W0bY4gGmP9zRfg7eYCPdvL3/yY
	Ejb0/H3M=; b=UeLh1QpG8PYm6nysY0HtdeP9WrQ6VUqSnZ5VNWlQusSGu3K8xf5
	zfB9awZVJGina15NFxjMiBxpgF0o5f/mB367IOisnJcSzr9QfMoe8t/DNyvPqPJ/
	P/mypWjq/12AJLq56EnCWE2uxATmCjHoLJHZzmtFHrNppnCSqoygotXYkTFc9mZL
	Vk0US3cfvFtratQbdxgvFngiSCzBvMV4DyHNq6nMMOJ7VzdRnb6nkbAOuVB27+Y3
	O2yuf7TahNOwU+SXAYoYHR9K0uCjEB0wClb0HMb7of0y7Ccta44MTPRg0tMHPl39
	tBiJaZddbuRP2Ae5IE6heAeGLFjtYzzWIFQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d33t7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 19:56:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so4657641a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790020606; x=1790625406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ADyJs5uQ6W0bY4gGmP9zRfg7eYCPdvL3/yYEjb0/H3M=;
        b=WD+FvOvGcc6aKaQQTrp6E2LUj5LBvfd8p0uul5eTYv0wop0joRKXmaHX21XugGKn2s
         XOXjJP4rkRMUUqVmldP4QJ/6/Ha4b5ZaN+ietXiOS9B0opjt+wkjr0LB74tm5/Z5XQ1J
         qTCwOt0fJe6DSh3gpDdeaeqGhuhrqvAH8LQgWjYcv0bwhEuRN+txhhPhmR/FSVeA08BN
         FQWL4oL0ShVNhTlSHOy3pEK/ZXFuCBnep3zPCMipHT/GwF/mLQATQeCtgJxvge6EhAc0
         k35mJd1YOQ/305jF/pqKUPWDMMq7xwZIczGz6BkjHPSBYbxiuSikOtpxTlLOl99+77QM
         GkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790020606; x=1790625406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ADyJs5uQ6W0bY4gGmP9zRfg7eYCPdvL3/yYEjb0/H3M=;
        b=ZeBB4ba33yxhoB3yoOihCNIWunkBK/dkyEJlOvqCrHxXFf4prylQ+4ixSz0YuhQNjK
         tH4usiPEyXnL8mDEhqTBESctCoLiYqaGnTuvrhGGLuMgqYucY70jAfs0knOQoe3M5jK0
         vRovIGFFTmXvh9l3BFSy/cDA95LwQjRqomcqQ1XwtGe1xLME9QJHnDCQNZ3U+Q7q37W9
         T2mI1wyeBeBARGqYSef6G15xiQCyOOk+rw9m13GQ5qlN+5e1opV9U18zfu4dVfhNvIK4
         IiBJeREn3ytzsuXAakRkTOpuxsC7cXDWqVrAZskU1ITi/OljOFsk/dYJfy3nswR9z6cr
         vfIw==
X-Forwarded-Encrypted: i=1; AKwUvBwcTcBDQBwor0kzkIG/8LnZmH8feymXqQZXPqXwVCHKXKNXfVLsFUfj9W6MUsfuJ6EoT4f0HxnpJDeVRVHt@vger.kernel.org
X-Gm-Message-State: AFuF++nLyeosfIyfor0Pem5bumP34lTqfRQz2VlaDBIv+BJIydI05r3x
	LITfuTftfST5d26BkBqeS+YySOV/E4yNFdaaBeFu2jyiiIY4TCXOhTmt1RF6CXYVA9GrOzS5OGS
	RrrRQCg2x8NjOjieMQB2oQ5F2AlKcaub8NC1Sf03FlbME6KK+yJI2vQbuCpNF9V4IcB5+
X-Gm-Gg: AYBFou1UNpIGxRyOWQXSBoZBCTQKJmeWAOX4RS+6KiuJOejLGYXVOi4EOdF5+Xbm7Wa
	v6JmcSsBQv23lfdVfqxuD4Aaxp6GZ/oscwXkF6HQYeR2xMhT45pN9n5YXY91v9Bk2LkQR8tdI+9
	6GDmuYHaFHn+uSejPdsfrRFA3w90f9rXptVODzD/nhkBg0hsm3tAYnvQ2KOLgVrdgxE+Ps/EVXf
	Q0URmxmxR8/fcb3FM4soSew0BRH0n4WD9Uj4SjNKFc7YLUVvPy3QMb1GAxk5ysPpfJZv+F3r7Q+
	6Pd0wS7gEiHJv3R3HY4KBbEgXnn57Ltt+Z/F8N9QZg08uW3dx5DR6KNdF+dPvA0YwpRjfgHoM7P
	HCi9TqJcfTSNmV2Cibvu5Ri0NcQ==
X-Received: by 2002:a05:6a21:3983:b0:3da:ebec:69c1 with SMTP id adf61e73a8af0-3dd8c529912mr18191840637.24.1790020605448;
        Mon, 21 Sep 2026 12:56:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:3983:b0:3da:ebec:69c1 with SMTP id adf61e73a8af0-3dd8c529912mr18191800637.24.1790020604871;
        Mon, 21 Sep 2026 12:56:44 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ec4e584sm241142eec.27.2026.09.21.12.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:56:44 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 1/3] firmware: qcom: tzmem: Use DO_ONCE_SLEEPABLE() in qcom_tzmem_enable()
Date: Tue, 22 Sep 2026 01:26:34 +0530
Message-ID: <20260921195636.1925869-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2xiMwL9xmvrGALj95UDzk05luW3hg7E8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI5MSBTYWx0ZWRfX2OcGwAnUVEb/
 B3EHCGJnbEy44lSsfVV0XNa1Zurm65v6WRFm1siRU08skU8xIeEhtJrTky/C1PnOAmk37lA7SKO
 sHkoUYwj/JScMZopJdx79pWWGWYHIiw=
X-Proofpoint-GUID: 2xiMwL9xmvrGALj95UDzk05luW3hg7E8
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab18bff cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=gC5cvhp4vdJ13hJ_LlAA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI5MSBTYWx0ZWRfX3qAKtDPgAypg
 4i98G8yRKmI0vPCQgPkpOaYDOCIJCKtuneobjPlDF8rnM2DkCr7lvRgojsE7Gr0EC5xLal3rtM/
 NjDMnhind9tSCgxAe/FP7neRmpGx2AkrHp7sdkeeAF4OjbjDAflTEA5LJHfxx/QVZuCS8qyPotP
 wURUdTmM/ypLcpoWjvs33SSOaabbA94UJ8fMQhtOniaB5oKfy9vYS+ye7npeYouf40jnntXdT4N
 TictJejbYfldJ6/VJqEU9zE1OXjYW3ycS7QDTQ+zJGVxKA7diMITmk+sH3Jc3nN6NxZtXzMasV4
 WPGi/+61uDtB1AYnhsBu5uZ80xYaC3SrOobtmRsWpPn45xuVXU01ouwt2Nnqwpv5gTITcjS6j/l
 cjiZzS4eyjlSfgpV0wrNVK36uqMbrhjcDTp5NH9TfffrsilOrAtOovRzhEBKgBOlTMO0Uj53is6
 0Uqqx0/dTLKM59RyR8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210291

qcom_tzmem_enable() is called from qcom_scm_probe() in a sleepable process
context. The helper it wraps, qcom_tzmem_init(), calls
qcom_scm_shm_bridge_enable() -> qcom_scm_call(), which invokes
might_sleep() and later acquires the qcom_scm_lock mutex via
__scm_smc_do().

DO_ONCE() takes the once_lock spinlock with IRQs disabled, so invoking
qcom_tzmem_init() from inside DO_ONCE() runs a sleepable call chain in
atomic context. CONFIG_DEBUG_ATOMIC_SLEEP=y catches this on boot:

  BUG: sleeping function called from invalid context at drivers/firmware/qcom/qcom_scm.c:334
  in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 49, name: kworker/u16:2
  ...
   __might_resched+0x148/0x24c
   __might_sleep+0x48/0x7c
   qcom_scm_call+0x30/0xc0
   __qcom_scm_is_call_available+0x98/0x100
   qcom_scm_shm_bridge_enable+0x60/0xbc
   qcom_tzmem_enable+0xf8/0x118
   qcom_scm_probe+0x2d0/0x680

  [ BUG: Invalid wait context ]
  ...
  kworker/u16:2/49 is trying to lock:
  ffffa83e8a485e38 (qcom_scm_lock){....}-{4:4}, at: __scm_smc_do+0x70/0x488

Switch to DO_ONCE_SLEEPABLE(), which guards the one-shot init with a
mutex-style path (__do_once_sleepable_start/done) that is safe to hold
across sleeping callees. All callers of qcom_tzmem_enable() are in
process context (driver probe), so this is safe.

Fixes: 9941fe8a04f3 ("firmware: qcom: scm: Fix tzmem state on probe retry")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/lkml/5ea74dd3-7471-4c7c-9242-c2005312b1ab@samsung.com/
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
 - Rebased it.
 - link to v1 https://lore.kernel.org/all/20260806112709.4018596-1-mukesh.ojha@oss.qualcomm.com/

 drivers/firmware/qcom/qcom_tzmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 322fa928234b..4ba798fe01af 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -516,7 +516,7 @@ int qcom_tzmem_enable(struct device *dev)
 	static int result;
 
 	qcom_tzmem_dev = dev;
-	DO_ONCE(qcom_tzmem_do_init, &result);
+	DO_ONCE_SLEEPABLE(qcom_tzmem_do_init, &result);
 	return result;
 }
 EXPORT_SYMBOL_GPL(qcom_tzmem_enable);
-- 
2.55.0

