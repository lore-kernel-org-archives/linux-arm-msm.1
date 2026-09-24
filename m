Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24710493656
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246524; cv=none; b=gqnSw+LgBKN1cXEDvwIGv4pOEFs/0MSIQp84TcWX4TaVyoRf2s5C19YCM/UnZtI8Q4xlIeOthFOuNoO7q+QxtQtnZwFIOVQqkPYc//9lJoSWksH148p1mvVtVvLfHS1jSMi0cCNxTvQHrDNtAFZAD2bmnhy/2WLpSjzUJPgeICM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246524; c=relaxed/simple;
	bh=gDMpFJWapcnhBZHow5tYWj4u0/ni4AXCm1hEuPmwG5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vf9dD+g3t4NJT8Ia55J79YhcJ0NkmKpSjRoX8G5lUbMNJKdSPR7CYw9WAzYpuLWrTXJOE/4eqg2QfGiYW6m31qUr/Q1DPKF3Nk6Zfouhex5Tql692WBwomX5jeNTjxADCUQfRusiYBFPeH4MyfjY/zRdGLGJQlcutnjaR19g2G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JqURI278; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WnpqbqNl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JqURI278";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WnpqbqNl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA5Ltn1175616
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBk697OcXRYhQ5p1XM5h8Xcl5jMkWBXjU8/ArCjrsWQ=; b=JqURI278bv/0uBT9
	p59UyQFKziy9ZMF7XbQjTr7hTnfbJLzDD7VQsI+W8hdmP4Fl5fao4t+rX7fS4n2O
	zrRWEuwXCxMT7pEFcCex1zLI3HBJt+f5kxcrit9nsjIg5WSdCRLSY0x0nnmsu2gM
	n4HSxij9cL+VL7Wj5M5WjWPx10XRyLjALVgUjbm3TwqUF8yUDVqV2mdv2ASegDFz
	Aaoz/Q48zAGWQ7tCtYuNOM6sq9T2sf2qzDPqrdIWUHhH/Yv0/r8VjqHZKMxiHVLz
	9mfW7CNQdz39ewV0HJA47t8xENs271WLK1hl8LrKyiGd+0Ykaaqi4k659xyzBWoP
	7OWi8A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7r49d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:42:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ae8e7e546so340018985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 03:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246521; x=1790851321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBk697OcXRYhQ5p1XM5h8Xcl5jMkWBXjU8/ArCjrsWQ=;
        b=WnpqbqNlamKLxbHJ3DDNe+U991r5B4Afd9OXDCwBsk1X2tO+nQv3zSlkQbe6dpJI1f
         W/jkmc6USkwiwUYAHVmubfYrEYTWElITE55JydXiT+3deaAzaunoiIRo7j6nIW79NnZC
         b9uhs+GX5UQXAUBXQpoWPTuIeCw9tm+WM6KVxXl17i094PAoUE+sZMMoywo6hIxi8Rib
         BjtOg2s1cn2DeiE6bnapWaRZQkqtkfDjMy6Bstk7eB6WF0DqfCYJICami7KJGZWlHiua
         VIzzDQgcf6rzNOrBCqvd6U+QVaOabP8u2mjxCd3nYVIR5mxPb3I3F5pJm48WEXa4QC2b
         0BLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246521; x=1790851321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBk697OcXRYhQ5p1XM5h8Xcl5jMkWBXjU8/ArCjrsWQ=;
        b=iuM1s24ftta1ptjDQy1rcJvzJnzkcDhUXMj180mcEgmcMMia1Pnb+9XO/XFL+20Iku
         kflcUyKA/IB7hlJXV8ROcfwU+P0rakn5Yt9CbgHz28rbJKcOUACq72DpqnUtFXCiSkgv
         DqByq4+9NMCYHulG1e0TWazt4i3zPW29NQEwfYbg538U4JllHtcJeaVzNfm2TD2XM3i6
         MgtoMpYgTp/A4MX8TChT8Mpw6/cFxiYB+47rD0U10dQLXX4IdLxLX+mjL1BJNEbBnMf9
         k4v7xAiOGBouLBVmy8quvvYW0o3kFs02UKyemVXUEKQjipSW2TyibtSZd9vLmxkTQ7Ms
         exFg==
X-Gm-Message-State: AFuF++mM/bhtNrZKAloZdUf+ZB5Bw7f0Y0IcKvLnzOWNSkHwucsSviup
	V2GPQTsxi3VsswPiimSEylQZoYMQukJfQO/ooL7ctNm/YCxCyNqNkUeltabfKxQNmIshENFDUQw
	nj81/nMkl0eFf7ZNnWB0Vt1lvGzoiN8tNDPp4RLgnPZ6envrADQ9Unqj1+FYkBufz3Zcr
X-Gm-Gg: AYBFou2fhwOidgxB2xpcAKR8XjjChpYj8soywXMYyRZHNfVYhDU7aIkfTBP9wCq6ra2
	SbkU3jk11OJphZcnw09j59PO+IZ3oJ1C8ITiCKfGdBOPjTy34r+3zI/0R4ZM5s/lpvChwrEpCOD
	Ng8aQZ4F1SNnG/wQCUSBw5EPUWS3QsIgw2BQzfykZes15jpmUbDIi/zBl8BRuYZVMYUoNb5TUfL
	c5GENx5lOfXiJnGv0COIONWSoesZKkB1vxaR5LDFXYR4iDWyrGMXZRR/LScCLwqElVydBSAAOwU
	/drEm3sH3oNKn2BuYJFVjNZITlG2bFRCfcl/HaWqBtjmHnRIx0GjokfH3FALyZ/wyG34qFXmUkp
	nRlGhgluT
X-Received: by 2002:a05:620a:4150:b0:93b:d79b:9a54 with SMTP id af79cd13be357-93c363fbec3mr221544285a.53.1790246520955;
        Thu, 24 Sep 2026 03:42:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4150:b0:93b:d79b:9a54 with SMTP id af79cd13be357-93c363fbec3mr221538385a.53.1790246520281;
        Thu, 24 Sep 2026 03:42:00 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:59 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:57 +0300
Subject: [PATCH v5 41/42] arm64: dts: qcom: sm8750: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-41-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=gDMpFJWapcnhBZHow5tYWj4u0/ni4AXCm1hEuPmwG5w=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP4B70YCj+GEb+sbfFfcdVeUcqszN8HuMKxxu
 0yOJbqeEnKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT+AQAKCRAbX0TJAJUV
 VrnFD/0fKWKKs6Gd4KZiW39ygsxEMondlD6DHPk584actBuROJe0aPaX5qXnFmd0TqR7L7I34oD
 IJeE2tNyse+AcZxucaAXW/IJGXA+yT9qoOD8vV+x+Ikfx7uVyWw0JAlVQY+xj5VDLpvlYIOJbz1
 7No9+ntqAJ9cldmBw3ON2xyu4BigYwScZo+XhtPMntWp1wA9gfFFLgT6oJa8QRwTr+XsWBPUXUZ
 hYe4LDQO/cQSN7xtm7u29v3fzZV9J7FKpkY7KNrJIJrJJXdn+XBW3DBZgKUa0MRcJbNJ0/Tn6Lh
 w1CFG40cZ0lLPZV1M8oNyQdfKW9yOcETl3NoQ7t4JL1uyvjBKrfWaWyzNIhKljQ87Z7YDQHhdKg
 FLMcFHfJR63sfNE+DSf7L3uHcsEIIfMPOURXXMatvtqPxF6I9EFvPGp0eKVUQ7RWOMS6m1oeRSz
 st/BjYDdBB7jG1nmy0MucP3a8wYPjGdMowcuubFQrjKGYXXhzyKaqF0JcEixUnGo+KpxuzPsLZJ
 AfPEYeuzUqfhVP7AZYYgvn+zB9nIWi2ksxrWwBRTT6WOaQeajcxsTsKdyMI4Okk71NBj33nRYvQ
 6G7DGItf+rlhiURJTapVAHcxDr8lXWUcupQ1cNDd81Lv6xdhppWMJs53idskvaO3ovSjXXbqRKt
 OR5kl+ZeyHLt6Qw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: lePyCz4_vIcmHhc_jM6fT7D3fhEbApY9
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab4fe79 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX5lVfk3yF0EDZ
 Y2kimjFu/jI+DlwKZQ54fmg0cdrOKrYfWbweG5xD/ARCNKFgDCom7gNvgFjSyqENQDkmctFmeP3
 2/iO/Cn8x2vt8nlKv3FxaI4FDGXwpbKEXnOsuvIP1ZtYjkCfrcCzfGL3OVg+/4H0UjBjdl/jDvJ
 0xrWjTbJKgaxmJXu2AiNU23OSk++Fhobq3hQgrnQha6LhCJe1xbOoqkHTAmCXbbcBy7apsUoDmG
 /lFsMzjgB1DeZeJOSFOfA5WKji5V03DvBGYEsRd03nmTLpax8RpYIjOMpljDo0M1+4vPU+JRXVE
 55HgL4Q0sa0B7m3LkyleEWRJOz8YUVojM5hwKLO+NnBvkTHp4bQDErwlitcrUjWa7NmoAPBB+OK
 Qli3eHQjQd+lW3dE2U580eLBaUxQX0DaXPJfrDSWML6w23fTstUwACTah2M2DxGQzXT47FqEKjF
 +T48w0P5xglcEq8xedA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX6ryJGL7wKu5a
 Nuqxx7InaKSrlT/Ye4a9WY+HjOeKpgdG95ebChfo3qABog+jQFJ+4erH7MxDS1WjQc6D+ox8HRp
 tVu8VLmQO0/5px80FxuN6DRh1ueOuUw=
X-Proofpoint-ORIG-GUID: lePyCz4_vIcmHhc_jM6fT7D3fhEbApY9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

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
index 28cf22da854d..b9e943afc510 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -677,6 +677,8 @@ gcc: clock-controller@100000 {
 				 <0>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

