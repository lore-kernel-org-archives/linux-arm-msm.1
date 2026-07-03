Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC49D3845D5
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 05:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055091; cv=none; b=Se9XT9KFRcZUWKf7zJG3x+FQrPGu1Y+AvIYwOymUjdvF6JoTrIOOl6TMPLR9ubfIvb5pcTPBn1HC06MDGBvSdC5Qbjg+J5fsSJgqDByEyblw91XCTT3sxBW2nYWUFtqsKV9zqwRCt5iTjlG0zJL8lBbWTkQG96DIjLPaRJu4uag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055091; c=relaxed/simple;
	bh=HvKWO1iSiVkXlJ7yiMped7hdFwfIwSCsT/19XOKkVc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KDs8gTGL8punF7cIvgCODj0EIK1aNFEObKNwAAm1IkvzDrOPxOBDX6nqhNc7JFCawzw9UmY95OXIL9EKSq5lDWdubxEPCju615sIbrcalG9ePH8AtZGYFR5RFR3NXvq6Dzi/RdnwFa90s9iDRwF9VyBhEajpr5FJCRLgcByVZvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X7ydZQRi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b52e8bej; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X7ydZQRi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b52e8bej"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342lms2801506
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 05:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qx1jryt+w9ocrYJxHKnGXMAcyhNSVdStAa0R+2biL/4=; b=X7ydZQRigfUhah2V
	numTAi3U54CWSueCpcQ4HGTe86ghCLPFCH4ipTEBs63HmjHvd58GfYZio0dlRpwt
	6Y+hOSNrqcZgD5tFoj/2mefSGwp1Xl+YRgy52LoICv0o8vJ1EGpob7baSjOaAIQu
	Axank6orrEzIt/l/zRFCx1TDQhDF+aeOn3br1nNdanOdHLs9pHMCWF9gViXLLvtE
	vF7CTbUBESGpveoi61+9Tw4KqmcjWTYq9RreUuFETp94wRwatOdmgUc4IMxz1Fgr
	CjQyV2t+Nu3Bij7/HXikGOIgZtOTp0GAH1aSTOJXuojKMsbgeAKLf3w7pCHj35Qm
	ZVzA2Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60ey97kr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:04:35 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8895156101so334974a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 22:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055074; x=1783659874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qx1jryt+w9ocrYJxHKnGXMAcyhNSVdStAa0R+2biL/4=;
        b=b52e8bejWwmHoZhWJcLp+oh8Azjp+fY/LPymbC1GrO5BOtfqDv6oIixqSD/6t+yH0z
         AAi6DXK2x1sUGfZbzptkExvmkRmDAeRXJmS6arhIQpDu6UnTu7jvYaOXE4LnbUFAksRL
         a7jxiwoFxYKfPPfSNZ2RWH4kTqg2kF+CYoKekBMKcMUvn9YHoWKpizx947Uo/6V7wOpz
         ulma8KDcoZ0WFWnrkfLN9hlrk0wxZxiR9jU8lfxkCKiUloT8Ss3VR9/ge2to5Up0XeVG
         nfSdwoI1fEvZwiWIk2Uhf4OJfrL3oJhEWQynyXK6WmDIUz04lLkYEVS1mFFSb1op2Fso
         3+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055074; x=1783659874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qx1jryt+w9ocrYJxHKnGXMAcyhNSVdStAa0R+2biL/4=;
        b=UfupZafCnexivaWKBZ7PS3LyYs+fKTtTO108KWgKr+jpE0y2ze4nLqZb5Dc56OFMkm
         djj4YKUb/QD+2swtUGFja6AR3FO5tuH7I6WT8oV+ecSVyLZEqIdC/J8qyg+ujflkwppB
         JeH6Ggkj5zwWjQDoCNuRtpJAgSKhOTyY54GD6Gov9Ufo4/OWEbRoSWxcd0VqmTqJqooT
         2Ghk4au2LrybSPh18mXrW4n9PA91f6+nbDmCiFXeinhZL6AygDi0vPACRrPA5Kzuei2O
         UPckIG1JujsqbQWv9KkFCdcMAyl3y2Q7dSLfeEWgbf+JIww2VsOzKzPGL8tqne6RDX8l
         UY3Q==
X-Gm-Message-State: AOJu0YxIcH3eVWfSoJzJqB83zv5z7D3q4a6d5ufneaCEC9IlHyzwguWz
	EwcMmjW21h+vS2YUY81cPaOQ8wKcFBHEYc4dVTz9y90QXu2JNa3QDQw2KQoexvtvvPq+36sZE+i
	ylrcF3iu1uxHsHS7p00vCV/yEjPJpU/RGxyPShs5CxAT+KrVb130W9gmaxejcTstKQsAy
X-Gm-Gg: AfdE7cmdxltMqCiu4pwCfw450EWNEwqOp6Cn0SQnTQVasvsM9ByRohM9fRpIi2DY3jQ
	5Le6mhVSW5He2KltVwnFDO2cetJHcshZepdZ8qYwMvtpH3tMAxQLCr9tvv6ws8W2xG2bzvmFaF8
	Q+VzifkXcLMunzwYs6vQck5KBzpjhkWHc4YGTuznavlmbZQIRZAeul8FntB8ceHVpD7w5RKWvl2
	3qjh3NMzfSAAb6OQZEKR5Za7quzy04seDbwoQ8/9EJDfAcqDUZIipgDrKv8fPIDAKQwQyVUI7da
	102hDKnx4RWOSaAE6mRcoxdr+9h61ScqZxRIEijj6LhGxCNi9m0LivnRgRi2NcTSV68hmYODDnc
	cpUsOyLm4BMm1eFj7NaBa7eF+jct38tLADn3RJ3b5
X-Received: by 2002:a05:6a20:7486:b0:3b4:65ac:e2e6 with SMTP id adf61e73a8af0-3bfed362212mr10432604637.36.1783055074235;
        Thu, 02 Jul 2026 22:04:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:7486:b0:3b4:65ac:e2e6 with SMTP id adf61e73a8af0-3bfed362212mr10432557637.36.1783055073786;
        Thu, 02 Jul 2026 22:04:33 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd2362sm16771941eec.20.2026.07.02.22.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:04:33 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 10:33:11 +0530
Subject: [PATCH v4 08/10] arm64: dts: qcom: talos: Enable CDSP cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260703-qmi-tmd-v4-8-3882189c1f83@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
In-Reply-To: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783055015; l=1807;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=HvKWO1iSiVkXlJ7yiMped7hdFwfIwSCsT/19XOKkVc4=;
 b=mpgwylrCzfev8iCIMy+dtQy4h0PQ7b3VjS7B/f/GTW3AL6vQTbNjflSonobtGCRYpLlOf9QdB
 qVA9XGzSulHCmBFFCi0vYFS1Fj5uFZRIV5cL95WFUdQHomuf2ppnUJn
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX2XpHTylNuW3C
 0dMwEN8wr0VKA0gGKK0956uVFCAb6YJd9WW2MFfgG3UZqvlBpr+j6/YGJsR6vOB6A5FPkLjp3qa
 WDyC5frf9mVDcM20iiEzSxbn09+0lsY/VyW++RU4CaBr+qd9eoLKi+r5QLsNAdaWcQcegOGiT8S
 6bUIelWInwrnnUFa9J6bT5rNm3jhpTBCiI1s50SeJlzUIUF3OXdkKt8dd7cLPl8pipzjYFSv6HV
 koJP4RSgHahyQTVfM3Kctq+sNM5KRgBmzAKb/78YXmxsIWsG8PynPUmXW84xIYVxLs6+3XpqXSj
 D2Gb/CPneeLPvsC8zxLXsDacK3i4l6r/JEhpagTLuJdRR/9hTudRRVRIQnNrse2x5JSYSUvUQuu
 pvss3sk0dPjCu9LeYWEuK3Sokjis2WVmPGbF8L9NeKzRKlupxfL77Xv7OMjt3ncH1oILwtbcGnA
 9CgQ6Ybr/RN9QLrPPmQ==
X-Proofpoint-GUID: _sZDUKbrTLZGy2puv-_kMbvssLJ5eTl1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX/WawRz7cA3pN
 0utX8b/f5VQhriy26xttvQb4Xj6s5O82MoXluwEng9+DTb8y8gedP6uwDp9bc4/vbp1azf+cdBJ
 soHdInX5P+dXbxctWgRVSIsffEyLGTs=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a4742e3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=qVNQG-PK3-ppUqRZFeMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: _sZDUKbrTLZGy2puv-_kMbvssLJ5eTl1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030045

Unlike the CPU, the CDSP does not throttle its speed automatically
when it reaches high temperatures in talos.

Set up CDSP cooling by throttling the cdsp, when it reaches 105°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index fb1bbc51bb8a..2c394fa65228 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,qcs615-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,qmi-tmd.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
@@ -3772,6 +3773,8 @@ remoteproc_cdsp: remoteproc@8300000 {
 			qcom,smem-states = <&cdsp_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <3>;
+
 			status = "disabled";
 
 			glink-edge {
@@ -5425,15 +5428,31 @@ map0 {
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
+					cooling-device = <&remoteproc_cdsp QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		mdm-core-thermal {

-- 
2.34.1

