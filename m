Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795926;
	b=srVZxyiFkuQpeWThTrbfIs/xax8fc+CG3rp5qCPghdQ2guJfiMR5wkcE1Gkxt93I7R7y
	 ezXYb5/V/sM1yNiYo9FfFT+z0g6fdc2BK93HU7nzXx4K70OyqQkJxmwiHj9W12nxfWQnq
	 f01D4jV5RK4ctdF3iGQexXat26tTyo6v3llqGpcym6FuM2JOaLKonanEa8IONOn0zh7Vo
	 3gzBi8P6/dGnEmYdm1AtkExG+YwKH1CEPh16cuoUYmIJe+BA3wAC0poIYHV0hyXvFUSeF
	 dnNQYfUnIzOUsnxK1+T7Kdt7femElieOg1HOW2rdCXWEoypEzIGb2riF0KkpGKmGj5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795926;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GooQ3L9XZXoCVxo5mmAJMLT2ANqJQJ/bB4X7SGKdHqM=;
	b=0xAXjpSwVYKeQmLzRFB21ir4XlOH6TeeBRUS3wWIDV3343dkGExh2aiWlscC7trHinaT
	 RMbRlBMV7DD30ulBzjr5yrBU8b7p3p+iquRPSJyGx6FJIKHMpQBkR1LYUaHWXua/icPOo
	 SgIN9yuLY8ec4nmfv328zNj1P/i3m6MVHG8p5dlc3BLlK34QslKj5U/nEfL9i6jOFTgBm
	 vsrd5cWs5rEXFvvxCs7eznA+deuXkc+9/qAvjE1zd35OuQnLwIbOg4QkLrWk2Ls3UOvO7
	 EksXejaFP+4VFjig0ktYUDlCrLQ9bRK3cKEYmt7cWQbElK3AMv/zNypRn7SZ1RNmEFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JmQvho+R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xw7QwWQl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DDA606A32E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 16:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2DDA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JmQvho+R;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xw7QwWQl
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFp3sU3328723
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 16:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GooQ3L9XZXoCVxo5mmAJMLT2ANqJQJ/bB4X7SGKdHqM=; b=JmQvho+RZj1WUlsU
	d1zRu68u4+cm4D6e2Rx10hBpURMkblxTFDmF9lJL1C6ujOYEWbVvQjFFAD+bECIo
	OQ6TkJbhfDj7lNHN0QOHjpOC5go8S2PSK2Ij8HQBeR68CU890MngO3kKAPJmJkqb
	qdLM5lT15N4Os3j0Sltbr8ZW8iBa+LJZnNaJElYmv070+J1EyhKg+BDsZNg0CMgI
	nlOHzeOTixDZEvOaEjf+7lbc1q+c7U8tzHdRV0554iXtsqeb3PV01lgP2S4vrzZU
	hYxAf0bSZE+kTnwKxXHltCBma4FP4Z6Mr2gg4FoURq/m0NdjAWivo0gwnyMSqCQ0
	/al/DA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gha4ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 16:12:04 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b4ca583164so87950137b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795795924; x=1796400724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GooQ3L9XZXoCVxo5mmAJMLT2ANqJQJ/bB4X7SGKdHqM=;
        b=Xw7QwWQlrFlSnSCYESZnXNulPWaqHrwHId18HyKYvMz+v+7ms5+nuYw4LAJD8FYHrx
         qR9Gh9aK0q/vQVg0M80BZWj/qn7ju1NSoALeOA2uq+Ajk/GA64kWxnGLIagPo4ayaSQ3
         mlhF4otM5siuhHvdluqK5rrRBCoDKcuLzEFsLko4tUE7MU0NH3umAJU1yziY2se6pdUc
         lzm3ehbm801+IExSPn9DCWeewNcXl1fsfMRPD5GKuWgcd+kbv4HwTbbTOz2JVd0qmOPX
         n7s+aX0coTOb5xhT6rysUtsUMjpLJvmEamU5blvozK4B+Kl3jb/3dysR3yBt/8wpmJn+
         GlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795924; x=1796400724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GooQ3L9XZXoCVxo5mmAJMLT2ANqJQJ/bB4X7SGKdHqM=;
        b=E3SNXQmwpT+sg+UBb3Lbf9ABythv6C27yFqOCop4dX+Fw3XXRr1/nTVg8i0l3WFQcI
         OsSyWJB/cRcvZSnLrA0qEhAdOA96zJaYNbRV834IvHGO8QLzacIN3Fcq7BBiiuHWGmfy
         YAVCwtrKZGs8luD0F8CRyP3V0QcZnCk9Xvpl9kvgzH7E61rPvFllHgQoSc7i985IkwdU
         5EvMmHtamfoM4HtbqvMiSUJrPx7Zs+CrTKlQUso2Go5FAcX7WHB537uBT3jwhiuKjGEO
         ecBwxfnRSoXOqaZPFZ6dkraO7ylw3UonvuFBhHeESEBD+pNG5Vgc2RlOHIJYra1955ry
         g6+Q==
X-Forwarded-Encrypted: i=1; AL+hErGtH3+ZwfynxRG8fOMU0rPa5SjLjqIq3xURiyJgW67LFo8HhWOoDwFc/mSM2LGz4nDM8tsida4ReXLaodfl@vger.kernel.org
X-Gm-Message-State: APuU4Z+AAuwRvAAwJdV5itTwxCboOIMspQJt96hTvAoDqJzJsr11mKz8
	R6fjTty254HvBubKIW7E2lXcuaXpHMYD21vYnpKIDcmbdcA/5TfAQ4T2huZ7sONYNBwV4uJg0kw
	XkaihXhXjy69703GiXWDqUlMhzvxNUHSFWTUp4pyZuzNVzqY72FoJMY7sCN2fuWFX8jQU
X-Gm-Gg: AZFdTZcmNOShpaRisyIJ0k093ZZBhzcz3rc4rLFxToYLFPFkpxWhbIoRdnIl6DqTnr3
	yGAjnG3usK9ibrm7Bg7S8VE1lZco1hlW20049MqNVG2v0IVcJSyTiYLXwbhwTIOX7e87oL8Vuob
	HoZhYqOJAZrcEg6HJxAVAx8wuJAgW082Qg/FYvBMhNyVL26ghs6bSc8A/0qiahB53o1I3Z0zH/g
	31GHbZJSv2N948LPHOnaDs5lQCTX8P5eMgiEUIgQh7rdoJLgbM8VbijzRJR6H1CWMHNjUu7HxWC
	0xl2Je9x7bxvxCvK7uJyK1TJpx1kD5QXMzHgUCNtSfqWtzfRcSrDZvaYWvvh6NCPk47WhTci1r4
	7j/FOLTLS7OSHF7ErL4xpFoCaaQOKfd+ffwZ/0zb33JPlDSmy5t9RrNYPg6d0S73aNHaamKGHbJ
	C3F1XdLSwOgmLRtuvi+H9KhIAl8j2r2IMe1xAOMnBByn05kF4Wa/pQu1Q0EyDXZP1wq0Mkm2TZx
	8ac1jJOzcG0JlB8HmgDITTh0Zuw
X-Received: by 2002:a05:690e:1697:b0:67d:bc17:1110 with SMTP id 956f58d0204a3-67dec491d6fmr10546391d50.35.1795795924176;
        Fri, 27 Nov 2026 08:12:04 -0800 (PST)
X-Received: by 2002:a05:690e:1697:b0:67d:bc17:1110 with SMTP id 956f58d0204a3-67dec491d6fmr10546347d50.35.1795795923561;
        Fri, 27 Nov 2026 08:12:03 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6046:9c83:ea4b:ae9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm271728165e9.3.2026.11.27.08.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:12:02 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:11:55 +0100
Subject: [PATCH v3 5/8] media: qcom: camss: csid-gen3: Fix the RDI
 timestamp controls on Titan 690
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
Message-Id: <20261127-camss-hw-ts-v3-5-e4b6ad98ce9c@oss.qualcomm.com>
References: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
In-Reply-To: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX0pV12QXtMCHG
 f+jx/hobRDa/BMOi9wOt4oIsi3neOuxs8NygfB/2V4x0SkHCcSuoTGPUIhK/wFv7gvs5CzNviqc
 AntgQcbO4dH+WcRpxW0k5Xz7IB826nM=
X-Proofpoint-GUID: vhPY8BsGbWjvmnlzN3lTNKBc8xmSSzj8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX7gKyeV1Hrozo
 MYY89sVNGVg4o+srD0X+tQTLe0FZahV/Tg12sZBx0oeVI1xPXFjXb6HzyjzWQpE58sWEZKw4uO6
 qozn24dhX9NJrgfqwmQkMU4f9VwtV2E/wJA4Vzvnf1lRFNV0gfs8+bmSt6gfOEKvdmJ/aQeFq/X
 D0Rt/V9iRXzC+ikjvWj/KfYLkKMDU/5aSJMmPZNg5WpUWLWaaNwWgh/AyIUWo46BitDZoB8dXUk
 5ZA080fbkHia6P9By9KtW7lEWNjEtDEPFz97shL1AkPYjFU0LdaLjgKuqJKhmFIQRZDO6qQdgXK
 DiTPhqKHw6tXhz4gtc+cWXVnHdosztMIk7JWF1MnWl4io/oYR80OTqFsbk5eaWcYHPcjipg8h/E
 4XfbIn1Oiee2v4DTdxV1kHm4MbTV1ZwBtA0iGxG2kHA1T+Y7WIK+gsP5vlbdC9lOsl4vq42bGzc
 mgAIwHYXqPSA/wLptOw==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09abd4 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=bcQctLKMNhu4RQlVDfUA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: vhPY8BsGbWjvmnlzN3lTNKBc8xmSSzj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270064

The RDI timestamp enable and strobe select bits are programmed at fixed
positions in RDI_CFG0, but Titan 690 moved both controls to RDI_CFG1 and
narrowed the strobe select from bits [9:8] to bits [1:0]. On 8775P and
8300 the current values therefore land on unrelated fields of RDI_CFG0
and the timestamp latch is never armed.

Pick the register and the bit positions per SoC, and program them with a
read-modify-write of their own rather than folding them into the
RDI_CFG0 value, which is where they no longer necessarily belong.

No functional change on the SoCs that keep the controls in RDI_CFG0.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-gen3.c    | 23 +++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 6a538d825f78be5cf64691c351149b0a8fa68c3d..5dce6f722d05817f43341d22560cbe32def08cf0 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -80,8 +80,6 @@
 #define CSID_RDI_CFG0(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
 					(0x300 + 0x100 * (rdi)) :\
 					(0x500 + 0x100 * (rdi)))
-#define		RDI_CFG0_TIMESTAMP_EN		BIT(6)
-#define		RDI_CFG0_TIMESTAMP_STB_SEL	BIT(8)
 #define		RDI_CFG0_DECODE_FORMAT		12
 #define		RDI_CFG0_DT			16
 #define		RDI_CFG0_VC			22
@@ -103,6 +101,17 @@
 #define		RDI_CFG1_PIX_STORE		BIT(10)
 #define		RDI_CFG1_PACKING_FORMAT_MIPI	BIT(15)
 
+/*
+ * Titan 690 moved the timestamp controls from RDI_CFG0 to RDI_CFG1, with the
+ * strobe selecting which event latches TIMESTAMP_CURRx at bits [1:0] instead
+ * of [9:8].
+ */
+#define CSID_RDI_TIMESTAMP_CFG(rdi)	(IS_CSID_690(csid) ?\
+						CSID_RDI_CFG1(rdi) :\
+						CSID_RDI_CFG0(rdi))
+#define		RDI_CFG_TIMESTAMP_EN		(IS_CSID_690(csid) ? BIT(4) : BIT(6))
+#define		RDI_CFG_TIMESTAMP_STB_SEL	(IS_CSID_690(csid) ? BIT(0) : BIT(8))
+
 #define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
 							(0x348 + 0x100 * (rdi)) :\
 							(0x548 + 0x100 * (rdi)))
@@ -188,10 +197,8 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	 */
 	u8 dt_id = port & 0x03;
 
-	val = RDI_CFG0_TIMESTAMP_EN;
-	val |= RDI_CFG0_TIMESTAMP_STB_SEL;
 	/* note: for non-RDI path, this should be format->decode_format */
-	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
+	val = DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
 	val |= vc << RDI_CFG0_VC;
 	val |= format->data_type << RDI_CFG0_DT;
 	val |= dt_id << RDI_CFG0_DT_ID;
@@ -207,6 +214,12 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 
 	writel(val, csid->base + CSID_RDI_CFG1(port));
 
+	/* Arm the SOF timestamp latch, whichever register holds its controls */
+	val = readl(csid->base + CSID_RDI_TIMESTAMP_CFG(port));
+	val |= RDI_CFG_TIMESTAMP_EN;
+	val |= RDI_CFG_TIMESTAMP_STB_SEL;
+	writel(val, csid->base + CSID_RDI_TIMESTAMP_CFG(port));
+
 	val = 0;
 	writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(port));
 

-- 
2.34.1

