Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328760;
	b=2vwgW8+mpCDEGYVrpA0qL/q7V1GhDqg2Z7AaDlmjPbadVtmQ5tHA1aU75KU0C6T4rGZH
	 3vDGaii0s3gKDsLJj+foDjaOpGlmp+pGOh1erCz9gCcGFPLM9iHHN53xSYgEiyuWVL06M
	 othpBbXuYd3tsejuzGuE2XQt3qA5ehNwaYUE7iMkLuI7KOQWNaDRRGOyHEcsEyAE85REH
	 6fpbhDyFDHy0wb+9mhQ5xcu4ZGqEWcdcpHs1IvNHrv1O2xDsL3ahZCAoHLeOzVALLgZha
	 xBlTZCAZwtNo89Adjr0vhoNYJ0nk0sIytXjRk2LnM7LANwCy7fObcexAMwNVxopU4Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328760;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pPUcN8Y0DEBYTymsQLP2R9H776VthPiOJucEBEeA9nY=;
	b=nYSbjJmvWlXeple+mNPFEpRRSjINiyslmTVC41cFDHkU0mwL+AupSTgeWa0fCEJSVeZz
	 tosIZwzEr+0xiJLubSfaW32HDmx6/BH41lsOq8EOQ03d21a1fB9gIUzwDgc/hDmro5mOw
	 zWZjefbyiYTbTs9y1dUAixE80FazhyPOkKP7RW2fJ3mkI92bYSOMCo2wKSsjioa6QMQEg
	 Lk71HClVgvz6QiqeCTLAuIqgp50+6k6Cvgl2IoOvKGXz2FDrHQr9+6CQw8KyssGBY9t0O
	 xNQExSdzQCGORz+9i0jQhYXufi09l5uLAYxOsoIcXcOwIxNpbBC+E1//xvEpJZ1HEGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1sfM8Pb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vw3uBaYP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35E6606A333
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 16:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C35E6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1sfM8Pb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vw3uBaYP
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0A29142028
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 16:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pPUcN8Y0DEB
	YTymsQLP2R9H776VthPiOJucEBEeA9nY=; b=D1sfM8PbAphvGUWtv1Ki9uUc+IE
	rWupVk0mGt/nibXNyq5W+kQmBHSabna/Mp77KGncQ2EQjYyTgLmaINagC6h0s+Hn
	4ADtro5KVMofPyhJ7gVSCHBx6n74jRx0fS+eFHlpSra27aiTOMbprrXzvfAGaqj0
	ec8h792MqhrBbEnl+Rwy2NiF9p3paxrI4yy/cS+YwcRnldQXiUVmIjr4MeR3ZKIf
	uX8SdvZxZ4A5y4Lu6exqWtNABZlAcrKHIR8gEfE5O1lWb+65G0bXVuyaBCJqVUM1
	xtrG5ZhQLDRaU+bDNJmErLsqjNaDlb8vn/jAhW+/C5PTPIAyAw7LoaHqI6Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg4csa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 16:39:18 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc06b9ca9eso160080137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 08:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794328758; x=1794933558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPUcN8Y0DEBYTymsQLP2R9H776VthPiOJucEBEeA9nY=;
        b=Vw3uBaYPhPz+ImU7D36wqcXOuAYQ1H+KOOGwNFHiAJtMg0anhwDhjnQNan3QVx0ZsR
         4kzWt8m80KQoPiBgfanHIWJGwZ+pqZmL06cz8SAAyuAHPXnGP1QSnYgGXNIl0eNmG17s
         Qoh0oOEtcwK27cD99YOaPVMf3NedNTx2odc96fpJDn5qae43NXrPCRK6dLEONxja8Y9I
         47WqP0Is+A1TD58MzBxl+JfNN6ox0niePUYM1QZ+ruKqZiO1By6pEs4nBFTXV1O9np2A
         tZmCPSsqjDYdBvtu8skixvv4Onz4EA4hFwJQUHeDJBxTNI9mSLOkOMQGVtGmHJp+9aQ+
         EM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328758; x=1794933558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pPUcN8Y0DEBYTymsQLP2R9H776VthPiOJucEBEeA9nY=;
        b=KDfhceZl8bMJcGWpbBXKHkDSNTRbbjbiEjsOMgwFyD/E4NCcq9rQL3BdB1S9ZHJoW4
         zMWBYah1fv6R6J5ZC76ar8azdQ8xZs4gQmKmuREbHFvqrOu9H9VtV3ockyiYdDAIkkXy
         6IFZwn7S4Tt0k6JxSuO6BDOuYmXfsvS+XxSK0ZdaVMUTRI8k06fmHVgYN2HuFQTU6GSB
         EBhm08OAqefJmO5TiB0DYAHcYT/0dFKtwyORgM1Wxs/3i9oFC1LvtV2A1BjkgC1WhMuv
         /dvqXTmFJoVephMfKNZ70dAQ0Z82uDmufC7dNpTEWthJZzWcDzqv6Jf9s78FBsXTA2bf
         5oUw==
X-Forwarded-Encrypted: i=1; AL+hErH36glbxR1X3Vg0rjtMfdrwDH5t1X9foS9Zbt4aWD3LakbQg6p34DJpjuOPiqL8eCQv6sTLDROLA3Kt7PXA@vger.kernel.org
X-Gm-Message-State: APuU4Z9gsj6zPGTt9gzigOC4pSnB5+yZRuMr3UanoXxnXwGEGWyAMTpA
	p1YLrVr1GwGohG29f0n1vNdhseLCibKmOgRV6Zq4RjXexUsVXtOOFL5HmqttQ8k3y5xPlXzz6yv
	pTqSZgmwgzNSE4visS6z8oNt7s4Dpt6Jm9SK4b9cHecIdqZDM64/LKUN4yjF1BH7WiruY
X-Gm-Gg: AYBFou1A4UVsJE2i91zmQGF/Wr5ZAZQ9eqnoq6VodLXafbL/DV+7qes+uf90XHujget
	HoK25mXl1ZWkM4bl9bHEQY9V8JLM+oFF8JMMDqTvNJBH57BeuwiRhBunpTVh7c9Uda0UkasTCwC
	q1Paj10EDkSEDoGzt90xSN8P9Edwkq/raE5ipTPuapc9SgA4uGZ61yPnhqIw/c2wRkWHZwESnat
	WDSxH/OfpWmIJeJwQTwzXHIDvswc2ZH3c4MgtduJk9BOaczNKUxzBVWQqTG5hompadmWp4Bz4Xa
	PHkvgWYsU863GO/OzyENVyvGc9m6rBH/RxD0aMJ4bQI2TMky5OIJwsE2OccEnzM1lN1IemI/p1R
	II17Cp5/At4K6K8BUEv3bDDmSQ4wWYmj3NWFBDHGeDrejrMv72XzTX7LLmUtCj6crfnzkVBTOJg
	==
X-Received: by 2002:a05:6102:c54:b0:7d2:75bf:2fd6 with SMTP id ada2fe7eead31-7d301ba381amr1087062137.18.1794328757521;
        Tue, 10 Nov 2026 08:39:17 -0800 (PST)
X-Received: by 2002:a05:6102:c54:b0:7d2:75bf:2fd6 with SMTP id ada2fe7eead31-7d301ba381amr1087049137.18.1794328756999;
        Tue, 10 Nov 2026 08:39:16 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm85130395e9.15.2026.11.10.08.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:16 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v8 2/8] media: jpeg: Add JPEG baseline and JFIF APP0 constants
Date: Tue, 10 Nov 2026 18:39:03 +0200
Message-Id: <20261110163909.78085-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX4xjkqgXSW6JY
 wjCsXsyk5qartcuE34hjRWL+itcEY5EG2hJkGiQFKfDJjnL5pJHXn7CZnvOX5BQqEv6pfA+DjMc
 yUD1BMEqSamNkgjI/70LewbU9YUMz83VfowL/6saHXgiyHW1UpdEsxmoGrBSkq6G3ok68uoyXmT
 eLXcWr3UNhXEl5IZrnSo7l784+hOwBMf7g6DUydfVjqtcWhTy+N2b7pL/z1se8AYcYDXoNapJIZ
 zesvWGaBqda5DLeNTU38q4L50OoGZgPHvU7g8nr3MvXO7PuErvBMp4SIEe1HhYJRUmz23AgMYuE
 usYAw0vzHXn97w6kcJtIGp8CCtgPKuijesWfiTsVDckPuZA2kboTmUaqghkeCujfaj41Stt4B+x
 qxPY4xHQ9g7gpaRBXUg/zgV+KSqTOMhmXx/gM32LmFYcFDEeHsD2NMAxaGP02n2udeXT+Yjx/X2
 RznCHWrqjEEc/ZUv+Qg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX6P5Uvf0viFUm
 7by1EKCKi1Z8IvWOYjZg5VxL5g9ATYkX0f5toz3U6r5dNtpmblEW+MUiX6nXgtmOStN55+Jk/dn
 eZmtDMdRDzoxYXLN62oW/ZnhJJe2Ek8=
X-Proofpoint-GUID: mFWcI8R9akrIlG3DOWLdcsSmZW_c0nAw
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af348b6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=SSmOFEACAAAA:8
 a=EUspDBNiAAAA:8 a=Rl42jcqtOcFU5aT7_7AA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: mFWcI8R9akrIlG3DOWLdcsSmZW_c0nAw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100066

Add the standard field values of a baseline (ITU-T T.81) JFIF header
to the shared JPEG marker header: sample precision, component counts,
sampling factors, quantization table identifiers, SOS table selectors,
spectral selection and successive approximation and the JFIF APP0
payload values. Describe the marker segment header and the SOF0 and
SOS headers and component specifications as packed structs, so their
sizes and field offsets can be taken with sizeof() and offsetof().

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 include/media/jpeg.h | 79 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/include/media/jpeg.h b/include/media/jpeg.h
index a01e142e99a7d..a93d0a580bbe3 100644
--- a/include/media/jpeg.h
+++ b/include/media/jpeg.h
@@ -3,6 +3,8 @@
 #ifndef _MEDIA_JPEG_H_
 #define _MEDIA_JPEG_H_
 
+#include <linux/types.h>
+
 /* JPEG markers */
 #define JPEG_MARKER_TEM		0x01
 #define JPEG_MARKER_SOF0	0xc0
@@ -17,4 +19,81 @@
 #define JPEG_MARKER_APP0	0xe0
 #define JPEG_MARKER_COM		0xfe
 
+/* JPEG baseline sample precision (bits per sample) */
+#define JPEG_SAMPLE_PRECISION_BITS	8
+
+/* Number of components: greyscale (1) and colour YCbCr (3) */
+#define JPEG_COMP_MONO			1
+#define JPEG_COMP_COLOR			3
+
+/* Chroma subsampling factors encoded in SOF0 sampling byte */
+#define JPEG_SAMPLING_H1V1		0x11
+#define JPEG_SAMPLING_H2V2		0x22
+
+/* Quantization table destination identifiers */
+#define JPEG_QTABLE_LUMA		0
+#define JPEG_QTABLE_CHROMA		1
+
+/* SOS spectral selection and approximation fields (baseline JPEG) */
+#define JPEG_SPECTRAL_START		0x00
+#define JPEG_SPECTRAL_END		0x3f
+#define JPEG_APPROX_HIGH_LOW		0x00
+
+/* SOS table selector bytes (luma: DC=0/AC=0, chroma: DC=1/AC=1) */
+#define JPEG_TABLE_SEL_LUMA		0x00
+#define JPEG_TABLE_SEL_CHROMA		0x11
+
+/*
+ * JFIF APP0 payload fields, as specified by the JFIF spec referenced from
+ * ITU-T T.81 Annex B. See: https://www.w3.org/Graphics/JPEG/itu-t81.pdf
+ */
+#define JFIF_IDENT_TERM			0x00
+#define JFIF_VERSION_MAJOR		0x01
+#define JFIF_VERSION_MINOR		0x01
+#define JFIF_UNITS_NONE			0x00
+#define JFIF_DENSITY_HI			0x00
+#define JFIF_DENSITY_LO			0x01
+#define JFIF_THUMBNAIL_SIZE		0x00
+
+/* Marker segment header: marker and length (ITU-T T.81 B.1.1.4) */
+struct jpeg_seg_hdr {
+	__be16 marker;
+	__be16 length;	/* bytes from the length field to the end of the segment */
+} __packed;
+
+/* SOF0 frame header up to the component specifications (ITU-T T.81 B.2.2) */
+struct jpeg_sof_hdr {
+	struct jpeg_seg_hdr seg;
+	u8 precision;
+	__be16 height;
+	__be16 width;
+	u8 num_components;
+} __packed;
+
+/* SOF0 frame component specification, one per component */
+struct jpeg_sof_comp {
+	u8 id;
+	u8 sampling;
+	u8 qtable;
+} __packed;
+
+/* SOS scan header up to the component specifications (ITU-T T.81 B.2.3) */
+struct jpeg_sos_hdr {
+	struct jpeg_seg_hdr seg;
+	u8 num_components;
+} __packed;
+
+/* SOS scan component specification, one per component */
+struct jpeg_sos_comp {
+	u8 id;
+	u8 tables;	/* DC and AC entropy table selectors */
+} __packed;
+
+/* SOS fields after the component specifications */
+struct jpeg_sos_tail {
+	u8 spectral_start;
+	u8 spectral_end;
+	u8 approx;
+} __packed;
+
 #endif /* _MEDIA_JPEG_H_ */
-- 
2.34.1

