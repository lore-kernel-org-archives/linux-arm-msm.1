Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002525;
	b=T2V2IwsHwPP78rPIY/GH4miy40h5pnRb0cB1vuwTuuQZxgkbeBoZ5m+LTt1rRqMfTvZn
	 77tRrre1wTkPE9r5+Ai1jADDaueanEjuJWq9+4kxm+j/m95hrrFmWmy7Qj8+CBoO3ekj0
	 zUY73DXaQJa4xv3N9xujX81NsMN9SiC472WYASykwxzlOkQvW5x9PScJReMtEvVj7duZO
	 MBNjudPVeWppv/OXZATKvE3sTvfw6KpPfIUmBDSDdTuwKs9EgvKNhjSvpzUnGPoquI4yW
	 90Qt5jkW1hFmcMNudOxhjI0TB5VhzCtgtGA4gc5Yjuj0dquPDfVc/u/KBEOV/AP02ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7yEuGiHrl8v2KO1Qgqcvszxhl27VpOHCTIq8+dICIGk=;
	b=Zp/6modzFAv+mV8GXXTBjfl726hW6vp5TRilgi0yyDS1PQcwtyz6euhUzI+4fC6HO5My
	 hhhkSy73fwKVzwdvqhoPFMv0XPyIVjRVyoVlfrGIBxTwNPhX7jc/hh6PV8jqWlPN8PDzD
	 SK9Vk5OQ366kFaGahhx4EfUsvoXjlW7ihmmD2kWFz7Z7pB385fbtU3uVu5//4TQaLs7K9
	 GO1QYN9VuZnOgdbz5A716j2a2SJeHG+Dx8Vy/WUnT1naX3U82psDAyo586Y3OETtahVcW
	 d+zSkXQ6e911To43g8Pv3rK0t9N8//CvUfbDYbbG+oyx2SWbrym5e71IXwuzWWWYZzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i0L4edZR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cb9Ev+QF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87BE606A32C
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 22:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A87BE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i0L4edZR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cb9Ev+QF
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6JN5ZR1292131
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 22:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7yEuGiHrl8v2KO1Qgqcvsz
	xhl27VpOHCTIq8+dICIGk=; b=i0L4edZR3i/ni09UBm5ll8dGWzoybXYNQLNY5V
	vvjWK1712HYivGRWMj2Cr0tQQOVbdsYWGpi9Ro8Sdx9Q+FzOA2IjcGre3pVEBvTN
	yKxbUZv/autEtk4P/XkFKPl7FkisApPEC8XEpZrsTOt8wKXrO3w4owjazw5HnVbU
	qbIhobFg3jsbQNh+rZmmCm+y5+jU0SFsOvy6+0UAtJYIz1lvMWNWtwLCeyBOJdbc
	B56m5Ok1h2o6OM73xtAi9rK+Nfr1nZh+627PEGtr+WKjYbqUp5WYGNFVC0TnUtjW
	5L7Qgr0ZTEr58tCvpNvXtTcvtM9Fcvz+bRvSTkj8mgqCHo5Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsn0e0grn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 22:02:03 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf634a101fso1016098137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 14:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794002523; x=1794607323; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7yEuGiHrl8v2KO1Qgqcvszxhl27VpOHCTIq8+dICIGk=;
        b=cb9Ev+QF3A3U18mKZ9b8pMXoOzWDMSDM7qKajSNWixIqxQEvVigNNqodq1IgEGPFjF
         ou0zLWFZyG1lZh8YadUaNgorBNdceTCEVO9/bAiFn5vb740e76kqOS8rUz1cLxtOOPIv
         /H7YhGlt0JNHJkfaS3xLnWc/ejbmiptitqbytPa4r3dt/EsLyHUt8qdQSNypIK0d8voI
         B2kXcOl3xIKEEt7WsN8r2ROHQBa17LenG1OJGnzm9ged61p4O+eTkc72tZubEN3oWIl8
         zgIdAiLlRq0arosfmqiRO/7P7VIiQaPVqs++d/fxm7sqmcRevNGxV9zDkoh4vWOyluk+
         v+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794002523; x=1794607323;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7yEuGiHrl8v2KO1Qgqcvszxhl27VpOHCTIq8+dICIGk=;
        b=SVcndAyiaFsDYFM45Qm5OYu6asnDM/xatLF/BGLrikEPuXB1FAKHWIrg8q/bfNODFA
         FkQcn3Aei8PRWFsHd2tLj5halJCnDvCvaaJzPbV95lhbdwyYvHDhoBdZmdUH+mH9Ah+t
         vp3Ow5O8YxQbPkeWQqhTNwSvjpys4Y+wgOV2K0PYKt2WqTMC8cak4EO35op3UEPujEb/
         uhbj0/wXYU30WFXYLlKwCvcfBcmAe+OJzugjfGgR4Faz0ugbzskx7H1QPsV5dq6iqpkL
         MfgA1+FFKinevMYqxBwCiPCJOvdg1ND4uWlZeZ7T4GmT6hqcCECjYNgyhEb7WKLEXfLY
         Jxhg==
X-Forwarded-Encrypted: i=1; AL+hErFv6pMLduRNxxeWRHShwCEi/Xexgxql7smHKf6vYRiHFqgV3Ol88u1z+hfx8yBNMOdebtiedHHr9aHk7WDJ@vger.kernel.org
X-Gm-Message-State: APuU4Z/80w8J/tG1C6eTkxa6PeStCwEBmf07A3Yy5HCQAeDRL7ojqk9z
	n1aPXwmZLHNXG0myGnAeFip8xmrjRt2BTzqTpH1hDZQouGbbjXrhklwkYryu7FdiRW+t5QU4JUT
	OCcpHqfmQTcT6LJ7ovGtk+iluVrQkEir0jGkIEZX9ZCzF/TDBa2U2GLcJLSKCYtTyfC1F
X-Gm-Gg: AYBFou3W0dVofgp7/twpYLiCT9SwnJotZjM0UASLpPkzpS7u4d0XiGjt3YlqrLPDsX5
	a32iB8fq0kEDkh/Kyo0o3YgB4VI0ERE76DkVwBEqArskquLEryrLYt0AUNlGdbWM4kQcPyi3cEE
	S/Bi0JVrxu7nrUEuSaFjWIYi7mJ3GJNE+bCMwvn5JyIUi+H+E/Yauo3TEGyu5iHmbmOUcBQonYq
	S3USLNgsK/3PwUQ++F4D6xnSH8q2VAjtPwWI78ZdwDInYhkdwHLwdb8zReL66YTLwVZEeflmR1R
	UJCiVjV3GyjGa2B2dEuNYW5uKWb0xg49hiWB6TSaT3WBjmObqPMqxSsNcCmnwVeV2mFetNW1JtM
	6lLPRDr9cYferH/f/O4W3J8fgt1QIaX/3+fX66x4tVaGAJp1Dq4ScZWBXyQ==
X-Received: by 2002:a05:6102:32d1:b0:7cc:174b:f7d8 with SMTP id ada2fe7eead31-7d2a12f2ea3mr2331143137.1.1794002522615;
        Fri, 06 Nov 2026 14:02:02 -0800 (PST)
X-Received: by 2002:a05:6102:32d1:b0:7cc:174b:f7d8 with SMTP id ada2fe7eead31-7d2a12f2ea3mr2331120137.1.1794002521849;
        Fri, 06 Nov 2026 14:02:01 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc6162sm5812437f8f.47.2026.11.06.14.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:02:00 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/3] platform: arm64: lenovo-thinkpad-t14s: Add support for
 the Gen 7 EC
Date: Sat, 07 Nov 2026 00:01:51 +0200
Message-Id: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAE9O7moC/yXMTQ5AMBBA4avIrE3S1l+4ilhQg7Eo6SAScXfF8
 lu8d4GQZxKoogs8HSy8uAAdR2Cn1o2E3AeDUSbXWuW46VRwJFcgWTRlkZVJ17dqsBCS1dPA57e
 rm9+ydzPZ7X3AfT9++Z90cAAAAA==
X-Change-ID: 20261106-t14s-gen7-ec-297593bda0fc
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=X8BfmvpE8W7+B2t4IJID/uS+mnVleh2clOpF9Xw2obo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq7k5UdDjlMhFo+w5WSKkPrkrk+l7CpPlWADNeq
 I1iEjXex7+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCau5OVAAKCRAbX0TJAJUV
 VhWdEACS/USlBGnUt5PP9IL9TAcO6sJr1IknBqkK0SmE1IfcRgn8wxVxGGncBrEUKS4ITqqP3Db
 5lvEwB9dLa5Z8Ww1rTDriz/D7YdFoftjvKfJwFtHzZieZkgKahhUAIcm617g1AdHU9kILP3PzVL
 JgnEAi6Cs/G19V8njZ9oNJX1agC7gfijJqGkg8GQDVRpc0RfmBG33ZOlEd7jmcRQegM2dhTdaJ4
 5/qt/9bNQ1Cr06rMGwnVGsha0JUpNeAD2YKejDR9ZIUAk0lZgIMNysCqU8K3/WgwUOD1QPm3f7M
 AODyrwLhcpCIzN9mGWyIFJEP2/PJyALm0xz1TNr5R1/hsVlcrKW1UoxSpWFCXrD+IMkQdozcpbL
 1wMGHZUvKrRTW/A0L4HhkdGj96UIrUWd0BACPZiSOrFnxfZAvMh5Ub6OuZaczAHiGXpC55HWiT5
 rOIflvDFpXWVuqMwEoJDTEv5noN1VviR7pO3KapCuyR2J9gPpRl1RReuFs3tFIPWgLlWEr+JIZx
 joX+wrHb3Uc9FPTtHHvIV+a26zJF02NPSjo9b/qWvzU/zHA6GDPZ5MYCusVYmW585pHUl2OE7ff
 6alck/OwziocUisB479c5SwqeCFlKgcXC658z9DhGRIkBmk+0K+n2CsgO159oANrnXLx9nWLMY6
 GB8xlh5XYYFBUEg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 8JQKNqOQHct4DY5J8GwFXwhjh3y4w33E
X-Authority-Analysis: v=2.4 cv=ffA4WEQF c=1 sm=1 tr=0 ts=6aee4e5b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7rjXLmKk895soiuU5V0A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA4NyBTYWx0ZWRfX5DY77z4jw55P
 v+7HlTeS1nzcejyPiV4D9whjRao739K878SsCDCNMos7yEJ8gvfQlvbzBCZz4hv+r0635qN+bNw
 rWlWOOHrkhjIdxWfv/tPCH4aQOq17IksTHfegWXvmlnca8gYTn8MdF0CnWfKISV+d8u24MGv4qx
 VpdnTF+NsZP05Tyf0d81wNNL9XpwLWbwsPXK4WJWWOYmuBIwAGl8AFL/6ZPps5LCVE9IQXRmeK1
 AppqaoGgT5pezPy+61V6cm1ZryUFrk9A2aayDHd0L68seK6JwvkhZ4qKZ1VQETJYOnyqrAKc+Uy
 YPfK5UZZZ0E2iLgfRlCDdj0s3LATIW9vTyoLrBvnYtBhNkeBNkIrTIIHj3DqnwzerZBHoJwtOSQ
 4Vql50l1ZRtf6n2sL16bjFVgcjEuJgUW0i3jb7D0svPb+IvX8ZyDhJBKmEGC6hjx9JfQuVWRBTr
 ny/zYI+tdlQ6ZgflUSQ==
X-Proofpoint-ORIG-GUID: 8JQKNqOQHct4DY5J8GwFXwhjh3y4w33E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA4NyBTYWx0ZWRfX2I88bxi8s16h
 saAbM3aCmlkpztwb977M2y8C9/2dksE0UY7KJEmNxglmfv2d84484QMPIs00KYlG3T59ig/emXF
 UJb64QvSbIDac/voL3sQXRTHMWKmF8g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060087

The Lenovo ThinkPad T14s Gen 7 (Snapdragon X2, Mahua) has an embedded
controller at the same I2C address as the Gen 6 one, with the same
register layout and event codes, but it speaks a different command
protocol over I2C. With the existing driver the EC never reports any
event and the LED and keyboard backlight writes have no effect.

The Gen 7 protocol is taken from the ACPI EC accessors in the Gen 7
firmware (RDEC, WREC and QEVT): reads, writes and event reads use the
0x80, 0x81 and 0x84 commands. The firmware also describes the EC
interrupt as edge triggered, active low.

Patch 1 adds a Gen 7 compatible to the binding, patch 2 adds the Gen 7
variant to the driver and patch 3 describes the EC on the T14s Gen 7.

Tested on a ThinkPad T14s Gen 7 (LCD): Fn+F4 reports KEY_MICMUTE, the
mic mute and lid logo LEDs (including the hardware blinking) and the
keyboard backlight work, and Fn+Space changes are reported through the
LED class.

Prepared with help from an LLM-based assistant.

---
Abel Vesa (3):
      dt-bindings: embedded-controller: lenovo,thinkpad-t14s-ec: Add Gen 7 support
      platform: arm64: lenovo-thinkpad-t14s: Add Gen 7 EC support
      arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Describe the Embedded Controller

 .../lenovo,thinkpad-t14s-ec.yaml                   |   4 +-
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   |  24 +++
 drivers/platform/arm64/lenovo-thinkpad-t14s.c      | 176 +++++++++++++++++++--
 3 files changed, 193 insertions(+), 11 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261106-t14s-gen7-ec-297593bda0fc

Best regards,
--  

Abel

