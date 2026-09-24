Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED234734C5
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246508; cv=none; b=s6/dh8EzR9xY8U5Qhj1jSiJQWx2sbxi81fg//vP8DwITCx/WXEFw2KsqSgwcPIWQHhF4k110/VpARyt54yp/wQmD/bBCx4ddXD6BvtdL4osVeynA1thtutOnX262XxaRj+62G76UjTbzDSurYNwigSUi1kzf1svDGP+Lb3j73Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246508; c=relaxed/simple;
	bh=kwmZWbieObu19HJwMat+En2+qUYDIaJNELdrcvjW9vE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iG5tghD6GIoIUJbiK4QsfJYds18npSdkwCzpbW3L62sNWp6lrxWUGNGCFhjApN7oNhpNlErNHF+23b4tS/eBoWRs4Et9PmA9ChwJYgqh//obiiHDwMco+EEg3I3XEdWWjKTclFQOTH2A2zs/DjHkR3nLpReMILruX53L0GJ9jXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hOFXrCxa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SPLL2QKz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hOFXrCxa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SPLL2QKz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PmpX1644199
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X9udNqzS6075n4aY4trAVywiFn4/XhY5ESNd4vQ1FkA=; b=hOFXrCxava1mlHWy
	me2wQSPeZqU9wiTK1MxFGBJ7gLD4AB/1GBlBFatQFUjxhd3fwyYjGOrL5kJ+L8A8
	g8YldQKBKp6zyD/iKQNDEJrOavmZieXJ9uixCV9zZO0CDINw4oEEYzj9+ZW22fYk
	XZUTHgwZ0EfSjRFj4t6egBJESwLa0WlmhnZOs02XeLxjuG9U2AlqiCnXE3mJ6Bnp
	Y5iN/7ovhmQ3RJ3cYq7ga69b/5Zk9VYTAOJYadn6BFeQVQYB0eGA4UCbigStSCiX
	raBzuDbXCUyOG09gQCKQk/OpZmiBSjXjn9ioRgDIH17AXfeRU6MnKd9fUVMR+zpt
	LHiZUA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrrb44e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so433428385a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 03:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246504; x=1790851304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X9udNqzS6075n4aY4trAVywiFn4/XhY5ESNd4vQ1FkA=;
        b=SPLL2QKz8Pm1l1gqY6f78xgu+FSHlG5NLw7bv7thL8tyCDgfo5TYRmODWvT3OiP9CL
         kshEuZ4ST9t6NRaCQ//rqnWOKzg+qmvw3oUqtcB9wALlKC2GD3Tn0R/2WB2hAaR4kS/h
         Tj6ANpSOR5xtUmmjEUMhX28RQ8UteOtxXSBqiUIFcu2jR+FZ1384AGI3+M481AKvg409
         uot/LzO3Os5UXhTdGiILPmWMkxA2nEH0oav6avr9wcMuXUFPnp1000XO45yoBYQ+BdZv
         TK2Pz/CPM8Wif6RT6DQ06n+L8JcJLt3vxDVzuwFDDS4kGLMSoIkKwovwuuQqrWVT6q2I
         v7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246504; x=1790851304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X9udNqzS6075n4aY4trAVywiFn4/XhY5ESNd4vQ1FkA=;
        b=YBWLAvsuyiTUaCkmhHyiiTxZ5d9k2nLevQ2m92vE7zW1SGYi6JWXgWe1tfOR5xBhpc
         J8SL/l9MO9pEoAhLvqRKFWZRHOFNJqciu6z/flqEI9iMdWI5YSnt6tXSo0tbfzn0Satn
         /M9tUly8vS7kZmMYYNCsKkN8yGsq7opQ9wepFwQzwNi5FfPyL4ayQyhCHFc08lEXNxqP
         GYAeaKRcpTQ3nt1P+B80MjDX1cpa4NQNhZ5sbj6qtW9A1BfdMHSn/YNpOISQOaUdkX2q
         LvwNbzkdZtbtK2rEzNYOTHOXGFYXV4FsFNZoGOZmVOkSzMQwolJqkTQXSo11bWgdd1kI
         xWzw==
X-Gm-Message-State: AFuF++mz76LmBSwfmJQ6AH6Jd+DzECdZleZKmiCaLjVAeIMEZdlRnlli
	5nSYGW8wN/fglpo7b3PEs81eDZE1X7TA1xiK4tRkaPwdAZeS/EEvE22qJJ3m+wGQcxHLcFtwXec
	LXGyP3UfWfRtSsLTSYPLVg5fQneck+AKCZU47HnyjbPrcnXW0SXMdit5Za3Re8okH0+Pv
X-Gm-Gg: AYBFou3NTMdxb/kDUl56R6SA0gNRgbJGNjgrpTCcLnpT9wUGU3OZsJ+YFRjnFn2V9sp
	QjKB9FtRFH7PR3PteZwLEoWEhTUjUTJLHT1CRU1ChoqWKqNHVfNVRNqMA0Jm1ITx8RYlBTAu7KO
	QDnL7nlqnuBwiQ+88dirTQDZ2TZUBq66bixulasNWSUKt+9xdVdNB/5O8r+4pUbf2OHd7vw+M6D
	e/CoiF760YdIheytArvZoPUDoykNG5LPCOrALiOrJ0evo84ppm/jHggy2ty/VUsDB0lGtgeIp7B
	vWCsq6LdDotlIuTjtKCNwMWoxr6u9Od2lY+MFPXdB/91VP7nyeeZLxVDGvcN4kpWX383nT6dDXa
	msNELlCvG
X-Received: by 2002:a05:620a:838d:b0:93b:d7a1:ba13 with SMTP id af79cd13be357-93c3641e0d3mr201096485a.62.1790246504162;
        Thu, 24 Sep 2026 03:41:44 -0700 (PDT)
X-Received: by 2002:a05:620a:838d:b0:93b:d7a1:ba13 with SMTP id af79cd13be357-93c3641e0d3mr201091985a.62.1790246503645;
        Thu, 24 Sep 2026 03:41:43 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:42 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:50 +0300
Subject: [PATCH v5 34/42] arm64: dts: qcom: sm6350: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-34-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=963;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=kwmZWbieObu19HJwMat+En2+qUYDIaJNELdrcvjW9vE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP374/qnw5F5gibPuCZATHRM6zU1aib1a5/yw
 4whUWBIaQaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT9+wAKCRAbX0TJAJUV
 VtkPEACwdyeV9yFg+av4Tjm9uUhBAf38qFVcapMjcud2o/Fr6xMjtYxyerRQwMe0rQDNfOimU7W
 QsoF0YsSxpUdRPpNHDBb8Q7eDtCyfX67Y2gq4ludrF2SJTmv30nx+ZNOxCheHkhq7ZGBtmu288W
 jLKcdriRUghdx3W1d8ibOaPXKwgw4Nb0U4iT1DzY/qpJykRu/yKYYb4NmMRWcR+njIF1fhF9UkE
 xanGFrf52N+qwaGqrXAuMpmaXwUqDZMd0tY9I3bmq7jALd5jjkMNBQjgjIht/9gC+wEzEOFwo33
 Z9STD8gqsQdQRjsOeICWSElkfsNwZUBILfMweVRzCaJekTunippeHAD6vzKR+X38nWoVWCXSTQd
 lWsIQYkw49WsFQFqoAqr5PHWwfH9iFk46+AcHI+HXsyyfpeHExrJE4Ugwe/as7xe2hnf9BAdkoY
 42KHACExmB+8lS3i9X/u2a8g5aR8Gz8hxc+X6C+FgHFgdVEsbe0PapKr4FbFey8y/8vuuZJ10XF
 eG/cGfIROMxYfbNVo0/ikIxR8jRfGc6ah9bc6b3pvmMODNKw1YwoAKQ8VjScXw2BTSdQl98ZCg8
 O8XbG4q8ZEIIa+dSUmijehlHgkKSwpvRqhkZeAtP17LkHh827XBLNOkefaCEn9CVnZX/6htBUWq
 pK3DW/1TfilupmA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX0niSf793wDaD
 rTCIkNusVJcvUGxNxzNM0mlnMiWnHZkgA9UhcGd67iLZyPVIFlN1qCpKKqAwKYfRmk5Rsm721jx
 cQF0CIE+n7j0VK4ItLPf22KNw2l2Il/qgp6dTURy1jYMinsqpdaSQDYY8+pJypTNPohCN4nAaJY
 82/8rWI0hhXocmfPDaw9w7lHEjptzwcA8WYXvTGLRUsZc7CWt0iD8jUm4Fn+WRq2af1JghjTfzz
 /+vHiAUZxnipEDfPtCTRIf79dr8daAxADpW4oUVohxyrf5bS12oFZUnyZjpGf10kSjNbzOU4RhR
 QlM+cw5k3pj5fCriLRGCsIQ4aXdt3p9yn7MmScCztwM256ApeYBUxScSv4rFSD6az8p3mIJiUt3
 7J79Px99nCziI7AAP4zdqG1jCd9/sXaMNkL2sRTBJLmh/JFFvHW9kwkNHhOoX/9DaQam6I8a0sG
 1M+Z1n8AeZSFofyJLzg==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab4fe68 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Z-KR3oKqXnE-yqQhW-kA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXx/II3ZiZ74V7
 Ps8oj6MySkOWYKqxYyhxuXHKoLG+CXFXZmUWOpM1tuevByffPcsZuj9A5pMwmKyUBWOx0HrO334
 6RC71wLmn1BRzG/0EOyn1c7nsiuB2WY=
X-Proofpoint-GUID: d3HauYZ2DpITzagtHPdF6bugIFWs-hjC
X-Proofpoint-ORIG-GUID: d3HauYZ2DpITzagtHPdF6bugIFWs-hjC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

The GCC GDSCs on SM6350 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 15d38b7e803c..ded5c3a45891 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -794,6 +794,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd SM6350_CX>;
 			clock-names = "bi_tcxo",
 				      "bi_tcxo_ao",
 				      "sleep_clk";

-- 
2.54.0

