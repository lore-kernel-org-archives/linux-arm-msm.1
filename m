Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CA043800F
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800598; cv=none; b=pRJk3gxYw/SIF3jww8GnjoMNTXiweZE+kZhXFEwdOGj16TZtDW8FAEMYTHbRdkZ0hfM2fAQawhSu8zK19SQ5bJT3CTxYyIMZS0q+1Rmu/95YItk4fCThP5lVD+mMzAdd2toh++JG+pKt808ibkiXhoCEMLkL5Tf2a/x5r7w3xCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800598; c=relaxed/simple;
	bh=cWoSTkVSmyJnrOKQKsLg9vw1fd0nN3WorhnNxks62kM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lfGt6uN7OOAtXY4hUn8vSJ49lwQ+pxNk2pOPrFXUUOwZGVYMB1IqeGGcdbZE5PHqeb/T6iXb9x69LL30KG8kCrrjB1IdOtWgDm6GoJsAsYijtkSwHDMTJEyWo2ae+qWau7OeS4fo07SLSh+ikw9r7pokPF6nU591Rj802aGMkLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fNoEzb42; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GiAHQCMV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fNoEzb42";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GiAHQCMV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qofc3388143
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v7hU0qU47NTMfGgCj38gIkAxbOzd9dVWMRHOirqotPo=; b=fNoEzb42D+7asSJX
	PBo513pyqbgKFrghRm20gfo9/RMBgnTBImoXpEuLJWloqYJWmVAcLKyvZSd81zWN
	qnx3UTRKGJ7cGlbFH3LHEA1+Eg8euaw+pBR5GTbYdiC0c6vuU/D8Tk0ExELnS7ca
	0aeXWcQyil0v15+p6SBxDe21Z+WPbXYBC6hwAAFDVi6HM834I6vy4uySvvZbyZJ3
	OxxozsuNrrHnM1dGs5A3heJ8HKXPvsOFwEjI2cZ31yd52h+PP9a7OojtYIpe7FSG
	EIIFCqiVVuxEbOtRkZ7q/S/bRloYK7frlVIQ18XuWhOsHZcJrdxhzyp0rfNarjnq
	SK75Qg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk275kghj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:56:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce756aa72eso3445775ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784800596; x=1785405396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7hU0qU47NTMfGgCj38gIkAxbOzd9dVWMRHOirqotPo=;
        b=GiAHQCMV/U2c/TMgt2sbKs3EG0JqjqfDGvcV4q/U/AWKDdcL3rGg+OarXDlrCEqoF7
         C2gUAN+7dFg+Sp+8hGCAuVSQVOLrnocIVC7qFRai16okDMqV/+cQ6woaOYAzjBqf1vQZ
         YdzeyQRN114HEX/dIfvXH84uh5FpgFES5Eg41cUbkZS6m1i8TurWt2CgeXPsFR2Q6pZ6
         ulX2RFhIKUERZx4kxWaCu+cvo9EYTEuUjqYrIzFrztAD3XpFl8ByiA05RIR6OJdZUAyv
         BdM16tMXwxt/ovd0vzGoa+slI3qC/AnkRN02abfbrM3LEz+43NZ57vfuKAtW9oBLfrK8
         LNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784800596; x=1785405396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v7hU0qU47NTMfGgCj38gIkAxbOzd9dVWMRHOirqotPo=;
        b=Jpbv/oTqpGB9u/SELBqTGbtp3jRMh98py2hgqakwhPWvnQAwldMm89NVQRjMc2yhnp
         bHgGOPOzzPK528fZmFYupw5flzupEo/Ch8n+1JIfW/4YDz486xJWBYtr7z/SljWkVfa5
         hdSdiCVuVbAHpOwPLPsfpP9JFTWybmronnm+rczjCG8NP1uC5vs2PiXm8KfFQeeczJLt
         VoTwRnTpR+eyN4WIG+T3gOE617YrS35g7U9PMOSdPpeL00bA0DjlakgmvuN25Pm35L6Z
         BR5INiIZt0Ou5pGbH+OlSIRydJdPJITYAXaidXGnA0OywQr4CF2FEXIgJi3WJuKRru/0
         ZCtQ==
X-Gm-Message-State: AOJu0Yxae8b2U2ZII5WW+IBfHLiQESHemQYholOuJFj3tcgGrHYLWq4y
	+yWNCAaL92qToufR+uOuz3Fbgd+Y5xIKoFUpbrNX5dYNf8E8Dw2dKVyqcDRmRCPk/kq67t+DbS0
	96+YIJPHLruEnx5FVYDpe1ErpDGLPiGKN8z5/8kTWM8VlWKK5emZx+DiCrF1797wdQFSS
X-Gm-Gg: AR+sD106QiSdfXwNqphIMloKb20Ug/uJL9mwfW4Omb2cogjRN4kacNGEB9hOiN2vy3O
	86WrT4Fpq9snE+Drc+vxu9dkBEW9qgsxUxay91VstQK2C5pEe0Su6PdYpo+PUbUYR6Ob+SHS4i5
	YAF8q3MLQbmCfm3heQSJIVryy6Iciq2T3c8zPGaxBz1QvtLYcbTdiEc0CMQX9UtU9P0nWrbVnOO
	3qvdlL73Dh2mDVHTJ9v8D2bS6DStcUwTAVAp5CzuAPaw3wQwVbJJoFlmZ0nlP7R2VBVo6mOslXS
	rlsiLCiECz6wUN1tOewEOAwTXqcmvhm9RYm0VTcprDltOE0Q7i8ujzlXdeyTiieW138Vb8aANn2
	CmGsqzHA+AtforA9UP5YMwTb76Tq8dWUZ3Cftrbm+T8f7XGx3X28=
X-Received: by 2002:a17:902:d98f:b0:2c9:ed4a:c3a4 with SMTP id d9443c01a7336-2cfa670a5aamr21915435ad.0.1784800595820;
        Thu, 23 Jul 2026 02:56:35 -0700 (PDT)
X-Received: by 2002:a17:902:d98f:b0:2c9:ed4a:c3a4 with SMTP id d9443c01a7336-2cfa670a5aamr21915245ad.0.1784800595427;
        Thu, 23 Jul 2026 02:56:35 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa2cd0sm30392755ad.4.2026.07.23.02.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:56:35 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:26:20 +0530
Subject: [PATCH v2 2/3] arm64: dts: qcom: hamoa: Add compatible to the PCIe
 Root Port
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-hamoa-m2-dts-v2-v2-2-82254ac101fb@oss.qualcomm.com>
References: <20260723-hamoa-m2-dts-v2-v2-0-82254ac101fb@oss.qualcomm.com>
In-Reply-To: <20260723-hamoa-m2-dts-v2-v2-0-82254ac101fb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Q53iJY2a c=1 sm=1 tr=0 ts=6a61e554 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=unBuS9T_dDH4f9JXRc8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfX8hFEHEQo/Ms8
 OAWxeRtQ7Y+aneCnrNi7ybjH87ZwSgX3DNT3tNCZraDKcXFzYE+SDm/UL8gKwnANsuCy26sl14v
 ahqwtCjNG1+k4sVmUqf9Gs+gDwMn5l0=
X-Proofpoint-GUID: gHM0XI6Rl2fWa7htB4FLrMReEgOdc-uo
X-Proofpoint-ORIG-GUID: gHM0XI6Rl2fWa7htB4FLrMReEgOdc-uo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfXx/qYv5vCKPNa
 Nmf44JChfUqB/EXY53I1G5oGlbDaqJMtFkZgOBRQQe6HF+hTCyZRD2vVSAZeVqI4xeCC9iFrJuQ
 uRj46hl2ABl3xccdvlUYEYsbZfZ66g1d8iqnv1DrQP8/3CKFCrp1HMaOEgfBiA89Ed3Ye1OzrwF
 CQlbzzW8sfzOMIFhxkVGIg76gLd+ZxBvUFGs8FK8hrYtFMSXFdSUBCDnoV76eLelSG3q64yZrCi
 pEAhPgTKwoxnpt1llQWGcQ0KOJaJ79HcnhxuuTR9WThZUACRwxUravYMIAljMg9YepjQTdCjd2z
 l75/SzvZmWHiw/elgd50122sSsglEMl4uiKwS5JJn5wA2EpF/AF7gOo/aP4czLXRG/+Gppybj3E
 XYpeek0Mf3rB5FL5KFKfdQCyiWKdRVyJ7+jWHmXtm5c4aFTsDtuxAvzGJ+nOfAkGhJy3ZpcCg3i
 9vei89BVlWxYE73g11Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230097

Add 'compatible = "pciclass,0604"' to the pcie4_port0 node in hamoa.dtsi
to allow the PCI subsystem to associate the DT node with the PCI-to-PCI
bridge device, which is required for M.2 connector graph endpoint
association.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 833810470c85..dc680554cd34 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -3777,6 +3777,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			pcie4_port0: pcie@0 {
 				device_type = "pci";
+				compatible = "pciclass,0604";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 

-- 
2.34.1

