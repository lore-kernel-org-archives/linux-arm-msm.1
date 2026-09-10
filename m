Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF824908B2
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046961; cv=none; b=qJmrRsZFEivaae/p3z8lrhEVxia3ZsjPbUENlHOmDAnfUb83wEjtAPzvUDRD3eDioZ0lQRab5TtPS0i8eBcmCzyMI9fWYyRUe/dYvmNkjBiP+eoXeogw+eRSG0ZiJP6FX4mgHTkajijg1tNlyjfLSn4BAaMmSCfLvRXIOHOrd2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046961; c=relaxed/simple;
	bh=rCRWGJ5b4fhSvg3pyL2eurfsniGd0t3Eomr4jK0pDO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VGZiDJc+4f/6CUSZJ3HnommCdAWjR5AsvuDSzCRR+lKhXBWxjrFrVkhJUvIBOkV+dIkr8y2mi753hFuyoUaeezAZVZZv/EelWNBGuNeYXxv0mlGY+j0lVSSb4727JRaR4kKfSPJbeSLHF3GEuY3SxSdl7UhjTbqHbGUtyfj7nEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D5BEx+WT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C6oUdroD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D5BEx+WT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C6oUdroD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7X0A215989
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NIQ8Leinje6c2P47/uVr0dwDyOFYKUIkUtuMDx3JiHM=; b=D5BEx+WTJ3sc2rPn
	qXPpH3IKTOhJG9xhBg3T8PIEfrh43jXykQcmvwM6O4aQQmpraiLDRoxdtPU0I4TV
	MTvJNwxOADeEyg6Ruj5kY7iNOxdA/WoWh5KVw/R93Hqv+/wqRD44w8+gkjQZr2cc
	zWkTfJK1wq9HsRsQ8Pe5NKIt+mtJs3/XVHOyRRWtBfq4dyFN1IQlAPpLbaGCzeEm
	72dOQmosovVAfcF224pVQ6FQ5PWTQEBdDqSZRodgeGCjqKPGDo4L6Jntk5SM4zmR
	xvOFPv0315LFRWoq4nuoMInAmIRrZ1ZL4xcfTxh8uyaC//2kXg0llRgGrdAg+73k
	5I7wpw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrdn99n2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:29:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso10076290a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789046958; x=1789651758; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NIQ8Leinje6c2P47/uVr0dwDyOFYKUIkUtuMDx3JiHM=;
        b=C6oUdroDacL4JisiJgPfA7i69eDzgz1Ks96O/xxklAHOIs+Db9y8/0VQ3UAXF7DUPP
         zoyyL4PCtA7UU97FHiNU2Nn/xGTjNqAeVQgQDrxqMjbmBW8pMd5FPi7QAF+8ec5pniQY
         gYxi85PY2lf5P/QZpBApA+Y9/a8WBpz7s19zhqhuPa5MS8WqNj/dy2BDA0R9EfDXRLCO
         XT5bQk/DAvCBn8BsMQVtmWx6AQk8B1YC3kiSrn+utuaEMZd79R2NiTOOprpluOPjf7mb
         poeFgp0W9SPe6HY8chYViJJW2UGTyt1XbN7nE9cSH0igKfLMvUfME5SlaWGzxCjk1aSf
         nwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046958; x=1789651758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NIQ8Leinje6c2P47/uVr0dwDyOFYKUIkUtuMDx3JiHM=;
        b=QaF6Wccdrvg0zrQcYyaeOxDwQzjSzaajhT/T6/7OHWGrr9bkyVIOvFJ63x3KTjFe/n
         k6k/62+AoHXeCfuUfczYz49lmBw3YHWrViyPjyQEivhT690rKz8FtDQhtaBGEQ6otIK7
         Ni07iHe6gTYH3HuSQIyqvcRQZGLT77nBFnZ8s91vmPd7PX2XbBOJp6FhWzRMVaX5xgDf
         PthGC7szHvdTm4v8TqBQlVeYf49p5Aay53+NumxZIpz0KPgk8JNpw0u9eP3Btz0KqjUq
         +IV96s61YITRV87dmCYDD5q+GCaTuOWC1jlVeDnHiY0V0doWw63eQQaQqbnpuX2Kho73
         YteA==
X-Forwarded-Encrypted: i=1; AKwUvBxVh2S3XdMT4uja62fD0WqdoB9Rvd8oGXE9sdciThUJuYZmWj3p+N/Q9Zt/uUHW78ebpGGrrfaOJwMPCvmh@vger.kernel.org
X-Gm-Message-State: AFuF++nHWJcgNFMlWtf2CuvbaN2+yOTi7gN90gW/AzAytiSc5PRMLmXW
	i3y3agg/377kmRCOHIHrrwcABtBwvn5eb6RITDYzLwKjFKF4/wNFVGvqQhczkJsuQ3UxOCFNj/7
	yoskfvIdA67XHPghhVb6FNAfFf07tdMgED5uBMvAAfWpMypf7AyoJgu11KvPGOkSJwHUPrRxMnr
	c2
X-Gm-Gg: AYBFou3g3feeElFxrJETkAStJYjipGrTAXLvvkBgbnmpaZuMtBmx6gY5NYRadcqCdME
	qMElrKDEE0IC8cz/xrKkTAe6NOqAwoy1cTV4G9XUg+0Pzy6WmgecuUwObUg2OZfb4DCRf7eKypC
	W6dQ0Mzi12t/WR6JkQaEsat5KnP9aph8XY22bFBhP1NM0+w3jpGZ031v54ohGRFzJmIvrqBpPQ1
	uP3iQf1c8xcCur7LyjJUnRJ4lKrqQBdXOpbpGAkQh81g3wJFE2/kmBM6pfw5+1jZhhsfWn07vak
	iIq0TyPiAvqKZlr9OwQsP8BeBO8a6/xwR2UGehAZ9Kv+q19btxRLWACgD2hv3k90+3LXIP84Lyf
	ghm2jraY4G4z6Yx0aGtRVecd2tDxzpfVP8Tk=
X-Received: by 2002:a05:6a21:339a:b0:3d3:adad:f171 with SMTP id adf61e73a8af0-3dabb2435bbmr22168494637.19.1789046958135;
        Thu, 10 Sep 2026 06:29:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:339a:b0:3d3:adad:f171 with SMTP id adf61e73a8af0-3dabb2435bbmr22168380637.19.1789046957554;
        Thu, 10 Sep 2026 06:29:17 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:29:17 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:58:51 +0530
Subject: [PATCH 02/34] arm64: dts: qcom: msm8996: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-2-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=1618;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=rCRWGJ5b4fhSvg3pyL2eurfsniGd0t3Eomr4jK0pDO4=;
 b=QekVz9tVmZRC7RzpzKIRE5AsIZcTyb04IeNC7xA/+m0fE0t/DRSkABdl3mBsNDIgsXQciKvI5
 q0J/krPx6RuA/RGMh25nUduYlsvJoOd4NNfbM22dZyjcHMQfGf301eP
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXxcdlTTFKHWpN
 k/9wfn+5ELB7IrPd7886kE9JdyW9IIUdoG3+nUeVbcRADmarNjcSN3PAUtIlFBxhc1v3Hhtn3kN
 I8BSdbd9oirwMxea4wrwBlWdTK+B85kvnSdSnf3Zp5t4wj/aetMqPWo7R5YruWZq1ulSqlfJe8c
 E79v8KCalHX4FB8gre1wRjrHR4LC/cAJyt2hxOQyLfXgOnN3rH4LapbVzvDlPudfja/lOxSFHlL
 h8PMrJDeyrCAfEO8/XnpOSH8g4/6eBP9hxRq/0ZwGClUeXuJLTyyrUoH8A4qRxgmMlUUL+aCoLD
 7PFs4Mj1GYir6lkgaW1sl0TN3Qu26Avp7vYfNCTNmDIVHEeeWdRUrjGqtBshPYl6Isu0i/tS9kt
 c07+e9E1rn16NLRFyHTCRnkZW/VE6npb1K160lgMihWQd7PeE0dDRb9dgr7vetrO56nziczwFBA
 ZBmYVJ/emmj5L7e4T/g==
X-Proofpoint-GUID: 4Tt24YmV1mYnwdofSponU5DJYgY2UQK8
X-Proofpoint-ORIG-GUID: 4Tt24YmV1mYnwdofSponU5DJYgY2UQK8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX7JX+XTT1yna0
 KAQzZilsvB16DGBenHuVncXGvuznAHsWaHABOk0iuOgjLpnzTkrABr8CFCfVqp8m15mOpi+9D0J
 P2AfXsCHbXoIYL1EkyMlrSqEjnHqhlY=
X-Authority-Analysis: v=2.4 cv=eOmGH3p1 c=1 sm=1 tr=0 ts=6aa2b0ae cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
index d55e4075040f..5b42c266557a 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
@@ -192,7 +192,7 @@ &mmcc {
 
 &pcie0 {
 	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 	vddpe-3v3-supply = <&wlan_en>;
 	vdda-supply = <&pm8994_l28>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
index 77ad613590a3..2abcc733dad8 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -280,7 +280,7 @@ &pcie0 {
 	vdda-supply = <&vreg_l28a_0p925>;
 
 	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 };
 
 &pcie_phy {

-- 
2.34.1

