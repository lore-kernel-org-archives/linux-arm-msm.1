Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042B92DF68
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 12:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786451702; cv=none; b=BEXv4dl4YAjWRhOQPrBihyaTD4PJvA+V6w/Z9tglM3UrUro9ftT8lbXvJqDMj2jLMjc2bhSiwMFWYe5dVqy5SXKIlaDuNDgqNTNc5sULSj+hFtblMseMBW7RviYeE5796SXXO2u9R/Jn1BuismiuSmqlCJxmH7wpR4vt7ADAfmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786451702; c=relaxed/simple;
	bh=pTtCBD3ERAMY1EfsmjzOg61WpsLF5s8z8Y2A8sLdyEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qdRo/rJzyQq6d7GkZwD6h7dT1RSlm/EQZutBBN3Iz1oY9/t+sx9p9XyjfB+2pOOhJMGFamAjB1gkbO3ThH9t+Nduv0Bq2R7H2dilIx3HfzC/t4priPZm41DEZK60zQhXGt8YoA0FHriGd5z/rrwMTHyB4kfc7hLPsQwD31wW3ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KHMQnOse; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ftfaj+MM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KHMQnOse";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ftfaj+MM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BCRFo9939613
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 12:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Rjke+zbMKhtbWdY2nt3F5Q
	dhyqMpEki89Iw6iZm6c+s=; b=KHMQnOseYwaEhhhmy3ucvanCLJqXeKIukE7ecK
	kJMuV76mryvxGita9l2nI/d9L2YKs+MjM+eCHW65xcI9Ra/qJtEx72WxcMgKDgKL
	A0axpvEY3r04VamwMakdGSlsqmA55YRsmAvKo6jP7aLFzdOOWXK0D14BMOk3ChcG
	5XWWlRQwDnYZYKh08/Owa59WnIXxaE/gxVP9vddJX+/OONhLuo2WYRb63aNonSl/
	8m+JjlG7Ph0n+arnotky/kz6oJ+5D/UPs19dUyvvQxTo5IOZ6MT9alFLfq/zavIR
	VdFJetx9Am5ef1xVTLEDLUof1T5IcC5Ru+QwPrSXMrCHRU5g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjyfuyy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 12:34:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c856470fe9fso2302083a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 05:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786451699; x=1787056499; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rjke+zbMKhtbWdY2nt3F5QdhyqMpEki89Iw6iZm6c+s=;
        b=Ftfaj+MMcJOc80CY94CSRfYjV0Ndpmz00jiuzRxwFzGEngkX+Ef6lpcdfo1Tehb8vW
         /BDWu39O1apPadehHA4TK5IIIs3+mCy7e3532e4YfgJNavF4waLWYwGQ/b23W2SFb7Ei
         14weHUR6gT/5lvICHNPYZ+HqtzIWvY5aVKFLMyVpHtSU3J0BQ3tK0tGDalScA1D57/zl
         DVhgonc74WUV7Ap5/6oq2MIYrzZew3j0xwH7TWUTSymPAV7Tmls1tshdvS7mnJgJ4vIf
         qb/Mv3vfjF+0DC9UEYNHsBafcEtzybcWUo4f5M4jIispvsbdOvrjzG+mKw6vkhObOKuU
         6bqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786451699; x=1787056499;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Rjke+zbMKhtbWdY2nt3F5QdhyqMpEki89Iw6iZm6c+s=;
        b=EI9BbvlXmIq1HF09hE+XdzNUpoW41VJMLwBWZ4x776MB8eW8O6PgCf5FdN4r2HBtI5
         OesWeDcP/VBOriaBTmDPOtLvufCwmj8ZJGoey4uzVdkQ9IIggtJMnSH5AOHICAx/b3as
         Vf6Wc1gW5xIkvwovBxgJtRFmnnBKN1XRcoK8tcewEJATwgXac4CMgaUqw5EvObFlnFEN
         AmpK7xypu4trfdNxT4X9/7RU6ThDXDGphnFWo03NTrPbJoBgWBD8Ucrcrk7b6HFrhQFk
         k3GHjnNQYclPbsNA/Yu1J4A7lLCrMu7D2+Mimlq40FiShaHdekeLPeB1L9E1lQP8aBFz
         DM+w==
X-Gm-Message-State: AOJu0YzaEYxUtWioSJVfAxOd6KFPY/UVHOqpHY8mv0eib2WdiUAH6oHw
	xzoT7K/Ib3/1dURf7G3LT84CpzBiIfKFr2jakTkjpTpzi3YgH4Cod3F9ABxHle66FVPOrZ8KaY4
	gddOtYTXlJhZY4PhqffDzmNdWLW2CziSZu83460iXac10/7x7Yv0Weed01fM3nfuCBuG1
X-Gm-Gg: AR+sD10vFloQYCRdUnMM80EoAFyXU4WG4SGdKEsneyHjZwYjoluqa6zeeEDCGUtepq/
	px0DzUTBqtDLxsViSAGwMjXrix88/tfktuKnMWp6ueLwkN+WEGXsXuhTqkirlwVGEM4LocwbT6y
	BrjkuBQ/6YflOB/Bq+BE6jeuybPGikTBBv4zJaR+WJER/bmq0wWVViJUxzm5Bw4dAJUQqjKNo7K
	KVXDVwguol8+m8O4Ioft4DPTZSUV+KEwb/z/JyHzL6KaciC4EP8pK3SevKf5A5PakmXTfiD/R76
	aY+fDqSA8b84E+RRkOwZ7R0dem0tMxNPHkg7pNmL4OGxzkHp1o3y4QRPuIcp4NKihL3t5JjjINr
	fpJop4rW0EeR7U++2/9fxWSdOcGOOZYHUzaplgjtDizBCAMtHf4znterzXh33fh3e+ecZ3XIfDk
	ebyleLHIzTC6YPct+w/Y3xteVY8xMegH1FyLw=
X-Received: by 2002:a05:6a21:6197:b0:3bf:7bf7:7913 with SMTP id adf61e73a8af0-3cc2b9b3746mr4035293637.14.1786451698855;
        Tue, 11 Aug 2026 05:34:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:6197:b0:3bf:7bf7:7913 with SMTP id adf61e73a8af0-3cc2b9b3746mr4035232637.14.1786451698420;
        Tue, 11 Aug 2026 05:34:58 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31c6404acf8sm4716282eec.16.2026.08.11.05.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:34:57 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 18:04:53 +0530
Subject: [PATCH v2] soc: qcom: llcc: Update the SCT table for IPQ5424
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-ipq5424_llcc_updates-v2-1-1e4350585671@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOwWe2oC/22NywqDMBBFf0WybkRTjWlX/Y8ionnUKWpiRqVF/
 PdGS3dlYODAvfesBLUHjeQarcTrBRDsEICdIiLbenhoCiowYQnjiUg4BTfmGcuqrpOymp2qJ43
 UXESeKq4aITgJVee1gdcxey+/jHPz1HLat/ZECzhZ/z68S7rnforiv2JJaTiT8zNnxnBR3CxiP
 M51J23fx+GRctu2DzKvveTRAAAA
X-Change-ID: 20260806-ipq5424_llcc_updates-f9851d6db886
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: TGmvyGXiDRwj4ccOZr3FZ6_Tob52dX-H
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEwNCBTYWx0ZWRfX/lpvfCNZPL/B
 eYZ2x8MLxbaKKJ114cld1GmzqNoje9ZnemxRH2N2P0MIkYNvKIQLnhVu8wCb2El9F2fsONDZsu9
 p/ZlNqqKwMBlpby9vqQt06LMWadMhCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEwNCBTYWx0ZWRfX5Fz6jR2tWmvH
 6lthCh9jDILzA6sTZijmufe3MxKKUvzebNEpickYU43jKLvR0sPnZwUd5meDSiX6+AMJeCap/rC
 DiIRbW3aiIQX7WOHxstbSpALzFZZRvdJi5VjwV1TJkW5fK5jqqIH5TPYMoQBGCaSC9RtIQotVTr
 Zv78hZOv4sgRh5ndKi48KB2RYNlsgCVUpJKEZkDmSx8u808SG3V58FFCP11cTmuOTsohJkTemeM
 KR5SM4DkWNdD3b3RJ7t18X5tJhZFBxD84R7renqSPlznPuv2hz9QKC5N8tyE7lCSXFXVenYGbh7
 Zc03VULeQ+niulX3Qcm3BNJP5SDighc+eBLt2BYM21CUWJxArySNDABtCS22nS7DbCDvq51cJF0
 R/WtnErcfCv4baeN7WLDHP5nNvbHJ/7B/BaNE9vl6CqmUSEi6XOWv4o3xSFF2+MpZztB6e/Ud3b
 lilOcSbgXL74wYUOkNw==
X-Proofpoint-GUID: TGmvyGXiDRwj4ccOZr3FZ6_Tob52dX-H
X-Authority-Analysis: v=2.4 cv=Zd4t8MVA c=1 sm=1 tr=0 ts=6a7b16f3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=EQIC69WgoSIuKX-Q-KsA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110104

Update the IPQ5424 LLCC slice configuration table to give the PPE
and Wi-Fi datapaths dedicated slices.

Assign slice IDs 1 and 5 to the PPE RX descriptor and RX fill use cases,
slice IDs 6 and 7 to the Wi-Fi radios connected over PCIe, and slice ID
2 to the CPU subsystem. Adjust the corresponding capacities, priorities,
and way masks for these consumers.

Having the dedicated slice configuration for each of these use cases helps
to improve the networking throughput by more than 1 Gbps.

Rename the usecase IDs for slice IDs 1 and 2 because LLCC_CPUSS and
LLCC_VIDSC0 do not describe the actual users of those slices.

Assisted-by: LLM
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
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
base-commit: ea2bff00da89d7767d677bb68470130ba96f4928
change-id: 20260806-ipq5424_llcc_updates-f9851d6db886

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

