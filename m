Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467386;
	b=Fb0AI5vwLtnOmsSAhfSy+4Y5mKND5IlmpK/M1bttl1Y9YFoAaUdy6X0UBqO2zAH/H4IW
	 B9JUEAOrHfZbkRO8m3pmPefp0ylf+/NAO1kq+VSZb81mZY6zo90Wfna8dW4MqWXHGHkWG
	 +2bwXoNsqF/EBYK3E9hmxk73Wfli1LXGOwmgxnrNJStDVvuzE1Aa1MgkYaIeodGk+8AYo
	 b/TIqZhWZ73ZaVenVPivsMo0osEXkxngLPpE3wzNTslQihW8jsSUAhWtQCwCxHh0uvUUK
	 w1PgRob485WPoGmxuzHzl10TwL/QjFfv5blQBIUDMNkCpcOoe/74UwOdUm3HI2P6f6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467386;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=;
	b=IaScdlbSko08l6QkyQc3mqVWpHz22cTySmhVltSfnW7uI1mCNBYAwAqgITxIG/2hH0EX
	 /JhFz5ypjO1tqu4SJnbTbysZ9XIrkD2/0vcxhkvjg9bVDK4ZpuV3Y3c71w692vS/yu36Y
	 dSTM6IEfJ2gMpb20WQUqZ9m+jKjZvQLdWWiguERYsq7PpFDHvYaIi9baQlJe/2ebyvSnL
	 fd2NYaOfODIIOFi9WXxKjpVDSZaJer3H0SlOIweHjF8tVpUCfmgaPiFAZ0JKV7bs6EaSt
	 qfKJ1/u/39Ml3UfNyy4pP/dYfPmrtaKWR0pQqpAlDq8AQEAKS2P1R2+ojGR/BpOKZpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H2z0940B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Olu07rpe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A0C606A332
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6A0C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H2z0940B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Olu07rpe
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuUOO720774
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=; b=H2z0940Br/B6IYM5
	v050grSbNasErG8gRzb/FuLQCmYqwrHcY7TL6CmETJ3DOvBxKlip3EH3Qqqd4Xmi
	waVlwJpkhabehJ00n0ZtXV+qS5WtOjhWhF/MaR6ySBkRI3aLCmvHo6pKJNtsieqL
	e/2it7vqG5XlXdyboJ8N9rmvxMxFoFkKMRgR7bk73Z36d0TpHMALUCD7syoZZO96
	L69IQ6SpldT5XSP0828uLmaNCwpsp4bQODJcCAc7vm0ZZ9wKvJES7qbp/8fTQmY8
	tew7zVMnodslqlb+AFcCaWEKATXT3yDcWf0CUA3ChfhBD8wHuscNSM8Gk8ZkFnpL
	HIEk4g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqgan6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:56:24 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-38531c1a566so2157684eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 12:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467383; x=1796072183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=;
        b=Olu07rpeqo3Hu1bcDlZO9+luO8T2OwFWlh2HzFjcEkHEloz3QFb34g8OUJVvKzR1tN
         3bG1b2qsESxtHGiKS0wVjiO5La1l0TYrtgZyIHkRwagSipoRGI9Mmtcz2ngfdKO2Gg3U
         85yhqeR4JN557Ueq8vX1wgCNmxeNbrFP0/RJNr2g+YTHZxFu+IxKoWVX/6SUAn4W0DaD
         CYXskwS95nTLLPdHZjLfSWK2wxUEK11pGdzzgCbXBA9ozEMwMpvVPbotJkrl/x6kB+Nl
         J/o1+T/Uy79oU9pL0h/vQ4vkxd0TMMoxoNc6VwRQ/blo97/YCxfs890mJB3cLQLieeJR
         UvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467383; x=1796072183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=;
        b=mzpjA2TdZJw19+LoOZBwWIIieHdxltcbLh3nzO3UUsxf2ohV/jVbI/WJlza4V8snyu
         VIb+joeEwVZSC23Sa5KrCMIr/qZ0XrssMoUI5NFkzGcRkOGXKLzOJvbAhZeKSL6sik3z
         FtF0t00eUhg/z8QWGaIgKwL2Djr+44shYsM5rdFrljZfjxfFhpmwA2XEUmyOCWXXG8xM
         lE4AyH+/5L1nwX6WdH41Kep2Z0sa5vZMJPEeZBTKemyzZ5tCZ6qH2gX6pKurSbJjuKDN
         tcdo+jeHXPJR3vH9kyeBi2n6wpYbTBlZFRxf1VrSOIjVRJcFSIvZ3oDjCeARHpH2OM8N
         HCnA==
X-Forwarded-Encrypted: i=1; AL+hErE6ryZ6ZazEYuhahxSxu/FrX2a7v7Xzf6+0K3q3YybORswUUh97Snfs1tBneGu3Z7iSS3pbfeLDVToK7N+3@vger.kernel.org
X-Gm-Message-State: APuU4Z9KFrWXVifb3PTIJWLlGtZ9/wlSI0ykM1e5PnMOQfLsODD4plSP
	A7+pLklRjzoPa412vpBO2oIDMPHcpne9h+vqWFYjdCTLbaySojIHwBKsYQoInhy/FZtLsvKAWDf
	SIud2+WJXT9wB4kUlaZVAyqNdgBeXM+dLgakaZA9JWrPbotKLAtEh4zKZGEpeDGmnUyIy
X-Gm-Gg: AZFdTZdvxF3ThrVSIL60MyxUDDZg3LW0nx+nt9SqOEsXVXdtnFiILuyzv6AxQ4L+aau
	o1xv2caWwBrGGatsXbLLjLnMom60vzVzqGrvRHLTC9J8GlEbAaeFIk+g0xLjjv9WSLp97F2ii86
	mee2TsUYQ95g2iPBGedxMijEicxcvVeBFhskwNTsprOcUtgwB1+4Z9VefidL3KHgHfEQMFEceDQ
	ALzt/EjitvwT4XWk/nv4qWU7M3eeG+6bSX3amVfhuHTiGllcHrFmVe5ege864UUSa9Mfo9EAqBi
	L1zmTGQzYRGSabUYbdCF1p6O7Ta3hJ2P8p5EbGrCc6R1BIMis2cCcXLutIFE7NAYkbZaUTAlUXh
	E46MBtpYS2CmHlD5DM6NPY8GVlXRo+1pKggLitCJOdh/Flkb4v7Au/N46nEHWAsnSTTBu0hK7kH
	1YP/l3K2mf
X-Received: by 2002:a05:693c:41d1:10b0:386:9d4b:9403 with SMTP id 5a478bee46e88-3869d4b9723mr8818073eec.19.1795467383411;
        Mon, 23 Nov 2026 12:56:23 -0800 (PST)
X-Received: by 2002:a05:693c:41d1:10b0:386:9d4b:9403 with SMTP id 5a478bee46e88-3869d4b9723mr8818038eec.19.1795467382818;
        Mon, 23 Nov 2026 12:56:22 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:56:22 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:52 +0530
Subject: [PATCH v5 12/12] arm64: dts: qcom: smb2370: Enable BCL sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-12-747d5383d538@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1198;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=vJQuhX/oBX172FGrYO7vTJtYeipTicxxvpxXEYh0ojs=;
 b=c1lfg4TaQF9XXCtiV+bWHYb+IQQy3xyZxsYuABAYVnTRz7kwnthdKHQVzbWpLFWVTQ0yUfG/o
 wCE+6d7SD4uDvya0APz5YCTuTN4NDHptzSZdB82hrfdPR3sFiuqSBT7
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b04a878 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Mdvtvp0LKpy3kcB40AAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX4Aruqt14axml
 /gGoEctBAJpu8HzhkMHGg2toSFj2fH1wDuC53OYRsS3xIxYbkiMg76Ha8PLEshabxH9qU6bbtmd
 5X/4XJFHVApod5G1TIlET9Ay3xQXLS3AsNT/qh2CZ9TOYqYIzAVWFjXPFuUdYSEGSJ7klUIa4iH
 MHfms7N0tB2+x6hIfnq6lJIntQKX5/gauyC6SG24mGZVa+IVM0VFdgAMrjzz/E6Z75GlbqhxtJe
 KGcYN4fN98UsNVaodEqsml0vQuDL3ZSM82imqcDYCoKKCgspDP5z9Klzngj+LZGBrQ08It44IwA
 fq22ibj4Noy9YwXUOlckLKmbcr6Qqwl2/oL/Cg4yDA5em1/byEG1l/4JUIckAxtDXM+GWX5whs5
 ywdDqc16GoZdQ5ZBnlGWIfl9L2zOd+/lJw+kbmPRlCrT3T3s5tyPRBkkO7xdaRYCgg3SJscssC/
 uKCZqTmNKa1HG45KdhQ==
X-Proofpoint-GUID: hLOjbNy3n3sFwc9FpXk7FfpqxJt0Uh4R
X-Proofpoint-ORIG-GUID: hLOjbNy3n3sFwc9FpXk7FfpqxJt0Uh4R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXy36VEN8pSV26
 0oDTogz525lzFV80463UeQAFx6PYgZEIEaijSvALBmocmWz7HoNrFIED5M86+Mly5RhUpgMmjpB
 nYkQ9lNs854HcoMKuznQVBxqQ65lEko=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for smb2370
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/smb2370.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/smb2370.dtsi b/arch/arm64/boot/dts/qcom/smb2370.dtsi
index 1e02578e4ee3..4809b3d8cfe2 100644
--- a/arch/arm64/boot/dts/qcom/smb2370.dtsi
+++ b/arch/arm64/boot/dts/qcom/smb2370.dtsi
@@ -10,6 +10,17 @@ smb2370_j_e2: pmic@9 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		sensor@4700 {
+			compatible = "qcom,smb2370-bcl";
+			reg = <0x4700>;
+			interrupts = <0x9 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x9 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x9 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		smb2370_j_e2_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2370-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0

