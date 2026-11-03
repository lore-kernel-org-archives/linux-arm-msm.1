Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714132;
	b=bvdcB0khyNC38/D0K74eqy1VERkT0Y/LOlUMfOEV3T/L4zadD/ZUqijaEPYoZu/Npz0v
	 ahZckymijT7OLihiw3+zIwlacczNMQn/Wy06Y1GZT0CK3VasUtCbH54DZlaay0eFW79We
	 BCw0BVqL5sjAUkZ6O/IFPFxiRrh/GSo/owurbnHeNn5pfkaW26KRw8vZy1gbg5fN51LQZ
	 vtsHJBd0jDAKKrk9k7UliXGjZCyzI/MERkXzZn7pJY/PfBuSvuTcf6obIj8xP56vMPUWa
	 xsaXe2sAzjNQh2+COiC/u4wTmr09Pu2+yBMVGTF3X6sN2KRVsNjcfrCeESf1pXTdHkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714132;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W48oLRMSiXkfxhfTWuzGRkhGlQ7vgGpxFZ6rRuLSbuI=;
	b=z95JPKlmbKMjbxzu480b6f2EAb/bOdj3X7t5i+tdAylUmWPXma7mPZe0J2iJnFl20PeW
	 Mwc7xTXJbLlXAn+CLHzv6l0KatbVQyXVHjoFQNouwzvgyN3c8GAvnbOAtCpSwC2d55+se
	 KegUsaekUu8pm0TMOvKxH1Op6I1oEotqX/x1QBf5Ss2X9cnMVgAX/rSkD4At6XqgWA3j+
	 gL5fGaDMxeyUZzl6gEm+IzLc4Vy3Huo6GKdANecYE8mqitc53Aj7FdEqG+TS/V8aWfBPt
	 uAYf8BiqsZ9Jxfx0W/RC4UQ2KzJNO5ARoOe3JFmGIVk1bo1W6PPE0DuXDqzLB/IfQaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=awwFvkUW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I5bw7QSg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA45606D816
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 13:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FA45606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=awwFvkUW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I5bw7QSg
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3DZFej2651221
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 13:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=W48oLRMSiXk
	fxhfTWuzGRkhGlQ7vgGpxFZ6rRuLSbuI=; b=awwFvkUWXB5gXi0PDBFZI7xgHg3
	TNARVUq0NgBtbeIS9lDJ5ARjBQyRRoHKYDJizfWR06NusFgBAj655Drux0pvnbra
	yAm1OsXLWHI2A67xKFm0foTuOtaqfWFyIxVYJldRqxE58ITLK0W+171x6Foqezu0
	/TobNU9vI4fzsMR00/4uGqfJN8mytRUhHb2U/7hrYmPsSFb2CLqXWiwyAfTyXVj4
	R39pBnlRxN0zKBhNNWTizrgLhchv9w5mNf2N4P70OPEESbpeYXqaoLhlo46v6gQg
	/A4FR67XgAJCVoPnbCDj6z9YHnCZGay3y6o/uX+aMCMfhFaAjhtSyHQ24OA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r41m2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 13:55:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso7622800eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 05:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793714130; x=1794318930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W48oLRMSiXkfxhfTWuzGRkhGlQ7vgGpxFZ6rRuLSbuI=;
        b=I5bw7QSgfiWgI6P14H3osiEgKO/zKMIkLlvJrY/nDeDD2Sm0p95okcD8qp402l/9to
         AvccmrfCl7GfuiBpgRrJR+BpwYoVXUaL+wjwjc8Y2gxEmliQIA3xySjjLG7tbdPhFAm2
         Lm1+p8czE0f2/b2NUEkaNZIqzgkaTykcl+8DMfB2zq9tAyfOtX7r9WPXW8LhVR0hvVg0
         X4oczbwNubDv3O8g00R9WX23GcDPE8aUM1HLKDgrcMwi6bY2Xzc5JOM4ihdbFbSFyJGs
         VWEmf++N19/3SV4+pGVgkNXVGwZvn9bPeX8clntqnu3dMqWa9P3Sbss1Rx81JK1CCpub
         Pt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714130; x=1794318930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W48oLRMSiXkfxhfTWuzGRkhGlQ7vgGpxFZ6rRuLSbuI=;
        b=H+n/IBh+xol1ePsvaznwnlPAXTnNCpKcgk14A5mV9/b9PBGiQacTKdXntSP9AaCkXe
         lp3ZdJosBc6EqY3rylh6ouQ/tljdUvlf8kvZB8CbmHuoSW6VPxf9WY586wCK+vFN0olb
         tUwqTfM93woiz+5OIFq+QY1Z759h1ZIjWGmfZVk4wBkPxjzaWVa3hJVuj0L1/o5UtRU3
         FN5SI6xUjfSXKyakcQbkLNimy4hOcbX+hcPnVatPiPl+EF6ISbLx3mJw5dNUAsx7Cbge
         AoIuXpnes616mlZcCe5/6WMSJqIerR+2um0kUau2EJhV3sXHFMmzitkPpAC2ZB7nUKPO
         vT1g==
X-Forwarded-Encrypted: i=1; AKwUvByo0NL4PFQdDSqBmWmxs3i5S70trTjWnbYlgVGTA0LPdtX2pjiWEsldrndymlcdrUqAdcKL78+ynh2hODib@vger.kernel.org
X-Gm-Message-State: APuU4Z+TV9i+sZ6N1mnae2LPkM3lW2Cp62+73aw41huoFHO4bRwi8Utk
	eCHSgWrY2caAymO/Of6qBDNtmPWj3hURPZCju89xWg8weiGX9w9nF/mzSRto9aTj7BarF0pz7+p
	skyrURISH3+rd7nPcVNpUIkkjJ230u0RXYJn/7RC3LIROOy0rxmivYDuarJdhufyVg/z1Ty8DuT
	6gcc0=
X-Gm-Gg: AYBFou0DyEgCZ6hl1MTrTg/dz+aqltxaMyQRF5Hmf2h+pUKkDVx8niwifDhikdlcEAc
	cyDj6zxgji9zZ2/acjHdVzCzqSIAmu6p5z4gIHmNMj1S1s65/Q/qMcm3pFNfLP2U/sIwuqorUSk
	lkq7LVWOfnufdpB9xYxGd3rsEtTLsukJ1yjxJynmaVBO3n9+4bkIzY6L30UgyKqt3kLGhSie5R1
	evxEYR+xPbzGMGv+lCuuQfSwUHZHSFRM8VPQkFkTw3ptDUs7YFXSCGEQnldeI+sdp/5naBL2GaK
	e9DJgrXTJzcuAZ50xKSlJQZKL2w5eT+htNTcywNPvdamu2AD9E1ZVxb2C+gsNLlBMf2cENyFsqR
	t9mmMIlC2kWG0n8kq2Cv3tDnferoQUvhux+csH3N9Eivc/7jAxO1H0Rm3X/xuaZBYrfPOATMdLH
	fy8HD4X85uXaIYFtRbh8ThlFwsEXCBzf6A
X-Received: by 2002:a05:701b:42c7:20b0:1b0:f0f5:e38f with SMTP id a92af1059eb24-1b0f0f5e3b5mr12588862c88.34.1793714129557;
        Tue, 03 Nov 2026 05:55:29 -0800 (PST)
X-Received: by 2002:a05:701b:42c7:20b0:1b0:f0f5:e38f with SMTP id a92af1059eb24-1b0f0f5e3b5mr12588814c88.34.1793714128944;
        Tue, 03 Nov 2026 05:55:28 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a9e2ed3sm41634001c88.19.2026.11.03.05.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:55:28 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 2/2] arm64: dts: qcom: nord-rrd: Add PMIC ADC thermistor channels
Date: Tue,  3 Nov 2026 21:54:45 +0800
Message-ID: <20261103135445.2049110-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103135445.2049110-1-shengchao.guo@oss.qualcomm.com>
References: <20261103135445.2049110-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KKhrNHvLSYGXJdsJpB48rHaKNOH72L_K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX2R7+SWljvjXr
 GawclBBu+so+HnBnJiodhA+LkWdkFZPoy8RDr6Tgy3kwCZd3fKHSoSQMrkvkthKKl6v0DRd3yqt
 0+wLcWSk30NbXsXWDFZNhg88Rj3M6697v6iu4DO6zBN8jjc62WK4uMgafrOdLSUXoypuJjg+vlB
 NQnA+DzNlPPO7MBH+aDIIyB0+FZYTvgrE7sKq4TFbZNKpm7nCFT3zVfVfCHe8YnitRjo2jN/Jpf
 3EAyJ4FZjdxT0pB6irhq4L3C9B53OU0u8GB7/3fkGJaF3FkEbONdyNBGl/aj2icqDcSKyOSC5A7
 R3dLQEHldAGf80VpNuG+/k9oogLQwRdz3h3LTdGo3KiO4efrII1dJzgauZACFmrR3r91gm1nXVG
 xnIh95b/oXdJBJc0vNVh9QCDvs0sxCmF/PBk2Jedt5rPIFI95a3jAkBz5KwFJNKT9eIrcyLAbVL
 +6T7Oj+pp0JiJGkqOUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX+F/gRMns9Yvk
 BQiUpbXHCejgN7PPOYb0Po4Urm4Mu2WjVrzxB2KExxvzPOmtIOPI+kcI6y5ztxt3ElBIaee+bJo
 9IJ5+rs2h0a9SVUER5P5Me7NCm+6zgU=
X-Proofpoint-GUID: KKhrNHvLSYGXJdsJpB48rHaKNOH72L_K
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae9e7d2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=81vGQKYGPs5K2LOyq8AA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030055

On Nord RRD, three PMAU0102 (Kai_MV) AMUX pins are wired to
thermistors: Kai instance E's AMUX1 (SDRAM3 THERM) and Kai instance I's
AMUX1/AMUX2 (SDRAM1 THERM, UFS THERM). The remaining Kai AMUX pins
monitor voltage rails.

Describe the thermistor channels with qcom,adc-tm and add a thermal
zone for each.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 84 +++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..ddea691f1c6f 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -53,6 +53,62 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	thermal-zones {
+		sdram3_thermal: sdram3-thermal {
+			thermal-sensors = <&pmau0102_e_adc ADC5_GEN3_AMUX1_THM_100K_PU(4)>;
+
+			trips {
+				trip0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		sdram1_thermal: sdram1-thermal {
+			thermal-sensors = <&pmau0102_i_adc ADC5_GEN3_AMUX1_THM_100K_PU(8)>;
+
+			trips {
+				trip0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		ufs_thermal: ufs-thermal {
+			thermal-sensors = <&pmau0102_i_adc ADC5_GEN3_AMUX2_THM_100K_PU(8)>;
+
+			trips {
+				trip0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -377,6 +433,34 @@ rtc@32 {
 	};
 };
 
+&pmau0102_e_adc {
+	channel@444 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(4)>;
+		label = "pmau0102_e_sdram3_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,adc-tm;
+	};
+};
+
+&pmau0102_i_adc {
+	channel@844 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(8)>;
+		label = "pmau0102_i_sdram1_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,adc-tm;
+	};
+
+	channel@845 {
+		reg = <ADC5_GEN3_AMUX2_THM_100K_PU(8)>;
+		label = "pmau0102_i_ufs_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,adc-tm;
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

