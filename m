Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560572;
	b=AaC0WJAJqcGqWS7GfnN4EgzGbZN7NfqFaT1w1vUwopy2UOjQMrOU28xyOC8nhrV+WJWk
	 nnx/mqaypEC62m8F+x4K7vbiQxH8IPDX6YObkzpiuvTYRq8l+SdfkgSuckgq4jXlk2jR1
	 VufL5Pn97g36CfjbML23RlVMiPlKG5Eb4+p9UAd+ScpmiLkcG4LDthoI8nXnoF3AimlU0
	 lRN2Rim5rvGBIfDNKqs7+3qz2Jfs24RG7gMNlUINibhu0JhKt/+fDBAZPhgFPbRPTzqsl
	 Z7FyhFZRNxtLGrpslH71hOL/V3e/NAtqnjrGMWRqKkq9l6mUOMUUQEh1CvAIo6zARfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560572;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Fbol9KQgjBLhvDCLyK1r7itbX5g11Y93wLPdLSd0Wxc=;
	b=lpAy2qBCPCtbk7gDpXT5HOBn9fhADHg2b8mHuGZlL0YmCc7RYfP5uWu7zP6k/zqdjDD6
	 xVTUogZvhDboMME0CLztZOrcXD2XnCewYSAtXuEDLQAzvMPKpojOltYmSD3iEwkBC27n+
	 IsHV7z0eYLorhl3InNkfh8JRx7E86wN4zZNRlifeCNXdTYX0WINZMTiQqWidOfOMlV6ZX
	 t7p7HpTHB4bc8TSoNyjGH1ouRQ8Xp0WYv4a8PG0tLgzNZdaPat0RFg56f7yzi+ha19YJ6
	 2vgSuQ5ZYIf+0mYUibaobdyXJcNtHU6M5sjk3SXj/VB/mw+JHYjMFe/2+pb30jj1GBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bN4OS7CO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JGLSBF4W;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888F2606A323
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 888F2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bN4OS7CO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JGLSBF4W
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V9BZ074775
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Fbol9KQgjBLhvDCLyK1r7i
	tbX5g11Y93wLPdLSd0Wxc=; b=bN4OS7COCJmC4DMxFjutj4qAKGUSnmOiy5py19
	b4X3kRxlNbyZhVzr4F5deb0DNpehGw5GPkl7rxVQA/Vkoy+a1Z7n8mlWvm9AMXYf
	PvSWI8SFPZeVGZV/P39TWUSaubRqreuaMAiJ7HvYpIEjE+eOBL+v/BI9ehUyKwT4
	GdmVeLWVMrJcluMu8dYRpFjPDYDIAsd15eTph6ZBBKrYlKZg8//ehtsZxyIpQq6z
	rZ0jYpO3qwocXlJ8A3aml3Fc1+luh6uYmao2pZFvSFLC/OVOlxXZXEU9r/k/1m83
	i7mU7rKYWuxEkW9R/0IYB56hlC4Xu0olDcd7Y0XQwDmc7+4g==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufhmdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:02:51 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ece1a3bf7fso54365e0c.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 01:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794560570; x=1795165370; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Fbol9KQgjBLhvDCLyK1r7itbX5g11Y93wLPdLSd0Wxc=;
        b=JGLSBF4Wm3lO60tG83FA0hSy+RzAR+6jCO7/Je4MLj3lr9SwoRkNwBO6R06atswoJv
         3Gm/MrnpKrgGnyp/5uAzQcZJvEH68SIe2Pv0DrjHObBbflua2yBLQqdG3J8OE9yezNMQ
         3bbuIPZ8M/fa29Z7UqeUYyJYmXkg2MlhuzFh2OdHsikgzKGW3FoKt86VWTM29b+qyYxJ
         Zl3Mcc9i85OGbnEdsghrb3OdKUzA4xFS+OXH4k82RoWeHv7BO3tnsxV/1Qo9d93Jjkd2
         UBumJGrMuRye1Vs4JnzNsJZIwvPHSg3lpmZy6Yt+9B+vr8f3yQ/EyOWM46D08+4Q0RQC
         Fbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560570; x=1795165370;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Fbol9KQgjBLhvDCLyK1r7itbX5g11Y93wLPdLSd0Wxc=;
        b=EHQ4JM8g0ASR7M0gkIjSlglgD83JI4Mx7HRct5qTjLW9DeBHBOG3e/54RHpX+jdpDK
         j10SkGiOn+jqXLudnNTiIBQYmKXUXrXPvHd3P+/wCH3PpOf35vxQ0ctoILQf9BfpWmo6
         nmi1OrrXVnIOMjiu9rXgdH5ux1zSIlKGNnm7uDP4XKL4DRaUprJlqWdlZpaLsVdn4Vih
         1XKY0Kjzg3THXQMcvM4LDAhofxhWmYt0kULlWEdx8Jhady90fzjEJGkR7DWERJDNInm5
         gjZLpUR7kpeNWrFHcsaq2xS+6Q17e1EomO8IJi/UvEWvPF9Lkn2GuERCwNPx4OhgSGFY
         CHuw==
X-Gm-Message-State: APuU4Z9WX7HUDPR9KHAIlAI1i7s5fONxISoQ1QZCgWIuKmoRFi2kKzui
	d6ABoJXAin7S4uESGjrtj/rtYqp7Lyutd/bG1BaLoLSsxpV2U3UbmbhjztkgJbHYwLIFiblwkWO
	2vtG3smuH9VQ6SStyh2CpW+R8Cx/oIq3iR1PXqm9t7gWXeRzJkSgWCIb/7LEfoZ9mPSyS
X-Gm-Gg: AYBFou39Zj98Zoe/6fvjS8IRQTySjEJEf5AJMXjwA9ZSsyo8i/PcmGZRquwTAgE1neU
	uoVgSuXV9gD10LtuCUjHOJpbbwoJbRUx0wgnmQ+xMP7dBBy+r4im6UbSKIrNZL24BdOz/nKMbzQ
	yWV/ItlMHCWnEUUJv199miHMTKyDDsc2tp/RE1fskRkkDmAxwSekVagx7GX4x7XnLxoRXCmajJK
	xg+gsPOC9lrybSFbttB0iOwujBiK+krR6SSwuOCWHzxsUd+tfFcifqIjWfarNfP5ABh0npF/jX6
	MUDe/4TI8Okt+iTDinQgUCmDnGaT/AsHFpGv6ggY80BNBhtoFiD557I2Bn9YYkcqXbWoqOX2c/A
	QvzrmyrFTgM5LN0jfsYCT2TY5ZQMrZd35DQAmaWeUSR90Lhj0HomFOB5Nuw/0MR0X/83roRtL78
	gDQ53w+es=
X-Received: by 2002:a05:6122:a5ca:10b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5ee34654f14mr380114e0c.1.1794560570261;
        Fri, 13 Nov 2026 01:02:50 -0800 (PST)
X-Received: by 2002:a05:6122:a5ca:10b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5ee34654f14mr380106e0c.1.1794560569794;
        Fri, 13 Nov 2026 01:02:49 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:cc30:ba36:15ec:b660])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm4683815f8f.45.2026.11.13.01.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:02:48 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:01:27 +0100
Subject: [PATCH] soc: qcom: llcc-qcom Fix SM8750 settings
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
Message-Id: <20261113-topic-8750_llcc-v1-1-6536cb46d7fe@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAObR9moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Nj3ZL8gsxkXQtzU4P4nJzkZN2kFCMjixRLsyQTU1MloK6CotS0zAq
 widGxtbUAPkfTcWEAAAA=
X-Change-ID: 20261113-topic-8750_llcc-bd228d96b455
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        yzddMr6 <yzddmr6@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794560568; l=3077;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=HbT+9TGvL1iQEY54tJsF9aLJzSMEn0pqn3pqWaT9g8k=;
 b=n3bdlatHAHYNJprcV4zoP2eQcCOYzC0dF6Zw78yeBNJlVAAVREfo6cz2JJ4/zCklGmZHDilV7
 UBcaFq4PLe7A/oFRSRCCCspEluQOWkzAqxXEnCMMO1g/fff63I1BVZm
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-GUID: IZ54znQ5OwMirE74oGqeMrGWCmdxCOm7
X-Proofpoint-ORIG-GUID: IZ54znQ5OwMirE74oGqeMrGWCmdxCOm7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNSBTYWx0ZWRfX/qWye6mgZz4w
 8WxFeZSxj9RppHZ2wrHjE+MvliKqkeFFfN0AEXRbkVeSDBAG6CRVxdflcy6nptwbI9Ons09UlRO
 XhjdhJ7PlYrItv912rS5z9Ipsh77IunT8aMV09HvEn94kJSpa/uvdqvAmcr1jnoSNQwmfHUllAe
 cucGVQKW8W1OkGfkrmDv6qkbEG6JIBfGEF51YC8yZS4568lAh7nyV3j8mEFVUpTECj58N56uEIj
 bZhi3FTdf4/qZrfmHLUeqcUJ76vzfMGorh9dUeZEs6+KeO4Wo3l9G3jZvW1tbBxT1di0MgaKPy2
 mq3FK8O24DSI1QZntoKO95jBPumG9iSdhj4p/5MMFXTqjv2uf8sPV/Lhx9jG8KuB2ChYlYyT6jS
 +MlCdzMb0AW8VBTa1/HbA5ku6/sx6lXoaxw2LlnTMPGvajW13XbmNSwiwNzP7h0Fo9Fj8KeiDfw
 pRq6Kmo/RIH+6txgYDQ==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af6d23b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=96XK8CVwcyggMHB5iq0A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNSBTYWx0ZWRfXwhuGHxZgLYvX
 y/FFATD96NnnJHphNhZzFuWp4LFbFB0nNa6oZFawyvxOaKMIltYeqBKBODcBPfc7IM29PRUOcCh
 It0TR8Y09/nAB6/5u8hFVJnxpWK545I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130035

Bring the settings in line with the with the recommendations (and also
with the downstream kernel).

Reported-by: yzddMr6 <yzddmr6@gmail.com>
Closes: https://lore.kernel.org/linux-arm-msm/20261111-sm8750-llcc-island1-v1-1-64055702ca3f@gmail.com/
Fixes: 2c04e58e30ce ("soc: qcom: llcc-qcom: Add support for SM8750")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index d7a42a8040a16388a79c24e4d1f1e88de9c87ec0..df213548637351fdaeeb81b860f0ee2631f2062a 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -3869,7 +3869,8 @@ static const struct llcc_slice_config sm8750_data[] = {
 		.priority = 5,
 		.fixed_size = true,
 		.bonus_ways = 0xffffffff,
-		.vict_prio = true,
+		.ovcap_en = true,
+		.parent_slice_id = 33,
 	}, {
 		.usecase_id = LLCC_MODPE,
 		.slice_id = 29,
@@ -3923,7 +3924,7 @@ static const struct llcc_slice_config sm8750_data[] = {
 		.max_cap = 7936,
 		.priority = 7,
 		.fixed_size = true,
-		.bonus_ways = 0x7fffffff,
+		.res_ways = 0x7fffffff,
 	}, {
 		.usecase_id = LLCC_DISP_WB,
 		.slice_id = 23,
@@ -3946,7 +3947,7 @@ static const struct llcc_slice_config sm8750_data[] = {
 		.fixed_size = true,
 		.bonus_ways = 0xffffffff,
 		.cache_mode = 2,
-		.ovcap_prio = true,
+		.ovcap_en = true,
 		.parent_slice_id = 33,
 	}, {
 		.usecase_id = LLCC_CAMOFE,
@@ -3956,7 +3957,7 @@ static const struct llcc_slice_config sm8750_data[] = {
 		.fixed_size = true,
 		.bonus_ways = 0xffffffff,
 		.stale_en = true,
-		.ovcap_prio = true,
+		.ovcap_en = true,
 		.parent_slice_id = 33,
 	}, {
 		.usecase_id = LLCC_CAMRTIP,
@@ -3966,7 +3967,7 @@ static const struct llcc_slice_config sm8750_data[] = {
 		.fixed_size = true,
 		.bonus_ways = 0xffffffff,
 		.stale_en = true,
-		.ovcap_prio = true,
+		.ovcap_en = true,
 		.parent_slice_id = 33,
 	}, {
 		.usecase_id = LLCC_CAMSRTIP,
@@ -3976,17 +3977,17 @@ static const struct llcc_slice_config sm8750_data[] = {
 		.fixed_size = true,
 		.bonus_ways = 0xffffffff,
 		.stale_en = true,
-		.ovcap_prio = true,
+		.ovcap_en = true,
 		.parent_slice_id = 33,
 	}, {
 		.usecase_id = LLCC_CAMRTRF,
 		.slice_id = 7,
 		.max_cap = 3584,
-		.priority = 1,
+		.priority = 3,
 		.fixed_size = true,
 		.bonus_ways = 0xffffffff,
 		.stale_en = true,
-		.ovcap_prio = true,
+		.ovcap_en = true,
 		.parent_slice_id = 33,
 	}, {
 		.usecase_id = LLCC_CAMSRTRF,
@@ -3996,7 +3997,7 @@ static const struct llcc_slice_config sm8750_data[] = {
 		.fixed_size = true,
 		.bonus_ways = 0xffffffff,
 		.stale_en = true,
-		.ovcap_prio = true,
+		.ovcap_en = true,
 		.parent_slice_id = 33,
 	}, {
 		.usecase_id = LLCC_CPUSSMPAM,

---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261113-topic-8750_llcc-bd228d96b455

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

