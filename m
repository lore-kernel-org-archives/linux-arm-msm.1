Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5E83537CE
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 05:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785474842; cv=none; b=fpakANUO82ZMCfJSbkEYcHu1KnNq36wAPoYHkDbpsc3aeU+RilceD4qgFtoxMC53UcF5ha2TFUfKHlLLQdw4lDJbj56B1LWh/Zuonqp/05CMETZxqg71YqRoj3jilz3L4M+rAGFD9u7lODnw+tfNpf/joKIY7iROiswa1IZrs3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785474842; c=relaxed/simple;
	bh=yFqbRmvKASE8ispuSnhnm/irGPiWYA6Psw6pyUHDm8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WutyTn+bXXeEP0PLTWxP5hUdmyNygw8YT9Eyg2HRWnQ4BvYx1388u3i1voJpKtoi3Pz11xeWdTLeIMaP75IIuiiywGOyM8EyvqhsIMbJYUovoKwk2ed3wDR8F03MiQASSveqQAvMLoJWkbIpMld96MG7z11pAFiXs3TagwxUS5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iYkfM3WI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YgJA5Fu/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iYkfM3WI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YgJA5Fu/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V5AcGH3509488
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 05:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6d/2U4YewFRIIf4iOJkyKUmed0nCfVbt+7pCHInXOPE=; b=iYkfM3WIGZQpLlH7
	XRlqtJ1hbHpEIqzx85VwC6qgzp87GuA4diR+TaSxZTrJd9/jWPJrcsOcx89joGWx
	MylrPsjQBC6EKGPXW8HxlrxXUAZKsvQ6yeR7X26HIqZjgXCdllmyQk/LY+pWREpQ
	+OfNXtJs5dt4rXlULdhODrEvsbz1LmG2QRSIVvPm4cN8DibItH4o4af3UjArjOUI
	eE99os1R1sqwm5PKXJikLiZTUeH1zAw0U1GHxAZklX8e7Gl+3xi4TQEIXvA6awVU
	X1AHMMmb5soF3BVtNJoUrjoFLEKUCgoAt9zUCPmV7ltwTOszhlIkryPcAlAOAeL1
	a+F28w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frnavr0bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 05:13:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso2093307b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 22:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785474838; x=1786079638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6d/2U4YewFRIIf4iOJkyKUmed0nCfVbt+7pCHInXOPE=;
        b=YgJA5Fu/0KWeYVgQh5nPj/8936N5gI0gvaDWrzvwQYebVUw2umvoA4PKb2r07wekT4
         koLf59GxHoJGUGh3GS2Gs148p2706IBmHMsYvhVQ0SNjraW1FHZtkaYIoKQnfDssL+JZ
         PFXiLXOE12zTbwyggL0uDqz3Dgm8wqQLc0qfjYv4aCXcz3SOjKNsi5zqwPzDHIdRRZh3
         ZztngyUc2oewUYGGsJgVK77B9qUj0jwNgcFdKPP1AdDGeudpKdxu++XAJCpEgUkf2ger
         eosxEI1KGxmvPxr/U27FaF7e9DAcGakbO3glrk8D7lIYLhkqrRChmcqXp7FUVK+QRa5V
         uJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785474838; x=1786079638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6d/2U4YewFRIIf4iOJkyKUmed0nCfVbt+7pCHInXOPE=;
        b=pafyrn2QkX3h0j820pOJC847BNDnMFY8t15452Ub51FlzHbKHNSUM+NnFrhCiKIv++
         MhqcT43Hr/PXCNNPvUitJ1MMyIn/e6syiMJiJlThZP0D7X703OFhtN2KSzqqppmrtNRU
         C/wGr/wW67iJG6AH2hZFQACFl7SVtJDACq7jM51IFosMOaJbLyV9C/25u+SdJWcpRuAO
         kryUBkxjIAGM7OZ9Bz43VARN/Dypf+GxJuQMc70cMhOkV4OciwzJ65x9VRTvlHM98FDa
         gjB2ybxYxKYYODiq0QekFDi0LybCKNfRTFy9DmLsSDbhFdKXVyrEnHhdQdjFAZDbfFPK
         qpxg==
X-Forwarded-Encrypted: i=1; AHgh+RrNj1NsfyZ76rwzuvvoMfRuhMXW31xwP8njSSzbDdBLVAzqr7t27jJK96JrX9Cz5n/DnnKWrcGHlOg72K2k@vger.kernel.org
X-Gm-Message-State: AOJu0YwjlUesn5uwtJV89zkag2f5orwaf/0Ts95ViVt1A06ACAwmO2XR
	Ngu8CdTzp2D6wGlw1uaTR43uXkg4T9LZgIvLJp26DeH1pWJbVtgiYmRpzz43gV6OO7Q/yzlJmAW
	hPbABZDebEPVK/lPbFj2c6+CMODsyAv5UiVKZ5waJwkhYKmaPFBJXKhdlK5mVEFXF3fuK
X-Gm-Gg: AR+sD11SsJi+OyOwv2PqHazxbRLvx6vj49xfEl/tcBT2h0WE2RFjzu29b77DrdBC+UF
	4OLLYVkGQvB8IPmz44g5kC0HMfGMrRpJdanjq/b6c/auty8EBzWfwIEHb3DKIEP9e2MgasgBkLo
	Eq0P7i9+aSmFSntjBKHMfJUK2flwlkWUkecYz/HVfmz0xwz3clh2NFZK8ARewkzvE7p/dJJct1s
	BOBYWTHgj4a3HhaCQCoEJazCeRAPCNTOgveLRJrY77Lotqr1oedSBSXAtAZdOMpp6MRWiziK3wo
	Kc+g1mvMkrAZeVVQd3m0b4LapF6zmr29jR/5AQcwe1WJ7Uy6WD1CYTaVdYlV5yRRkHw1yxPExoP
	8hJuNmJwnQAxHkTg/HNdu1wgTKvRUo3xuOIXGeM5o6gxlHWw=
X-Received: by 2002:a05:6a21:6089:b0:3c4:2cd3:f0bb with SMTP id adf61e73a8af0-3c91a777750mr658209637.10.1785474837978;
        Thu, 30 Jul 2026 22:13:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:6089:b0:3c4:2cd3:f0bb with SMTP id adf61e73a8af0-3c91a777750mr658182637.10.1785474837511;
        Thu, 30 Jul 2026 22:13:57 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06f88fsm976435eec.20.2026.07.30.22.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 22:13:56 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 22:13:53 -0700
Subject: [PATCH v8 4/6] arm64: dts: qcom: glymur-crd: Add PHY supplies for
 pcie3_phy
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-glymur_linkmode_0731-v8-4-a455265ad8bf@oss.qualcomm.com>
References: <20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com>
In-Reply-To: <20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785474832; l=1071;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=yFqbRmvKASE8ispuSnhnm/irGPiWYA6Psw6pyUHDm8M=;
 b=T/PpHPPG1SNWAOP4rQ8qbe9SpmWnhg8+GxiGQJf3+b2vhabGXPIUOnOm4hoAOcWwde1Jv2DNR
 qBJJQp2d/YCDPYk0pWbXuTH/CO7L3jLa27MdLJQBLUOXg1LnuQ5uM0w
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzMSBTYWx0ZWRfXzpQh9u6klvHN
 h3EEJe37W4HlAWRCrVBkdqES4KTr38eXeyRXbBW80/OoB3KXY3BotZpjflC16GjM36B0Z6Q3Qb5
 ZsWXXW6jhIw8M0y24ZfYZW22qtNajwpA5zq6KUnIPoIXeoxLJ81oH03wgJl6F3HfvNhtFHn+CPI
 J3UDPY9EDIHOSqrsTpWq8IGiCItn8P1ugidH2tpoCOsPatiqBDcDwfNn5Cw00BquiE66jazgwuo
 y7YMRUd4u1+Jma+UvgY8dWD9wPX+ZLwXClkr/7LD4+/916GfaPeRY8ioU053UgnLR/HIjv+O86M
 HY7BaMPq0Ink/pVEV5vaIQlqaZ/ccgSHJ0q8nlA6q4t8ELtXmkiXHwDxeAUOozwsAjeP9i8ZvgI
 oNIaUVMNJu21TncdynUutOyEUQcdYRcl/QPiPlgMcKJGaizujDYHnDGQLp9suEFGge9v/Fb9hqg
 KkXQqlTyCPii0FOAEeQ==
X-Proofpoint-ORIG-GUID: V1YwrqYIqPp9sjdxiCaCuxhpBaXRm5Wq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzMSBTYWx0ZWRfXxLJaD2T67l9v
 FbT4oN5/HR+9joJVWUaKIX44g2PrIA1gILV33qOGrLUfefOCjoFvx1QP1prgt2SbQ8radBq4gQq
 jFdbaLmXAFwTc5hL3OQYiOTMdsGWnrw=
X-Authority-Analysis: v=2.4 cv=ZYMt8MVA c=1 sm=1 tr=0 ts=6a6c2f17 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=QdOup1CusybIpKGx1HsA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: V1YwrqYIqPp9sjdxiCaCuxhpBaXRm5Wq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310031

CRD wires the shared Gen5x8 PCIe PHY's regulator supplies through
board-specific PMIC rails. Add the vdda-phy, vdda-pll, and
vdda-refgen0p9/1p2 supplies for &pcie3_phy.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 44766a73b0d1..b8e3fedcdea8 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -29,6 +29,14 @@ &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
+&pcie3_phy {
+	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
+	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
+
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
+};
+
 &tcsr {
 	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
 	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;

-- 
2.34.1

