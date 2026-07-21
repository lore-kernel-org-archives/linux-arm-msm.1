Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E808C46F484
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658648; cv=none; b=EJvEXb7n5N5YAykt2W0w1iagXeRNVnhLKMwLkCqxoQm4svD6ZxtIpUVVkd0bgtr68G/DON8+rSS+X0z7nRdK9s+CWZn2qkF0NqNsDyoMRMSKNWinTcjq0SvAzcQjsc50DG1/sM/fbf3B+t2C0q+udwqfolVJA5rvyyQujP9lu8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658648; c=relaxed/simple;
	bh=Hr+SJqfxYiBo+4JP3W6WnCEE5QZe+CfV+dvLiJL3zSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cdD7/whCSqLdsgViKlaCnevrIAk7TmLHdOjApben9QtM91FKYp78Np5RKcjrZWd1g1cy9Mk+kS2QTA7GCmWzwibAaS0syRWo4Hn7MdFrg90eSz0zWRBhktDlifnYJOnNvIgKSLT7Pr29FxVjwuGTdN44jxdhG9Xp9mQZzs5n7Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CwmDa3oV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FYJnrw8J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CwmDa3oV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FYJnrw8J"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHPVSx2115734
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Snoz8SGsLM2BwCRYmvB4dnEmxUX3sQ/GRpsZci9q7C8=; b=CwmDa3oVOennUA9G
	lA0R2EHCRtrb8yctiit5g1KC6KfPGsoe6KsaIp2cOeJUvBvd+Eh7hWn9QHwAaJoD
	YdJB4AQIeGjdJ8yIwuiR+ajWOARuHbJMrHP+oKILS+arYe1NFGQ6dkFTzXic84y2
	+HBlstVtK5SHmrEtiq2UPanLTTpnmPKN0acigVJY/EnfTmKf0MAyUVFLFGSM3hkK
	9qPMAyXclIqgWmeq+jpbRIJpX6nfD9BoA/QUJnGpkJDuR3Zj/PeJ3pyo+yIm1muK
	ipdZ8eqnWL7T8CY/iHz68rwZGgZIzxC394OxF0xUEEbqqLvsKqafCVmLb+k02Vu1
	tkbLBg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e0a55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:30:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84877b362f6so10331957b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658645; x=1785263445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Snoz8SGsLM2BwCRYmvB4dnEmxUX3sQ/GRpsZci9q7C8=;
        b=FYJnrw8JLMzJazhERVsbcwpLcYMCvjLFH4+RR0FyB9G3ZQgxYAKAeO/ibZpBVXuZnK
         NkywVzKOLmhGfjgJP761C/DjRytRBFIKg2EVCURygXbcETS2GwvEUtNc5ldMQS4kInjx
         Pmvm9/32SuGgErzdmYM/dlpq32ei7k3gG+ZaMfbhDiRNT+47RATvxfjPciZRwsNAUnCj
         gojTDIKatrnLWHtLiiQFDJx1wgwRzJ5mfXr19ROLHrpzKhcAIHcTMl0hO3fbLl1gqM4Z
         h/qhaIORE6TS9+G+WF54Avmz5GbY3Bhb6SY2F5ld3YgKERIlPKsnD1Eu8RKVG5QjHFzf
         BL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658645; x=1785263445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Snoz8SGsLM2BwCRYmvB4dnEmxUX3sQ/GRpsZci9q7C8=;
        b=l1QyxWkZgteiynfzRjciymU2e0Mo7G+UQ4t6WRoRosx72CCY/tIno5/0WqeVviZheF
         KUAyk8ntg0poQhw2ewuZIPyhXliHCcIimL6JOPVXRJ8375EPqbpwIO4Xz847q+HLhE8B
         M4cuw/rWAVQoANmEIjMTmxd+uHI+bomvQEr5rrqMmCLsPtxID0RPx+RxRKz2DHDOZz2F
         z+QR4l23e1wF716Tb1rEnLUuuqPAloinV6inapAKpXbzgO+FUd4wVUtVUkfIqU/Rrmow
         uMmheMROZdumDcB6SXP2Z+2cez+5jSd98x4A76yKBp7IU7Vyoo3Qb/X6bHAjaETiQO9e
         1f8g==
X-Forwarded-Encrypted: i=1; AHgh+RrYfsniVqaYV/G/7t3VfItdVQ6lKWAGrCT7JeoKfgcvXL8SGzSjmGvsFrq5gwP5CJEFVup0xsiwdTTQlDc9@vger.kernel.org
X-Gm-Message-State: AOJu0YwcSptBCWOwfVLxefnxOq8kFoDYhRtTJwuVZp0fd3vAfpBpIoCE
	GI0AyiJNb7U7C2U+3c9BV7oRk0Zcur9UxxdSdDf9hd/PTEIccGIIDOLC5syizha49eyIuGUdWE0
	l1kC9Bkxl6sVnEbfJqkavzBpWqTTXZDWbP9o/fVlzGNhNURqL/7Bc0BokiSKYW87HD8ea
X-Gm-Gg: AR+sD12iYcnETnfoRcjAU/bXdOQcqoTkkHq3Tuu0K32ppb2L1Tf2pOMQC9d44RY+Rf2
	YYuG81ljV/my74wdjQJRaONbB9HQRqL7hsKvCX9tr0w7nMNX5Dl+O1NWP8danF+hhBwZDOwBw4k
	NVkjYVhr6nKbkXpR/V0z66kin4DOeoJBAmKWf33fwbodRmoAlyUCcx+4rvU8J5x3tnLx+10Ro93
	cg6nG5Sy1cpuKVV2J1RBJzHOdiSsc2tGcNOL1KjjpAAOWhEkBaCvdcpVMbU+repN6700MxKP3+0
	bL81R821DAqJyrGkoj6gDKHuRRsmFEj5bfX49ligXni/ALhBPEAZ9NYGG6bXP1M4+nRCypC0Qdq
	jaIfbbYWcidPy0AUxOnIdcl5/piTMvG2F/v0=
X-Received: by 2002:a05:6a21:700c:b0:3c0:9c19:658f with SMTP id adf61e73a8af0-3c3ada1eb59mr21745557637.73.1784658645112;
        Tue, 21 Jul 2026 11:30:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:700c:b0:3c0:9c19:658f with SMTP id adf61e73a8af0-3c3ada1eb59mr21745522637.73.1784658644623;
        Tue, 21 Jul 2026 11:30:44 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm1185298eec.30.2026.07.21.11.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:30:44 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 00:00:10 +0530
Subject: [PATCH v2 05/10] arm64: dts: qcom: pm8350c: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-bcl-hwmon-v2-5-febe2805e17b@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
In-Reply-To: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658614; l=1186;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=Hr+SJqfxYiBo+4JP3W6WnCEE5QZe+CfV+dvLiJL3zSQ=;
 b=j7hDHuTczY/d3Cv1yzA37g1zkh3y/Zo393yYi39mhi5xbkEu3bATGdK0FmRJQwWj26VzHkGxk
 UWXEICiqpg0Cf8uqg6yOTh9mdfgYb/Uaw+9zN8Jx7mhH7INYqlODRug
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: 3sokiyeddh8_M_a3QLR4rC_98FdJ6H9x
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a5fbad5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=I246FzBBSJD3MQbeXTIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 3sokiyeddh8_M_a3QLR4rC_98FdJ6H9x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX6Paxiephd29a
 a2ImkY93GMnKxUOeg5/Lnf2i890/1SHzDrK4sldxJTMgqCyoBgGZvq6qInGDKFBMN1KHuFkiMR6
 i/KhjI/niRputqxV0/CH6V5uME2+V1WtprmsrKIEjALtRL2hUr4a1Nvqwp3GBVc8vUF0oBzzjeN
 mtrE2XrdRWaabTGHaxAewzyy+1GE2aJ/qYa2CDGsSINf4M8BVZN7hELN171alw6xaOuzVj/br1i
 dgiiipDfNVpXvhgt63D+JLxQBsQP93oSRyNOjA8DWFWDb1mZZtBjFAENiHSqsSd0Abowffn002y
 ORBAxRBTVcM3mmiyxUlXNNIwaHzxRHFvG5lfDHZZpScTKQZv+Q7CbQu02bZO4Dfdk4D+17L7pyT
 stLCWw4OCRp59eTPW9n3sz0CXc8h+r3kSPtqg4BRoW9q+65YWNNTgTzaUHEQ0f/sf5RvN/OmX8M
 sJpxyLB3XW1goDoZr5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfXyhwq3eeX7kI2
 PrR7byuOoJTZNtJCCl1qV5JrR7ASFiCVbITYKX/L3l1MNLs4qXxnPz58r51wvcd0xJ83BXMKS+Y
 aniMinJ+4bgsmysKWEYwlSBYEi1r67k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210194

Add Battery Current Limiting (BCL) hardware monitor node for pm8350c
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8350c.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index 1a24e6439e36..8815868f9ad6 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -20,6 +20,15 @@ pm8350c_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8350c-bcl";
+			reg = <0x4700>;
+			interrupts = <0x2 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x47 0x1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical";
+		};
+
 		pm8350c_gpios: gpio@8800 {
 			compatible = "qcom,pm8350c-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
@@ -41,6 +50,7 @@ pm8350c_pwm: pwm {
 			#pwm-cells = <2>;
 			status = "disabled";
 		};
+
 	};
 };
 

-- 
2.43.0

