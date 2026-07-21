Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84364CA278
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784645912; cv=none; b=t7zb2OEthabFqgZt70JpjdKIvKBPlstvu0uvOsYLaGmqhQ0sNdPvUgLAY0hZErRaoO5aHX3etisJSJAiu7p+NYXcDGFVm7T33mKPfdrThxlWtDbbaaSJ/Es+r1gTXf3teXePjh291trO4zZxwWUFpLEiDbpDHoZ28E1MF36G+sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784645912; c=relaxed/simple;
	bh=L4abhWl85x6DcJaIYDufzvbZjOuY0oUzE78G1+UyDnI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jn+qMyJX5i3PQ9P5GfjE8l3W+XTNnBSkQaItfodT14y2YFtynC70SZEN4HfLf9t8B7KmewFoEUum69l55FPrjYmGiAWsD8XTx8Wmw6UipNMtXZ1mLfqbc+1+GN9XTFDs8CwGgty/9x+ODAwuED8Gv30qMs7h1soZKeJ13geU89A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJ8/At8L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cyNUjJpQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJ8/At8L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cyNUjJpQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg0C71971306
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=swKDBNQtXNX64Zdmsoqnf8
	Uf2vRqJ1aLbRRw7zOx5gw=; b=aJ8/At8LLVCFLQNMafmADeq7R86pWfdEGtjZuu
	kEgFonNLsiLXE4vd2MG4kJ5PMVLES71DoxL0MQjuQMuO5olx3cx39bHLlqC3iU6G
	X6GMyIJ1NZGkQ0+OUzRahcNtRLXkoBX9rZz5J+KBwk03pYZnsyn6Nrs6fe8o9fEd
	E2hsYbf/JvdfslWFMwTnvJpZL+nuTPDQx4BaUpIRR0K4csawYp+cxuokZbamOsp6
	tORxBftrIp6ONzNCj3+4hwjcsbOsOShoXYLPG50RnxOmFQkrkhjmF08LM0kPUOse
	djhvLnrhb/kqXURmaUxhSf/4ErmNVIZuml3gDdx58yGiMSdQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6861fah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:58:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c26012cd0so200926821cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784645909; x=1785250709; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=swKDBNQtXNX64Zdmsoqnf8Uf2vRqJ1aLbRRw7zOx5gw=;
        b=cyNUjJpQNv0gYTykM4Y4mt1gxHtl2BUMVz4esdcWF7p74iBFWyKVHJl22m2WDK/+sM
         E+8G3kHvyJZgdY9dZjJxj6Zd5oafElxEQnf9hNfMC8Bw4qYsjOuxdIU2LXTHVrG6UzdM
         RN9sgk4Fcjr7dCXXO5kZxSKkC0dW5GqvXpWk3hnqmDgkGyWAlldSw6vDYYIgER8V7ytq
         hrzdEM/LTWXFJki6fiL1qPrk5lM/zo1BuGP2zkJBVPXb/jlL7xijkRVDIctQZKyThvwn
         WyG31L2U3DOdWpUzRJQKezYebOKRIPNL6orQGiPmoM1dI9AOe4aP2zLeQNd95urR6T9V
         pSpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784645909; x=1785250709;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=swKDBNQtXNX64Zdmsoqnf8Uf2vRqJ1aLbRRw7zOx5gw=;
        b=oHv5zheJcQ+3Bz8eBiGqg9o7nRxe6+mSDGTtwkQ+95fantVImfbwcBuxOAQCJVuWmZ
         nPh2Gtm/9xP1D9FJKQPhoPHM+q/+ckvqiMByv5zKDGhlOp7cGPrzWDiDb1+0HecJ/s7W
         zIU/DiQxGk+8MhHo+myWzo/YyBgp6z+BztF0+bmQR/Wxg0S4iJfZb1h5I/ZECKX+HZ+2
         2DSryK+RUTQtQLwt3DefO0YoTHDFjsz6IwFYQiuNmBLf8bL5X9pRpPdxHDXzstJblHkU
         5dCMNkLfMljGCmGVc/Pn9S1Uo6NHU3MQosvqw9c61VtcFO7eWl9rH1oX/B2cCNPcGB7t
         qOFw==
X-Forwarded-Encrypted: i=1; AHgh+RqhjPWonGeUtJyMn8O9CJQ1uJ7szxYv7VAye1VnnhRys46rSMqr7YsJzHTlTow9QAnm2E9Ph5+qrlfxXumy@vger.kernel.org
X-Gm-Message-State: AOJu0YzU4/NRG/lx+JId+sTZxY3HD/3V8gcreoRUtVftXW38G23eTjwG
	NyNBLjTZssezJexo3lJP2B505yRvZ+Eyqlpj8T7JpO6RVhqvYfxLkv4406WdLtv/sz/aT0V60K3
	5ACKhPKWB8f2Ut1X9GzPstCnD8a3xNz3r/4X26Pb1QhSzbmyXc2N9BGyC4cLupB/tMFNX
X-Gm-Gg: AfdE7cnfIj8/yHw73qV+NyP7htI021mddqWXDhedB8Vt//oomO4R4UD/B3sgGqo4RKA
	RBmtepBqAgeMwn+oj25Zo7/NPaHfBIZzHGpXETzRG0LXt5mwlJwOM4u/prK7+R1gtaJG089RjPl
	CE7DrdTiatB1BeId/5wrJ/tzPB3UcMZdiTLdINvr+wQsO2PM0w4Kd3pY5XbwTztfDj77xaTt470
	jADBXEDnCADp8bk+Aaxfn54HYPQKgfKtMsV2/FGXzBwPfeJNcc3tuEv+uHluqmUGEwB9Fp+utvR
	gqv3i23eqVGwt2+iVdCD0ZZcU3/f5zqsvsvRczd8bgoCWziDtb6xA/tiiJljc469jeiM1smv3Ep
	aErtK7UPsrWY/icOmIWEVY4wV0PD2AZi5wLT0566p2ktJ0QFa/iWtWaU9QkAObKFRZ+Ng0omTKs
	dVfq/vztqj8h2inIGBb+wSW2kUS5hmQ/OnY0J/VizFsxeLQMv3Y3M=
X-Received: by 2002:a05:622a:1196:b0:51c:1408:6c12 with SMTP id d75a77b69052e-5213daa1f40mr162762601cf.47.1784645908587;
        Tue, 21 Jul 2026 07:58:28 -0700 (PDT)
X-Received: by 2002:a05:622a:1196:b0:51c:1408:6c12 with SMTP id d75a77b69052e-5213daa1f40mr162759281cf.47.1784645903440;
        Tue, 21 Jul 2026 07:58:23 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbba0fsm5875369a12.17.2026.07.21.07.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 07:58:21 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 0/3] i2c: qcom-cci: Fix CCI clock rate enforcement
Date: Tue, 21 Jul 2026 16:58:18 +0200
Message-Id: <20260721-cci-clk-fix-v1-0-5eae78700da8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAqJX2oC/x2MQQqAIBAAvxJ7bkGlEvpKdLBtraWwUIhA/HvSc
 QZmMiSOwgnGJkPkR5JcoYJuG6DdhY1R1spglBmUNRqJBOk80MuLnnXXL8aRdxZqcUeu+r9Ncyk
 f0mcvzl0AAAA=
X-Change-ID: 20260721-cci-clk-fix-fe145b2acfa7
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1OCBTYWx0ZWRfX80XGBWdMerXR
 GLi205bI18g9g/RiIqcN9tOl5Ex2J3X6+AZ9xfJ2KpeueSawcrsc62Aa5Nv/pGTcyjyOiv38lTQ
 bvWtqW9iVnC1UAoE4Rn2alSK/80Eqz0=
X-Proofpoint-ORIG-GUID: pCL1KaYtcMFkeFcZ1CiQpoc5bjnFnPCN
X-Proofpoint-GUID: pCL1KaYtcMFkeFcZ1CiQpoc5bjnFnPCN
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5f8915 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=PiiRB4L06hF8XXeOMdIA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1OCBTYWx0ZWRfX1tL9GbCZ4V3y
 hx/P7QvV/SJudUNn1lqo6nfhGa2wwSlUfO540qgBBAm6MVsXLJYOXZf2l+ShP+xzvTSMhHHmnKu
 PsVREyDZ7Bj3S/zsxvCfXkMq7y4R7KyyqMctQXTe+wscoS2rXEtu2pDpDcF7PV+U0tlYE9JHqUh
 QLVbz+5rTcBbxxRe1CSfRLl4U7USNeG+pDO1ZSJFkSItzV0mQrR/gP+M9a9qA2MPswSvA0Pjnv9
 jAWislFQMesBI3xRVWm4SAUV2Xl1v5m7FnTzV+P2z22QLsHr2mG7tgs79X2Krt1cv2gkqIXusHJ
 7MlBNiQAm3msMZiSQP5errxMzLfrDsPTFlcI2+dUe4Qb73QSrHwfdP7kJXEHEkCcTld5jo/CniM
 90CI5878s104FqjhKAfZqbj+7FcdrOrIP+1PyXlwihKaYOrDw1RWNdgjJa9K5eou3NDK5GaCTym
 Vv+sMysJ6RDUaoelv/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210158

The CCI hw_params timing values (thigh, tlow, etc.) are expressed in
clock ticks and were calibrated for a specific CCI clock frequency per
hardware variant (19.2 MHz for v1/v1.5/msm8953, 37.5 MHz for v2).
Running at the wrong frequency causes incorrect I2C timings that may
violate the I2C specification.

A previous series removed the cci_clk_rate field and the associated
warning from the driver on the grounds that the warning was noisy and
the rate was already set via assigned-clock-rates in the DT. However,
enforcing a clock frequency configuration through DT is fragile and not
the right approach, the driver owns the hw_params and should own the
clock rate too.

This series reverts the removal of cci_clk_rate, fixes the missing rate
for the msm8953 variant (added after the field was removed), and
replaces the passive warn-only approach with an active clk_set_rate()
at probe time, retaining the warning for cases where the rate cannot be
applied.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Loic Poulain (3):
      Revert "i2c: qcom-cci: Remove unused struct member cci_clk_rate"
      i2c: qcom-cci: Add missing cci_clk_rate for msm8953
      i2c: qcom-cci: Fix CCI clock rate enforcement

 drivers/i2c/busses/i2c-qcom-cci.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
---
base-commit: fce2dfa773ced15f27dd27cd0b482a7473cdcf2a
change-id: 20260721-cci-clk-fix-fe145b2acfa7

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

