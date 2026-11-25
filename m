Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631041;
	b=xKr26D1c4VvnwwKRNihoBrtGM4bny3Rzb+T7PHBppp25KN0TGebvXa+ZGibMgVUt3Jvl
	 Cs17Ii17oSeSBLmHrUMN/DvGpdzTfjnROMJ6pGjS/tshXbZyx4Urz//BoxS3hv9uRhWK8
	 NemgnDtwndeRIRKphBL0EsY8rZTscSoXeiQhHWFxnXO2KExMl86nDRuH3po85IzctTW8k
	 DoH3Vpv9uwJtQ29gakCnpBzGKyFPhFFbOOz4mTkvDzDaSyrNYzJyUjNsUu5jV6pCO7W7Y
	 4w46C7PL1l14jnxk5ZFE6cZ2NbrAg9b0xgjtTKX9sDPBQWPvgNrzv2vjZ8kRkNVj/IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631041;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9E9zgJnH76UW6IGTQ2QrZ6yug4fWhoaEl9dKIjsNC8Y=;
	b=IkL49iEZnvwUDxnku3pDc3GzFnyfEC+SZqR2AkvfmZDNYK9rOBTfGg5JXMN1hLAYFCL3
	 Eug+CiWOfPCDWLACezyyQQ7MJXa5vlhrMwUdPO9D3edhMYivFqg9Vsvq5k7kIShWhTatu
	 VkEtsfW1N7nLuxJom1ryLh1VfotU1p2s44WE4VJU4BZV4IeNDmdu0LIUsA822G9jo7qNg
	 XGLFpOatlL7+cEEJJL11h56D20dhRM4Fu4HRq7ChAyMk0QH158F+sUEYVU+y208lp1ccI
	 r1VBIw4evn7Pk/TJybYynD6daOgBZr/pC4JPrFvsSkIsWWpDBh2yhW3UWmZ52OsYXTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SqGYS5HT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BUDTglo+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C757260A2618
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 18:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C757260A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SqGYS5HT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BUDTglo+
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQ6x6715126
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 18:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9E9zgJnH76U
	W6IGTQ2QrZ6yug4fWhoaEl9dKIjsNC8Y=; b=SqGYS5HTm1csOaxXxCMfFuXhn9Z
	0cc2pROyHUvKtsedRPvVu2TJ4VQ+zO09gZm/lMX5FF+r+XVvNKj1ZZuVUltdlN+3
	7+DtYym3TcOz6ParrlWos6hdJJimjQrHYcwR7ECOFF9SngKEoBQ9UGrK9qw5fDP/
	843eEGNB71/OMDjMJECiZ/5DVRNtr4wDbhQ3XySS7NALWFRb5I3ZfCP3j8KzQx8J
	IHNHc0wfE9NEa4POobVGTFJXr3JBhuogIk+Kowj6+PmUCw4oCfMdLxECtH1RPxCk
	dQ5D6dU+JUCBBYR/Ywier+3jD5/Qo+CQZ3lZunpr8tZr8Eh8ZOgn4WB4oEA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbm5qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 18:24:00 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b3ad0823c3so18521717b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795631039; x=1796235839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9E9zgJnH76UW6IGTQ2QrZ6yug4fWhoaEl9dKIjsNC8Y=;
        b=BUDTglo+2c5M9xNp3bSXFyoKp4mep1ERhhvVCkAMxz0gp6HgL0myBR/HjhPB1ZJKgr
         oHrqxCJm+QoIFsAriioHtB6hJDjevBKNhl7o4neNU4Uojzkag4DGMI97swRJCH/uHCa7
         g8TfQPH3dQgekN9aW2ZJspjtI8DP7IZxXP5CNUNCJ30rKoheKTaQZY7LX1TfhJw2XqQr
         QdqOBt9lSRbS//0OwiqDm7Ebq0m26VJtzoam3854RlLGFI/DsdUMJDJ7pYEkRrP1lVPo
         SWWnge15bddqbXeD6/4cVglprVBzTmXWtAuEbl2nI7qZ9Z1vM/AVkTnchbCoRHvHsjgU
         xtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631039; x=1796235839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9E9zgJnH76UW6IGTQ2QrZ6yug4fWhoaEl9dKIjsNC8Y=;
        b=ANNnMcFyCKhvQ7iW96cointcWKjg4zWDNPYcA0/FHx5PpTkz+FZYdy+AjC0x2LAULV
         +EItvyNkhA0hyQoptPaInnyY2WjVdRo2kCA5m9PahiRE7tpLn6ZWl0HcJpKLNbCb6DU1
         gi8RNuv5AynE/W5hcadIrgMGBLvA75r9Av0d3zEt1hhB+8JgcrBvOzWlPgGJdNpHRUST
         gnFcYPDUZ2bT4qiUVVvfSFEqZQzVyUsnE3D+6Yx/QV/1ODymgJJPPByRuzQbkjRabuWL
         hAWiJ7n0evh4Z9ezrErUtROw7RcDzF2YSqMs6DR4P0PbwxN6cLTE3c2BInE6QafqXim5
         LOJg==
X-Forwarded-Encrypted: i=1; AL+hErH0VzC4ey48CWe/WWuvAGiXLozcXDY87w90Xc09p/fAY+h6VoesUf3DN++LDlN7bvghm7FZbtO4+jTF2u6E@vger.kernel.org
X-Gm-Message-State: APuU4Z90EQJbd1Sy51d+7vVYvFS//HuNeHT6NUEngk+TAAoOii1cmJWZ
	An9PRIJo2IblDte2a3qSF6uxxtN5vsZlRHSzXuJuhbhRWA3ULxuK2wl36J9ncuR9hJcmIhsB6mE
	fmpvymmuCHS5J0F1vfA2YKY5JXuzirk3YSwcwh/eFTwSevMtPgL03yp//v9SMLUks+wse
X-Gm-Gg: AZFdTZcTAG6pL8l9ovuK5u6gPGHf/spsOvqcvcCQk9YUQE4erxJ6OwzjTe2sfvqc5Mr
	r3JsPFRCrTYzGESNDiFKiOX1ObWNJ1nXuy2dkD7vc9VTSwB4ag+bwxKZCJVvWj9qAZbYNREEvKq
	NHSTL1EGJf1LoAqyNeuKCPwBv1L8SaF5UGb1INBPkKv9TiaZbKAJ42flvN9ph5u/Y+WQrHa8TtV
	9PC9F3M+EXoxZlMhjZRTYzGCI3YomcDQcFhNIoJSX0c/cbBhT+fNThgR5R8TS0+0XRbDrvDRc6o
	7vZt5PSjvkCZ41WNXYvN96K83OnuIqj+DooRKRmVaJPs4rShuivDI9Gdf1Gbu8L516x+OjOJkqr
	D8hvo3bRnkxrlmaEEhnhqMI2YFLj3R6bIQO17sfGC+h7FMo54TYd6dhmgJDC4xKXZskL87JgOGS
	Sy11io
X-Received: by 2002:a05:690c:888:b0:8b4:dca4:56e7 with SMTP id 00721157ae682-8b5204d6981mr75798087b3.45.1795631039300;
        Wed, 25 Nov 2026 10:23:59 -0800 (PST)
X-Received: by 2002:a05:690c:888:b0:8b4:dca4:56e7 with SMTP id 00721157ae682-8b5204d6981mr75797867b3.45.1795631038670;
        Wed, 25 Nov 2026 10:23:58 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37185609f8f.1.2026.11.25.10.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:23:57 -0800 (PST)
From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH RESEND v2 10/12] media: qcom: camss: Enable streams API on SM8250
Date: Wed, 25 Nov 2026 20:23:24 +0200
Message-Id: <20261125182326.2767771-11-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX3PNINaL4+bk5
 ZZyTIxSbCrHgTdrZMaC0hhantar8N+Dwf5qumv9pK+FV2JDxC7mhOilBTT27yP/qTm/9pWIoZ23
 0u7Bd7Iwp/5t8LGeLB1AWaRwOZMaFVI=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b0727c0 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=onitAmIIXR4QNx4LYmwA:9 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX68e1UUWIoEhx
 XgY8IXu++32It5dMxZZTipOynilHXH8trgi2NoZ3Io+QOmXwpm8m/8+F8sU0BkeJIz+VwlHGPTW
 h1dbjFXy1QfjtGfAk27VDhMSCyLsCSdpSXjVSiKaG1jKvrU8IWgwe8CJD8mV/iUf/4r0klfhW6h
 Yw7bl2ryRL38Da30bN6bwfHaYnWtBl7L2ZFAZQkKI7c1H7yLRQSQNeUOZWI2jIHC7JCEi6fvbRa
 He9BzrBkx58HIFxfgxO0C3D5cHD3END1kJg/2j86LMrl6gldn4kQ2EDSR+nmNIsyPOiJYC7iUjv
 GCL09VbEvXAzQfWPoRp6SmweUaxGyQyFZbUVtsGg13spj2kWegWecphd+N77tq8VTJkXo9efnWr
 6bYkIJcb71LAqpXp8B6yThHD6UdbOOnTLSlC7EAVrfFcGFldHEvWfJ2b7U65nVm702D/XSgx/l8
 x14zlVnReHjcyEZIXhQ==
X-Proofpoint-ORIG-GUID: qznOUsmU8WBARBNNy8RDKtfjTdKoNuMI
X-Proofpoint-GUID: qznOUsmU8WBARBNNy8RDKtfjTdKoNuMI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250073

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

