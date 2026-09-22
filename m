Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE24522691
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 22:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115120; cv=none; b=XfsqAiGl+KkKX5+K21ykPNycCfgH6SEFpXhIjlZzb2w5R0sZEdjoHumtvlpCgh5J4u8AwJBjjp+zta0Vy+1q7xr4cy3cxvNMubRuwWUzWPDCWYfMzR8/mvq0ErAvFom5q/tc6tf9gtekP9PBjdk6z84c+PxzsLKLvkvCelBhARI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115120; c=relaxed/simple;
	bh=D4fSP+2I7GV0JaAbRIzIFwfvzVtsM7z1Zzkl1nD9slA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ASQ19jxC4s9dVo45LytsHKRuI2WF69vpOcZrzlFg9+HElADQgK4CHR0cC+/i9adtr4DVskW8XX86zMYJyY3ZTgnMb1jX1qKrFea4ftKnwIzn8/y3mwruIYWDaR1z6+r30Y1TPoESjZ2am5axBCuYs0015dzOT78bf2Iw7FeC71s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dDoFKJhh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fA5SnZnn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dDoFKJhh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fA5SnZnn"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6xdp2033234
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 22:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WxXkdQ30yeX
	+tTvtNyi8jA17VuX8zmbTuee7qWRRWmI=; b=dDoFKJhhMi1PktsvbOXiMfvxStq
	LSpXoivaPOMrjsPwKNwQ1IsPPPFzwwFHXjbG7TFeYC2ozkL1tRIW4yYFqPwDjxIS
	HE9uqZ1Fa24o67a4dnEZcVpIlHxoKWLkKClGgmJrfMZK1h8MxbXdpvAT306wmv/4
	389ufXH9PFfUhP4adnjY78tjA/8HYKoQTPl4/B/Y0GQ7Re2expExUaG2EU9F64y9
	CaisERXqJSNoETLAggpXdDO517wFxgISIHxKbG1M0WPUj79eBlI2jGuMgdjHlSa8
	wzq/Brv0u0ALMWlEAxR3bG9buG9BAdD6Jx7gnqZBFQQuFxQ9alsPKKgJDwQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c19uf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 22:11:46 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78d25a8ff32so198933137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 15:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790115106; x=1790719906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WxXkdQ30yeX+tTvtNyi8jA17VuX8zmbTuee7qWRRWmI=;
        b=fA5SnZnn0/tCzDG6WLdIY0/UoK3EgeJ6ONqksrH1pepVtNV0wS7ic+eaUNU+JFFG2z
         tq3GgUkMRjfza8oazdOaIR3J+XfWqwhOHMobx7B88RqM+EiHmQcneu3eOuAn/P2Ouepc
         PMfqMk6TTMpbBxV7MuIRuLM4cW/yIf1u4zOt3F4VgEz+JDLD6Uhgb+D7lZCnqeZIB9JU
         LIha/qJuAr6mkESK9NCDx/SQrzAQiAyZ5DA9TeVq79lS7KBkszxYvCPcc39v44oYkprO
         fjuaTgI9OXXvacGju3XdKoUXD3oGE4FvqtHpZt+kBhHkUpsYoNcYkn5qR0zDSRrTtvzS
         CBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790115106; x=1790719906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WxXkdQ30yeX+tTvtNyi8jA17VuX8zmbTuee7qWRRWmI=;
        b=K5AeSYa+I8lYUQ2QnYJ6WJa1mn5T5DrYlYxw2d+zwkOg5nsjDsr/uErgysOeeTwHk2
         +sjHPPrubSox7DEw3ma2I+794V++4Uzmo2kCjjsBXfMrGc7EY6mTvQB93NSTOhHWvC/j
         H6tAQTIXE01nA+xA2DGzlArxVWoZRr3UG7MfBSA6iTfhBU4PUN7nKxVyaiYyE1wWDuXm
         rhFGvoRmjA3APTNKUh8OOm8cAOy28XtGY2LFlmV77ywNb2Tt8h1YEb3M9yq2+ak/1kND
         ckqxIfwlP1QTcnunza6sVP3UbOCuGHUprdODLtVnMb61SvUZWBJnl4jU1MOR+BShnLi0
         TafQ==
X-Forwarded-Encrypted: i=1; AKwUvByrZASqtTMtU53d7teAfB6fFJWzgL1rg0pnE9MWNPm1+AVJZiNPmJ2cvmHOx9Ub6yMrvF7kKkwEmm1xq9Uo@vger.kernel.org
X-Gm-Message-State: AFuF++kHpXI9I2UGpkAbij5zbKqbBA3frtJuFlK6ELmxYNUW5r4uK9J0
	1YRuVf0OVIVlwoGYL08L6P18RKJpML30oxCLV07B3vGIjMt460vJZ0woX/xLjFfVeb0tFzScwVQ
	q3ANjGYjt7BNmGdD5uy2UhFT5zIVCBL97+Ca6uX/UebCxr7OqJpNp9hvUpeLwzunlZsSe
X-Gm-Gg: AYBFou0+pq45ut97R7FSCk38k7kng9/iuJiSUgXDDs7TI0nYGr6iwkU1LQluNU41lXz
	6bRI5P2KENxSlw5U4pP9lwpS0uDxOhfQJVynEKKxG61N5og+gOyuo4MFNjkReVhShkoP/9VBrK3
	7nNn/VzKaPRv2Wdzf1OLyboGPAZGUAQAMBF/oqGMB7Ww08BKMY66LK4PKbfPxPq78QzdwFwmsHR
	gSxNaQCrea696yGpy0VEzuuDQ/P8pAOn+ii1cUABGRQQIOtiGVdDgV0tAC/O6ZVFPVg5teZv3HW
	4pLcNaxyzl0o0vVLTSvkPTsL3yijXVt01lGJ8bjwkri3Sb6VW0y/nd48b6yZwrHTXDZxJdnzc2p
	3rED1chV0GMrVhrmbA/NANpnn4x5i/L+JrBqMM+4GVpInQ0TbWgzuyqTbbQeLPCcO
X-Received: by 2002:a05:6102:4410:b0:7a6:b18e:6d5a with SMTP id ada2fe7eead31-7ac1cca4288mr948355137.17.1790115105865;
        Tue, 22 Sep 2026 15:11:45 -0700 (PDT)
X-Received: by 2002:a05:6102:4410:b0:7a6:b18e:6d5a with SMTP id ada2fe7eead31-7ac1cca4288mr948323137.17.1790115105365;
        Tue, 22 Sep 2026 15:11:45 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488688856f0sm1400270f8f.30.2026.09.22.15.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:11:44 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 1/5] clk: qcom: fix SM6115 lpasscc register offset
Date: Tue, 22 Sep 2026 23:11:23 +0100
Message-ID: <3a4e8d1115a46c45cb34193b6ceeb02891fdf716.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX4MrPwWBARcAE
 Q6vQk5kHNkyWQiesvcEyURUOciBxlpg9Gzj57rAtnqXoCryLLwJeL8J5fCC0yaQq0jzhI0Q5EeC
 qMcXirEfViGQAgE2y/JrVuRppeeRKv2MUozDdDSQM7r6jG0UA11fuaiX5JOrR4hfnHRk33IqmSC
 CYlo15kUzDEUeR4lewWB9+3J/ut3m0uKEsOhegzcWmvgltol/Lc0JeHrIRhF8E7ZIw/nYnInb1o
 ERMsbLQ2gD9sjKe9KHWIvhTulrLzTZZYmj64jL6ehXW8T/vs2nXrTonjg9pq2B9DWzz6Nwq33hB
 McojdHldXLSgnI0y7HVbJL1eCIVvmefIsHgpE4PToA10rQutkbuwupLWiyn0j2y7OJEsH1cWs8c
 Axw0PpyLZHaKSetGyz8/zMFMOqIWo+5fHutEmoQrmOfY9ezJaa4N+LmuJJcrN3KvUOKa0SX/GG+
 ToyJAledycaVU3HWRWQ==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab2fd22 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=g3NoBr1hRuMCkkBryE4A:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: xD5nDMy-hKxNDrSQwEqYsbaSbejIZG8U
X-Proofpoint-GUID: xD5nDMy-hKxNDrSQwEqYsbaSbejIZG8U
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfXwpUO7YWSyTgC
 kFYBWKlaNacg8Up2ZFlPqnLWWCQ5nYWpNPqy5WMn6UdKUu/KVu6433+HEG6M/MUvTLWdIWKuT7b
 g/5DUGeegRKs/QgElDuxL5CK0EUTkdg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220301

For some reason we ended with incorrect register offset for soundwire tx
controller reset and the regmap register max was also incorrect it was
0x1000 instead of 0x12000 which is full register range for this IP.

This was somehow compenseated in DT reg property which got it working so
far.

Fix this by correcting the actual offset and max registers as per SoC
documentation.

Fixes: b076b995e225 ("clk: qcom: Add SM6115 LPASSCC")
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/clk/qcom/lpasscc-sm6115.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/lpasscc-sm6115.c b/drivers/clk/qcom/lpasscc-sm6115.c
index 226dc02fc42d..fcc1512d4a99 100644
--- a/drivers/clk/qcom/lpasscc-sm6115.c
+++ b/drivers/clk/qcom/lpasscc-sm6115.c
@@ -34,7 +34,7 @@ static const struct qcom_cc_desc lpass_audiocc_sm6115_reset_desc = {
 };
 
 static const struct qcom_reset_map lpasscc_sm6115_resets[] = {
-	[LPASS_SWR_TX_CONFIG_CGCR] = { .reg = 0x100, .bit = 1, .udelay = 500 },
+	[LPASS_SWR_TX_CONFIG_CGCR] = { .reg = 0xc100, .bit = 1, .udelay = 500 },
 };
 
 static struct regmap_config lpasscc_sm6115_regmap_config = {
@@ -42,7 +42,7 @@ static struct regmap_config lpasscc_sm6115_regmap_config = {
 	.reg_stride = 4,
 	.val_bits = 32,
 	.name = "lpass-tcsr",
-	.max_register = 0x1000,
+	.max_register = 0x12000,
 };
 
 static const struct qcom_cc_desc lpasscc_sm6115_reset_desc = {
-- 
2.53.0

