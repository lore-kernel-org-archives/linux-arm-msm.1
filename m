Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F18D48E0FA
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246511; cv=none; b=iUk3/7G6qa0Alrol4dTG3+Yd4nRbmCavMGRwlqJ2wF+EJUVmy3sigTZmaVx3SSAutNF09rm4LvijGbAq319zF94QKqmwosIDcNvqoctWXFtZMDG11+3cbYx+xuJieNcZVs4+ukObeL5KjBm5mecPB0HdHds5OGTWK9Cb6+8Y+rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246511; c=relaxed/simple;
	bh=F80H9I0DjUCTxp9n76OgxJurzIJXm534S5e9STO9TtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T0I2WhWep5eQ27pUNu5e2fG9otFcU0h9OvqbkpftbOCA03W5PebsdNQkUqJoqEguh6gaCPDqiFM6w96/4qtNQ/3iy2Gsci6KblTdlaGAvPTIgGNybTfDEMThR6P5sUnIbGxI1WRLDL+zYuMaC3QhE7k3FBR0jWGEn2ZHEXK/874=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=COpumCkS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hk0jQ5rF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="COpumCkS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hk0jQ5rF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9Pmij1644174
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKmhlTgx1VIL08aqjbOIr72fw3Tnkf2jNo721b3IBJA=; b=COpumCkSp4u1PEnp
	KcPh3jCAkbEnlMJEgwNhkhPATucvJWnUJtJYp8RP5TgjEArxwPusQWdF1Ro9pp/Z
	b0ZAP/TxoT2SdFA91txWuenK482SjxTURwGE345pPRVtTM8PZzyHRplQTzXFvh/3
	mwY0f/d6Y3yyIQcIct3SUZFc+8MGmQK0wsQEHa7INNcBO2nm+1Lzop0RIR7xB31Y
	a3CVJLIOcPmr+AO/5FhSwOO+sR0HCsmIeITCqrcpQdX6D/mFSDbUeRYK7VQ4MgC4
	VEprvW2wgvMKgtfzSsNNFbsfRdSP7WfgLgbPgPA76QEjERWe147jtMplgJwtHdC9
	bBBaqA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrrb44n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a3f673221so452245585a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 03:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246507; x=1790851307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKmhlTgx1VIL08aqjbOIr72fw3Tnkf2jNo721b3IBJA=;
        b=Hk0jQ5rFMWGEg5pgkeLuDqnxpGISuRL+U822cfuIaVgJKORYar7TLdJqJxsyFsXNsU
         B11Z52lfDOK8ycZjIug7lkgZHOkSNxR1qvd3azmqiXKs0Fa0jLK+bYhc1fCM8BcUV/WE
         RFX6FbRL/Cw+Ha6R4RFYWfH/0k0zYQ1xJgMzVbQrb/r5O6ZlGm2X0BTHJxxTp5mi7Tsm
         e4VmbKd7tp5rqZo/K0aTp4H2zFygxaBRmtvrde8QXuVNUJ2I69C3SOaUcWJMIcyno0gA
         IAcuu1+hJpuYb90FcxvsjfHNaWiuhn78R8xNWohPRZtSvUlL97Z2bWRD5lWcizt15iz/
         uWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246507; x=1790851307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKmhlTgx1VIL08aqjbOIr72fw3Tnkf2jNo721b3IBJA=;
        b=vHH3bFJrMv3mCKJxVeadcVdc5cEp6i0esAAlC5Yf7kpj0g9uSjFPpyvq0nhemL6YkM
         WyEHwCiwwSZkObFu2zVq50fay+Lf1+rgkmmOKlVVMwjss/e9KWXY+RnUgRnJGxKbflcy
         WQRlSI7w2eK6cFXDtU7HNw86rTcOaqMVVMTL70+auYF0tPpjLe0nhVb/sBy3ew3A57DR
         uTIYdl/ObIraURwpHnfTWjRiptBpzf+o6+QMMGg313e5OB+4FARD9KvM6zMXIveV/CwX
         JOyrSkzL4r6NVu/Z4Z/cCXc3Suxc4vGphK4jqF+ectuO4ymhURLCA7/fAMGFqsBkVJ8i
         mWvg==
X-Gm-Message-State: AFuF++lOJ0GJBUbCl5ld/VEgje5Bh9xDyuwjwo5ZVxpg2rwuRzP0iDqJ
	4+nxmwR5sIAIIm09MobQHqoTE+yGgPkgUGJyWzRC4BorRIuSc0XDzzsawEbZHn05RzHS4lfbFAO
	UvIF1+X1HCakOpPkRvPdCwwyW/mAfk6o9sOJ2Z9IzoAAnDvjhc2tSqJPBmGGEy+AsgXSw
X-Gm-Gg: AYBFou160GnmaaQV+yol0s7PfloyAIZzETnZ/ZMmN/LRudccajeIuuvQYJwrNMf2TUk
	Wo0vSuK6x4WsS8GQE2tLh5yncI1lz20Z4NnP7fsoLQncWBfnCF0w8NVYeBPPFDpb4aXnGux7cNO
	ZuZINlTvjMF5X/FCxEzg3kdlb7DzkSm8mr0uFSG/JVs//CR103Ny93aSPSluwOBqtIjFzUOwN5f
	l78tEJDK0UoteQRrDBYBEaY0JiBDUx+W6OSMOIWVrOirnmSbb9jynxxhYywtGCdh4fm+7B1CEOR
	ZR2XwCmj+x3wP+Em82XIpP0RzI1hLW0HaYmE5PxCoQphBeBkyRxh/kfv187i815L314p2jA1+uN
	I9CSBT+bw
X-Received: by 2002:a05:620a:280d:b0:939:6dee:4b09 with SMTP id af79cd13be357-93c36402e34mr222376085a.51.1790246506556;
        Thu, 24 Sep 2026 03:41:46 -0700 (PDT)
X-Received: by 2002:a05:620a:280d:b0:939:6dee:4b09 with SMTP id af79cd13be357-93c36402e34mr222372585a.51.1790246505921;
        Thu, 24 Sep 2026 03:41:45 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:45 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:51 +0300
Subject: [PATCH v5 35/42] arm64: dts: qcom: sm8150: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-35-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=932;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=F80H9I0DjUCTxp9n76OgxJurzIJXm534S5e9STO9TtI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP38tHgEnFYmeZ80C6W1eI7BUPxyd6w2O8mY/
 d9FPLw2l56JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT9/AAKCRAbX0TJAJUV
 VsreEACWymk6MPjaJSwfX6V2d73L+XAG1cSP+OKRLbcDZt1eblcCJScw+6Csn+mwq0G+Avc619t
 /EKvyOGgEgt95DoVcjHIvmJ9BEB5iKpvOcCsnaUOp0gPcyc0nRXxmecug1bMFOHWHdDTN1flb9c
 2Z3OpXLvJynNBWVu6KUgwOhJEBcYFZI5GjntUCMo112jvv/n8Pp6YT+JVT6nkUj/gCXLbLvbrRG
 liQ+ULX9oFtGx7YgjpM19ExAkNx+S9MtFTQ39n0OTYSz2YWtaA3rhYJr0WQ62lJT4czmYgvGJBt
 ER0cgOojvv3S2VCbJBjiIZBlYdjyIwZ0oIjSYDGosLK7imQqXGrgredbD0+5XaVHop+FiNnOMSF
 dw9/CGv4xBE57hYvQpMCJVx6uqYK5Im0/CIfBGPdqMh/clpG6ZfcupWR/i1qDTdMLUrxufJsVcn
 FAKeItDxX+lxdt6ebSns333Y8CVzERmBLA73F+bs4WwmWBOBdjP1vAkkA5dJKoVkh2u9N3jgbuf
 QBvtYPOKWN0JB5YLFZwXIl6d1LWHh+XW6gk/iQXhi3jI7FRaKAhH07zS0Nwi6UKRTyTUMs5SI5L
 zHHQqRirIwKzL0s5HUlkja+hD8M9TUVugr+kL20NMcirZdSh2LjZrs9WEyC/RtNStj7wjEq2kp5
 g8J1f0mNpOb5x+g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX7xsjB9UVl/65
 OEI05jYlcgIGPqlfKj+/InxHHOccZoHVgsnqbUe9LWZ6xpZyE6AmXVcSRmY74orrkNW4RVW2YUV
 gFWGG0ZHy9xzbVJuSrYLF1N9cCF0jSqYV2XQaF/H33akqpcD8iQkJRjROYcPZxKjb2sp2YnQ+ZF
 kTEakH6u5rQqMqDgUzYRdVd3W4YRfHsZSLqd584aSjBBdYEAIKRKyVBB/Qfq2DMX+dDaz/nLq3R
 8/gB6ENJ89YgD+TKSneVbiAXRjzOSeEUEMki+F0sZ0U84dudhXvStAyGQ36FFzactu4tRZXdUmF
 NFCHv0/A+6pufbO7A9n+7A9NXSnMWfzZNSHhCLt3QxJ9TEb/IxlO7u36Ncy1H2tc+MoxmSz5HfP
 /oYDwaM3j0uOSQxmNMQRXSfyqCvbl6YdWL26z53PSPO8tPEoQxUjfIqDtEvVMttnaWraH3C0F2C
 HaBc3YL6tSfV1NnFEvQ==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab4fe6b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX+J3S2ReEO5bq
 4jhhPbSxUv02DjgaT+4RdSYee73Hd/RHZ4a4jyWmzS/62UiOQO4ffTHWPnw1MY4bnDPwHGd91Qv
 XJzpsElJ0Ya5xS3bVW5zNe/jYnbe4j8=
X-Proofpoint-GUID: SF1s4R2y4npuk-SFUqZ8ALBpfv4MwDud
X-Proofpoint-ORIG-GUID: SF1s4R2y4npuk-SFUqZ8ALBpfv4MwDud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

The GCC GDSCs on SM8150 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 94a3b02cb289..397c0142ea57 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -913,6 +913,7 @@ gcc: clock-controller@100000 {
 				      "sleep_clk";
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>;
+			power-domains = <&rpmhpd SM8150_CX>;
 		};
 
 		gpi_dma0: dma-controller@800000 {

-- 
2.54.0

