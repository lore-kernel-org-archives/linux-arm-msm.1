Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A623659FD
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 06:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789368263; cv=none; b=FgU6YAvdeiC38ZKxAklCLBLV1nLl0St4Fbvlx3gRSR00lH1ReJ5InF0avJdC/qqPYTYicdo1uT0TNcOehReamic3J2xYAdqf9ZrxYLqdBJnUIkB+cOmkowjEjkMj8fp4HVQJH+tGdnP6X4keYuxEqg1oAQarmtp63Mqi2c4+ID0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789368263; c=relaxed/simple;
	bh=1DkghmOpxQVQQ344fbDwVdJF/835lptBoNZwqa5eEQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tO9RWKm5zjlmg82kLrLhhjftHyRsK/gZksyRf0/7CG/fQHKoGKedx+GWzy7XT13ydNMVg5VTGEzgIcQbeb5/KOJ7W8yvYN/h1fRuvVpLWbqUuBztCQg9l688slTW7fhwIWbwSr2lDUdo6Ceh+mvPFG+CTMZvPvQKTQ22oT+af9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OckLvB6x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HKEsd1Ch; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OckLvB6x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HKEsd1Ch"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jAuC063789
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 06:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wo6lkBP6TqX0J1FUeHfohEqxSgaBQojAzmOdg5GekDE=; b=OckLvB6xmvUNUV3H
	j4NZSpVOzveMIzVMeVafEjAnUoofBx2QVq5KAMd8pnzkIG2mdaK4CORO+xOvSl8v
	JeyUDPo3lf7Fn4Wvu9gQRw47jFQ10D5+bc8NkcFL0MlV892ie2woQGj2crXfnKuV
	LnGOTShvrwU4yzCaCzusvpqDOWOu9FphLFEkEekHSLRrosxB773RsI2ZMr8ECghW
	0Zby7gKhfrmdjTu6so87tqXk2mfEvRsGhb6MOOu/829Cd6fToc7QWoDoq+AWwSTV
	dFccIW0aLdOIzedOE9PEq5tPxEwHX4WgIufh0hO2Z6SEZYPJMvkugaVszUko26kU
	3BG7/Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dne3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 06:44:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e87478402so76730996d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 23:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789368259; x=1789973059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wo6lkBP6TqX0J1FUeHfohEqxSgaBQojAzmOdg5GekDE=;
        b=HKEsd1ChPJG54AhdYY8JID25pJftAMjvy4Ysl7Y+/HvFZSofgHRfe+HnkY4pfSaq1v
         CMycySO0Um+CC1/FuWGqmZj75IvNFU4dl/V5EI3QF+Cs1ynocWtlAXHdKNj3jILmQUWa
         lfBMBOIAm1A8UVwEjPjVQOpipVYJuzTbHeJOODKR45tTv7Vhx5BaW0KnxJ6JcPEo6liR
         nCHVXohcx8BcsluNeVN5O8bJlW8JUSv5OZEUQDxoWU7hIQn1dWGw5cWrfQtH0zYWloOy
         RJqOkJWOPnliLFnaerq+13nHWVKKVYnZcyNFmmiKVV9L5Ile+UkDWsNtmvWCEyK/XwxB
         ziEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789368259; x=1789973059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wo6lkBP6TqX0J1FUeHfohEqxSgaBQojAzmOdg5GekDE=;
        b=G+6ZNR8rjR9vQ8ZOXFngm/BAk5vLUnykM2q5gNyaW59gV0KQblnzmIBKhQprbaDLxg
         ruz7iSFxC/qAAcS4cB91W+BJdItsVjbI2vT76RjkOQtR22YDf2lbqnj0DPsD62WETTrH
         S9kRBiD44PJsYFPzn3MYC/ViQDuobL0xjCu8TiuZLN+bHx0m8WpOFLQ0utWJD3JfwToQ
         FMQiHV3Tck3xH+8W/qoDV07gkcRu5t/RB8CMO8Hh4q6BDNvt7Ue9xrO5SCWislkL3jvv
         OB27s6x+h58hCJkW3Ywem/6xvLHoeYqsbqphNPkF3BqRhVrTn1bdSUdlgBI8UHWQKBy8
         Zl3g==
X-Gm-Message-State: AFuF++lTKZyBwQmxg9V6Lijaom1UO+q3BjBWLYOCVXskiuP2DaqBOu5g
	Zn9nrqFaQEJ+XmdtYePUzJo1bgoWqRueBebeEDChxkW7wB2Ip5Rn9UJ0Vp2KDHZgoFtcNA5j/lt
	GLdZdd0M92ypWWdRyyqvQyk63BrPjTOJ+ExndYFnWmH+M9Ak2pBr2qJJ350Uw7b6LnZap
X-Gm-Gg: AYBFou3wk78mCy/cSS+x5SnMtxoVSlKcmT9dj009/O4UVT7BVIn7zKn3hV9LsXXRs77
	fCJQT7EDi49HUVqpcCX9evO0Wvt89Ql/HfeCVhCYVgDt9aUHT2iaNq1NOWTrkjiWLjozFRouLhd
	FY2qAJDYQRuBuRi5jkTGrFIoNOyBM++m9xqG53/w7HXxQTbFQH6gLES1NbWAcZP6gy0H+U21mHS
	KwsCIw2P6WbmUJGkGzRKO9fMiylQS4YDXEmqpDBfW1ZLCNJHfktoceBUY0fHpT7D3Uzq9b7PjP3
	Ulig/YMDcMzAzxMb8lbgirpvDGMB4eZVBghMTGpPzfN2AYMyaOGkTYWM8ZvZKmitkZDQBB98RWM
	XLFfQ9rZ0wTQk51sZtotx3Rw=
X-Received: by 2002:a05:620a:6f01:b0:937:50b6:4a5b with SMTP id af79cd13be357-93a298dce2fmr172171985a.23.1789368258719;
        Sun, 13 Sep 2026 23:44:18 -0700 (PDT)
X-Received: by 2002:a05:620a:6f01:b0:937:50b6:4a5b with SMTP id af79cd13be357-93a298dce2fmr172169385a.23.1789368258341;
        Sun, 13 Sep 2026 23:44:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35f3d9sm23736954f8f.35.2026.09.13.23.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 23:44:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 08:44:05 +0200
Subject: [PATCH v4 2/2] interconnect: qcom: Add missing depends to Hawi,
 Maili, Nord and Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-interconnect-qcom-clean-arm64-v4-2-5b2c0e6a929a@oss.qualcomm.com>
References: <20260914-interconnect-qcom-clean-arm64-v4-0-5b2c0e6a929a@oss.qualcomm.com>
In-Reply-To: <20260914-interconnect-qcom-clean-arm64-v4-0-5b2c0e6a929a@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1862;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1DkghmOpxQVQQ344fbDwVdJF/835lptBoNZwqa5eEQg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqp5e85tKMoFWpUA+N/fZck3aARl4n/xy0Z195a
 S1g9dY/53+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqeXvAAKCRDBN2bmhouD
 1/HeD/9M+hHQDFfq6g9fb0+Xqyny3If7zxaSuChzneq8qfnroUOrLktosJ6zeou03Dc5lkEYqls
 L+HtHwT/np43Uic+t1mrmwIPC4jrazTxG9LcrbLS9m261q19ScdiKiEhljzBHokqDdyRC4gKfKt
 B+fLdytyhwRO4KKi2hyFsSp5dxM1WACjUn8vgnQID1XIM6ecZJjL5ewblpxAOEy18olr8rnL8fE
 ItXlPQLtyg/hpthLRggk3ZXZgVKN9m+VUuYkmLRaXTD00OilsU9NeeOkzTIHDx0fsEkRoAC+Gtq
 oSmKDNX3sjTCgWP7kKVah7LcSRTLVCpkeflE3MXMxbMpSBlPanBAtkV9F665ld1OnOd30e7wnZB
 wuYGoWVjL2+UKyi1CatdHOdnn7GC2+jdiJ9zrX8QbkPBWvcfnjNQ17oxEW8p9oD1hIiMiBKxPCY
 pt9uROC4DVY9Im4EgfvXD0fP55LRO3dalvalS5hvifpxqnD4h4oF0N4VrbPj+v+HCdhRjyD9CnR
 LBDjq0A2Dv/is7bYU3mmddhfuevy89i3rAugmzw+nfb1SlF4b1GDFR1BUVJybia2Pk4KAniP+/8
 ItROQtzaPy0uUtRfU8GCu+hlKOMcDPTT45fLIRbwtHxqTPUfRvg0ydB+KW4TmAeWxyjH+2+3eFQ
 r8jy3OKwgoo7F9w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5NCBTYWx0ZWRfX8P71ffHjIKHB
 pxVDIe+ZHh8ihyur9kKKjynljMMC1jhbT9RnLqLxlh+efIv4HdY3HxtT+3dmcaFVPq7v9aJimNY
 FPALjeumCXMFzulobTMTFpoHfu7bmUtLM85FhJ7P1I+a58+JjdDoQb9NPk0mUdovh2FXmLjtPxr
 Xb0VYnyThYhL/bK6AJfqkFgUbDOrIv732adpXloBcQde+vq0o41MuYohD2AAlchlG8czn4b1Pa9
 GX7eLDAKBMppCqvftBibQ8TfkQU81AhN91p/feYQHK8QWzOFWAKw+LvSPLSwbIx0w1FketdYozf
 3bOBc9fEChZpcw7TNjvl31+FHXnIBf2a3tezPsIae1CaSnxLYQE+oY0LOqwWcitK/c34uOFI6YL
 sj5kKK39hL+liGf5q5bThh7UvqF0pbPjZiVqgrt3+tDVFXOfjjmlCp4Efp969AE7h3jtYvbLfP2
 Gl/T3P4s1Tqm6klFVFQ==
X-Proofpoint-ORIG-GUID: T_vd53mPYXmIlhEePxVYOOnApZ8LLPyk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5NCBTYWx0ZWRfX7p03t4JpY1j2
 KeV2URaoH2Q1uPqn8VWdaBQ95Ho3IaWtWrqys/I/3UVMRuYIj/RVeDaLQTWK9xIJceLRpQeBDq2
 XbKPq4L9e6FQEI2U399ZGVAQAGq5JsM=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa797c3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=kXAE_2JiKEgLwU3Z5NgA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: T_vd53mPYXmIlhEePxVYOOnApZ8LLPyk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140094

Hawi, Maili, Nord and Shikra were added in parallel or after
commit 5b696f065843 ("interconnect: qcom: Restrict drivers per
ARM/ARM64"), thus they missed the update restricting them per
architecture (with the same rationale).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/interconnect/qcom/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index d6c37704be03..da7af117466a 100644
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
 	select INTERCONNECT_QCOM_SMD_RPM
 	default ARCH_QCOM
 	help

-- 
2.53.0

