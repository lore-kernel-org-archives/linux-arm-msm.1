Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB023488234
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246493; cv=none; b=Hbi2R/HWcDLy05TWDhi/6UtnNq7N0kkNcSvzJHIv989R9W/Jg7mJLE1JvIr19hjvnpgj2fprmw5xO4kLexvkX/5FnSY9q6V5vu3pD8EJQC5zD6LQlChgL1g/Ig04kk5edXmF/xRH8yx1UJJMlOnJx3tGu6c/Rjz8YvcKtuAad9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246493; c=relaxed/simple;
	bh=yQHDVatt72dxAqTGiEP/fVb8h6kq5JRi5hP7B73zVGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BPNq3Bx1C6KTgYx6So1um14EbHOpSYEYzhO0gTMBlrwNGkYR4uTrfclfoSK6yMSrLjjNpknBuOCG0mBqaiyVQzIT5M/1p4uQaTCdDRSH/360xz7cQntXnVyqZRvxJUSpVI1A0xfpAM6kVg9rnetHxqN1gcwOqk7+q8FPVn0p5fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IRuZJpZD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APMpAWIM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRuZJpZD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="APMpAWIM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA1OF82857938
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yaQDj8IK5FlNVRz3fBTcniF5ZIYoAPkZqKgLTw2UT1Y=; b=IRuZJpZDpc49/oQx
	6rMU/u6YrG+yjJC1u8+hboDA3LjpLmcW+njOUmsAGrqbomebt73ZrJQMlf+GwqiH
	RnFWUvW5w1TevP8k/DHjLGTgKcvyp3vVsHoZXnpjHFcVt+S6nUcukCeYAUVlyPKJ
	3fb9jvRdtsR7Tk/nYeej6rm4WlqLzv2+Q0IWDwpxG2NIujFeVz6Z0utE2O52VBlX
	U7Y25bJn9oino1oECv2Wa31lCa3ZTcAbScbILzHlcajKggxhl9/PUDWOSPxh6bmY
	QDxFFVnayh9Ve7OUcZOAj/aKs+RLuVjzf3t/UQUBnKSX4TzBF5u6hiTcrir3tKlh
	ps8NaA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1rag5a6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1de6d5c3so380497785a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 03:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246490; x=1790851290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaQDj8IK5FlNVRz3fBTcniF5ZIYoAPkZqKgLTw2UT1Y=;
        b=APMpAWIMb8guaIc0TgTI8ZEjEmY6jTrqH0d1E6JLRpXFZvcBhZraq+lmVPFCKoPRnB
         oHkweUwoDehKmTfYDi+iaYUCmOtv3oMutcB+HwfkRE/Rbpn4nhLWag+sWr0QszoJjQVG
         NI4J43jO95CWfAoRSVer/+5WDuMb3eirBzNJMR1ESn1gXAupJbhpoKl3LGkHRLc5QciI
         sHMUE/I/O+lV20T52fHc/5kiV3cWseUet9Mg3HMWc8gQnvbIdXHCpFRVEOdK3LspgIQq
         rn667E6JdWzTEbinhYbnIRq/D+J6s4ABF3U2b1akMAS+FxTG2U9sc2GfFPlRXyrtqNWq
         oo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246490; x=1790851290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaQDj8IK5FlNVRz3fBTcniF5ZIYoAPkZqKgLTw2UT1Y=;
        b=DvMq41lUhQ6PH1OpdXzAQUcCgf3pk6sGP18DgO3IWa3PzQO+J7c2J8ghYBHzCQLk8O
         BY1vhYGz7kcryw6ZXnFsrH99ByDZyoHxqE11SHWiJYPnlaII5NDtT7qw8YKc+q7p8+SD
         c9m7ketvvS/rep6GJdAxcYR+KaAqK3EY2RApXC6UcGvukEZIDxz8g5LJdSGBPOFd/nGF
         rjrJuJCLN2GdW79wUSjE0lzGNNfgetCza9KuOAhX4b6U4i7Eolanxh71YQzJsrKquKL3
         xuw6nJXjvEFFnFNwiT+x+u+3kkIXTPCBBeEacurWGVuwjoIjBk15UhBKXnPqiXEwzprl
         UQ9g==
X-Gm-Message-State: AFuF++lJB3Amg1yMGv1qZBrD1FdV/uKtDMAHVHU1nNLofK7ic2M8B7OS
	R91oeHOkXwLmi2aCeNHWbQXZgZ0sDT16CI9FJ6Tgu9FYjOLZDtNvZxVHIqbeKbfdid39QCG+FYa
	hXWkItyR2KALinxIrIlGGzAbQPZg/zs8/NByCqgW7ksVElUChu8Ija7/c1IieUlJPepU2
X-Gm-Gg: AYBFou2hmLqI91HvdWIgl+OBpDWrupkAm3cNrHM0IdYTIpfz2vX9ymOhylDFFyLIpSf
	55WPzkI/iuo2o3I53la9RgAnSi8Y9pAW025zxRRtYHJKs1eekGMnWueKjlIWs0Y1crRJrpfDoKN
	ut9XLdTRQoK337MHHK8P029MCvOpvd1Slsi1g1wOLjUvkS+qe5YfakW6g6tG6urOlAL2LzB4Zax
	sM6H7HzQNvc6hM+hezhXFuVi4psDewS7br90ZXjQ7BrHvsBQHX+Xd95+Ree8h11dkbQRFQgfd4d
	i6qDWpdO2TZGNlhE/NJ4PlIR+LiWHkWA5iQiV9UNWmOCqqPKhacni/PRfNRQIq3L3s/qXeP+VZY
	1Mvuq1YHZ
X-Received: by 2002:a05:620a:6604:b0:93b:d79f:d949 with SMTP id af79cd13be357-93c36428079mr213858185a.62.1790246489789;
        Thu, 24 Sep 2026 03:41:29 -0700 (PDT)
X-Received: by 2002:a05:620a:6604:b0:93b:d79f:d949 with SMTP id af79cd13be357-93c36428079mr213853085a.62.1790246489143;
        Thu, 24 Sep 2026 03:41:29 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:28 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:44 +0300
Subject: [PATCH v5 28/42] arm64: dts: qcom: kaanapali: Add GCC CX power
 domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-28-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=yQHDVatt72dxAqTGiEP/fVb8h6kq5JRi5hP7B73zVGs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3150VKLVCnGh5T7vQAYhZlzOGSDYW0slUy2
 mCfhq9iX5OJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT99QAKCRAbX0TJAJUV
 VoG0D/0QZ91uGvffLXiLnx75qIbQIeYQRIWsEakjq29+AAiJJySYhir+59JUdxeLK1XBAwEpmLp
 bPwqJQhgWCP4Tza1RFbwZjElJa/lKHwo28dZak1BDE53Mo9Hvxx2MZw+MgF/gepdF0i8oUJdVk8
 XlX/1sVw7l14kxU9G1sZ4U+B6Rd4q3jNRAacL/+IIYmTjqS+cULobdn+IBpbhA66ONDEihJJUSm
 d2/aPqAU8yyu0B1GXZugpix7ZImXaqTVC9Va86lPRibif4iJGQKI4nWDPBwQsirofn+cDmfQMMg
 j/3wSjiuctKIimhcYCmP5jcCTD62965+BFdcF0hzVn50JteYjgm8GiLrko+Mxvfjj0F97QEW8uh
 5ODIoRkz8SXO4H84fGpAjmxCTJj2rdjsQgsRUz/zyvtsc87BMjL0wl91ulm6J12dxK6290tjZc2
 prytt9VRgsjTH0vntspkWptVFQY+mr86uI+7HE7LBPCOBLhHOSBPE/UlczU9HgXDQM/rYAL3uQN
 J0h2Fjr/7BrA6X+i5ES062fnzGiuxYXFZXFFrBzw09QJjhzBUceZwHm87OkCro3xWHYy5BLv2sj
 sX8EBHTxLbDiHltGJsLDuQFLufAufIZZMKU4PHafqJzSFwPABW8OAkvDmtWa1ptA1taiTK133Q9
 yksVKa0xYFJo+cA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX+lLHPC66J+8Y
 qKF+EyM+RELwjODsx9hhGPozXwVP+D8/xRumT6meIJDUoAMdIMQFm5J5UYgrq7EbAt0J3otW6ts
 Sk5A5oFEFAA6TbewmppTCz44OwNj+oPL03u8oyCTz7NeOi+ItueGyB/4ePF3it/45HA5cZwvHs8
 eTQbx1aoK+3wiDnlAqOF8mLHgWvY+85YxOZhZ9Vs2Oxe71U53e9geGEhnANX3N7oTgs7cEHv/10
 FhwTOlKXgk0hhy1TCLDF9uUMPZ1B0jd7S0CwWJC9u/7nnIWvhGS7jcHBbY7OzIB9H+WDd6PZcsn
 ksXH2ttIgPFCZerfyyIQcf8aeM/Pwe6BIprvA5ww5cRmlM4ikXwFyGLAO/YzTKoQCeOGCU9GOSU
 8+5e77w0qFdKYXnzePgMb48kKscEWkqrLqeb4SrmEsZrJiAyzJX3EFQegSK0i3GB0DGQlENR2tF
 oRZz2rJe3em0Xct/Ekw==
X-Proofpoint-ORIG-GUID: l0-VS36eF-ijQTP0rN5que9BBs6scQCx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX+2QFUQbTiGGE
 1uc+JPAqs3resg178+MQBF+A9cLp7GbWZxU0zYjext3de6ylYGaqpbF1V2ADR6RBcl4n3JZMDD4
 22tqOtN8pfBs+UVeHTB7sVLPa6HJ+To=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab4fe5a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3K_yQeBcBf-sZL04j2EA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: l0-VS36eF-ijQTP0rN5que9BBs6scQCx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GCC GDSCs on Kaanapali are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Fixes: 2eeb5767d53f ("arm64: dts: qcom: Introduce Kaanapali SoC")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..c1528cc8b7b3 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -552,6 +552,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <0>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

