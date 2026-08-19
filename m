Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C685736194B
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144031; cv=none; b=kL52U9hYweR5aWdx9u7a7orVqJCpqvLLU8tmtnX0Il0yirDbWY2LReBZfmpj/QO8o0RVi2yjqRZMBl5u28mUZ4vIq2GIcC2rB7jfufUPoFjXaJzyfb/yHuZlgCxG19AEv6eV32lqMTHXmXeQVv9gsXbgDkTPuYjyKQ9PRG0LJMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144031; c=relaxed/simple;
	bh=ofaOcaFEo5VEe0WMa48AwttEJOkWIiAPj9t3Vq14JXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oU5NJCkDzyGafWECzvt3dJZ2ItJoiicc/549z4F4H81etfnCUaSruk+z0bPNr4mfwZZRTj+LgD9ZY3wWv93jjB8R82WWrY6UPfFU1z3BeZLd6DPz5RuUZquSeQjwbhYlCO76B92ttt7L/FonudQsqSjTRcONmYwr/8xurS8CJds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZLicXt1c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gOcaK026; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZLicXt1c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gOcaK026"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JCl8Ml1373992
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tZPEYEYPf23oSgx6pACDahLtv4Ld0Kzo45qAIrz/EnE=; b=ZLicXt1c8rAgrRFm
	nfZ2fhoSay1IUP9gjNarWWRXkeeVd01qta8JQf4cOGwT8qDqefIloUvnl4PD71js
	BJFl+bDUV+8OB9Cp7ZX3+pB60uOz6Iu8gQSd8LooO5NtzbsVDslhewi1+jtvQNPp
	UIKj80EBMhasPX41Tmc4TsP1SEWXteXw45OKqQFcrA1/tERijFOQtZUbJ8r/zGCX
	jyUxYzJuoA0cIR6qgW6c/U27zXBe3KhP59Xy0kYevXZfw8mxYKCCHGJf4nfwu26+
	xjN3KhIsnpBCqj8VEMsGTcWsDEcu//KdCmRfcF0EcaBBiN0rFQr8h0NZgdArGOkN
	X/vuHw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm38kf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:53:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930b6bdcb4fso141989985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144028; x=1787748828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tZPEYEYPf23oSgx6pACDahLtv4Ld0Kzo45qAIrz/EnE=;
        b=gOcaK026jIG5w+WbBKZWKtPOIklt39wq+3Xg+2pyWP77g2f7G16FWlOZdHfiCse5oA
         K3PqevMtxJURDZRJaCAsSSYWhJbMz3McnVKNfQXKLErl39FENJl1NS68AmBST3NoR8wU
         wZPsrC+srpRcTIC0to1wUAWPHKNq0rFtkaW5+S7J77f4h+oqlwmeklSwK4V7G9s/pGXq
         3V9i9wEzUkfFDkiPmnRaNdUm4gNleU4MqZpxmHpGEFCAjJOLgJxm0vgtQlR7hCNzmSjC
         6pmcFbOC9qrGrsvVO3xxdg89sm0yet1/13YPm0asUPfnQNBCCAuGzpMbhATxTNJLxXgh
         kfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144028; x=1787748828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tZPEYEYPf23oSgx6pACDahLtv4Ld0Kzo45qAIrz/EnE=;
        b=LoEhqu2L8hMry8tVlmwSyFH4OsoxRWYk4j39W0wPX0tPEMXdfgm+ZBh8htI/6sN7AD
         xfnPWRlpWdFwWNFEq2kr7wcfhMZt+33ZsGq2aFlH2kT5UOGC/7Ds+iFtgrMUyrPdQHse
         9NsMPibk+Ir3Pf7Lak9kQ7K4GHI/KBwdv8YKSIKrHtqvmmmfxJJfWf86K6Aja5nBr2pO
         djdDs06RXuBod2wnMVCu8S019glwjoJNVmRe2lsQ7YgTKwOlVdy2/chxPLLZZ64ZKRKU
         HRO9heSMzIXl1B/ke8vBKQJsUuKIOUaUxaS56oUdELuW8bt93WybR/u3ZYf4tEWTcV8S
         QjgA==
X-Gm-Message-State: AOJu0YwRzmVPIrOn2bIx4q7nILLcFHwvOyIvt/nQC84YLjRAFJIPptsI
	Voae1J8fT/pByGEFouW9IuO531mZviQ+RKWL/dOSE47eWgc/N4Q1Vok0zGQRaUzdivHfuiKOe1A
	CWVVvcIRB46BYbYql8ycfPPkZR4j6+3KSlNTCnQ1xXxEjqJcZRHBg6bYOKJFU8U4Wywm3
X-Gm-Gg: AR+sD106aKBLZuRtoIXevY9EiC3vIJGQgC+llYTwWDX8eMoMZqvT12UsvGNEA3W9mmp
	Zcaf38kogcolghFJqzIWkVzZe06QKyPRLqSyPqKulcV/fgNueni1XfeNjt6lmzX2kEKGruUdrhq
	QkZijbF58nukIt6Q9jTIh7N6e9SCbkHu0RVRNRsZZkDX0IKcuALbd2GJn632cYBFT3iuym3iEFf
	mD1+gUwvhNZeCOsIw6TUUeHh4gXtcEF5ZA9z6bZ5K8I1OFZ8YHt5NlBCY9w+PrJKAW2Zhly4EAz
	jIX5dELCSvyzUpHxclejy4KydhbBg5sDzpX//x9pjypfxYzozr8WLD4UTGcSDgkTOCHPWF7wfRk
	7YVwrt+P2
X-Received: by 2002:a05:620a:2b85:b0:936:a072:d749 with SMTP id af79cd13be357-9371e2e69dbmr410803585a.23.1787144027761;
        Wed, 19 Aug 2026 05:53:47 -0700 (PDT)
X-Received: by 2002:a05:620a:2b85:b0:936:a072:d749 with SMTP id af79cd13be357-9371e2e69dbmr410796585a.23.1787144027209;
        Wed, 19 Aug 2026 05:53:47 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:46 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:51:59 +0300
Subject: [PATCH 14/16] arm64: dts: qcom: sm8750: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-14-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=953;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ofaOcaFEo5VEe0WMa48AwttEJOkWIiAPj9t3Vq14JXU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhacq8k0ernJQldynpVkH4+/C9DtsD7XYg7AD0
 ZIdKR+/OMaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWnKgAKCRAbX0TJAJUV
 VpJmEACvo6w0RGh9FkkMI0Zg1pIpHu8GByqpiWTPHuC4mDqCj1Mm+V6BuPOHrYWkyUgDKRyuMUf
 YKeDR+79gzWCVzBvw1DrWxcRUnlSLoxO4vE/7aNDbIPGxCOxrN6vBQDeRYQ4Gim1JvsuWgc5Yb1
 bMhkJ8OQLVUCncisB807qIsygZEV6gd3yrHAxdcqGcj0RU/wKCwpq6uaXyvZIG+QnWeqDBago+H
 kJfsFKVTN2B5bbY2GgQXZvBdbj1KpVk1S6kjibprkGgb/hnPo2DTXpzV52KaHkja7RMKuXPnwqR
 HVFmuz5CPrBUsZhqBpQ6Zf1e6kZR3AmI8AMzsz77oiLYDznz3SQSfPf1gJ8USySn+1gKZzpAkGb
 7qjsqnA4BKBDob2XN+hZzH8Z4mCq+3l04vvKrEyWKqvJgfsHbtGG0HCaxm5KqpoMZcUCnT2T6YF
 bFCJmr2X3s/WxlY6Q9Dvyc9doAhK8accTeJRXEjM1uwKSw1UFZSzdz9M7HPM3PRQoIA+ztgrhML
 w0h3hkxwGz3oYUR+fLNqxKy13MSH+fGxrUgfFvs/XFvQdvbx8JvYtxTfmWpuQKx/b/EEmWQiuEi
 G1mA40ZmKSy00BUOF4qYh7fWKea28Q8Bmd0PAeMLfNs+8sdQlCO3Puv/4vKNHwtS3KIWgCXJGeu
 i87YXwJHHWiN9UA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfXzXBkX6OCWTiT
 JCx4WdgT3xihXyqzEncxt7hGe25+gvaVxaaPQrTZP5eGFWRLVvBXg7K7YpcqP65qaZ5dmmThWD0
 Vdaq3VhRBpj7JXmoH4wUbULU8Ywk1+Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfXypI2I3bajrpa
 HV687P+XA4pUohjWamQUFY+xkG4FBa6LNZFoBC4Qq1CKEiji7+3DqJxENrhwFBKnI4lbq22oI1E
 +GQRmE45qbzRdK3bcghTnsKZoH1a3nUihvL9iMNu0G7E2DoirEiHlBCW++34xNBxyzkbnYYVdPB
 BUZRsPao+ALM5Rv/zbclVoIVbJwg+e6kzwy7/KHA8Ta3uqBIhCH5tqyi+DZedawRF+A8Ao0tbt4
 IxCRE3MEJPL2keCETdPBIYXRf/MNvVD7HBVYH1L60rW5n4xey/+EumXMULT/Q3vEBWm6040RHML
 sAGhforoyqi8WJgRlK3FAPLEwfNYMMGXrxwBZVFknk7dUhFROXQNUOir80XCyyVGRqze8SRznUd
 jBXXtKOgj8rnltsKLisMnM9MOoAUi5tDgWKbk05Rs+HiBJILfB4Be9mmWyQ5OzN2LXxhZaUB6pJ
 K8dybNJkAoFB4fo/8lQ==
X-Proofpoint-ORIG-GUID: xgijjTNVQbdHNIi9_2M150bahfnf6mOd
X-Authority-Analysis: v=2.4 cv=bN0m5v+Z c=1 sm=1 tr=0 ts=6a85a75c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: xgijjTNVQbdHNIi9_2M150bahfnf6mOd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

The GCC GDSCs on SM8750 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index dd738d13df8e..cda18d4dc6a1 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -676,6 +676,8 @@ gcc: clock-controller@100000 {
 				 <0>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

