Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292784582DC
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 21:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493661; cv=none; b=tnF+SYxH1czDp2lRcK6U4hUUOG1fmTomS92nNIfpvF9wsa57TWX5DxMW0L/Vn+fBxSw4cuifSjwKwL6fqqyGgtBxsbzJWbffUC5CLviMavC5ZXVucqQgTUeV6EZ1FpBlCsN3wIDyxEVIc0Wjl0/UK9MXD80S5/klQ6SmiFX9z1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493661; c=relaxed/simple;
	bh=9vAQXV4viLSEXL8Q+GA/6rNPs5qW+BgcqKnhkDr76Sg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aHTZSK5WaLhVc4RYqFWobdQmLpTasZa5n7M+jYZjqCtlYSvQVbMfBdFL5sZuBiJNVX24l6nBzrcoiW57xZcRr+Li40N/Gd+tU0yqBeVaUMM+2V3EbmtEN+2W7Tv7BlZU7vcJSBkMiYzYeE1vtejEXCj6gm0kkq/tdqQ5QU35ovE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7Y59j8f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eTo0jfC+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7Y59j8f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eTo0jfC+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698L057b173393
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 21:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q+Vkc41unzNxew41NjqyUCYAnUjbaybiTMnS77qN/gM=; b=M7Y59j8fQ+TEaBv8
	KyrSU7dWjYUOkUXB5FaKj4gZKyOg0NTnvlgE8gs8NueMX6MkCVUpAgVLCnaPdLKb
	bq1QZBswHeH98+QQZ19RcqYkbjONhzQbN4pzcAtUFfbUoroEG/MkV//k/pPNsKP8
	ZUYX1qQ4CuI9AXNtZrgsJg2zhK2YW/7+QGBx6SGnh4YmEAIw1P9WCISIraW1hAvY
	rgvpN1nNfJaxiJ7lsn/+m0ORl7f7a+Avs4nqyCy+VtTu8YdupI9cbWNvPQNuU5H6
	cMwKhbprP3WL487wDKviA/sCfs0qkFn6r5NJHyOHKMPY0YssnIxOcAHfk+CpseXS
	O95rwg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fyj0mhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 21:07:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35158d674e1so1458532eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 14:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791493657; x=1792098457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q+Vkc41unzNxew41NjqyUCYAnUjbaybiTMnS77qN/gM=;
        b=eTo0jfC+DXnYafK5lbmhweA5c6EY5gHni4kHQZ9CD0g2Rkxudi4uzj+DWsfS7vM78S
         BjKn8D+VEOZia/pop2KvhdNXDDMIcMMEn2YcT4en7gOb5ZgSCIJm0BtPRtLL3QlZGEuc
         o5Vn6HmCcYF3pFAYhwCpB7IPlxpaER/dESn03ONOjQzmO05RHqFj42usXlM4YX2oPgRO
         mrumcjTei4aXD5+66zYPz4tHVg6Cns0fWf/tLaUjKZPnn0HPKRejCW/Bo4qLRZe0H6vy
         bWgu+xhLWT9vsYSBGH+RDnqmPB46nLlnZxBpKdzrzgP1e+W1RO0WIkda5e7KcZw2XMVh
         /W/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493657; x=1792098457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q+Vkc41unzNxew41NjqyUCYAnUjbaybiTMnS77qN/gM=;
        b=oJn31Okjx6fdeV0g1m8FiyG2k0RwyRyx4iN9ubZ4AZ80/0cfZ36HXp4IH8O4msmpef
         +BDpuvub/wFB7Lr55e0SHbuYSIUGTL5XMEKUbg7rROr2u651ovGve3xxHqAgRfDkusqp
         FPoGwCCI+t4DMQzovLJZ2Cnkj870SD6ESIKtbJrJ5GTqfuw1aT4YdBAhd9U8L5JRRnWG
         k2uTEEB7sspwHhuF8OBUuKRb25HqrlK8bNiWY5x4BZDE/IdKS4Kkd3B/B6LO3hZt/NiM
         dsalJdOEy5kUnlRB08jhn4n5/0+FY62wwl5LLA1x/3AwEujIczTx/NTK6S3xlJtogxq3
         Yn+A==
X-Gm-Message-State: AFq9FYLNHDpzt8g6obkpMr2riz5xBKfE+Cyi9yW6bWG6VVGsrwT/3X9G
	AxKciX+Rv4Hm4N7BvjxNfWrctH1QCttcCAdUycbFFY/pzr5nPArQoAeoTTonN9GpacFOCrd5BwI
	UT4wD31LQPUO+V0yIJvNwrCWtldcvl2+D7GQjVxFAayUMG90id2x695mBw90t9z9mT6Kb
X-Gm-Gg: AYBFou2CHCvZ2xjqfzValM7p4T/mbs6u7+aHVJPf9QM28c1+6Rx+p4TfhckmT69FiKL
	zFE2mvPyS/4zkoxB6cfgiamwBWo8wgOx20UVVmEZJN8jAvIenuTqUNp+WtKj9Z5hzLax+X/iwYa
	EkmTjo1fRG35opCnaoKtKOjuANB0xg7W3OyFYO5PJq1A5iA9s59tspHvN51iIIIaj2HNSnTIpP3
	LW4S6AUbxt0tJPwyra4jkbTDsuZ4ETXRPaa0q5Wdg3WL5RbyoCsj7Lh4lzJjn2xRPDGYCSuIPc6
	HNxTGgS1Ecwz0rZX04vy7v/iUNw+GJWTbW3PCjqCjZJkL3zOOaVTGjvoELvc7Upq+PQJMiy1XT+
	hetms8dUIxi1M0onkcZK1Efc=
X-Received: by 2002:a05:7300:f144:b0:351:6594:94e6 with SMTP id 5a478bee46e88-3537e085100mr102107eec.39.1791493656699;
        Thu, 08 Oct 2026 14:07:36 -0700 (PDT)
X-Received: by 2002:a05:7300:f144:b0:351:6594:94e6 with SMTP id 5a478bee46e88-3537e085100mr102054eec.39.1791493655932;
        Thu, 08 Oct 2026 14:07:35 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm634773eec.17.2026.10.08.14.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:07:35 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 02:36:38 +0530
Subject: [PATCH 4/5] arm64: dts: qcom: nord: Add GPU cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261009-nord-gpu1-v1-4-a06a6c57bde7@oss.qualcomm.com>
References: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
In-Reply-To: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791493618; l=12452;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=5jj3RJ/5IFAiCv3Rof+NOkHigaCXJnGzuVZWWhgkGNQ=;
 b=etf7fNy2G6qqGs1vmRapH2TDTAjQgPfxnyYBFzjsabgU6eSevsB+wqIoG/x7aXky4XUAqWrln
 eq0qXxmvSqsB0lpGmAQxudhEKZBQ4Clr9urEuC2ZMOxbwI3xnDHPMXM
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=BfpNQbt2 c=1 sm=1 tr=0 ts=6ac8061a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=oAcwOEFyTfjsga8YSwYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: NjIcBAUdnrK0o9TXyt7c3jflqV9EkEUe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA4NCBTYWx0ZWRfX5wVmUonViwE6
 PDmzVQ3BofRA7fVZoYUCPe8MAE8gThnboZBRwHD8wi51RLv0rNAkjhJI3Qp43xT5qPMafbgb9ls
 AMemnKlAOZeOjrop6vy7vEQwCv6UzoL5hxyWhh1JlWj15oxQmFAw+WWDxnJQ7eWh43Ywm/1lWIC
 iI9Rc83KykpGilnTlTF1RCxxKWMf66cp3o4h38jwSmrH5fURZzIopcHB3wR52JFxbrQsvCUV7Pq
 aRqzWh+ioHJxWUlpLqze1xfsNTfyA62AEFjsMhckXsEzEcQo3sDHdhekIQIBi/q9mEl9yIuHYZT
 IOkAdAKub2fZMhLRQGcIcOs4vncOB6jV2dlxN3KsiIn5rxnhSiQcAcWVesDW02VsswfdVXQhNDL
 Fv/7NOMdjCC5Jq15ffBJevHAcnz/MHkA5Ky1z9a68RWFXm6vVQKyjXgBYaOU+BosyO9BPxXmLgG
 5CdzhET9pbCBcR3v7tQ==
X-Proofpoint-GUID: NjIcBAUdnrK0o9TXyt7c3jflqV9EkEUe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA4NCBTYWx0ZWRfX2v7hLEKCYcKT
 /hGAPz7jn8epaJ+HFmMMAEwTqtW/4MqPKVypTK2+BN+k2m15qNH1J/ORzzZj5C3XzYC95d7horu
 oTMierEzHHB/Or+sw/um3YrSTzm0n40=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080084

From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>

Unlike the CPU, the GPU does not throttle its speed automatically when
it reaches high temperatures.

Set up GPU cooling on Nord by throttling the Adreno 753 GPU when it
reaches 105°C. Label the GPU thermal zones and their passive trip
points, map them to the GPU as a cooling device, and add a passive
polling delay so the thermal framework can monitor the zones while
throttling.

Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 177 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord.dtsi          |  80 ++++++-------
 2 files changed, 217 insertions(+), 40 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 4379092b7bf8..23370007c974 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -17,6 +17,7 @@
 #include <dt-bindings/interconnect/qcom,nord-rpmh.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 #include "nord.dtsi"
 
@@ -2042,3 +2043,179 @@ opp-403000000 {
 		};
 	};
 };
+
+&gpu_0_0_0_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpu_0_0_0_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpu_0_0_1_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpu_0_0_1_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpu_0_1_0_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpu_0_1_0_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpu_0_1_1_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpu_0_1_1_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpuss_0_1_0_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpuss_0_1_0_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpuss_0_1_1_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpuss_0_1_1_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpuss_0_1_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpuss_0_1_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpuss_0_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpuss0_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpuss_1_0_1_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpuss_1_0_1_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpuss_1_1_0_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpuss_1_1_0_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpuss_1_1_1_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpuss_1_1_1_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpuss_1_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpuss1_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpuss_2_0_1_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpuss_2_0_1_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpuss_2_1_0_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpuss_2_1_0_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpuss_2_1_1_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpuss_2_1_1_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpuss_2_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpuss2_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 147d8e595a3a..b032d1d2ad9b 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -4101,13 +4101,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-0-thermal {
+		gpuss_0_thermal: gpuss-0-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 1>;
 
 			trips {
-				trip-point0 {
+				gpuss0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4121,13 +4121,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-1-thermal {
+		gpuss_1_thermal: gpuss-1-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 2>;
 
 			trips {
-				trip-point0 {
+				gpuss1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4141,13 +4141,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-2-thermal {
+		gpuss_2_thermal: gpuss-2-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 3>;
 
 			trips {
-				trip-point0 {
+				gpuss2_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4161,13 +4161,13 @@ trip-point1 {
 			};
 		};
 
-		gpu-0-0-0-thermal {
+		gpu_0_0_0_thermal: gpu-0-0-0-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 4>;
 
 			trips {
-				trip-point0 {
+				gpu_0_0_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4181,13 +4181,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-1-0-thermal {
+		gpuss_1_0_thermal: gpuss-1-0-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 5>;
 
 			trips {
-				trip-point0 {
+				gpuss_1_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4201,13 +4201,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-1-1-thermal {
+		gpuss_1_1_thermal: gpuss-1-1-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 6>;
 
 			trips {
-				trip-point0 {
+				gpuss_1_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4321,13 +4321,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-0-1-1-thermal {
+		gpuss_0_1_1_thermal: gpuss-0-1-1-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 12>;
 
 			trips {
-				trip-point0 {
+				gpuss_0_1_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4341,13 +4341,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-1-1-1-thermal {
+		gpuss_1_1_1_thermal: gpuss-1-1-1-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 13>;
 
 			trips {
-				trip-point0 {
+				gpuss_1_1_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4361,13 +4361,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-2-1-1-thermal {
+		gpuss_2_1_1_thermal: gpuss-2-1-1-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 14>;
 
 			trips {
-				trip-point0 {
+				gpuss_2_1_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4381,13 +4381,13 @@ trip-point1 {
 			};
 		};
 
-		gpu-0-1-1-thermal {
+		gpu_0_1_1_thermal: gpu-0-1-1-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 15>;
 
 			trips {
-				trip-point0 {
+				gpu_0_1_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4421,13 +4421,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-0-1-0-thermal {
+		gpuss_0_1_0_thermal: gpuss-0-1-0-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 1>;
 
 			trips {
-				trip-point0 {
+				gpuss_0_1_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4441,13 +4441,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-1-1-0-thermal {
+		gpuss_1_1_0_thermal: gpuss-1-1-0-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 2>;
 
 			trips {
-				trip-point0 {
+				gpuss_1_1_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4461,13 +4461,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-2-1-0-thermal {
+		gpuss_2_1_0_thermal: gpuss-2-1-0-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 3>;
 
 			trips {
-				trip-point0 {
+				gpuss_2_1_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4481,13 +4481,13 @@ trip-point1 {
 			};
 		};
 
-		gpu-0-1-0-thermal {
+		gpu_0_1_0_thermal: gpu-0-1-0-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 4>;
 
 			trips {
-				trip-point0 {
+				gpu_0_1_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4501,13 +4501,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-1-2-thermal {
+		gpuss_1_2_thermal: gpuss-1-2-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 5>;
 
 			trips {
-				trip-point0 {
+				gpuss_1_2_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4521,13 +4521,13 @@ trip-point1 {
 			};
 		};
 
-		gpu-1-0-thermal {
+		gpu_1_0_thermal: gpu-1-0-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 6>;
 
 			trips {
-				trip-point0 {
+				gpu_1_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4641,13 +4641,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-0-1-thermal {
+		gpuss_0_1_thermal: gpuss-0-1-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 12>;
 
 			trips {
-				trip-point0 {
+				gpuss_0_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4661,13 +4661,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-1-0-1-thermal {
+		gpuss_1_0_1_thermal: gpuss-1-0-1-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 13>;
 
 			trips {
-				trip-point0 {
+				gpuss_1_0_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4681,13 +4681,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-2-0-1-thermal {
+		gpuss_2_0_1_thermal: gpuss-2-0-1-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 14>;
 
 			trips {
-				trip-point0 {
+				gpuss_2_0_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4701,13 +4701,13 @@ trip-point1 {
 			};
 		};
 
-		gpu-0-0-1-thermal {
+		gpu_0_0_1_thermal: gpu-0-0-1-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 15>;
 
 			trips {
-				trip-point0 {
+				gpu_0_0_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";

-- 
2.55.0

