Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594104;
	b=xYabxprHca1H5tdFT9DDZWcEQgrEXBbKtX9olp3FFl+hTinuLnmR8Tkt0NexvrVvkWLn
	 UF/Riw2KdRGxwCy/oJlYd4QCEpMCfFUE3qVwOeporolAIKOeyMnBZR5ERyweolyl4lzt7
	 dqgHQs7H+CaGHRan21JipJgikqzDtzz47S8nEvTxOZg3+VuWxPQ0JCZS4WmbIDWoskI05
	 sdVC51KvJYv8B/M/q3L6UwF0vRHIBNqugpI1cmHjFhbb+j1kyiZQ3chniReDTbemjQBgE
	 GIje6BL00x67TaWqRqwUyq2obF3/uFdR0Y99JgWa1ipodNVdRCVZLOOd3pYw5PICsnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594104;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OtpOi8BdB3iXAyuGSzLZNPeux0EufLwrclJTArwQJo4=;
	b=j09O6zcdvQVDSlpH5xbjfwk/uAlheMmOdW6FP2kMzjqDkrbvu/358SaPvgMtk4LMou2B
	 Z0bPoDOj9D4OUl2Gt8mJ6qVLoTQDwClk1HSrz/qiuy/aItXqTu50MsgwKOkVNCz2JFEJX
	 FztVDgAgV8Vgb19MG2o+QQcKxfwzOjk/VZ94s+I+rLV+kuae7k2MqEKikwECWPeubXre0
	 qE7lwR/ZeDOENkNEnWFzY258De0Og9HXMRYbnVqFm4SDRe+gLGSo561MTl2pv8YHz1+5j
	 FaXNKsmrb5o8xdtE/eo3UICfv3bzoHCbDRhiCBsvRJjqIK+YJQLOuwOWObACuf7LqCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=fail reason="signature verification failed" header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZbtfpBRN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D2C606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98D2C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZbtfpBRN
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68gBi057265
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OtpOi8BdB3i
	XAyuGSzLZNPeux0EufLwrclJTArwQJo4=; b=ZbtfpBRNx0JTmO/nhCCGVgKbw/n
	1Jkh016yRjwVAxariRUHy85DybEGheo3Ysf3V26fBtL3qHYxowVTeVF06aKcwZv8
	yC/t/zD1CAqbzgZ655nQ4A27fUovem4B289ANuclkUgCAemzjZmFBbbQ3j9q0lKH
	VDuPWUFk4O8vuwDuT9P0fQgRTlGHb1lAMFP5L3Bu7YAaUtT96hvnqa1KDGhrbRDT
	Hye5NU2X2orV7IJzNsj2saPCIb0gHyT9/raNLSyjNGjwGIq/PqEPpzt9jCr4P6Gs
	+CmhidJuNJDJyBoo9g2KpAvVCdwSzR8nbMD9INcR6eOPkoMcdQ5Je++9YPA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnfaeg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:08:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5363b06bcb2so106027381cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:08:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594102; x=1796198902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtpOi8BdB3iXAyuGSzLZNPeux0EufLwrclJTArwQJo4=;
        b=qApRA/sbcmKq67eletSFIsxPP7eXSq5Q8LhRFGEdCRif8H9gS6Xj3Xk4GkPO8/D2fZ
         gAKzF8eNSm2UqdVy+8XXDKRca4i3UIaDmQw//9H8S+T+++kVJcutslNB+vknfWtLYTri
         tMT0nsDnNlHakCEOv0e60vUBzAg9j/+kho63uKhAlUy27lyVNhT9cXUeDo0CWUls2yXs
         hw/ShRMFWsItX03G8VkqEG0A/n8GfdcCjH+d3C3a3vKE84JiJnw4QGCpv+CEJedsf9Mu
         HCuRfPihhZAXxpUhA/jrnDtIiRrWdp4IxiV3aAPEIR7DpdxBvE6MZZ8EEY7di1oUPE6G
         x1iw==
X-Forwarded-Encrypted: i=1; AL+hErElXaPRGYSlQF8NVeQjEnFMX8HeKZDFPTcEIPjKyX5yFvmy43ICHvDpL+/RulXPeBckt+thwXN0yqP4xXu8@vger.kernel.org
X-Gm-Message-State: APuU4Z9QkFr4ZezYEfydZm1nAD8/KZWFjWREu1Mlyi/fGKsQhS5w/e1J
	mZqFjw0M2eHNWzmwwbjRSdMkvd7B7KoeDOeMGFMsQrX4xlPMo+Jy329gi+M4ZO8/z+fOftDKC5O
	7NRGMnHyIbzg/QYIH1etDGHBhW03wkXkxOMUhtXSKcZpVBmSr/yoHBmNdedSKrAyBZkTf8hWIYZ
	somWI=
X-Gm-Gg: AZFdTZfUCancI9EMFWW9iSmGUpRzKTJJp5Z2/o1RcH+3zucLzunqCa38myLBAyqnIwt
	pgB3fPgDsvHSD0Ni8oZEbWMKSeYJbUDm+jy00PFH0/HskeCfQaCgAovAQY9LYVYy/37ZFFNbJ9b
	jnhJnzWdVyv+HSX0A9oOiO9IGWt0s1fFpJFk0JbJ4KZMI0VB5PXdqTrp5lIDFzoKGPAtRgyFpVO
	aQYX+berPY/40/ZFMAH6Zn5qjBjktbEZE1ERIS37lnblwAWkmw46jbLHKK3Skok6L4W2XW20Cic
	/cuDJ2cZ8LCbNY3vhwHTd45LgweosvYSHBKTI1OIM2mq+z9NgaoKcQOzTpEDW8KBihRtpgn2rsQ
	KK326uYcX2x55EWyMuLT6MBXU9LI7UMtq
X-Received: by 2002:a05:622a:5512:b0:535:1d90:ebcd with SMTP id d75a77b69052e-55d76a6f9ecmr333438711cf.27.1795594101962;
        Wed, 25 Nov 2026 00:08:21 -0800 (PST)
X-Received: by 2002:a05:620a:f10:b0:949:5ee9:ab27 with SMTP id af79cd13be357-949bab4dee9mr2883034085a.83.1795593623848;
        Wed, 25 Nov 2026 00:00:23 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm585912015e9.11.2026.11.25.00.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:23 -0800 (PST)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH v2 10/12] media: qcom: camss: Enable streams API on SM8250
Date: Wed, 25 Nov 2026 09:59:59 +0200
Message-Id: <20261125080001.2540101-11-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMiBTYWx0ZWRfX5mLxGRlVzMZ7
 XQe15v/Newv+Z7wBtnHOk00/hcAyPMm7ZFACpidVIxDT6zZTPQ8Iod+JyzUEFV+LW8LwU1KsYB9
 n4n6OxnONVKIFZwSdwFJUOoyBFVczwI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMiBTYWx0ZWRfXynkUmysvq4Ex
 wA536SgDzZvXDx1Tbr7Ted77HzrfNQpL7mCk25X0zRdaSLA07ZBZ1NkLkpfYlDJ18/XQBTzq1cS
 D1fz0lEM+rv3FQCU581n2LS4TvMK+TtZuOWszG5nY+33WL7lRLeZ0tHh+W+gXEEdgBvTY2HeD7R
 nXv2yy4g3rk9HZAQIzxaQwcsono2MqFVJLBABe+3OyIpByObpIOVjczQ37B7fSA/CQnaEydSL4A
 m/2yQBIBI8Hzh/pxO7B0aHI/JQ975mi2Bg+E0EEQOh/CcGIbH1390NXYb8rJ4L/AjrVtAJyaAxG
 0GICwbIbnesnUSIATysWaQNI9FGHlz93v/KMd5RNzcXWfcgOOk9y5QRjDRtkNM44el8KxAWuc/J
 1/PDSKMUgXBsmvZSPV1ArxQb18h1HUHzoM/i5jXFQpCNLAk9p9nLZdi8uX6rVGrAwfRAAnNqCtZ
 uFHkoylWYkjIqwBp4PA==
X-Authority-Analysis: v=2.4 cv=f/Xdl+yM c=1 sm=1 tr=0 ts=6b069776 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=onitAmIIXR4QNx4LYmwA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: _dDy6tq3WKDTRE9UGRvFBiR0zzS7LYwi
X-Proofpoint-ORIG-GUID: _dDy6tq3WKDTRE9UGRvFBiR0zzS7LYwi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250032

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Set streams_enable on sm8250_resources so CSIPHY, CSID, and VFE
register their streams-API subdev ops and probe with
V4L2_SUBDEV_FL_STREAMS instead of the legacy .s_stream() path.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index ac12960264ad..77fa80dd79c4 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5790,6 +5790,7 @@ static const struct camss_resources sm8250_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8250),
 	.csid_num = ARRAY_SIZE(csid_res_8250),
 	.vfe_num = ARRAY_SIZE(vfe_res_8250),
+	.streams_enable = true,
 };
 
 static const struct camss_resources sc8280xp_resources = {
-- 
2.34.1

