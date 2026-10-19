Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428399;
	b=Mnezxy6hcKeIK1uTVxAla2gnSvtFndS59p0zEp0vEXCr5gBlVJJfHD/U6W0GGJhwf2ak
	 OWaU38tfDarRk2JE11T3B97Ug7P2UgZRughB0aGw8Ubl+x+9LchbnlbideTAhKOzT5K/Y
	 X5QeUzuqY3G3UtVWPpqyia8SYL6LnEJuDNrLrPY8mFNRJbOLocTu2G0dd6EViKNTBiY30
	 8DwF0GWXOjmNXZX5kLamvaRRHuIkLeNoMrRthtb2V4Sj6mhzsIDSqEe0XP2NhSEu6Un3A
	 tZDy7X9wQAZwRaej9ma7eFFB8eZOCIYpVJ0yLOTz3UxaaouBcsqkUS5z9V/EKvA4Hfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428399;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LCB12u/eYnIgNx+afjUtJRsI2c6eqFrAafZ5xx6S5qg=;
	b=H86RhsbZA/iz18qEi7lFWwiEIChUHW60NItrvejSWw3vHFghPTttftCvGgPhf5NsbXZu
	 gjL8u1SKz4btekScp2cjnAxGpV2zp+kjKEZi5/HcQNkrVQxS0huixnk9yZrYLSx+km2vL
	 qnqQGCuzwaF2HP8BtTpX3/qBsv/BZO7e7JSfPIfrUyo6m3JIESwaQKYob3kZNyTmHblH6
	 qZ0UXA5+qM1E7QWuOn36lqhVXulxQEk3w+dLUNJgLdbM1lNg7NMJ4Yhmpg9+Mz1/6HFzs
	 mCEDN+n57sNWI7losYXJG83p2YZpPL2H8SMO+5HrqJrI87CF+HOyPGIbAQH6g8MIIxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Eesuay6R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gtfKn3OM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276E960A3816
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 16:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 276E960A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Eesuay6R;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gtfKn3OM
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JFPGs82962695
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 16:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LCB12u/eYnIgNx+afjUtJRsI2c6eqFrAafZ5xx6S5qg=; b=Eesuay6RDDnwsxRu
	K//2N/OLOvTUdpIAZ7xVQsuBo3GJQhS2EuIbDFJfATY9kTIImguf6/BFWjM/Qt/w
	wcrAuUnRGseAPTO45fQO/qGWzjBpq9QWWZeZI0rAMJADTCPTdQ+5LHlkpwDwZ7Ji
	fwKtuPJrmmYq7BC+MinxkIrTVD8vQK7/I97vlCu3HKaO7EHqypjcg9VkwFQrsTjJ
	2Ab6ZOUL27VIAhFK+k/XcyvO7bNLZaM4SDo8Mcp9PG6HilMHntvKm7ibe1EohqBR
	5M+h01suJoDX92i2wivjNef1LEndoqi8McuN/3lrsMt2ig+eTM3baL33tu843vcD
	fHCdyw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur3ty5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 16:46:38 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso4832716eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792428397; x=1793033197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LCB12u/eYnIgNx+afjUtJRsI2c6eqFrAafZ5xx6S5qg=;
        b=gtfKn3OMiPvQw6ScF222fuO2mCS9rT06UhvsBuiolLs4bdfWsHAkWszGL7OlkoojUL
         CiNqnn18S93M3KMxCmqlFlFrMrUJ88d4kJSnWKNEFRwkK+vB+IO4FnbtP7VS9Mh5Jy+c
         KBqqV4mGS8rkwA0Fhu/xorz09D7jxMjU2xYBhVjnqeVJmBwpb1m8IwRACqK2L0xTZUyJ
         1sF5y/fmGc4z/kMBN62YhV8C0pPlQ+/stG7JgVAiZHbhi7HezIuasJOm3Ymm1zdiVpft
         Z0lcqn9TQ6mN8KzCvfZkHqLdcTt/AN3KhSaEHvDJ17FcknEMxciFGg0uEcUr0mlUyVEE
         baqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428397; x=1793033197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCB12u/eYnIgNx+afjUtJRsI2c6eqFrAafZ5xx6S5qg=;
        b=tlfNwduxTqk6uPXlbYtJri/QH8esqYxf8l+mXaWMj6QRIiB7qaF7XRoukTeXbk55um
         d0bFOVnTqV03TsVL0JyN64B2jKzgffuQlEwiCIj4fhhsg/PRWc37LW/kfe4YNLUfHdVw
         47qy7SUY6+SfssnNWCyXiGHL2HQxcogpJRiiyS8nYDQ6AGKB+1BIgK/3ojH+M2nVupWJ
         VXofLuGmMyiiW6iLM/RdOcX8gS2vjfQfjxxSXRdVdlUDStth3KxW+5rMuXfiZjk7ErAR
         eruqG3WDpZgzMlOyq+uSoCgiHJE14TLr/v+7FN1k7s6XdesSjiY3LT0HQ2eDggnJ2gFp
         jxaw==
X-Forwarded-Encrypted: i=1; AKwUvBzicgAPZwes/FjwpAiRKjtoLn5MKERg5DWE/dUWV6rVg0dbFEZjTvy5YLyvOzXFhiZzma7RbAjhNzFBpGye@vger.kernel.org
X-Gm-Message-State: AFq9FYLjhPnlsATbg7K1SU18gjWUoNfXAElgm1YHygi/65Px5HR7WoZo
	ugmVQ6Su/4vKKEspfdac7wVUwYHJIR1q+/f2G/1L8Lslb4WTbh5zAYdPKwU91wNR4g17n7ZWGv+
	91iA3DZk8raJkLgDm1LM3PpYoURK9/jWASpG3kyUqQVVmtAEPrwkPHRO/WxCjMs/bwPiPmPYTOW
	BH
X-Gm-Gg: AYBFou2npX2YJ+e0ok4ACIhS3Sfuk6xxHGZWepmCLa6V3G9btyqHFI7pRSU7iyP4a9i
	x0eECep8hQOU0jsc7nx7OEVc4/60GycKIj9ZmeyjqTdPtcEUjEruShUBeIzxGUy5aOPvuJ7zRm3
	KTDtH+eXn8iKPGpFqWGuxIKvWqmTIYtAO350FdOywNj3lAcmcmOm3/a09SL3ZI9xMsvd4vfqpei
	msHpD2cs0Wa2fnGJm4x9Xm7RexvfFXfxihx0CxhPlPCHIMrfmlLYtkOQQ8JToKrtYOyjShKFXjz
	nQcqiazviM0VgeNxLw+NXEviv0Z4F5E7MDzde50XwXRlArzXbFVbhZNU26v/LjcKT1s25aJuVFW
	APqBNyfqhTfUoZFfPD7PF2FdoyIm0s7eMw5om6F49mq6JOs4LzNWbTnlURgND/z+kq9oftnGM9Z
	OJZAbLCIbnXE8oo5p24XgOBchohsd1z89efpw=
X-Received: by 2002:a05:701b:4201:20b0:168:6ad8:e89f with SMTP id a92af1059eb24-1850c22369cmr12825693c88.3.1792428396950;
        Mon, 19 Oct 2026 09:46:36 -0700 (PDT)
X-Received: by 2002:a05:701b:4201:20b0:168:6ad8:e89f with SMTP id a92af1059eb24-1850c22369cmr12825650c88.3.1792428396320;
        Mon, 19 Oct 2026 09:46:36 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b16f57sm30379415c88.2.2026.10.19.09.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:46:35 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 22:16:18 +0530
Subject: [PATCH v3 3/3] arm64: dts: qcom: ipq5332: add support to get
 watchdog bootstatus from IMEM
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
Message-Id: <20261019-imem_restart_reason-v3-3-e6b1ff5de841@oss.qualcomm.com>
References: <20261019-imem_restart_reason-v3-0-e6b1ff5de841@oss.qualcomm.com>
In-Reply-To: <20261019-imem_restart_reason-v3-0-e6b1ff5de841@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfX1hCyehBGbIqs
 Gjfep75KTOKPLfHzvuUThbq7Rf6vOwFRsRxmyn/Vpll5ZThoB6hEBfgLLrY8MJ7de4HV27ceyMt
 fJyo3K0GoSAB1DAjpzlUgNbKTuug/WI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfX4rwzsBu8tuPp
 CfA8u1CmEEgdHZgiw3RfovtAGjNCAaaan9tWlWyszkHiYlDmwBN6NSqkZ0SYv/YBwkvCTJ99Wrh
 g5ZZ+YDA5Y/cQES2zKBG0uOhSFOdLtyI8pLb+gFsjW7fYbNrhYYSytnJltV6rO7zbc++zMdSye5
 CAS7ZUbkRIfqC47qpSVI72NH1/iwFUImrIiEwF561HyYbkaqrVsPzkb2QdNHXi5ER8Ir4xthzsQ
 aApl9WFIcku9ANqaFo6bz6KZutGf1LQhdGECFjlq2oQ5jumT91RkBh5P4HkLWcQ159n7v1EedIW
 i4NGv437a147BqftIyhTNuusLGYUcxMIpq+XdmgMJ7pu5C1vKB9846vPPYe91gNW8ZC/TQ8Ft7m
 9M1puw/6170Bqvm0gB8o5xSdScX8sViq1quPc8QACwKcRm40yWCtfG+zh4KkijQ/2CsaQeWQrs7
 6gId35/5uqBcbCeQX0w==
X-Proofpoint-ORIG-GUID: K79HuGxAzWvmga_gLsNZcChia4lP5EaY
X-Proofpoint-GUID: K79HuGxAzWvmga_gLsNZcChia4lP5EaY
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad6496e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190066

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

To achieve this, add the IMEM node. The overall IMEM region is 32KB but
only initial 4KB is accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 74d9de8d7641..c1b083624696 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -493,6 +493,21 @@ qpic_nand: spi@79b0000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5332-imem", "mmio-sram";
+			reg = <0x08600000 0x14000>;
+			ranges = <0 0x08600000 0x14000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			restart_reason: restartreason-sram@7a4 {
+				reg = <0x7a4 0x4>;
+			};
+		};
+
 		usb: usb@8af8800 {
 			compatible = "qcom,ipq5332-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;
@@ -578,6 +593,7 @@ watchdog: watchdog@b017000 {
 			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
 			timeout-sec = <30>;
+			sram = <&restart_reason>;
 		};
 
 		apcs_glb: mailbox@b111000 {

-- 
2.34.1

