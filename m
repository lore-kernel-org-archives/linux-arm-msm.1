Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793947868;
	b=Tbs/XZmAA+riHoNvjHOhV6zQCN7Bp7ZAxOh+e/sYGZzKUlwCpnBiFds9GWtSVtpqE1Cu
	 +e0yJdtSyYhsM0VPVIL0XLIUCzNLE4VVtDw7zMSEUjliQCQzUV5GDAfCZbrlbv73HfHt3
	 C2Lqqna8mIFcLyN6V9J3P1D+2ADkAsxfkUoM4WZqSuNu9zbYrRIzez1GkvEHn8fl0TLju
	 CXhyQIPdO1Vitww/cPevHQdLuWsrLm/RtUHqUYVkVbb1n+sfbGarABYlRzX5dk2WXCUeK
	 ZqZzA+0TZ3P/RSzM1XdiFGWtJAIx4zChBpun2VAnOTpSlyFKHG3Smn2muZFo+r303og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793947868;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=;
	b=UnX7z/OHm4EFr4f5GbRArRKv1ZS3T603byyWsbLQhvhm06tbzEKvK8ZUVsDgkVjcqjrP
	 OGhWXWBGEMYhTbm45bGYjOhPvXEHGDb5kkqZow67cnm+awrl2THhYdLdjG3ZJ3SmKbKgF
	 ZvMDbvhJfEEB9GukCfh4g6CrVuWZOPkCskQGmX2B0XtFLc5Iyf+MjoIaBCIutp8t1L8xe
	 qfeWSDbsB+DWpMNUSzS3N5Yt+S3N18PV4vdtDZna6LtvYb8WWlar60ji6dUO8x6v7v3DJ
	 a1XOSnCuetayKbMdwbqThMOiGIi1Ns/n/efv3BlF6jZb/CxaoX5kq1nMATFHOzxdHvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pllk6hPC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=frBOfoIq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3A5606A32D
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 06:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B3A5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pllk6hPC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=frBOfoIq
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A63xsCj3856507
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 06:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=; b=Pllk6hPCzbgjTS4L
	Lb3qhY1U4RExnpmitgxHB4Acq9kf+EW1lSTEYMFPkm31u77F7GgpkWshZJnUDL4k
	DrfKbBkj4uoVQBY+6JissiFCgAxJjdLtIVEmPaH5+HUZ5mUOp/upOiN+sPHLxmt9
	EPdf+bdPg0zUfYMc383hHEps9/5lZnYvXzXi6MpIPs0CwAVv3kjr6ckwM0nK5NtA
	SaQ9pdftVfLPd+oKZCPdCuhW7oCVdL3k3UxNvhaHy4W7ERyyaiX8uz1/ZUcXQUOn
	JgDs/sVMpkjF3dhVG2WjiyXW4eik8Mugx7LpxdceZQ6kUH7vdhbFd4Mx6uZuvjXt
	mvlm3g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9sex8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 06:51:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so382953a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 22:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793947867; x=1794552667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=;
        b=frBOfoIqLFhb0tr5lzaLQSMpMDYTPUe+Fxakj37QjglurscRcrbnyVG/77gjVpkCIa
         DgeQMpGpQn0EtQRA9ALXPKvgVy+Bj+BGF7zdPECukaIj/yLzgJZnqOq0IBuJh8CLBHc1
         lnaHH+IROQgwCnBzPh8qsc3J1iRFFTKeHTBWrPLGdWi+8/ZMqfPKpPFNgSW3DPe/yG1R
         vC5qUeuNQda8SKbVyKptd92TvfvRuRc6OiiY3s1i+5V+J+OIGgpsyk6ibbuN6br61FmT
         p/X7mVl8b2IxRiZk0+SeiyDlR5HnaAdMwEz8jWx5f48AmuLI4ToxEq9i+8qSZav0WhJP
         heJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793947867; x=1794552667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=;
        b=Px4WsQp4Q71n81X8nOfoCZzPCUZLPhlNf7vEdIkjH/F3pIhQqaM3Q6IGtwMwUp3RWo
         cnmtH1e/tuLAJUQYuibbuqnQye6fXmMgdERZAzKv6UvVL4PVPPJaEySFopUcS9Ck/8Sh
         reiWT3bsNpTfaTEN2MVrr59htLKHmjkLJBSXBTO0Jn+Db63HtNGYge3kl270XqN+XOUA
         lFZB0nePPqoWXZefb4KQkpZuQlzBckn8NFZZ9Cu6HHh5RhuiHguMqysXNUQhh0XzcXAo
         tPKbtBxuzXrLUEnfrCzp7Vwgj2ypA9HI8cpljZVF25pZXsUHICcQtXGRwX8yqrenuH3/
         7ZLA==
X-Forwarded-Encrypted: i=1; AL+hErFjmHyj49LXgno0mVX/JYgzQzAEM6kEmHFSfhtto3muO+CjSThRfZnjZyv+Oqqb6xBOWexrW6tga6xbPaWB@vger.kernel.org
X-Gm-Message-State: APuU4Z//ExkWS3AzkSdRUU8hW/2GfzcR+UpXrjLh5BTHwJerWuMhVMPR
	ZUHpXnDuWCYNW1HDRbI+2HHocW0ubuquf+ht9UvTVbSH0ZEFOXIdJQe8P43aC5Yb87fePpeYPeW
	ZXuXnlKbXC9HIsRZGosHxVrIzQ4Rx2d/5CmgML3PeK3k6tSWoGtQ0YSXgYTPP6flZ1qpp
X-Gm-Gg: AYBFou0PYcjPyc96TTsaVBB+nCymgV6GgzgUwWVRQcP7Gd/vdb28biTs7MihPBcG1Ie
	86H9FA8X1ZS5p3dhuyfb7tzOVNhMj+ir27naFH2/TSM7pbF6T7RQ2UpCSCwDixf7vglyfr7Y7q1
	7mCxin8rF8nV90unC/tvLG3BK/5ujfzd27aokdZWP/ajrloX6mR6OGjn91WZJfZ6P+tRjiaa/Xj
	Mjqsf9wL9kyeZkJIqYUiH1SF86w7ZsxVQFnjkKo1flFRLUtblso4uRduXdF+Sf8MDnci+0t86uV
	sAFsRG06HkOUH0n1w5JOpCoDI+q4b4JKetUSPi0HqSi3az6Ab40XSn5E9/XLZ9KkJxUQMl7nAMJ
	KakVRCxJGoCOrqTnLmxf0aQCkPRuaHuKUvSP4xmlmzYGBbJqZP0KLZvH3cOjHi60iOezGBOdh3V
	btLt3/
X-Received: by 2002:a17:90b:4c4d:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3b0db6ee69fmr1388252a91.20.1793947866835;
        Thu, 05 Nov 2026 22:51:06 -0800 (PST)
X-Received: by 2002:a17:90b:4c4d:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3b0db6ee69fmr1388239a91.20.1793947866358;
        Thu, 05 Nov 2026 22:51:06 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b313c0dcsm6597274a91.1.2026.11.05.22.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:51:06 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 12:20:43 +0530
Subject: [PATCH v4 2/6] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi
 and Maili compatibles
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
Message-Id: <20261106-hawi-maili-camss-v4-2-d528c7a797b4@oss.qualcomm.com>
References: <20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com>
In-Reply-To: <20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793947844; l=1461;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=O6JOHgjWCf6k0+eXloLMxj3S4Nm7SEUIMrYIjwRLIus=;
 b=0J78F37O0f9bKC6fbPmKMswzabA2px9rj+Plc3qcxMWcxeMS/pTc9HKNtYs+5MrbeLGZVuuNx
 8WyPRjLiTw9D3UZX5eeVL7ax7VaLBS58JgE1DW4/yo7qd9ebMIaIoQ6
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyNyBTYWx0ZWRfX2zyptdmSX9+k
 qmUfkqGQnuOwIuDoO6AKXVVSQKD3fw+jpQxB5+bLhkeCCEHpqmAPa7kyUoDnpFYf0J3PVOp11wY
 gtXfHJnLF0hT4OyXq8e2vTaXTCDLwt4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyNyBTYWx0ZWRfXxtwb70/faoNE
 6c6wVGjQ9CUOdj/9H0VAVnaYRk0x4FmXKFVCymvkiv0i4R3VvZKxLpWNxKFjZp8ZdhJnx4uM/0N
 kkPiXrHy33uBjdH07Sxo0vmxAhqy+ghM2SQj6p6GNchLD3h6cxu1bLTEwDS8fmmqJzAq/71kyYs
 WzVIyDE1h3fe0PNhMd98zXa4N7fULn6Olutw2BPkY4kniJi+1ehpeFKD6D1KoE7wnbfM9lDYxDl
 jRPhV3hys74KIkj+TnHrvhjD++dRCwUvbntnJIiEcOXEzs6X4XsZjAFyCgNXCd8kvbMlc5gjUWh
 SYOYM3KTdebXQgyCAmDxKOsckgAvLWo1r4E9ULtEDeQBmULLwtW8IbUaNQh+ODWKTvUTD09fky7
 OwCJkod4lhcDpeMzSQADYuMCj1qb2LM4j7Dajgr3oOfD0vZzCKrp3rxlSoUGDb8fYHz54K6bx5L
 Y5t+uTVY9lAQzpL3kkA==
X-Proofpoint-ORIG-GUID: dCfxy4eEK35O4lXAl-Ft1WroFU27ct8W
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aed78db cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Qbo-v1IXpRF52dvEqNcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: dCfxy4eEK35O4lXAl-Ft1WroFU27ct8W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060027

Hawi and Maili integrate the same CSIPHY IP as Kaanapali with an
identical register interface. Add qcom,hawi-csi2-phy and
qcom,maili-csi2-phy falling back to qcom,hawi-csi2-phy.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Co-developed-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 6e9eb8e265df93b631101ae13f31f6365b6239b6..627aebc7cd9b7ca313457d3f70f72796e9671e8a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -18,11 +18,16 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-csi2-phy
           - qcom,kaanapali-csi2-phy
           - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy
+      - items:
+          - enum:
+              - qcom,maili-csi2-phy
+          - const: qcom,hawi-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1

