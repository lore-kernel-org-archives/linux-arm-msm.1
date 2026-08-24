Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A883EA97B
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572595; cv=none; b=Uuo90Ksgi2ZSSwfO1okMBouUzfa9yhfJB0v1CLKB83LHCvjgx5nfClH7hhbQdUyb0/EAU6lFjPDfPprZ8n0tKnoqkcA98N4nRYFrxiGJfIp7HnyDgTc1cDYPYooSdarTfOME/0N1DhLugSkib0ug3oU9Y7Luao93k0XDuK4iEHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572595; c=relaxed/simple;
	bh=DKLce2rGCWsYxRe9TpcUQuvx+0FtbeoYOxKuMusCLHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ugdQ8eRVhRQhSkg9OjKGl842n7kHRK46+sHyElkUAAHBRmqoBtkfPoPdB26+O91K7mkmxMbpqkcJyn6KXj1khGQQyEmU0S6tCpinrv3eDqgnTa/bemqiq9zRNCx+SCn8P2eQIX7lHx/JIKrUb/wgPKpDLPLXG9ihbI86ipjRgtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ShdRz7kN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F+XbPueM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ShdRz7kN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F+XbPueM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMYFJ2648057
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/6DFU/XkQWga24fSKmEZu8DOXRsix1OWpbGv96lsfYQ=; b=ShdRz7kNTBdpRj+N
	TLftfKVb1w1DBRNILc6hUOxHAjXDfCFbL3RYhPKLk470wxfLzmX0WfXDCUoJGemB
	7BNuZ8Var6sxd5oFDaPLVpEfEn39PjNW+01ZtXrk5qf1dDhbv2YFC+LlGyJHBXwA
	dJIX1so9OZ033Zf1q+aUlSh3Ul6kWVPzd0BMrZ55XEjixnQ3mMuPY5pBEho3tdgH
	uD8caaaFi+NN33e8rqLq9X2gWIJPN9MF/Q7mVpjKenmSVARMvIjx311pY0dHd/ub
	GcuZlFRZOGJJW8LnBuJugiYDfhP40SCOFldiMOyVdLCgVijQfdyi1hQzM1B2eGtk
	nRosTA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gqn9aj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d827597fbso35454431cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 04:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572592; x=1788177392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/6DFU/XkQWga24fSKmEZu8DOXRsix1OWpbGv96lsfYQ=;
        b=F+XbPueMIo/2gsieSKFTPcMqq7x0UXYf5mclc2vfcXF2BpvQYHJKkDwkbBTtlbuUTF
         0k2HgYbORzJIMMrk5y26Z3pOoAlCtLi8NHt48azpUF4skREDEpXi/yfSzBv2wIEfHmQW
         gJ9kGTyDO4Zg6YteHlEdTXO7653+Yh0WDv1egVxoZC/guMird4XnqE0bA7pPtzMGkBdR
         HqE6LRk4V1nq/E3j+zx1CKnJOywnMiStYP3ToncO/cRJ3yWoy48URw+9PWOX0RburXIK
         AGESweuDdAnwljg/+C4BFpVElcwfn86VCHd0WsrUHrH28nnyzZoZoDtkLhZOSCjEJFz5
         UdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572592; x=1788177392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/6DFU/XkQWga24fSKmEZu8DOXRsix1OWpbGv96lsfYQ=;
        b=OweQYJfTjWcm/S2gfHUaVpLx9gVeL1jJjgk/i+FvJl/J76PhgVZrR3kBpVT3RIZffV
         Tp9fRvtzSwPU672i03SG43Md2LfT8jparJRGFEdcnleyCNEPlr0WzNDR6F5cLJe1jlrb
         NbAkLP60eH9vFgrvUntNCJ6OIlwMSNqr1MhIKQCyNStokCwWsh6U3LIs5Tc1jIoUntuV
         XTAsUC3ZpIm5THVRcE9ntIDxyYTMWC7qemjZB695mNtgj6J7K5P55HJlfsURCtT1iBko
         vabKZWtKNS4rOTRcTLwMSP02GMImdmYUjHJMjGOX1XsSFMckqxYrU6HnVMSGCuA0RJN2
         xYcw==
X-Gm-Message-State: AFuF++nkSoVKZtnxLWK4mjE9LkYezk7Pe+F9t1mAtl52x+cj5M4Umlbf
	xrprfJZTEqbyoFZTMq4mAPcTnE3Qg6Y/ciaTqtashHQt5eCjd2w30ZFG9F3d9Rf4eNVIKZHBMoY
	9Ojb/8OEywo2jwgsOa1BXKA9yjunxLoN329YuP4+Xcl0jibf5N2/wANm/6r6Lym3mmDuW
X-Gm-Gg: AR+sD12nuAscuHEep9F2ecJyg26diqcnM9V2pl20jTruP/jpyVRsLltn7n7c2lNSgd7
	A2kEzM0N6G+FVrZj7keRij9kuSC0BP2nGWOJ7xst7r+lZTCRR/WWPvV7XXrG16GqnrO3HQA3cis
	8Gk7bHpXbPcFZVk5AqoUGLMZeuH5xgmatnf/LWY4x/jJNSfOImQ+81SW3MYRxbuV1XEWtshYu9s
	WuJRmPcJDo636wpaGXhCWG7WGcAlR80/hdq9qhfFmMMIp6abnICitt+IVI6qE4NgofyoxFC/NnW
	81YKZcTa0MRop0SmgMkZkZ9OJBHE55UIAVAFOlIX7dh1MULwis0hRrlqgYRF4Uc8LkJ3T7lVHto
	dk9RC6qYd
X-Received: by 2002:a05:622a:607:b0:52d:99e8:46ca with SMTP id d75a77b69052e-52df586c696mr241493091cf.18.1787572591854;
        Mon, 24 Aug 2026 04:56:31 -0700 (PDT)
X-Received: by 2002:a05:622a:607:b0:52d:99e8:46ca with SMTP id d75a77b69052e-52df586c696mr241492501cf.18.1787572591316;
        Mon, 24 Aug 2026 04:56:31 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:30 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:24 +0300
Subject: [PATCH v3 37/47] arm64: dts: qcom: sdx75: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-37-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
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
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=912;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=DKLce2rGCWsYxRe9TpcUQuvx+0FtbeoYOxKuMusCLHU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDD53ePxEK57Lhjtvz4WClEcO3lbWzwW3x0YB
 ZCE0NLodSqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww+QAKCRAbX0TJAJUV
 VpFOD/49cKELBZ9+WUww/YdfO4wP0meEwdGgxI+PpdG+2cO58HF/O1TFWGC4H0W7am9NVw4ydkc
 cPQ5QFbWQmPghFAmXtqt0dYjRnIk0Z5oDGxnM+a3hHKf2ne9gJ5YGiYBSoewORfAtrBv5XaT/ZY
 9SMxEBsNROKipPccijTry2DG54MjPW42kFi6WtnmJMmP606fvy0RQImDw800R1FWlRVsnJWB1h6
 J8zbKFmVpTWEsUaDDmuEML2UpRqqs1d363wpMhzvjOZNWIQvp8fMKJXcNEX8mwM/69Qsh6D9DcH
 a0mB+v/CWgUa3IvIheH9r1mUQ5X4IPqM8Z2cNJZ2TjCTocehecIGigYkEvYWx/1mMZgHvJsncWZ
 FYPmbIfTOUjISlkTXEcqPWksNeZ7VhtcLx3AfcW+pUNA5fJ+1RUYazSkkwZaRI200FW5MctTPUW
 icYaMpSA8Ma5f1EuyWsKq1ILDOUffgRHMHL/ljbSss65/S9uiBRS5pwY78jyttzwXQV/8zpLrg1
 MZUe8fZZjLeyq/nMfRGXYCcuq/DoxnrEHWrjt5yFYshDZkqfjcpm1Z9KEnjiTr5HsnOpB+1kX2C
 CQ7Zhz5HFWnGhk5dw19qypLW/i553fR/jGsnABUPtL8MP6U80Ic3YbGPrwWiElFLMOSqWD6+K1W
 Ghl0O6x9sfkYzQw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX5CzxBARxZQul
 bRzE6l30a05/6IgIOkrGs9Ouq+8F2ddmZ7smvJNZJ64Ydqmznt3RBkjd9x+U60fCFRjeyHmutcj
 G0FtUxVA1r5Lmexj8OR3ZK1gxjEcR2k=
X-Proofpoint-GUID: Ci0HZlQ5XaL_MGnr4SfUqxmD6rFjTamh
X-Authority-Analysis: v=2.4 cv=fqXsol4f c=1 sm=1 tr=0 ts=6a8c3170 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=3n_S7Wnn7mudAyu7Y6kA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX1N2hgVXkYGaS
 dvh7hJV7zlZMAsunhZR+93nNj8MludUm5NTTdrsYLrOfI8foXW66MwS/OQFOCLAcKohD2TeMF9h
 g3dxzZHLEkj4XwBykFnqkZDTs/IuxugMes3z1fQUfvmio8BAkssTHpvdfhkqN7GaO+DzCuydUV0
 Mh8MvnT+z6p4kAqRulGN6NImFuyxFV1PRt32fufQpkAIuF3XBYkd29DT8f4exXEZTKL6oXybUEl
 tZOaSBdqlQaIkaLCeBuC0y8TbGINPCoE13qtEzDfxNHMIoQp9cebxlRVQwpZc9SC6l4cq/q9MAx
 Fgo6OTdeK9WnddEY36jo3PcFBvT4opkVbbL4XlUocO29o9x2EdGTrK43XJ1TuvJCs7cdl+t8Lot
 9QOiYrk7eHT0MdKgMwq0Hs+oPqUhrJ8hfWGyiR/+kDnbwUbOlOQ7TCQ1rzDymyOvnB0DSL2sbAd
 bINOjofhXY8or4YujYQ==
X-Proofpoint-ORIG-GUID: Ci0HZlQ5XaL_MGnr4SfUqxmD6rFjTamh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240100

The GCC GDSCs on SDX75 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 85cc9c6e6f83..d4ef90c4a8db 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -487,6 +487,7 @@ gcc: clock-controller@80000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

