Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382303;
	b=RvkRaRf+jLvfUVSX7CZpvWou0FrJ5LvzsZ8Gjq6yZBLDeaCWdscda6ptulZJEw9y+T6/
	 sv0VPyLhm0ifNJTGfscA6XOPFhERab19ZSBXa63lxsfGoZdSn0D2Ia9n/ApMh2GdR7GPO
	 qhu8HcIzR941CbGlicAklh96c0XzdgV8gbTcEVqAy72PQcJ7t5CnFgsZJNX5G+4rsochj
	 uGeWw4Oc4PA28ukvO5XIekRksc6AUDsJb0jrNrz6+133ukBZz22d3pTW57P+WnKCjbomx
	 rrHuV+WW2odEaAOiIUn6b84oDozLb9juMyvU4cXSUCXnYj20ZOR3PedsVPH6jPtJynA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382303;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CDVD0QzvfAYRnfrAOJQxMdsebcP3KKppr1IXtEF3kVI=;
	b=I3hIn9oGIvbbtR3aKeHU26C1YfiNN1Ur6zbYZSGWzjjZd+E1WNXmYvWUJ5jYgUKM6JjT
	 158jmp0dGyKAy+QmO0U37L583I8+spQHWjVOLGMepzqkCUzfLslmD3UhTTBjA6y3t8+zB
	 4JGUgVDpcj9PQ7kUIK+CPLuBVHRO3lDrnM6jhK+UjjYYztrHz2RfLwQA5SxC8aao+P88l
	 +AvZNzPv8K98J9yRftmptnzA7Ciyu7QrJRevhsC+DSxaqBIAFf9+p2/R67nlI9TTEVTYA
	 mlMX5+TCKvNil4ruzthRcpPxKsdsLGUM0sbCW5okcNi0OmcKb9TcUY31kN0mDAaV2aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UXz+UpGL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q92skLzh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A28C606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A28C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UXz+UpGL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q92skLzh
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KHsF1409351
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:31:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CDVD0QzvfAY
	RnfrAOJQxMdsebcP3KKppr1IXtEF3kVI=; b=UXz+UpGL67sbdG7Ow4iFGiPbOMP
	aBs0ujVFytXPNFjeW4Mg8ctqvQPDKrWOGENYGy3WZc71+/OfnhwNkpr90IQa8pAy
	znQq86+GlScawpISqhUnQLguxX2uGuswaRG52maayetTJ6T6y6ng7N36kW5FZIP8
	9J2RN72NRVCI0IPDBRFzbPcS7ngbTbliV8Zr5GbEdGBXU6Vte7wQTPm1bQtYkoLP
	roqTzChdZ1QdLIeDirUUZ9uG/k0NMIfExzfGu25Rab1qkfIYGaL8gI2eFxCh9mm4
	d7DDKgoIEh6ChM12fakqWomXemCNAbpGefKq6EM7NFkT4cQ/Qyd+FRHckKA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdgscd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:31:42 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1aa0fb7f157so4723846c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 23:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794382302; x=1794987102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CDVD0QzvfAYRnfrAOJQxMdsebcP3KKppr1IXtEF3kVI=;
        b=Q92skLzhsbfQIp8UKc9kScf3zPUuutQU3aTNMvGKh/TOy5lGecPMBsfOXNQQIQeS1B
         jKpr6vJchV8BHJQxgVq+icFVRGtI3XyR+EuBS+J4kWzsL/zSU3l9rpYXcffqK2gXNcBj
         KH2WFkFcJD+xAxsoSssLr1CZJblCD3C1iQ+K2dUzd/UU21cOfSaO0Uo+RsqwyTsOcKbC
         MFeytZnkrTSo6kMl7DzOCTfrlQjPZ+cVDNgBf0eHaqaoTyd8lxmRMCrjCV7733fCmHJo
         xVGEeecTasN1ML5prDljHb2FIN0jayHS3QNx5T34afoUTUpLe2QwTJhYvI5idsTe1Hem
         GHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382302; x=1794987102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDVD0QzvfAYRnfrAOJQxMdsebcP3KKppr1IXtEF3kVI=;
        b=F7blyCLYAnIFn6hApOnzkciiLbhHgR96W+IxnZofpZ9Aooa+f2WETO8KzioGA3PPq5
         CZ8oGV59oaO1tPzjnLWFSBqCjpf7NkuJE8/0dajq/uT3tzqEVe4hbeKDEkMRwkxcH7DG
         YWn+xU1QNLL5k+Zwbq5XswXUIoENjIOffKnrznoiembe3fhIpvoKKmv7eVSagi4LrofJ
         PcVYBM2e8qcMJFql4PP0YVYmTCrCcb58LcCBZOHJJBiDTz0UoVmNcCC5v87oDhGoFt3T
         4ig/DImrJOVtRCdnbNWDWplBdmH+ZFlL1E9fkNbAK+DBA0WeiftHgxBq2nRmDVeDvP/H
         QB8g==
X-Forwarded-Encrypted: i=1; AL+hErGPPiYhDYxPUZrsRKDmLayKIg4Rjl2+JKAKkj7B5NtMB6XVv+ENfRq1ye3+URVKWVmo/iTMaCufgU+BP8V/@vger.kernel.org
X-Gm-Message-State: APuU4Z93uW6XOkSECBpLIQ6wqOSTRlieV+AnmaS1kQAr/ej4Vqp/xhEg
	0eQzRAQe530XysffN6zaOV0W5qTSITUDYtTD17iQ2gT2I9EbNaPK7GFDxrWZWzCFp5T4bAngLHb
	/004ZzwGyOSXMfdIPU/BoHG6PCJxOjS7BzNp1L61JmAhQoP2s6qRnhlTkMXvf+U9ocXL5CAlmkk
	Dc
X-Gm-Gg: AYBFou3fKCY1iReAwpBPpj/J0EwhVOjGDG+2U7+deQkOIxzNeeah31buo1aWJ3C1W4X
	9Cr5X0RG7IcgkULcXpIEcIfZ6T7+Rm4wvy2UJTTwRNry+4SYrWblbGYkOWvP/VaEwpDHl1/xL8P
	vf+diS3+LBJv7s0DBWzP+vPXuyYFbo6qr0z1PdBQjaiFTvf5oEDS8bPCicqlU+pFIC9P7vVhhC/
	R8+wZAZlKj1LE63uUMdAaad2jaA7oS4JgewjdOfflvJmvWKlJC6aHf7G43EV4XXBYXzb+oAVs1W
	lwKk8N3EtHTICMpq9zw6SwNt3MaxKZiAbH5kPaBpAoCXLE8c4BH7HrS/Xm8lno42wKblfZL170P
	ZIqZCMFKOPOHdclHdEKu8fSW2jxCXU5NQCm/ZmmB6M9Uo6C7XJs+AhnBoFzUJ5QZ8vWm+IE8H7A
	NnIufUy54n7UcTCFThsmFUho2e+uXIU0A4
X-Received: by 2002:a05:7022:671e:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1b3c0332a06mr2052011c88.27.1794382301895;
        Tue, 10 Nov 2026 23:31:41 -0800 (PST)
X-Received: by 2002:a05:7022:671e:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1b3c0332a06mr2051968c88.27.1794382301078;
        Tue, 10 Nov 2026 23:31:41 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm27220027c88.10.2026.11.10.23.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:31:40 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 1/5] soc: qcom: pd-mapper: Add support for Nord
Date: Wed, 11 Nov 2026 15:31:17 +0800
Message-ID: <20261111073121.3707030-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
References: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af419de cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=HqhytwvpZ4pInVvSuXIA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: k15HaD64RXiVwwRN1XiXsYg8_JCVtzu0
X-Proofpoint-GUID: k15HaD64RXiVwwRN1XiXsYg8_JCVtzu0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfXzP18OIFl3cSB
 sMUJ7ygS1V14H9YH4apGktVIZPrGtxBYvc/2iD64I60l2LtxPq9RahQj1q9B3baDA6LjtOfidvU
 ybUrr0H4ALQNvvKrYURKR3mzVajiSVveE0ZzjPIRGfJniOUlji/h+dAPvvaMQOOiKBR8U9yBeio
 98n90Y5CinU+SHHWXLTSj1a0u+fINmPlapbBvXVUkBLA0h/o9ebutne3a52IBUCviAe1DPONAFs
 TyN6LR7GXIu4UJhR9VzMOYg9fwE1fc1V8qF1nzCQpIVzexN0Zj22o5YujrYiS3DugjWWUodkRm3
 GQfw8nSJCnx7KspgXKr1hrxiKqijPDtQRaIhFIUOmpE5jvuroX1hF5k/2kyXr5+aU3cMxbVsImv
 Je5u48co2pJ5TGdas6V2KIm3RUSyt7x9aJmFSg5LYezrYrhyru6BZ/2rg5sAfsku9qEyLRCdnO/
 rFmHGSkoukQU9crH1pA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfX8Kd+dVs1SMW6
 c57YI1J0bmAFDuXha5QB9b1fPhhRuDRdkXFT6f5l7Rwc2miLXfbfhgL/1DHmzdM+kw/9XxDaKyr
 HVNom9iiDkORC95QCpN2OLffenjAYys=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110029

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Add support for the Qualcomm Nord SoC to the protection domain mapper.

Besides the audio and root domains on ADSP, Nord has two more ADSPs,
each with its own root domain: msm/adsp1/root_pd (instance ID 123) and
msm/adsp2/root_pd (instance ID 124). Nord also has four CDSPs, but they
all share the same instance ID and root domain, so a single
msm/cdsp/root_pd entry covers them.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index e38647f3d7fd..0e2b7f4607da 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -277,6 +277,18 @@ static const struct qcom_pdm_domain_data adsp_root_pd = {
 	.services = { NULL },
 };
 
+static const struct qcom_pdm_domain_data adsp1_root_pd = {
+	.domain = "msm/adsp1/root_pd",
+	.instance_id = 123,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data adsp2_root_pd = {
+	.domain = "msm/adsp2/root_pd",
+	.instance_id = 124,
+	.services = { NULL },
+};
+
 static const struct qcom_pdm_domain_data adsp_root_pd_pdr = {
 	.domain = "msm/adsp/root_pd",
 	.instance_id = 74,
@@ -414,6 +426,15 @@ static const struct qcom_pdm_domain_data *msm8998_domains[] = {
 	NULL,
 };
 
+static const struct qcom_pdm_domain_data *nord_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&adsp1_root_pd,
+	&adsp2_root_pd,
+	&cdsp_root_pd,
+	NULL,
+};
+
 static const struct qcom_pdm_domain_data *qcm2290_domains[] = {
 	&adsp_audio_pd,
 	&adsp_root_pd,
@@ -641,6 +662,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,msm8974", .data = NULL, },
 	{ .compatible = "qcom,msm8996", .data = msm8996_domains, },
 	{ .compatible = "qcom,msm8998", .data = msm8998_domains, },
+	{ .compatible = "qcom,nord", .data = nord_domains, },
 	{ .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
 	{ .compatible = "qcom,qcm6490", .data = sc7280_domains, },
 	{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
-- 
2.43.0

