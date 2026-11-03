Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736369;
	b=VjVBtHP/unP5idv6CXrW4c3hAxWzDooXFhJ8T3q6LlxI5SbNS5E0pFxnyfzraEOnrIFb
	 EZBIvpR3t3HAxB3bdBi76Bkl+O1NHkYAeipvw7GDwgZ8oezO+YRsxu6cRNB2ARI5DL4G0
	 mh6Btarh4gyu8gbcjwaMtjjkjgD8YVUDqDNysacnvS5lSAg5V2NnDC5pkJ+Wd6mYeVKWX
	 tNr7DFZZEpZjd2L9f5tQN/VCEJM03NTYbbNff32GK8+M1Ouk2ef2TejK44vPFJA4EEs71
	 FvVFB/qSX7hRGxLcbc8f5qsxMVWkxvW5AYS+jEIMnSOJ8HRsffavDq5ZYf0914faK6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736369;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=;
	b=NyKB0kp2YzCXkR8qZ7lT/zcTxKqqxu7w2M4upPBdqmXjt4tHdzIcvTrtydU9gt86FZVH
	 aSOmBbmzMrILJipecABtI8Ecxmtl5uKXzHAxYK0shx1l6zwm3goP15PdK1VbDKU+BaYiv
	 A3EuC8+WPkFWY1F/GkfvOWUGYYJ6cAQFcSm9dcXpxed9VBZQYulX21pmj1AR6NQorux4M
	 pqE8WYmMDRnU1bdeDVREcgqg8pPvy0gh8blGW12ISXOCzVMmFqaRuCtEVWRTyhC0GgifJ
	 ImXrj+RgAH17n7jnnGoQY48W6YzlTphsjpYfQztv1AZhsI5P3BUOTX8R1PqrF1xur3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="U2aKDJM/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPMcZTJK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACA0606A339
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 20:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ACA0606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U2aKDJM/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPMcZTJK
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IZ2jt3318831
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 20:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=; b=U2aKDJM/FByQWv/E
	HGdwFgqZqf798U6llOgWXSbQmK9MOc1hvhqopSttSV/Ni8dJziFm/M9ZmgxkR83W
	U9ANharWH8qyu2sDTUC0nlT4wW3augtLPR9Pc7bp4fxT6jimVGTCTZWuo6C2BhAs
	tF+1QcXZgX45qBomUMvX8LD6LmoWQl/bqhwNoGQYJ2pm+osE/zpL6ek3s5jYM+Qv
	MvoLbShGaJyUl5flAjfosQ62kaYxX3ibNSXdVVUyPolIFWQ1Yg6V1uWWkfz+EbyL
	5pQFg3EWmEIhrCh951FK22+2m1CfSSRihFQakE15dP4uopD4C2jGt4Nazt/Kz9fq
	Fo/8/Q==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bhm48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 20:06:07 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98c88cefeb3so3453528241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 12:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793736367; x=1794341167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=;
        b=fPMcZTJKcPnkoXrow7KT6/xhK/mg7kzYB73+7UeNHdPxKOZNYABUtm/KnIhz6UhwIv
         HyENFwIJEKQA7hnemgzEAvzDK63hRGpTpQUNCHpYpa2hw4p2LjeT3YVvhPcbPJW2mhSE
         YyZuU6yTz8PdWrkYf0fiVwZ3w+0X14DQU+jELOfjnkNIqRqMyk55dzz1LsvNgcPXoPYM
         /dBxMTWSfjSkvzbog7dHC+w2sJMzjy0fbXwepJmJ60AITjgYmHlDHGkZgWTUfqbI8ry5
         5Okz1SuZLOwaM+EbiNWWMJI9f+XzO2KFbHVu6wriT41IcvjYzaH3klZYZtcrEOppMB+3
         JHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736367; x=1794341167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=;
        b=irgs0mhV4k5yw66FU1AhUkaV+loKzmv37V6wW5XR3CB23iGOxKgIXSmlFgoSLzeO3+
         HyXXsEFQ3IHq4FcM04ADurT5SgtfuH8BgM+/XyhvjriUtV/C7XHuHRWQpyiVricDppiE
         RuGi0/E53CHPEYJG5h+4LwGQOcvkpxUkUGECzqNr84Aph1agPQM6j0TajwpHYj/x0l0y
         6QgNNrvfXUeO3dK0njMFy1N6WmqSrqqPT7Cw7uQij87ijcAKggUoVC1ZnES0hRxrTh6L
         WrhZ2/W3D+g+EVqzQLHM0APmkWr194uuX0j/gu8OvMqGhivFIdvywnYgntkDJsWLwgAP
         Y9og==
X-Forwarded-Encrypted: i=1; AKwUvBznCdP8bIkUG61wsR8HLLclQAvxe3dEmByNBR9j1edgYQ9pTlf89zLiva96828DuBizcBQzTc/9t3vkuQQj@vger.kernel.org
X-Gm-Message-State: APuU4Z8Jotcw62nS3zYCn9A2jFTPyGhC8b/mwF+UWBWI5rIYU1WlqTD8
	1biED0vmKaWE2Qjyum0xP1UyyWfaE+o2KofzhZIY+eg6uc4+R1Wc64pkeLqcQFTkAXHO33zHpUS
	TU/4g8wvl1Q/TdsYETx09XyX6lJgeHTv7jl0pmT7sve2yxdQ0+PxsVwFIl9wMCo3KIkgr
X-Gm-Gg: AYBFou0CXYFuH+tUmchl0h1mOuaHKLUNmTX2GLIyONxrX+V2EwbyglB6VMSLvac7ues
	XKEW59OwcBK/62KOcBkBJMNcIpyEcD+7bC1U0FgT/UHAT/KlR7CKayKDHfmdDPTq5MG7k5BlRnG
	vraDda2sE2up7XLGBJNqkXaXji1c/ocBuxKicr/Dn51Rsxbl6KNmS6F6j+4XaAYSZKu8YlGVmhI
	plwDPspI8MxOX4A6SEb1J+DTIVlqJ2pHlUuzdkwVqbAVJQL9gpWP9AhHRiWP42GFXpulJc5bujq
	jA27aFmbfCed+6U9ZtY5SR88lFbAAQj7TuJhuorm3l9r09Yb7jHoUzORyFk/N4nvBOwtdWr/Gil
	NeAb/6LvbbbjoxoRC3ELpVZccmus0eyeSONa5WxPF8DUNT/MgR0VwNJgPCSqA4zDBvXZolFw26Z
	2Ea146S1w1dwUJWyZeRjSBgxnp2PUjXIaJ3xfqEidZoViu7oFSRXSOZOPElhGWN2oNM8Bc2/v4R
	Z+Ys3QQzfEZno2FV878jHirIS3z
X-Received: by 2002:a05:6102:2b85:b0:79e:373e:8216 with SMTP id ada2fe7eead31-7d0723d2480mr6172725137.0.1793736366909;
        Tue, 03 Nov 2026 12:06:06 -0800 (PST)
X-Received: by 2002:a05:6102:2b85:b0:79e:373e:8216 with SMTP id ada2fe7eead31-7d0723d2480mr6172709137.0.1793736366363;
        Tue, 03 Nov 2026 12:06:06 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd03d01dsm358875f8f.44.2026.11.03.12.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:06:04 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:05:51 +0100
Subject: [PATCH v13 7/9] arm64: dts: qcom: agatti: Add OPE node
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
Message-Id: <20261103-camss-isp-ope-v13-7-c2cbf15a39b1@oss.qualcomm.com>
References: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
In-Reply-To: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfXz6HRTzShomL2
 dGnPdvUKaeGhGGr05ddvI3zuor6oE2uevq2Pukc6xs/xf2y2zSk9oYK7joRaaLYBVlWzH3ssq2F
 NGC6JTdhskn0GiDtC8v5zy/sDNW7AKQ=
X-Authority-Analysis: v=2.4 cv=Xs1vqlF9 c=1 sm=1 tr=0 ts=6aea3eaf cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: d-uRBxw4igtIrP00E5fO0fn4-HvIdGg5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX2f6LpXZBwsU2
 8N1WIVcoV7Bu/X5jsLurL17t+HvvVMzcsf46Zvxx2hqM+Kl7boe+RCFcdcJ7SeNhzHBbJNiA8sZ
 9ZH5AAFLgSKZuwnqmJRjFszUwUzJDlzT2HO1Y5aldNhD40heapsZfygKSzi5LDbhT/XQVbKEP/P
 vbFuwvnGsziGJ28zAUsDQ9yQWE+W/RWicTVT1+3QKlGUAKgKGVDLypOwQDfb2ni0ha6DMUlZgsB
 GSLVcB4DnnitVCQFzWl3ipsP1jazBwAntEO/0M9Mu2WAsAIVuz9CiLVM/Aqv4U3n0C1PG6M9kz/
 dq5wRxM4gErGDrUz0ZIgkImQjOrczmu/TmW571yQ3DqiO2vhvjAiIh2gdS9tcgV2StexjPi8kzp
 F6EYCe7KmzdWAazvhfZZmCIBJ9LrW/gCLjGx0HBZD+38Mzt7OH99rbuZxIPRvC/yKiPIE+Xe7uq
 S3NZS0qKCCXlVn7FTaQ==
X-Proofpoint-GUID: d-uRBxw4igtIrP00E5fO0fn4-HvIdGg5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030080

Add the Offline Processing Engine (OPE) device tree node for the
Agatti platform (QCM2290). The node describes the six register
regions (cdm, top, qos, pipeline, bus_read, bus_write), clocks,
interrupt, interconnects, IOMMU mappings, and OPP table.

OPE is a memory-to-memory block with no board-level dependencies, so
the node is left enabled for all Agatti boards.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 32d185d0526ffe109d83fe92d9c54f21bedbbcfd..dacb551fef530b73ca5265eb6aca39b807e82382 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2026,6 +2026,83 @@ port@1 {
 			};
 		};
 
+		isp_ope: isp@5c42000 {
+			compatible = "qcom,qcm2290-camss-ope";
+
+			reg = <0x0 0x5c42000 0x0 0x400>,
+			      <0x0 0x5c42400 0x0 0x200>,
+			      <0x0 0x5c42600 0x0 0x200>,
+			      <0x0 0x5c42800 0x0 0x4400>,
+			      <0x0 0x5c46c00 0x0 0x190>,
+			      <0x0 0x5c46d90 0x0 0xa00>;
+			reg-names = "cdm",
+				    "top",
+				    "qos",
+				    "pipeline",
+				    "bus_read",
+				    "bus_write";
+
+			clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_OPE_CLK>,
+				 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+			clock-names = "axi",
+				      "core",
+				      "iface",
+				      "nrt",
+				      "top";
+
+			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+			interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+			interconnect-names = "config",
+					     "data";
+
+			iommus = <&apps_smmu 0x800 0x0>,
+				 <&apps_smmu 0x820 0x0>,
+				 <&apps_smmu 0x840 0x0>;
+
+			operating-points-v2 = <&ope_opp_table>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "camss",
+					     "cx";
+
+			ope_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+					required-opps = <&rpmpd_opp_min_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-266600000 {
+					opp-hz = /bits/ 64 <266600000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-465000000 {
+					opp-hz = /bits/ 64 <465000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+
+				opp-580000000 {
+					opp-hz = /bits/ 64 <580000000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					turbo-mode;
+				};
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;

-- 
2.34.1

