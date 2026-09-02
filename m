Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7A343E49B
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 10:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344583; cv=none; b=Wok32fFRFwUhB2UzYfKu4C5BwgHdiW8z+/SSbc9q2SXr3AEGoQTlXZyd7qf4BFRSWzlEKHGkqvuKIQUCKsg7/CKIy6raxDOZwW1z80zQM7hCpZixi8xfULNRNyGgEBpL9YgPU2hIyXRwkJKfBPoFolhOuKsvDhJQ6V/YapQK230=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344583; c=relaxed/simple;
	bh=BltRNpqRejT0J8WQVpPYm7hnxBsiPPD5fyp6AxXutjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ak0e63+hZs14oTPefIHXFDAGY3HJs9WObR3zq7ydnD8eyrDgJbPM5L2p6/bCVqlPH1rjPzaCWzR8lcjKfgHnbAd3BTt72j85KYcMytapN8gziw591C4p/vO495ZO430ijERUeFdS1dKVEpHE1DARBR8KZjnnvFNliwz7zUfVNwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MSk5NLN9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fUxp2qyU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MSk5NLN9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fUxp2qyU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682A5oFx688836
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 10:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ep1cetOD/tSXxQv1hy46l7D5Cip1PYoER5yBFlRN7PM=; b=MSk5NLN9cHyHm6E+
	6opaAqzKypKT3BvLTJ/C0XMadjlz9ly519FowGlwA4jWru+OpLR8m7jW1shCIb1b
	Vr+vYxElf/5QK/xN1vdaXLPfQKDvo1IvZwLEWWP5HYqdSeFlYfvhMvFnJRg4tTf0
	pkgGZVxAe4XEI3/cYs2fK/jBlTTwhkvsVWpaK/ElYWC5X7QNphJqkUl5m8j75ILn
	hf/EC4slUoB5ils0RmPYHdZVEDT88AduMcPaiLWhqBs4fWbbK7vakB1VpLDGc4Qc
	UwL0HJjQdIjNnnlCIt1rhaln+eSESD2IskiEey3aUMItB3r06Ph7nCHn8lFQif3w
	fjFa3w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gehrd82by-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 10:22:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbee6bb8408so1225854a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 03:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788344571; x=1788949371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ep1cetOD/tSXxQv1hy46l7D5Cip1PYoER5yBFlRN7PM=;
        b=fUxp2qyUI9bYuRIx5qEieFdH8NUvhCrRz4tflMnTOExQE5mH84yQh0ZFtX+j+LWYBj
         NNpRQUO2sk32WQ3sFGUMm6lVTqRnPXcyQ91nLgdLh1hj72vmiDI89THp0J2vM9LqsnzL
         ZLzJoazuhpUyI7AY8b0Z/3h6Ew4rhLXBl/gHt21rzfYj/wrhLXEKFLpLJ8BzsMtxt7oq
         jXxJ0J/EoJ84ezD7fzmjlApVTn6Q3Tbaji/DafNuiKgZtren5YAeyCBnfbGuqhWX0+Rj
         NOOCqkWW3ptuG2Gb/5dmd6Exu1Xnx28Xh9LJv5mLmEmoGOnbvaj1xItsFEoRNu9n88bi
         1zeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344571; x=1788949371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ep1cetOD/tSXxQv1hy46l7D5Cip1PYoER5yBFlRN7PM=;
        b=HmSi5hMIyChdkOe7wvO5fnhRNDWqtT7QBq2jlZfGntFa02FMl9DQeNp0oBo7trHb3W
         IDyLXMxWOBQc+xbkdqJxx/tCGHgLuhkyp+eVsjPm8LbyaNOXISeTpGxIECVDZaD4+B3d
         cMkqB8HQ1yv8XKsuTZ3rXliZTt2VexdIET++YBmXnpDKqJ5jJFsxFqhMOBD7lMpW/Pa5
         bMRT1Gy9qGbar8xpxM6eRXWgo3Kltke6LJ2bhHXir3ooq+f4AsCBD9cHwYcPjbolfXnJ
         YR2A7+JGuChnjmrAjq6r3tqQ1vNZ/OP638PTVoi5mtI9TsXdWFQLZ6oi814Kbufx4/I8
         x3Zg==
X-Gm-Message-State: AFuF++kHF8ltJZm1Giu35t4tgSpQhi6869mKRWztNHKLNCUZNHA6LWje
	GkkSJGzQz7Hu8ps/7rxeRW2xXjFGgpJ9NKyIIIuLpuUW84bH2GOdV5opZjkCaZFLZhLPGCYa9Lv
	kVxu76HIawZLNLA4vFyszoIHqS9uCR6Xvykb/Mw/J7wA5xWPcyv2l1sGmjOKSjE5I/GTw
X-Gm-Gg: AYBFou2pXLDSZi2Gbu5D+4sP5RBEVLam6H+1cmB8cE+4YdvNnQYtUAIQCF8tjHQPMWx
	CybbSPUy/Xw/MH5jHe9ohVNeg/GSDUAmdF1Xl5EGyDxAcbQDatbV/o8DX32qEf7I6jFlKBKjfsZ
	Kpls3VkWXFKbk2vncs19XbGcEwYUrg8xwnQLQQHCEAODLbBpzWxyalsHUDRW/5/z4jLJ35Ap7AK
	+i4yEkKwbSW4NhlZ3mum2TUb+Q8TzjjGE0QcFgaYNuv7h8mz+ceNkwtLmdtR7FgJsf6aWeCKfys
	TlvbYyAgGHe9RuXjazBSEP2+qWrd88aE7kabFA1qBqAXk+UlvIF2nYo2HN24DwwxCAH/l42yScP
	zdeOxkKUmfWcw4vntohHmGebHxfZq1Ng8mxmeSm4BMp0=
X-Received: by 2002:a17:90b:5444:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-39aede97c13mr6139275a91.2.1788344571232;
        Wed, 02 Sep 2026 03:22:51 -0700 (PDT)
X-Received: by 2002:a17:90b:5444:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-39aede97c13mr6139230a91.2.1788344570812;
        Wed, 02 Sep 2026 03:22:50 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079c0530sm5054861eec.3.2026.09.02.03.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:22:50 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Wed, 02 Sep 2026 03:22:48 -0700
Subject: [PATCH v3 1/3] arm64: dts: qcom: ipq5018: Add pinctrl for MDIO bus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-qcom_ipq5018_mdio_pinctrl-v3-1-629c7bb05c44@oss.qualcomm.com>
References: <20260902-qcom_ipq5018_mdio_pinctrl-v3-0-629c7bb05c44@oss.qualcomm.com>
In-Reply-To: <20260902-qcom_ipq5018_mdio_pinctrl-v3-0-629c7bb05c44@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788344568; l=1720;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=BltRNpqRejT0J8WQVpPYm7hnxBsiPPD5fyp6AxXutjo=;
 b=kuA5mkZdBm6/pNs2QMeI2TxTptxg5jqQrHIHVMTmphhErcaknsH27HMA0A4igl/rjqWZUrvDr
 BOzvKvv3bM0D+mkjxCwEooJTvtNoH39ECuIgxE9CbdTC7ueNVGliQlS
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-GUID: ur6plsxvYwjGAlOGLYer06AEltYvnJK9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfX9NyXa6oIt+kk
 Dz0O64hkh0if79o4w4FNgoV3Wgv/5yDiH0OW4AXnS4HfQhfMZTQnIPovBSAt1H8OND2e8OeUbZn
 KrQHtiw8DRZpglT9U1wol7zTMRX+htkuRTBUcK2ljftxT3cNNJsUrSvwj0z+E/MdbA5g98wmCwq
 +5zKB2YrH9e9KutvH7cFvz5OLmEjEIOyHtY3DrYS0lhRDv2IKxwP2JsMsbF5qVMNwUfcZ6Y0UVV
 25zijUA9s8RgBhYskA2BgaRfAVheUF6C9MvmWA2wIHzt1pYoYuh8otDwOsvvsOrLKgLIe2lWc2K
 ld7A5pljAHWfWM4uBizS7GHiqKim8h7TPZ230lUsqVc2UJZ1UydhGK9o2qfmbeQIKb/w+b7p8Q8
 K4dRRpeom9fAaDqZambPqxVOre1tjtX6Zv9BF5wJmqQCP+3PJYYzSXdw+p00r7Wx+kLZ+n1PEaV
 R5LowLiOXBVNGbP+2Cg==
X-Authority-Analysis: v=2.4 cv=NLflPU6g c=1 sm=1 tr=0 ts=6a97f8fb cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=etYmfIWrwypQtZQWCWAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfX5hsaZR6BAnPe
 yQHpfXUEMcWiwhegFIBblegW1EG1cLKIsSbPTnBlhiwSwf3t/uOyxkv5Yi8u6fiCObKHMrzeLMC
 foKX5sfNm5yLHdBcDUufKeBqSSlgwcM=
X-Proofpoint-ORIG-GUID: ur6plsxvYwjGAlOGLYer06AEltYvnJK9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020091

The external MDIO bus (mdio1) needs its MDC/MDIO lines configured via
TLMM pinctrl; without this the pins are left in their default state and
the bus does not function on boards that enable it.

The MDIO pin configuration is identical across all IPQ5018 RDP boards,
so add it to the shared SoC dtsi.

Add a mdio_pins pinctrl state for gpio36 (mdc) and gpio37 (mdio) with
8mA drive strength and pull-up, and reference it from the mdio1 node
via pinctrl-0/pinctrl-names.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 4fc627b47fe7..cb3e1202b582 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -241,6 +241,8 @@ mdio1: mdio@90000 {
 			reg = <0x00090000 0x64>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			pinctrl-0 = <&mdio_pins>;
+			pinctrl-names = "default";
 
 			clocks = <&gcc GCC_MDIO1_AHB_CLK>;
 			clock-names = "gcc_mdio_ahb_clk";
@@ -421,6 +423,22 @@ tlmm: pinctrl@1000000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 
+			mdio_pins: mdio-state {
+				mdc-pins {
+					pins = "gpio36";
+					function = "mdc";
+					drive-strength = <8>;
+					bias-pull-up;
+				};
+
+				mdio-pins {
+					pins = "gpio37";
+					function = "mdio";
+					drive-strength = <8>;
+					bias-pull-up;
+				};
+			};
+
 			uart1_pins: uart1-state {
 				pins = "gpio31", "gpio32", "gpio33", "gpio34";
 				function = "blsp1_uart1";

-- 
2.43.0

