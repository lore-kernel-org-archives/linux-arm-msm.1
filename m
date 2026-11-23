Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467339;
	b=nsybjDplQhGjBD7xuwt4gg+/cJ4J0YAvtZIubIqDxUWu/xxV49P6kUAVuCBdr8xgS3Tr
	 wgbBE0p231aT5FkRJ+Y9zbCCfCTZf/tSRN7D7JJJZeQOBBzmQxQCwYR4qJbSZSPb1F2lq
	 f9u6oJnypfhnNiO4+kARPMaia0xBKuwjcbRwNADRHQnV1keLxAt/Wq1DUd3GP+ANJZbwl
	 bLcT4HI3X6AgrwS02LlFpn/jM7iWoVYT7vsk/p+8xn1q9YeubC0pB3kO+XjNTMGcrscHP
	 1W45BPT/UP+fUX2bIzgdZfe0zfA4CLWyWCloRJKc26zUIWbZoSO7jBpQ0waMH0B8elA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467339;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QVasG0GIAMMtQZmXmIZ/u3rymwHyTpJSQBxvHK5S8ek=;
	b=MqmIFF+1ZgsPIk/gfLlRo1MetOZ0k3T/ZFBaMulc1KYFZohTHwYrgvemaZdDFWoWNz5N
	 I9puCRoWcSTU0l99c9PidfI8jBns98QafQcJt6dpuenpf1/Jvh4l9JoaJSqfmsPsdsA/Y
	 mO/E7IMa1g3eLRwLn7EHTGIc5CglLiex1YrkUX1BtKwcH8C3v4Yo8MeHa6+P4l/5A+fbB
	 +mjDNb9TfizqhNhLlb9djj8BstYZUzSs86YmEB80wxcnwuWi8jZeRU7ERjaBmxMOXZqWm
	 igLTDfGhg+g9CqvYL1TKIU8UH2ORuj1hQqZ1g8EG7p5k04AH8Xo+snoM3frzTKYRHXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UWLFtAe2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gAjSoauk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E3C606A332
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31E3C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UWLFtAe2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gAjSoauk
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuNaq2349969
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVasG0GIAMMtQZmXmIZ/u3rymwHyTpJSQBxvHK5S8ek=; b=UWLFtAe2S4Q8jUG3
	mTrIiniGHu/xf1FQ8LVv7WN3T0HiTcefhVSzp70zVDcu46R/EiuwfBGr2oSGGxvg
	9+zfFJ5m3j58wGgTWFJ2oxM6Ul66PA2Jfoqk8jKiMRMaS+zBnoXqDJopwLiOixKi
	EUQo1bGQMsTmjE9Hv76okRuAIWfunDw7UcaTX4vMF/DmWB5Lg1Q7/m2LYJLB+bbI
	j8vvvTDgc2DtbhnxDvcsaHSn9QtDPIiSPz0PO1POE3uk9nj+o5Yw0MP6DkoS/d3x
	KAasvX4e/U31MVLVZNeL35+PJ+8dipLM7OgAOaW/JlbdIGxCwxLTqgvRJJ+Tfd1v
	iI7PtQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a3cvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:55:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5172347eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 12:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467338; x=1796072138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVasG0GIAMMtQZmXmIZ/u3rymwHyTpJSQBxvHK5S8ek=;
        b=gAjSoaukfJEXi7HCHnJfD84msTrNSOX5ADp+UcztIDKxPexyTGmRpQJxQPloohS9kM
         JSaeXyzXDFM7XqcScqwbQPei9FsYtZldxFzypyZyoGR4cGm9g6hNvWeOQEkOJ2rlHM/s
         bAIN6wTWrGdaYkSNH0FGWSkbUt61fX58rvEj8qC19YK4Zejx94Fits5neyxOjeUHY6Up
         lGJEi8sTDVDGJy5x5MikXR14JTVDn5rA1WFV8uqP9Z/KUGum74cQJU+p4X7GrdxamoOS
         TCqlTEEVb7zakToV7BedfRbXLQ0OIgUUNhSUUC15t1AoFDntAg4T79CogpM94wI5ZO9m
         1JZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467338; x=1796072138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QVasG0GIAMMtQZmXmIZ/u3rymwHyTpJSQBxvHK5S8ek=;
        b=XSn6pac7lGBzVTsU/aTg4evyNcx8NNRbWNLMOqxFVT7SIB3UoG4MAHxD59SRBBbpM/
         t25Zo+A5jYLagAZkoMIUT4poufWT/nmINjbKBYvJ/j/4PMT4ct6NomhuzuRSRSnf15UM
         ykQrSq5zAKl7G0D1R0EeDuunpiw9F9OANiEb8RiCR7aq+sxbdSaz4CqvOHXUvFIJdXng
         rw/AeWSKKCs3ZliABgLZ4WwHAoginyyuk50ky6DIX5K8/H1m4ZVG+ryJ2b1haAMELpvd
         T3n9v0ulWvnucfA/AGzXX31Fa8C5OxjnHF4MwjccIuYKkMoHQdInoq/Hfzg8+/omdeGh
         L42Q==
X-Forwarded-Encrypted: i=1; AL+hErEDSs/5YOQzU3iocBGTPe/J5EC/8I6l6rMp9Iwzimdc6YoT+XNKjzLQsGjcYKIQKUrM5gSBvVTRdtdhacWW@vger.kernel.org
X-Gm-Message-State: APuU4Z+Zd9wZingy5ppz/F/682spPI2U4TyXVe/kpsBkamk1w9DBj1no
	KPYAVjjmDF0IPQ/zi6oKp5AZOXwxh2m4i7lYa431JA7S9N8x0VCFw8BU5XwG+pGs1ga7jbVG1NI
	5IyLXMbApeHvNyl/ntTrb/3CIL4Kp9svTR6+dzzNQOcS9kVCX1w6N1MCiUnstnEgxywtz
X-Gm-Gg: AZFdTZfoKIvQtrRx64N2qgdqyRS6ndVlc0uvMIDnB/wyYXq/Sc45tGBtC69kZiq7DFu
	VTyBPczUZnZ9Y9etEnPNOYlzgBnsgZcoD+LRw8xKUdgnZrm8NJvwnq+YbptOO+6E0NfhDECCMCf
	fJRI+Ch1312dsoBKA3reSNst+NgNSbWxIfB2uZQFsRjv95llWVDv3CMIuaL9YUlZNtZUU7QLb9m
	aLcz0NU1nPt/hIqf8N/7fYboHoJe/9OaqwBXHJDE6LaC7/DdfKqIBQEey5uHasU3HcpENDeyDUq
	J4iJM4FIuBNQfaeaAxbDfc1KSi8T9ASFJnVOt9tm7KKGvxG1C+xOlplXj9PagzFmphHJrvjKyTq
	Yps9fhzm4l51wy44TscTZtXpA93mHwkvKkHagH6agromdQeubcsgYIMxd8bmSgBVUipJp++cq7S
	CcRItcRjWU
X-Received: by 2002:a05:701b:4541:20b0:1b5:6e71:3f0b with SMTP id a92af1059eb24-1b56e713f86mr5295847c88.18.1795467337902;
        Mon, 23 Nov 2026 12:55:37 -0800 (PST)
X-Received: by 2002:a05:701b:4541:20b0:1b5:6e71:3f0b with SMTP id a92af1059eb24-1b56e713f86mr5295807c88.18.1795467337385;
        Mon, 23 Nov 2026 12:55:37 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:37 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:45 +0530
Subject: [PATCH v5 05/12] arm64: dts: qcom: pm7550-eliza: Enable BCL sensor
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-5-747d5383d538@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1300;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=TQ8oMR4dp6+o4PLOcph+lfW15bcDXGH73jPsR+cwzaE=;
 b=C5ta8bd5Vrxxa5KbLb19w2pR0Zq327fKQRmZ4/uw81a02s8hsXDOFC662q0c8jyTj7xt/Wwxl
 kTo+phYoe7qDJH4Q+Mo6ZhjupbPnOQacYERjTqPlw/DkZBFXITGkTjB
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXyOxjwvmjMHwK
 f3+nIFIAoz8hTlfpN8leP4IGLfGw8qvEeaa4quJWcrjzAhLJoA+rm35LlOzxmNIcTcQak8KawEK
 OxC8xthVBoF0tqloynB5YsYcYxf+JUo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX5ZGDbZRQ5LrZ
 44zZ0k8cXz2NPrRaz5uwamf1pRAD6kyM7FVsu7YK5UKoxHKf3wYEWyxd+ozswtTAguEQFyz80Ej
 L01imQCgGVKBWUyp7fyH4TIsofelKqopiyBo/Hj8NDc1CmpeDb+fsCjUiOMFu1SyXj7C8Uju/er
 9U/OKK8JPU2m8tvCLr9Z2/RUNvyDgDZiWnytG47LTop53LHM+aTm563BbASnUnpq8FduaEXmC/J
 MyFYG0UmiAlV/VaHkaqCoPumtpXwWcX52kwBYf9oKb/fmvAr5Y9Ug4++XlnCrG8UooFZZnc2KCQ
 jLn9pk4g5NE/GZdNUeM+84Wd9Q/65qM2yOcxUGlE+gSON0dhFz13k55ly3EaS10706dybfPyeVC
 MpcHDm8pUa6dxkG7/KDs2SiehCVSiI/CWV3oSZ372D7LT3Kfl6z4+AeFtupRhXcxOJgh19TkEqz
 JawpM7+BiAgj1ibxqvw==
X-Proofpoint-ORIG-GUID: BpP304nvyoZW0ZOWB2D2uLDpMLd-4cAm
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b04a84a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FmpG-t0u5PG92cBmzUAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: BpP304nvyoZW0ZOWB2D2uLDpMLd-4cAm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for
pm7550-eliza. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
index 9b907f69264b..72a70b5dc9f5 100644
--- a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
@@ -48,6 +48,17 @@ pm7550_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm7550-bcl", "qcom,pm8550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm7550_gpios: gpio@8800 {
 			compatible = "qcom,pm7550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

