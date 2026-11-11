Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387962;
	b=SVeo7840PN9j25hOrMmhEktzznSSxM4C2K2yxuIqJ6dxmJS5ZgxkCXWsL9OAJJyG2PcS
	 dEfO40DADnBjqaYb/0Fn+xg9KdaZHTOufYaZYJqa1+naHAktQQFQIZowzu1jyfhB6V/qK
	 dIdCdfTEXCPIIrynjx08NvN41Ad2TiF5dvoBtRFNk8FIfa24WLcJdHSXNKmM5WEXYpt6X
	 FS2wD2VGCjF0Hpmpl4Y5SWLl7NDJfCDA1WPztSgfRPaliYtADV+F0AxbuS6rU2jJ90ax0
	 OCiTVdM6aOwL/0THethpOi19oxovhxUGNZ+Up1796x0Cx5rL4BOJiEm/W58CRXn/kPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387962;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ziTRJRTyTHrXpykIexrVW5H3SlT4DMRvLBq5cG0RzyI=;
	b=3XFIMbDS5HK926GLq6lx/m/0ym9g79RHG6WTNfMeCIo3AepEQwWZ6n//9haKvL+qgA6a
	 Z75oyxcJRl8K4JhKiWkVREkZJynb9TAzqneSpTxHa3qe9wMerx8zXL/80NSKOIwpvtTfW
	 pnBDyp564MH/vucB+Q/h9JS+/VrTuN7Yr6BzkYHsJpkjtxlre66TUD2lBcKEyXyEj6YOA
	 KChbMBYk5sm24qI3P+nILb0UK4SJ63NnlU/Da7gzsl7fJrSMq43ROQpu/VcWULAfJNmzW
	 wBBTTjXMVua0Krc0CiO3EW9YLKAkbRVxcxbsnh8j/dRUIEC0jYzZOUD/RNgG/dX3Zdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GjoqT0KD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VbN+f9CH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3726B606A332
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 09:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3726B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GjoqT0KD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VbN+f9CH
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KI7o1386366
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 09:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ziTRJRTyTHrXpykIexrVW5H3SlT4DMRvLBq5cG0RzyI=; b=GjoqT0KDHuZKIFSG
	gcxLqcDBpvdsaHA+ld/bNgzJmDDQjYjLDqBq+/DJowUtCWxj5cnbxpeMkk6II5H0
	7Ho3fKM5Wp5VOiIVGWP8ccQ+ekArZmiuWOQeDgNogB4b3SpZRYp6BMa+UojlGNEB
	dLf+tpB+OGejv3moOOPjKKbv+AikqpuXzLh9O+7W0fryn2MdskF1CNqWzdOklH+5
	YAHWmsmEyOkvnxma3Ik9p/6KQhznjXYYqsFlqhY10jWZ/nB+I3YQa0+7myXuIK2H
	JyT87ZcyfOgmuSUhwupaabDiXqQkbd4NEh5dv0hyQ+hqZZXkMKa1uOYl0Qng8Znv
	8IxRJg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnm9ruc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 09:06:01 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so5802426c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 01:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794387960; x=1794992760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ziTRJRTyTHrXpykIexrVW5H3SlT4DMRvLBq5cG0RzyI=;
        b=VbN+f9CHA5idfFemD0oK+BWaYpaDJv6Yxj7yQga1ipcYXx0E7C9RD6RlvyEdIIUFhn
         WJV6Do2TeUbFbluNgmoQFaRMsJ0xPWNdCnysHDsIvKEyjQAeGHk85zbaYoQ4E2H/AEwT
         R9qQ4nAM67Vh1pXouW8GvRua1YlwlVBNBrXRkES0AaFGIbBxPN2E+0+cORwAeQeN2Opi
         oLjf95+IWC0w0tRXmQ37rXapbWuT3xgh5Q+QrbIxArS4J35SMUwZEZE5JSPve4FF8+wy
         zil43Sb8XTkjYLLbhWWQuV1NjN5b4liG6ScuTtIjZETwtwJZP8KFy3Pb2QN7md0h8sbj
         xFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387960; x=1794992760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ziTRJRTyTHrXpykIexrVW5H3SlT4DMRvLBq5cG0RzyI=;
        b=f123sHkpwvMTeOn5A1aBKxBn5DjNTb7iQ750jHqiVEJji9JHJpiEQ39BVZRH19mq+q
         i4XticaN8QVmu9rAjyAMn/CihLn0nZ/l/uObe1dinT002htSUCPo3+6ytkOWYJzFwNL3
         TaADzAeMeC5lQXGYXQKA4a1dENeIbQ30vwPVEARHt3UzZ7TkJ4WdbFB1+EsixhbZDCna
         QRgRxNlZdbuaOpgycAmUeBbkAXTKubaxzXzuVRcN7Zo0bwWa1mVrNSzr707Mjk0Qcin/
         5VCUf8DoI53S8AWRb6T56LK8rRdupxa+D6N+jgkR+UIX/jBUWz/BkrFlLI8aWWDwDKtV
         mXGA==
X-Forwarded-Encrypted: i=1; AL+hErG3PF01UBEuKQYNqM0rjiTXarQFo3jWztg3x2hbQa0xrX7OphHhN5whW5+xYswxljlVw4bw0ycwxTwUq+On@vger.kernel.org
X-Gm-Message-State: APuU4Z9z0DRI4Q6peyQQFe74p6UVFcP+HxIO4n6GfYL1zlnDHri01g3H
	XNOPjPjgEZtVOfeNikYpmeMRki5Uqu1gzWEpccAOwHi3eHQICbvZ5EslkOS1337D92m0oeYra6V
	09FP/BO30UXAcXF0GLK4x+5vkKx6/bVlFjQCUCOiVNgmC3Zo4Kv2laSUzhIjQdCMVDxn4
X-Gm-Gg: AYBFou2amGdXjKi3U//HqrD4mQoxeNW38V3FqjuBs7zC0ghfwiL8ML39tJvGlgcqw1e
	0SYbJfuV5RvponB2O3SXzqB4jy/QyVOdfyd83vF8XVL7jE19hkvfnaRJQgwtWI8jg1n1GpFZtZC
	QTcXUUtXcxr/onkEWz7lFw6Sd9D7V6fzyy4QoNJwbgcUo2G3c5WfRjsFkEY6VP2ZgQaNChj+fUS
	PhqE30f48uQrCdjrbdDq3AgMrabIgyoQ8Nz4affpYfi3y5md+TOl/snOfNXv24Vr7RWiUXn5whl
	na8dK3oRLatbDdNQ5BcFPT04Rw05Oc7PhhU+kSceiFIPOsEpjX78sfePTPHNa4hBAx8rAq7oHSI
	ctST7LSzHH9CvtWsVtRpZXlsWsKh1eppXOsN03grGtAmze/S4Q0Kty6NOX0VErICARb+/taWdSE
	1F/MHONw==
X-Received: by 2002:a05:701b:45d8:10b0:143:26eb:18e9 with SMTP id a92af1059eb24-1b3c032d6b4mr1818511c88.28.1794387960071;
        Wed, 11 Nov 2026 01:06:00 -0800 (PST)
X-Received: by 2002:a05:701b:45d8:10b0:143:26eb:18e9 with SMTP id a92af1059eb24-1b3c032d6b4mr1818486c88.28.1794387959552;
        Wed, 11 Nov 2026 01:05:59 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2ff3bsm16915277c88.11.2026.11.11.01.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:05:59 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:35:14 +0530
Subject: [PATCH v2 1/3] Revert "media: qcom: iris: use disable_irq() during
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
Message-Id: <20261111-fix-disable-irq-safely-v2-1-8e13f68c2ef9@oss.qualcomm.com>
References: <20261111-fix-disable-irq-safely-v2-0-8e13f68c2ef9@oss.qualcomm.com>
In-Reply-To: <20261111-fix-disable-irq-safely-v2-0-8e13f68c2ef9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794387948; l=1211;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=OJRJ4n6Rjp8IwVJxm+5+cJyXLWroXFMzWgufd/STv+8=;
 b=OTeb3Fut9eI17/5ZEOA+56fDKV66fy8SrYjYvNGchCAucQVvQ/T0uPh0FhK+1CLl3eSZ74GjR
 FLwQB8Q7PQaCSEcrYuBLpEqbE880dxOT65FHw3rnqWpKoXDymmadW+2
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: VKgoSIqojvXV1ScCFIgUpSzt60PRKTrp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNiBTYWx0ZWRfX4I0JK0/7U9dP
 Xdd6TtE2WFl9Kffwj9NY6T6gKTyHiedGEvNVRfJ6yL1GQ0Pz32Puyn4sH48Dooeu5fvd/ni3Wpk
 QnlgII8i6o6Orte/AaDBV1Tf0TFHJvo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNiBTYWx0ZWRfXzz2XOZRsYbO7
 ufWPmegk3Lsta72jqJd0Ht5sNty04UKeWlMjY6Z7aRTEizN97nd+CpUi+wXZcuC1K6qu1fthedm
 yj0ao2JbAmFcPjEeovYdlb2jiVQF468TGJasIDl689DkE0EyJJwJyIhs8usfG5D/cx/WwbP4wvo
 XuWwNAHHz2ap8Gf4kAB9leEi/IZwqdKLtQxBC9F/6rqeO0/z0Zvp2KxtOje9DupWG3yJy3P60gu
 sh9XUJ3znlJV1QfoU9P5ZZjAM5t0p25MwD454MzdOKXA9Vo7DPLb6CqCfDVK+ZCBoNj1MuREaz7
 EatYc3CXe6XkhW6fr/FfGE4ZiE7BlAxGnVIcCssAIrje5Uv7jbDLnzTvpmFDuV90omQ8IFjJOfN
 jYIlbcW1rtpltkamcUXiQR2/FYurbo4RxYOl/sdIoDKw98OGh+H1Kb+ftOTwKiZ7OdWF9L9vlFt
 rb5XelTtM1lGGoyNGbw==
X-Proofpoint-GUID: VKgoSIqojvXV1ScCFIgUpSzt60PRKTrp
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af42ff9 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tjrYt7ayRFslicBUeoA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110036

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

