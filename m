Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7CC3BBFA9
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785401207; cv=none; b=klpU+Ujq38QblE/Q1WyJvOK5mT5fi0vepXsz9N9EhfusV31AnoRke2xyDnPdFVpiy6QniEK63K+AHrydPOQINNeK/aTOLPAKLxNlSaEvFUMzRMA1SuVKpIvdlaDk2vXN79ZQd5VgqtXuy6vkmvzuKgFCLIcp8/SPyDxd8B+ehPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785401207; c=relaxed/simple;
	bh=dZTXy0XydOZAV2sckwH66uceZ8zwJ/JycLe3/RTXEfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jhEEmG+DmPwb3CqE4SOlVcc3f0HmorqtciXG9rU4TmxO8CqliZAXPjM1yHNAKvw24nCJSladfCQ3cPcHSiGkK7xD1XzwIr5stSiZoO54Fm0yjUflmIDjYvdEoqsqVsRDJWRKf0yg2IjORdCOJp7GvY4x3Br1vuD7G3NtJRCbzmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CzCWb5wk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q76+qPut; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CzCWb5wk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q76+qPut"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8YOhf3991373
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fF52cQWjPiH+DtvNin77A2lBcwWh0jivkwdGArW3xAY=; b=CzCWb5wkjwu/oYaD
	ZO9+/Zp8ft1wmU3R4np3WCYmI6fs/3BxlV5I+9p49FoUm3tLXTsN5BvgAu8ZtIuA
	SzB2KzHQWT/yKIpiXTP0vvAOUQSfA7gXUjPDQU7Y24bZ8Nuv6GrD1kvvd9hwdQj0
	wM/xWAPBMleZ3iB1IwtRCosaAe/semQCbg6wFFaY6PAuXHJRgmhTaLHj11Q1PoUI
	TgpN56jAIIWdaKZ2FUH2m5ZEzIK6aQveGVNVB5UyAjGMjvZEYHPnoTdckkuytAaY
	3rGWGABK4nAyz1MLBeHrB7ySzfnCg6rzeUcvTNVmQFyWv20sHcv3Z1YfHmQEV0tH
	daqkQA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr37k01r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:46:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so2885635a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 01:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785401204; x=1786006004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fF52cQWjPiH+DtvNin77A2lBcwWh0jivkwdGArW3xAY=;
        b=Q76+qPutiez5Pwt6fNYd+4DT4fgXmv9UIevzhap6AEz35YdykyvMGc7neGwzcc2ByA
         nlJTSZgx9X54ml2kQMrT6JjaiENCgWNUIAs64RnsoB1pa9nJXHl/sznZKv9oQ0IV9tMB
         aCw63ydOlVvyP5HBLi4ZP3+y3FM/4OxuoYS0eob6P5BgbrnGibRh9GaXm3rWLcRVb5Iu
         TzkPIlt5IOdMu7GVQ7IgHzTrjxc8zo/nzpcs5bO5s4BvTjWUk8v7hg55WTTqHWRfJBkq
         /ZJ3jpBBk2FWb5hOulpHVifgzyPwg0D4crz3y+iaXvWqCid6RLD8BFJCYYtdlOJqo8FJ
         D72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785401204; x=1786006004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fF52cQWjPiH+DtvNin77A2lBcwWh0jivkwdGArW3xAY=;
        b=HeC0cipxriGp0LnZxZXsPNGwGPodGGozVuC1Yteok685tZr9yDoQ7aWJS9SAvAjOU0
         9kN2NPaplAq4PKhjhtCOVx5G0w/jp0ZMPzmAb5gq2LtQqvqJAPlpoGZVUs0q5iuZxTtU
         OZjpwPsle3Vv++ZU7efv55zv2M2zDKWfJVbt7/q6MmBs+mpSURvXuA0hctxjvfgDqY8I
         DhmagGxL0hza6k9p3qULaYCYu6Qp7CDnuKf0cei7Z3ShOjs9w9jLdU7GNg1R8SUc4eTh
         tnlb7c3+RhpgrDhBVvIlhRikPdh735CxRhhPrCntYTbsB4Fzy+ZJsPOnzCSN3SzxVd9B
         e0SA==
X-Gm-Message-State: AOJu0YwgzGVJTRTHdOAhf+EOSQNYvXd+e69ThBJ4FCaOgH0ZtU1/Sdww
	HPsj3y19y7pq1840pMEDYdepG5WYA5WnYzEcTBzMwTiXEeBYVuuprjSeiF8oLXE0ckQI6LK77jr
	YRWxBiqPOpXjeTsq1OZiEmLNddNYegtuwcPZGvpei5JH/EEMuJ0T+UUHCdBvt5QYL2fLT
X-Gm-Gg: AR+sD10oK4EeHv/tXot/zPbvVLp7UaYkFz02FxNLQLUKDmPIa2DmAZjDE1uD16UFZ2p
	63LgyX+y+HMoNP4bPm/ZwSatYMdcxrb9Q9cNr9rMp+WgEd1/Rmi3WysbRyz7tVh7YLQJhJlC9TT
	e69zoRPQVs2obWTdESCWoe1+dUAW91foiHGa4fjGtk6hugq3VN5N+UQtyvUKkOjfvE6EIPlwpdg
	djJS5R2wsswQXBjtvF6OrtUdhKZNsheLjayuJNPnEKQKEKudV9ZJkyK9TwjW0S7Z8R/1rMjKfu9
	OQoyeVpUCVFKsY8BGMWCnG9caZwJ2vjYgH8H9juJaPvZ1T6XiwG3E0Y6nGcFwi2dP9Z5TmmhbQx
	qLyOjJZQuG+h7QqIJCk4kv1nCW0fA
X-Received: by 2002:a17:90a:e184:b0:38e:5717:9cc8 with SMTP id 98e67ed59e1d1-38f9c033a06mr1428651a91.31.1785401204540;
        Thu, 30 Jul 2026 01:46:44 -0700 (PDT)
X-Received: by 2002:a17:90a:e184:b0:38e:5717:9cc8 with SMTP id 98e67ed59e1d1-38f9c033a06mr1428639a91.31.1785401204123;
        Thu, 30 Jul 2026 01:46:44 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f8150f674sm964480a91.3.2026.07.30.01.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:46:43 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 14:16:23 +0530
Subject: [PATCH 1/2] soc: qcom: qcom_stats: Remove unused macro definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-b4b4-removed-unused-macros-v1-1-2883fecb9e6e@oss.qualcomm.com>
References: <20260730-b4b4-removed-unused-macros-v1-0-2883fecb9e6e@oss.qualcomm.com>
In-Reply-To: <20260730-b4b4-removed-unused-macros-v1-0-2883fecb9e6e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785401198; l=939;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=dZTXy0XydOZAV2sckwH66uceZ8zwJ/JycLe3/RTXEfk=;
 b=G9L1kBQyclrd+usNyvcIpFD8WpsWxqeC1VeUMrZpaXx8XYyh0DNEpm0p891A5YULqUDQQni+Y
 CurvtE6ZGfUDOWH77NjCfflfmTuRxEEM5Xc4r3NaZIAj4FfYVba8BIt
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: Hx2Pg_lH_jVb1e8UyuNvWIeLeCi3OfRj
X-Proofpoint-ORIG-GUID: Hx2Pg_lH_jVb1e8UyuNvWIeLeCi3OfRj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2MyBTYWx0ZWRfX8RVjMZUbz/Wz
 Pmj2lHgBjkrN+cnVI3cb4Dbe+39CioT7BYHHqXuYbtwLo6U9nUaDVbSkFI3Uc2HQuZ/3tPHKa7Y
 MOVZdMgG664w5vcxeXN+CHEcU2Kl0FFrOf4lryF8KVk8mOYPpsaxjs7VU4ET64ScR+rs8nLakob
 ETs5TMLK7w6Dx28qI2vRbvIKu+S245+CzJSFCNQfCuX3m+vUTcPnPneTlTEr2a9AbsiSsDA7dAT
 10AAJyOFBkv0rHtZHX+7owwVsmBDqph0LWGxADD/44scIq7T3wseCUrYDvNXNHyAqDBa9yfLtoy
 mTkUsbjdJHzf/nk2yV4tiBT702eI1LicmjzfXnisUkTzWs0noQJzEW2cY27dui3Ht2O7PEH1ZQW
 zvOJg+xQdOuY2Lg+NzgDl+HMr9f55jJHxz/LfDATE4u+I7aQdpLe7MQEroyeZl8ubKYMPgfMh1I
 7D93bEYn3nDiLi1jTKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2MyBTYWx0ZWRfX2z2LNwSVFIeQ
 xslpHE5r64fzXlbBwQL5tlifhtg5imN3Lvhnzx2pTz2jG7hM3ls9L4xOJZbiPka2UcH498D/npy
 jIWWHrS3KbGHx2ZvesB81Fl5ppglc6Y=
X-Authority-Analysis: v=2.4 cv=J4qaKgnS c=1 sm=1 tr=0 ts=6a6b0f75 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2uU_kBgmWPcpXDuQ3SsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300063

Remove macros that are defined but never used, as identified by
-Wunused-macros:

STAT_TYPE_OFFSET, COUNT_OFFSET, LAST_ENTERED_AT_OFFSET,
LAST_EXITED_AT_OFFSET, ACCUMULATED_OFFSET

No functional impact.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_stats.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index e7122444f12a..d9c811cb9ef6 100644
--- a/drivers/soc/qcom/qcom_stats.c
+++ b/drivers/soc/qcom/qcom_stats.c
@@ -20,11 +20,6 @@
 #define RPM_DYNAMIC_ADDR	0x14
 #define RPM_DYNAMIC_ADDR_MASK	0xFFFF
 
-#define STAT_TYPE_OFFSET	0x0
-#define COUNT_OFFSET		0x4
-#define LAST_ENTERED_AT_OFFSET	0x8
-#define LAST_EXITED_AT_OFFSET	0x10
-#define ACCUMULATED_OFFSET	0x18
 #define CLIENT_VOTES_OFFSET	0x20
 
 #define DDR_STATS_MAGIC_KEY		0xA1157A75

-- 
2.43.0

