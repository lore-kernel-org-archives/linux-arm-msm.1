Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655803;
	b=TpCfJE9S3Xrzg9Dr+VnKnaQtN44OgmexV5p01xu15uHlStH7TphwRgL1LjE5RW/1eblX
	 cxTmNvxrhR92wtFmJjSFJv7lm8Gf3NZwTpUPr4g06L0mv/+ODYsm5lpiaPFKnAz7tD4U6
	 dkTk2WJz0vWxYc64pSKNhMhQvIWJXx9Go8nr1jm+KqMMH16+PD1Q9iH9FG60reG+t2RFU
	 PB1l0aopfAQ59zJ+r3VTzrQ3ZSSvtgF7UoRJ4PNt+HBiAQY5eF13w1FmWMWDMZeqYPyVK
	 5L4tRCsbKjKC/IqXgVEih9j9XeMGBbAoJVUqUsq1UTpYsJl/HEEDgd3MrSr3jjvFh0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655803;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=StjpzzgV3K5FMka2TqMOP7NLAIJFL8U/IFU/fNStwV0=;
	b=FAo5J6C4DwcJZJDB1O+LtCpZ97uD/dVxUzTzt44yksY58IU7VzkD7zPWWUGuFcP3BBLE
	 Z5VpIDsQ4r0rsmFt+kNUj5H9mXg35cGM32y9ttPHwJ5YL3BgxfmYvsVX60/iDBts8s4Lq
	 PfhOJr7lMijVk5kKRaSWwtMuTlGHunmOnUEI0KqhZ2bG8KIAWwDxbXD1ZubwKwAL91/ub
	 iMd2e5ACxHJguXZ/bTRkQcAE+UC09ognF5UMoTIpFeCC+IL+2QE5S6+b2VW0mOON6A+ZA
	 TFq5KAlfQwAdRNYRHNKxJw+i6ae/+rEGqeMWMxWcYujDdMq+HA3oJ6WgpqMJW8rEtMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l1PCjtMg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bVgWY2tA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402C8606A8A6
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 11:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 402C8606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l1PCjtMg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bVgWY2tA
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9x6E43166878
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 11:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	StjpzzgV3K5FMka2TqMOP7NLAIJFL8U/IFU/fNStwV0=; b=l1PCjtMgREQfKx4P
	zjv2l9uRq5lMe43qTPNoJN0Tgj6vGJILER7VcC32DvWY2sX+zSIKQ8OTrq0TE+7D
	fjcH2qGfoVzvYn2ZhyEwUs+cxRtx0qpm06b3raicfchLlLbpW3xk0c+yqaTz3Leu
	KcsIsdAzM50jijoUyYsiGhDnUZvQh4kxAi5XzHPDDTYPm1fCWtELPxbmkJTWJYth
	Eg4wv+nGokkQGHpPLq/dYUMk4XYdoglyVlZm4C7n3d0vf1gH5ZwOMcnwOJypuWdS
	wa6AlcnnAwH+RqnjbnCFpyWq28cE7AtGpE3wuwQCqeMOC0vinla7fOSW4FbYyx48
	LnlicQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhkw8kfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 11:30:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so417786785a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 03:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655801; x=1795260601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=StjpzzgV3K5FMka2TqMOP7NLAIJFL8U/IFU/fNStwV0=;
        b=bVgWY2tAD01OCKJ/mba2Y0ESA3h8UP4edt6Dxo0NHS/BjVkux5aR0n73hlnzhCrVQu
         vJpGaqRuIhjug2C8IYSrJYh7SZM60BfXPYR4a3Hx04CkNyrNFTxrr4piePuxo7ObWcdd
         gigXCcYYtnf8y8d4P7WHlakzvmOzUr+woXz7SUCXBehAMQAgw7nz9rotd6NeQr+0vkng
         0D1rk79BC0tskVhFvMDMEieSyXy0SnNbwnsoKUosE9A9/j8hTA2WbO9QGQ+M7Yxn2d9v
         IdEWk1Aku4kZ4Ny05Yt6KgoQJ1az/WGnY4Dgk7p++EdsoV1c2LegrUAICAtdAq2seRPb
         +u1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655801; x=1795260601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=StjpzzgV3K5FMka2TqMOP7NLAIJFL8U/IFU/fNStwV0=;
        b=AvUm3kQ7bOEOwlzfRGf1oMRwTTGIfHSt6y2KlO+iQ/+Y9NMq+yv65aQWUA0xrO5hV4
         r2+vfH9DuC+PuszRAh2abZZWLW2k9wRbey64SuxEc26ue+DBfXaKpQrPKjwtuu/YJzyF
         EVTFxcSniCyrjzYorMKcj82cPosd6ThNR5jM673CNyMitj3tNmKVe6joPLwRZNCrZVhA
         DXIOUXc2oXw87y84f4HoimobeUZEACv1mtgEeT1T5Ly9bVVRts+ka/pgvhKF8fZ7KBwc
         7itIC/NnMntpe9uSAirIzRdu/78RgW7f59TFAs0o8TEYGh6twKjsFNHNG+uQMkk6eqO2
         bSsA==
X-Forwarded-Encrypted: i=1; AL+hErHl4AWEKqfYLMH15vburqtlJOFlVDU8iZPGG03Zax4rYvzwrL+FS0ZEksB3WqbNxAPLLmEnckxoPoNrZCSS@vger.kernel.org
X-Gm-Message-State: APuU4Z809W1W+DHvVwEIg2v+MY6W0d7aUNicA850skuY4XEIO6JJzKqT
	fNnaJWrYabsLLauLHDuzGwsAbTmXXmoYBM4bzBrcycju2pNnQXLzM+aWSSiTKuhOyAATUY8s9pX
	PT0gEbryhdgFLU3im8RA4yctrzThdcWgji4W8z4t35hXaMNtBPT3+AachGBbh0TAY/cB6
X-Gm-Gg: AYBFou3COXKpcPQXgGSmxEbxcNic7O6cC6HHr03pQHexCkqi8nQrwZ4je33SvpgCVkW
	tKWvstUDfo6ZdrU3xHsMigQBu1v7TqlY2JAqxzFv2CKs71MTeEF/rNou5bCg/mI0j8oOnDkSkyh
	U15kGF2mQhasCatZ/+HJ6GoSZ3UMEgt6C3Os9wVqJxTyxSJjvTdpViHJFuQHWM7ULJKUsCfrtL2
	6FMfa9tYSOrttPqJCzJXGdz7r79HgjneX4iV32zlD3xZgzfS32rqeSQVI8oIvJvsq0TlzpM2esw
	LzkUqcx8axTEZouDf/z2Be0/QPedd5hEZWqPTVhh9jKWiYKS9exhqwMFXRw3AWdQeUBZfkXrWIH
	ke9USTsUUEnVKGNRvHFIFHrY6NAMvGz4pQE8p4v1+LIxG53Rq8zNsTcC41Ced7HMyRBx05kJRG3
	AqCtp3+r7Ecx9L8k0xy9LFWMgf9yVC1riQ0qG0lQqI
X-Received: by 2002:a05:620a:2b96:b0:93e:5fbf:a41c with SMTP id af79cd13be357-9494bbb7e8dmr822388485a.16.1794655801427;
        Sat, 14 Nov 2026 03:30:01 -0800 (PST)
X-Received: by 2002:a05:620a:2b96:b0:93e:5fbf:a41c with SMTP id af79cd13be357-9494bbb7e8dmr822385185a.16.1794655800997;
        Sat, 14 Nov 2026 03:30:00 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:30:00 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:19 +0800
Subject: [PATCH v7 02/23] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Eliza CSI2 PHY
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-2-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=1564;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=QtLaeWAMwSvDdk5BkCV2zOXsDrkSYOKz3w000Imr2GU=;
 b=ayq0vPZ8usswe3DyeKH5IP05zg0wiuLc2SqaQYyKdo7ap2j6Eu99cswy46uQjGiABqtEkkTgk
 NJnxyDfwEYnBqhIjRcSBPIsviU6LYc8w5T8W63QcoOphFlwacdYlmcP
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX4hj38H+/goH7
 lCatb8nkwOMIp458eXF2UdtQxw1WDEV2qvB1fhA4psiHjpCZWgcR480wxXQdxJwNoRK4Ug6ex+q
 SJpbWJQFeq5Dx/TOu/s5ywvu1NGxoKPFUB1vv8X1t9c1HLSJEi5hX0tB/8fXY4L75K/5wmluFf6
 y/jW96cQdm3qPU4EFEdAda5+++an8zA6JT6sIKnRb9hE21vpcvgJ3fY0NjptJjAxoy7tPhRscg6
 3PWkGp1qUU+KcOJUaogIwhmOFFW4Owu7+h5BXk7mAJp6UpaEsnbeTa+E+o+KwojFzhtFOeAb4Z9
 BSLuO8qG7AgGrDeJk2RB/PYyP/zeccDF5X+PG9L72l/ci/DTIshU9l6KrgYgxhsCgfqYXPmkULp
 dieriAdBgqcrmnKCKLQx/ZCcDz2SWzJN7fEJ4mtK5Mf+7YkYOvv/HSzwVpqh9x1Ckcd8zNE2Fe5
 kVz/4bnZ6VmAc67w2bA==
X-Authority-Analysis: v=2.4 cv=YPYKWhGx c=1 sm=1 tr=0 ts=6af8463a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Cn39VxbTSVwEGcu4l40A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: IZahIDFxlGpk1z2hncNRt4ieHf0pTIMx
X-Proofpoint-ORIG-GUID: IZahIDFxlGpk1z2hncNRt4ieHf0pTIMx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX950yEtpNy8E/
 rBvAStbEFaPk4xp07+ekNrM76qaijmhqnD1KS9kPdy1PhQ4snAbzqSmBJRpJYr2x6erYj/REXAb
 bEA/QAJie8lk1AYCkGrULlxEK0d3daY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

Add "qcom,eliza-csi2-phy" falling back to "qcom,x1e80100-csi2-phy", as
Eliza integrates the same CSI2 PHY IP.

Eliza has no MMCX and MXC rails: CX feeds the existing "mmcx" input and
MX the "mx" input, so only the power-domain descriptions need updating.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 8ff3df1d0d2787b2af0499c1e4106b86f56ff82c..884984f6f6b9e595df9bb3b0027c0bcf285b8058 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -22,7 +22,9 @@ properties:
           - qcom,sm8750-csi2-phy
           - qcom,x1e80100-csi2-phy
       - items:
-          - const: qcom,glymur-csi2-phy
+          - enum:
+              - qcom,eliza-csi2-phy
+              - qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy
 
   reg:
@@ -48,8 +50,8 @@ properties:
   power-domains:
     items:
       - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
-      - description: MMCX voltage rail
-      - description: MXC or MXA voltage rail
+      - description: MMCX or CX voltage rail
+      - description: MXC, MXA or MX voltage rail
 
   power-domain-names:
     items:

-- 
2.34.1

