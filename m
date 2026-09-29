Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AC052CCCE
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687442; cv=none; b=JdCb9weLn8Htt36PCF7Cv4n1neO5j90RfTsnPOksGMflOSVtQZTHGJCmP+0gXXC1hlibaw/Q6xn3d4mn6GiXP1qfwfq0bMlcIsEA08hkT4tqGioEvHjkqba5j0RJ+3dWFrLvMKLAgpdDV1v8umOpC8ySRebGC+BDEcxCMiL2ko8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687442; c=relaxed/simple;
	bh=c17Pf5rnH1vsI/iUXo1whZ8puXHwRPELdp7vpdeXB+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WUrLMhiZUp7RamYEd0UOdWtzQcHOInBmKKfVtIm6d2subtBw4Yl6LfJn6NUSxQT0JHaLT35+WgEp54Lzh+MSxuoW7khm/XkJ45hv0jugCrL0FCvJDBndih7HPC3QxExE2wOKvqw5jjNaAXK3xtYpv5hEuvRozxtm4wbTHphYqYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JtxTDD3v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g7sS12Ph; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JtxTDD3v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g7sS12Ph"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqlP7611728
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FD6lC6MdS+vG8UDhCCvsK9pwZlCafc8102UVkEyzGXo=; b=JtxTDD3vOv5Eg3EZ
	74SW4nZDTmR5v3LuNgsquWaCmI1NIQdU4qegJMnTIYqCwuHKtDwNh6DLzM3zh+jj
	B0CDbneX5meq/rTsE7Z6iN3aEVcvIhs3F0amJq3q5WGMApysNQ12sOFYLWr5NwTS
	U2W/7nI5dm/pxffyQCViGRVR77JgSJuAP/fjNf8khRa8hBerry/yvlAOnxVTWZcm
	jmDQ1n/ZD87ElOn+f3hQ5gjIFrkO/df0Lc6iC2GRfDmcT2TNUr8gEty4BMzgkd3e
	0eoK7qILGkiAOpO8h3WdbKyTOuX25gVZw5xyBC6VF7Y3ov+2/w639qsYwRRgfKRS
	hmc9mA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4u6s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:10:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91431adf55eso75516946d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687439; x=1791292239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FD6lC6MdS+vG8UDhCCvsK9pwZlCafc8102UVkEyzGXo=;
        b=g7sS12PhuVymvpvde+Jng9clBqsPyCuOFQ6Var0XlIqB1bOYbtIKGomCx4vAOkacFI
         +khjj9fCRMl9cuxFfhCqRzFas0jOBFmhzgCVx2rbBHT52GxQI6r108rMlZn8qu9NftpT
         Px7nzatbzlqpCv/itk5hITU5VXJszRp8rNAaG2435hUcZc6Wh2KE5jM8SR4xTvQmEvKg
         e8snkNFi2JpqfyMtrc8HwZXjie+zGzO6SB5ZAV6j/S3wHlErvirX2Zef3DW1j3SpVgsP
         QCvbtpW/kskSUHzhm14t4sL32vSnbSs1NbkkxqCgbHfamcA0ELDIRZiUP+HghnvI5Qe1
         ZZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687439; x=1791292239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FD6lC6MdS+vG8UDhCCvsK9pwZlCafc8102UVkEyzGXo=;
        b=bmAzbjC6IuqFUUSbT3nxAc5/0QEosEAz4/KS+FKMT7fM+7CyiuRRFIGktKlc4yeq7R
         xZQeC203JJK0xi4QPE08zHdrtDCiTc150QUQs6fjt8fheRG5sSWqz9qeKbu6oYEQRCyI
         EvsMalwJ6D+yT/HnTOMIgfRn887qXAmUtlpTqEuhPRNXZvvbpGxn96cNAEbETSjAV3c+
         EHX2d7RcBu9miVYkjwsWNZnFjBcuvaLHHtxexewHB/jC81M1f/Dm8ss81AoF4je1Cuo/
         wpFdBCr6xcD205NP0irLPRxVP9mTPkipfA1tDLf9rM+f8MucRIBofDFQsM5EiR7MMhOc
         Gv+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzrIQE4vgjoU/I2QRxR6wRFY/extPa2vePH7gjaE/Os0WCcJHCajQ3qxFEgXAMBXMuEOYbkYhpCYNVc8Vzz@vger.kernel.org
X-Gm-Message-State: AFuF++mfBRfycyQtk7nk0LzEZJdhfPWmtrUFCNzxagHcSQRyW0/Ukv6O
	Tl1wD5bJUxdyj05KnGf2WgCN0vEay1RnfbhS+NuJm/KUY5yiPYnSoy+gI5C4T93w1DKyf9uWP0K
	GwBSZnLdoJR/OZTvNp1Xd7c0b6f1JOMyn6z06x1S93ZZHs6pVtDsGLPZ9cf9anEGAMYE7
X-Gm-Gg: AYBFou2NGYPSBqxd5MiCHZwvDxI9jgLV64NyK9vVxQtehzDA7W1FFpnDyKTi/Vm+4+H
	RuMiI5IB+lDXQintiF/rrCT2Wm0OsPTcDwya7URGGP3ZO3xa83WPlTHwW/xB3hbn3LbE28LvEdB
	6GqLWgx/29HDjjHCRe0VNTuxhxTG1BAW8DACHNH1+X5Wx8H3qft3CoMbk8pNNo2naNHScreJ3OV
	6Edjp86opRn/Xy3VTnbhbo4UXtbnIPoheiE5Ah/fFwd0jicxYRfMobnewJRpDPyIiDZzzHBm00z
	Om9akkGf+FKty6aaKgUdqfn+6jYt0h3IcSn1Ecu7P0tPHtEpKoyVJUMXDuHBquZRy7zYsqrmpZm
	fqosKvmRGF8od4vzm40y+xT/aTcCfEUPH3is=
X-Received: by 2002:ad4:5948:0:b0:912:517b:40e5 with SMTP id 6a1803df08f44-9142f92ab08mr245699196d6.44.1790687439107;
        Tue, 29 Sep 2026 06:10:39 -0700 (PDT)
X-Received: by 2002:ad4:5948:0:b0:912:517b:40e5 with SMTP id 6a1803df08f44-9142f92ab08mr245697826d6.44.1790687438088;
        Tue, 29 Sep 2026 06:10:38 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:35 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:39 +0530
Subject: [PATCH v3 07/12] arm64: dts: qcom: pm8350c: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-7-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1258;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=c17Pf5rnH1vsI/iUXo1whZ8puXHwRPELdp7vpdeXB+A=;
 b=XhwaVHJnLjC/IgFYYs+mIbCRbw9D2kBck4SXpR/pnx7zD7aUsUa8z6K0ZIgE4nKO1zU4iPrkb
 aoKNmoN1I1pAeBy4TRQFW1W3TlnYAaJmRwB+3n/j4KUP/o49+T2NKst
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX03fEDya9k7rD
 BMSaKCBebAio50Yeyw7z0gJ++Qa0gfn5IblFWuHmjx7Wh4H0LLqwmOrucmw1z8ByyjLk8cpb//y
 YhwfKBKVCtiVmHJNUhlaAjUcjvqe4pM=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abbb8d0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=I246FzBBSJD3MQbeXTIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX4HP2qWa27BPQ
 Pk8dq6OXktnBTc/d7QBL4rs69lV7/4yuKof3e6IGzNEnRNEI7019LAQNVlGix//rQSMYqHEzY1b
 5PSnKw/UrmttlLBcPEtUDiCG2LLyChQYethak4zZoyqVRZ7NOBfZLRYNHbJcryrbgvubNXugCjP
 8fBaNoElOJWRUYVujXRj8wZPCNkl/T3wENBOnywKyetENA8QWpnPgauYnlHG+KowEgMsxaCFZRZ
 85OxosJlOmb+aK+BDBkfpQhpBFsv8Qm/iwezXGVBbKnjerUF3XK3p7VcPGjuAypllLO9PXb7axW
 a5Npn57s39pNvCQBrDQGi2ZA0hCak6dfVwfogoAjjdEcd4432h3ApotcmWR8jWpi8PQit2SwSGB
 8VCDj9AcmAd7q/uQH9WoVIX6KB9BtLkhXFxSK3TNhkJjl4sOiqpHx7jJ3+1itSKac5Mko07yJbP
 T19z/Qq4eyf4bnmyBtA==
X-Proofpoint-GUID: ncYd6CkCSJ_e39-er_4xE9Je3-DvQdw9
X-Proofpoint-ORIG-GUID: ncYd6CkCSJ_e39-er_4xE9Je3-DvQdw9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for pm8350c
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8350c.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index 1a24e6439e36..52b5fc1ef9a3 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -20,6 +20,17 @@ pm8350c_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8350c-bcl";
+			reg = <0x4700>;
+			interrupts = <0x2 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm8350c_gpios: gpio@8800 {
 			compatible = "qcom,pm8350c-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
@@ -41,6 +52,7 @@ pm8350c_pwm: pwm {
 			#pwm-cells = <2>;
 			status = "disabled";
 		};
+
 	};
 };
 

-- 
2.43.0

