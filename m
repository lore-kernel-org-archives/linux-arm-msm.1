Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380ED411F93
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220564; cv=none; b=KvZ+v0YzVqmgIIcFKXV8IKdc+cuTMu5WszCJFsTqzFCQe7k71YlHwq0BxXHmjT7s7Lg5/TywrDf67ZL0+tEtprRHQGjqRfhWqc+pE79xn9+EwqvZYQvmoF609cs0++gE5nX9aTSk7kt2umAnBZs/auGJ1lLXpf10CBPYuMhw/P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220564; c=relaxed/simple;
	bh=O72z3Ck5q22C30nEVzWv3ic7P116E6V0oAP28uzlETs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ISvb0NScHly82eJv95/iPnvUqOQ/63Q3EhiEkMKF/VNaHZ7W90226yqrb8MWcIWDwLBaf6v7oFs2I8fn6wdRkW3dQ510bBPpSQw+u955Nq6z9vBy5U+OIti5oZqTWiKQ2KDrGvD5HX81wYA2uk1x1RCkqxjlHyISBb7dTZ//aH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dA0RfeMB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kqiZokUJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dA0RfeMB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kqiZokUJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8PEJ42465441
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7MFImhktjIDfH4XVqhzB3W8/xB4A7L0ZxSbTD6AR0IE=; b=dA0RfeMBtnbVJrsn
	enZJto7m5Dxj1g+dMurI7XWBMSt31+A5dbuDobUumeZZ1yvJXoJ+PJKhEp8efH/D
	RwSb0cpSt60yOXcfKSD9Nk0vT1FeYH9VQzkL59wbSMvhwu82b71nTwfiUFoO726S
	XgPZ+A4M9oRZrRztLKrq9vHQEhbHD5Mk/c4gbym+g43X6GemUYkRDnwxLIFK1a/o
	WaBa2a2jqGlFMYg9RumHEq7VFi5Bp199uESxCGgpuOBPeHW6kWdLWe6yyv25CxoO
	oDJKSZ2IUfp7MSvx3hSP7vbpLQHVX23+Tp0gEjFPFlg7iaF4S9TfoHMLS0/NlVQb
	F+S1wQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x29gddq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:09:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e695a3b28so85631085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 03:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220554; x=1787825354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7MFImhktjIDfH4XVqhzB3W8/xB4A7L0ZxSbTD6AR0IE=;
        b=kqiZokUJsG2ilNMcGucGt2n9/iEZ2Q5h9DWwzZKkZwELj90TsYZVhaEEkNT1WSBytz
         mS4V5A3Z0ox6Zpp7+UKJOw95esbsyUvSXCCk/Dq6wfK6dc/jWq4GjR7OS0Y0gUkfmIza
         rjUFmxoyCFEJYKYDjmYlEnMDPQGndhdUjARTxG7ZRFIy8bKWbxrH9pb682MyGEVFw5vF
         A31I94W8tco5LvKgttFkEHLQOWR0fxryFWGOsd7Au/FAFhvChzoY2ntDJuRflV2obmrd
         OaC8rnIur0xyV/Bdj11ZZAAI/kPJ37eOMN2K+hcQQWEVWihc0BNZfpLGfIxhw8GcRmTe
         L+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220554; x=1787825354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7MFImhktjIDfH4XVqhzB3W8/xB4A7L0ZxSbTD6AR0IE=;
        b=IAvxsZr3FAFHLlJvyFieMnL1oumSCOPOYvzYwGrCGNj9Ijp+60eGwHdgAzCtRAxYyb
         7a6nsVWrU7QWKmT3k7o2a/ywgnJEFK0YUYDcMjdjedjGz5/xCJTwP3LOMpChV8p8pXX8
         uPNSo6mCFFDTZb2jgv0HZ9+/WLAhAm28oxn6CKUwAQZoVarHx2ZRQRIuLshelYk9Z2k6
         1d+JIbhavFJj+pZr18dCPIW1wKv2BluVqzi4K3/BVO8DHwsXilVyAygcwPfyhT+5fzVp
         ryBmyk0KXtJ16lHjn/LGRJPhwzq2poyzcUa7jG+DJc48QBbPwN3Ouq2LtVjRl9Z8LCDH
         Hiyg==
X-Gm-Message-State: AOJu0Yx22N6Rj3Xp697QdUi/EYZJtc5ZpALsYzKkAD+XMZglVM7DOUAP
	27ikN4wsRlraXsHwOWkHXZfFFoSdPO/wqxOlmye9PUyqVRSXR+Aa32CUZAYE5tORLRo0yf2c7PV
	ueCChcZaJHUNRuGhil/IeNLQ0uSVeB/u20MCwnm6P+4OpfXoSCuCKhNlX7dwuj55oufEv
X-Gm-Gg: AR+sD11uf3sX16GntckfNdHov3293f22CpApNjccbvrfxByXQcs5OxORatleh1Qu9X9
	eH7G+EVydgCu+YF/nf6l5kfGUP5NtB1NgO4SmsWLIjTkKuUtn4AnAk/9VgFc1S0zx+hTpbqJuR+
	bp137kF/gOd8EyiA3tQDtonXtA4G2fxbw0qPiHeNtmXS76dmsBcvohmd7reZCtlR6iC73Vavwry
	hJR8cEUF3IBfJf9b4nEtbjOe/FXlOdCUuCams84d2JzV1Vhcga0SelvJcyvx8qJOu5FSdK4b3Eh
	167eIgQrC/bWoKAFXYZsch9injIbcCLJuv0JF00EBdgWoko1qf0K+HuzNUtqL1Pv36KEGHnQcBd
	8RrrPhPEc
X-Received: by 2002:a05:620a:2714:b0:930:f285:5ee9 with SMTP id af79cd13be357-93728551dd8mr529164085a.20.1787220554430;
        Thu, 20 Aug 2026 03:09:14 -0700 (PDT)
X-Received: by 2002:a05:620a:2714:b0:930:f285:5ee9 with SMTP id af79cd13be357-93728551dd8mr529156985a.20.1787220553939;
        Thu, 20 Aug 2026 03:09:13 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:09:12 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:16 +0300
Subject: [PATCH v2 13/16] arm64: dts: qcom: sm8650: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-13-e67ea30d8b7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=O72z3Ck5q22C30nEVzWv3ic7P116E6V0oAP28uzlETs=;
 b=owEBbAKT/ZANAwAKARtfRMkAlRVWAcsmYgBqhtIQs6NKImG163thh0qjRhTNHarWxymi33D/F
 F0ojNVH38uJAjIEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobSEAAKCRAbX0TJAJUV
 Vi6VD/iHgoBx0QvdBdLofKiSGw8eeWWm1RWZg/gtVedZeX03HAIK4+syXM4IgtAZdxc04oX5Gda
 8asBaxJAKlKnx4tExqcAbzPTfCK57eEPs+i5rEl9P0tccLjuA9+/QXUMQP6CJLVfc5iqnom5gjD
 pfPqHhDHaGtu8ZzoM49DkR2EbQT0fmV8lyKRautCbSMRvl8ZhjskrcK3Jl3JZycIxe4NubQTpky
 HCKbkDXF4BCICJIFWcRI4oE8hoO1DbJc2awsCo5DGioTvxp/4yyte4AYshYlwYFlCJhSzflndJ7
 WhdRUsd85pkCJtwaqTVJUQojSWtKkPlJsQFE2gyA8NpObGP7EtEVJm1+qTxKcN4F4Q+n9J2c7H1
 oMKB/p6JHy66pzrTYGkPyqkvNGXjzvpqKj2wRkvZLwA8Ev94cV+E4WTGFL6pXKJmimO9Hq1qbbM
 Il5Oyc8/w9GUWpgq7bsSRMcB9CRrVnag7MMxjib0dxDwYEewBLx1vWuEUqG1OKZkKqQ8hfK/WoR
 dw+Z07JOjGUZvG1WoYm/o0c85Y7gXpfyzE8fEnSg3eZrw6nViCvu9CiKTXMSzUWkK8OwAtTMClW
 5/0LLy0WM9JmSHIknCBNMJco4nDeugSV/8INCDL40uG1SpNcONXHdfzgPj9eF9RCowsD+YKx/9y
 G9ApheSZb7PxC
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: KiUJD72S2aD-bexM18EnbW-jpqs8bwBV
X-Authority-Analysis: v=2.4 cv=V8BNF+ni c=1 sm=1 tr=0 ts=6a86d24b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX+4qITOjg8elY
 Kq7t6RSnZ23uRrk3VokARBoGVEywVsZw91pSy5iWEgyYygX2SaG2j5sBzsg/uXG11Bfj/VRKKGV
 BJySzRPySfYVi3A6Ni3sFE5L5iV7bJSykJrnaDmvqmtD5hIcXF7NwOkTvxXzOm90enA+32cEqlm
 GFuMXmaZlHnUDcH/5FWMT0pP5t7bJ8GrfCjpKRjVLRYvOZ7LUo85dM6eT4nDHrQHPBmLwFfvdYU
 +co70JdcP6qQazpT2K1iQkEn5yAQHUkb+gFDVcIlx7mvLxHfnoHo8qrudz47ZU8f7OxPXjfej3R
 K+2szdKYYsPNxsfbMKy9B5cSZoC7PQcKnP29cBPdzoHynRtTYMHVvjdcQeNeUDPh1Yf6OvMo+Qx
 mxbFcrLUYKSLe+N+vU4/snLw6b36klb7eOoutLizPPahc3qX514N/VazpPB8e49N7x6FKhnEM8C
 ZPuqIBvErvBKHKEUDmA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfXycjDbJFDPQ2+
 CN3jGe8fLq62fUJG11BOFFtVFI1Iw0TpjqJQYgEY3ocPs2xnZpY2jMTowbiJ31OHQJkBifUCYi5
 4Uqht2IMwGYfrj5YGuLtFn39W+GdNPg=
X-Proofpoint-GUID: KiUJD72S2aD-bexM18EnbW-jpqs8bwBV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200074

The GCC GDSCs on SM8650 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index b679fd8afb7d..962797c15abf 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2019,6 +2019,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

