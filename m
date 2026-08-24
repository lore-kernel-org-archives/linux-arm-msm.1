Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B23B41A91E
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572603; cv=none; b=A/v7tSwz0Zp/cP+oNwmf7pfpwf+L/BtHersLuXWKEgs77Dk2smRCJOE3yWgp9wEnixwOZ8IciBEkgJBFmmpEJZT8aZqsZ6zp5QoeZ5wlYGdSQk61gZxdY2serwt01LmLLzbM41zJiI0FHwxFkFgj59+6qLkqGzu5Pbc0mxjuWbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572603; c=relaxed/simple;
	bh=F80H9I0DjUCTxp9n76OgxJurzIJXm534S5e9STO9TtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J9jANprfG6Ihedpq5xJHun2G0Bc/8Cl4zBOkONqV1UXUfSE4LPtW+3bfRnsGj2/9JaU8k1zySFl2JSlnbz5RMZIN3bz4paqjDk0i97xDHPXC9NeMSQ++MaCHI7tDO+4nIRkA3ukdd4tAAmatYp/8uIFINtTWH2y5QoQWxjti/Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CiDOxYKa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gLhG1zd7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CiDOxYKa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gLhG1zd7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMd8T3194977
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKmhlTgx1VIL08aqjbOIr72fw3Tnkf2jNo721b3IBJA=; b=CiDOxYKaOs6PR0OY
	+f/Ddw509g/v9Y1u+7dFDa9sqWQsV1Mp7frQ2hmvBwUR4RU3De5xdas5yUQYfYVg
	aJtdN9aBnHo97i32dAtEL19kB/jHm1sT8osOp1Mt5C/jFa/TnlzXXBQZri5WSApW
	sHzKcJJwXhmyb8nQ5QtsFx+/muLWsO/Sk5hM1TNEOuLCPLYiYcGJvyoMfqXC5tkI
	cS2lXY/8CFr8c2ND2W/gHmI4f+qDWQwTQp9uviS67VkGhjC4K7jLcKRGtEzTG8tW
	XIIs/oU8iALwM+arsfINEo24X3OGr2+Mh5q6hlVI4OSGex8edQbCID5KznnWux2p
	5A+1hg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgs32p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d9cef8d15so63896361cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 04:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572600; x=1788177400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKmhlTgx1VIL08aqjbOIr72fw3Tnkf2jNo721b3IBJA=;
        b=gLhG1zd7GMJx0idZ76UvtlzqNWyYLsn3ujlJRjxpAcDcTH1K+dwL7qKhSUak7JpNJr
         UDlnjjZ5jLPEEHXo4dGHW9Vpn4EPtodzp9hHtv0X+bkrBOYFNrMpk/6OVE1zzEt/ZfbE
         mZoWlC1BUXyd4+px629Gd+B2/Hfaz65XDrcmPkMun2xEwV8ABn8i/t3ywPneJO4r99HB
         bqOx1GbtjA2qoBL1iJ7U8BsKBGv6wp+zibS4xxcBIkIhs5eBK9I2IC7k6SixVhLh8LbC
         4hZsQX3MeC/3DwLiTpCxTirrGvYtOp+ajfSl0ePgKoO7c6FfNzsbaQ1Qnkb+Y+sxO5bf
         deMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572600; x=1788177400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKmhlTgx1VIL08aqjbOIr72fw3Tnkf2jNo721b3IBJA=;
        b=JuU5KeLK5kzdc1INy/IL6E2SdRJrUH1tg7O0tTYDAbLSwQr+hd4w+FV9wLyMNIRBrW
         coO40RWCjeII10Nl2TwD+yiZOJzfMZNoOqI7b4nA3bSgnOZobMn2RLnrIRaJBIvDzx9E
         L3F6G3QbzPTQkhg4XJhJTsFS/tPSrhoKWXBE4QrVrZgihgYS73w4P+H92KKYrsAgXHb/
         I5sku91zOgb/aOjF+87A2K3lHFvT4naonZIxrxTj4qSAD+GwowoDYGCr+6FvQwp5pVtj
         HKPebvSbGOw0GgxKxZY4HFw9N1sMqbHpN8opWl8ADBiENPfTdmRpnjBMftJkQt3+R2V8
         KoNA==
X-Gm-Message-State: AFuF++l4ZdWEgQYNhtG6ZtwVO1RKw0fQ10zPKErCabcm2rl6YahgGEm9
	B3IHShpUqSGCJyf5ygn2xCXofPAgJUka4XgznB50QRr4sm30mMryClgS5TJHTuxWfixPqyglsT8
	Hzb9jGtZfkkE0CCNqsFKK7q9/TaHpdgaSGGPBU9EGWRA7RHSvY38kNGGQy9renXx0oh1p
X-Gm-Gg: AR+sD13D3XHLeQAn7UweA+8eBlgAUGwrI5+oPFBMhZfeqR0BZPLoRZtJ/raH6xUpppn
	UJbysu6NT6FJLKY45sEed8LvizudFVuL+4n+HD7EFcsLlkgSWxbodR5aUYl48FW8FxQS+Ln6dYJ
	v9o5K8ShdVEmZ1IR8sCDtF4Ru964WYY5o9AUrxWuFtKqFOVkxIXwOc2ake+0s3RT5PlncIzFX0s
	qEBopFcK1p2IhmmxeGSmve1uXykjAnx03i8JFhsz+xdOEtHRQvlMt7dGcBNUkaKtYnIXZBI8z41
	AM8T4J+Hf6zpZ+/0FL9F63OzTtEpPovTxtRE4SkZS9s+1QyU2Qa6+EfhN5tF4KRCqA0TlcVqJ/0
	oxuxMld1K
X-Received: by 2002:a05:622a:229a:b0:519:f884:b587 with SMTP id d75a77b69052e-52e09cabe0fmr189632431cf.27.1787572599706;
        Mon, 24 Aug 2026 04:56:39 -0700 (PDT)
X-Received: by 2002:a05:622a:229a:b0:519:f884:b587 with SMTP id d75a77b69052e-52e09cabe0fmr189631881cf.27.1787572599174;
        Mon, 24 Aug 2026 04:56:39 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:27 +0300
Subject: [PATCH v3 40/47] arm64: dts: qcom: sm8150: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-40-f1205a92682b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=932;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=F80H9I0DjUCTxp9n76OgxJurzIJXm534S5e9STO9TtI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDD86/X4+gHznf3pGD/u8NKgQj7u0bjeCpgMT
 OczFV0gk8SJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww/AAKCRAbX0TJAJUV
 VoacD/9XwdzVX7uArlZXlJ/UWZ+R/hCYjieIwFQRvdvN2ucOS2WvWDuWA+BaczDTu6jEVub4dkH
 d4zDp6LVsMXGukHKWiESm9vGJtlPFZV5+sh9KN8B2EqLDOotB5LlFXCVmxX87Ky1jaTYiayEb9M
 aeDa3+dwYx8muoPuiAhG2rwq0QgIuA0wEO/9Gt5NtNzy1SW3xweW7MxZwBcK+72jYDKHVLSBwv9
 J72bFjXMO74RwNEUKjX+qEAVJcKu3fXCHdw8bhOp9rhHQcd6fXCmXFtkY2b3Da04tp2OqlhcD2Z
 kbNUCr49SkVYEQmMw1rxqb57d62ZmP5fFcXsx54Uw7t1lfTnh360sM7pX+1zqJ3AEdbsQ1LpfNw
 brDNJ8wJeuU4Z1vI9/XHcROjycaCe2N/GUCowBxTzhF/YGGzApaTiQU4P/PuOcHaZUAC7e+pnKr
 s5jSavRX1idP44J4Ott93NZRN8wJhpi5Zet/FXEcZENzhAM/FTbxFav/yicnFmvqHoB5ySbzMM0
 uEqRoKZMbZJoQczVzf/bHc6k98672A2RmPsbAr3Hix06gaOswNwIsKJZNMt4ArnsNkLqyybWuZK
 KOdnLzrnUVL9sFleekxttVS02kB/mZuUtD8UlStmgesuPRWVNmRz8wkAaHcqiu3M6w5NWQw+qxV
 u+9ILxuLF3jZU/g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX7+9zyMWeTmFU
 /eg8TWQNP6Ge2lWkXdnQ4IL06qNuOA2lsucb8cO4nc8HFmpg+MdNVcdhMDAqIjBAL7AMiE2e9lG
 4JRGZDO4C+wUz7Xu2ymwzqKSO7Oj8QM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX3NynICY6sBFS
 ZeWLt1lxnFInWfQKcbzfT7b7OsUSX21Zcd+pOQyJ9vb/7EXnNGIvBtGQ+F6tgPnYD9MNo/7PD4d
 tZC0tU3A9Scul3cnkzFeXL+YyKneihZ8JW0VGyDc62aMfNx+QGc5kIQ4PjjkGd2XJqgDh54qDNz
 uTkjORi2npv5XwyTNeJa7PqJ2Jh4Pfr078LB9no7gciQEgwsSdmg7JCSEzyzMjbC4+cNmxCTW6U
 yRRgg+N1x3cLLKJnt2T01AAHFHgzh+VNPBCmTKJLabyQHGeNhVFRhUnVpIGJpU/sz/RHZK3tXws
 AXNZVOHbgq73BUhmuXy9lDgfZcUTwB/Jq4JLeXcmv65lLNwGuy7XkSrRkXS3rHNNDZqI95ayhXF
 pM60OOtV5s1y8ED/ye9364/rtYmtCCHR2fGugnYr0JlG+QANb5+bYXF5B113Mara2WYVTAT3fJ7
 T1TPNLREkrZwoxmloXw==
X-Proofpoint-ORIG-GUID: b9-rCWwd37qLrk66Lsn3TSy8tzHu2MWG
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c3178 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: b9-rCWwd37qLrk66Lsn3TSy8tzHu2MWG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

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

