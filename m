Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156B13AAF56
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 08:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790755327; cv=none; b=Sc2wfcbzMhLTJQsqOeVierE9DuL9qfpN/SRxsDmkkb0AIgP7mNGAmC6DoQQ+JycAeREanE4MzxyM8Ix6Nd6fPpoYDl7FzwX6N/vrRfNm0B5ng79HcKOjo0+7ulQEiaD+DeT8soedWd3X/2WG8aCafSQ6X7LFP876b+xL4aUha3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790755327; c=relaxed/simple;
	bh=OURA1+H1ARdm/srSTqjL0aXxjyW1JMaJ9R3miMBaKbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LcpzNH0/d91s9Y1N36othkqV+qVbRhQRZ8NCs5ng9EahDGbF5oGa4nwBlZVLT8xFkeBMshQRwUNxtFsJqQdfZxycBwupRj7xPxHvll7tvtNkSTT1HroZ1RBjK7zzc/GP22O8/FyRsXIKyygYJcOQlGXZKjAGNv7adeDhIK12xhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NFeBVIfN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJ1eYSWF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NFeBVIfN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJ1eYSWF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dLRM3082199
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 08:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EnmphdWMY1cvBewlgFaINJ
	JFeK8fe4R2yT8Aw5rkMZY=; b=NFeBVIfNBKgQAx26/4UrwW/AzNmwuGZTM8D37k
	a6C4xN3lE2V0u6S5zFpeEakGn+NhyF5kymKAYjBUnh7Y5A42Mc/dzt3bX0EJUmKC
	mBDeBf/9A3ZfleilLnaJDfJyG4l2IY/3cFrWk5g8RM7Ip/sIa+NcDXkYWWLs2ZHd
	o03JUwwaQQNxM08bJlgmZQvyn9yE6dRv931+s0keD3Z37GiHanKA3BUfITToFzk9
	QTi1jUISOBe5KV8CrvyK48T46ITCiwfWf8eysGk7BJ1p2MVdNJsw/wMa+jquA4Oc
	+v3boyAKlaX1Q81a3lUfY1m0SctfgvzKdVQrPHOMntPeunSQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0w140etn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 08:02:05 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86a880e91f0so6879401b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 01:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790755324; x=1791360124; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EnmphdWMY1cvBewlgFaINJJFeK8fe4R2yT8Aw5rkMZY=;
        b=OJ1eYSWFIIfzL95PDfotTHLkCCDA2MsNG/JNqwiGBwMO/5FRlcoXIenta6+bTkhlf8
         glWaVsfQtx0s1Vxa5mK0DF0thIrggqWG5K6a5pMe9wqmcDSjeEe+NoFBB80i/ZPDTxvg
         U2DiRamFcYmPZovFiOPza9OT70YfnfaYJPL4baW6jUkwR0lI08T5E8eAbv6yYr24Y6WL
         uLK9F5bJhRPAqCm8enKhTWG+rEI1rkKnyVQz3IWf0o0Dp8Sa36E53DthqGK83IpLpqSa
         0nfxLEom46PBOjhoVZA0hcDKCztTY7162gV/4XE1K8fVbscr+9FDHdHUcjx1PurhTFvM
         mb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790755324; x=1791360124;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EnmphdWMY1cvBewlgFaINJJFeK8fe4R2yT8Aw5rkMZY=;
        b=rolHO/eBOBADQ9hO33yuSFgmjisKhJQGskqoQhL61wG2HkTadXgpl4GqJ+ZoQ2a++b
         Iim0dGH2dR/sK8fgSLHW6SfbF5OGaRWRJwpZF0D1NhySmlcvz+Tb/k8xDqX5LtSdRbWT
         S++OtgjDsw9w1KffamOtZsMAMcFT5/XNRUO7E7vhDQzO6XVlkdq6AawtXvrnssrfJRFU
         MZWnploWsvGtobfuiKdYL3pXwJDnDrPmpJZZQE6dcy6s5z1CewzdeB98+wJCOLuVuQ9r
         n4WzaBP5KN7+GYwYV/wro9ayLOA8LEnxRkUloTr2KVQ9usMBZLBFqXN9+tOSYCHHSRN+
         /3DA==
X-Gm-Message-State: AFq9FYLeEf50Vkc+Pf4Quh7vG/F26zMgKPkfM0tgDkPq9LLTz2+PF4fj
	Zxb0Tu00lWPYRUkbCkLGf7VWM/MW6nLPl/A+SHzEPas/Q4YXyP/WafTFOSRiTCtUXINL2OOYxS5
	qXDracqkjXMai/u2h4wODL3V39mFebJxyjG+Tyy4XMSH/GExrdxItU3SgSBjJb8b/ZJzkamqDzj
	P9yeg=
X-Gm-Gg: AYBFou0I9uzJiAbgxuGH1TnSrBkNJKANBH/899Lz1ryQVUqL/KV88rFTZ7rJs1LAMnl
	V/2QWNLHabN5wN9d90EkKqeRvppx7dbduetRe/U7bW/LcI9gIeQC8X8mn4Vgv5MvUAdcs4Vei5b
	2Oq3NRdOW6OvyHflUGFNa9mWGv2XyTMwL+2RUSuPebHLe490Ygzgm3K0sNZ8puZRgNL0lf5HMHg
	hmmfjbAAO5D2pZxF03ZqHne1OfzP78cGbK27W+6mYwSSclWkCExO24YttHOB2b4ltYDCwRLHWbz
	1Mcv3U6xh9fVJFz2lXHktA6ExcfLujjqXgBq/EN4KZdf1+WhfBj8iyk/mvztKW4m0CeBCUri1jA
	mVf1tUP9NXwEjBFKcW7IA+7ffnvg=
X-Received: by 2002:a05:6a00:2913:b0:879:56df:91e with SMTP id d2e1a72fcca58-8874dd66943mr358300b3a.41.1790755324388;
        Wed, 30 Sep 2026 01:02:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:2913:b0:879:56df:91e with SMTP id d2e1a72fcca58-8874dd66943mr358278b3a.41.1790755323877;
        Wed, 30 Sep 2026 01:02:03 -0700 (PDT)
Received: from hu-somedey-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8872539a163sm399688b3a.12.2026.09.30.01.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:02:03 -0700 (PDT)
From: Somesh Dey <somesh.dey@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 13:31:54 +0530
Subject: [PATCH] soc: qcom: geni-se: Drop unused icc_ddr parameter from
 geni_icc_get()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-icc-ddr-param-remove-v1-1-61223714c9bc@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPHBvGoC/yXMTQqDMBBA4avIrDsQIwbqVaSLZDJpp+APkyqCe
 HdjXX6L93bIrMIZumoH5VWyTGNB/aiAPn58M0osBmusM8/GoBBhjIqzVz+g8jCtjJ4opdZS7Vy
 Aks7KSbb/tn/dzkv4Mv2uFxzHCYFuwtZ4AAAA
X-Change-ID: 20260930-icc-ddr-param-remove-accff52c166b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Somesh Dey <somesh.dey@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790755321; l=2034;
 i=somesh.dey@oss.qualcomm.com; s=20260825; h=from:subject:message-id;
 bh=OURA1+H1ARdm/srSTqjL0aXxjyW1JMaJ9R3miMBaKbk=;
 b=PMVoFp5L6cSGEhrP4jP8c8n/0L2tsuUTx/Uj4OvMHosqSdbrd1ANNLVoU5e10N2Msqb9wWLaB
 v+h2UIkurpgBYdQMuq7vD0BeP1QuZjAGrFtHuPCxeNTRS8+yniSF7kF
X-Developer-Key: i=somesh.dey@oss.qualcomm.com; a=ed25519;
 pk=EdQJd0pMlRfHEn3JzZEcik8VU5W2ZWq2FMeS/v9VJ18=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzMSBTYWx0ZWRfX6ikVnoAnpQ5n
 RC0HRiVpDmlmicFKYaTsZd6A/52x7qhcjf/Y0uz7CI0IdIymxyckDVv8BR5AX9z7HPtik/xnzGw
 iw3lR7zu+oHN8hyi529TOjMycXWoTHo=
X-Proofpoint-GUID: tfvw2ARBNWVmVTwq7HrbMZiRhmjjYJWd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzMSBTYWx0ZWRfX9E8g1uLop3AK
 Vk7/Ve1nim2XaEfssrPH1LlohY4GF7L/r0sautP/i+FUXKwxsOpo2uhRVGhfwGfTI+aZsUWbwym
 L8rwPzsxBJOfRkPqgYJ1FqFsuTnTKDy13zI2/8BpoQ+LEupV+CgBaRMwffhcJ81FGhORaaDqjdr
 BWfN/Fst+SQj/F9X72qdSFFrRLtQpraPZGJLx5gRh+lAl8dl6U6Kaw7FSBOd0LTsxpaJ64pagw6
 YbDNqY5ty5cI9eExdMM92fPIPFZytfKC6qDvNrWSEJaIvFVn5/jDHjz2MV2Lbhf4wAb9b4xGLVq
 uee4ep6Is6k/sDNS7YZZMTS0n/j+qrODcuK8aIgfMcJhEr0V2QqQQAGOcKPFn7qwUtc7dwEn6Pq
 5O7NbPsnKBibgWZr/8+OggtuiowjnYBuoQsPbkVjOayiCuNyS0Ou+AOXyUvkmzyRAe4RTj3f7Is
 gvj4uI2G+v2mPxFZAuQ==
X-Authority-Analysis: v=2.4 cv=J8Q/fwnS c=1 sm=1 tr=0 ts=6abcc1fd cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=gooEQksF6_givOVhb-4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: tfvw2ARBNWVmVTwq7HrbMZiRhmjjYJWd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1011
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300031

geni_icc_get() takes an icc_ddr string argument but never uses it: the
DDR interconnect path is looked up with the "qup-memory" string literal
directly, and the sole caller passes that same literal. The parameter
carries no information.

Drop the icc_ddr parameter and update the prototype and call site
accordingly.

Signed-off-by: Somesh Dey <somesh.dey@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 4 ++--
 include/linux/soc/qcom/geni-se.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 7ad002b111c8..074087c592cc 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -924,7 +924,7 @@ void geni_se_rx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len)
 }
 EXPORT_SYMBOL_GPL(geni_se_rx_dma_unprep);
 
-int geni_icc_get(struct geni_se *se, const char *icc_ddr)
+int geni_icc_get(struct geni_se *se)
 {
 	struct geni_icc_path *icc_paths = se->icc_paths;
 
@@ -1221,7 +1221,7 @@ int geni_se_resources_init(struct geni_se *se)
 
 	se->has_opp = (ret == 0);
 
-	ret = geni_icc_get(se, "qup-memory");
+	ret = geni_icc_get(se);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 2243005f5e2e..b3372a3147a0 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -574,7 +574,7 @@ void geni_se_tx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len);
 
 void geni_se_rx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len);
 
-int geni_icc_get(struct geni_se *se, const char *icc_ddr);
+int geni_icc_get(struct geni_se *se);
 
 int geni_icc_set_bw(struct geni_se *se);
 int geni_icc_set_bw_ab(struct geni_se *se, u32 core_ab, u32 cfg_ab, u32 ddr_ab);

---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20260930-icc-ddr-param-remove-accff52c166b

Best regards,
--  
Somesh Dey <somesh.dey@oss.qualcomm.com>

