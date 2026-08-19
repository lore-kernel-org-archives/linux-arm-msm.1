Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083FA485CF9
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787156618; cv=none; b=em3Ma04XoTCJfaHtgd28B4BsfFFGIjjMJ9hNAYqUuk3F+8q3gdNqIskx3FqcHkwmjPdPIKQst25CG0I0CcRhI7rhq3MxAGYZ2bs0Xrsod/FnfX8Bx5nlBKo/vD2WCEmsCcYoB8XoFQXae/Kpuqopm2/AyN6L+Jb5WeFzWiyQtm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787156618; c=relaxed/simple;
	bh=hp6/cFeM6i1dHXzM07Et7ijahxhEQwtsKNEdDTmvoFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RhBgRrQPQEmMGwhJz0v4LcwT3bh/tu28wmgeSA8XwHSXmXEpSgIW9pSoQEsuN3UDRPwNdbGF1v9LPzFry4UNbqwtIMjZw/PY81yGrSy4cwey9YMv8/GuUCD14c6z7gNiSKGVm9qIBoByryrmt1l2ZMBQOdHasqSzHxj/hjRLj5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqfeYPkc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XvKjJR8E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqfeYPkc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XvKjJR8E"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF1vGx444880
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hor90yOQ3YR/AK+0CB8L2l
	uJ6GFiPf9WZ/Sn6QF2aPE=; b=dqfeYPkc9f4cKL1FZyYXw1iZj/VbYklqnLBVPe
	uKJ9/Z70O4+LFCplTNQIJvHVyml9yBO0zrYyUd2H3VLkdF+Md+vMITK0PR2siQy6
	5teKVD3zhy0pd6uTgY3paEWZD6MjKsFOw2o3+ue3ysTQVaJv845bWhLBLqU//jb/
	qyCGcigFt6+6IpBWArLtTeoRsJTKs69yvWH5/NKzv+4CkfebRMnY8Ld0SFzr5s8s
	MtE+OfQE5jIijTzWEaabX9/NlHrc4dU/AQDNtlivaUUY9B5Sx4B2dW+jZvz3hjHM
	R/Y3Od4mPL5btPDVWC6zn8B+a+BDR9Lz05eHCgfMCva5B/eg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es60e77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:23:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-395543dc382so1589513a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787156614; x=1787761414; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hor90yOQ3YR/AK+0CB8L2luJ6GFiPf9WZ/Sn6QF2aPE=;
        b=XvKjJR8EJaPk4eWFzjCCOriYmdENNIWy2YAd6jm8zyY+f4fWg/3OoFwSvViBZsru+a
         Dk2DIAIaD+u3ANBEXA9ZWR7PtRlfMtp/OhvKccS4uQK+9gGG/cn1MAboE6fqVPmwF0wu
         nUydTTVr93rfJtHSmEeg48UNUTZ/NL1tTTjMs18hnuVCi5XDP+XSeESSKkzI/PA1ghTD
         U+1W8Bn4I/f29v6J8dnzf9CJ4npu9Z9rfrFCFTwp6hQ4RvKpCpnzFFJnSm0OKViolhco
         AAzcTEFd/m/dxW1UTcmV0qAHhh6SJSB7gL3jwDyW7sLdG8R8BLS9PzOOKDBZXkfOQlit
         4yGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787156614; x=1787761414;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hor90yOQ3YR/AK+0CB8L2luJ6GFiPf9WZ/Sn6QF2aPE=;
        b=BDW9GZjbon0V1NQ0RRCnKRtq+K6N9GZVY4+nHtrPZs8BgfCvG05765VccwF6m87nQC
         MpsOqsSHsvD4Bqi4A5XRwoKjJI83eJX9ImZ9pN9f39nVOKfxYaoOUCU61xjmnVrXcgM5
         rGJBGlOWdHs1jUPV0HIOx6HE+LHIcy9QryVcRmvO+/0tHCyWloIBjYq9HepU1VrqCjjP
         1aX9tEpkVeIqdS5EgRTuZ6P9ZMFFDaOjjX3jKoyGbGQb5sbH2FcpYfKjPdD3a0iG03mR
         cDAXK7HdrSDgAI8rL9JrqXWXaE/SFBc5z84ZxBgoSoPx97P15wR1vXM/36SGFDnC1kOW
         CIeQ==
X-Gm-Message-State: AFuF++nTxYcPb73ZVnkTM83xlm5MaGcjg6GI8xbr3XOHa5XWLvpWGlpP
	xn+rcr/Sg9xumeEzzftinGddmcFuqd7yj9USRLXFX35XggJxpjKp/qM68kt8cF/6hbHSdz55EKB
	0Yp/6aMJRSpk9qCWRMrLMyEFQw6WU6gC0Te058fdevWSFIAfUTCVOcMlPtBM2CW0rVavwXGmk1W
	F0
X-Gm-Gg: AR+sD12VmWPKycRiXsAUa2ZKctyZV4EMqm367MSlaWJElLlfN3iu9Jp6X8Jnhk7/dnh
	xLX9wVgwX6eomi39rJJbFK8cLtNtkHfob958tZ+onMkPAr/AbNFMefc+HY1KtV2jGph2qlrfV/Z
	mqf4kePNU7m5czIG1V6xMHp9XImNLHNGF7zKhCsRxp40Znr67uNzByQn2a4Bd7Xp0/2ax86DWKC
	EjsYaRlV7R5ZTyKL2Oz1+T7jQvQKUCLDprsanwfxqOMU46Rc5bFVipu+pOQXceTor1JTr7xTJqf
	twBGHAnOtqpOCWKwECSd+7EvDz+Ct5XxQhhV49+Y3JqvR5jZnr9Z41vZNnZq1vPbiEv0j4pmCdL
	OU62hzcg9kjslOHt3Agt+BRBfqqy9s8JtDz5pI1Lp6xFhaBAuRA5XmjYUpMnFIACcj5757kExJe
	7kVJTD0tu6wpDwxKLz89Xboiie4zeE4vgQnt0=
X-Received: by 2002:a17:90b:4a46:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-3958083fc60mr10734466a91.4.1787156614309;
        Wed, 19 Aug 2026 09:23:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4a46:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-3958083fc60mr10734369a91.4.1787156613670;
        Wed, 19 Aug 2026 09:23:33 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77fc0sm15899709eec.8.2026.08.19.09.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 09:23:32 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 21:53:27 +0530
Subject: [PATCH v3] soc: qcom: llcc: Update the SCT table for IPQ5424
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-ipq5424_llcc_updates-v3-1-42b48451481d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH7YhWoC/3WN3QqCMBiGbyV23MRNN1dH3UeE6H5yoU43HYV47
 21G0IHxwQcvvO/zLMBJq6UD58MCrPTaadOHkB0PgDdVf5dQi5ABTjFNWUqhHkaS47xsW87LeRD
 VJB1UJ0aQoKJmjIIwHaxU+rlhr7dPdnP9kHyKrNhotJuMfW1ej2Lvqyj2FR7BcIrQjGKlKCsux
 rlknKuWm65LwgPR5PEPC6E/LBxZMs9IShihBdphrev6Bn8cd34dAQAA
X-Change-ID: 20260806-ipq5424_llcc_updates-f9851d6db886
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=E5/9Y6dl c=1 sm=1 tr=0 ts=6a85d887 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=YbsbOWGNU04IRjVF4icA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 5_692Yt9L1W5tozh82oPGts2266iwa0v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEyNyBTYWx0ZWRfX7yiieqcKcY3a
 nxQek8nK1jSYsGXImxkCOtpVrexPrVHVSyZIsAdMtg+l8amXTDhfSx7YpgAoEAjcUIXclk7cGc1
 yx8XVCUjXc0yKd9g2+P1S7YVxNWKWSOqTv1BH/Zk+NPRS/ixenfUFxY31E+Sn/TJPQ16h/WGL1R
 wBluRsiuFCJmQH5f7lXc09+m8jrElyY1oJZOuPqmk7JsZXOUsgYIUT0mTbUqnc/9fjKrqiOxXrw
 ioDTo7S1bj1hI0/EnM+qH7SNmoO96kKuG/czGXPy5tcjDW3FZwnaqQsKYT/X0943d/ULlDKltUf
 w79eTrl+ZjkWZwZP7tDdxzYWlIBjbSe4ZAofLAZsYJoF7Z6wqkxNYob/a0Ko9Ch8H63JUxqCN9D
 1jkGnnuua3sxWcblfKCt5BCGPyp9JRS2dzSNSmTfUPKG8ksdBxja3YcPrI35HHwqR7HLmDHkrqG
 uOtj54uERkK2OOle5Bg==
X-Proofpoint-ORIG-GUID: 5_692Yt9L1W5tozh82oPGts2266iwa0v
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEyNyBTYWx0ZWRfX7xaUoByVItBM
 mo19vbuM3tU7EmkMravxPRl7rTuGWYrbpZvIZqebzfg+vtB09BS/tIVbdj2F56J50x+K5JDWrGB
 bHhiInRcXQXkQuc3Nb1GAzMgqJz7FTk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190127

Update the IPQ5424 LLCC slice configuration table to give the PPE
and Wi-Fi datapaths dedicated slices.

Assign slice IDs 1 and 5 to the PPE RX descriptor and RX fill use cases,
slice IDs 6 and 7 to the Wi-Fi radios connected over PCIe, and slice ID
2 to the CPU subsystem. Adjust the corresponding capacities, priorities,
and way masks for these consumers.

These slice assignments are based on recommendations from the
performance team, following throughput measurements on IPQ5424.
Having the dedicated slice configuration for each of these use cases
helps to improve the networking throughput by more than 1 Gbps.

Rename the usecase IDs for slice IDs 1 and 2 because LLCC_CPUSS and
LLCC_VIDSC0 do not describe the actual users of those slices.

Assisted-by: LLM
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v3:
- Add more context to the commit message
- Pick up the R-b tag
- Link to v2: https://patch.msgid.link/20260811-ipq5424_llcc_updates-v2-1-1e4350585671@oss.qualcomm.com

Changes in v2:
- Updated the commit message decribing why the change is needed.
- Link to v1: https://patch.msgid.link/20260807-ipq5424_llcc_updates-v1-1-1f56362ff687@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/soc/qcom/llcc-qcom.c       | 56 ++++++++++++++++++++++++++++++++------
 include/linux/soc/qcom/llcc-qcom.h |  4 +++
 2 files changed, 52 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 733999867bbf..d60431ace50f 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -626,11 +626,11 @@ static const struct llcc_slice_config glymur_data[] = {
 
 static const struct llcc_slice_config ipq5424_data[] =  {
 	{
-		.usecase_id = LLCC_CPUSS,
+		.usecase_id = LLCC_PPE_RXDESC,
 		.slice_id = 1,
-		.max_cap = 768,
-		.priority = 1,
-		.bonus_ways = 0xFFFF,
+		.max_cap = 128,
+		.priority = 3,
+		.bonus_ways = 0x0FFF,
 		.retain_on_pc = true,
 		.activate_on_init = true,
 		.write_scid_cacheable_en = true,
@@ -642,12 +642,52 @@ static const struct llcc_slice_config ipq5424_data[] =  {
 		.vict_prio = true,
 	},
 	{
-		.usecase_id = LLCC_VIDSC0,
+		.usecase_id = LLCC_CPUSS,
 		.slice_id = 2,
-		.max_cap = 256,
-		.priority = 2,
+		.max_cap = 768,
+		.priority = 1,
 		.fixed_size = true,
-		.bonus_ways = 0xF000,
+		.bonus_ways = 0x0FFF,
+		.retain_on_pc = true,
+		.activate_on_init = true,
+		.write_scid_cacheable_en = true,
+		.stale_en = true,
+		.stale_cap_en = true,
+	},
+	{
+		.usecase_id = LLCC_PPE_RXFILL,
+		.slice_id = 5,
+		.max_cap = 128,
+		.priority = 3,
+		.bonus_ways = 0x0FFF,
+		.retain_on_pc = true,
+		.activate_on_init = true,
+		.write_scid_cacheable_en = true,
+		.stale_en = true,
+		.stale_cap_en = true,
+		.alloc_oneway_en = true,
+		.ovcap_en = true,
+		.ovcap_prio = true,
+		.vict_prio = true,
+	},
+	{
+		.usecase_id = LLCC_WLAN_5G,
+		.slice_id = 6,
+		.max_cap = 128,
+		.priority = 3,
+		.bonus_ways = 0xC000,
+		.retain_on_pc = true,
+		.activate_on_init = true,
+		.write_scid_cacheable_en = true,
+		.stale_en = true,
+		.stale_cap_en = true,
+	},
+	{
+		.usecase_id = LLCC_WLAN_6G,
+		.slice_id = 7,
+		.max_cap = 128,
+		.priority = 3,
+		.bonus_ways = 0x3000,
 		.retain_on_pc = true,
 		.activate_on_init = true,
 		.write_scid_cacheable_en = true,
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index f3ed63e475ab..1ccc429401e8 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -86,6 +86,10 @@
 #define LLCC_CPUSS_HEU	 94
 #define LLCC_PCIE_TCU	 97
 #define LLCC_MDM_PNG_FIXED	 100
+#define LLCC_PPE_RXDESC		 101
+#define LLCC_PPE_RXFILL		 102
+#define LLCC_WLAN_5G		 103
+#define LLCC_WLAN_6G		 104
 
 /**
  * struct llcc_slice_desc - Cache slice descriptor

---
base-commit: 6a746cd265aed59107ebdaa9ce039bb832922969
change-id: 20260806-ipq5424_llcc_updates-f9851d6db886

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

