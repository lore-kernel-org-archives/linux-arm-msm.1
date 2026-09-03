Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0106C443315
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 11:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434560; cv=none; b=OzdMJpb/lJ0twKlbzEGECVTeuVwbEYCwCFcTYBOrqC31jruOFAkgCcuT7Zx0mkcTsqb+qRYERPzL/9Bi8UPJ2b/+xR8sUczNmUuH0U2xLbZhynwlnTKpwrF7cNeSU7M3BFfbXqA3IZ0a07xmhwJlgRYNjV0AXbXCP9JXJ36Zr7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434560; c=relaxed/simple;
	bh=PZapi8obVNW5dwmJHh5jYWspydB7QgqalnExU6Kb124=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QJoIUdjFuBjH4toRqzDJkqceqftz6ntIeP8RV9jZ4DP6pRRbhtNMSg5VHsZIlVTElnEaiuk2kQny3AepHKJsd6kFPAtCaosLJCjq1nkqLxnWcizaJEMVxBIhSqM/IqhbAgPL/B02Np3lC/k4aWGv6Q9uDf22YVtl9M/7BCn987o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NRQNMqHf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDDwBf+F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NRQNMqHf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XDDwBf+F"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHDfl327114
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 11:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GA6ptIiaRPy12HrgsVTsXS
	YcvjB7F8/6vwFnAwwMsqg=; b=NRQNMqHf0oRtxDyWbWgDEvf24ZENSbV0EYG6is
	7bihJRUJIluhG5MmwcBzYyd14jmSieg5HpwRIlE7fb59m/SQ5nTxsPtuzcUuU+EE
	MzYehIklxKK1HUAwTTpYsT0ES0HVM4vWt9jxJ6/MfNXT24U5oH1+ruO0K/7QTJ4j
	0+iMel1IQ64E+HbPisOzpHGbFDSoCAxu37ytnurCfc7PpEAGPg4b3hD97u7klh1g
	DtRSNIKurq8484eut42QebCg/nPVQgOXjIlW61995LJvj5drzlwvtuFvevovNQXi
	kx+3y1KyFMKqXy4yDwj6n466Ajcr2fujBLpco0SvBKO0dilQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekgyc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 11:22:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso343427585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 04:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788434556; x=1789039356; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GA6ptIiaRPy12HrgsVTsXSYcvjB7F8/6vwFnAwwMsqg=;
        b=XDDwBf+FlCT9MCirO13Lj9WxswHwTknZduYM52c6KwkH9W4vje6bccqgqp84KVR3QN
         +KoR/gN0ZD4Q9ErInz6DJQSzTKLDmGCV33cMddxGNYy47uj4a8IEGnWbViq9dvMDFleZ
         p0ylfwPYpl2QdZSek2/AMBYESn6oTdL5Y5TPmc2bbBbsc3Phg0QKZLDVjwxKcGpGm9tA
         uJm0MS2VkL05BSnUVeNpMyI5Ojgp+JesIYjFgY9e76MYfWtJUZGM5nqYumotCgZl3CNO
         j/ZZLIY1n63jHL7XRi+270NMxI7zvvcyS5pQ3bms/OTXBYeljlOpsTnkj0KpDvIc57rN
         z/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788434556; x=1789039356;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GA6ptIiaRPy12HrgsVTsXSYcvjB7F8/6vwFnAwwMsqg=;
        b=ijEI0wYuY7nzCOEGD2tD1JFbwmPzDMkj8YfqoKo68316kUfhzY+vkCE/Er6sfTd/g4
         JshERqY0V8tgaco0EtcoMa7CoQsHLt7cC3A0C33LFXrBZK4p9MVbBW6ewj+yDlk8TP5Z
         2hNKS79XkuacVFLY0LMRzqu6vYn3j51BYZo7YH5Bg5BeHqk5KWePXV+o7Wohmuvu9GfQ
         3/5U9afOLO1BHhpWym61LCeIdWcJZ+2M2MZRh0BQod5wTKpA1Iao9N3MNTbhA10C0+so
         1nywkR0hO7G8zVuWgE0RdcDhLUpVMcPzx5vVv459b1t49n4gt9ZHOoKExZZeioSdhCxB
         IUOw==
X-Gm-Message-State: AFuF++m1m17avS89eBoTaKsj0wBk4ztRNHCI8bmDTIhMiEz954YV09KN
	9nWldXVGfOCOpWoPG5sOC1luXNs7kUMlXtFSQdI5anluzqXTyD8YC4swJpPEgUD4fIJZfVDjiUI
	HSJmxc7b+qjdAWdYCvaHiVzQIBKKQhihgQfkRi76PizhZhWThpaAvkJOcX6FrAnWA2vjWEpRRKa
	xG
X-Gm-Gg: AYBFou2i8fBKVlLjFGIHwpYLWunJMyuy9sUa2MkQ5x4mG2jYvUkT3nNcbAH/7iWoihN
	rk42Ti58Ro1+viXh8pJFAg2tOlq8oCU5ZeJwjOrRfjefULv30e844LaGV2Dt7KYmtzvm2PdQCrL
	DjPbskBTwczAfsFmz5idiCrxCINS+XF95U0NHneg010nCWMgJG7YOwDjrgibCYp0g1vzw8ibelF
	p6K3skOLym2aVSHknNvNTKkZ3DhtVByGOke5RaalJp0wLXSBmqt9bZJgNueaB43ACHOAVyliE9H
	nkKCufiimU1v/Le5EwJRa03cm+tjShBrNP7tGDQitPNXD6aejG1ijma6BvorD2DRF8YOHIqF+c2
	MPa6D1g==
X-Received: by 2002:a05:620a:29d0:b0:939:78c0:a496 with SMTP id af79cd13be357-93978c0f4bcmr148521485a.38.1788434556014;
        Thu, 03 Sep 2026 04:22:36 -0700 (PDT)
X-Received: by 2002:a05:620a:29d0:b0:939:78c0:a496 with SMTP id af79cd13be357-93978c0f4bcmr148515285a.38.1788434555458;
        Thu, 03 Sep 2026 04:22:35 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eeabbfsm12529991f8f.31.2026.09.03.04.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:22:34 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 14:22:25 +0300
Subject: [PATCH] arm64: dts: qcom: eliza-mtp: Add support for SD card
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-dts-qcom-eliza-mtp-add-sd-card-support-v1-1-25c906b12707@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHBYmWoC/yXNQQ6CMBCF4auQWTtJCxGjVzEuynTQMUJrpxAj4
 e4WWb18m/8toJyEFS7VAolnUQljgT1UQA833hnFF0Nt6tacTYM+K74pDMgv+TocckTnPapHcqn
 sFGNIGS2dmp6sO5q2gxKLiXv5/I+ut906dU+mvNVhXX8782JAigAAAA==
X-Change-ID: 20260903-dts-qcom-eliza-mtp-add-sd-card-support-1c73fc1a506b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1400;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=PZapi8obVNW5dwmJHh5jYWspydB7QgqalnExU6Kb124=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqmVh4RTsEILVDAJ90R4JBxV2+jjEDHGdXDBXhy
 0KZgFhY/JaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaplYeAAKCRAbX0TJAJUV
 Vr+/D/9jK8nW+pu7huBOL/zxbahkrW8oO+ufFZQL/jV7UspB3kidny5P4739FjPPDog/LqvhWwQ
 +l/zzTQT0gteibFShoxmEmp1wo1EALjB1wOS337TPOv6wpKOOKIi8RwJeQwfufCELsUsKeN/u2q
 Dl/8jQUqIEhX6OicRyzzFvRSoch+9v6h9Oyb6sXVMGHtjf47Sq5UkxlTgPnlwnLP4Pu3V6rh5Yo
 phOVihoGKmYS8CyXlQxOm7xIhqbYhOTEp00IoSX5hQCTRFqOQXvRPEJBSOsg5t+nVAdx2yFmDtR
 axDs+ZOC8pC4fqeWbrn96jvLEO1NJiSFBF8fKP2KvZ+DOJ4Z6hmfMYHh/D2wNF4VwdCd4fvFj2u
 eg09iTWWUYgKt0AhisO24gOFAG/SNjGgom/QzYNIjxmAr2qwrZgxwHCUJBys6EdsE8emm9HBO98
 repeNaWSlcCGsjwJHbOAyQ/xsbX6tXLZN1bPWM45JVB9jsuDPVrbjjcQQL9slIzKzQLr66hn0rR
 rA64CKb0HmHLBEPLX/mGrm2ynue89moBqrQrpyvK5+CDYFOvqK7YqjIQBtAQ0ZE9DtaQ4qH7RCy
 q8v4b0cxu6rna6Mx6uleMi8wKr0PKIJxFc1sRVVCpg01/7uqtTm/rfdUqBTa4oeuQR+2axmGo90
 ttocgARwE329a2g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: XkXZ5OzJ0IXa7JLX6zDbsQeoRUJ9Mqrg
X-Proofpoint-GUID: XkXZ5OzJ0IXa7JLX6zDbsQeoRUJ9Mqrg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5OSBTYWx0ZWRfXx4RbfVkH0Ym8
 36lOGGTc4pN4tRm+uzt+OUc/2G6nz6XYUB+PDoucNW2xVQmq/ri+nO51103gig1dSTWZIcGVmW6
 DYqw5F6zzp9PEd22gA9Dh4ZOJ2aBcHOi48kx/uwbIUY1RAl520KRn5HhBWdfdHpIaUcm6E8AU7a
 LQUdmXvWP/jGTpSLgCY22OwmHxgA9qC1O99oARfJC8MJlPDXDtbHsD4oLOFe6h4P5yp1k/g1zbM
 mUvjor0mVlPN0QaRpBmKqVa1Vrp4E3TYbfIaw36jXdSRCjjIr3o0ZVjnfZHvCIYrth6bH+tH/LK
 0xUqlyLP+cgkh+RBGtZ0SGi2vxPBplZDfGtVGjm/T9GmwwmFpHFOrdNFNhPxiW+L4VUiF6yqP50
 18vO8U9m6TW+Nbx7DVEgdQf7ekp8iCNUKRz8u2w2HNC2rUPjWe5ZMAFfoMIQ8d1ZIbwp9t8TvVW
 W5aTWbkKENAXuJVN1Cg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5OSBTYWx0ZWRfXyMejAJGnEzR8
 r+cb15InC7tFrdOaL+hrJsdpL1ieEmrQzmcfPzyxKbYWDiyfYRK18MQa8q9f+R6euAMG//dPrb7
 SPou6qPzcneT8eu/18r8abMqga4HXoo=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a99587c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Cnn_6jVlNAuXgEeX9hwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030099

The MTP comes with an SD card slot. So enable the second SD host
controller, describe the card detect GPIO and the board-specific supplies,
in order to provide support for the SD card.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 9ce41ba4da55..266a6a526e63 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -492,6 +492,19 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&sdhc_2 {
+	vmmc-supply = <&vreg_l13b>;
+	vqmmc-supply = <&vreg_l23b>;
+
+	cd-gpios = <&tlmm 58 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&sdc2_default>, <&sd_cd>;
+	pinctrl-1 = <&sdc2_sleep>, <&sd_cd>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
 &spi8 {
 	status = "okay";
 
@@ -542,6 +555,12 @@ mdp_vsync: mdp-vsync-state {
 		bias-pull-down;
 	};
 
+	sd_cd: sd-cd-state {
+		pins = "gpio58";
+		function = "gpio";
+		bias-pull-up;
+	};
+
 	ts_irq: ts-irq-state {
 		pins = "gpio13";
 		function = "gpio";

---
base-commit: 32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
change-id: 20260903-dts-qcom-eliza-mtp-add-sd-card-support-1c73fc1a506b

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

