Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655831;
	b=IypGhgocmaczDWMF2HNMDQc/JiYls6BDXW7r1bVW5kKNq/HszPzFsxJLOepqd56dA/YE
	 022SfJsr8a3cKTOzCEa/+z74y3RGrZFKmd6/aSHwlICa28g7ukAfAnWNrw5T6A1UH0Qf9
	 R7Kxeh6mTtwg3OTOui93VjJ+xKIYZxZRGhVf2uhsPW/5vgxH77z7IOrx9O8Fo87/D2TO8
	 uzEaHQmQFxdBOYW/skaSj6upp5qk7J4Hy7K11Olpu8A1PHo/tMqk1DMSjCUcZ4ytQJMbL
	 YWVy6i1hXiAnBYjXUSL8a7mHdGTceN+2uVcgaDk4KoVBcEQDem2AeP8M0DdwrCCVhqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gTSf169frfMjFZsMxW4csMunjCZN1T8v74xtvKaojKc=;
	b=kYRigC4EzoxsvmocEqiMCveROAMXaNckzcVeBWnJVXnfPlOoc8H2MxHzAQKiVUsx3WOC
	 hM1gauv+MNWlyM7ElqR96JiePpMCMQWZnvtAQJyt57SISg/OjM2fdtXJKJmNumROl5+xK
	 bwsfoqy5TkMf0aQy3H6Z6qoCtPsyf3M9jps9ZIucmZ75xfd1f3rcjKeJROxgq+3IlVma4
	 UuPUw0/ZRL7WQmzY+aReE5LfXbVIpI8e+DjnqigFuKkJiWrcM4KmttXUAD5Ty6787pmZ3
	 gE+h4f22Qu0fz9iAsJQqalK8S66S9A9EdpBzz4Wn4/r5cGYvktsn70HWJh/bVfdXOJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UMfat2ax;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YAWRbO2X;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6A5606A334
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 11:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA6A5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UMfat2ax;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YAWRbO2X
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9xAAp1090666
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 11:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gTSf169frfMjFZsMxW4csMunjCZN1T8v74xtvKaojKc=; b=UMfat2ax+68EdAj/
	tN3OQH3rgy2YMQ7HZ3iUEIoolyUOFJyB9OYDkFHOJnY//GU0Sm5DsAPtFFtfFTmK
	yJABxKn4Xg07JqPfLUxDivHhVzddOr59fr+zdO0x11qOER0GaMcpI1YjU1W25wRi
	v84PQwwfWXgZyCr7yVP3GPZURGj/2H2kHmHATgOqN7iPXoQGnLdbE3zRitsZ1Uek
	2ar2e8nRTbxfbO9nYdXuZ7lSDraPgL4UK/7JbVWf0JJ3m9bOjc2gon+LtUNY8IqC
	XgZmR41ifzSDtkKWKcuoHsjf0yQvsHYyexFpQCe1JDVIZke8XaVWZ8BS0oS3Lq5S
	8SFPnw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8rkvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 11:30:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91eacf20364so40700756d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 03:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655829; x=1795260629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gTSf169frfMjFZsMxW4csMunjCZN1T8v74xtvKaojKc=;
        b=YAWRbO2XjwrEofSNKRgJ+tdVY94h2WEcUXl2+DrXlLWHmWmLTm7aXB66nqV9XQgYKU
         EVZ8DdA+TG6F8hUQ1Ox012hue13MF30WnNsmPNQDVnv3tqxclPU5fum6dNLcH42c5HLe
         UaX6S2Afyb2HvqfEQkA0LIoVBdgO5hUwo1XWIu2NnXeGIaAC/ipeFNffa2EYdC/c/jqe
         WaW3CSGUPc/056L6WYpyF3c0uXV0PhUHv4vwmjOGNR1TPWH6R6FN0Cocn0ONq3U584Cn
         7l3mzsFG6Hzhhxf+kO8paHNgVRPGkDPGgx5KUNu26QGg11QhnayfamenAnN0M1gyAq8b
         CR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655829; x=1795260629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gTSf169frfMjFZsMxW4csMunjCZN1T8v74xtvKaojKc=;
        b=VokcRxmnYLYCuVImCEPrm0ofGG0Zkx5sZHnoVWzG/Y/x3daSHrvaWNz10iFdJvhNmv
         C5ul4DKiH+lRtdw18zbrQe3u8HB/ApKMnZhHBjX13PDljqt0JeKR577jLPYPhIxuJE0z
         XOZrPaJYVpQfwT8ULhIfINA/AGf8Rjc8gP5/9e9AKU99YRF/xTkmbA/9X0x9rVD++QVR
         NXaHcepESEAo3NkNUeeBNAh6RwQOZKxzJajJmwmH3vgSkkMzIvDRS2/3NUF24wrJe2rH
         a9FY7WWN+x8Uu59QIxQzO6oJm/He6MNI2ZQpg/tr2u/iXbdeK+C2bZmSQ4Ll5llqvqfg
         gfZQ==
X-Forwarded-Encrypted: i=1; AL+hErGFCrMKbifkZq8htNQetPGIksOSgBEuJ82ZY2tLF/RahV+cP8OZxcWT0+Xv5ecHwuLiZrTE8znmWNkGHrYW@vger.kernel.org
X-Gm-Message-State: APuU4Z8uMJrymFCUEsN659hINWcseZuxhJvYdaVNPf8ZRcUf/eGEPDWe
	jx7JIZp7yBGyd/3Doac0eDBtoY4pSi8MfoZG7qd4tFbFyQNjh23/1tV7FJWE7C/aBl9m53q7Bkn
	K8tqV7juWOytLN76Lh1LDc2WSf04SiDqCAI5O9wQz7GGc8T6YbOUXM98ipxW3ost1XB2u
X-Gm-Gg: AYBFou3BnyMIhoYascCea9QffGBptZv5YVKRRuNtkJABzlUP9wl1ag/pXDDIc8Nk1oS
	glolMmcG9XhviBhz3/Fo5YcymThvos2ry51eWeY4kAb98G73KdpXLD48z6q6I3neH7QtAbp2WPS
	U+OQjaiGQoSTT4riU2sDWwVYVZcXZAaUv2meoCuZZtpmXfkbLAheRcK9QOUc6OZntoC6iBg0YFu
	k24//4tS2gXwQmqz73HKzMwT7SvixqPtbQ8iZ/04JKqV2X9J5dJUMn1swWEizUdL4e2r+/LwBcE
	wuSGdwqkiHyfJWxXKcvcQwEDV74vSd8uLIH0kthVVNjKRlKT70+jV9bV6Nk1w0OAZWbYSchjIbt
	KV6tU0H3MmvEDENmWfUZwp2ynQA7i82Wsap1mg11P2FuRc0RMFleWX5/BM0Z5zJ/VcR+gnNnYjH
	4Amo1WER75XahSqgt40OZ5/yAjzRK8ao4nHC85UeND
X-Received: by 2002:a05:6214:4a88:b0:91e:7d3b:4dc7 with SMTP id 6a1803df08f44-91f24294007mr84960476d6.58.1794655828831;
        Sat, 14 Nov 2026 03:30:28 -0800 (PST)
X-Received: by 2002:a05:6214:4a88:b0:91e:7d3b:4dc7 with SMTP id 6a1803df08f44-91f24294007mr84960156d6.58.1794655828431;
        Sat, 14 Nov 2026 03:30:28 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:30:27 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:22 +0800
Subject: [PATCH v7 05/23] dt-bindings: i2c: qcom-cci: Document Eliza
 compatible
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-5-8ff2a11835f6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=1069;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=61yDOYkYSQzcaMNW502STOCKhR8JM0wrwP3tqxLNiqY=;
 b=ZmGzJUN2j2tTw0MqwLjAcolX1NvdlwsYsUMfPFvO3fQNEEChYTiWO3sjeHeQOIt4y2OG5zUEe
 CeqCoKP/0ZpDr+LXQ7U4OzMgWHKzuzFtWvMJMaE+uaKoldTk+I1xiVq
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6af84655 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=phzA4CzYhpZqrDFsW3YA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfXyb2Qj1OdmUA5
 d4F7vzSgSOL1e4rIMpWjCdiBLnlCrO6r4z2vjJLNsn9Ngb42IALDPVHrohExcnaeJnhldTg6qlY
 3E8amcTiH9qNmIzosVmUMUXc9JKDFE4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX7nrO5FgmACuz
 09NFgFoon3XXyPOtxOiH3z4jigIiKUQI10K9a12zSUJKww8JAAYP5Fj8nEaANzDORAgxnkoeKyd
 7YVBKn6EvBOClZBgyMj4NvTkHN2Frcyj+3vdTZCCb1PYFbKaMrzlBqx8hHrmyhin2bDFg23olcr
 lxPWhRfsGdFzEaPQROUJyPT1FbWdN+iTQ6ZNeUvXGiW0qHNVRIOh4sfLneSTwLm0OGEQyn8oYdr
 oIrKxGgszv+mtrClZFBroNNDs4xQkFoLV1pqVjV2WFck1Hj6GuJt0eqi0Ty9mes2prDTqGvsX1B
 qduoknaaW0mtgeM8qzKdrWmJLd38C7it8KeQeZNFN+kz6QhXnvlEandWsIa9MZhs1zmICWo8hJm
 FVuHTgcx7ISZQHR5Oaw5GKO4KQ2PCyEgJcFRVrCKjhrKv84q4CwOUBfvr4g0O8NFtZD3tywWMhr
 g7au53v8aQn38fI69rA==
X-Proofpoint-ORIG-GUID: l2YVR_rtuc-Wi7mWY4ENiqXkRb6ftdFB
X-Proofpoint-GUID: l2YVR_rtuc-Wi7mWY4ENiqXkRb6ftdFB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140045

Add Eliza compatible consistent with CAMSS CCI interfaces, falling back
to "qcom,msm8996-cci".

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 1e8def25ec0ec1ef6b34859709d10a2a36fe36f5..f16298d94177f906790c18831bfbcc5557a5accf 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -26,6 +26,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,eliza-cci
               - qcom,glymur-cci
               - qcom,kaanapali-cci
               - qcom,milos-cci
@@ -136,6 +137,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-cci
               - qcom,glymur-cci
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci

-- 
2.34.1

