Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA7740B392
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784810863; cv=none; b=BZvgCyiWjIIFp9LxsE5ePipoCdpK/OVTJLgeNewWwlZoajXDVKlrRsI3RPS2rGeFZeQ+FFw9JOp0uY4cGOfwLYWkOP8+ntFl/4Ko2W/mY7vGsf6frpp00N5zJKl4FFvLNDXrtlSj18M+P10gsALsrUxEME42fohjMcbMxOQ1XA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784810863; c=relaxed/simple;
	bh=RuKd6I+SEIvl++KtfhProHr7kAtMUq89Gwuo4zio25s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nT9nBboVvyMrymSrJbrYonebdhrwr7Pwv2Hy0jFf+dKH5WQaZQasKq7IKSPf8jEUXphXZMNJBptzv73z7/cMNYqR3zhxmkQISBu2cEPepwFIuwyWh0yeU76YYhtIqMJ5VcAl7PSpgk/MavSKup0u1FqUM3/gfD4mo1QIpAMcjuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xm8G/YSB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LRG9j2Ih; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xm8G/YSB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LRG9j2Ih"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NC68QQ3833506
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TA8e9C1CpVZggYts/oGX6GakTmtk0RCSwjXNhQPFiak=; b=Xm8G/YSBU5tAKn2/
	q3tD33HK7DYGubU52bVoiFp37xpqabvI4Uoonw3FtLPpcMZq4R/rgyVE+M1HHKxS
	OpMTNq0Bb0HJi5bgXXz5TudcAlHlIIq9TUNszietzM8ib6cr5Sx+uU6ED7REGKnh
	1tIxS1d7X/Qx4b7Ok/GkqcrV08DknSxdIRcihmDRSULxBJcFO2sLCTFoL/lqGtVz
	UCvvJBaGaA9zg9JKTMsGAH9kKyH1cX/WhKv7pxiqWA6WB+SXV+5y3i1f/jZDX3mQ
	P4+YloIGeRiwMqj4RiOXJC69YOLMYIa7QoXKOB3KlT7YWPjdcgK2kW7rnIYzKx5C
	TLNALw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkjnu85cd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:47:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfe3fa93bso12369581cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 05:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784810860; x=1785415660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TA8e9C1CpVZggYts/oGX6GakTmtk0RCSwjXNhQPFiak=;
        b=LRG9j2IhdaavklVREWBVZPP+BP2+UsDf9HRBqGiI7Ou7uR44Nuc0ObIIpDRnDEdyLj
         a3YoD9R0gdihRyGeqFP6YDJdL5ur+gJ+3J0VmlNEj/glRVVZ47XY14A5+CokcJ8ObgeX
         TlST1kijdfeZ3QJhFE0572xlVKy7U47qyYutipaOvwsm/ejosQMQ7MColM4EiHPuIemj
         yu1ohDlC7j3qF8ysBHLmi9+Jrzt5f1aVQZrljIUISegBsOIeiiyoTMYmdIcYUvdO+1xW
         W/OwXbqG+ZKJHry64w7rQFhIolQN8IvWIu75CJhxL1eEWGvgYIenB2hH+WyL9E3QpNFf
         aDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784810860; x=1785415660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TA8e9C1CpVZggYts/oGX6GakTmtk0RCSwjXNhQPFiak=;
        b=KGEtTrwTX5DT/WvNPHpULUapXWKSikPQh/maFDYsZ0OYwbNbz3FXEa2sn70dyefFL4
         nZyxYjZHpGnG7L0DHQmoa6KI0I69M45ucT+rcXWXi6fgIHlhUxRVIksZedeLjPD6uu/6
         rkfesNyxWnmfM4KTD4w4olv8L0juH/LFNwqX6WzctbF1JbLwwWi46iba4YyqW6DtROro
         VddXRndXc2nE2HyCmNjIvleU/kbAPMUoWTNKqHD1M9HdJd2+95cK/ZiGd17xrwGxSXwk
         t/IFpU2Vfc+ccR8BLT+82D59csnJLGXJvfkEAsUQhki184a21I81hxD2WtLck3G6hKnE
         qizw==
X-Gm-Message-State: AOJu0YySK2j1bXFf+LeTJpAsvXDSta1MR5h+TS1Gamvr+jFZ5NKfkEZn
	akbDPNL3y+UaSDmpnXu6rh7a3uyu+0h/896RDkNeXBgEVO2JlPhyxzRTAhxmhuC2IU5EYhf0PtE
	XYM4ivqWgbPT0rD2MFZfCaGEqVcSE8oxYCcOJte0Zm8giJdDbcWE5V3Bb+juziEsClV1N
X-Gm-Gg: AR+sD11MQogcS4nttXAi6zp6zPhXU1ie5fg3KW4uGjg3ZEAjgcOoOmpqdsdh/8oCkix
	0hkIBHaOwXXkpUI2Whekq1o73c5sRbKpCywlt1nvyv/i+ipV5bzqSVeWQdGDg1YRTiMFTWe6KBE
	xQZaMyflSeoaNxbg33Hjrc/FRIg3P9YRnCjxALrgtYpHbO2RjWsM6Tfj7cTgn3wkKjTiZ1fMl2o
	0CSYqf6BnD3Qn4wrDbyJGipzlMPsT+ByVbx6xap3tFOTsy25usIKOXIh6jl709mKxL58FTW4TYF
	ZmGiD3+Vn6XR1hYQ6yaHP2bEY8W5OKSpZqw57JYd7F7ao3vaiboJf7OKvfWB7jUD5FR1gu06F37
	u93FPQo5h
X-Received: by 2002:a05:622a:2512:b0:51c:1f97:e852 with SMTP id d75a77b69052e-5283ddb3ec6mr26487461cf.6.1784810860139;
        Thu, 23 Jul 2026 05:47:40 -0700 (PDT)
X-Received: by 2002:a05:622a:2512:b0:51c:1f97:e852 with SMTP id d75a77b69052e-5283ddb3ec6mr26487071cf.6.1784810859523;
        Thu, 23 Jul 2026 05:47:39 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c531afsm14814283f8f.24.2026.07.23.05.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:47:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:47:26 +0300
Subject: [PATCH v3 1/3] arm64: dts: qcom: eliza: Describe the CDSP
 remoteproc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dts-qcom-eliza-add-cdsp-v3-1-b535200996ed@oss.qualcomm.com>
References: <20260723-dts-qcom-eliza-add-cdsp-v3-0-b535200996ed@oss.qualcomm.com>
In-Reply-To: <20260723-dts-qcom-eliza-add-cdsp-v3-0-b535200996ed@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2954;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=RuKd6I+SEIvl++KtfhProHr7kAtMUq89Gwuo4zio25s=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqYg1kOkSjwoStAHoJXa1dSALkJ2VLXZ3Q/Ns+K
 YeafO98MWiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamINZAAKCRAbX0TJAJUV
 Vm0pD/4uc7K2wiKrwtxmGjwg9r4zWGWlKGKaXMdiCcb4qlMi1l+52/h2UFj0VjsPasIW1cbJPpj
 PPyna6cjHdl9H3ILI+Mt2XtcEEOcIQQzB7meQNVwCkU4JsMBbHW8e3DvdeuN9HhtcnP2azmxXkY
 sxFU/OyEWx+zBATQnzcWfgD/mJ6vt6sv7tmAgpy+Hp64Y+0Ob+9jQojJUu04F7ULASBFlHYAwJa
 m7div8XGzerN2VZibRxkcdUkcgn7p5a9mYn02tQUcOx8Tf5NXDSpckqMwcFKGBL2A/Ed6jpESKp
 5ZjCzDlAPUayBmcgI7BZzoUHRR2XZV001Z/LhUzcahfaeGfxol8q/ZifZgPLabNEqzTfbgV79MH
 NC5bOdqeljLqifIMM2lKX6357sPjY0PSvaitGD3R17hfN8+09EsZafZYUiT9OgfWkmFXXq0mFiI
 EpvRoB9ZH48gQxxjhZNxitBoWJMGTVLqxDk/dNWor+e/VgtF87rOKT3LIdgoZwrhvxSWO4uXmFO
 hXKn+pT7LdPVlc4DrK49Aq4eSc/ZrWm97JYEaujvMJR6MNUP0vPZy65UR6hnp+smJpIUFFtszD3
 zGRc6DWZNc/JJF09SpEncIDXdpm003c4jc2p99cNBSBgmjYEkZpTnAk5XdPf2tSospdPEtTehj4
 uYhhPZVf/7cJffg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: iMm5eRkpOMUSnCfNmPyrRVd-mpw0gJrH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyNiBTYWx0ZWRfX26iS0C2zYHgh
 YAHRnmLD/ZzCFb9FKWjtp/HN5fOILKN0UmxsO5DEh7Po+5Mn0FTbOZdvpIl1vBs9d0A7vRH5ZRQ
 N4jrfyHIJ9wPK+NrklftU7PybP017QEnpdORwuT8upGvkmoTywCL4mcjEPBzuK2GYHOA0CQwii5
 jv8pJGa50toE5DKbB8dx4rieHhWkmYg3MVGoXwkn8lHQ1qIvNOMqURi9tFFATUeyZ6rYoGHO66j
 xBAdQb+Xi+SNHouBcXsXrMGLQNAAuYvi89m+qjSkmgbM7vIw/PfInt5fT3JaE9FBALGikCE4835
 YdzEG3zBhC/Lf4ft5XGls5wicp4OyEfweTZDn7z1ZoaAdWSWLaPNJVFrFpdGMXapwfoIJZmhURb
 90ZiGvIbywm/2IBExWEalND4disjEAlSyuUJvVxoYc/uyRfytFj2aeqFU2dLVrz/2u46tMqqvA9
 ABLmEROpSSgz8QSIQRg==
X-Authority-Analysis: v=2.4 cv=Een4hvmC c=1 sm=1 tr=0 ts=6a620d6d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2GlqV2yqP6Fn-iQxV0EA:9 a=fTrgFlXldL-EUvLj:21
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyNiBTYWx0ZWRfXwQsAkPn7BDqB
 31UZhx2d4d/oZZhgFLWN6ClMtUjoVuDzuo2CYDomxlmGF8JMVXY8Y8JYvWDI3S/s0mMMFEwIc84
 TzU6dpo0/D1g6NY0vsoMLz7syjHlsdM=
X-Proofpoint-GUID: iMm5eRkpOMUSnCfNmPyrRVd-mpw0gJrH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230126

Describe the CDSP remoteproc along with the glink-edge subnode and the
related SMP2P. FastRPC subnode will be added later.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 75 +++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 357e8066c176..e38a1d94fbe2 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -626,6 +626,30 @@ smp2p_adsp_in: slave-kernel {
 		};
 	};
 
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_CDSP
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		smp2p_cdsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 
@@ -3737,6 +3761,57 @@ nsp_noc: interconnect@320c0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 			#interconnect-cells = <2>;
 		};
+
+		remoteproc_cdsp: remoteproc@32300000 {
+			compatible = "qcom,eliza-cdsp-pas";
+			reg = <0x0 0x32300000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_NSP>;
+			power-domain-names = "cx",
+					     "mx",
+					     "nsp";
+
+			interconnects = <&nsp_noc MASTER_CDSP_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>, <&global_sync_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_cdsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_CDSP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "cdsp";
+				qcom,remote-pid = <5>;
+			};
+		};
 	};
 
 	thermal-zones {

-- 
2.54.0

