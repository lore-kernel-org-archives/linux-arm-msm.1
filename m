Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE9838237B
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Aug 2026 12:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786278669; cv=none; b=EOOi4MV6bY7/vXWPyzjtnV9Ps//phPGGyRhRiUrSHqPUjECst/qYSGJHgjbSMtn+Ts9lUPgHkaEslCT48x3OLDo0WX2fwFKRsyQjOr2eETmF2zelu+hnMgVGud9ORU6WbwD1uB5VNSXmu4KrBn8PeVYYlMo7xUQmQNQTST8zp+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786278669; c=relaxed/simple;
	bh=8jCvvQvR/TUK8TVzkPQrR6iOrXuHBCo0rM5hCiElzIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LxckM+IX6oqAvtKtFVrGGT0boIzYkFf2uF/SM2S4I6SQC4tRRJY0jsmlsJt6IRpSNCVwJojvDzEBF+WtA8LJKyc62Lke2sJPkllI+9NkWRIZ8UCcwhIrSEwlKgYzEfFSUYNhWzh4oQ0go+xFtPlFo97oEgRq7019eCavlLgwXec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKjeGSC9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MUKPAk8o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KKjeGSC9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MUKPAk8o"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679C1qa32998744
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Aug 2026 12:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wTHLwHQvEfPrSw7dqgVln+HLO66Otor7GBfQ5C0UNnk=; b=KKjeGSC9o/KyuPay
	Qgho/MdJ3cKTjaPuA1ylcfETISzQ/YkfhuTZh7tfNEEFPo1fAbX1vvcTm5GxF7J9
	C2NWEZly4V1J+aM8IW3rUZbkNQq1di7MvgB2ld8j/ppTnlOGdFmJ7gp3u7ZlNl3y
	cZht1aG7jfoilXwpUn0kZNflZDXwpU6PxOTNbSYYl9vK4exScHM5pE6sSgryu3UA
	C7i+ZPOiAnQ5Ok/es/pLDDzLg5+eXKnTOHte4fjhp2mMsyWOzBNcEu3cTvV9gUM2
	BIcXdjih1iv0RzsZsrsbdA/rvAApRR1g/WTD4OuzXRM4qnVWHTfRg5LoAVDNlCgw
	qr67bA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwuf7ax8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 12:31:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso2176872a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 05:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786278666; x=1786883466; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wTHLwHQvEfPrSw7dqgVln+HLO66Otor7GBfQ5C0UNnk=;
        b=MUKPAk8oM73NhyKsBprCF34eYXP3Ux7bv/1tDNNtwf0wBY/dKIwdeupUGXJllBxQfX
         reFwE8O41gv4i54gnXUKMTV8u5g2O3BgtcegfjCGxz9fKHy/K/n2JdEAz03AlHnqNdtC
         1hWdNrloc4RZDEX+VNBN4Gsqht3PWk0Eiu3/F+VwhS/CoSBd4blCm9dvrxtdDxXorktQ
         0mV7LJKWbapaYy/HiSuP3KwQ2wzpHG9BTTgQlGFN+d5D4ATL0yW0uqxXMgth721GYhLu
         0HDJuXWuWGPDe1mdKEMW/5dcfYl9M/fMjMD+/0mNHX45xZ/9W7/FBscSqGZvTci7Gqpq
         yfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786278666; x=1786883466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wTHLwHQvEfPrSw7dqgVln+HLO66Otor7GBfQ5C0UNnk=;
        b=bNK4ULqLZn/YPdzkjXB+IgYH9IAJ3TWD5eEpL1k0UTLw3/UL2JewQgXU+Iv040iNDN
         VfoBLz7TM6v+2TbGSngS7MOML8NF6fYY8FAsrP75bWdPMU2Uru8noULH2itNCjcIWIfY
         C2umZ38G41142q8sfkC7WRk/oPPoESrMfwCv8MTl5Fl7sb871FTL6/pv1TFPMhOdmZyr
         zaJGftnils9HkC75VlsRmDL2tvoMJSyarABDL70E1qmp4s1QHer6BPqeicpUB4dLNkXu
         11jcorr53x2W+3UUVURP9zVmu4bqLf/xvuvpJYYhtswpvG6bZHk3EVZDx2FDdc2EfRFB
         vCSA==
X-Gm-Message-State: AOJu0YzcTItSX/7DAm5qzX8axfCqB6hLATQVy4knjIsKjOdN0UJC6zWv
	GeWeaUny8GPiU9BXaqrsWmscR0ILafgp9nWaJnS7+aMkkqzZaY6lTXTiTCLxqhRsNnJF6Un1dmQ
	O8+fvZQ4VSqJYFIWmQWqRzBw7K2DfRFrYQlrWXcjXS4LqYOQI9GZ8YjI1d9yD8MwMV/fP
X-Gm-Gg: AR+sD129lL/Sb/kaoYeraWE4OSnWhBbs1ot/7VPIictBpeiAbqbBILEIxriRi1rfMW8
	+k/6ZZEEbPTEBj0KKQvJg9h85yYqrfkEbEXCzgmDM4U1mEvlQiHNX4CeDHcxEEld05PHvTXw8rQ
	TreZU+mtl910pGpLqn5cM12B9vUZ4sKB4Tn+V1tok3o683Xhv2te6PkbUbWwKCY7M0H7C+iHzSe
	sCDN9o3/Di3eZZhemX6SaLBWV0c3rC6XnZK6k+BliCk4lxXG57p8s/RbAxHgWn1nkBdxsBaSqpG
	/UDEvh2TM5RQ2Ygj4jePCdelFrL1EwJJ+IjaGB9JPevl4ZzN2bIY2DRS8ETTfN0FErp/HF9df5z
	7S3Mii9fhYI50EKW3VOeLGJnZca43+w==
X-Received: by 2002:a17:90b:270e:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-3903bb0cf61mr38221156a91.0.1786278665669;
        Sun, 09 Aug 2026 05:31:05 -0700 (PDT)
X-Received: by 2002:a17:90b:270e:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-3903bb0cf61mr38221073a91.0.1786278665146;
        Sun, 09 Aug 2026 05:31:05 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb88413sm51842997eec.18.2026.08.09.05.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 05:31:03 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 17:59:03 +0530
Subject: [PATCH v8 7/9] arm64: dts: qcom: talos: Enable CDSP cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260809-b4-qmi-tmd-v8-7-b15d47adc379@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
In-Reply-To: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786278595; l=1994;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=8jCvvQvR/TUK8TVzkPQrR6iOrXuHBCo0rM5hCiElzIA=;
 b=Dzo8noRQqafT0JE0UJvGyqUhJ88QaRVYCMXY5JymlRwW5SCK8s6Nm707ESfmHwktpF+H7ffLa
 QakIG+rMiq7C/HacL7NIIvzlG4+jejuQ4ZFXIxwn8P0EzyBOLwU4vkS
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDExMCBTYWx0ZWRfX2MO8jNccobm2
 o53Gr92eh42tO3DLR56bPONyDhoaBKtExZOK2lsBq04sC7FiwFCSWRcMbgLO+4P2QuCvF7jeCkr
 UOmG9TsVuIdDgnR8xBmFR225v9UU5lQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDExMCBTYWx0ZWRfX146Eqm1LUtnP
 AsVqk2OxAAZO2LHqSk6TdjiTJqX/UXlXbyYMOhKer4s9vQ6bF9xS80O4uRvF9RGkp4n029FQcWk
 aMFn7sZ1Vm5Uhof9H0dYXHlnCX3SL5IlFD3pTG/SAVUt67pbQAOv0oZrl5p+rCsKrP6xGeIFk4k
 8/aUA9Iea9SWMwqJ+FqzkuyZ35LaPg3hkGBi1OBqi6xb8Yp1HRSydlqYDws7o0nJo78FlJ6SLvG
 pzinTBCTdOfLUErxYfHVXJpJNKKLFEtfa+N3pezlS07xFVC9keDCVJaeJ1QVD1Yplms0MoeKS41
 TXIjRBug6zjMeFHg4zLGgf0PACYN4kX/3XB4o7AnxnB0l40CCSwF68r79syvFOK3XPudDPWJVEL
 QUmr2aJQmDY0SOdPnOqFSLAK4A7OlfRoc0q2M2Efq717VjoGfUS3ypD3fbup/bpFYpOiBL8UHtG
 08oKTXiIJi61BT5i6SA==
X-Authority-Analysis: v=2.4 cv=ecENubEH c=1 sm=1 tr=0 ts=6a78730a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ptpooaJMTZRctn2qr1AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: gXwWBclbX8e4m2yRD8WSdZWiLGyuhxAM
X-Proofpoint-GUID: gXwWBclbX8e4m2yRD8WSdZWiLGyuhxAM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_04,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090110

Unlike the CPU, the CDSP does not throttle its speed automatically
when it reaches high temperatures in talos.

Set up CDSP cooling by throttling the cdsp, when it reaches 105°C.

Add polling-delay-passive so the governor periodically evaluates
the zone during passive cooling and steps up cooling levels when
temperature stabilizes below the next trip.

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index bdfb70ca9740..0fb7cb8e9f64 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -21,6 +21,7 @@
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/qcom,pas.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -3840,6 +3841,8 @@ remoteproc_cdsp: remoteproc@8300000 {
 			qcom,smem-states = <&cdsp_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <3>;
+
 			status = "disabled";
 
 			glink-edge {
@@ -5497,15 +5500,31 @@ map0 {
 		};
 
 		q6-hvx-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens0 10>;
 
 			trips {
+				q6_hvx_alert0: trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				q6-hvx-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&q6_hvx_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		mdm-core-thermal {

-- 
2.34.1

