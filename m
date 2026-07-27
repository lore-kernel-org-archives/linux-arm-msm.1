Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748C23FBEAF
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 11:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785152697; cv=none; b=AtLhtZD5UR1Z8n6NDQgD44qtPjY+pYXkrXH3uRn9+Wo1uhh3x5ss4bjTSqmXzAhqd8NAG9TgBL92cGL1eqLhqXlkFO1kOagVeEsic9sWYBeZsBfpRVqRXzlY80LVZZo8y+zjd2eCY9p0Lx0s4GfB9CNoQNkIyihFD8qdJybIgzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785152697; c=relaxed/simple;
	bh=p4HPipW1n6dIigIxj88W4VhdwEypcbER4MfbZKrmj8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dFW4pCDaO0WXubasJb1mg/B2x2eEpooPqLltEyuuiY6v7eupk2vTCk5j5jJlZd5pEfjNAzp9dxFe4hueKxip/E62Q8xGKj6kvEJBUPdaNaLkD0AQfgjhBa795O/vhSKpAa8zWEl0uTU1R5cgS+/pdcUt2RCbtYcPKOl5Z7OXtpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lXG7Y9bF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e8c9UQZJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lXG7Y9bF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e8c9UQZJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAM7mu3439031
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 11:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ChWZhY5E3AE1vUOFfitW5g12PfelZzrDjk8YzyVcLH4=; b=lXG7Y9bFNbwArvze
	AuI0upYrc0q4x5rzyvg2ZQwBRdi6jfvGJBSW8dyv3p4jAVaTK+KVQX7b+LaifJRL
	ZCMDKoxnE2zHRoKddNHQOVJ/dnzfIYxwFVQcrXe821u9brZYhSu5HkBE40Yc700/
	QymG63FaopIyCLmgeuymLJdnh1hyrG0oVW0h/5ukxCKu5rmnxlKlYU2gOjYUzGpX
	vg4KSeb7Sp/wtQ7o0ntVqCRICc1mEhyFt71qCjGpijrEBjvXOmnLfvZJsnQZjBLn
	hY+MK/AY5Ggcm9Yk8fpeGiHdi3hKYXM+nzuDGCMxFN60klKHtt9f2jrOAElBOwP5
	TEJ5BQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4ukret4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 11:44:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bec738909so27058941cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 04:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785152693; x=1785757493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ChWZhY5E3AE1vUOFfitW5g12PfelZzrDjk8YzyVcLH4=;
        b=e8c9UQZJEU6MVXDKrwQrQGcRNfW1FutdYd/W2u0g40dx4/XLRxrcHzNzmrUTiLCXwi
         grPt838ZlGSNxPr2jPCPvJo39VFtBvL5IzXWXhPQao7b24djnqAIuumTP54M0IF7eaoa
         GqOgPPmOZ+TP1yDtTzbiYk6gGdcotLM55GDs+5q1Oj2DdwyHMNDMyTH4HQEDw5EmWTnL
         YjhQ/SO6xkq/Tid/2oqivg41+4IC0x3YErc1KCTsF6Ez4cpzkbSpnz+4NpvVRJLjwoGK
         z2/1qKJvI53OAv32/WBZRZgi+t1HG7zVWWYtSMx0JuaIGx/+NEuYkCa+ZDzkgADyUksd
         HxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785152693; x=1785757493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ChWZhY5E3AE1vUOFfitW5g12PfelZzrDjk8YzyVcLH4=;
        b=Pu/37yVNPE+MZV1NLjoTPoRMp+C1my/pBRE6XZlFIYXMSLoZsl8yHL0X74O4rsfPUV
         /idHg4+EBW+RfAbr6EgC671VKwiFypOEqKYR23ftOTDqTCfhqD2LnQWq81VUlE1yOTbg
         NuE3JB9KwDrL/U+AOIjUwemVRiXq9DmRF+r6jv9cSzPZ0RW+xyfq5XxQ9VDYRlVOiRtQ
         T5pomxnnRaMOrUR3Re8lYmp8gFRnxOQ2essh8pOO/WXNqQe35jlIc6nO/SP8oUwwWCe7
         +TPseGPgUfGHQnvsx98FtqX16+BmcUHf9bApX9nSPaxR6/dCUCBVwvogl9IZq91QvRBy
         ypmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrc4DP2e/qP4miiS1eEgOQcPbSZiLEpmsDbjcG4s8GeZIbQ3QcHZKGLrLyrEWZSvJea9UynMyw1iDlFpUte@vger.kernel.org
X-Gm-Message-State: AOJu0YwVIzEJJ8NZW1BpH+nYlT9ATGy0fTwc9lKFO4ZJxej8WbmWDZx9
	k8rmGZNlfpi9y/0kBtOe1xE+0EftbIeb7vRgYta/vztIgiULIUhxBq3784kqnNibaH8dZ5OicHm
	T3YsC+oaifNZrNtQnqlQp/zmcAgrLXBfKaCjcRJVTcqTIfONrdwu9+NxoDVz1W1gKOrmg8OUqzx
	YD
X-Gm-Gg: AR+sD13ND7wrSDBXKU6nulQ0NTj9MlC6d99NXhWtx6z5lC+D0wAOQ+9BcLhVvw3RWgs
	AUdG8cDqYJXl8x+FMUbSNbE5WywHfUD2ZM9Lws2r1JdsLwXccPtsfGRtnIf3uHhoZ5fAzltg6lF
	o6SDL0sUkiHzT5nbjswDf+H0IQnAmll0UePQHLEoX1iykmYOX1HmamrF294ybZFBrlKeby6+Vd8
	g87HKZoRJo+4IRoPI8EPJHJqSOv3AeDYRsGt/Aax04JsQLMPbD/qLA3WPWmDCHU6usVOFybRq77
	sqIJp5l/LDy5u9HhcFbpVc/mXjms10+MrpOgJt0OfSl4yZz4RQSxCCX4HUpfdBHuH5xwjrZg7tK
	TmUiO6i0Bt15XLTXFuaKaTSLO
X-Received: by 2002:a05:622a:4d2:b0:51b:fde4:cd4f with SMTP id d75a77b69052e-529a84bcc40mr78441381cf.30.1785152693682;
        Mon, 27 Jul 2026 04:44:53 -0700 (PDT)
X-Received: by 2002:a05:622a:4d2:b0:51b:fde4:cd4f with SMTP id d75a77b69052e-529a84bcc40mr78441201cf.30.1785152693304;
        Mon, 27 Jul 2026 04:44:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6e9a2sm50301883f8f.35.2026.07.27.04.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:44:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 13:44:44 +0200
Subject: [PATCH 2/3] irqchip/qcom: Add defaults for desired arm64 drivers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-irqchip-qcom-defaults-v1-2-ed80ad83ca53@oss.qualcomm.com>
References: <20260727-irqchip-qcom-defaults-v1-0-ed80ad83ca53@oss.qualcomm.com>
In-Reply-To: <20260727-irqchip-qcom-defaults-v1-0-ed80ad83ca53@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1408;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=p4HPipW1n6dIigIxj88W4VhdwEypcbER4MfbZKrmj8A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZ0SuFoed6EUadosZ8EK96SG/LWPV7l/Csb1Q2
 FcZFYMgwHeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamdErgAKCRDBN2bmhouD
 17pOD/0VlgNqVX86y1cPLvBpNykQtnJeu56HObI2BTsHgSnGUeMJjQxfwrp2CDcArineYBdbmtZ
 oJmDkZ+IUTV5N494So4MO04w553OqYQKQm/RY926TSgwJz3gh6dhSwUuBWmrI0gngTrm7oEe5My
 cMPhUYHTB63MyL+nnfsv8YFXyvfPdfP4KpyRN/O45DRu28caYkL/RbLfmofymxExPyYwisBEUy4
 0N63SoxG6e4zuuGWV41AgZfXn4NtbgJ/CgNKyGmOsngqYekTWTILtHty1friq9OPzBieyMmJI8K
 HOSYWcXDFkDCc1ly5BG5FDAlRTIB9eGaj8nPciCot2VYceQ2zWtvirGwtdBON5+zeFqDCwQ3i/K
 lJfEB+RrtVym5GYEvCkSU/5f9xWIfEQSGhxF2s2uEr90pLq0FDEJ8PX/0PW1Vl1PkGHxslySGJA
 RlGTbsGnvyEKx8sp5crCundDcZrMAMjUKfRTGV/8spEZQASgfLhFv7VyE50bD+XusohgUeiwlyD
 bb3QG3CVBn8LTqDPMNqx7XtNcvXQb5JWPdK7cvWnaExeeoEcZd7aQW/fupd54GzM7fXfVFHjvNG
 jfNvlcLkRqOxgpde8N/mUQFhWKJknzu6V9nXffZDWSOBstexWxSN/10itJzuWLjIDWfFBc6bNeA
 RoBt4v8RZ4FUEqA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: HQKZfjQvlcgqDzTmN5LaAeat7zDt3ypF
X-Proofpoint-ORIG-GUID: HQKZfjQvlcgqDzTmN5LaAeat7zDt3ypF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDExNSBTYWx0ZWRfXzgBH3ZVCb6we
 /CllSiwl+OdKyD+5VDaUlkCIb9yIl/C91z5KEIvTwUOTaOx/qnbbCnOWWZHxPr7Xv6IFQ/ZEXw1
 x6ZNnk6ia/RDM1e/U1QUX9qeBTCoV8M=
X-Authority-Analysis: v=2.4 cv=PeHPQChd c=1 sm=1 tr=0 ts=6a6744b6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=BWlt3klZKUeuT-1Z3GkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDExNSBTYWx0ZWRfXy/0XGrYfnNAb
 ehpmbORYKM4vTXUQ2LIEFG+EACW9qLp784r2dcimomCYlURM3HhYZ2dmZCAuW8Z3r0M27DECjj8
 d1h2iVCAmnKg2bAPggMlwt5i6kXr8Dgfgn6t/nvuXllPqSFarGHYDPZyIKAbv3PLFTDdQdsnmnV
 q//ToNNdmPCxmphnFliYak7OfL9QrgBOg5TtrC+7BRCYOfcJiI4/J/jSmJW3eq8YXkeZ/P3Uzty
 4kHxKwoaeeNjwH3FCQuCFvFUgdR9MZkKHgQa+vSLG0WvhqcZieVJYZgfVe2ixLDtekDNWTgznNA
 N2DH/zPB4kt77MpCi5zrf6OHHo/BVEN0uYjypUy69+k36XAPCCivJpmnYsdDLKPVyArvEdXE3j0
 N3lf0+UMmeRLS8muCm7Q26/pQHZWS9iLhOw/HK5oXvSsJZWxA6VYF6D1L9UUNFG6rMRaZWYv6RZ
 PFMCBSLjd71uG76gHFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270115

QCOM_PDC and QCOM_MPM are essential for booting up SoCs and are not
really optional for a given platform.  Kernel should not ask users
choice of drivers when that choice is obvious and known to the
developers that answer should be 'yes' or 'module'.

Enable these by default whenever a kernel for Qualcomm SoC is built.
The change has no impact on arm64 defconfig, but will enable QCOM_PDC
for 32-bit ARM multi_v7_defconfig and qcom_defconfig, which is desired
because SDX55 uses it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/irqchip/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 954137395bff..5427257c0230 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -524,6 +524,7 @@ config QCOM_PDC
 	tristate "Qualcomm PDC"
 	depends on ARCH_QCOM || COMPILE_TEST
 	select IRQ_DOMAIN_HIERARCHY
+	default ARCH_QCOM
 	help
 	  Power Domain Controller driver to manage and configure wakeup
 	  IRQs for Qualcomm Technologies Inc (QTI) mobile chips.
@@ -533,6 +534,7 @@ config QCOM_MPM
 	depends on (ARCH_QCOM && ARM64) || COMPILE_TEST
 	depends on MAILBOX
 	select IRQ_DOMAIN_HIERARCHY
+	default ARCH_QCOM
 	help
 	  MSM Power Manager driver to manage and configure wakeup
 	  IRQs for Qualcomm Technologies Inc (QTI) mobile chips.

-- 
2.53.0

