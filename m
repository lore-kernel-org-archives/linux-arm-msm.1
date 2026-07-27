Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FE23FD97F
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 11:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785152695; cv=none; b=ECWBFRySvRbtMeclwbTqciyebjU2smYJxyY3tdKNAU0p+0KbPuOB3up+PiRe/HrEf4h5CeOufsBmsG07pT8p4aUrWaY+nqf8Xb0vmy9WSnUQ4Uwk/GVIuHV/okGg0ZWMEdfW3OD68RTrlujBMbHU5O+b1xgBSfInXigFFA+NaiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785152695; c=relaxed/simple;
	bh=nBjz/6JaFU8SCXCUZf1bS5CIxUPYU9y9VMKZnzFmVGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eqqOHUS5ym6RXdxeo7Kfcuor+p+vtlQC4jaQJOqi2djixE0XTFj7P5mUx5Ln/4hT1chK6c6Ki59+jflClrxKo2DAzZLbleFM3Swu6voCDavD1sotKq19uGCpn0F3gCWNkWccjuMJP8M2P/nmzCECjMg+zSkkQSZn4FNmK/D73l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AVULosCE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PVEhZCdq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AVULosCE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PVEhZCdq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAMKj33197747
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 11:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nI38o9anLOtmFp8L/rmkoLV1KWqVpGQQHPaabFnPIuo=; b=AVULosCEm5ieN1hD
	7rYVEDMLAB6hTpzqjxUOU+grpdC1L8Jv69UrjNFDy7jPdzmvJglhee/qymKMjsAO
	/ecjvFfD29zdmZAn+6uGnw2qMOLW/LTYKswWovBrj4aNLoBGfGxH+H1zkueb4Qg4
	Sv4YZmMTURIEVHi1n9OM8YSur9zu8fOhM893hNW2HmJT9YK9MLJ7ZRI6Spp7ycXJ
	dQI85mJjnlIuJar0a2qsT64Jj4r8S+cOx9sLP+KHfiPEEeEa+pAgu1ld4Xmu3vnL
	8WTwPhs0k7x/JDImkRcqJUACd72N8534gViPP/J1bLimxMsX5XNOplFpGzr2FJiI
	1z4Mpw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp2ash7kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 11:44:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8efe7db1c42so41257586d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 04:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785152692; x=1785757492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nI38o9anLOtmFp8L/rmkoLV1KWqVpGQQHPaabFnPIuo=;
        b=PVEhZCdquCt0mCtQk6eu61cpzdr6QjnLntl/0+vF+vaS0fP4hhlgSjiyYsB5QhnxLz
         cIn0zkmS1ztu6Q41Kh+PFbhgTQ7CJ5Scj8zL6CLqebR06NlmcDxXEKGBFYc58glv3uNd
         7XliMLC6RLxyeQTvJ2GugesfpFLlJQbL8sQZLcBj2ZsNGmkU6sblyi05Dh1U8I3mhRnu
         P6adFXA4m4t6uub/rVAfYCUoMH6+coxLuKLR8tgAWQEWk0fW8azEmnPuGpGmKmsQBMCJ
         YNVrbFTg/mG0IjI7L5BUPnYvEqlVj6ozXfovKyMl4Nsib2qalSGwHdL16/K90qOaI5dn
         mEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785152692; x=1785757492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nI38o9anLOtmFp8L/rmkoLV1KWqVpGQQHPaabFnPIuo=;
        b=pfq69uhI1AEo5PjocEu2mzNhh5bi3S3IanpXvI1/W1HtOOl/M+BzJyFZv+bV28PdfS
         2SuMr4c9NIbEwijHVObrAkjiW8JnXB5qEnfw9z+qenof75YEqtHYWhFwk3ir5EwmvfVx
         dF4j1joSs6krr1IEjPBPYcQ7XEy1AsTvxyDZVUrBMtjHUdpxszTzb8RfzxFiHhl0RVb5
         Ih5wPCycDLVwe5jpJulIZqyZx/ciQu6kxeGEzZ69S73bxISoheVGy3m9VUIDSyfbOQNi
         alBBpXpgqEDi1521I4oQZu/XrlAfVcipk/bl/i1zSSfihM68jrSB6wDK//xv3+1dYb0V
         UBjQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPdCFLJHS8RWMZQ0IVe251ptnGa++8FSH7kSNHAXBkLSmjbFe4OlfdurXVEMWa7CppRkF4atUu25b4eTcU@vger.kernel.org
X-Gm-Message-State: AOJu0YwHUkgyqLwfrHsYWeTmdMTHN5tGeRqr8LVgq15vEoJGqF0ymQyu
	gtx2M79fL3xknEm9jODUxL0GRbAii+B6dOb8sg4gZiYx50zkUwKnS3KInuPTd+9Lwi/+Cgyb6Q7
	Ze3btNL2Y6KWGjSoOt6g/sqp3Olkzua8gKSR3EsX8TwuDo1H6AAMbW7N+PPZJvi0lxNkY
X-Gm-Gg: AR+sD131WTnDP4YRQmu2tGf2X10ggpoF9AmV9yYt8T92LCL0u1M3KrMF8ISjSvfoyKx
	cptaTUDOk6caHg/4HHq3wAWn8ldyQij4giAC+eF9I3nwtMACipWSTGN7BZ325Q4571W4T2Q58M+
	AwJox1bD5zmnYeT4GOTmaAGGqGWg0eRi/KB4btL5T9qre7TqaRpIr1kNIKSjxSCCQ57xF3wuD8v
	FK6E5uPSDIMRAOzXRuvzGyQ91EcHMxk6YoTjLiwXiKtfqR8Q2lqXaWQPKcDMrZEbgZTY/+mxIp/
	6Xl+akcQHiIs5jv4SnQCs2OllEv7R1kDS2eL1HqrHFs5yTZ0tB7dtO9v1oYybgIOGDkT5mI+xa+
	299LPNSvEB8n2zwwELEoh47kS
X-Received: by 2002:a05:622a:2306:b0:51c:1e69:bcc9 with SMTP id d75a77b69052e-529ccb0d948mr4031301cf.12.1785152692063;
        Mon, 27 Jul 2026 04:44:52 -0700 (PDT)
X-Received: by 2002:a05:622a:2306:b0:51c:1e69:bcc9 with SMTP id d75a77b69052e-529ccb0d948mr4031171cf.12.1785152691689;
        Mon, 27 Jul 2026 04:44:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6e9a2sm50301883f8f.35.2026.07.27.04.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:44:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 13:44:43 +0200
Subject: [PATCH 1/3] irqchip/qcom: Enable compile testing for QCOM_PDC and
 QCOM_MPM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-irqchip-qcom-defaults-v1-1-ed80ad83ca53@oss.qualcomm.com>
References: <20260727-irqchip-qcom-defaults-v1-0-ed80ad83ca53@oss.qualcomm.com>
In-Reply-To: <20260727-irqchip-qcom-defaults-v1-0-ed80ad83ca53@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1087;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=nBjz/6JaFU8SCXCUZf1bS5CIxUPYU9y9VMKZnzFmVGs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZ0StEajmS1mzi9JQRCxxThT66NwoeSQt0RK0m
 n7kzVVHfieJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamdErQAKCRDBN2bmhouD
 138PD/9w6nPRB8XE9uxI8ikeILz33cCYlREqZTHTBgh7fa9uWT+bgM8WJm+v71egOOFcfh8XJl5
 e4H3Oy178bzDrsZBEAs/ejr8PVO6U5AMlovlE7V/z/3rE3sbRF6xOBV4xybIQztkBDZhLcLpu33
 PgzPZZrt1WHwnwOrusSAF7zZFB6/msZS6dm/dgTDTFY3szWylWENJDZbnmtOhjPbHfwkzWp9KhT
 keHN5Gf7VATRDWHxgCeM5ttIsKsWYLwWaujhPR27Sevoq5WMReyKst2/7Hll1jDaPdZsQlZnKoO
 yU1oTbjADbXt2wakVQm1WptUGsZqVQPYiHT17PHju9uMTgUx7px7NHS/3PnxmzeuwH7yEcXzeTG
 Wj8d2rU8MLZ9gXOR/xzHnW5ZNZz4zLTX9CyHmJqaKVPt2hzpWZT0lBxyzgMW+JGCvRLgTYikVEp
 rA93dz4dcmHDzVzUvwmbSio1IMcHpG9XpcHdNXdTInfxM9wOCnjM2684cBqNgEALB3C0+P5nHdr
 jxPrGSDBcgXdqyR3JfAtezyxuxxhSbwPhRgQhYTVB80bpbUtBHpzM8cRNE/gvMYsTvlVtco58yd
 1vJjZQ00435HnYtbCUW/qLAN6QghEqpQ7O9R9q/lqaTjVx7PRHmOoJSTeIaulwJnDQAmX99zCMX
 FfUkDhYgpOceJ7A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDExNSBTYWx0ZWRfX3fNCdY1Xo0TH
 FjuN4f9JxrwnMRFEO1WGlsQnUweaLAOWsc4Jdn00t9iVpQ9bXb/xpTwnDIVNUJOPf0lBf0wgMp+
 L8ks207YqN5iD7cTfA8MY7piYgeYtASPPd5dAgAtnx49Zj+f+x1gh9aE9nK5aIroTNA5y83+lzB
 dfzCmIzTzVgMTqh+DYj2d4uBzib0lzyOiFRVwj6TdgEQBWMnsjWZLaWofTJKNnB7NNwpNW/3di9
 1ojifeE5kfJYutkKGXKATegSB3wovq5hRUk/MpcWBeKe90pp6Pq+5+ZWfVXKvni3nJarUxQEW9h
 24oqXbo+Bn+GwaB7A6HX8hJviuvu1mTZLiyqlC9Rl0WHrtOSZzhQBDs2mJ1Yrgl9OLu4XFiei0A
 QVnAIMFUpeRldyfbuqZOD0mSTr9DCnI2c2wcW46F1WJBFq48g91HDEkTid94YygLDK30maM3L5O
 NjdryEDNM1SFqOwdnVw==
X-Authority-Analysis: v=2.4 cv=UPbt2ify c=1 sm=1 tr=0 ts=6a6744b5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dUEsVS1TOJrVgmDV-PEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDExNSBTYWx0ZWRfX1spzI5LNRE99
 X8gqXgeOUwLCdK9qp1RQ/PDwkLysr+dY+LguEFN2BCrsBDhrYwb/ZU95GmyEqgZApbHTBzRUFjt
 RqPPmVFkOgI2plVsx0jl3+QSyrOILtY=
X-Proofpoint-ORIG-GUID: myLHKG0AaKk23rwrQy2T2Iziw0Lu5fZD
X-Proofpoint-GUID: myLHKG0AaKk23rwrQy2T2Iziw0Lu5fZD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270115

QCOM_PDC and QCOM_MPM do not reference any architecture code, thus
should be compile-testable.  QCOM_MPM is used only on ARM64 SoCs, thus
there is no point in proposing this option for 32-bit Qualcomm platforms
making kernel configurators life easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/irqchip/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 20b77fbc51ee..954137395bff 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -522,7 +522,7 @@ config GOLDFISH_PIC
 
 config QCOM_PDC
 	tristate "Qualcomm PDC"
-	depends on ARCH_QCOM
+	depends on ARCH_QCOM || COMPILE_TEST
 	select IRQ_DOMAIN_HIERARCHY
 	help
 	  Power Domain Controller driver to manage and configure wakeup
@@ -530,7 +530,7 @@ config QCOM_PDC
 
 config QCOM_MPM
 	tristate "Qualcomm MPM"
-	depends on ARCH_QCOM
+	depends on (ARCH_QCOM && ARM64) || COMPILE_TEST
 	depends on MAILBOX
 	select IRQ_DOMAIN_HIERARCHY
 	help

-- 
2.53.0

