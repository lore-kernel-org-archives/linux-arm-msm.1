Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600209;
	b=tVCmmpjUqGgoxH6ZHTiQDb95MGeY/FU7PVoZrq4OXelfE0FVjYIc1KLkRu+K+hbOUufU
	 2zzH/4Ox5GriW8vzl1UeNfxOVR1nbEQyqQiZ/xfegxLBi6OFh8EhPfiANuljPaqMpgMu5
	 SqKX5J5qKKyFX1IiouOVIcrCAMSHa8rPWEp5u7icVD9k7qStmGIjdGLmfdpOya9Nw/meD
	 AHRlbBmD/YT0Uas/jW70YID4xAdM8ewJzNig+Hsq/9R7/MQFQk528NOxRpqNFABYkWk4T
	 cIm2HunWTZxc+bQA+L1LQ2z3d3Oh6iNCClTq3jnR+znQ8DD0Yv/gFi25ROupVkpAODg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600209;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OWq9Wa/Rb28IKct5FFHo37DNsldJUm6m5YpxhusIgEc=;
	b=f52yOVSuX4lN0s4g97zYg4ghm01ZZvwsuugN9+TQ33ugh6IyJgJF5VvDBdBPKw+oxINl
	 /oiLhpAPdoHwRwO+JsAcg7iQUvoqUpi5RdGE1NTuwCbYgfXzVsM3I6ofu3FbSEuVzDev3
	 illC4WRPojL4Wx2o8WhaKhQ5Q/zEFDnMS/XhfHgq6REsXuf5JCoyAe1rAf+dor3Ja8ikV
	 Y/nKCEKjGT70wyBee6IGHAXp/jUlUt/pXnXxoC2NtXschjb81OuNdydso64cnwtnHhiIL
	 Xxg3av77D5g80W/p2BZ6giFQQcHK8Z49xOLAnFLu7QwFuQzygV7gAG259UrUphi57ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dat7q31+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QnM0DoBv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F4F606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7F4F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dat7q31+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QnM0DoBv
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9moCp3611866
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OWq9Wa/Rb28IKct5FFHo37
	DNsldJUm6m5YpxhusIgEc=; b=dat7q31+ZewaVp9CPw/bHUy8uk1G3+DjXJhd94
	tGZIv3z5HNkxGED31G7K41TVniuiK7NwVaQjgTVTBsJVDOLVZ5tVUEcnoNBbEi7K
	YBTSxUtkvu28No/uZOWSVuC32b+nhU/SjAd/Xmk+jydfty6Tlk5wlyb6w6s3Y6zs
	O8V82vga3ssrrTGKFKNPF4t5RGGr6VZEE1DrB1+NN2xJcfOSDJXNdB4w4ABJ22F1
	Q/0FCqpoc6JhSR6954fI4sR4A5M2CMtUwnmd5E7Qa6n1FzwctYitRT4Lqmqz2sgP
	l5/FZXFF4mUlOIlog7xBg3d57Rl8SZJXg1IVwaVAdt+c9HxQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsayvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:50:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-550b1b21674so12471741cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 01:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795600207; x=1796205007; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OWq9Wa/Rb28IKct5FFHo37DNsldJUm6m5YpxhusIgEc=;
        b=QnM0DoBvwLsALg+d/O56MWn1FWgGfYS9mqWavs98SSqRd5WfZTmC34MInZ3KyUo+46
         C9nc1EJpW2Ng+rEwYQOv5CNtEbwXfA0V62zkkodwjQ4HwLfu9+DWZh85J0WZs32WvRd9
         DN0nQV/BoBn7vJbwHBr1FoMc9wkD78px61RgsjsWIWyuP5By+oDRbTarU33X1NFwsGqI
         20Cmb6+PNI/oWgjwskDGQjQz2qp2TYFi8UWK4GWsliYhlEASf1776KCKNxpuuO+TqtSf
         WLAMfRQbK8KmOQB+NvGJr70snuQouLHvnBnvUA5XPtYtnVZu30c6sZfqpmINOx/AJ2oG
         JrVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600207; x=1796205007;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OWq9Wa/Rb28IKct5FFHo37DNsldJUm6m5YpxhusIgEc=;
        b=0OyeC56i1YYc1AwkVqLcJhZfiIgZdtE1RY1dMtQLB3BBbSoJ8UtiiWoODOH5dx26HY
         ndT09GvPZqWMpyujNFDEh0dUb/8540KPH/u/7D3C05YavIgMdrxxm69TPTuMdv/5h8/F
         m4Ib6biK9TzIZhCjjRwP/ZyINeJC3XNdyvOfBPdw6ql7Mw6LrgDxkdCQZVAwh2rJoi02
         2nbBRLe2WVH6FYeEtfqth72KNrEwVoYjPOKrA6feDJ5B+vicnCVJ0melBWmYEfYm1u++
         JtgxfnvxgYwPg3mt8KVIBaotDfHFUzfM+eOxK1TNc8eoRkWUAXDQvPd0twaL0ClLTsEU
         JrVA==
X-Gm-Message-State: APuU4Z96gz2ZhugVx1OMNydm6nSaqpZcG0Pyl9IgHLW0DB3f9/f+PQlx
	UyMdFl/F/bYWAEYpxD1WVppExRS5Oadle07UbPNqtQzzbe54yRuziLFNCjXraPRwZ9mzJmaGaQZ
	J86KR3apxpLMMYPflCo12o569+cGYQGFe3kRqMop3GFx8mzoyU0488tAzvXmMztKLDqr5
X-Gm-Gg: AZFdTZfKXL02xdQh5W1RY7CbWwLjh1tf4YD29+eig47sm43FLNOxrrwEwAEk4cGuWKg
	LwsOBOHiM2vysLdLU15ezl8EsC2s5KVsLzXg/BOqHFai+c0IRSnnFXQFsS3OFP1bmeQJift7x4E
	5SjDnS3Ww/YgX0ZPsnjEQuyAypYyR3XOxEY6yXTGA6TuhIU61tQSpiANH6NAHiA7lpfCzofAqL4
	itnuyiswjwJ9Yc/DrvO3gUAwetra7l2V4+8kAmpdE1tN5/74JIg958t1Hgc3hucnwW86vVDsAu2
	lsPorRmGyz5Y5fJ0AE7EciDnkmhTaRK9K6Tvz+VArXpD8CBmhgWzhdptPrlqgjpPmyDvcAU4Hlz
	vhnXvgw4eAydas0FkY7hYbjCz/P0wBhWnQbcdCYbePoWdVUSunO07zoxWBI4oEH/26AbfF5hOWI
	7DomFwRVk=
X-Received: by 2002:a05:622a:e411:10b0:54d:2f0d:a83f with SMTP id d75a77b69052e-55d769e8959mr289324591cf.3.1795600206856;
        Wed, 25 Nov 2026 01:50:06 -0800 (PST)
X-Received: by 2002:a05:622a:e411:10b0:54d:2f0d:a83f with SMTP id d75a77b69052e-55d769e8959mr289324301cf.3.1795600206363;
        Wed, 25 Nov 2026 01:50:06 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:2918:ed03:7c19:529e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm34611022f8f.8.2026.11.25.01.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:50:05 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 10:50:03 +0100
Subject: [PATCH v2] soc: qcom: llcc-qcom: Fix SM8750 settings
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
Message-Id: <20261125-topic-8750_llcc-v2-1-6171584d929c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEqvBmsC/3WNyw6CMBREf4XctSW00IKu/A9DDH0gNykUW2w0p
 P9uZe9mkjPJnNkhGI8mwKXYwZuIAd2SgZ0KUNOwPAxBnRlYxQSltCabW1GRruXV3VqliNSMdfo
 sZMM55NXqzYjvw3jrM08YNuc/x0Gkv/a/K1JCieC1ULIRuh3N1YVQPl+DVW6eyxzQp5S+ykUm0
 LUAAAA=
X-Change-ID: 20261113-topic-8750_llcc-bd228d96b455
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        yzddMr6 <yzddmr6@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795600204; l=3258;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=7o8CCFNytTa8WJJOGZ6HqTpU8mKft36eIDBpD90N3ag=;
 b=dtbxKFo061o1N7adeDokyiz2OZUUpxDzQhmXdBStpKzoYfOEy9nmNvf7DdVCgPjNTN+jyIoe9
 A105vVDaN9BCHIT4is4+JrYkDTV2AE+k9vEc8OFL5J7+U4NlFnS7jyz
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-GUID: TlzdqTb6XCZuVuPhZdl_UmlAI2PpaYCi
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b06af50 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=pfXh6NU07cIsviElODgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfXynHZSUJXMDlk
 AxBGdCDoGAd2FmQCLrFcu5iV21bzytUZ/rJf56AFwUPKEu4He7C0L5Kf34iMj//7mpIpWeGJAsB
 Qyye7aBNO2lPGBG+sTauIZYeHnVtpHE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX04J78neTxvfd
 LbMDZw46WGh7EgE0uhVmsozwFetAOSeqwRStnrQl50Gn6GbEpAdpg9oFAaFdeNwC7c4xu2JI4Op
 3dfPd+TuWbhBhu47DUabKV1YLch8ZIptZW6IXd8cQj9YyHNrFopghg6nDpWOTd7+nwfqcDNP4QG
 1jIYvjPZIMokwR/YxLOYlmxSGhZYTiwxKCMV9C/XUajPHLWSeAOVNwgP/bCVwC8PTxUk1sT2sWZ
 XUzc0bCjxzsX7KmRqo8fiPynsIBqucmjiVuWwZwO8MbYvVvC85KX9UeKHL41FZBkxE2XhgPAH4n
 si0ZLUUz1qf+uW1DzXnynfpgRoUO5IjOdnleCd0WD2GtZSTQzHpJtPvJqpzKstu9LwknYN2LrlP
 VxeJawfWmRUi06oFNhl9CfRGAyfk2CxCs8Z8YUaFfp2xaSB9n54uPEn3lWeTIxk8mBWLF4X3yrb
 h9W1jnX4a8RDt8/Os7w==
X-Proofpoint-ORIG-GUID: TlzdqTb6XCZuVuPhZdl_UmlAI2PpaYCi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250038

Bring the settings in line with the recommendations (and also with the
downstream kernel).

Reported-by: yzddMr6 <yzddmr6@gmail.com>
Closes: https://lore.kernel.org/linux-arm-msm/20261111-sm8750-llcc-island1-v1-1-64055702ca3f@gmail.com/
Fixes: 2c04e58e30ce ("soc: qcom: llcc-qcom: Add support for SM8750")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- Fix typos in the commit message
- Rebase on next-20261124 (NOP)
- Link to v1: https://lore.kernel.org/r/20261113-topic-8750_llcc-v1-1-6536cb46d7fe@oss.qualcomm.com
---
 drivers/soc/qcom/llcc-qcom.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index fa7407a0fd09c6b67241b71232a0123456d59584..d545edd5c78da0894d62e3d99feeecc6ddafc7d3 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -3930,7 +3930,8 @@ static const struct llcc_slice_config sm8750_data[] = {
 		.priority = 5,
 		.fixed_size = true,
 		.bonus_ways = 0xffffffff,
-		.vict_prio = true,
+		.ovcap_en = true,
+		.parent_slice_id = 33,
 	}, {
 		.usecase_id = LLCC_MODPE,
 		.slice_id = 29,
@@ -3984,7 +3985,7 @@ static const struct llcc_slice_config sm8750_data[] = {
 		.max_cap = 7936,
 		.priority = 7,
 		.fixed_size = true,
-		.bonus_ways = 0x7fffffff,
+		.res_ways = 0x7fffffff,
 	}, {
 		.usecase_id = LLCC_DISP_WB,
 		.slice_id = 23,
@@ -4007,7 +4008,7 @@ static const struct llcc_slice_config sm8750_data[] = {
 		.fixed_size = true,
 		.bonus_ways = 0xffffffff,
 		.cache_mode = 2,
-		.ovcap_prio = true,
+		.ovcap_en = true,
 		.parent_slice_id = 33,
 	}, {
 		.usecase_id = LLCC_CAMOFE,
@@ -4017,7 +4018,7 @@ static const struct llcc_slice_config sm8750_data[] = {
 		.fixed_size = true,
 		.bonus_ways = 0xffffffff,
 		.stale_en = true,
-		.ovcap_prio = true,
+		.ovcap_en = true,
 		.parent_slice_id = 33,
 	}, {
 		.usecase_id = LLCC_CAMRTIP,
@@ -4027,7 +4028,7 @@ static const struct llcc_slice_config sm8750_data[] = {
 		.fixed_size = true,
 		.bonus_ways = 0xffffffff,
 		.stale_en = true,
-		.ovcap_prio = true,
+		.ovcap_en = true,
 		.parent_slice_id = 33,
 	}, {
 		.usecase_id = LLCC_CAMSRTIP,
@@ -4037,17 +4038,17 @@ static const struct llcc_slice_config sm8750_data[] = {
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
@@ -4057,7 +4058,7 @@ static const struct llcc_slice_config sm8750_data[] = {
 		.fixed_size = true,
 		.bonus_ways = 0xffffffff,
 		.stale_en = true,
-		.ovcap_prio = true,
+		.ovcap_en = true,
 		.parent_slice_id = 33,
 	}, {
 		.usecase_id = LLCC_CPUSSMPAM,

---
base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
change-id: 20261113-topic-8750_llcc-bd228d96b455

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

