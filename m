Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601976;
	b=etlnBQlm5mnWXPtpdVCm2kinwoP7sPqFI6JqE6xTboNwpMnTRuOPlcl/+ncdEz0j4hxq
	 GFj3YoknDIrvfw0luj58OS6xJC1+alP2Zl4UT5ednRvyrPg5Nwr7illqRqi8cvAs6CMFX
	 G0akJVcnMxLPWaB4NhaiW7pHgGPfnyIk7F5S1iqfuA1n7sEi4Cp0d+fB9wH0HpcrYBj09
	 /l7/odg5M0QCi/A6t/NZm6rZyt2si1erBrAOwIIqfa/r8Ws3KtoBqTN5va85w/DgC3Hwk
	 MKuJ5wHJmkZieKMXUdgMkDtNFHkddW8IHV7VYIoHloXt6gt8flWbX9IyAEnTQAxCD6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601976;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uE4eOMA+bFp767ewLDImegkyq/ZtrdlqU4ibf7PdpCc=;
	b=0rUxjHNvCSlfkLeJ/gEpOrktYclv+f+kdtswZrBglwIE9UGEcRxIKVpxB7slIHh0DnjS
	 oImnl/7OheFf+g6nKmYs4jmzBp93655Od9kjp/EQq6bqlU+I+wn48uBZNMbCAZ7F8vfHP
	 jEhJzOqEkvJr0c7PxtwkfPgPAFJ7b0RB/XUskAsos0ZXDsZf2Zd+bM67sGq0naELDqwnp
	 TucAsE6ZoMxSuwdGpws+0Os0PD+7s+qBwAqiiKPYxv+nCAn1y0dZ06hGUzcmQpqgqDASh
	 Zj/11r2f3wtS3fYgbFFOYu/WzbpLjEc55yvIHYJBqL/o3Qo8/KgENxzzPcsftEYLI7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A5+OutYn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KxR7PlPT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634FC60A261B
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 634FC60A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A5+OutYn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KxR7PlPT
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mRdE4131677
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uE4eOMA+bFp767ewLDImegkyq/ZtrdlqU4ibf7PdpCc=; b=A5+OutYn3mREg19i
	188MQxyT9blix3yDPiWVFT4yPYGPOj1PGg9Sdmn4jadzWD/4cS03dgvqEGdHZTGN
	svWn5VSzRvxuCeNHZfeUXB/EhrnGeT4up/1Q88vC5D0oRw6Nu2Ik+Ix1oGVX6Lmc
	Q1WtLxFclLQdeQygPE1y2wYjwR5A7FefLiIdOr0f8fwBUZ0gnppeBLNmp+k3J/0j
	OISnIxxt6tPCS5hmZStbC1NBfw5YJhzMt3ijJJ5RNuHfRigcctVhsmOgLK8IL1FQ
	mT5exVkwl2pQPGQzWzDEdxjj6nPImcXIE/AZxtZMbloVUBJBTsgnnHPV4GuxrADB
	JiqP7w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhrayv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:19:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495dd0f07eso987062085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601974; x=1796206774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uE4eOMA+bFp767ewLDImegkyq/ZtrdlqU4ibf7PdpCc=;
        b=KxR7PlPTwvnJkbHBxes822mVeQq8ys0O72goTDet95CWHm/Zowc5HRsAB9p6CGakKK
         uxzZaBBVzDtzfrFt+B2bogTRxsMK/rEuhOhYVRid1SU2OqTQnCIerxinxXoAwb89T9aF
         iqVfPye8WDoGXpWKeYo4uqJYmuvJNCx7kq0DVFyAPjev5vKXBAcM4R7Iw6+WbeMKBaO/
         Ljwt94nTZ5tinXeRF4KRgGFllXc5CQxrlTp+EpAR9IEchPgktnWhg/0Fw3HeMSMr5rax
         ljmhI2TbhMAwzg1wkSL2FmwBYW4XndzM1OcNfDoi8g+5BrmqBUdRpDdv7NgQI++syXhs
         I9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601974; x=1796206774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uE4eOMA+bFp767ewLDImegkyq/ZtrdlqU4ibf7PdpCc=;
        b=mEd/UmIQUQAneew3xVkLs3XR6vdEs3Nyk1LfIarEL5lGdNztgulI2qlfWuErSQB9Cj
         2Xm8GyEQC5lE7VP2wl97O2smtqMJXXDrkgp3unP3hUsjzfQbRYZtl8O1BBkTxDsktNmF
         GwBTgUs77c7Go9DKUIO2mJUcE5av6OBLXm/QzMO8zyBPPPYapHxDY/SZHpDA0w66Estn
         n5Lkjm6Dma8HKAetysiG/DAUUkDSeQ8OMcDO11lBT9Sfp0unI25EzyI5a5h3WhdUlODz
         DVx/eImV9VJRHAdZ6zww/osyNsejguLPmFO/GfuGPjagNg4BQLLr2UUg9fV39ctgo9Cz
         tX4g==
X-Forwarded-Encrypted: i=1; AL+hErEohPLZvISC+FATxxOSwtah9I1+iZgVg1JdVIPeDkwmRYZyMKIK9+brbn2vIPr7EoV8m6cDrrl4JM1+QD+3@vger.kernel.org
X-Gm-Message-State: APuU4Z9TJiS+SMxNOjssnfXH2ttbHJMpfBKHj9mQ20kGEdzMZm6YIlyu
	HLsVhvpkhI0LLvwf2HiXm2Eg2oiteMab8WABbDCaWWZVNwo+hgg+7BBsZ+2hcs1vb2VL16NHrod
	sMM4I7q069fAABJMZCRtbLQ90PTqAtiPLBYl9RbS7eu51ZyjEyTsqXHGYUAZLJHMASpv7
X-Gm-Gg: AZFdTZdSYywiXVf6BObHwF/7thQ4pziPFBKHZH3DRHc0tjdTE9UG7BBW+VWrObNesLg
	jhTSreVhe4qhP7K3Y67CD0QI7n+7W++n/3qBip6bv+dMgKHDd6llUmfg6D0wv2DPjOqIM5MVk9x
	J1bkue/Js/8VkLJjboK+OeA7wZS8f6em5FRxNvzwfMmZJkPxrAEfUOwFxCaK2m8xcfXVPUhoL3K
	6w7JKguifM8HLOTgtbbAQdIx0a7IB6NS6tbT+jo6yuS4AXTRxiG6pJe8IphgvkpsgkrPj/kaVDa
	CPOLPuGhpI3sFBraf2reKloyecMMWBmKl8b/kkMxod2g/8mO6MR8sLcb7Njp75Dcy0RJCYoB9Db
	3gQwszN+oedcnJgMHS/sPyt4JoVwdyk40KVIp+QMG3cctThZFm0Wu+CJ2RuQZE7TVRDI5ERSM6r
	4dTiZ3WPgpQ5GQ35gP6S4OJTB4p+8iRWC7fOcDDSa3HXTF2BgWTp5NNAVfJOgv4uEJOun7wf0tn
	wW/+Bpaiw1p299Mspi2VTgl2DNP
X-Received: by 2002:a05:620a:198c:b0:93c:5bfb:9a80 with SMTP id af79cd13be357-949ba8483e2mr3063300885a.3.1795601973738;
        Wed, 25 Nov 2026 02:19:33 -0800 (PST)
X-Received: by 2002:a05:620a:198c:b0:93c:5bfb:9a80 with SMTP id af79cd13be357-949ba8483e2mr3063297785a.3.1795601973260;
        Wed, 25 Nov 2026 02:19:33 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b70c05b9desm9342072f8f.54.2026.11.25.02.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:19:32 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:19:28 +0100
Subject: [PATCH v2 4/7] media: camss: Define timestamp registers for
 csid-gen2
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
Message-Id: <20261125-camss-hw-ts-v2-4-24c955e43d75@oss.qualcomm.com>
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
In-Reply-To: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06b636 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=3Wk6MWIrbtHnLGL1blMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wRFYuDqUQjRrqDAJGSVKGQ_wi6hF_o4Z
X-Proofpoint-ORIG-GUID: wRFYuDqUQjRrqDAJGSVKGQ_wi6hF_o4Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfXyFSvD3zNAHu9
 NihhIZSGPJKMvPlm8HPyEp4zLfOU6pWquBpDn1DNUySuT1xH6cDnVrPlV8ybV/UPQ4Xx+uLL+Xa
 RUKVpuVNG50vglOdr8aWxtwCQOxzr/Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX/7e0HPjqLcgC
 pWkm1L3mDU/4iENsfkd5z5OtaD3wyQB4iYGK75hkN1hFSfQUHhDyTzZ7YUsx/pZDqB+bSlIdL/e
 9844M9rZFCGf/y5AqApb5uc9NkeqbPcqgy/p28HMTfL+wvQFAlKoQFp89EhGkCgUGKUWg6zPGek
 S/GfFQYaKbKCSNvpZGknsPDXgguocjUYSexTPPb3xZ6TPye1di64BOIxUCY52oD/R1MVuf1vINM
 Y5t0IPBz0X5zjUb7XBIswe7Wc4L4S1j+TT1ToT8lSE9XuQSe4m5MXscTYcmPRzSuT4LY+pzTREP
 04vLclpsDrsLRyEZyFeJc/6E+wkl/3qcsvrzOfoTOjCjMsYB1lKmqcWDXZmOmu1COJPl8EzCs/T
 hrPsP7y6Vwr1pES2eqk+yc8yjPLp71YqKWil74skBAUfBJ1eqAiuePMmneRd98xIyrT8YLz56SF
 zz5bhRsWxd1jf4hIGcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Timestamp registers inside of the CSID block are available at different
offsets from the CSID base depending on whether the CSID is lite or not.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index a351ac4b91728b981fe80e030fcb5ebfdab138b2..85e9eaf78df75f95d5f44f83b45dc7a3633401d0 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -121,6 +121,22 @@
 							+ 0x100 * (rdi))
 #define CSID_RDI_RPP_LINE_DROP_PERIOD(rdi)		((csid_is_lite(csid) ? 0x230 : 0x330)\
 							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_CURR0_SOF(rdi)		((csid_is_lite(csid) ? 0x290 : 0x390)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_CURR1_SOF(rdi)		((csid_is_lite(csid) ? 0x294 : 0x394)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_PREV0_SOF(rdi)		((csid_is_lite(csid) ? 0x298 : 0x398)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_PREV1_SOF(rdi)		((csid_is_lite(csid) ? 0x29C : 0x39C)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_CURR0_EOF(rdi)		((csid_is_lite(csid) ? 0x2A0 : 0x3A0)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_CURR1_EOF(rdi)		((csid_is_lite(csid) ? 0x2A4 : 0x3A4)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_PREV0_EOF(rdi)		((csid_is_lite(csid) ? 0x2A8 : 0x3A8)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_PREV1_EOF(rdi)		((csid_is_lite(csid) ? 0x2AC : 0x3AC)\
+							+ 0x100 * (rdi))
 
 #define CSID_TPG_CTRL		0x600
 #define		TPG_CTRL_TEST_EN		0

-- 
2.34.1

