Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016276;
	b=fviDMGWLbVN+IPsSzVtXDWbn+xX/kF1uxr0SgvGqKnZME7M8N/L5KVgA1g2NL4aIR5Bm
	 xV+wI8a1mGiVznxxtXm4DFs2YJPLHFq5l2Vv04Tsc4GSnB/VcKEbZd6zPHairpSvA+Fnp
	 gTvlMHwg48Kd97s71DUc7aGTpVCMEuDVbqPX6kW7L0e+0Dr3xJ240EuvLcRdS509j8E0t
	 AMR3Pvyy1YjNX+5e7yv8c7WNCIDfg9Z7akOO5RQmpYgSR5BzWeU/i8cvj58Uv5t94pZ19
	 hCVOOV7JDy3E3Aa27XnduZ6IpJ8qXPRZ8vlnw1AlFhcVF6iutimGA+H2mo8AB8MdLrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016276;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BaMEnEGWN9tyrQN7WvHqNpg/qVu1ssxg9ENoEbzB81g=;
	b=DNjHd5u3zwQFvkODs4vmOKLzc7cThlP58pUJ0TQMZsXau38olxlSJ3QSJM8P64Broh/e
	 W214xMhDza0rf77LdRHo2ApeoOFS1QvxD/e4La9fGXuh3pMbpWHU+8yNd5g2CVRsPTU4H
	 d5Iq/IRD/017sD05jT0YMqU5Qt8J7xcogky8BlaFuGiSMnJvtDRhr1ydakrYm+2uvl5Kd
	 cw8vKjg1unQ7zpFJkGMVVehg4u4JJenz319XtmZIyXLMTWFQyBF5vbLH/rBrkWSXl2Kz5
	 Vob0j9ZaRWxrM4nhBMYv10B5AgtgV6CDTvGkz2I4rKPs+4EeBuNazivPIBC/aiLOq8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nsgyjhGt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WTvayKgU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476FB60A381E
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 15:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 476FB60A381E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nsgyjhGt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WTvayKgU
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQ9432225978
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 15:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BaMEnEGWN9tyrQN7WvHqNpg/qVu1ssxg9ENoEbzB81g=; b=nsgyjhGtawXQfqSQ
	uRW3wApuuD+4jPLNC5PmxvPAbkA1HEcQT362Aul+2pAnK+gtANEH+p34LuxvxHL+
	6y2zOGEO2dd8M3itwIUm2mKhyyEBiYz5OkVMpHoY2HseWxNzIckEfgxoO62LOb2V
	Fdra3Ifjwn0J7f2F8F7a6Jbqi8OLb2nDg0D2b7KzWOTlQiesNRRuyJCfOpzz9vH8
	3HPhLIdHGrYuK+YJJ8g8ffCYJOW6TXQc2ZKRuUwxr4llENlzqhK/mY4ZLeHcrCUI
	YAxOho+GDxXwFAoTw63dh5tfctfk/2ui5AUZEc7o79nlVzd9fp8Z693mBcJqSS9F
	onnreQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvbbr1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 15:37:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9211f05706bso6067046d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795016275; x=1795621075; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BaMEnEGWN9tyrQN7WvHqNpg/qVu1ssxg9ENoEbzB81g=;
        b=WTvayKgUBuow+rqaFghVpPx6HpWMHPvkhRjLgPaXieDv3zv2WrWm113bELSEgJP4EU
         kgvfHdQzR6BPmyqAKAm1HtZl58m0kgZNOkhTJpprALmUVo8QaosmJ5GJsfPTcz+8T2KR
         htlTj0hT2PPE+ONf9G3gX4E4kiFox7a+JEtXT+6KvgXflO7vDmYC8I3gPP/xUsIJc/u/
         yFymmuT5l+F5vNd0lcHzEZ0hFEJtoeR6KR5RU5L6ic5lBBBjEwx5h9HVKKgqwK/ZDgqx
         7DdrDrWGEBRzla7BZAoQzSZevA0sRRLl+JaQXJUVDaKAp82/BhARUf4rhdRBTDKTWTVm
         IRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016275; x=1795621075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BaMEnEGWN9tyrQN7WvHqNpg/qVu1ssxg9ENoEbzB81g=;
        b=Wm1r9JsLCR2tuttuWrx9cPeDS8oHpbibtE2d4FUQuFg3a1Nu5pO5VazHM6/RhfMGl5
         vGxTPj+2tCvtHHhqWn5jyAEJ929AMQXKDWpHcS/SkfcT7DjU9VNGdlPnFH/UFR21bTyC
         PRUa+RpYu3rTzBjchDvEwCKC//9mYXnJptIOX5Ex6Xh9GwpsH+kvXy9FcDI9b+fbkIid
         GpJtR48JEMX8eL50TiOXgpkqPnlusoOAOlTPEZD/+xfBOduvcufpsHhWwbjicB/s3Zjv
         wmTnVBVQMPfycQRgaIg+2rO4VJ9fiP4YUJ9YGdAul8Ej1z2umE6NXo5mPDIoucqva5eC
         XjoA==
X-Gm-Message-State: APuU4Z+M4pI9IhdPf+zEL6gALU+v+SbBNfkZjbBUP/tFJcBfoFIXXWu4
	KuELuk0uMzK/l9+O9Bp9b/b4cKBl0Za0AFUj4uPumR9r726rLW38izu4rb+pSSyA+stHQMRA7k8
	mC5n/nSp1HWf9jJDI2sFKrG3+MgZsymQVKT5GO1v2nfy1vfI4xLS1RPzv/YYYrWa0vvlUZkiOUt
	hi
X-Gm-Gg: AZFdTZe9PQh7SSiaNpjlcwhC/REfENo03+xPKBie/c7JsAyhAuKh4VAuIRnATuSys72
	1AAkuwxQvTCIUZO2qIaIx/k7ncLFxQvu02NjA9ALgOzDfS37Tm+CbCAWHM8uJQqaX6JHNvSvLM/
	w+r/Q+3LPJ2CMpl2oN7bLPb/n2TxPJ1hGWQxT45+o6MUpjdyrdeVSRHk+T4z6Lzg6WElaVwTGjO
	3vkUSczM5H0RKPOGNU9Ft1ARoeloVOP9sXic6xwrVYE1Qq+tMC1k9hh3VFWUjuD8ZYvg1AY7Iwx
	AvWRJzof1tz0nsiX94rJDq+O0DcIHpWHMFHBwRrjaOAtdy8+pVhy2N4Q9es5KEDXhoKqc1+lECH
	NoOM26XHmhNlWKgFeynf+phixRg+cH+S1N3dmt5Zb1gjy4pJeUSIoVUjf1Ml9k4O7IzsS5OD4Ag
	5RrdYWu0bwxsvUsFRxdCDPrRWxmlhqwrxaIM86cy4QiB2am3+DHiT0U6aZI/G6
X-Received: by 2002:a05:6214:478f:b0:921:1cc7:809 with SMTP id 6a1803df08f44-9211cc71d61mr19714996d6.33.1795016274468;
        Wed, 18 Nov 2026 07:37:54 -0800 (PST)
X-Received: by 2002:a05:6214:478f:b0:921:1cc7:809 with SMTP id 6a1803df08f44-9211cc71d61mr19714526d6.33.1795016273763;
        Wed, 18 Nov 2026 07:37:53 -0800 (PST)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d0d879sm24569676d6.12.2026.11.18.07.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:37:53 -0800 (PST)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 21:06:45 +0530
Subject: [PATCH v3 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS PAS
 parameters
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
Message-Id: <20261118-oob-support-glymur-v3-4-2cbdfe208d56@oss.qualcomm.com>
References: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
In-Reply-To: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jain P <anvesh.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795016249; l=2115;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=h1HpQR5ft0SmfNIj7EEF/Ykdj6Ugo2udF2gXOOZSwLE=;
 b=4LJ4JoCJ5vF0dlcaZOh6pc1mBEyyFDEK3gN1kjiaE9mFiz2etIWuN4fPCr3ld2PwU1GUj7X+j
 Q3BLr42J80CCUnuDE0UQZ4rdnIO4g0RZFFdRUxx+lNDdrgKDFmD1+CA
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: 5RKUr_M1Dc0KKk31qhicH-43NOmeW7W2
X-Proofpoint-ORIG-GUID: 5RKUr_M1Dc0KKk31qhicH-43NOmeW7W2
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afdc653 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=PB0afdDVj_GKkQGSUhQA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfX0xhXdM5WmxaP
 hjUl4o7B7MBLHd+wgkFHmHWvbxWiLh8Mnf0mV71ANliP5Cf5oZyXyEr8J4RGiEdpC/nJq6VCp+u
 +3Q7XxiI++XXOhLjt5I1nMsFoguYj9M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfX1beP4/lzJoXb
 lQWxTFAJcKPtfMK8JRnKLH/W8Z3bfDwe0LObuI59SKp0ixCwUdtBc88VwJqCUrbnIueKeYIAmC2
 LnRVRA7D1e2gA1BkhoMH8rAm0uaskjhpAcuriIxL47aJAMZusCdyOjpCkjwUJ+l2OXOiV0Qdyqc
 uT2TFRa6OMjMXUvIoasaisw8+V1csdhO7EPC5/6eKGTKNZX4zDJKFqDv3zBNFB79zP6690lQ4h7
 AztxQ9fd8FNtzQsorthoMmF18S4GjCc7Ptu+SjBsnsglO5Ofxs4QT2iy3F20QGg3XR5H7IG/zHd
 smWHm+2YH2SOh4qjMxRK1B6hfxU+j0CZcmUEfLuTTBUyMsiBpEGHEhwHp69h2SyQWxSw4N3mgAR
 Z9yXUF6wCRWU9kdAQHxKSPnMxlWMg1c0A0G5MZWWaY5THeAT6JioP29na2wDwDes9OcZrGVvhJz
 wV7734iY9l1KSbza6kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180062

The OOBMSS consists of separate OOB-TEE and OOB-NS Zephyr subsystems,
each with its own firmware, DTB, and dedicated PAS ID. Add support for
the OOBMSS PAS loader on Glymur platforms.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a167bd6072c9..5cc529e2923c 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -2182,6 +2182,30 @@ static const struct qcom_pas_data kaanapali_soccp_resource = {
 	.early_boot = true,
 };
 
+static const struct qcom_pas_data glymur_oobmss_resource = {
+	.crash_reason_smem = 669,
+	.firmware_name = "oobmss_tee.mbn",
+	.dtb_firmware_name = "oobmss_qc_dtb.mbn",
+	.secondary_firmware_name = "oobmss_ns.mbn",
+	.secondary_dtb_firmware_name = "oobmss_oem_dtb.mbn",
+	.pas_id = 0x42,
+	.dtb_pas_id = 0x43,
+	.secondary_pas_id = 0x44,
+	.secondary_dtb_pas_id = 0x45,
+	.proxy_pd_names = (char *[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "oobmss",
+	.sysmon_name = "oobmss",
+	.ssctl_id = 0x21,
+	.auto_boot = true,
+	.early_boot = true,
+	.needs_tzmem = true,
+	.decrypt_shutdown = true,
+};
+
 static const struct qcom_pas_data glymur_soccp_resource = {
 	.crash_reason_smem = 656,
 	.firmware_name = "soccp.mbn",
@@ -2255,6 +2279,7 @@ static const struct qcom_pas_data eliza_cdsp_resource = {
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,eliza-cdsp-pas", .data = &eliza_cdsp_resource },
+	{ .compatible = "qcom,glymur-oobmss-pas", .data = &glymur_oobmss_resource },
 	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
 	{ .compatible = "qcom,hawi-cdsp-pas", .data = &hawi_cdsp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },

-- 
2.34.1

