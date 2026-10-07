Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E808F490BF0
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 11:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372717; cv=none; b=U7SpB8Tmuus7/UcGplHPDT1vT3GRxfiyST4QEaMUQwJm/o2wkjF+RSFEpLkVQJwI6RcxINEFdpkjHpSkvt+UCEMWL7A9eASrdykTb4Ovdi+HTw0nDJmS5lBtG5s6Ga7BnR5SKltO0eZDzQWlgnK2TN3LWoCjj5os0n1SbD9dg68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372717; c=relaxed/simple;
	bh=OJRJ4n6Rjp8IwVJxm+5+cJyXLWroXFMzWgufd/STv+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ur7yBved2ja1yxMJ9i2+g00ECEsyyTlvQD4Y6FniDcTuw8ceREO7kKc0nJxkQa6Wf+msJyFsnChUduVb4wZIT4rWPmZH7S88B9MoO0tKakXrwA/0qhl4rDKnvv1ucDdetuLHZMFFGKn/OwSsCtsxqQe4XCuKx80EYZ1EXiK8/pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gB+2k4nU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D9ftVWWJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gB+2k4nU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D9ftVWWJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BV5JK640809
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 11:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ziTRJRTyTHrXpykIexrVW5H3SlT4DMRvLBq5cG0RzyI=; b=gB+2k4nU+XxnX+n9
	czX54suZ3o0DkYYT11zAuwdCULDrb7tG/X9J8VnRTDvDgN3dp18utPmWBErIGMaP
	str95OM/0kIwrWVct2IVvFZUM+7ze5diQ4YkKbspWS6ZeBSn3kYOS/bKzQvUca+R
	aZQ6iJSDqh2/dBFpVGDrLtl/hCzC8lFKRtAqJ0Iw5SxBQJrSqqDjOfEy4997YK+D
	uWA24ql0Z9mzchJRpQmcBOOQ/xanKQI0u37f6iTarIDvCUEXSlnOWQx5DIWvPlsH
	xF4a3DjV+CVai0dQQnQDwmPcDMb56JCd1v93k3K7SBKJ3SIagJImomZd5BSaIsR5
	U3c4SA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c719u9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 11:31:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a4aa263a4aso4044556a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 04:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791372697; x=1791977497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ziTRJRTyTHrXpykIexrVW5H3SlT4DMRvLBq5cG0RzyI=;
        b=D9ftVWWJSLosGtz4EcNp0yXzjcJSm6+x4fFl9xd8yB/OB+h/pwZ/kU9X6jyz2ckSIw
         PiWBtare1k7TrZ8mQX9afcFHhSCx80Kz5EamS92yoE5cKsuR1LrbJPAG4z3SOxGv5JYS
         SVQ0ILUi+IHhaYckIy5yz+ULUBLWbvhyb2pLK3Z3T+PpHUeHFP84dx8tLR1SiUTrJQjw
         j+/kPE27mE9eAz0vz78YFJ9LOALpIEt1+GkO7+sc5amABpEN5jm5ttQnFo3ZMJQo0Ne4
         9xX6awTKv1k566CdRQTtGpfMcy5Wn9/ryMJYqbA1oUE9wFPGhpEr8noG9nln2BYplbKk
         hSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791372697; x=1791977497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ziTRJRTyTHrXpykIexrVW5H3SlT4DMRvLBq5cG0RzyI=;
        b=yWw8lxfY6x8CNh5WvpDWyHiVYnE+cy5TWnBDfzgtdaIelAEIxxvglXyE3LCEWMFXsh
         5fDk6qETZS/oEA7D2zfwyd90eeZZsWxyeACo/ei9OUxebDVEH75uCaKSsAspup+G4pFH
         0SXOh70ZKtJW/+m3V5m+OS3UAOPPFzOGn8beCQettIpWhtTMr3X2nB80kO+v3ajWG50L
         b+k0rXDxs3+7pilbZ4Yg5oROTCl9DELi0j1xtadl7Qaph+GQuYif9grMhDbYhfrop16W
         aPphsu1TSxvI0cEvAYxE0w+vNNlNeD5Tbwvd3rQbKszbeF9ljP9x+PruFy5O5F9SsHWI
         z72Q==
X-Forwarded-Encrypted: i=1; AKwUvBw/xAoOo9E4+DjjqYNnH0BPzbeZjaF0PRxQUNBREn38TNXrBqSEILgc354tmvAIMR8P+fn3gZe08MzObZyv@vger.kernel.org
X-Gm-Message-State: AFq9FYJt2R9UlkXSwQuBNR4HzGLZXZRxhdVMZtVcn8FaMlbcKooYsXyK
	JDsZ8DEw98ZIPDJwKg2RvLIo7EWORjeRCrOGKo8EoVV21qUYYPko0PKYHteHx77TDR7pcbBocPF
	ohIZ1uyb83L78yRNtxhQo5fRjAJhB1ZdTI4Cpn3enJpsSRczXsopIHpTOP758qBDS0C5F
X-Gm-Gg: AYBFou19iArMM0Ql9iC+A9aG81Ym8ZzZWGqGbjHO948DW/pKQ3sbud3WaTdh20ktG2w
	AGFUMu8gl/aLmvtKjyG5ScEej34ehAo19j22Y7sLX/C15mLexG3P4YzSBfK/IRERBHqEaWAQgp3
	W+aiu8sWJ3TA+q0dYDxPKrJDZ0azmzDkpTrvDMbkfmnVy+LYoHj13r+J+/4Of4eHfJ/gs1q7gMy
	+usgpafrxwcb4iW1ookrVJdfzCP1yKa//2rQg/lFuvDWWQNOQXxTK1V/jVjwYodPy8A9JvtfbpE
	F6cRHiUjOFsAk85Ba8wUbsLm4oLVKbbhLY3RcaQyiKD0zjTWdAiPVMzeIMzOBsKaP769Q01xw+H
	4HitoQEC+Jcv9CNzcH2nZ8fJFHMGRneEpCg==
X-Received: by 2002:a17:90b:5887:b0:3a8:495b:d65e with SMTP id 98e67ed59e1d1-3a8a0509324mr1473459a91.6.1791372697144;
        Wed, 07 Oct 2026 04:31:37 -0700 (PDT)
X-Received: by 2002:a17:90b:5887:b0:3a8:495b:d65e with SMTP id 98e67ed59e1d1-3a8a0509324mr1473424a91.6.1791372696629;
        Wed, 07 Oct 2026 04:31:36 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0d9sm8388515ad.20.2026.10.07.04.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:31:36 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 17:01:05 +0530
Subject: [PATCH 1/2] Revert "media: qcom: iris: use disable_irq() during
 power-off"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-fix-disable-irq-safely-v1-1-45746f9a92de@oss.qualcomm.com>
References: <20261007-fix-disable-irq-safely-v1-0-45746f9a92de@oss.qualcomm.com>
In-Reply-To: <20261007-fix-disable-irq-safely-v1-0-45746f9a92de@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791372685; l=1211;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=OJRJ4n6Rjp8IwVJxm+5+cJyXLWroXFMzWgufd/STv+8=;
 b=Z7GoTmlct4HZlMxWwHDHbrNoLZPNxj554mA5a1vTb/et2ymndTTHPJpHgH1Vzo+2yKEBfGRJ0
 VBrv65Ryv9YANHRUUFJWfqQJmH4ig4O0VHNeZgwGxA+S1eiXju8dxqm
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NSBTYWx0ZWRfX2EvYACdfuu+I
 pBKzA1YOuN8P2hf3u8MYliVWOzEabrGZTrzzBHbO744md3SNgkHX+05fTI7L0GjYIDR/huaJPmQ
 SsS2TJtG1rpQjoWhkoBJlUpQe+Zv5pU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NSBTYWx0ZWRfX7Ya2hKppbbTo
 WDPuGnsbxZQEbv+nfL/P5pASfk13uNdtsHsJ5TgBnS70nPGVBGXR02cWyfw6vKEGUCDyHNZCjXz
 JbV3ZxS6K9utkLo5IdfdRcUNbK0j6uX9shCr3EF8AsgsUs9FA5KdjbTwcJtsHb6EcLM40Bt7Ven
 zY/FKXhcQW0PmS0zxLbywypvJbAfrNHZc/OuVeOICzz6wx+r0+TBmRbGJoEoTbfUzcf1H1vwOyd
 J0zEuSGhrP1MbT8y9VE1TudLEi0H70bGcyWJCL+MJ9s4VhuYGhRYJYG7GOCoRmSv+IOdLuPm9gd
 qVCnRhnSoK2FG5/y+JyitoZchpp80Dv2jsGjh9VqRCEF/8ITY9RpRYy902tjvbGpK8ByJ0sznBS
 a959Ylh9YbNwLHg8dcNe4/sN1IGaVM3EHxXAXt15wZDJGV3zQiyHooM3V4ODGSdLtlks+HQMBij
 sIR6/2UkwxOcoDzgy2Q==
X-Proofpoint-GUID: 1rc27eEYkEmGFy-zLNStDkLggMPDztWM
X-Proofpoint-ORIG-GUID: 1rc27eEYkEmGFy-zLNStDkLggMPDztWM
X-Authority-Analysis: v=2.4 cv=LvYHWXdc c=1 sm=1 tr=0 ts=6ac62d99 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tjrYt7ayRFslicBUeoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070045

iris_vpu_power_off() is always called with core->lock held. The threaded
IRQ handler also requires core->lock to proceed. If the handler is woken
and queued around the same time power-off is entered, it cannot acquire
core->lock because it is held by the power-off caller. disable_irq() waits
for the handler to complete, resulting in a deadlock.

Fixes: b9c2215bdedc9c ("media: qcom: iris: use disable_irq() during power-off")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 243bd845349f..1e183fc4e58c 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -240,7 +240,7 @@ void iris_vpu_power_off(struct iris_core *core)
 	iris_unset_icc_bw(core);
 
 	if (!iris_vpu_watchdog(core, core->intr_status))
-		disable_irq(core->irq);
+		disable_irq_nosync(core->irq);
 }
 
 int iris_vpu_power_on_controller(struct iris_core *core)

-- 
2.34.1

