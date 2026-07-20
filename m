Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CEC392C34
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 19:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784574224; cv=none; b=RD+FOtcF8qD8l1MRHEFP7DUI+t+no/nutsX0QnG92LPLzQU3yXS2F0w7ehyeebHcx+iblRIfW+xSR+wwXglKLK6VxTHw+3KlbqaRsOi/tj3IukqJ2VfmZqkDMp2Sy0AmbiOkMbbQZ7F3AO7KIkDH3aDL8amPsjcDgVQLmsjdH3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784574224; c=relaxed/simple;
	bh=JR4Ua1kfTiV8QNLHWvAaewWDC4h+Q/DLdnHAzgTqOfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OWT5ew9uujMF11WckPM+lNQIQkv4PEmxVVOUv3x1UYTPt9T1OLNUukvLqxvK7IxhtO8ozPiGPgO+cw+2q/W/RcYNSp1dCj2FbgdYZiIIrDdmPQF6P1xtxiphgosaROpXMjrqYOBoo9EZIqqS2RvlypuX+2zIk7zM9qwOfLWCfGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ee9dd5UK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NkLVMGm+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ee9dd5UK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NkLVMGm+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KHBrPi3442630
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 19:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iqC1UMQqgc8CPLMgHXDTgheCDiJEX3V1C83nXvjGTf4=; b=Ee9dd5UKiMh0diim
	DZLA45h9K5kuPbDDEtf+J51ane58QBP3HWL0/oz+n87oeSB/JCGVkTRM//6ZjVfS
	WiXIDGH6TO2ga0mV/jP9af2beUDMcy55YtHwlk2ZEEg/t6pIldW7Ll8hLtiLOchh
	CtkhvVmcg9Scd5nPo8QYyona0q1Qv7nlB5ylFz9n86PuAPeno+5MqVo9H4fAmwIm
	ggO/GNKlawhoj7VbkHs5vAm3DJUoQqCsN59naH8MTSO+GuTUGrP0isi9DmlOdMlS
	ZmqvMOuHd10wa76g52bq+5vqLOAmOtt6+mik6c3OS/lVVJ+x8P8Ip7/azmDafAa5
	x/nxTg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5rfbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 19:03:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe3fa93bso215911181cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 12:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784574221; x=1785179021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iqC1UMQqgc8CPLMgHXDTgheCDiJEX3V1C83nXvjGTf4=;
        b=NkLVMGm+MeFA1WZCO2+eOMGhO/SKUpKZ+hkTYMEcOT/lmYGDUo+vGuLEev5KEd6SXt
         l5p6EjHs+AVJ73YNYRhSE1M/WgSkxUAQNN974Z8X7P3dFTNmj5Yla+2j2gDGp8P7FiYq
         pilfMmr97t5fQBTBTCkACSc32l/357dusY59ZClBTcxR0biA0etkaZGd4oitB8AU2zcb
         ZdvGprNBTrstuU1K+mmNPNgKpNNsmMu/kB8aZj13GFMq3a0t0Q+3BBYbka/41vrtb29F
         8x7QShnOmtCyHMTEIDhIN/9U+8y/12uAz84r3/uAb/vK8HlqPGPJj1g+4MQusdY3xjri
         CtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784574221; x=1785179021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iqC1UMQqgc8CPLMgHXDTgheCDiJEX3V1C83nXvjGTf4=;
        b=iV3u0MxjxEnmQUVKqITiC3/6NyEdRYXqWXVspIGXPsIl++2+d5ek+OSZ1FRG36WqfW
         yllgsIsyRiJEY0KiRLmMAKtbwPAWtNQok1cgof19fZhUnQz3DR74luIpc5kNNU0uJgMt
         gwuRixKODhqRjZi3DqX0mA8Qm9Boeq2tRRvBHSe6NTqqAzHcXmgp3ylXgxJ3gN9mRKgC
         StNoVLS2iNdGkl9cldn8MTH8FSu22nDgg7v8KCBjmLj7k3UAqPPw9IFlIBjz04JXt5CZ
         2NKvg9Onx0qBHdxFek86AXKYE9wlG99x/8rSafxoa/W0EWduKKOZkSifyUQZ68LXGRiO
         +2Nw==
X-Gm-Message-State: AOJu0Yyiq5anlP59XRyAdEeSzRfwIsmIYEztM2OEczFCgmquGU4LfBih
	K783x/PShva4NZwU/Bc2jpdsAdQvgkI4jBzvn5r/eX+5zG9wOMNx+EXCmIsbpJd2zCso6briJmh
	UnqKA27h3tSREQnqs/eYjdNqtcXaa9AgkXToiDF0OJdipOACONZX7tnKNFrjT2LgKJOrG
X-Gm-Gg: AfdE7cmSsAkT0T2XPbbL9zF6UqLDIRlOXJVwB3S7l4Dy8UBa0EViFqkiA39LScNLVjy
	yUj52L5BHO7hG79gnxwYyZWBmB5IxwpluHqLdYy0h6HjwJvNZBHlCQn2kJlY7eFepp/F74kgWFo
	kiC9v5JM4tsW0IWq6sTtOSR1ASzHAUOszxNWI1+2OvcCoF1jz8dZ206WM4mCdVvrxvWYRFTMc3j
	N+hjdnVfGc1EbejMjlKqAkNPrnYHTPO1BpZRkcEXGdqZ3jbSHIXZnS938NmpQ00Q99xrTwMzLIN
	22q7A105kJkVE3WOGArqAj6pSZAxieH9w1JC5275k6t3t9TaE3bKg24q6MmTNsgJTtJqj4QWHUX
	1RkgwFja5omk9LwxMtFODZTUF
X-Received: by 2002:a05:622a:1e93:b0:51c:c7:80a9 with SMTP id d75a77b69052e-5213e67fccbmr148137471cf.72.1784574221162;
        Mon, 20 Jul 2026 12:03:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1e93:b0:51c:c7:80a9 with SMTP id d75a77b69052e-5213e67fccbmr148135381cf.72.1784574220301;
        Mon, 20 Jul 2026 12:03:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954aa1a231sm181509845e9.1.2026.07.20.12.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:03:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:03:28 +0200
Subject: [PATCH v3 2/3] interconnect: qcom: Add missing depends to Hawi,
 Maili, Nord and Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-interconnect-qcom-clean-arm64-v3-2-942e8ee7ebda@oss.qualcomm.com>
References: <20260720-interconnect-qcom-clean-arm64-v3-0-942e8ee7ebda@oss.qualcomm.com>
In-Reply-To: <20260720-interconnect-qcom-clean-arm64-v3-0-942e8ee7ebda@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1801;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JR4Ua1kfTiV8QNLHWvAaewWDC4h+Q/DLdnHAzgTqOfo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqXnEEgrUOpRMy9halmAy6cWzO5c61ytP877DCz
 dFFWF6H9S+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCal5xBAAKCRDBN2bmhouD
 16vbD/oDIiFjy/YVbi5bMN/w9FKQXVNTxdv7WkDt0g6ecjSOdiVJB1Q/u/hb80Y/+st/ZN94tht
 yu/YpdtDOG4+mp98S2EEgwW2RoXI89aPbQ15TywWiM391daJ8s+eFzdpU8VlOuhTOGkSLld5wtR
 uoDYCtD3ltFMZQdd6QjqkOMDCUslEm85Ld7mdRgyazzw8HF6SXDNFtm1qtYoJaFTEm/ZzWowk+a
 xP2cFso6cQDU7meApg2OG6DHbVgkIRblJiSsbbZX6ISBZgUOZmC8/PxWtjoSRsrnx9hBUMt3SSK
 hkM7+rCitFrS1MPL0FWOZXsZELw6yR0O3+UpeXP/tBYjtSjwhAlkfxYmbmxp3oazpo/iyq0gQAz
 tdfdeTaV8IwoMNenpNfUdxZb4Bo1mY5ew+fFwcWRgSQjbRRUYjJGaA4FWNryXJVuKJN6nOYRGfu
 1Z9Abj+BGE1+IhWj0D6NfJMRIaQV8aEKhDLjNy8xYcthJQqOH42mvUvOESsY8gM3MD7VVJvUsjO
 V6NeJfyEvcwzLL3nLUEhtgOSBPWnOnIrNj1K6pe8TS5O4A7kCk4zS3xea11QlIl9lfnxVC+1yP2
 YlAkK28cDTmhBamhny00xbykKyZ+kzGIces+YyZ1oA1TwcQUotmMYNiaUbpQEzj8qQcWGuCnIVs
 hnr/c755Q/Y8oWQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIwOCBTYWx0ZWRfX+6owmqpB8KLS
 dh4lr591p+lqSiy4awjhIL7AJgVtnAff5Ve2IWfHcVTgd/KeBIpFKu+6EUQ6JKG+R1LxROOZ+RW
 ipc5vq2FKIdLDu2FKeEE76jjZxP8DOuVvzAAq44WMG33cb/OvwBkHVt7EKFi4wYcWecKz6Y3skq
 st6iKqnb/7b4Vev6vndjHepuOkVp8YiBHA8YwzURodR9DIYBCJW7XP9rxCNOs8DDcyufBUOESBK
 PPDm/40mf47ZQJWHbqHMZC5an+qy4zyvRToTrbwez1ROwattTAUWbwa2ASM+g1GXaQDezYxtZcd
 mqcVap3Y5YeCO3fDunfXgegnG25lwOQu2+EwFThmy83950ZfFomOHxU01NVtqPLU58jVMAtgLks
 ks2MCEv9GAvThtlwqALTgCnFlC3sE27B+ZCGrlqkw4zL38sw85NjWcFIvvdpO91cXPXo377A68s
 cOQVc3YED1BTJEk84Aw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIwOCBTYWx0ZWRfXyZyYJJg4yKlC
 r9qTz7jYONJVD81UPe4jsdt65a69ZIkgjFDu2XkJwLZEuHjBwM6HMStyfbm/ehMDW4wwBTPrWUN
 ep5UreFoCpsIEEatqHYN2A21dVmczfw=
X-Authority-Analysis: v=2.4 cv=WNpPmHsR c=1 sm=1 tr=0 ts=6a5e710e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=H0ku5XqlSbOf5Hpt4WgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: PLSaLthqu71vERR3_BLVk20NL1Ky8ELU
X-Proofpoint-ORIG-GUID: PLSaLthqu71vERR3_BLVk20NL1Ky8ELU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_04,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200208

Hawi, Maili, Nord and Shikra were added in parallel or after
commit 5b696f065843 ("interconnect: qcom: Restrict drivers per
ARM/ARM64"), thus they missed the update restricting them per
architecture (with the same rationale).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/interconnect/qcom/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index dd8774d84321..6bc2038de28a 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -34,6 +34,7 @@ config INTERCONNECT_QCOM_GLYMUR
 config INTERCONNECT_QCOM_HAWI
 	tristate "Qualcomm HAWI interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	default ARCH_QCOM
@@ -55,6 +56,7 @@ config INTERCONNECT_QCOM_KAANAPALI
 config INTERCONNECT_QCOM_MAILI
 	tristate "Qualcomm MAILI interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	default ARCH_QCOM
@@ -146,6 +148,7 @@ config INTERCONNECT_QCOM_MSM8996
 config INTERCONNECT_QCOM_NORD
 	tristate "Qualcomm Nord interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	default ARCH_QCOM
@@ -370,6 +373,7 @@ config INTERCONNECT_QCOM_SHIKRA
 	tristate "Qualcomm SHIKRA interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	depends on ARM64 || COMPILE_TEST
 	default ARCH_QCOM
 	select INTERCONNECT_QCOM_SMD_RPM
 	help

-- 
2.53.0

