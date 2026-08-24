Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B97441A4FB
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572589; cv=none; b=o5l79ZFDrVXzarCz4s0JDTTrqZayTd265PEH3GjBbibOUVS2odW9/3hRjsVeO/BPw9Ol1oHpUgfzIHk+uWG3Zwbt9FT/SlsGu6LMrxdGbrY0RX2Mw3qyU+Zx0OoQuJXw3iqzqAmyoU7YbP/g72E7Fc76G5tXJdFcsyohQ1RPUao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572589; c=relaxed/simple;
	bh=feYVCHTPbsd3/jVJZAWaDWKyG8VEZ5/OESdLdqasmu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GhL1bng3EgEJoz4kM5Ez5Ia017yMMmoh+GBHR0cpXPdsgcz8GHc1MacTYSoLJH0jDRad+KmOZt7zusul9oHMIVaacyT/EgAeyRBQtT8HhatyAkIFhVNvvcKBqe0/WEUUNYxqiWEOWN0HXtOZsFkQwzemT9Z6Bg3Fl5yAzpwSfF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bzb7ixP6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IO3yxyrm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bzb7ixP6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IO3yxyrm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMgKM2864710
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/jPDS8TRjFxBl5eETBjlun89kg0m63MpMQaF74AWhkY=; b=bzb7ixP6mDdx/5rS
	jpUSTFu+BxM6brT2RGtO2da7AtsP8a0Nd8QxlY6lKDeUq5NxW6pUrYVBv1JGCr4n
	sIrh1IWOdPL+Ps5S9hmN7KG1j12TDlsjGBJqklw4ZuUYIsSM/4N60gw5k2T7HusJ
	C4Ay2UCn1SPTd+r430FsfYpPqClOzUfn/p+dHtGlzHS5geaUiGnmYX6YO+I76GEz
	v2eAUHPg/vqMR+S/luXdzdoZ8//CrUCXgXaDKVqZpSfCY0X9I/5s/lbzWFXdmuA9
	0D7hI7lKwlThhKv+7kzkuV0vuP2gaVnMNUlUtV03okjit5fc0i7zTG3N1/dBhrkf
	5dK3Zw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr29vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf321d786so27962401cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 04:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572586; x=1788177386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/jPDS8TRjFxBl5eETBjlun89kg0m63MpMQaF74AWhkY=;
        b=IO3yxyrmkFchLB61xHlw2ygQ8YZaAM8IEiPeq5zoev7Dgg+S2f/FmfFwYTg+MyJ4ug
         xi1nxs/ZsAA/hA9vlhFFNJ9gYbW1ygg1/Mcwi3fVA1sqm8a7ym9bLJYjnr0D2SwOZtvQ
         nLkg6F7K18R2CK7SC+wJhsnPa8Vdo8GWabxPRW3IU9fX3yDDLy+zaPnq58ZVEgVFjrEL
         XcYXdCv/AMGPD+iWhnPif3FerEOYM6I1GZMPSEvJNBPSL3/4V3Q28RIsbZx7xOGE3IlI
         YZyLfd6/TvLN12ICuDyb7GeUjSWoansmpPA4wqukMYML3MrYvLnDh3TqmK9d57XgKjyV
         /mYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572586; x=1788177386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/jPDS8TRjFxBl5eETBjlun89kg0m63MpMQaF74AWhkY=;
        b=poAnYfGe5rzuJhDqZWLvLJt71MG1PHykd1I5Y3vqqUGnLo3BKqfCt4N8+rfB1S4Aj+
         MaKHZbE6aT8Wg9iSQPCupRZXVN0dz1BJbdBXITTrPI3LrBP0kSUkKEhOG76uZiPwjQrX
         pEAd3dI51Xuq+iLP/ddkCYvembCei8/L0P5n8pc2pwW9+MMeRw5MG1Vy7J3tLMdpbS90
         yYR9MRU4vHW868llvVB/sOGPwP77WxVZJgmlIFKUIV4KckVO8SNGxnq7FTvuohu03zmS
         BztMyjbFdNT4ICtUVCSLbceRL/GditBSXk9d7IHlENyLb7SOp56xv2JK3BMNFqggf5Gc
         sY5g==
X-Gm-Message-State: AFuF++mDQvUdRo3j+RV6CsiglK+LW9HKOF3algQaZXutyHnbj0PLqBju
	3ggm1Uf4BigLJ/b+2/xXlpQW8WwPgL6QV1egaTp8wTaHgAYE/Mqy9Xmtqc6L8wfrS5IkQE2HUxo
	UGaRoJVyVc3XpRiCF0mfECYVl0Zz2TOVZzJ8Zs7c896jt1PQM7GLsgBeZO4xSrzc5NT3S
X-Gm-Gg: AR+sD11lAJVOwwKYmC1bvJSYblWRuYnFysbpu16YGF+AKpm1SjXd4BTd7Zzzs40u72L
	4DcVen2OB89rBgsgaXFKvTj2GB0VRi6VKTFScbnBPpbQW7jzLdyY33l+bzEuCnr6KWIp03CTQQY
	7bwfG2e+xEnqxIt4KTXVMrF/ZL1my3n9Vft+FxIeBp4+iMHagXHbSmLbrw/elkyr4kFGZRHHGCf
	pHkHfyWN4P6CSPuYUofzsldteOP2nGyilPOLLVwe9HrBn0zvXzd0/qPawDH3OmWnlC8hwzPlZIN
	Xm0tXWpepZ5ASCvvKO6O0F7LOrY1OVVMM2undWxiUQRkGR5YNGnHTtI22jodrExnL+nAAQGYFOo
	7WTGcDRsQ
X-Received: by 2002:a05:622a:8c8:b0:50b:4491:a2cf with SMTP id d75a77b69052e-52df5a07b28mr279145411cf.27.1787572586289;
        Mon, 24 Aug 2026 04:56:26 -0700 (PDT)
X-Received: by 2002:a05:622a:8c8:b0:50b:4491:a2cf with SMTP id d75a77b69052e-52df5a07b28mr279144781cf.27.1787572585672;
        Mon, 24 Aug 2026 04:56:25 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:24 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:22 +0300
Subject: [PATCH v3 35/47] arm64: dts: qcom: sar2130p: Add GCC CX power
 domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-35-f1205a92682b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=974;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=feYVCHTPbsd3/jVJZAWaDWKyG8VEZ5/OESdLdqasmu0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDD3GgL0oY3yMduWRFUOEZatYk2ZL6T4E8iXC
 CybYjv9lGyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww9wAKCRAbX0TJAJUV
 VsDfEACBgTYDEboIG2fontyTQjEzt3STZJJB+a+DNLXP+6KIExlRT4Fl7xh3fs8bPmFo9BzaUYm
 EM1KUhF4hsTO6kj1cBIb7POevNjozphoqC/UlesQ3bM09xdP23at0rqUJfK3qm7hM4gkZVzneM/
 Y5zGXB3UuB960xze+NtTMMYGiG2q9wC9+4CjIYaKkGD6JnHgVcH6RvsZxd0nP/u2h1fwI7G6+fI
 57OclrByakzDudwiMDAmtfCd2jVVJE0m4c9RW6oE4M9dSMILjkAJyMkZkREwq4JjIA3secJoe9w
 PzrdMC/HdL0DxCdiRDxfgMf+0mOzofggQ6BKzeXpYvHCuj5RPxa8SbcVz94bUGYMB/CN+jzXSgp
 /pqcEYGwAY6qJH6Ct8kVs35wu11ymjVqplA4OboBZJEKdVL54+9ZRtWmxBMmS6waINDkQj812RH
 ryolDUnAWrfePQ449TpTGtk8C3JMsqnz4WvwUN6n73Ys0L8VMyATScGO4tu1UoTi91KI318qbPg
 VM+McsNK563kgM81bFRVKR+onIvSltHGRjxRSlN6XWPyvJHYufbMkdDvOekRzuyZaBphh8i0RA5
 70H5/4qtE+XcUeqSCI7m1Y1beifwdBCOQS0ZMw1QBgMnWmJ/rrdEjPxp5t9FlHEGv01ovjtJm0N
 hGtRZo2H9CnXQvg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX9X19ZhEXoKYW
 fcfIFYhGGfNikixU5r4jRpk0nSamRlYr8N26VN/LhRAzCqmLqvB+oyLc8W7N9MfzpscchoGS/Ly
 OUCv1jVIIAIj2TRy1XDqOcIycp8QGcTITVD3307lsgACHKQZEgC8ZpLz1XfGRpVaVZ5iT59FBoH
 cXhOqCIm+ZvRqip1iet++R5drfCiR56SJ0TzF0a7UvBaFiaULgw0i/CjLcxzkq7/nIvdNBAZDE4
 Jk0eTu7wQRk+B4MSQS7HjaZ2n5RK4yt5PZr30th53Yp705Vk9IYuvU4RfF63DBUIJYSOyKr1C+W
 tAFGbnOUs5DuRUMAGsNU++gMZzN1viwQWTQIl1V5LKDzQZAjwSoZ/2DxygYzolZQcHbEEp1xL/a
 wv7pYqyZkf6CtC/VhxZQ5pBj5FTpa5XnslLQeQp17RL7nMFi0OyPipSu55pGyxPeS3HgDAz7LbZ
 v32ga5T2xAgbawfhjNg==
X-Proofpoint-GUID: vQOmuS91N_h7I9s1mEvifCVkCitSE3xT
X-Proofpoint-ORIG-GUID: vQOmuS91N_h7I9s1mEvifCVkCitSE3xT
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX6T9nuwn8ujVr
 KBrqbVxGk1PJZM0JquBsuO0fcYG3clA7zsJjrkry6eanFg0h4vbaZcYsPbYLbVh9fwjdb/NL+uF
 JZ2F+oZBWUE0BIZ9Fh950GN9S5bBEaY=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8c316b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3n_S7Wnn7mudAyu7Y6kA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240100

The GCC GDSCs on SAR2130P are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index a2d93fd68299..b6ca31b87d1f 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -475,6 +475,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>,
 				 <&pcie0_phy>,

-- 
2.54.0

