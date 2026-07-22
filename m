Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E012747F2C2
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784712447; cv=none; b=l9ebxzv9ZrbcF2+vLQLS0DcQ1M0ep2fdVh9BwDkeFEux/cFhS99dlHOhDjUWBtBcAF3W+3yz4uiMLbveeSaw6BGKQLEhCNpreZMyT7NkISvjSxbfLTW9arAaPkK8nSXGl1/ITtJVYFHChnv6ifB6ygh+0h88i3wkXBObYsLgblM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784712447; c=relaxed/simple;
	bh=ucguCpxbLoqpQk+XkZyYa9zl8lvCdskfB7s868tjUho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GzR7Dlb6+9GvYsiywu8eJWxOtkmZ0vQsYE+3QJcNffY51rtW4Sm4U7dktgPW2g5/Hfg/xSZN4w65BF3XMCtBe4JM8l8Tjnye863Say/MnkaO/EabD3XoxMc42+xZdIzqj+OkMuvyGeG/71f1va80y8fG4bKPQGjlurveqVmUe70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hxa1+zYN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FQdtSCTQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hxa1+zYN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FQdtSCTQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x9C7401202
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KvsphiUTv1IYzvNQ+L1erXBxMCXBfQ0d00Rz/ByFdTc=; b=hxa1+zYNAgFeq6FK
	PUG/wAZTMeZRqBlpMcL4KehgeAj6Jnqy793nM45osKv4s7iAGllmQS3pP2B3+OYf
	IXfJvJ1suGly1B6HplZZ36+8lmwxSUvyz3TUx261cffAP9LUhTlG3pMp4OUpVDAV
	OKhhG2V2V1ggZAUhbwkCLzc1/ovHO4b8FiBMgSxt4kMMx6zb/AoLmIf/ttVlHI4R
	XvbKQpjnpbkxlyQAWGNkqAxYISSEPRLNjDO4S5yLkI5IAhnxWV5JyX6TUoViJKFn
	YQKsuH1hEXZObIIX2HjbQTi3tSiRlg4UadUIl/MkSsh9zJClZeB0ZYiA7Pg48HEb
	PeCsFw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjt7989hb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:27:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848544a8496so9987615b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 02:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784712443; x=1785317243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KvsphiUTv1IYzvNQ+L1erXBxMCXBfQ0d00Rz/ByFdTc=;
        b=FQdtSCTQiKoVtrIvM2tdH1KFHoSTU3UgcyDttnf5ROlv62mmYVHsTE7aL+MP3pREpE
         KhbcuXfmnvjrayy4rHOjKezV6xw8lEPprP3LagJCaLnVxyZ1kvG9KLlnendXIjosXg+A
         wsZ9VzDqY4yi9EP3NsNBZP/ZAaKVYq5lK5q+UZNnVAwqwDFz1RJI3wOYNGh6gGIWrh8u
         rpmXBDQwXAYt9VeTEEgrSLWvPZxlESrq4M8iqO9Bg8NpaGA7eesXAjlFhVwMarm+MJ6D
         w8NCATTGqqlUYD2T+F9WpQf0XKt8bH/lyWX+Nn8RUWgc0KTu43rNXFWiFyBo55vbG08n
         z/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784712443; x=1785317243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KvsphiUTv1IYzvNQ+L1erXBxMCXBfQ0d00Rz/ByFdTc=;
        b=dGNkfUlkDEJw1MnVH7/P41+T7Qt/lXfk7VgwoXNPjf/S6FsKlMectjjjPV1cbJfgjT
         SL2KB/QwfDOluj7dDFq7sfrbvGrgRnGljUU9HFSGknp4Wcv+t2BNqNxYjLb8rE52X1q8
         x+5lc4/G/u3/6pdQV47h7YXnkFL31FLB8gXwu3sz67sSn2bgmeItu9NRYb+4v96bTbWi
         yWI+Qm9XNSYz8MABPlaPpa4uERF9+c4pT6dCbsTMip3ZMjsTzEfngAtUT9vkoiGDXDsf
         a5u2syWko5949uwp1rHG9NOvPBDusW/jO4R5TOxoPMGEzFNY8d8FyC//gLZgLCBEjxYZ
         WEyQ==
X-Gm-Message-State: AOJu0YwR43usSZVzVGnN2DJYfDK5DSwN78vmsT83fjAqLIphYesDs8Ei
	fNEr/lEx9R6H8lsHB8LansmQ8dXFsyxmFAc0cF5b2R0N9tRogipwfR41WY67HrLi8A93XJO6Cl6
	tx9c7Ij3jG1WcBZoYPyAzwhV0Ib2LeOFTu5kTOMPc3sMOyPx+0XnISALPAdYdpGkjRBxe
X-Gm-Gg: AR+sD108jjRR2YeGbrMmaO6gbFZqPMg9ZL3pouLMDzEog4VtNps4l7mRyNGE1fPk6UB
	PlcMnERGjxVNYLOZoVVFr82qTw7zPTOpic+HuEjDoYz95pSZLYs45Ypym65PYVcXKCbdumxaxf1
	CYADzoFv+/nuxx5te6004TSRBIphHw3doZnRgItBn+lN63/Xqz4jJblLZ8/+KKbJOXB6woPYDZb
	TdSftK7wpS4YwJHgnH6L5gcrK8UawZFQxgeNCjsVyr0+cdPC8bkt80snaeC/ulW14dt4nRhtDY8
	JmH84Z8jnqzJFfIpPrK/NCR7uCEGwaIGP0TfftA3rA7y+zJZ0q7PNjGPbnXPREM2r5Px63DLsHk
	IsAsHHg8G82dR7tpiQUHfGq16mKco+YEKVsLrDnF1Zh2h8WbVk6zHRcAR1eH4Y7F6h8cDkrcxXw
	==
X-Received: by 2002:a05:6a00:8d2:b0:848:2c2e:c79e with SMTP id d2e1a72fcca58-84c292634f0mr21693861b3a.12.1784712443338;
        Wed, 22 Jul 2026 02:27:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:8d2:b0:848:2c2e:c79e with SMTP id d2e1a72fcca58-84c292634f0mr21693826b3a.12.1784712442900;
        Wed, 22 Jul 2026 02:27:22 -0700 (PDT)
Received: from cse-cd04-lnx.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f18f08asm850677a12.21.2026.07.22.02.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:27:22 -0700 (PDT)
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 17:26:29 +0800
Subject: [PATCH v2 2/2] arm64: dts: qcom: hamoa: Add ICE node for UFS
 inline encryption
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-devtool-v2-2-d7e609ef7388@oss.qualcomm.com>
References: <20260722-devtool-v2-0-d7e609ef7388@oss.qualcomm.com>
In-Reply-To: <20260722-devtool-v2-0-d7e609ef7388@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>, kernel@quicinc.com
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Sr6gLvO0 c=1 sm=1 tr=0 ts=6a608cfc cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7g7wA4PAc6ioHu1SxIwA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: cN8-QwxRlf3kTKMV_EQDPF0DmS5hfVIj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA4OCBTYWx0ZWRfX5SKz9ztIy4i9
 BPAYNUNN7p6G7FH7UiaKT8EZaff8KRN2qAHOqY1Yy/IFizaiskv2rqAzO0YX4jhzi/1Es10MlU1
 lT9ygMYHUR18orkBD2nbPVmxTaynDaS3q9Fn728pgZqFXmzvtzqkVRT2El5ieh/wHtq9dq7VFru
 umoxXTShZAJdp1EUP6iTVQ6ca7kOcHuGJnWK+s8U+4Nu4WGs3kMf8lp0vu60e29A0jVs2A1ZLic
 GRBhXC3ZfCiyzVNU0mEdOvDk2Q6Psblk7yJaBghXyw489doRptbPLNmp5Py7Gex0AIfMmaFlxkm
 SNtvD5Q4yi5ra/2hwJKcwAzIuEidFzh9PkS8cAC2iIGBxdUqbkA4W5x4dNiItN1LoQWgBmOKe6Y
 /cG83qVTGYhvU/8hpkJseDZnVPS3e35InGKJYo8Z4UTWg0EA36DXOASZS3vD+Cf2xcMD4LnPU72
 8r4A9bwPFLkLWzSXWfw==
X-Proofpoint-GUID: cN8-QwxRlf3kTKMV_EQDPF0DmS5hfVIj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA4OCBTYWx0ZWRfX3QNx1CGaAu9P
 i//zRitx4WtC4MOXmpVYIKHDKP69ykrBA7495iR2spDJNF5USpINmExTg6aZpb4BFtIxjyBCPKd
 k7qfXvTfbNmEXFvU4dYRpu80+v+mpmo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220088

Add the Inline Crypto Engine (ICE) device node to describe the
hardware-accelerated inline encryption for UFS storage on the
Hamoa IoT EVK board (Qualcomm X1E80100 SoC).

Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 0840eb2f884f98d76442fac7888ed49a07780898..0c9b459055d720a528a319272161d1d7446daefd 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -4176,6 +4176,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 
+			qcom,ice = <&ice>;
+
 			#reset-cells = <1>;
 
 			status = "disabled";
@@ -4221,6 +4223,17 @@ opp-300000000 {
 			};
 		};
 
+		ice: crypto@1d88000 {
+			compatible = "qcom,x1e80100-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x01d88000 0x0 0x18000>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+		};
+
 		cryptobam: dma-controller@1dc4000 {
 			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			reg = <0x0 0x01dc4000 0x0 0x28000>;

-- 
2.43.0

