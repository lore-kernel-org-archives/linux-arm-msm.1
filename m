Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467366;
	b=TZAkKE1R2o4f9eKogy+2aw1rjbYRxlGm086q3ecjv91Cbm7OISJbCDz/V2w6pVBu5lPj
	 k8ykxcO/dzAtP1DIo9ahvztQeehGy3/LRVV2vVEpzL4/NVo/88GhfuRKKFK/ZwVQ16uYn
	 +AOVPol9Zyji2B0hQA8ax1KN6s/9j0obX0mp/oXF6941eoDvVbsBd9j64xgGgqyLo2cRo
	 +M6TOmFYz6xIaLR/zmAOgQezCeFJts/tKNZj62yVeCTCYrdMScPSL67NqNUgZVJ5EQOD2
	 3h2ZWh+0fVkt/r9dsRdPaIwm7NtqPo993x2E3R9cevPNgXCqGakJ2tBDzjJjMlQVU3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467366;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3B0sddGns6tpiivmvUnZfvXMbFjv4i9fbfRQRV48XlE=;
	b=GZiNwV2uAxlMA5lNK6xUns61/5Nm3JiMGK+/IvrOFxtQkFlEEAgEArZ6Hw8Vx/WUYNvZ
	 sgT1cfFTbsA10FdwNOhKBtiNk0CGNsVAi3rxklkdB6sX/QKaXT8Zl4yvITLmdUOVxXysc
	 OhP+Pz4hJ5ZpyNqR0132kUduULbqhrBns1Y9SBB9GOBJoUoZz3RJ+IOGAA9xVqE6vqX2O
	 j0Khr2bCnC4DysGNRQFVQcJR0ydUTDquZNkuPkl7YzvinUjrUfR4cuMmnRH1AqXdbr+lt
	 rShYESC7CWXZZbNn1VHXCaTiWKL874hv1aBFVD9TMwJJkXgVD8JtDk9i54g+Z98Yajg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jSvXuoSO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j3MwRn5L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1561F606A680
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1561F606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jSvXuoSO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j3MwRn5L
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJujEl3963029
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3B0sddGns6tpiivmvUnZfvXMbFjv4i9fbfRQRV48XlE=; b=jSvXuoSOUp29r3YP
	UGRAlBHjsoytB7EKyciLou6y6Ceo1/+Vr6tOBvCHevzLQ1PYMCTqYotBKpz/hTXU
	mYpoceh776OjlZHBSmpiCxE0773FZS7pKC3c8cNPBP5fIBaMeEX9KGvp5VevBcf2
	Y/x1AyvfPZqBGS+VTHtSginFptiCkGyOeibs4hRRDuHpU8KzkqhzGl0Y7xN4J6t9
	jnYN9Y8Z0PlGpS/4E+SKkQ1QLLH8MVol1fY0s/ApF0zATZtWPt0KLHFmUbW6yvoR
	cSavC3wKzwPcKJwOwVdZ00SNAEbvhBZkcHz2ca+f7+We3st0L66nyhsCLBHmshNS
	l+ozgA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7u36f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:56:04 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3854627c1c8so5565891eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 12:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467364; x=1796072164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3B0sddGns6tpiivmvUnZfvXMbFjv4i9fbfRQRV48XlE=;
        b=j3MwRn5LXavpEvkUQoKaNkNGPR7CAlr00zMATQ708aeyeBL3pmg57ttO5pcGQNG3if
         vliX8vLl/bcYH//QMkEscw02SOZ/enZl3XAOIVdRCK8/pgxM49PTNAHUHXRX7Uuu1DjB
         FryEj9cGqCtw4F9VbvZ6NMq9TvICAQTDo+zE6i9AW6dNjBuljf85gnwf/yHn5Je15sAv
         CdCzL0VMf4xGWrBLaJKxWP+GCFPwyDazSeKFhyZ4VlGiwQGyeFUekK8b+VNx4clt/ggA
         M8Xsvi6Gt0nykj/KqRVsZTavJSeLcnbx4gkEEkTNQHjOv/IyRLeeZoOf4LcKBqVoFej4
         djmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467364; x=1796072164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3B0sddGns6tpiivmvUnZfvXMbFjv4i9fbfRQRV48XlE=;
        b=TI5O/P4Pi86a0Y8tRi7G1Ex2D/ycLDbjtcwT9MjMdBYUwhJJtbH7b5MUJJLVf596cR
         ROm6GtVe8tDLPmrsKKq/LCzKKHoVqLbC6jP4eQK1O7JT4rOgvalpBeDHq9zMkZt/d/3C
         NyuJScWExkffQKPDa0phyUuAO05kPwW8GTl5GV0Pivqo9mRf4fP14DNzogbEJIOeDjNe
         NGv8ty1/Ahd6HV3q2ArOSTZhkhdNWSY18Kka86Wg9hylrFpXGuq9iPBre5AgsjF585z8
         XSNHO9CLy1s9iUO4zp4u2o+GiWH7PiESBoWplDE9YuqCpAErMdh9qki7HG/VJNzJIowl
         72vw==
X-Forwarded-Encrypted: i=1; AL+hErGVar4KxOQwTRBykk159UtgpPd2b4CUhFW7A5Mp3lFl79DcXLnk09UG6H5To5COGwBji82ct5TQOzs+qOLX@vger.kernel.org
X-Gm-Message-State: APuU4Z+y5s4A0Ve/NT7UwUukC6jfyWJ1S6Uzob4IWiqKGQLRZ87Fj1Wc
	ni5t1Z88ql8/2T4yeU1nuONV1s4pgdt4jQ15Lr9UqK+unIf4kknpsOHdjQEeC2wwTaN9fnG8oav
	KUbw2zqqbCkuOcbckwI24LTLylAnQhs5CBcz4tn+YmcIlZWQsDNWiLpPmoc7WLvPHU70q
X-Gm-Gg: AZFdTZd909Eqy7n09HbSJ8C3/jRYbIthw8xJExu7CQfCLTzFaH7oXFVd5W4TdZ2nnIH
	pJ1J1Xr/xMrphqyYP2axdqqF3nJWcZW8trmHnYVWC24DZJuhqD+HgW87Gad+1e3PjX4PiHAMAhZ
	XiwZTIA6TXeDxSS7FWGe3gc9bn7KnuW3yEy00vnXq+4BmaFSFRMT1aVEcQ5PRsOhnLaih52d3Eb
	R+mQl8SlLwp32W0pzILWghdxdwUGEmKUxDElMs2qKs2oq9NaMffMIo3uvoApo9tniilluzeE/kn
	suTDE7HluVw9TZiY8WJ996qPNmdE9oaMYOoVixuom2c+4j4gMf+1Z2FwsDORi0LjJEChHN/QlUh
	PvIPOsT/6cdIv2FM6ostPBF7C0/Su7D1Y0QcwYQSPrPW3QGqzDxpQTsDuU5rfxlv1VsRYzN1EcA
	DYIBBbbGsH
X-Received: by 2002:a05:701b:2091:10b0:1b2:366a:e7d1 with SMTP id a92af1059eb24-1b556912a4bmr14463365c88.32.1795467363986;
        Mon, 23 Nov 2026 12:56:03 -0800 (PST)
X-Received: by 2002:a05:701b:2091:10b0:1b2:366a:e7d1 with SMTP id a92af1059eb24-1b556912a4bmr14463318c88.32.1795467363407;
        Mon, 23 Nov 2026 12:56:03 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:56:03 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:49 +0530
Subject: [PATCH v5 09/12] arm64: dts: qcom: pmh0101: Enable BCL sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-9-747d5383d538@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1260;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=L6nSizHG/y+HmrSiyaptHCLW4K4aN1EFqVoX6vPricw=;
 b=WBO0DXaIYcrZfed6MtS/D0ti+xN8r+XNBuwf+df2d8oFiTs220C7lXXMY9zB482qMtmxdWwxd
 Snsqm69g5abDtBFFihGQduCh2F/DMNTqnj2OanknbZ+y+u2i4FRVODH
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b04a865 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=C1EnqVrfhtXmwaaqmQIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX+8aoiahdYT0S
 7jY7+rA0wy+Atxlj+S3OTlZzFifvk8+Rgq1hIygmAm91SMxahVVgucElavFmbYK/mn8Nb/9DX6o
 3g2BJsTvo9AotPudPBdTbCbdOrsxGtKkrc4CGcD79HAVSuZBsTlNuXr66y5RieT2dHt2padZQLY
 jwt3oSeZHIZo1a7NXoXxqrJ3cDumHeky9tNCPF60sOmMxuj2EGRr+oqABzDr7w/1If2utiVqxS/
 +dtlXsfa6Sr3+l2aV4KhQ6M5kIY/a48tAxGMqSuIdCUBsDS831j9fEHCmDwzJT0PMSrS5xGAzoI
 vAjXtcLFJGJ9nkLge3FEhQ9IFvIN1/uq8EY+SYwU0EMwSZWDF0+v6e4oMGRnCDYgxMzxcHtx+yX
 Wol3UUH6iQWzx1UAglf00tjXn8qdQWld0G7SG5y8qu6IyTTrmTWunkKwFrD8TWr9NYm0lCi7F09
 v/qWUbx61ofe+R34ucw==
X-Proofpoint-GUID: 6GCGNrKvu7UkFSkRTDAqVPf1Y68KjFjk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXyC19nh+2nrOc
 Q+MfDGze7D/NOQPRonQpqXQfWAg5joOy0NFI56U+8YM/bdPRkbb8ceyvIPiwXdzT92MMkt+D3jE
 1hoTzEYLfGMf6Rma2eoyi8eiPyFKZwY=
X-Proofpoint-ORIG-GUID: 6GCGNrKvu7UkFSkRTDAqVPf1Y68KjFjk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmh0101.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmh0101.dtsi b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
index b1ec41325958..5635ed350f38 100644
--- a/arch/arm64/boot/dts/qcom/pmh0101.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
@@ -43,6 +43,17 @@ pmh0101_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmh0101-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmh0101_gpios: gpio@8800 {
 			compatible = "qcom,pmh0101-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

