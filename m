Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C40E414A3E
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220573; cv=none; b=D5FBAYEbcHAfx2rH17GLDEAwDlBBe3bX0uyt3+WW645VHURDPWQqXRBoPqp1Qp9hYEEqUtUwG1w1YOCLF7Xx9zXPmPhLRgCWGT22CewBIdoRjEdG0vZQENvRb2StyWSbHdRsPkeYy+7lA7Yx3aZMBIMxslRP1cwk6prkFVsJuLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220573; c=relaxed/simple;
	bh=yuD7neD9j/pDEAzZX4NpcVwGjsPccvaRkExAeg7FqIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BCu4ChvQqdJ/iMENRlc2nH2W5311ZKAeQB/DSnE/jBbpmretIehrYfTpoFvmb0wJY48T2fikeg8+joQVeGf4z3nUVuBfWjohJOFF7rTLBvGfp7BngIiiQO+jT+7goPji9g2ZbxVXielPlia/WN6er2SNgXxBGQwpvHprBpHEt/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BK2+B54d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hH7R8S8Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BK2+B54d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hH7R8S8Q"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KA2ib12932668
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4U8SIimaB6KvQLvwqCKJu2AbwWyBV4HQme0oVsA2xHo=; b=BK2+B54dvupZZsTT
	BYixDRurolDUTEq1z+b7IJScAlAkzpJvBmC1TNs5025MuI6fCYeft4D8srZlxYSl
	8cB+eVYGRQ121XaMBNqafdKeDVdzDUmHfvU4AFwRqwEJZa8ViLEAFEUfJMojmFAn
	KbC97grjfqD82AReLwBaSwCNgJn8DSj3oJbeLZA2jxQrxRReUuFPmT/l6MI2qDw6
	6/jDtrzXLwuUibAzCQEHAuktvEI+3wIeM0aiz2fJzN5bTcBagO3HQ1umtrAdfxme
	ngLaJcLnMZhQsy+ZRoUczrvIdoWBq2Dtqtidn0iiCi53J97K3YHBITYWFmOE6iMB
	ft8AqA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg0g0uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:09:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5fc4c7e9so265145585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 03:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220557; x=1787825357; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4U8SIimaB6KvQLvwqCKJu2AbwWyBV4HQme0oVsA2xHo=;
        b=hH7R8S8QQlyDmQnvGASgvQQJmmNWa2y3fa1LlZMXw1ewPUbNAVkkuCNCqlU26gPoiv
         ArpFxCvjUvTa1/nyvBDB+UcnrfAb8Pp25DI9NTJTgeklONNteBI8HSqdi4xn/JWmaDjm
         x9I1XoSYczFNvtsD+99pWRuPK4wfbBK+pKLZZVvmXTZewDotWMK7yRKlqfpsdXYPfUBL
         5Bz/JmipR401wP03iC5W955OryPc4O9HafBtqFtC/ueJDAdsdyPXhNcZ9ZCOlO1ZPGO+
         fKx0YhZkav6hUCimLpPKmRHUAfexVkZ6WsyFqouSBY0QfTAfUgomkIFEpHNlYzkXdHM9
         M65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220557; x=1787825357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4U8SIimaB6KvQLvwqCKJu2AbwWyBV4HQme0oVsA2xHo=;
        b=TSFn1M3K1Lu24QXDFOvvOWTkcOZZGwWul9Fwrtl4T7eJUX0HbG+iO/8p8QP7GEuVGP
         1PLsVy5k2mFIo3FQGeGkRovlsC62MkPpp03T0Odt3iaEdwBqKKj4sXISt2Y7Osm3YfeM
         QQ22cJLmGuiuPxr7QesuG72wwnBXLl9ldlmpMg9pYb0anPtrecJtR6Bn2JAO7Asz+wU2
         o0OYenUdL71q2wupA+wt1tTGSxcCAy/ZuTE85wJdjXnA7KD0sM/DcdFAbDiIT4X7jJqQ
         roB9mOmRjSnP6fWd9bu8rf1pa58Ys+CE5xtP7Qsu+2FqmwTI/ysn8DtsBUToE2GuL+vf
         scCA==
X-Gm-Message-State: AOJu0YxYDg1x2m2sFtUP8jzKrnNOuGdGo/JQw6ufN5KR7m4nct8Q9Ojs
	1lvHY9L8AvrvMCMfcuv9/rNv5eRVgRm1McXY1c4d1sLk4gBc+08SCoZJgg8gKhYRSzbHoeds596
	AoTGDOwXmdquPUcYdkD7vqr0qUzLq7u6pJaXmqzFjq0HwYHK5+OkLRqprOeg3n0oLkwqK
X-Gm-Gg: AR+sD10a61EqfB8EgUKDxypSo329/Lwi2fK8VMe8Kk6yVZjifRpg/+nD/SGWaou3Alv
	JniApyl/wq5HexKWaXxoWrf4H04Kt6kvcoFrJ2TbWU0oD22WKHSoohQVMGa7nLzBP5Saac99ZjC
	T0HCG5LFJvpubhPoajL0Q+IUbCaZLX29q2JLqzoUeKfWB/kxS3F20QewzWyNLIzQXURbuyZvaNa
	RgSR7Ysep5PHU651QNpJJOfIlCIIc00W92337KuXFajbg7XsNplkRiLAsXuJ/JI2bumdrqSK1Jk
	k3sEC76Bk8Vg9T5Hg5qBTm5v7K8GR2ttobNQw/gywxXVJ8zDbJmHs8e4Fr+7t3opg85r6sYkQnx
	lqkLYaErM
X-Received: by 2002:a05:620a:2a07:b0:92e:e559:fe6b with SMTP id af79cd13be357-9371e2cfecamr1031510985a.7.1787220557341;
        Thu, 20 Aug 2026 03:09:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2a07:b0:92e:e559:fe6b with SMTP id af79cd13be357-9371e2cfecamr1031506385a.7.1787220556774;
        Thu, 20 Aug 2026 03:09:16 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:09:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:17 +0300
Subject: [PATCH v2 14/16] arm64: dts: qcom: sm8750: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-14-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=yuD7neD9j/pDEAzZX4NpcVwGjsPccvaRkExAeg7FqIs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtIVLpYIxSBIEuiQp9TZbk0CXTvDRPRG8Tp3r
 TXPxnGOyV6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobSFQAKCRAbX0TJAJUV
 VkvFD/0TrOKu2iYWL7PYb0LWC5qqnL0zbc3LUhTHUOl2ycftlYj/mKiPgpRclzjs1DxdLMwfiIR
 DskXa+uqg0zl26mSPkVK79VD/mds09ihlRFKGwpsysfPWIn/GhzktOu9wprZ+IxJyaLmeOqQiLn
 GfSkhLaPlb6QaWu7fgBcxSBOu50MW0y7lJSelNYMM/FObIqiv0BvpuValrG/wwCEMticcUe9lxI
 7aQv4e8e9I3kDul50cxDiEX0smLhDbG/ubrFmkXahwbCNFk2cXX4mMyu8jTPBzDnrFa+zXPi+Lk
 R0o3aBeBSPTjx8VsWdFIRlbq57o77Di3GKqu4YGZIW9vi98+oAXPA16MIePDW5exuEwC5QyhzkV
 E6NnwhabQg2WlXtbc70qXl4QfIjUqiwD2+FAzMUteBufvfZooEbvYf3BkCUNVxFHZXLVJVP6uPm
 stp+D5p0svW8TgzEWj+ppfkiiRBcCVmotad+r4EXR+CwIq40D8dfgJdB7eB7OUoi3Fvx1ciCF+H
 4YgP30zvrAmt9WXtv11kCyh7xWoAi4lpTPXD/ZfxpO5iTn7QowQbXTCziq+CZ6riCQbM0TY1EIK
 NpKRzPfuhWNdfYS8EGGK1ets7y6FrO5aP+EIvddgwhUiTB+2LVJqy/pgLyC1eqCCatycSu/JY03
 dJjmTYFe+1bvckw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: ZT-YdRiehmjjzjQNVvZBtoarrhZ0ERJ-
X-Proofpoint-ORIG-GUID: ZT-YdRiehmjjzjQNVvZBtoarrhZ0ERJ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX7UeqFChzb9b8
 2YphPkqt/yx3cLDhZdDR+uetgT9nnh1K1gmOWlUQZvoXiT/Eo/2StVLdn9OsDuZD+Rn3Vs4eOiS
 UI1fRpr+ZTLfrO++1tRk7CEZWZEQPEBVYyneSFW+R5agY4nchir0x8j2psazoazsMZj6Xy1hSpu
 X6rrhe9DtY0Hfcabt1EC1hE8zTUwpOEhogMTtiWFBIQh7T0ar+JHu+cZy3lPMqMQAZ5OembGeIs
 8SiVP/OM+CBuc/+quXrFZIelJKx1WtvrJ6nPvINIHw3JiuX/LC/vz6teIt+SZLSW7GeLECBEiOM
 0f7B/gdf9Rxn4Agj/+9sRxtMCDGCdZSwpTUgu62xOHDHOH/AjTl20iC9SU79igzLvSlSxaRhfRv
 Wg9gykt22NG5OzS3/hRfg3zVP5etmL3cjf7va5Fzun/lF2Qw8n8iZcpU+vWeuK0qJPlJAnRFRUS
 Bw2cv3uEp+0wcSW9HhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX2s07sAkbh+Nx
 +ou41m5Ghlh2DA9n/3+//xyV6Uu5FR8ZHBg1ye2D1oOAuIWwnDdcE9+hrjPEHSu4kiWLPu98xon
 ahqCtrGMJa6RY59HKXxqdguXAgRgsoM=
X-Authority-Analysis: v=2.4 cv=JoXBas4C c=1 sm=1 tr=0 ts=6a86d24e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200074

The GCC GDSCs on SM8750 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

