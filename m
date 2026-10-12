Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33CC4399D6
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789809; cv=none; b=fs8lS/OiD0GCAXKm/wSEl2eRqGTOGOcO+D+ddr0uvubj23Y0EBaY3ET0YFysjsYYZ4D9JhJ9xFGyCvvmFkozqopdl2ZG6XeE5mOswidBD2XYVYVRoVPu0x1mcnxn+LG30avBox62pkRIo5glOiFLvuYMXlJu2iD229SnEpN0RHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789809; c=relaxed/simple;
	bh=89XqZmmeHIBQ6O48rlUdLOKDfG0n8CNGRqUs41V+46g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=itFgZ9k5fdD7WnedzNrYCl4rVMAo1033AbOWwN+VrG1/ektzo65dT0F8RCszxe78+QMmGiEXuDQuDHsnjsS6pkgI5BWDCekuXAPohrupsRQ5XLh1L75t900qyl+sB6bjUGLR//KgbmMGBuH0F34PrHaEN2sVnwiLSwnSqdmz1Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kd4kK3SO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RIP1G38+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kd4kK3SO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RIP1G38+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55onM1339374
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P4swQe+P3A3RtUSpStZKB+dYDI4Dcc8inETweH2GV0A=; b=kd4kK3SOMLygiOGw
	cLG51Ovg93NsHHb0i1bAyOTcwvv/hBfMKc0Y+UKi1OtQKZxO7+DEV+AGMMR9zOXu
	7mDwo4hsZoiHETPoZPgF/DLBsk5CNNw2GOr/9tBgMaA+jEI6Q32+qDtHHLdwvmxq
	DSrhcMDhAKTh14MC5rKZ1afitjR3sUNn67chltbiFw7gRVtClSX6FEzw1qoZ8YBr
	qs6QZDr7+2fkMnyqf3HkHLae8QYy7RRaD6Qxl77VXAZ8rVjyI+PnF1kIFkosonSx
	DNmC0eyO7+Mp1uPZfLQFn51AU+7De45z29t3tIMRzPpswLBQ4ipKdvpS3Naqyu80
	tGOS8w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7dk25bt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:23:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-359b81ad4e8so1551556eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 00:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789807; x=1792394607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P4swQe+P3A3RtUSpStZKB+dYDI4Dcc8inETweH2GV0A=;
        b=RIP1G38+3Fcj72OXJeAFaAA+zNnODQbbpzilsCqB9nCLyugzyfDgcYmWjYefK+2iyn
         e89UPUfnkKm8l2o941J6O9br8agzGb5FjdC7CI+bqX0CBacsgvxl4eVrdKDsWsKL8qG5
         fQt5N4TYsabSsEtdYcBp5F+COJQTs5tQ9eQzd5zO4xgu+w8+RiMSnOBL9sp/fSPb/euC
         0HoUn6KtZYmV0L5dRw/qexoaLvpPPgU1CDZyExaD81splv+Le5xzzmXDY8rraVIfWkjF
         4wrUPT+kF//YH9IUEZZTUG00gJyAOOT9KzkK+ODpSFhg58YbMqgAx8N8VcHOwJD5lpqQ
         wEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789807; x=1792394607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P4swQe+P3A3RtUSpStZKB+dYDI4Dcc8inETweH2GV0A=;
        b=fw1XJ/x/CkQpvCvHsTaA2cJPAzyK92Qs82hu5n0ONddcYk+9YPzKYd60HgIJt8iMba
         IWhzxXsx53MsA9Ta+FDxljMWNVsdD85gzG0Kf128As8f4LLtCNJcrH9Zw9akHkgoDbjS
         5cDkmLzAn/wAWfU0+B3cL8fYHcvDqa1g4tJ8FqiTRuIC1G6nTRUDKe1QdPt38Klh0+bQ
         ryAvxpP37xjNQgzxEWQMJDEkjRTaYpW9urxMJUAWrxVShNPl1pOAc/VbC4psDOHqc+OQ
         mj2Y3i7a7aboXBBG5UPQG65i6N3wyHS3MddN+JQxntz5aYKEU9/dDRQJf18P9YjLppFB
         URWg==
X-Gm-Message-State: AFq9FYJ26nlFdz09KtLxIn1PtEEVCyoJrLHdhFb/AtzJrRUXCxK9MpzA
	kabDuWDPoJ/Ypj1vXEcebKvPH8lN0W2N8rJwxSKHeZNSgBLfwfHDtpTPzcY13XqjM3JGKisIrYx
	ucs2HX6F4FhWhe2QCGO8Gz0eOxCZHv3z7fMeWxQotz881s1b5A2Uz0nquccVQ5zT5x8Ts
X-Gm-Gg: AYBFou0d4caKRes/+gD+ih25F3xWRlns88NQ4CxBiWra1n1wz43nhHVpRk62ES/Ya+g
	qTB2ReH2b2ljBzTx0SGINg871H1O+qlHWb2sy5NACZfevG2oaCfXQnuSOAxlKjn5dKkDtswfYB0
	gzTqc+qtOH5HsERZ+prepuL9rq5gGse8w98sJ4YNgMYxIJoAgyR2NJ3/oR6VWdYl0b2P9z9ZkBg
	FvbFoEHOUB4hCXYAsriiV+CjJ72Q8x1bowLm+DJTySScjADprfJIyOgxz9Tn+viTLo1Ujlo8xXM
	mCuPVaqIXERW3Ud8pd1wUC5SUvCOOkzBSzM2Ho59SaOc5V7A7uvatCVbV0/sllU5oRIbj4iEnZ9
	eAwJ1z6Sbis5UBkkt1AjpgJOJOL+FzDyLH+l06Zo4lE9zjA33vVlRcIXMVHGhpFxkdsaIcDyrLS
	MX3oCF/duD8AGqRMAyiu5S9xOsDPVm
X-Received: by 2002:a05:7022:1588:b0:14d:ef19:246f with SMTP id a92af1059eb24-16e9ed23af9mr7690204c88.45.1791789807168;
        Mon, 12 Oct 2026 00:23:27 -0700 (PDT)
X-Received: by 2002:a05:7022:1588:b0:14d:ef19:246f with SMTP id a92af1059eb24-16e9ed23af9mr7690103c88.45.1791789804761;
        Mon, 12 Oct 2026 00:23:24 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm29748733c88.5.2026.10.12.00.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:23:24 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:53:04 +0530
Subject: [PATCH v7 04/11] arm64: dts: qcom: ipq5210: Add support for WPS
 button
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-08-dts-v7-4-77bd3d68d850@oss.qualcomm.com>
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: m75pbOrZSzi10kLzmVZvJM9KQXhRiYrm
X-Proofpoint-GUID: m75pbOrZSzi10kLzmVZvJM9KQXhRiYrm
X-Authority-Analysis: v=2.4 cv=E6hYNqdl c=1 sm=1 tr=0 ts=6acc8aef cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=nVy4eOtUigsjo0hPaBgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfXwOlFIho4sVca
 ogMREbWz5K077qdhlLDdU8LvYf7OV/XPtulRg1A7RL9gWyByQZ0KrJ/4IqkUskTN7h56+h7OKMa
 BkyxCcXnsubfwRBnN6f9q4fnQ7Q7p0zkzKadMwoDQclnZHfYqFcVFSwl8sw+t2F51cbvcptZtF7
 d7YQc0f3Qfbw0dy6bcJk/r1arJDSdNuQk01YW2x35c+0jDOpUZffMO4HrrgKWHkStAi4wV6+HFB
 HdP9RQrifL57RONpJSMZmCI2lkqA6xN1+ztfxmpjOr/0QEMh+RIMEFC3TSVkv5UUnqqj130hxPA
 hxY3HqhpcIHyw78LH/PUiapMibQMWQ3BALoh3zqHY8NswzGvRMz1f4DcNcAS7+ePX4vbXFjlJoJ
 HV0TL2/MlYuSVD/8/GB68LWb0Z5ioo3pjGAV9ZZOsJquiwysuPofQ+MncbacqwsxKmVAuTwzOdK
 q0PDTN4dXfvH0A4Sj2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX+pPwm+70y+JA
 k/AaTqlgo0UYkHTeL7skm7p7dzkrDh3Kv57nrvO54IopUi0s803maP6vQADHbSa9VrxNdUd32vw
 Ds5RQDy90pFwxwPkyoPDmmE2RYSN4yg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120029

Add GPIO related nodes to enable WPS (Wi-Fi Protected Setup) in IPQ5210
based RDPs.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 67f62c1acddb..7f90a2632b07 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include "ipq5210.dtsi"
 
 / {
@@ -17,6 +18,19 @@ chosen {
 		stdout-path = "serial0";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+
+		button-wps {
+			label = "wps";
+			linux,code = <KEY_WPS_BUTTON>;
+			gpios = <&tlmm 25 GPIO_ACTIVE_LOW>;
+			debounce-interval = <60>;
+		};
+	};
+
 	vreg_misc_3p3: regulator-usb-3p3 {
 		compatible = "regulator-fixed";
 		regulator-min-microvolt = <3300000>;
@@ -125,6 +139,13 @@ &ssphy_0 {
 };
 
 &tlmm {
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio25";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
 	pcie1_default_state: pcie1-default-state {
 		pins = "gpio29";
 		function = "gpio";

-- 
2.34.1

