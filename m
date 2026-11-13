Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569353;
	b=lwQ6gnB9CM+ITDMSvOqQw5vKwDuxGGCLebQkN07aVNaJgZDW30qqvxQelc1rC94tHJ1C
	 uuT586NSJqCkb9qwXoGAmpolqSkwvLyPTexQ+tiBQkGY7fG3hvZjpJHi2aQwYa9Sw8Spr
	 Jh0z3uveC8hdkbfuXFaHxMgXw0f4Uohz1rGpzyuJYpJyndt0AelVDJyzXBx7QWY+ihccA
	 W3NBNOuzqbFTstP6lB8inmA34uFUu8MG5gzlXlW0GMOsidSGC4NpP93ftwRpa+OlPGfEV
	 dZb40+7VUkjMOsT+wZmwyL2OOZE91tdEy/lGducxClepCLR2ktIABilSOTH4oGRtLhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569353;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sPacS5uKz5JBbuz3gbxJw12erSXij4kzMnxn038/KzM=;
	b=pxmuUcivuhmFwOpVl4JS9KTZewgujVo9VhmdSDePOc5E+rbu2t0KgPBKKaUPIfrkOyzo
	 mbRqMcGt2xzM5ofGyKl5R0OW450JZBk35jkG/ewS3wxG/yIVFjTwrliLtuANIOpyTexpg
	 NLkI9ZGiYDINDkZNKNfHowycr3nt75/nBFb1DFxKqduOaLKT+7uJSEp71M93jgJgDMWEO
	 KGGUBISLPcDN3EtWmpwFY2u0qoGIBhMUerEy/yxT6fUwHR1F0TilGPmRLecRugPK0Z6Zk
	 tRPA6YvIhOrZDyHAQ2iXv/VQGpIjCh19uTUKANqQmXzk6FdtsBTAWlwfx1GNsCEyUBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Of89bIrr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RQWqqHYs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECA6606A32A
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 11:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ECA6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Of89bIrr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RQWqqHYs
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VAXE074784
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 11:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sPacS5uKz5JBbuz3gbxJw12erSXij4kzMnxn038/KzM=; b=Of89bIrrlsR8brhi
	xNAe+TFPRCIQIYnNTaUaweKZ8zsj8nfy3lyhWatEEdhd1Txt9wikq3jq8Yh+nD64
	oR2Oi4GVJzcrecjUkPo9HpDCngNQpNkqtwwUuVsSgaF9ioJMELgDR+N8VGRe0JiA
	iNUTjE2D4GMI+J5mcN6Rwd4vkESaRYnlzfCZylKUgkOOKSw8MA3GOJGeqv4Dfhlb
	CBEGHaG7UklB/SfqoYUzdpsHtTUQX1E5Wyz+fQngc6paUgNxe5jy8d4iMCGC4MOW
	+pp35vv+4IUZKV2eqSSBIEGmrqPqfZY4tO9Ef7ucAf1xheVk85l32vGqdc+2NpH+
	9Vk55g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufj2pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 11:29:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36de26cb4b3so1074205eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 03:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794569352; x=1795174152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sPacS5uKz5JBbuz3gbxJw12erSXij4kzMnxn038/KzM=;
        b=RQWqqHYsKoMt8SOPgGKvCGr4tHTrvsZ8DqcI7/1P+/QzKkGhvm9Yp0RuMfp/tYB5Ih
         VAonQcWrsd7EmzHJbiRb3PY/ZyrjImVts8zjOILb07sfmfjNqbKHT7EO7nKh+nLaEwJK
         ViS/uCdJbpjaFMY6tWasvXd/O534fUqqVjHySh+p8+aXQ8u2nw82mEMLtgqqVD0bRHh0
         o6gQH3wkO1cmEzFqUiHCj/+BLNEiAYEdmvvCyrkfvoPoi5EgFZuGhTYhtKyIP1BzTlwJ
         /jgaDrb78E0NLan2+Pbrlk5Ho3Hr/vZeJC5pAOsWW8q2Yb5KvjjZ/ovf9V5sGmZJVJHM
         vIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569352; x=1795174152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sPacS5uKz5JBbuz3gbxJw12erSXij4kzMnxn038/KzM=;
        b=nCVnNB0u0/FgTtfcotDLbNwCjYc5kr3NN8sxsPEJIrQCB35hQUYyWlsUVL3TiTCrE7
         jlGUxQKH6GvLT7zfEzJ+i2BY0JHUSpWW/V7pEtrC6yHo/ihXUjGB2A6krj6d1PSYrYxL
         E+CM6xSMKWmex7Hn2T0A3UKrWD0zZsoOtqmSoCU/zq1ve9bdFEW1NR04bMQyVKFTwR8Q
         resxmtawBlIlu7BYFvbdCDfFUms+vZtffrjxQVQjVUyuz0/HSd5WVkmyYUX4XuqyjXAW
         pvmKEjlaZRTVQAP543qCeh4yX70p9Tx4Nkl1jPywxh/8s2y1u6cNueL5LBbhXf3tt8SC
         kamg==
X-Gm-Message-State: APuU4Z8dsBJpPkpNrF5PDAKDVQEjp24tqtK/n67qeQ+xES9nnjsw9Bmy
	2hB1lF6hwbpNITG8C2xqLdHsBKdTYeqtmVv33fT2CE8Sjg150tMmarvWj2Nl44WJnTrA864/I5Q
	vo4kJWZWTMooVpFHtpoQQAlgDWdNvCkWYCm/jjnxLO5QCauknzyjXnFOy7ygVJsaIlBBS
X-Gm-Gg: AYBFou02PPWt1G258tCI0DakxifECJ6xocy6Uk4XLqpknYJe7w2aUPsvJ5MUMDjX81p
	gSBrK4wSYlV+k1XensBcrZNLpeedKt/v0TDvJu4sqrnHX0iZLGX+2SM2dik1bJG+hWku5X+vP3g
	z7zvonMWhdbYOgLdr42lPL8ItYsh2k0FgzOODK27EAJyCaxo6wZjWrrzwvjJ7a82wlGBYvYj/2c
	yF9xBY33kr+gOXrFnSJ0Vx0787WNx9Pkx3CvTVnN3ptTMI9pyX7YLYS/LAW1XFOq4y89cddSV+E
	3reTpAHE42ZquxgDR3NnG+kO67fvVJwYYiSoNPUuO6gyHvUGcNzftavjhriK59IZvBYIGdu4GdL
	lwEJWkpMbsevmUTzzRYGd5GqYsXcs37JepDFZouF6Iv8kp6CCSIQ0Sr3/+10Fdwt/WYbDnOVFw9
	98AR5AH0FHHg==
X-Received: by 2002:a05:7300:c386:b0:36d:e4c8:8f04 with SMTP id 5a478bee46e88-37967506f25mr2157624eec.17.1794569351776;
        Fri, 13 Nov 2026 03:29:11 -0800 (PST)
X-Received: by 2002:a05:7300:c386:b0:36d:e4c8:8f04 with SMTP id 5a478bee46e88-37967506f25mr2157604eec.17.1794569351198;
        Fri, 13 Nov 2026 03:29:11 -0800 (PST)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d73dsm7342924eec.2.2026.11.13.03.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:29:10 -0800 (PST)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:58:57 +0530
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Add LeMans Draco EVK board
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
Message-Id: <20261113-lemans-draco-final-changes-bringup-v2-1-3ae8cd1c9932@oss.qualcomm.com>
References: <20261113-lemans-draco-final-changes-bringup-v2-0-3ae8cd1c9932@oss.qualcomm.com>
In-Reply-To: <20261113-lemans-draco-final-changes-bringup-v2-0-3ae8cd1c9932@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794569340; l=1436;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=7rKXgq1NKJQpUYaFuu5Z+2iP4kdS+cscX2k+ha48s8Q=;
 b=m+NC7zNqcRvbwVTdgWAyA9AI+iJ7VY1OaPtEx2KM3BqndbnV8kJ9tLtyyN9MUG54CA8GMfvPa
 BYiL7Xgn6vUB/beXsS12D/P4SrBbSQVEp1AeSmlhBfv7lS3YFaBMbXB
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Proofpoint-GUID: ILXmhabk5-CiPkC-yvGRKmUfVK1MmhW4
X-Proofpoint-ORIG-GUID: ILXmhabk5-CiPkC-yvGRKmUfVK1MmhW4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0NSBTYWx0ZWRfX6TRqx/zr7Pl+
 iN8/IBjFpOKhTZl31q4PlG96Yv7QXW+Kk9f9XMuU14kBQNwjWwIm9p8vM3YuF3pwgej2b3FQGGI
 LBzW9jaKmWDhmWnfqq08AgIwvK8zgP/lgvRI/Jg40DIbienfX8MkvMAJ3u/Ykyzlasn8MZn3Xj+
 KJsSQZN6aHGPPPJeYbdkBb4Kt6Z4vqi/WBbo3nuC4zDAFN6/lu6P2kP5EY2Un1+ybivD18XAJk6
 pX+N1qsEa1TZLLz1/3JQU1BD3hbZRO7zRJ1a3lTsTuOfDGy4BYfHmP7mfU01b//bTzJzvxVOxR0
 zLxsbgnAzO9Xdk6FwWj0JBsxxtOyW+TdpE/4mKuv4v4NN7DmyE1c6Hk9aOaZnTA6/ZW3AxwHE0n
 hlXPnfQL21z7kVALBJFldqZE8Fb5bIKNGk+8QiOE6BrnVO9SySqhcFvAS5E52OS+40pP3P93TM6
 2i1y/da5FXiT9PNjIuA==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af6f488 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1iP3MDFSonxPIfbD6BcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0NSBTYWx0ZWRfX9fxX1AEu3xGN
 yz4FOFPWU7XphwcAXMzTIbpH+u+rdYxCHqUjH9WMebaFmITtwIMFOYusUEL+476UzAxbWSHly2J
 eQe+pxQqjVHc/5hD9i/Of57cf3bZJDo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130045

Add compatible strings for the LeMans Draco EVK, an evaluation board
based on the SA8775P/QCS9100 SoC family.

The platform uses a two-board design: the LeMans Draco SoM carrying
the SA8775P/QCS9100 SoC and core connectivity, paired with the Draco
carrier board providing application-specific peripherals.

Add two compatibles to model this hierarchy:
  - qcom,lemans-draco-som: identifies the SoM layer, allowing the
    SoM device tree to be shared with a common carrier board.
  - qcom,lemans-draco-evk: identifies the complete board (SoM + Draco
    carrier), used in the board DTS.

Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 07ef7988b068..86edf4df2d96 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -503,6 +503,13 @@ properties:
           - const: qcom,qcs9100
           - const: qcom,sa8775p
 
+      - items:
+          - enum:
+              - qcom,lemans-draco-evk
+          - const: qcom,lemans-draco-som
+          - const: qcom,qcs9100
+          - const: qcom,sa8775p
+
       - description: Qualcomm AR2 Gen1 platform
         items:
           - enum:

-- 
2.43.0

