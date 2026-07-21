Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0EC46EF7F
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658644; cv=none; b=o2LntF2SW+R6Q5sd5mDxCYvrM+Ncze+VJHJ7733wTWzOsskJn9QoDv47kCjmEGkQhtmhxujeqIAOlqc03WBNU4hG9ZZ2jfmWzx0cQXolwjUB/QXk//q56KQhOkzBfXbqcLPmfYae8Rj+4rFgzWKjoV7LGLQZ4734fLPFE8OgzH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658644; c=relaxed/simple;
	bh=v3vp24bsln6ohl0FxV+SSTC/bupGUPgiy+YetmR7ZuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iu4+Aor2mxxyy3Fy/dAox86bnY8u3e936aN6KlCXgBTYovL2FoDbrcnMYqusfM3i1JPQjsBEZBuFrgBbis3lSFsnznQHJVRnl2H4ceotDFystg5j2CofrflG0wwY671uwhUMQnysuXcDRaSEC5ZCDDTAP7w+B9BxUrw4HLA4/gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Phe8+BOH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hvzxCRI/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Phe8+BOH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hvzxCRI/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2eCY2280259
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7nA86p3kGXpdPwthuGLO3Ise+X/G1xciDS9aUO1CRZc=; b=Phe8+BOH2X3l7jOg
	TT6BmeUa9CbCSp7+oLM02ZHlpZPdA+H6OkVcafE7Rkuh3/pVjC1/bLFclMA0UX0Q
	zoJXRKqLsloVYy6SnUtqMMnOLGZ+zAa+a0sKWv2e0G/tPEo3DbeYduSvmWkG/OgJ
	n9UWOCujdm52fCp2RHxjsRtPj/EppthXr2o6KB8hWAsa0SQZdWQofR/yRQIE/4Ge
	67Qm9vd/lKGaPF3I+3ovY2JodRoLhzM+18LVap/iOAEjdvS33SLCI5alsPQxufBU
	nJ4vSWigYsiS6Mxkjd6G7/qyoiw1oVZ1+gVQUz8Egrh3YrMLiP2IDlsaH66cBxh6
	6JlWmg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6paadqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:30:41 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb6433e9d4so1745293a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658640; x=1785263440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7nA86p3kGXpdPwthuGLO3Ise+X/G1xciDS9aUO1CRZc=;
        b=hvzxCRI//jlvmyEULud5aIEJ1mEVj144Zyg1Lz5ilRIolAzvHyPNI3hUIf9P2P+RZX
         iRWPD2dBywSD4bBLniQJbwXgEL6Bwt/HphVWM943Viy2WHo1LggZ3jwMKBKu0bHToyyd
         nheucT8pkbidOdmq1F9S+HopaEBFluBv3Ah8lJoGwwnw5muvPwbg3+BqD5baMlYTRWrR
         QlyUBkV538ZnXVrEHp/UC85KViSN/ZVDcjyemAPSxslrK4xg+bkEwzP0HFqFDTAD0ztT
         a23yYB46wJWVEJs+sE/ZXKq5mFN5OfeIT8kOiOI09U5sWCsFWLYQBvr2/E/LJ4VIqxcB
         QHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658640; x=1785263440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7nA86p3kGXpdPwthuGLO3Ise+X/G1xciDS9aUO1CRZc=;
        b=i4GMKcifUoZdO+K4OukNLE+I9Zw/z5yuzC+UUSpC+mywbDCHwmNH7DwLQGW6npKEQS
         9qgojuBwS/QLU3tRzufD9Q8UuvkammUCbRFxs8e4jAVh3KZI8i+mTsGHukRIPoga4C+/
         ENX052jVzid9uiivrI8hiuLqHWUV8K3DSxV+3Hx/F2kblWKSbwK4zJCI5QTRy8ReDcnF
         8Q8tvc5RDqvAvkFRQgCC0I3zfTJzzhY7XWU5GS11lS+3OiExJxm5yyWh7fIM2FDmHleP
         yIn4lyjR/mg10NZ9C+g4D15k+ZPdkhLfVJvJvmtJ/7+kQ0ifsP1NhTsLk6MxN+fxeTdS
         jBjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/L9/SnjsEg21dDzl+CA55Bp1niSYqm3rxFiDgP+qPpqpRf0uNCkUwIQKiPoCqvJQQj1fBmytCR1JS1Tbm@vger.kernel.org
X-Gm-Message-State: AOJu0YxjSDZOt0wkMxMKD7gWtsotypFdeiCKkDroPDMHrHS2tccDu5oi
	iyLb18IDIOOk/trbkb7jLHEGLnNornW1j9vyu9TvRd15FehaYeJhD7Ixeb3iyTl1QAvokqvXXCG
	9TAYKUkp7+XF2pjJ/7/mYZFXDGsZs5IyeLh0DF9tkW8OQukI3xsQVH1fH22n+pWV2dc62
X-Gm-Gg: AR+sD13HLh5ufYRcd1zxYm3PYA/FJVpzAlyYz0VVs/DIydOh0XunxFfq6+VPMgxm16l
	giT3G8Uv7/nGqfOcMTWmssmXNGw4re1dnAbhRHEih8EXyx0hgR4RyJGZFLX5u0Hb2vBVZHUUKNt
	rS5jVQHLtgTQ+b+/SzWcV4Jx0ISioXbi9JwsNx0xi/qZSlDCJPdSyrrfzmUlnEli58FEZklm2QA
	kAL9NTeeNXoD5aSIDOMM3e7Qcfwzfux1iZoGdhUAxyfSUhNXPhJydYXJ3TqMg+lwcAocdf3zsJF
	xEsvm6AGR5+cmbSCsXUAU8TKZrCm+2LanGCz5w0SMbJiOBUQREag8Fl49qJui2VDXBZWjD2y+ig
	Qszt8kFNk9ycwk03KB0GAmdligSN1ohQMXC0=
X-Received: by 2002:a05:6a20:9397:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3c3ad8ecd61mr20837365637.35.1784658640069;
        Tue, 21 Jul 2026 11:30:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:9397:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3c3ad8ecd61mr20837323637.35.1784658639536;
        Tue, 21 Jul 2026 11:30:39 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm1185298eec.30.2026.07.21.11.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:30:39 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 00:00:09 +0530
Subject: [PATCH v2 04/10] arm64: dts: qcom: hamoa-pmic: Enable BCL sensor
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-bcl-hwmon-v2-4-febe2805e17b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658614; l=1064;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=v3vp24bsln6ohl0FxV+SSTC/bupGUPgiy+YetmR7ZuU=;
 b=NrpsTYx1Q0WH+Ik9RJxlvn86/zmXcPWHNzIYKoYjFmKeIy6/0aZbPda37lvLmqpqR3w4t4cnn
 JaDqQP9nat+BWdIaMxanSP10o7Nh//w1pzk27Efl4mBNDu3dcLeApBZ
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: 3zOTNy1ykw4x0qngLprKKN102P6KcIG8
X-Proofpoint-ORIG-GUID: 3zOTNy1ykw4x0qngLprKKN102P6KcIG8
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5fbad1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pei3ZxCQ2QdDqwo0ZtEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX7tIlHlqJiwXG
 xqTrqzZgR2hjUlidbzTM6bmS5ZFj8VLclZEtTdb4VPxEqRensD1eBf2jR/EWj0XWSbQ6zawiOsX
 FWK2CS/HFNf8hsM721eh5XxmQztVvZSIVnB8LyknqJ8SVm4kAhP/3Ct6OBCC2NpRn/tcoOskNOO
 tmLMR3iuRd2bd997/RGmZZxkr2obCQLekaug86ZHFFXquesWhI62g3ISxind57/G6LiuKHpT3pr
 /3EneK+xjJh963gyHFKErLB+BW11/cWxkS92phAhj/UbCAiFW250QiPG4H1ynPQrSPzu1bBFxCO
 BZ8CJKejJL1/RqOdtC3NKzTUPmO47rH/8PF1STZ2+mfyqLmXUDjMEUMsfrdKx3+gfY6lHWwJ/xg
 L7BMIFlG2ijcZ4mjb/MBTlEn30woBJAX9zHAkwjmKNanJwiYpQ8MMrpm9bEoTNRET6n7OXsLAQA
 eVNZnjg1ccWJctzRM5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX9iyYkjf0zP5L
 VocNkFtIur27SeIOyi0nbbPJZFVai10HQbLyfgPZIzvtDuy7OW7bTD9uxgj0t1WyJn89buSJWDp
 nHGd3HZ42raxidxOKH4q3EeijjJcVyc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210194

Add Battery Current Limiting (BCL) hardware monitor node for
hamoa-pmic. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
index 6a31a0adf8be..dbc4257c64ce 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
@@ -515,6 +515,15 @@ smb2360_0: pmic@7 {
 
 		status = "disabled";
 
+		sensor@4700 {
+			compatible = "qcom,smb2360-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical";
+		};
+
 		smb2360_0_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2360-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0

