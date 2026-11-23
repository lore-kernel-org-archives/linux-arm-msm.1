Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467326;
	b=jvPnaVyIBwSU4YjlAJ64d3E0HBIKfe1+ksh6ChGNiMUixDbvUzMB3sEBfMEMNw4E6ATq
	 dBRN9/L/LxF6bsBif36fh54tFNNXxBzigQ5GaRk/wEHZaeJlNnt/4Wu8ZfAlcSiw4jCH1
	 ng+CJK4poB8ySq/AqHHz9/BNlEy3FzEoDxKKq9jIl16onHsxRGnjk4XkO0tdBU5eH4vHZ
	 ALVHTluKnWefMN1XdJGjTSap3cN23FchkebnCPEdB0NipvD4QP10KCY1MIZnSxB5kSQ15
	 RKOLyHoRP76FqcWZKCT6QwkU/Zr67yPkMmEr/xJ6Rcbdxe2wLwsNuFNTPjH7hotqaiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467326;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=;
	b=5PX46iR176eVgn1RrmDwc/tGME+305p5ds+RvZkQbU7OBAVTFiFE9+dNPzLltGxEGWnE
	 a9C/BaGA96hQe1Ia6fkjUiroEonxB3I46zVDrBoYFrl1BGxMb5oDmSvKdkrttPCaAEi0q
	 r3sZLhx0eTpHcaGAtNCg3UPDgzURDIm6bLq2erFUsQWXuY4ENRZSD/snFDb6P52O/NSsl
	 JEjkI26/ZwcFfGTz/WiRTtwBg93YJKVi21QQeLsFaDhVJAWW0qUIiwLyxMViqWexzWnm6
	 hA77cngExUhzeQp+DtuEcblMd8ZH2E414v3j2WP6elUUXG/0ZwUE5RkA4ajmE2/YJMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1so8nQF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ony7BiFt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A635606A334
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A635606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1so8nQF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ony7BiFt
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuHBb3514055
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=; b=D1so8nQFSfGWQh3d
	5muophMEI54gtgWnBFN4WI+jf2diOcOOh3E6uOPfZNiGNxwnI/0W0xMEqE/ELUTG
	GCDyzEkm3r0/+3nJdr0w85whv2A2PnRZrFZ71Imryfo27Qm562lS7LDh+mtr0L2b
	BYg5DctVFIU8Lvn3+T+NO2E3CiSLRcVxgwXsKLoObx2RJtxvyxUXcXXh+zDeEo9g
	N6dvyiF02lhyBis2vCBIAWddgX2OcHf++/SL2sc8YZ/Sqn/usSKSsWgsgmM6kOgn
	PjIYIoGxttyTL7vFfoqLmD6uJSAfEphAojM7Os2th1YRyYVhARjRqHWlBn/56J2V
	Nqcz4g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukr8be4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:55:25 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-38355b03cb8so3754725eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 12:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467325; x=1796072125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=;
        b=Ony7BiFtFn9a8vz3aPgK53D05zb5BgBX85SZdMGU9Yqcd+y+NeUog0g7aSLw/oxBMF
         yffb7sCQlmQ2UE+zoBD7h1umndQSap/DnQfFu6OKEJtjNZ/rPMoee2nSbNSmaHtHVx+r
         iUuzyT+Ify9c43EMasqMrEOh9LkM+fJcGI2UxKEtARZyMSfFELdfwMN8/zAq3VFbjjGi
         syZ1+dm8tbfqZv2MgzpMtth2r7rv9rmLCYpViHHXnK/xFn07PvBZFDZMpIWJpCVoP53O
         HpbV2i/6dINc9ADvS+oiGHE+3u7wCOeJRGZ/aQgKoowEu/YiESZ+/UaXqthLm4YIwkUP
         x8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467325; x=1796072125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=;
        b=yOoF1wVvtsZeUD9EIzTF1aVKBpDOSqdLsjEyPIHgNvxZfxC7TAxiZXG8mnMtu8IVPp
         4WlKcQPTlg/guVMEyMMIkXXPWHVRcFZBvMNpTYWFi9X1kxu93NjpdCnbaay23mqt4jr+
         /uzENDp/GMFUrMOJOuFUk6mXmRJfbUNt8a/a1AOh8afXVe3potYjTcz/NTZpOfCVBf0V
         WBNbJd5tvBgtELmBsmZNJkwQZ6s03Nba8NujxdfmEyt+Yye4f/aLiGicjjZYgGymQhB/
         OqF+a7yhA34MHFsMYkpRFdTPsqkgzqfgOsZbOVtDx28f8MLSh6p5+yfPtxaafeSioNQT
         X7fQ==
X-Forwarded-Encrypted: i=1; AL+hErGdjP5+A+E3RNJb9IuQIkdR9i+T4aQIerzQ1uGgnnSDW+ysK6zMoaqmuRQ6LbMTbHYVAox14v0LaykMkWPF@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ug04Uht5/cHtfVSXpzxyx3h2pYzsno/yTFO0qqRuxwerjPYRr
	X6yakJEfab8tqdYYO5OhPJZ/e9YvIa2h0rCZ+h3pR8gM5stwYWMo3MceRVpUfiJ0xjWdOcFa6m7
	tZAfEoZEOuX/FCNNVkjXyBw2OV29SCqUwhowGQQsBxA4wPTmtDxkXh3lpt0JSjasR5g3q
X-Gm-Gg: AZFdTZfodq/cIS82yF1o/rLIKtHx8uKDC7pussWU3tK6rR5rlfKPPk0Oq0+UyhOLVN8
	Qu8NcB2WrFWA6SFXp3z9ShpylINdyVJ3hPZ+M5Estw5j80LHWO9MAAoCq8s+01MHaI47j3K2bUU
	kJ12q9Hk/na1ryN0X39r/SszPnk3GAMtNOWXk7PDPNeUHxd0rp3fJeV8Dgd3d/FerFCc0jiVNxn
	iiU46xvME/O4H2BiOACIRsvXpuEa2Y3nyDXnLZ6/IuNrlnLgriG61vbTWKhUHh3V2bWOaIpLeSl
	kGTb4RDAJd2/YQM7welhSJ4DVfjCcT/cCiOVdMnQQ2hbTg77vfyv61Wrk1x2Kstef3YQ6nBjQh2
	Uj3S5uEeiwvg/CC1wu7Gkcm3GIxPlHAjwwFCT6pLF6YaunnSVGdq0We/nuIbSwLT7k9fBvSSu2v
	3GD0nQ4z5q
X-Received: by 2002:a05:7301:7d03:b0:386:9cef:ac3a with SMTP id 5a478bee46e88-3869cefaf23mr8905435eec.28.1795467324820;
        Mon, 23 Nov 2026 12:55:24 -0800 (PST)
X-Received: by 2002:a05:7301:7d03:b0:386:9cef:ac3a with SMTP id 5a478bee46e88-3869cefaf23mr8905387eec.28.1795467324257;
        Mon, 23 Nov 2026 12:55:24 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:23 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:43 +0530
Subject: [PATCH v5 03/12] arm64: dts: qcom: hamoa-pmic: Enable BCL sensor
 node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-3-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1726;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=zhna6efU8UrOq6A/hPXjtJfGBmOdiUoack36KYf7d+I=;
 b=JUF+Qvr1MfhBjQofxRFWz8itf9IQztM3tWFITF/Ndgd743dfOYnitwBPWbZGE0CaK4sM7mgmL
 BxKmzmW7mDgCmk6pKpOjoazilMJLtWkZCPzxl3zdJKpzLxtemj9S+hx
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX8TWb6CyXrEyE
 BAxkePvr+YXCxyybnNuVUXgkkCm1KC9GY6ja1ocQG7Zj6eOca3TLJxKPwYPrKYdeQb86zz/Bt4k
 gcB6+zl41ly+r2ZJGDvuZdWeSVjGOr4=
X-Proofpoint-ORIG-GUID: GdDZshy4iuiH_JyGidcMcY5o3GF8M5YH
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b04a83d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pei3ZxCQ2QdDqwo0ZtEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX/R8mBOcd1xnL
 diTVEnAlPRMVZRb1FV1Pl5uARVX8cYg5TcXS7QhCpgAjBAUbQ9oKOnNiSwrrrwIP+cHrt2vEKZh
 QUpOVxAkm213uWgwZs812dqP+HAKhuJdZG99xNNulQSgdAkcAxR3oQoRHX1d9h2aLh/3xmalh3J
 4Qq7JIIcF289IoOcA4CRAV0mqn/qspewdqhpkMNyxW8p+jxWl9xJfFOuesU9LbWq1dZqo8N54Qg
 ruEobnkMXZ4t/WjJY+l8QvBiZ//NR9E6UvmU1fQHwE1/FgD62DrNUb/d2ZSoCC1Z3z8rmEWJF+T
 ew1MHW1eLNIVFW83Kj4GCDSyrhSuwHWdJvTxv/hFXHF7FjDMfhekA1crSeUTGBciobgnJ35SFms
 LWQzHYukUQtniYbLFnot9wKcz73PpfkA1fgo16zX+3Dl+3y/MXn6OgECbjXPL48skL2o5+n2sUy
 lNIWB/6wTQ9Gn8iYXzg==
X-Proofpoint-GUID: GdDZshy4iuiH_JyGidcMcY5o3GF8M5YH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for
hamoa-pmic. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
index 7fad4a9b92fa..6b17d568188e 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
@@ -426,6 +426,17 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			io-channel-names = "thermal";
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm8550_gpios: gpio@8800 {
 			compatible = "qcom,pm8550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
@@ -674,6 +685,17 @@ smb2360_0: pmic@7 {
 
 		status = "disabled";
 
+		sensor@4700 {
+			compatible = "qcom,smb2360-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		smb2360_0_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2360-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0

