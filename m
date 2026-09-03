Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F3F386C36
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 07:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419965; cv=none; b=aQPuikfyb4WGiaFWkBIw5xfDiTxCKb7/LwEWIIWE527nfpnb5TCshUgZcba5WyJCHFDbHSmjE8fJMsAYTgyBvOG432B3L5sJp//FUGs2pxpYYmJHixtP7VJqOkgTSI3LnSjpKJbsSG/mxi2UwLaP2v70+g/5Ogvg8hxvEnC24wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419965; c=relaxed/simple;
	bh=To8PeeloAvmZ934Ch7WVJWVCgM1tIFQfjgNqR3WlU2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s7hRsdebZXeUBhM9I0jkB4ZyHHNHC5n8tB1w8ns30I1kflNZCm4zNJcmksN0GkL8odNtngqmnXNEWLPTJXHEQauKsnlDWybuZC9dgyssNlsmujjeHaeH9hKGJINuYnJ6TF3cHx5RJkc3SGVBgi2yMdWxB+UrO1VC42DzMsQdm6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tl2i8pWa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gUGGWpTv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tl2i8pWa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gUGGWpTv"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lUT52596728
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 07:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iZb96pkWUOLUETezKyay5lwdTNVTnCS9HTuh47NFSSM=; b=Tl2i8pWaFtTAi7s2
	Mgs4ln4y94NJJM/s5W0KVjvVcKBHEBQupApRJFUX1MsxngPUEulo1+iIJlYG6A8z
	eHaDKT4/Q0iSggC8p1Lf58kubnvE1aWZ+Ln04Sdbhg5JtuYpx2rBs9rj3qmZ0Eka
	hzY6xQAX30BFA60XymfyrpnoEgszFETwDocfx1NUL+xPbZLBIA7uMleR/hUsIX0F
	bfSEO73mtV3d3CrIM5C7dAqUhYYM6mHJcot2TtDLt76rwzMIr0mnDRELxEbDZmUU
	63Wlwkczs9VR2gdRoLZo6+WBCgT6eHUD7UaIfy6EiaRQ/4FJIuqRhbeSjR0dQKM2
	E3J45g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja43ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 07:19:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so4993302a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 00:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788419962; x=1789024762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iZb96pkWUOLUETezKyay5lwdTNVTnCS9HTuh47NFSSM=;
        b=gUGGWpTvtA3rGA6VzYighHDn8EFU/wRp+QkQvuhZ4x0Z/1CmpBzbtBDNbyHo2thV2h
         iKQfEcytBNHrptOjcxx5WK/ESg9Lge0JQfBoS7ceCLyHoA8hiR4LERyRk47truoEp26b
         Bjt4aNxG+GYeB6uS9hcb8XCEKOHCJlBymTzZmF/fWlyLeEfVfMDKwat4Z/cx1OTX4pxS
         0Cs+JiBcIb8tDoAz6uIycCUBxVojQQOUwsW8vMbpewJSdERn13hMkX2gqeQTjvs2kDHD
         SvQp+0RL7At8bWIxYiU2RMjhjguW1SdjohHobxsSGxpeAixywrFQJX1NrOmGvz0nd422
         4A9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788419962; x=1789024762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iZb96pkWUOLUETezKyay5lwdTNVTnCS9HTuh47NFSSM=;
        b=fgK4FEK1be4hC4As9hTZKaNcNNpupWs4he+68M75psjr7TFvqsAMnluS5Qf1AnmOHp
         yOsdU5JhFC5P7Qaw4n6cT8CAXPjT0MGJV0cg1NcScTMEUzbN5Gm7vwmXc/n9Fkz31s9i
         M8B8xbRH+l+StX7BL9j9RaVtSTjAeLMZoObiOWnstzRv9b6yLjy5+yNqRGx13Pk8H/dt
         tCZZp+MxAwZagiA8OnACJ9FufPEkVQ3NwKDARIEJgUbVZZNELH7wPoyfAM+bRmz+lxbL
         mNLHc2h2r5dREJ68yzFvUqlWVog0QVPZwjGwEQ+JZ7fCDDeiSF2iyqDIMXxlq922NFP0
         N/jQ==
X-Gm-Message-State: AFuF++lKY90L0oxhnm1DNnpFLswVfhFaRhmKbDsn14RSvE8KLmkSFwqp
	FO9xwQ0+Xj4cOMlHprp81z50Gz4nZFZGAQgAUvQcGLXhZXpuLXLwiaU/n3G5PN7WIWz1JtUAKkZ
	v0mYuAmd6ct7rpIJfrykSGJdOMF6aG9zFlXD1wF+kaN1sVygY0WALlNTW2V6V3u+0EGIX/8w/2d
	FX
X-Gm-Gg: AYBFou3SG8CW4SIIaPAvw+OU7MlhriArMm0RbtOs1GPWcuasnmCUpFGcekm0hSKCvMz
	zNOA+mB7xmFUFibeHGzLK+7BLBX67CTxMVeUpsQKcZI28u3WWgQaVBpmBwBPFuJMLnGREBOMYoD
	2qtor92VIkS9fnOy3YudcaDrjGvCg2/pUjOMcH/Hhm3y0Qlevl8hd6lhQPMa5xmWS9dzF+h4cbl
	0t8TgwTLBN5vmtLjfP1UQD/st03m0dD4qF6UIIUcy72qNZKK0qolP3FNBM3XAlJ4iKs2F80VSwS
	9t/7L5GzITGKl5/XJNl1iuy9TfRRr86tO1b0yrG4nXAU69kYxiqpPCLWSfUqwYOwxf8VL38M7Dt
	vk6sYysp6paVRo5qq15RubzOfguEhEPU+
X-Received: by 2002:a17:90b:2688:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39aee162e08mr17802131a91.16.1788419961972;
        Thu, 03 Sep 2026 00:19:21 -0700 (PDT)
X-Received: by 2002:a17:90b:2688:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39aee162e08mr17802062a91.16.1788419961576;
        Thu, 03 Sep 2026 00:19:21 -0700 (PDT)
Received: from hu-afaisal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14319983842sm3992468c88.15.2026.09.03.00.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:19:21 -0700 (PDT)
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 12:48:54 +0530
Subject: [PATCH v5 2/2] arm64: dts: qcom: shikra: enable ST33 TPM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-shikra-dtpm-v5-2-e8ea3ac8a135@oss.qualcomm.com>
References: <20260903-shikra-dtpm-v5-0-e8ea3ac8a135@oss.qualcomm.com>
In-Reply-To: <20260903-shikra-dtpm-v5-0-e8ea3ac8a135@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788419950; l=776;
 i=khalid.ansari@oss.qualcomm.com; s=20251105; h=from:subject:message-id;
 bh=To8PeeloAvmZ934Ch7WVJWVCgM1tIFQfjgNqR3WlU2g=;
 b=3NNTKCMn3hLsF/wntuQnfGkeGsCzYsg6+y2/YeysHkYPZ/tPFpMHFVG/JCyxj89KA6rbZed6j
 Ud5A5RfXSN/Ad6tDiiialvkrcvyaNyfPZnahI5tAq7LWi+FUusR0Jhi
X-Developer-Key: i=khalid.ansari@oss.qualcomm.com; a=ed25519;
 pk=eBXrIUgTWV0cgG+GsNeZPPgvj1Tm6g9L2sfcoxMGrKo=
X-Proofpoint-GUID: ujY2hYXcrVaDgLeqbZvbHwoKsTdVMrTp
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a991f7a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=YSeSwzeZyu-nVJi06OQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2MyBTYWx0ZWRfX2f2bcohB82Si
 PKwzHRCj7yVPCFIqBMcw3nG7O7ngioA/z+akIvgK4bY7SQQon/Ao6x/lFlZNd7C5vLStnuACSue
 snLIp50SGONdqcCQqX3lN0VqD919QEE=
X-Proofpoint-ORIG-GUID: ujY2hYXcrVaDgLeqbZvbHwoKsTdVMrTp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2MyBTYWx0ZWRfX/Ih5LFK3Y8Qy
 3/0YWLuhHX6G0b01efyynHZ4W7FKEMeBqgpgvyv0kKH5hKeSjwcy3yy+SwQibpOCpi4jQEOGq/x
 Ilbr03xvmJv0anmmGLepjHslo0AaJiEZyobGC+3wkk9PmJZCHYo3kV+I5VQ3zYQsY2WkF3t5xXW
 Bk31N6SscdC8ZAJ1nZHrLpjBIP1XT78vJ4iPcb/jVsTMA6H//lyv1OjbyGY6sc7mDsJP3r3mjDz
 VUFmNuzU900iR+kbpf0lqYIAPME9GsXNbE5/85J2VyzZ/BMTc2FPjmLL0li1SfZOw6nDEt6LGn8
 0j7lIQLF9x95yXlL3UyEAkbUPoDCXBEgDLFiK6XDGGCHTOE0o0Rw+klD1U2bZxC4QRKHZ4plgc7
 D7xrTYeSEQvNAEq3ZzPuBJ+jJadU5IPoJ5CyFIh70MtH2ma3AQqQ2pe5w5dqpOnnuqMoRE+7nCG
 LpZrg9C2Ll1gwTx3Asw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030063

Enable ST33HTPM TPM over SPI5 on the Shikra IoT EVK by adding the
required SPI and TPM nodes.

Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 6eb4184f7642..c073e45781a6 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -9,6 +9,16 @@ &qupv3_0 {
 	status = "okay";
 };
 
+&spi5 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
 &uart0 {
 	status = "okay";
 };

-- 
2.34.1

