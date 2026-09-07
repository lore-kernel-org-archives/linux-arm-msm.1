Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA9546EF61
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 10:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778299; cv=none; b=WwsJXcq/Djfapt4hmwmMdQjRZtgdbjHqpFjPkMs7fU0bHMieDuua+JKELRqW87Ya7WvG/cjNpAQE/CFRgxBQlfECSCVFctXKwzEoH+6S5yK4c+FV1KH2LvUG2GLqnc43gKbzapjtF7dzkVNR2BzkKp/mzjBs60SWTaoZ48nn7Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778299; c=relaxed/simple;
	bh=kOCFhhQ0VijDiYHFdxbLlhsq1O5lYtGN+9F/Wbv7TyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GcAMXpdlKpCvzfxGpD7hQsXH+sbY30+qkLF/Imvll3o4cGYL87fPomql9w8V0nfN+pBOf887H+Ug2Gay42DQ/sv1ri1PRbLf3AH+GefoS6WFjM9WF+OrFk1O3nGJPYt3vv2UPFB5/ZF6R4A1irLLTGWqdWeWfk0x12fZzBa9n4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p0omYvJa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j+AV9FzL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p0omYvJa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j+AV9FzL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687Amt333872847
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 10:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QWbxMpa5nhV1kXJg4CePUUc7pdXqjJ4vwZjQZIPaLO8=; b=p0omYvJaxSIdW0gN
	BNxAGij8whOVkqITZNP3MqRlQMPWofwSUmAb2sybnDXi+kvzLvqWBjTOz99AS99p
	8OrrldqDzZCmzN1CLwWy2j8KDBHVGuBOHJRs0BoJNswbQIddLhG8PgLfNt51llZy
	XGamVsweidCN1EdUhwvO7G5okBx9e102YGyRRrKYv5gNkHS6d+Y4CywcwMkBm3BR
	UTiGdTgCIzodOImSLNr2l9RZ+N/a+axFzYmMtbc9Bj3xq+3B//0SVxsjTAnb6+r/
	GKSEU3LfcBK9pE01qb7IpZuTKOhmmaI/BwzDyTFMzz2K2EuDMiQd4AVwOEVvvn/7
	4U7Jsw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj1nmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 10:51:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93918756165so629965885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 03:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778289; x=1789383089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QWbxMpa5nhV1kXJg4CePUUc7pdXqjJ4vwZjQZIPaLO8=;
        b=j+AV9FzLk+sm2ezIWr92gdpN0VlIxwyGaLoLkk9zJXaFePCR/FU09St267x0SUOOIC
         tICh4OQzG0pRlCVYpNYYCJIIRJDU5WMvkxT6d5khT9d9BSCLo4MmpJgn9gBlhPA5BK8G
         SRmi/9vBEHg9DEfi80j/rctoGg1LjxpaOqwNL0AiXZ63+ZKYgoOuCSp7qZOGgIwl/1ZQ
         IRfVp9IRyly6A6EzT0in01sIJincT6Cy1me5xKmKMy0nA0GvQDvV1c4L+rtPF1SYbn5B
         UtTJNDgkEyp5gp7PMDcg6zvPp2ZHPaCHzKg3SMDQttdGqJQxkJmsuDuM37p6A6qpCd7S
         E2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778289; x=1789383089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QWbxMpa5nhV1kXJg4CePUUc7pdXqjJ4vwZjQZIPaLO8=;
        b=ooMGj75NN0RWBAmz7QNAZil7E1ANhfCGPtGN86Cdl9QsbV3UB50incCCpwLmN0G+Xw
         6+ptGNmLVNHn+V82KoxkrqKgX1tsLJqFJUav9MpHTyNtPcWj8aXdpDmoVtli3SXe+yfv
         H8Sl+zKQ9jDDK5foB3qiAsjvcgV1p6MNzo+lUQJeNC4X+uuLRU9VblGq0h6navgwrNjg
         IJwr6zKDGgWhyDQWUpEEOc0ZBp1dbgewSsrm/jHzc4kbEWOAbxhSMVdDlMNZERcq6tKx
         RekcTeIISIY4bYMN0nOq6KbBIYZS6sp/xMdLPcfVKZPdfjdy3yGfXEjE34L1UrX+k/+v
         DiQw==
X-Forwarded-Encrypted: i=1; AKwUvByBq0cVQMamDdOpKn2ll7It8DNVDoRAxdHoc/mNWG1hdbF11JILQjPT/jFuFtc4wxtGtZxfbn4QND6uZq3z@vger.kernel.org
X-Gm-Message-State: AFuF++lLEBf3cCSFm8qr77moVl219F7mjADo7U8fQlfg7Dxs3O/8kzcu
	50U1rYeYUlyde13UnRbK6Bm8fuRzITcpcQzn+3oV8Nv7CB0snsp84u8n4RSN8iZ5xohx2zFdHae
	kIpBo9RNUSrzcEHaKNEvjPrneHSXnOiIXKDE1gv4Ly0IMbXFJJnwfoHnLWIHdDQu3xesF
X-Gm-Gg: AYBFou2zRi7aQDkP4LI1CjczMoG2dp4/PQtqAfrOa0yAgLrIc7G/S0UB07zDL7fqkn0
	JJVD7lEoRC8xGPGPnVDPJYz6DBb32PsJtR93j9rl4VbTH2q1OM/UmdgLMH5Em6Cr7L6GohGPeUY
	BIMJ5dtPrWb+lZlefuxILbzpTqo0g5nDnnS+XKGZKwKfI/r8BqW+iWJFTyJB7O1hfEhen/tCaRv
	1iTfT7un4oeP0dI+5S0FA/wHNlrmU7V2H+Dc+XvL9QGP1rIdQRotEewivnC86f68nerkUZzSTZD
	TvYwxkUrBJT0lphzkIl2x+LZcX3kiWYg7tMW6xvl1BMXKq4Md13XC9ktY0o9UhxCFrD8HRWyQ05
	zlUID7Cwi7HZ8SHj/wHOt11BpxAJLolvZW5rBJwZVOjAwZ8zb/tQpaVAiKUtfEli3ARFfswNwo4
	uZoH0jKfkwLVzYotUwjvjIzfT3y+WgNW0mwikCYLEWMZSRYPY+EOc=
X-Received: by 2002:a05:620a:f04:b0:939:57ca:7e07 with SMTP id af79cd13be357-939802f3248mr2190102085a.10.1788778289546;
        Mon, 07 Sep 2026 03:51:29 -0700 (PDT)
X-Received: by 2002:a05:620a:f04:b0:939:57ca:7e07 with SMTP id af79cd13be357-939802f3248mr2190090185a.10.1788778288072;
        Mon, 07 Sep 2026 03:51:28 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:e90a:787f:72ea:b218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm410263775e9.5.2026.09.07.03.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:51:27 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 12:51:17 +0200
Subject: [PATCH v6 7/8] arm64: dts: qcom: agatti: Add OPE node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-camss-isp-ope-v6-7-6b915b9c5131@oss.qualcomm.com>
References: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
In-Reply-To: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX9qh82txy+EXW
 wCN+3XVcTQ3+o9Xn0zCq32Jxz/cOPfH/sT9a611FfI5sxQVOBct4uRzUGD7nasHJ2p3UyJaLgiu
 2BUbPLVVD3hsfQzAXxaGFip/NnCXgA3X9mI9a2RL2OYP/HBwVa59AuxJKHqpUhmEB1fT6KCifQA
 RVt/NsWbiAxkV0GbGIgfP5s8j9rmxCEVlKKPaGhMtWg3RiOQQ7XPnl4fizNuUnQeB8qtZSrrL7X
 TXB0L7RelJgAzRct1AO/aZcuhPHuXoN0ZDb2raI8hKE/9cMYDhvmTGEqAdvxZU5tA8Tg6ssHxCE
 u1MinIYpMuM+S33k56KMNTQXV/nZfq7blautI7nJcuPF9GIb7xY62j5Sm+ZxsrWZMxmwXbDR5iV
 5xRsjJhNCTdIjjENJM7OR8bUy+6IEx4d9CtrxvMZ/BgN9oQbAtF1KqgQ9G4SFQZyFVqhK09Vx4z
 x2FPgEIuD/G/xB6MpNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfXwl44r6aw2+Jn
 jztCSoUqqoSVWVfBIN7QKbXfj0LmROPSQ16mtyWUPt8Nfpd/aLggEC3YdIAm67ogBgxH/jLs1VE
 nLnHh3g2Lcmxlh8N8KKw5vPLq/bb/pk=
X-Proofpoint-ORIG-GUID: OeQEUdz3avlVcowrqE-b8qdevLnyOKzX
X-Proofpoint-GUID: OeQEUdz3avlVcowrqE-b8qdevLnyOKzX
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e9732 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070118

Add the Offline Processing Engine (OPE) device tree node for the
Agatti platform (QCM2290). The node describes the five register
regions (top, bus_read, bus_write, pipeline, qos), clocks, interrupt,
interconnects, IOMMU mappings, and OPP table.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 79 ++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 397d61a8a27c2505833466bd349acc27ef4ffe0c..360faece59aa0173615eb4d9d06943a4fa623d21 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2020,6 +2020,85 @@ port@1 {
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
+			status = "disabled";
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

