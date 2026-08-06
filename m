Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0393D6CC4
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 11:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786015639; cv=none; b=F1dJeVA3HJOa91Y3Ftu7AxAmBXbRCsuNoMo/IrJRC/MWQ9CkaxPSTJsO7ObGOV/5to8ELmbiCG2Y53x4hJccyOtf5usuWPyVl53y9NnTwHiPrjF7FP5VCkLSsheOcMwdj5jQJcr6jr4Mp3VylGuOF8YsyWHCnte7WLZuUXefYms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786015639; c=relaxed/simple;
	bh=eLxWKGBLkeDz1JqZfOpD3989Sf1YC3mQCfUbBD7ETJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rK8GocSfkHkuDcEukmCThZ9AOOn5zNTf5pP6VBF9tBs/DWp9yDGWhGdZDasvUPIQftyfroy8shhTAavJjl9tV/UlCSV27jRtRE/7tUMJzhJ9xT4UChoAVdpFkKSaHaklKfVifCJqtsIutGs0E9u0GQBUQ+kUD+h2J1o/mNlFqFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gHd+5V6J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wk3smVUQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gHd+5V6J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wk3smVUQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nfq3865623
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 11:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=L77CxXnq1djU2pUkBfQBfZiw6HJYKEniR5r
	AZJORZao=; b=gHd+5V6JIZMWbOyStYdT5QI3UAU4V7RLQiewfXcT+AnMk7l2Rzz
	P417krtiqT1YjMhQaYcL0Lm5i0gLfJDt/uHTO1QEpvUCfwOW1m1iZzoE2UCBcUbq
	/6e0Ua0JSd66d9J/3SCCZ4sHtCVpNMZnoGLbMkt9DJqmhrxVXxbxcqgECMOcClF/
	b9uiMasfzMPT6oTqYeo72s5bu3uGLznIffUUskflCCWQ5IQw3z7urpEuMwvtIHaM
	e/UfuVrxZxJWM/gwFxfn4Dhmot+F33lra/yxcqq6Hf2lF4npWi6L6sVrmwc1apQt
	DI0PAg36RGsTtoQm5RM4G7NT9zmJRmDOLGw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9f5byfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 11:27:17 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e375d9736so2720676b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 04:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786015637; x=1786620437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L77CxXnq1djU2pUkBfQBfZiw6HJYKEniR5rAZJORZao=;
        b=Wk3smVUQYUECDGfkkgCcTjdRsV5X49pITRzqbKsaFHZTvK50IFCePsOHDV8wqJLyLw
         oJXbQGr37iLTCmMpEbpHGsVFmajDhIj3vUIshCykfd3BSY9uyviEzOGzXxnSXLk5MAS7
         lIH8zH48xaOk3ZFO1Xx6A1q0i1hzEUQNO6NfFQAOb1t5u+G6pwsYq79i420frD7rnESV
         EH9XeYfjN/YM1VeTStr0SlM14EJEtoCpnS7w6x5eAjTvFkKzw6MQQjicZyQf0A3u4Nbo
         3SByEy8mO01eueaoAn6gZzPIaErH8+LK2w9tQ2qWKGYo1KtOo5a+fVM8dgN0//h2mbms
         bE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786015637; x=1786620437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L77CxXnq1djU2pUkBfQBfZiw6HJYKEniR5rAZJORZao=;
        b=IQPirt6oRgt7a/xg/YsECnQoatV+zGormv1QarrAzOKec4GIuekBiEc/mfPR3v8eBM
         31CQ+jWum6FuNHRmbnYPQDXi7VOoouBpBcTc3AZTgsJKDbmSJ/otwSvQstyaLdimAo3Z
         ccfuXMNTM4xJgTC4MJdVWTU4nKz8AWrogFwBbSnI4viJDskwrDaoawUF+K4sqwJlC9Ht
         iwLGGSkkKmwUlcjW87vFMw1/5lTGjumpByRW4+FcTR5ZxFGKfj6dfrtQXphbFzgJsPjP
         bLbDpLqpdI01pBInMw6T0EkjQj7lUe1kzGTZZ+GuD14CXeAGlDLZhFCMzzSbQ2lTtm17
         wWKA==
X-Forwarded-Encrypted: i=1; AHgh+RqAU2KWrP0AaDGxWcaL1PmpEiyTG9K8JvT8QoDkJ3jqrmzLQubGD3rQuT/Rx87Wwc0zIU5BlebDvoeJoEpx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx59ZeqOxIN7FQc7sYWYhxLBYEUkCSOFFTMPSYkGc/CLTw1DxfX
	0LFzgPB5SkTbZdZq75JAkuiHa78Qic7z508CBfROIDsh7D+wagyiJ5iM9sDNzDst5HRwDZCULMg
	V1QzZCVLaVfwhdvA0ue4LRV3in5H6zqOWiUraU9ZxELYjpvR4krs5JZkug+s1ZKrXgHPB
X-Gm-Gg: AR+sD112oRRmUUTiMmyY91fsL6e4eE1bxqb3PmEl/G/+Klt21SZyq/C5Q4okR46gB6J
	kXJQIvTWEQ0Msc+uoPC7PPb5GeKTI/JTj/0JI+AwCB51XpVTwuldMA19zodLOt8gteuWksvznm1
	aoJDpBi6IuNdR6kh9PFsh6Wpi9pGs3792Z46+lnK+G3QFvX0PBhE/3sbYTcrlz/39G7ZOQZYoxK
	zC1p9q94ku5tZWWQugXF0ijTZvH7MQAFxn0YfwK9bGhFd+6W/NQEjWiNY0w/+8FrW4JoqsG9dH9
	H3Ofn+psyE0/Bw7k05KEfCZuFHgNG7sQWG5lY0svhjpzMKv5TOTGyxW8V3wX05K7AZHFIRkmlDo
	1wFafjMPuBvQ3A17qJamPcyqsbwg=
X-Received: by 2002:a05:6a00:3996:b0:84a:2fff:ced2 with SMTP id d2e1a72fcca58-84f2e0edf21mr13222381b3a.35.1786015636673;
        Thu, 06 Aug 2026 04:27:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:3996:b0:84a:2fff:ced2 with SMTP id d2e1a72fcca58-84f2e0edf21mr13222328b3a.35.1786015636119;
        Thu, 06 Aug 2026 04:27:16 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b2688sm1216484b3a.22.2026.08.06.04.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:27:15 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] firmware: qcom: tzmem: Use DO_ONCE_SLEEPABLE() in qcom_tzmem_enable()
Date: Thu,  6 Aug 2026 16:57:09 +0530
Message-ID: <20260806112709.4018596-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0uzJOlyRHQUFStmWxDuO4E9svzadgg3D
X-Proofpoint-ORIG-GUID: 0uzJOlyRHQUFStmWxDuO4E9svzadgg3D
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5MCBTYWx0ZWRfXxXL7lr4JAzfO
 O7wkAsMSZxj6+iCQxrTyFv4HyTq/W5FdMfnvpJuNuICG5esFTP6+kLzJFhMDs7M82qmxG3gglWW
 Y2i0rUbJmst3bLbeB9YT+zDlgCzO5e0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5MCBTYWx0ZWRfX0kQZdEAi1k+W
 +zEhZjJk1Sgd5bpUCri8fQ54WiV5J6pyZcd4ltq2s4XX2He8StKTLQH6EVeBgrjY45YA8eHkS+h
 7DHVm/ce+2E84Nn33BMWAnmFbqSNKFyu9nvb/pplqigEtxH2FenUI0Ww3I1iTgZzbn5bRH55FgB
 719UBW7kL6Wlo/B7Ct+e80Uc/bUHqb43jLKNKqN8oUtGdKdDEjHgWr/I0Dv2dZ82TCgS60LIWQ/
 WW1WiaxmuHF+6qtqzW2y1odOycDoY5V5DF/UlAPf5bU2DyuCI95hgRk5FVnZFtMVwQvn8LRQc5d
 1ROFYGDql40ORHMd5oed9irISVBwM11xyoSm4Hq30I6t6DItMy2OE9aUEauo4K+sYo0a3S5ypvp
 Jbxz0Qa/d379jD7W6FmKHa9MDpVQRhCHKzFi7Y3Eaz3q9Nni+vfMu/WVEjb++Md1l6ZotrERolq
 yA0NFSa+7KKdibrrG6g==
X-Authority-Analysis: v=2.4 cv=d4bFDxjE c=1 sm=1 tr=0 ts=6a746f95 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=B3sWOgbLTSL5GjQ8n9oA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060090

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
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_tzmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 0fd9581275f1..ebcdee3c5975 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -518,7 +518,7 @@ int qcom_tzmem_enable(struct device *dev)
 	static int result;
 
 	qcom_tzmem_dev = dev;
-	DO_ONCE(qcom_tzmem_do_init, &result);
+	DO_ONCE_SLEEPABLE(qcom_tzmem_do_init, &result);
 	return result;
 }
 EXPORT_SYMBOL_GPL(qcom_tzmem_enable);
-- 
2.53.0

