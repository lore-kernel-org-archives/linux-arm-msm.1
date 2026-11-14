Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655795;
	b=rsDhxOywOIWpREqqmPLRoLXwSEVJkZ9AQS19JziZkI861aUzSRZU3wyqpi1k4gu19LYV
	 /28tqFjnpd2rTllB9aKdsVLcrjob0emhUPSUbBS5wOjsdxqwJXmULxCzWe05r9RG41E/F
	 hpo870cEYvKBk+57x+eLg8xpzzuD2BzAwgjOMESGdcstcbEI2GSjIrhXt/ksyrvGulpIc
	 jZ1Vic81nc96BcgjZG9c2JDBaecCHE6lq0lgqEkpfW5SmXpVek1J4/OfjRZmz4PavEvIh
	 mBe8vnl+uxk5ehGyfheAHZFQBHXt8aUWZR2I4IKsJZlzNuMle13fv5ftIHmfaU2hfYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655795;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pTyV354OgCgsC+UdeFF5DsnhBflmhvuYXStEItKr1io=;
	b=pvSaMH0DsvUUovJqlPAJsHMVUtIWFFN0e3/QPAlGGkUyuLhdD2KmMslW9mHh1mXhJDf2
	 5iYpgTLA2adzJdLNHlNoqMgnlK2mMO4V4oZj2rgblyV9hvaB03dIeXCFpn5XTYRN8QZju
	 B99xb7WTdLL1eKoylJaaIOfzOPEPTzwcTF2ZPiyvYm5smZXik0Mydza7O+hoBCW7K1Pdb
	 jr8vLnFquR0OXQlI+/ipx7cAwxrVL24v6WGu54pK2YF0Fr9Hi1kU8n1QDfOhPAuy6gNrK
	 YpH3SeGa4f4Fov0pdB+sCFs7wF/EN6hzyzwImTEsF3moxIsIlPj7wTOtebLvAWb3MLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eKQUzFz4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bTw5mjsl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55768606A331
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 11:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55768606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eKQUzFz4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bTw5mjsl
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wWMw2055393
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 11:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pTyV354OgCgsC+UdeFF5DsnhBflmhvuYXStEItKr1io=; b=eKQUzFz43741krLN
	/oALLtSYyXkq0AcsL/w4XtHfQeZ5csEulv5/mfpFFrY/JJKvqe89fx/f2KSIy+eJ
	dISWagwXVvYwdrmxEgJKlLjP4BRroC9WQU8rXEIBjFB5NVm6p3jYJZAgQzT1jh6y
	y6yNldtHt2cU5ks8MQhQz+iABPoDl+LWmxBTIGkK/+vVPo6tUsfWgQrH7L9kBvBC
	BbZxkXQAC59IKutjCFhj5Hmv0W7oNolY7E95TBTBcGfEOsXLrNls59VgOLQL7RGE
	nAX9B58UXLgmi4qZwcku7szYxEiS0Lp3LGNCnoLEyS7Shlos+vN785DJchulAnly
	gwrJFg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmc8kbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 11:29:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-54af6c38092so20273601cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 03:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655793; x=1795260593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pTyV354OgCgsC+UdeFF5DsnhBflmhvuYXStEItKr1io=;
        b=bTw5mjsl2XeBSnAS/SP8plkBB0HwhuPDpySTU9WUepI10qEYFfjN8fAUhRev7vvGIr
         pW4ewrNwYbvXA3gvIApABSuJuf5UoBYPtfFqRDFRi1CoYje7qp5TZzaOs+7zMDBbmXBM
         RUkAricVyd3Gs+XBAD3wdcOTnqL9sq1QUQOQsul+51BFtUV2376O0bSDl/7dyr9v2ckm
         5MByhdwVK9BEnCyqrsPUZsl+JZCRrwSbq551FgLYZWtUl9+fBe+AHHHHIUhYcgb+N9QB
         TN9Bzy1SjQbZgpmghBxhaat4ard3e2rRpB7ZIROMy1tvSLrz/dArSiCRqPwk8ATyFd+E
         WHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655793; x=1795260593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pTyV354OgCgsC+UdeFF5DsnhBflmhvuYXStEItKr1io=;
        b=2BCfS1haCZ5RmIq53QJ8fRSWc4ZraRZQBk2yzHD9Y0j11eSVt/Gm6aralctzIKLqyS
         g4kRBNWqzXr7j5eJL2l+/rBcDLiBIqwhlPdnuukQfD9pk9MtcTJELEwOy8XvFTwQRRKW
         d+f0uxHZGeOfpNUQfOKyPgnYSn3CIhNoUGEVi9FuOXogHeZOShZZrdfkSZgI+n74SPu6
         aWoSHixR6BGN0qyXMRdvyIxAT/2dbvRK8T6unqAXZBMy+Rh9NpzuR4KOiI3XMlR3BSkU
         4vxeJJVI5WyRhAtRAvkek2qVoO8cc5hCY6AuuHxd92nRCxPPB7eBtOkB2cSBzMlWY5FY
         WDgA==
X-Forwarded-Encrypted: i=1; AL+hErGNRMMmMgH8Yvfu3MNHvCktzEDdI2mawlj55LOhlk6ZPUByK6cyizYiTg4TKPbGRn+ALFV3pOdDITWfdjtA@vger.kernel.org
X-Gm-Message-State: APuU4Z/iMcmew++0gMi+TbqiZjNRpVBe5ONDpXh8wMt8AUHItDKQTy6F
	ULKIyJj93yJa04B8U6yYbXBoUObIq55i4SXk8wDoyA+pHEeZWShb1LQ1P0ZJTWV6FMe9KGbs7gL
	IEvSxWAxy2ulnNUPMvd6JsXo6LNJu4BsXQM3tm98VV/wE5ZPQ3fGSPwwP5aeBLV7wkwuZ
X-Gm-Gg: AYBFou1ir/huI2/60eDPoCej/2YPnjifTeHrU4Mn7ORY/t3+vsf6rOw7biM/dVcnlQ8
	PMYgWeloxXH/Z9ug4D26XJwmyoCL2isYKFlIIIY1UhC60X9l2X9NFtwHlC21hJFz7jTZgl3FWXF
	jWSj8JmtUIeulal1z2EPcJRpAXNKusgK8sxYZrazsrjsvZvnG1VJz2SD8Agf7goiik2L/fboR4B
	xJWaHmHltRuo/RqT0VqA+6D03Bcks8bUPzsufF4ol+TOYwb8PMC/8XByLpZ3NF68z3KYigSmhV7
	DiJP7HBZjc1UmTSpcfHV1mBqI/z3XaYQ8G4sAJIg4BrP3E5jPiRsUY3oRe+LxeaslXZsEDGHves
	oaLYoyb5PmDvIJ7Ej5Rm1l11tDDvaZXHPIWmswLjDuPbXzhKF32JLJu559gCPlHdpE0tJSO5VEX
	OG5RNxMP4A9kZt6rLA8ojnhipP0pNh8YdXxKPYi9qC
X-Received: by 2002:a05:622a:5c07:b0:55c:37c1:aef7 with SMTP id d75a77b69052e-55c37c1b4b8mr34089521cf.77.1794655792612;
        Sat, 14 Nov 2026 03:29:52 -0800 (PST)
X-Received: by 2002:a05:622a:5c07:b0:55c:37c1:aef7 with SMTP id d75a77b69052e-55c37c1b4b8mr34089191cf.77.1794655792088;
        Sat, 14 Nov 2026 03:29:52 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:29:51 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:18 +0800
Subject: [PATCH v7 01/23] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 SM8750 CSI2 PHY
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-1-8ff2a11835f6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=1075;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=LFc6jx+MXDH94lWI3ZDmmoldzQASgCtkGLGfmGw+wwg=;
 b=qQbMkxieG7t3MHs39IJqk6/8ONMjTaPIKB7+zb7r390+yjZnta8SFA582Lw2EtjV9kt1MoFe7
 ZbB3RdBwSjZDb0AfWh6sGDhV1szHrA9qdW8cpbOGDDd8ztsmVi4NfG3
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX+ToEYJDyrTA9
 1h7xFw7zLE6bz5piq3jBe53ai9WtjsJ+GAmxkQdQwVJNwAMgI0UAmJAG4Pi49cSTLGUP3V3WriO
 8N/hEpylKTA+VXkTIVJdVHqea/JGYJI=
X-Proofpoint-ORIG-GUID: qlWpD2U8YMn0a6l-tEF09N31Yj4ddRL5
X-Proofpoint-GUID: qlWpD2U8YMn0a6l-tEF09N31Yj4ddRL5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX0jSXAQU4K1SE
 aYFMc7+viPFUqXXJXMgW+o6GFmxwMgFvXujFUXVBokxwTyPWVTEQXFJ4l4vTd0XVc1UK6/eo6Uh
 tPnJFJOpeEdagUFdGLTPy+8nukXvzm3myGa86h4aDpj+wcK1bnsLnZetQYaoqDHiaE9hahBn6wV
 3OXFYuHawPMP/pBegDOshz2uY5jJmlMlbzQ3Vi6EV8qp/v+G/4MPZj68A2RdpBZyVj51JBJx7+1
 f2om6zJCfWVe7Zsgh06uLO+ETbvUhqTM8bXN01MKOlWzL3Fl+Bln2Dkh0SXK6rAenk62N3fH/hz
 Yp9hOD264tqx66QYSh1eKNAlGBVMjBq6viZ6Mr7NOEpGAGsxB+E6muEAnWppPTj8ztmEL4jNQTn
 LD1lmW9GUqiLjlxYTsn5E3VD0sTIpb62x6RYH9T/P+nIAvgAAxSa3uZ2FlaUS0nA98l5VIsMJh3
 VyaZbK6Vh/gQJ4nxVvw==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6af84631 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=CbQ82e2HgpuiUCsW3z0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

The SM8750 camera subsystem has six CSI2 D-PHY blocks. Describe them
with a standalone "qcom,sm8750-csi2-phy" compatible, so the CAMSS
binding can instantiate the CSIPHY nodes as separate phy devices.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 6e9eb8e265df93b631101ae13f31f6365b6239b6..8ff3df1d0d2787b2af0499c1e4106b86f56ff82c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -19,6 +19,7 @@ properties:
     oneOf:
       - enum:
           - qcom,kaanapali-csi2-phy
+          - qcom,sm8750-csi2-phy
           - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy

-- 
2.34.1

