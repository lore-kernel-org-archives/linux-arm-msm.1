Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDB63546FA
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 05:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045133; cv=none; b=mt2BoFEp2xobD2k+ccYVh9aWz+odpXAMPC2XKCVKJvuZWqq4XNPSauZFlGnYl0UltrHnoTvUz3W1HQOqit/wR4KbQT30uIE+dk3kRjeAcIjSBWlums/JBeTgPKmd4hFcNg+fLTe1GUzLMS6Ne5VSbJPBVNueKd5ZXT2rpdWDsso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045133; c=relaxed/simple;
	bh=QMtO0aaK+jEwfLoS/FX/xRFAe8jOcUGQ12dvcUB8g1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H9IzI+1A2+7Jk3dtNJcmvjnGeL8nrUDf0MncMqfEpaoBum/YLeTtbObzMD22q746/YxSaX565P3nqp+exjzvzByj84O9BJXQGeNCcZBYFSoOC4UyvtebsdnVeDDXTwqCCnuCHKKCbtQP7EodqeEl3uxYu74jhjizucevJiqkgH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K1GwRksO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eq+dIIvi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K1GwRksO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eq+dIIvi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66Q5SCYF4103691
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 05:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bMCoOHF+KRjaR6jwkz18K6wWxQZjA74R5y1B2yqirho=; b=K1GwRksOkSEVHQXf
	5n7T0MfRhQat+SBW+pZX39b1mXmF50QS8Ch6syDFa8piOfRkH7Eq1H12dMAnUETF
	zOtQ7FGdTfBK/49ilvEdf8uZfImByCBnkxcucc9ntmpzU25T0ewwNpnhq0o0u5C4
	IGJyYAEdouiOhukhIkmPzk3nfdGRgDoEbMtBa6q7T5gNEKWCSU0NgGKEMlM/EX4j
	xCOon6TmSt3+VWIv3+HCuz34QAgVXTahfV4Nupq7aGVkDQDelH08b7pSpaOHN1J7
	ppQIex0+eNhnBQt3hWn/cJ6qDMI1G3YS3mqB/niMUJjVtHYNP8QCDCA+F7yGlCIN
	aausBA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmn7va9wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 05:52:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c856470fe9fso1089479a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 22:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785045130; x=1785649930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bMCoOHF+KRjaR6jwkz18K6wWxQZjA74R5y1B2yqirho=;
        b=eq+dIIvi47aFw3re89oZAGWu5LnthGSU1LAOuLqG9ENYZlCLiMRXR7mdzeCVnHumjE
         96oNv4WyJhHpkoWB27Tw8oW6vXgaFwqQAgCWoLG87iZfLA3cYCthHj0jlrEmPQMIldVr
         FWOmHHW1IXCO+oExMclRSj5QKOtfYYkKQRxGSIrBzA2qs2/yyzFCykPBtLMmW+xamF7L
         rNPTW1o96/2TlTQPEY0NTLt0WEdBBOU9paXkthK9LUXT8TOnIZAdsfEUZ6VXkELT9HjG
         NlRL8yfGPT4jqfR5CRDeIdufeydG4QSDtUajE8dKY936oSFZkibgGlWr/tfMfmgyHprQ
         qceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785045130; x=1785649930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bMCoOHF+KRjaR6jwkz18K6wWxQZjA74R5y1B2yqirho=;
        b=seJudnslzoCJeppe2PLRRfHMx/ugx4i3LpmzVhSmlPl6IK3/AP5ib/tmqO0EKgqabX
         SR55rXb7Sg8SQWY51YfTqSUQvWDCFuXIuWNa8kFzivP/EleTnk9aWYshp8f57rB5/j3L
         qmfWl4Ic2eIs6Uxt3sfZ4iOxJaQuBO7kBb25s8EyYVjggvSzoS0827Cfb/6qM5zemQ6Y
         N9vfmgp/l0cgbxHXjF4ForJu+ZREfajJ4Ba23c3UHh1jMLZRca2NyaU1UdbC24BGoHkt
         M34UOoCHvMCSH4SskU7agsJqN3SyM1W3z69JVa3I3NM2XeW39nLCKj2HWu73GSGoQfUi
         wpkg==
X-Forwarded-Encrypted: i=1; AHgh+Rp4HBPgmBi0d9agfQNOxYzQuXBL0zq2wjoRqC0eBfTDkdZ+Mt55bWYfyxG5iz8AFd8IHjd3Ywqrt/Xb/x3h@vger.kernel.org
X-Gm-Message-State: AOJu0YzXn68x+xDeGyXAM/EzRaknI03w+EtlXy4MeQl7gxSgJMklQ0LT
	Iy/PVxoQTq5b+q/rv5LM3N+J584VlOCjw7UfJ4JA4zKwy3Hq/1b0hrnMgOWu3qg5ekYJU06pT4N
	ltVYc/VMRBhmrOopF/m3oJG4TYEgQj0KfbGa7ANQ7UTX2vNGk0/+ZfikHc1VFXCZSCTsj
X-Gm-Gg: AR+sD12graZgvWyuaBRdqv3h4+PY3RqLrb+NKJrlbAqevLarRoZmwdm0OXfyDGXrTRR
	BXDD23edF6liTZY//fsyMqw7lVReHqCexqD4dEwkvBL+r2sA/HOPP51ZCQJiPztbOPoOrwgL0Zc
	x5RlQn9LyxTZMWer3dl5DJgKrlIcTbsMOUmMYCBAFKrYqd9Ma6Bx44T2igcZeSG0IcnAFI6WcPB
	G6gWom97niBW7CmKiOtkQHe+VNEraiBdWTzapUqB1O/Hwxv5iO1hUtalXmglN/rL3Lp13ryNct6
	h7Et6Egx9NAQ+wVcO+58HbqLjLlfupoJzYgzTOtPvgL1Vx0d5jqjFOG8t/N7DeG+syAhgVEH74c
	VMrOVd57gCV+fSvbM5H0HdLYr0vEZ6TTO6Q==
X-Received: by 2002:a05:6a21:3393:b0:3c3:b57b:628f with SMTP id adf61e73a8af0-3c67df285fcmr4613022637.48.1785045129494;
        Sat, 25 Jul 2026 22:52:09 -0700 (PDT)
X-Received: by 2002:a05:6a21:3393:b0:3c3:b57b:628f with SMTP id adf61e73a8af0-3c67df285fcmr4612994637.48.1785045129054;
        Sat, 25 Jul 2026 22:52:09 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm67106334c88.15.2026.07.25.22.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:52:08 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 11:19:44 +0530
Subject: [PATCH v10 14/14] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-glymur-v10-14-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
In-Reply-To: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785045024; l=1017;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=QMtO0aaK+jEwfLoS/FX/xRFAe8jOcUGQ12dvcUB8g1Y=;
 b=k2vmy+1Hvs+i3tndHQiZE3m0r+Wru7GaVIqoEaaJnGXwex8ucR+WVe9BqSpoha508idHXhkC7
 0jlWG27zHZBAwhrqnLiZ+0Du0lmPXC8wakvmfuDl73IGSbaA4CEy0LP
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6a65a08a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=jls_Txh2LmBa37OkJYYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: f-dy6FH2M4bjZu0xGExfvg-yLItKluOq
X-Proofpoint-ORIG-GUID: f-dy6FH2M4bjZu0xGExfvg-yLItKluOq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDA1NSBTYWx0ZWRfXyA0XoGIOWJjA
 /NcCyxoDEPmM8DEnCi9JB0OASjztIQv9CpCNMDeWPDrVb7D8J4Nc9olxgJFMJPKF0pfevfNaejw
 sewqNEkkJRCuVRNXJWYKIZIV34fBdoQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDA1NSBTYWx0ZWRfX8Qgb2xjRpVwF
 wqywUFhpDUKmwzcO6/9hcZvZXMZb5JE0VnGXIr5kUV/0d4h/1s+wJ91B2w4LYZQjXPts6yNL9qi
 bZJZpST/rDLOZSCOIJvGRz9VQH8GFVQJ0Nmj/xnX5UH6qnO/zMUmYv8XSJfNG/wk30ibAcz7ioy
 Ny0LeqDuejlrFR3zIm+9gcXVaJufIG+nzCSx9VZuEiVedGJuedoCKvG5NeraMIEspnLQTCIze2l
 cvGAphKmWqSXKVmCKpqAGN7DRxPwj7Eg5eQZFZ+YvLB1Hi60F4kZEHmdppXoq6UXjaY8lRlmuJX
 VDKg8Ff5BmuYCXv/eoQsN7WlQ7RYT0e+njG6vH5aZki+ClayZfAuH3n+m6Vb3b9YnJBm8kmLbtP
 G61ta9UUjftqzDVpOGHu1gOdJonACNinC+efdA2/0V5yOsFOROpBLDPv4eMlBRI0dmsPyNsLmfC
 dRLOENWt+Al7Y71KKnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260055

The iris hardware block is described in the glymur SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index c12808abbfe1..b8eed6e99588 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -695,6 +695,16 @@ touchscreen@38 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+
+	video-firmware {
+		iommus = <&apps_smmu 0x19e2 0x0>;
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";

-- 
2.34.1

