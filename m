Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965A640F738
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220547; cv=none; b=k4eqoT/0+wwzwCDCGvPiRbbK9BQ380+QXsNIB057JGjcDRScTbFQVYFwUOdPUBz/jDX4xlnzA+oVnkVJ+TE4aPdSB/OuZBWcG8uFfONMeVIKcrOeicTabgbHkMfzGV3HwsPM7ALVW3iVa0mV+we3VD0a8qAQjcPzI0VipJJz7cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220547; c=relaxed/simple;
	bh=vec+DMGrftoeTWQTfehcJjAH2/j53PBxzFUEMWg19XE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tDNZO5ejVH3+QcdctYtRN13LCtsYpDM/lILlzhtDEqoe/Q8LzMy4LxnJc3bKupU7qcfJyl7AKiWR/NchsAuH0jVRoTsG/it177YXrlKfg/eUigltjmbEyUyAWgpS9zzJSMNHmu2E4Wgkmq1cDu0WFyTe6S/yzkbrAEI8RHQLt/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z7i/g4JR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R3V0fPoH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z7i/g4JR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R3V0fPoH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6nGOO3732561
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xc9cRjhmIS2VG6NPtJVb4hI4xDqvEMv8EKXIDrTAkkw=; b=Z7i/g4JRisXoZzio
	hQ3Vhi1GT3fRFIGvkp+iYxBnN/gwUHht4iGCGFl7+qLBcjIidkuZV568R43EjL7V
	/q8nQyozJzdHLyDDaDXBLgN73TVCMelcyBHH+8rbMKOjuky/tLt1vb1k6tLz7ZVp
	f9u37Owg4eAx+0Jb56UKeLat9p4ss+1jX4XVvhAjdhpanOBxYdwLVXG+klgms8WS
	QAUuh0xEtzmcIFUW6DkDISPgO99J/gIGMVJ1j/qjy4qim2YCN3yinGbhDfcTv8Cq
	Bz5OYQTr/AW+obRui6s9kY3OkYtqHmMqNGmIUn8izFCFntP7DzPzfwCAroX2kskR
	JrxoVA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vn88rcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:08:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e62e3459fso234300285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 03:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220532; x=1787825332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xc9cRjhmIS2VG6NPtJVb4hI4xDqvEMv8EKXIDrTAkkw=;
        b=R3V0fPoHICC2oBQxsd+gxdqQOwTTVx8RVJNcPslS/r3jxY8AE/Rypk7OaOZkB/u4h1
         3NWKihuAueMsoJcL0iEq1n8v/w5sAC+2c7s2/B9/K37A/EQEEcYAIv0VBtMHB4up7zLI
         znkuxLBeo7/w9YUmOM0DkNOtbGg8PrbcibiYHEm3UsZOcvByhXPGGL1iMdVveY/MMeVs
         iNK7fp45Osugk+xEw9wj6rCUTyxXTgvJT6qIezWFmMnymnf3gjsKhDUCGSl47q3qTXyM
         VcT3ZTh/79y7hbHQrhS4DmCiNmmQ6ww3ZaRy81djURr7uj2IWXCzBiYZ9Ky9fV0SBfIQ
         NlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220532; x=1787825332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xc9cRjhmIS2VG6NPtJVb4hI4xDqvEMv8EKXIDrTAkkw=;
        b=ks1BmI+1fb5NMxzac22ebvvZHfiCG08EG6vaYah2mLNjPZERhyBLBsGoN7exNj5EcG
         IiZ9IdOSmXFXpQu0kIiKBN4LiKYuGbYCa95Q0nJ50ffasUjd3ZYwiA2fA34La/nkd95m
         QbR42KPkqFffHvo6vTIYdfZd7y3skPj35znS+8iiiZ6oc/7Vzzq2pJ1gCCZMfRnMoOwC
         s9LbD7lYlorsMzC7A5pNE4gdn9NT0sGJN8MOYHfX4Abianx0DgzMKOyWqHAbjsF+7GOL
         QFcr+MlkSPDyD8NNSvh7kA1D1866uf6A4QtBKZ/dEzk8tRlmmaIt/Koh2NYM6WkDfvro
         UXgw==
X-Gm-Message-State: AOJu0YzivHruPmGobBKlSmO7r7PE5hBX5YJIuynUN5SR8qSy3krniSuo
	9vQVRpWIqvuGIJ+U+7ynSegcYxcnmafcuCVDeddWBHleSVxSXcqdMQfSXfl/UwrrCl9mU4yDZA1
	e5vgI9x1x0ZCccqWbOFcd9KOgg2b+wsu7AOkSnuREAdVk33DY6HpXFkH2wdIWEV5CbAOT
X-Gm-Gg: AR+sD11SsUr8Zz8hSzOFlrziwcP6JtNuPCjXWASr8FmM34Wn+nAy+8UfONJbkSf6nYK
	L4Y314FGw0O7DoIRO6Vo7SivNXDjjgnGqOr9+s5TMdYPfjvdI+fqsqk3GttQBcFTycLs1/JCl2O
	5jSO0U9pvRO93pEnFqE/Wfwn45IlLoO/PRS5ZrMDMIX3iXjDJGZTtIW89ACM+wiBLiAXLFNLMeV
	4vn50slswYX9iHiOkey4CxPKFMpSlUOkkI3oolmhR911lc8++nFs0sj3Ex4Xm++kzvrxcfOni1O
	O6KCsrvr8WYue7T+/Tg40akNF7kIubRuT9u0cA0lfEwIwh5Znav+mO81rLJIP81I6CPbVJKhuvC
	7VEdE+ova
X-Received: by 2002:a05:620a:4094:b0:927:25f5:ee08 with SMTP id af79cd13be357-9371e6371bbmr904478885a.43.1787220531740;
        Thu, 20 Aug 2026 03:08:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4094:b0:927:25f5:ee08 with SMTP id af79cd13be357-9371e6371bbmr904474285a.43.1787220531230;
        Thu, 20 Aug 2026 03:08:51 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:08:49 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:09 +0300
Subject: [PATCH v2 06/16] clk: qcom: gcc-sm8750: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-6-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=733;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=vec+DMGrftoeTWQTfehcJjAH2/j53PBxzFUEMWg19XE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtHwuETN4WBvpEynT85i6pvE03AaNbHakzOIr
 mfsO6nDLzeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobR8AAKCRAbX0TJAJUV
 Vi3+D/9BwWzLJ8/BRbyQnXRJC8ipU3NtQLH8IzAo04Rj9DSl5IqdMXM4d9YO/6xy8Kvtjtnb/FE
 6M71k3lGO5Zi39sfYM0BiTKkfFoULVt0ssKrVH0jxOtpxYuZpfeZqOAgdpUkbe5tHIImet9o5k/
 uiWpNa1/k+3u14iqNPh6ukrY4/+qpFMOVvyaYVghh8WuNqa7nMS14c5F0EMTR0Q7R2JzB3HF16h
 gEBTSwSZ0heFb060l/ovIiUDABwpgn5AY8U+qWzQf2jb3snFk/ivJLZq3PHXwHCtpDxNUwGX8uK
 MqXbUKzuiQ7oJcxKMe4U7A0kdt5NCxwG4iettXjX1RGZcDrYRIot63KGmvq8Px5aQyepXlG8lrJ
 8YD35EOJzrR8t4AB0ar+G2/6Aoe2xTNya1LnWYmPlZAXSQ7Z9RVdgemjgHoUl9riQJ5bv3HZOSy
 V9nAJQIDg4Z9MsaqTPmJMdZh+JVPinzj9udEmx/yjDjkjL5vIRAvyyJ8cGzFJ3x6oiALFaVzzg7
 wkUcHfR/3ZMWwI1BZSKGm4i8+KfiM8j6u9TH1/PM3YwNefkWzSRtIJWV418WizcNRwlLKzwmTOr
 Jm09pK6BXW7m9xgcFpYanZEJEEsjdrPge+r/4NDswIR4L/g12w/cONJSwSRJBLPAkCtxxhxTniC
 fVXMh2scesXR/1Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX7D/OTBR6B2D0
 KMu3+psnceNp3nqVygyuPZJvnz+tONt2yFinTVsVTIDVUNe17PG8XhIdKqrN8Q599OM6LO3WJrQ
 s9yTEeW/SClI9zT9EkoLujOKjJvQcy42zHEQ7aaSJ6MVk/6bsVcrmbyttZMiu+bfsZFucPzaZve
 LCqir1ZRq88Jo6VS3/jYPBR8qMT5CceDHO6N4EmhO9oygBxji/mN3wAM9r+L7SE0ZOywdKRcbL7
 udIdF2EO8tltPIaj4SxCHyz9jTkpOZMPk2fZccVYT6p1GQTGPnChzsOfVym3IgYs2FNxfBNwnK8
 jBvzoW0vvsN4ewVmxWh7JcYf2I3vFNbVW65gr+Prt38g3UISaDursACRSGTVfAgeDD8qnevhU21
 w6jLCKnJCa+17I4vAstL/rFNLaoDVeOLpckd0+6F3kqtob0s4vYqTnK3Rk9M32bgaDefTo3/gru
 K25DUITmEsbK9GkQCLA==
X-Authority-Analysis: v=2.4 cv=KpJ9H2WN c=1 sm=1 tr=0 ts=6a86d234 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX+akFqf0O2rcO
 3wr/dVFig0O+SoYAdElePCEgJFoYRdhe5xnKHIBm1Z9kuU3KQFHTjQV+3bUaeTVRiMDPOOTNROv
 yTafZAMk5w3uuPi69MPsNqZyZKs4P6Q=
X-Proofpoint-ORIG-GUID: IAyLyPHbHmd31E8j9uakfCTt-xJcEoOb
X-Proofpoint-GUID: IAyLyPHbHmd31E8j9uakfCTt-xJcEoOb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200074

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8750.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
index 6cfe90122268..a4a3ece74f40 100644
--- a/drivers/clk/qcom/gcc-sm8750.c
+++ b/drivers/clk/qcom/gcc-sm8750.c
@@ -3195,6 +3195,7 @@ static const struct qcom_cc_desc gcc_sm8750_desc = {
 	.resets = gcc_sm8750_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8750_resets),
 	.gdscs = gcc_sm8750_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8750_gdscs),
 };
 

-- 
2.54.0

