Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663242;
	b=QLADZveZicSxPcEHihvF8CeUJl/xOYjniT5fzVNBxFPWh/UAVxWQYXfgY9ohbeqiExMl
	 rxW0JWvInYTTMgZhbl/YiVtmyfvW1L2QW5J1rEwS7iRPSYsvMMFu6Cm0paa4QhxDE9tjK
	 RsP2d/Mo6RtnWZlZaLoYlFjxu6hR2w5vHqmfPRMYsiCqJzV6TjYgjgHlV4t/IpjkO9lrg
	 2x7nxUR8Q5LmRDqwkhl5tvrfuP0T89PD6UKCj5+nhSW6Mg+e2cVRURi59Lym5hb7fTluu
	 NLdaFL4nCxO+cWftlTXXm4y+nUpaYRmqjUjKVQmIQeCz4P0PX3PY3PKuN9IMtAf+YvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663242;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rnPHK632tH4FVpZnbHmd+EQerd8GGJ2UddNabTn9plw=;
	b=YZub1ABdVfsads/mpAV48akMPilPv8MV7u1JAuA8wdEFhLTywOpWwu2IuOkTBpE8iXHQ
	 4ksAr5jO6siojJ7mx1k9XahvzdssaRTIb9Ps0XYTktajVgxNYesaUkMmiuby1BziCNGgJ
	 ZnCEpQGXapsM7hxAMI9WywD3TQYBjXfC/elutLDF72XF0pVfUbetFGHnHcAN2mznQIi2c
	 snrLYopuFk8Let/QeHFaBxsNC8S44wcuZwJ0w0YmYpYP639fleymA0JE56582/CuOHCS8
	 f8X2kc1P+kZKIyXUL4j8ooNyGCpbB9QFRoXMlL0Ey4l6X9c11fxZdvGYzRiwYKhV+iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WYIaXM+1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gjYH6S0z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902AD606A335
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 13:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 902AD606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WYIaXM+1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gjYH6S0z
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9xAHJ1090666
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 13:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rnPHK632tH4FVpZnbHmd+E
	Qerd8GGJ2UddNabTn9plw=; b=WYIaXM+1vSLaqL37AVJKscfW4URUcZcO7bpK35
	Mj9SsIFU+x7UIVgzBIeZjQrDynRK5oYlj0Isk3JswlmzimFoCuYUIy/VOaLaT0g3
	RAos6By/w82JKmju1Pk1RzD/ZZZJxh+xHDxVPW9dDjy0jf1uBHlpkQsv2uQCZdRA
	NgcnbcIu4l7gFOw/EbcKUSZbcXBUPkoLZqX1u7PtUsZg/Z/4rP2lOAjY1IG6y0CD
	iuuDYRmEaeQnY86n3mkWNE62hA6lh9Vka2hcdWdw5vzQxwt/jzQctqGp6oiumsnP
	fqNnle8/qKvfwDBP/sAAHeynAj/CcejKsLLRTMwMcPwftB9Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8rtnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 13:34:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91f0938c499so11157886d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 05:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794663240; x=1795268040; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rnPHK632tH4FVpZnbHmd+EQerd8GGJ2UddNabTn9plw=;
        b=gjYH6S0zD5WFIumK5Ne8ZRYjLM2iO+YHrD5zhI1I2SXgc1xUFlsVnfmdcctYq6VuNK
         oiDWt5R+vxjdnnNCg5gU/dMIJ+K9jPezM0iNpPPF1Ww3LaCXol+Oxr4bKVLDIf0w33S+
         MmtJxSbW6c8M64WP5opHqCUos3xq8dV57dU2GORuzeVKX1VSstjOHOvtroCjPaRuItVZ
         HrEAN5VOwsAvO8qvjNnjVbTwj55FCVuZ5SKTIUiXq9yNgIbnEP3QaeY7AA8qC1SFKdyG
         RvtBjHYG+BEc7OE1FHg1+KjmFq+bTW671y9yNXBruhn9ojo7TCS3up/QG5A0dvuAnZ9y
         jEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663240; x=1795268040;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rnPHK632tH4FVpZnbHmd+EQerd8GGJ2UddNabTn9plw=;
        b=I8ABEOgQbHfrCSDs7EX00CFzJrAJIIPOsRS79ZTYM1PKHoT9u9KvrAwCIg5rWHI4oo
         x9qmfe5LrsTzAZ5dkvukEeO7PnAQWtQ7BiNT+s4Tmt+HB6Dmu9jNtknT9ZeCgfVO2Y//
         Kg+eP0SKVa2AerO8s5h2PRSRu8V66vSyPOnAghkXV5SfjpHdGSrxpa5rWebGZ91Dnl1X
         ZlEsHoBqwuDyG38WBvFixxeDTQ6eSwDkZJFXVQyb4WTKocyRw0RCiRzOOzqYhpjPkVU/
         2og+sMbxOojRl3QIEA1j5tpwg6p8XM5X1muSbihn8UMJ7d56NTcGIgVPaDOxZ8ZBa+MZ
         hkPA==
X-Forwarded-Encrypted: i=1; AL+hErFFyEr4cH07wS2AVzI06N/WWANDCeQfKJcuhtXe6/YgGpHqtJZh8Bes7/jAD6br7qTgU05jqYUKyobe4Svz@vger.kernel.org
X-Gm-Message-State: APuU4Z+W4o1uY7izL7KvuyYYwmjf+MfaGbMhBRzYZQt482sfEGGPAcu3
	WYQi/IeB4Vp7pHA1OSPW/RI11QIR20cwRdAI8Sp9XTQd7plxYyPgLG7yr8T+FiSBsLf8qdUSK+t
	9N+LMfutbwvYyl234YHmccyVq+y/moz0emso8pxpUcG/uGEb/OvLIQUZ8OvXe5ooDKvy0
X-Gm-Gg: AYBFou3hsIUkX/tMiv7MtYaECNdJ4IQ5s5q526vdXsGfXMSrCSPtbTrkWP1B5XKanIw
	QL2Cd0gybmFz0uUAh97GwTIrro0F4xkVMmQ4X5zTfLGY0HYwAFZslPduZtkePi+mRs15JiEPW6X
	KhODTZbrQ4xs3PNmWf/xnGBV+qo4neriskDUA/gJFOHlAcOtOFxUZxtxBJudvMTFpKVPahJqWrG
	5VHGQ2W1c0kGSIZ2JI0noZzQxAAM/gdzuNC7XENfmOu6ciWYWSXMoUf2QzppllLKcdqUIIPkL0u
	76/r2VOrapjz+iX5jZFeTKqf/C3DTHI5gJikfSeyhkVc6moAWzZgIe0kjiAtwwvYCARHDYKcdvg
	jOl4UOgFVq1veW2ZseKKv9tDIPlAgyE1zxYYctEPjZVJEWkWMpDNLc2oQh7rtULWPpQ2qg4H1sM
	gz5UG6m7YEzs4t
X-Received: by 2002:a05:620a:2855:b0:945:c1e7:d3b8 with SMTP id af79cd13be357-9494bb55a9fmr873276485a.33.1794663239628;
        Sat, 14 Nov 2026 05:33:59 -0800 (PST)
X-Received: by 2002:a05:620a:2855:b0:945:c1e7:d3b8 with SMTP id af79cd13be357-9494bb55a9fmr873272585a.33.1794663239108;
        Sat, 14 Nov 2026 05:33:59 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c236124esm2273578a12.6.2026.11.14.05.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:33:57 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 14:33:33 +0100
Subject: [PATCH] soc: qcom: geni-se: skip the program RAM on minicore
 engines
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
Message-Id: <20261114-geni-minicore-v1-1-a825dd549664@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avIrBtQK5GuEi3CRptFGgoRiHdPW
 r7F/xUKZaYCi6iQ6eHCKXaoQYA79xgI+egGLbVRSk0YKDJeHNmlTCjl7IwfrbFSQ2/uTJ7f/7d
 urX2PetAXXwAAAA==
X-Change-ID: 20261114-geni-minicore-005c6f386802
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>, stable@vger.kernel.org,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6af86348 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=fNIzXmLAtl3icGuUDBgA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfX4lsSzSw9SiOS
 QGsmkMpMajZvrM68/mxLVNYu73SYgrhKMgvIbD6rbzVdjjDPOgEXPDicCTqklL/2C5ljJVEwof3
 dBPnlo6w6P7ufRFcDo9vI0/dBzX2Ndo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfXzNzndmaZmTgR
 lPXf/KEltcCS98a8pF9kKnHxnyAKdDtDLA70GuPRN1xqKd7zaT+VXcxV2KDEPrICW50Z/ExvO7q
 QGKK81BrhPLRk383qIVvfUSdOXi7d5In4RHUMdgRhKVvYqv4kkQ3psGCL/KwdfXejiUdBOqStAR
 eAtvK3YZMyf7YUZGO88E8qlYMzvLvhdM53QUoawf1Clw4G5HOBMFpzJUt9KrifQU/hJ1M6ZlWJA
 QCkokeawncr4LpmI0Q1o3EsvvqG6KWP4iPoN+MqBLlg8hDct7q7t5gHAp3yS0LOTqH9qaXT1Sr/
 PY84uqNgeZBPP+Al94rnpRcHKhOwWGIe7uaTENyuxtWsiBmOww76yLlBJjPGqcOZEkI/ZCFWyYh
 gAMdHmdGJD9zgKNn8LQZLs2P8t9bQYslQTkzDcfhaDMNGmM+r6QMC5seLC0aP6O4pp7N/QlHUii
 cNXgWvxxjdUoJAWepkQ==
X-Proofpoint-ORIG-GUID: eILxw2wKq0VWA0KjNUSp-mFVUyNRt3wh
X-Proofpoint-GUID: eILxw2wKq0VWA0KjNUSp-mFVUyNRt3wh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140053

Four of the six serial engines of the QCM2290 QUPv3 (SE2 to SE5) are
minicores: they implement SPI, UART and I2C in hardware state machines
and have no program RAM. Their SE_HW_PARAM_2 reads 0xf000, i.e.
GEN_USE_MINICORES and the GEN_HW_FSM_* bits set and a PROG_RAM_DEPTH of
0 (SE0 and SE1 report 0x3fc and 0x1c8 and do have one). The loader
refuses every protocol firmware on them:

  qcom_geni_serial 4a8c000.serial: Firmware size (444) exceeds RAM size (0)
  geni_spi 4a94000.spi: Firmware size (442) exceeds RAM size (0)

On such an engine only the register configuration part of the image
applies, and GENI_FW_REVISION and GENI_S_FW_REVISION still have to
carry the protocol; U-Boot's "misc: qcom_geni: Add minicore support"
handles such engines the same way. Detect the minicore bits, skip the
depth check and the program RAM copy for them and keep the rest of the
sequence.

On the Arduino UNO Q this brings up the Bluetooth UART and the SPI
engine, which were the only engines the boot firmware had not set up.

Fixes: 522bfb4f33c0 ("soc: qcom: geni-se: Use HW PROG_RAM_DEPTH to validate firmware size")
Cc: stable@vger.kernel.org
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
Tested on the Arduino UNO Q (QRB2210) with next-20261112, whose loader
is the same as in drivers-for-7.5, booted through TF-A so that Linux
loads the QUP firmware itself:
- without the patch the UART (4a8c000, Bluetooth) and SPI (4a94000)
  engines refuse their images with the messages above and no spidev
  appears;
- with it, both load and work (Bluetooth up, spidev to the MCU), I2C
  is unchanged, and the board test suite passes.

U-Boot's minicore support [1] programs these engines the same way.
Neil's "ignore invalid PROG_RAM_DEPTH when checking for firmware size"
[2] would get them past the size check but still copy the image into a
program RAM they do not have. Engines whose depth comes from the wrapper
data (the I2C hub, 803f9950a6c6) are never treated as minicore here.
Viken's pending "Leave resource management to protocol drivers" [3]
touches the same function and still applies on top.

[1] https://patch.msgid.link/20260721-minicore-v3-1-172e5f28138b@oss.qualcomm.com
[2] https://lore.kernel.org/r/20260917-topic-sm8x50-i2c-hub-fw-ram-v1-1-f49286d8c8db@linaro.org
[3] https://lore.kernel.org/r/20261025-gen-se-remove-resources-handling-v1-1-e81da6707b5f@oss.qualcomm.com
---
 drivers/soc/qcom/qcom-geni-se.c  | 57 +++++++++++++++++++++++++++++++++++++---
 include/linux/soc/qcom/geni-se.h |  6 +++++
 2 files changed, 59 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index ce4de4917a83..1cc4788942e7 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1243,6 +1243,54 @@ int geni_se_resources_init(struct geni_se *se)
 }
 EXPORT_SYMBOL_GPL(geni_se_resources_init);
 
+/**
+ * geni_se_is_minicore() - Check whether a protocol runs on a hardware FSM.
+ * @se: Pointer to the concerned serial engine.
+ * @protocol: Protocol to check.
+ *
+ * Minicore serial engines implement the protocol in a hardware state
+ * machine and have no program RAM: SE_HW_PARAM_2 reports a depth of 0 and
+ * sets GEN_USE_MINICORES plus the GEN_HW_FSM bit of each protocol the FSM
+ * can run. Only the revision registers need to be programmed to select the
+ * protocol on them. Engines whose RAM depth comes from the wrapper data have
+ * no SE_HW_PARAM_2 and are never minicore.
+ *
+ * Return: true when the engine runs @protocol on a hardware FSM.
+ */
+static bool geni_se_is_minicore(struct geni_se *se, enum geni_se_protocol_type protocol)
+{
+	u32 val, fsm;
+
+	if (se->wrapper->prog_ram_depth)
+		return false;
+
+	val = readl_relaxed(se->base + SE_HW_PARAM_2);
+	if (!(val & GEN_USE_MINICORES))
+		return false;
+
+	switch (protocol) {
+	case GENI_SE_SPI:
+		fsm = GEN_HW_FSM_SPI;
+		break;
+	case GENI_SE_UART:
+		fsm = GEN_HW_FSM_UART;
+		break;
+	case GENI_SE_I2C:
+		fsm = GEN_HW_FSM_I2C;
+		break;
+	case GENI_SE_I3C:
+		fsm = GEN_HW_FSM_I3C;
+		break;
+	case GENI_SE_SPI_SLAVE:
+		fsm = GEN_HW_FSM_SPI_S;
+		break;
+	default:
+		return false;
+	}
+
+	return val & fsm;
+}
+
 /**
  * geni_find_protocol_fw() - Locate and validate SE firmware for a protocol.
  * @se: Pointer to the serial engine structure.
@@ -1332,7 +1380,7 @@ static const struct se_fw_hdr *geni_find_protocol_fw(struct geni_se *se, const s
 		else
 			prog_ram_depth = FIELD_GET(PROG_RAM_DEPTH_MSK,
 					readl_relaxed(se->base + SE_HW_PARAM_2));
-		if (fw_size >= prog_ram_depth) {
+		if (!geni_se_is_minicore(se, protocol) && fw_size >= prog_ram_depth) {
 			dev_err(dev, "Firmware size (%u) exceeds RAM size (%u)\n",
 				fw_size, prog_ram_depth);
 			continue;
@@ -1534,9 +1582,10 @@ static int geni_load_se_fw(struct geni_se *se, const struct firmware *fw,
 
 	geni_write_fw_revision(se, le16_to_cpu(hdr->serial_protocol), le16_to_cpu(hdr->fw_version));
 
-	/* Program RAM address space. */
-	memcpy_toio(se->base + SE_GENI_CFG_RAMN, fw_data,
-		    fw_size_in_items * sizeof(u32));
+	/* Program RAM address space, unless a hardware FSM runs the protocol. */
+	if (!geni_se_is_minicore(se, protocol))
+		memcpy_toio(se->base + SE_GENI_CFG_RAMN, fw_data,
+			    fw_size_in_items * sizeof(u32));
 
 	/* Put default values on GENI's output pads. */
 	writel_relaxed(0x1, se->base + GENI_FORCE_DEFAULT_REG);
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index f77c3a47c3d0..e18e1edd9408 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -332,6 +332,12 @@ struct geni_se {
 #define RX_FIFO_DEPTH_SHFT		16
 
 /* SE_HW_PARAM_2 fields */
+#define GEN_HW_FSM_SPI_S		BIT(17)
+#define GEN_HW_FSM_I3C			BIT(16)
+#define GEN_HW_FSM_I2C			BIT(15)
+#define GEN_HW_FSM_UART			BIT(14)
+#define GEN_HW_FSM_SPI			BIT(13)
+#define GEN_USE_MINICORES		BIT(12)
 #define PROG_RAM_DEPTH_MSK		GENMASK(10, 0)
 
 #define HW_VER_MAJOR_MASK		GENMASK(31, 28)

---
base-commit: 011c427b6d209eaa944ac758a0924fc768244228
change-id: 20261114-geni-minicore-005c6f386802

Best regards,
-- 
Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

