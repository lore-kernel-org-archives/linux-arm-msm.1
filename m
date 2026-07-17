Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4BC3A4267
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321363; cv=none; b=mVKTvt7+WSCikssCZkb+AOyjIYt52bNeYDOjh/T6gzaz4XuWmlwkEqV7uyn3Wy7/H/KIgjbbGhg9KoX0HFLPK18moSNqFJS4c4p5EtbPM6xEhiUs8P3AIgnCGOmGm+9irdSnEBoA9RTrMSwB1F9VY36YJw34fmAtt9GkbOA3alk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321363; c=relaxed/simple;
	bh=5jusFGwn3Qm4zEYz94oUfi+TSGTz9Tl8cBbI4B7YQDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gKIcDHEm2vJMmNy0Sg9TSk2DyYyxNKycIpD0TbAXOoMtDUScf/ZbSn9WSpCi3z8Mw8iuTRJgIJGIo+eGJHApoYkJ/Aqu3EEP/EDIbUqRVMTQ5y+5VWnJQ0XL/0Vr2FJCXE/OsieQzKW6U1hV3KoI5HHsvjKnFGFTVWlZ0drinSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RNkF/IDT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=asMdpM8Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RNkF/IDT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="asMdpM8Z"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtSA23901526
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4y99CIHhO7Z
	Ma20JkU9vG7q5Jf/ock0IskJ460LHt8I=; b=RNkF/IDTdB/8cjkd877OsA0iNJx
	Ijt0TcpsLXlUxHxa8yrB64zdCa2GR47qr620wPjFoH/yaYVDx6FFqxWuZwQcYt0d
	D1eNFOxcJaSGlY1dVrUfq2WiUXgU/C7kjw0z7OAPH3wjbEfXH3TJhepuGWuQ1i/7
	4Dw0vG5RmKKJYvDz96ryZDtgV4Ot9AYNxV7+i0wc/gGYx6dSBEoQeXBDY2O9oWWX
	V6laMNUaPDj0RzcwpDCNBeJaT1hjGnhc42agsPpJSIKAfvuqfFT5C1NDsyKFUkax
	7QebA0diTVVW3XpY/1eRTrftgcOxArw4ZekoI+y9Q85wMDV9e6BOP3f3Qqg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffqvf90cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso7197157a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784321352; x=1784926152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4y99CIHhO7ZMa20JkU9vG7q5Jf/ock0IskJ460LHt8I=;
        b=asMdpM8ZZbMU4U5CwxE3DNcfUOPtr3ditw2W+5cD3Uw3pKlHbej700+xuuFnMipCdQ
         C9zBTAm7QZJr0qc4tid1BpVOYhUCkrQW3UuC245Fvin8S9A9abW37vDA76jMraGUKYsG
         b5N8V6rmjPhItYomiai4GWU35d81KAlQ6Gb3cp195Y75MXSOm0a6XsrypFseJCgvQfoj
         cjmxrYiUTkHd2BXH52khAs59UxI4Vckm5bYFYTfA6tVUH85bbBXSRC9NjbspCFVSjMfs
         +8a5qU9TYl6RL6Zm7CFh7Nku4pjHiKZWtk/TJtSQd0ftjikz1lfYwdPw0saX/neLjfn9
         BzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784321352; x=1784926152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4y99CIHhO7ZMa20JkU9vG7q5Jf/ock0IskJ460LHt8I=;
        b=CVme7ST8kkXJTL/nJ1mEdIT57OUWFzTAijDVyp1yW1fkrqjAXeK2ptlziZ8Jt2FHrD
         +pGwmPo7va2pQ+pYNSym9PUZ3gPq9VM1v2NPSxlhogE0osriOObM4GwA08w+BEo816Mv
         R5PKjWzPsabSwJAI2N8rejgjevSzZEuLrmmt/FKUbsaOKMKyRaJSRW4npMFyiqE2BeRi
         PjU4vLZM8hIPHtw4qN0YJoeclFWG44ZQZlecn+ATFyNh5ocZkPp14a/Mx6jE2bEPfTLM
         TjzsVyFtjvM4gJl4S8PYhoqqKvpdaRFgP72bBjG5VFtzeJuPrh/UYvDMg+AcK3hbcVgb
         /FXg==
X-Gm-Message-State: AOJu0Ywtcq1ryHVpvIYNlsglt7SuarGDYFzn+pvU0NlQySpVOr5plVo5
	Fhijul4c0mi275JeW8r8S5AtyVXOHqFUIQVJMBC08uHa481RXSUuLIAuj8k3iEdtGeeAwxVKtOy
	O9uMMhUcrE3jFXXCGevAVZDRtlKm5QWCra2y9HtvsqThgaucm3nbHlxYt3Td1vkkzMZ39
X-Gm-Gg: AfdE7cl7A4XfeF6KRNyTE7sal4QJvWfTZzaDtTx8TIqCg+0kd9mH2nubTkLLMVZ//aG
	111pOWL0L+sUP944beo1lmZ9FHT+EB8YIKiNeuwSFik+4MOqfe+jHyZOnEsph6Q04bx+yDdF0QD
	2PggTAJpnJ4aXRLvP89/9BoXMVrWvmrH/c2nt4bTds/1QI7WL/94y5pMfvQ+toN9NGMeBdGoajK
	tzzGAwpIhIepISExnKB044dWKIxtkiOrNdPOBrv4llssk+moy0gEbjwegF6NdOBXcUJu6IQM7vb
	kTCyIqSCVPb0JoKh3z6LnY3VhoVAuSUEgbDTKSa7v78hu55CFRe+RZgLj1buWW2LmuVDGCsA1QK
	74bGftAwT8uv0ZYcq/gphMZLF8XZ3w6ZOed6a5I/2z7ba1g0=
X-Received: by 2002:a17:90b:1844:b0:37f:9ce1:cdb2 with SMTP id 98e67ed59e1d1-38e4b55aeebmr4534804a91.32.1784321351948;
        Fri, 17 Jul 2026 13:49:11 -0700 (PDT)
X-Received: by 2002:a17:90b:1844:b0:37f:9ce1:cdb2 with SMTP id 98e67ed59e1d1-38e4b55aeebmr4534758a91.32.1784321351503;
        Fri, 17 Jul 2026 13:49:11 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e3a11e36fsm3627781a91.17.2026.07.17.13.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:49:10 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 14/16] drm/msm: Don't fallback to shared VM for VM_BIND
Date: Fri, 17 Jul 2026 13:48:30 -0700
Message-ID: <20260717204841.26120-15-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717204841.26120-1-robin.clark@oss.qualcomm.com>
References: <20260717204841.26120-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _MNYut6yOTHCCkV16XhzuW_EABikuInP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX5mF6cLC1UfKG
 FKGRWIkyvVOIm6yJBOFAnlYnAqxmv4rWih4uhoqB1v8PShoO2H218HWmWng9Jp0nLwbDdhJ/DkH
 w6JaOc3OS/cceIUmp2Y/Ia5C0fCgp9TJTqr7GB4FfC2sAGHJNdC6+aGsnxsIBiuFlyksvVDPL2R
 cPQZu7PPoWZXOGqB167KbwOQiVI36miRtN/EZpLQoInv2JXWH1L1QE1bdZW/vTKTxNYfbB1I84c
 JsU0F6zj3LAjKQiYjrvmOzTeH4gJz1nAlOiaL5HomB/wAnoeKJMAAULzqPhsXswPbNsQWUSuw+h
 gSrzO++6Ewe7NYOX5CiK77WeIH60sWAq5FAHgVWExeOhAoy89ZiptHvBvays2lpNJarjFtmh2jh
 pvDBJItws974Xy1V2Yydl+OPa7RU9sV+pOCAtIgnk7xVeo0/MFq++Mal7Zo4HYzhoIXv95QUdC3
 qusuelZGoSd4H83dXrw==
X-Proofpoint-ORIG-GUID: _MNYut6yOTHCCkV16XhzuW_EABikuInP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX4ZwojauRbzLy
 gxUtkfozpcKMsw2mIc05XoxLLdEzgZN8eWCk+YZAjcGapMNclJHsah+iRnJHdH8POdGwVPQujPR
 XdyXeO+oirM4tapXs+g07nLgnGuolHs=
X-Authority-Analysis: v=2.4 cv=OPMXGyaB c=1 sm=1 tr=0 ts=6a5a9548 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=isCY8TonHXl0-fnU9HAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170214

If the user wants a userspace managed VM (EN_VM_BIND) don't silently
fall back to shared VM.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 drivers/gpu/drm/msm/msm_gpu.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 52ff72d8e17a..73d99bde26f1 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -234,7 +234,8 @@ struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx
 	if (!ctx->vm) {
 		vm = msm_gpu_create_private_vm(
 			priv->gpu, current, !ctx->userspace_managed_vm);
-		smp_store_release(&ctx->vm, vm);
+		if (!IS_ERR_OR_NULL(vm))
+			smp_store_release(&ctx->vm, vm);
 	}
 
 	return ctx->vm;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 18ed00e5f143..a1c4adcac128 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -875,7 +875,7 @@ msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task,
 			to_msm_vm(vm)->pid = get_pid(task_pid(task));
 	}
 
-	if (IS_ERR_OR_NULL(vm))
+	if (IS_ERR_OR_NULL(vm) && kernel_managed)
 		vm = drm_gpuvm_get(gpu->vm);
 
 	return vm;
-- 
2.55.0

