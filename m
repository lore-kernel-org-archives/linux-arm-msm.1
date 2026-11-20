Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160559;
	b=wwDoDsMMB1m9zXK9fkJn88SX8klvjKxrGzjmaFNypXx3ImLvZRXaOtxFg9xzxCDxMcIL
	 xVJktYigPHeNQFyBzta0X0F6WxA9r/LzK4cwq/cY6tkqA95SbI0hF51YYqP9+n3cozCZs
	 2Zp58OxVIZGApiU2+g3EIwbrj4KjF2HFuFm2EtGvXLOBhnlNMtuySqj/6LrxybZnV16Dd
	 pSkZaSXb2G7+4PqI8Rs0YNgtwfGc4HnZZ2l8dEo6pWHcQduTJAqcmTxBxu63TtJsuTJZa
	 VoIBBB8Wyyc0g4qOZ8dUbL3RP2R3q+1YbPMUTY5oHNUqB37qG2JxRCO9Xt0GZDrIxlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160559;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cMy9p57SoBkXCQK9JJ0rBY5bQmP4zq/Gk+sldtVJuwc=;
	b=g3+ilcAS1O2nwODyZUHvxuZFqvhehWpSdakE+BJk36Zj4Cvg/ZPXWNgHmAW5ZWmA+d/y
	 ZTw3R7KT82M2Yt0H/LycvHNcw+KVWdCPPGLrbyka3++2tdI/kb4xMXPR8o5Mc4itQDcoQ
	 qZpnDvLkERxMbyxSH1naI3YbfW58NXS4qqtD1rPQVB/XS8ELkrNfuLtgXX+o+KLf57AEA
	 4v56fci7rtPTDh6pMIXfDlC6/Jy1ayMDEs6XnBSyMckmDGxQ3V/YkYd8B2daNo409x9Ik
	 RgyMdmmOsW+ny0pi9oFhRjvW0oFoXcmIi935S7m1wP+vvx99qkrTBZeuWoFPoX/LPrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j6sqMdt9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XHnZYRN3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD72606A339
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 07:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CD72606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j6sqMdt9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XHnZYRN3
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fEbR758278
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 07:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cMy9p57SoBkXCQK9JJ0rBY5bQmP4zq/Gk+sldtVJuwc=; b=j6sqMdt9VG0rG6w1
	RMdnteM9zDl7jpL1TK/myEmc0EpJuDI+JvKhjYJXd4oEECQ6Z/JjXjGSdValQPC4
	o+Kx840biickoJC/Q9b9xB7viUKi3wkTcnGD3O/E3g+o1kn065BDmBE9+fUVau9C
	WxBb26PbhOAKw34PSK1ll33sAWnlwsCs66vuWz0oQTrEm7h1zhYCcjb/l1pthJdD
	3W6Tw+N9jv5OY9TXqHl6/eA4h5VNVFYHkf3T6KVIgK5pXglNEqaMrE9HeffE4bxS
	5Wyp5N7fI7YOvi37TL8zl6Ge37rPat0UKoVFXBU2thh3MKvSg54FHamqMC7rxpLX
	B4Rs3w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5tj6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 07:42:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so881085a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 23:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795160557; x=1795765357; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cMy9p57SoBkXCQK9JJ0rBY5bQmP4zq/Gk+sldtVJuwc=;
        b=XHnZYRN3ClA2+MwlQ3Puo+bhgh2kw1wm8PoyywMaDV1gETp02lPvrDntNilfjA8ytj
         e+hYXGO7FB/N8PchCClJInVtsskSs64ekddtVxLrYXlymawmlUgVVYPLcJJydKVmf94A
         kU3m+GKaxLh2CWFxBBrRioAJ07szJ5FY2b95AOCZi+oh+/bUVI5zugzvoC5rG+ag9pYv
         BObtoQ4BPhcWz5PAQjOLhyo//g5YtFYod6C7oUaCZALods9Jyty/wYwC6E5B+YHxYMt3
         lfSCHBHXGXHAayC1Wvtw/IH/bWBFIi9bBwFjDyKKTCRRRNHgwYqCZuVuO34GJeA4yGNl
         EbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160557; x=1795765357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cMy9p57SoBkXCQK9JJ0rBY5bQmP4zq/Gk+sldtVJuwc=;
        b=aSkqBAeaVhmBXR1A4YVbFu9l/ua69WcEztW6T1PMXOqeRG91a/Yk82c+tOioEOyzgC
         Oc73mx2x8NTWvc+geC8sZzlojEHM06+n9axrymHS2tKByElnCp/LFkhgKSVgvNz5evtO
         iuHgJga2Y+CPJEdDwgm656SfVOwee+IktIf1p/3hDnYSyiBtCgfeHmIcdxjPxsE2CCLo
         4h2Y3jPzCvaBulQr66SxspmIyGYn2rn1MGIP1iZ3Bs+Em1dFrmkKtYu32c0LzIy4k4Mx
         IXff7CsHJGdDX0OKMzt3efe6MYSGsgLtOomnNEhT55qZA0Ab/PNyjZcgTu5Y8FNjdzW2
         9X8w==
X-Forwarded-Encrypted: i=1; AL+hErEuqbBvxJSWa76GkLn+IRm28WgIp+M2jrgE3q0sfaBgwUapa8SxwV8a1E8AnXdQmrJ3T+d1tG/V9p9v18eT@vger.kernel.org
X-Gm-Message-State: APuU4Z/JNiVBegWQ8ktlul45W95p7wwc60lc6tqZaKcWV56mpYD9Jdmz
	3/J8HRWbaD3qz2oQM6eqFolH2zTJYwTteZpJobJOW57sPXmH9un92fd//ar4kThHL3u2bRoD8Pu
	TT86PFdoG7nPkhtxVizBaLrTjYdztpNlwbBoy69naXuzgfI5dYhMjQ4eLrnTZ/DkJcH4x
X-Gm-Gg: AZFdTZdxrNYRunvRhLJoK/sUlCqkSmGco8sajQwsf7HY+LB2QxDzHSE3E2KSbHlIwhq
	l42kP1RXTvbedWUWSVlnkMCGLNqWnFZEOqEbyrCJaLIlzu1k5gBY8Uk79Wqx6DXHwhhrOno5C1X
	GqIPoY6xQYFujb1D+RJ301OMccxru0qMN6WLEumsdzSeJDVKCWoiuVtrpWUnvsiJ4ocrBwgrqGZ
	2coQNz/CzS8nCZxwDVqGsj/eT2LTl7FV4YuaYGHUH9O4ebM1NKjypD/fhA0CigYTLfIyE2TudDY
	YyBnTBOCoWZHiuH/A0iygk0BcL/wXpXm8RbX1J466pc6M0lzSdT8ET1uMYLOxDjBm4qRNh/N9hm
	4gX+GODE2nKDSSePWYx3BhCPbALla/0YCq8WonSM+dl/LXN5EDsmuTvchTsLc72Xv+GUBgybJCm
	wmC4HobWc=
X-Received: by 2002:a17:90b:2f8f:b0:3b3:bd07:665b with SMTP id 98e67ed59e1d1-3b41c9325b1mr1934252a91.40.1795160556551;
        Thu, 19 Nov 2026 23:42:36 -0800 (PST)
X-Received: by 2002:a17:90b:2f8f:b0:3b3:bd07:665b with SMTP id 98e67ed59e1d1-3b41c9325b1mr1934237a91.40.1795160556149;
        Thu, 19 Nov 2026 23:42:36 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4323bda5esm119935a91.3.2026.11.19.23.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:42:35 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:12:04 +0530
Subject: [PATCH v3 1/3] Revert "media: qcom: iris: use disable_irq() during
 power-off"
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
Message-Id: <20261120-fix-disable-irq-safely-v3-1-82f9561394cb@oss.qualcomm.com>
References: <20261120-fix-disable-irq-safely-v3-0-82f9561394cb@oss.qualcomm.com>
In-Reply-To: <20261120-fix-disable-irq-safely-v3-0-82f9561394cb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795160546; l=1357;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=2I+5QsaOpqK8JscQ/rWi2t79eZPugQinEc5cxAOStn4=;
 b=Wx127EyMvAjyRjgOqzwVx2yiz9pX6rf5qhqKWF/CjT1DMOOOVo5WYVXRERHNye62A7GbjlstA
 Aav2wVNPDkTDr1vrSR7/wTS7Ftb3WXVj+fTKhuPFjETmPEWHdhPHRV0
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzMCBTYWx0ZWRfX3B4ytUzUndkU
 KabokvpZTmkfWHKKgrGlYnRDsfeU4qFL0TNg+8+7ArK94IHFPg0pcHd1luuYCjOixLHz9kWQkNw
 HCkvvd4bnK9c+jYjV2MQoCWB5DLekws=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzMCBTYWx0ZWRfXyUAngwbfXqSn
 ESAN7aXhXCcOIRO08J9dVrNzXGTGmYwwN5aX01QfR5gdmTtTR9CiIvV467dK1DUTRyage7be8D8
 Q5cq2F+8Brwu0/0BJcZxM7h3lRP59wQ9u9Nju+8+g8CrhWy04vxjFWbPDZG93PMbnaPRJaKKqyG
 iLfbXueINBpIF7AO9cBsWRRUfquOGfTAVASpydlsve8ClQSLa5+PdonqJ9WWsiX3ZRt/ZpsANYa
 p1vzc+T16/KRK++Awjto/MTxJ0tr31VGN7vuJg/nx/BKOiK9uHBUKOPwSMJ88oQ6icklASpKvp0
 E3IGlaAscURdg7Trd6jz8WQBpWTAIu7ZgRjlKki9RPZeGU/z0/5VRp1ib8UxsYeDXzC0u7THVgQ
 7w+iCpUxka+j/dTkf1t5VY7b6p8tfdT4QgzbZDUoRUxJ9OIu+Azg0d+iduKa/w0WuIFIGB99Ge2
 ikzZoYgKJqtkEjFfSlA==
X-Proofpoint-GUID: iigCA7J0dUT9w7W6ri5m2FHHd-R6tMIV
X-Proofpoint-ORIG-GUID: iigCA7J0dUT9w7W6ri5m2FHHd-R6tMIV
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6afff9ed cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=f9qQdqNCIvW5R771ZgcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200030

iris_vpu_power_off() is always called with core->lock held. Its callers
are core init, core deinit and the runtime PM suspend and resume
callbacks, and each of them takes core->lock before calling it.

The threaded IRQ handler also requires core->lock to proceed. If the
handler is woken and queued around the same time power-off is entered,
it cannot acquire core->lock because it is held by the power-off caller.
disable_irq() waits for the handler to complete, resulting in a
deadlock.

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

