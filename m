Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587958;
	b=1E6RsNvQ2gwJjTDxlVX4c4EOSnlsVVRDQH+T5TboX9GD2Khp4ehyCgI94Dg/fbKEkA4U
	 5g54yiOopusOBE6tgGeBVcAioWYYTQ0QxZ+dRCUl6cYPSMlMz+2KymkVtxbkA6MyyQyhS
	 jkJA+xORwDtt5c+prX7onZUt+uy6/TUjFSmNdU2mdvMIckLNNaL3MKZYFs1TqubtAocnv
	 hFWfc7W94zzd/6BA19h4rwCHLIvtKTsyBt5l6zSRbLAeZtCAAJs2MfalTLHi4N+FOh712
	 vwG77QCRTQFhhHntRkeJqgfgvP2h2w+Jjy7lkoJ17sK1XH4wWQvZVYVT/urlJHHw/uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587958;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pmawXRSR283Ucc1PSnIiqX8eAjPfNtrwEJ7cQLdMyUA=;
	b=d4W9xIxSi2PK7gI7JB8HWSxOwJpjCyBmfiXB4nPpoW5I69LwChQYW/4via9IpMNRpauk
	 fvFv8oNwvLgoWFjCktEA5XORVcp5VGgalaR9nvv2HLbsqt7Jxaxpdmz66nuPI87gIo8th
	 RTcfMaIeCfqkxRX6JovChf0WLOUNDbjgiazQCyosNxb0kERFlDW3wTUvKUPlJxEdFrVJy
	 3S/j3fzfnufjqs75Tvf5VXR4G2MLI+XQiZffSqu97Oqe82/Y85T2I6YlpRnPALOlv88RF
	 2tSM1sXQTnjZPg+xkBTFuHtyzQhV++Oj/iX6A9ayet7/EF6hCM8EI2L/qBAvADxVmtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MpZ7ykoS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jZySGB+T;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A133C606A335
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 06:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A133C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MpZ7ykoS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jZySGB+T
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68ZMI300022
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 06:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pmawXRSR283Ucc1PSnIiqX8eAjPfNtrwEJ7cQLdMyUA=; b=MpZ7ykoSA7/sjKor
	fhs3LtxAA4aCOH/GysYC2AxowpPRmlTm5zMFGhEF1UsE1+LDAJ4cPAaORCe8hTTj
	3jLRSUFAT8A0WYN4NrBTqGkq3XQdsAXSpb5NcWzWc+kkVB3FcyW4JHNsP/J26k88
	LwbhHlCylKB2n0njRhvHioNEN5TvPfxe9MsTy++GkI0PUXJaP2MnKrwzMedg23mS
	pniWcsd7+8+Ox0/sgvARTLo70rR/5gVoy3epBzj5Q4kEboPai8vuJC0kbBCQfUJK
	rQ7+fWYJmu3Xi3MPf0DRx2Du9gBCbRSe7H4PhkyABjiZny23Xpzxlyl2XFDlw2AP
	auk/tA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rs3px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 06:25:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b7614e9762so3919495b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 22:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795587956; x=1796192756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pmawXRSR283Ucc1PSnIiqX8eAjPfNtrwEJ7cQLdMyUA=;
        b=jZySGB+TmT/P0rELUQthBGfT0SDgiZlB3vTkpwgZui/DHvnXNuRZ/5KVAA6v1p8aBE
         jYizTgRM2sbrD1RszvY2U2mnq0S8hOfe2zM4koMzvXsyjjLP7U5EbRll6Xv6V0JjP1lh
         ktkrcrijoBuoIooIO41zYfUNy5iqc9uhYLGwBZhJKUqDpu0wNDd+beuhDF5Gj4ffciXL
         QgXCVm5ppZrJfgggpAHY3MXVoUyzWZE/G4ogCxeFxeYp6cANDSOrH5x27DD5ehfjR6Iu
         UKj6hxtBVx3iCFVGdW3HxacHngkhnoLK8ZXs4ndbvO2AWEguWYwmTbAPWbfA9l/m0BiC
         p/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587956; x=1796192756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmawXRSR283Ucc1PSnIiqX8eAjPfNtrwEJ7cQLdMyUA=;
        b=QNtfS93aF23RlNg2enN+iPHBVQiHuwbBb5V2nuraMDqBN2GnA9PcxcoJGEVBAWWzm7
         81wbPPVh00nYvZReHKrxT8B5+mVrpFIMuF/e67R8lT51UsNDzPFDuP+KHlqc+Hd2Y+G0
         sdD/tx8KMTMdQ8k+Gua9lcJhlQrfZOK3uPrF7ls4QxP0QUGXLE3VA3NSqHPSHKjoQtu5
         IrlaE7sBa6/hljUBMsc8s6DjSw8KbUYJxCcA2Z01ZmaKjliW1ePeoyOxUWQZiwaD5ZUV
         OMLA49FebcSgY+huH3EEgsFFfnKyqiGciim9YFKC8mHYXBFo3PiXuGTpoiXTAFykrqIW
         H3oA==
X-Forwarded-Encrypted: i=1; AL+hErG20f9IZueTYrIbKPWIVLVdcjlk8zdm3x4C9uho7cQ0JLALOE6JqQZGbCABRobJRwV2caIeJgfa7p4tzJ1d@vger.kernel.org
X-Gm-Message-State: APuU4Z8CtxT6CNjldPnps1wnHgDAogbFUh0lRSMIEfvvCRcnrHR0cqBh
	g5ccg75IeY+N3/cM7cV/mOwIsrOQE9HqQbjr4UBqiO5Jcktalc7O8hmIfI6KRCwLWy0L2mIDomx
	FEc9TQOfmHpw5qbBUbV79rVAou63SaZBzGKr7XGdQMi1u1VigChWnNb0bxnL/TjByOF8Z
X-Gm-Gg: AZFdTZeFI2t9IeWVF6O4vtqszA4ozFEtDWs3l9shqyufymijN2D8TU7uhd2QraWwf2y
	nu97CHJM7ougAz3cQ45DhN4Hm7HLPrl0rIJe5fQP2jUcyqtQoKm1RGRH3IZyFwTDwaJztaJ+7DF
	g+7JDlUSMObVlgYm1/Q4WY3uTNyR7b4NpgR8Z78BrItLjmlEkb3pH9IPk5a60RQN4csVZa0iuiN
	Cigbek3bH5cHfMZIN4ny/XriVn0Ifg83R3lVf+gyoJtx59EZVgx4lR6gjlYo9eE8WhPi7XHErap
	l+BM8sAm3aRPjwoED+/rx/PVvenMIm12HQPo4s2Wn6lzejZy0JPWU/Fc70DOmpmk+4ZCBIYcx94
	ct9A9FkFc5SrrRGiwtcgYlJ+utNO0gqPCfGbkS3ohYT9ModXnb1diiGhVJioPvzq5LQrqesoxhS
	aa7P/j
X-Received: by 2002:a05:6a00:94f4:b0:89f:c441:580a with SMTP id d2e1a72fcca58-8c87ca522a0mr14601721b3a.36.1795587956366;
        Tue, 24 Nov 2026 22:25:56 -0800 (PST)
X-Received: by 2002:a05:6a00:94f4:b0:89f:c441:580a with SMTP id d2e1a72fcca58-8c87ca522a0mr14601682b3a.36.1795587955918;
        Tue, 24 Nov 2026 22:25:55 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm8385066b3a.2.2026.11.24.22.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:25:55 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:55:41 +0530
Subject: [PATCH v5 1/3] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
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
Message-Id: <20261125-hawi-maili-camss-v5-1-1483b7f68dce@oss.qualcomm.com>
References: <20261125-hawi-maili-camss-v5-0-1483b7f68dce@oss.qualcomm.com>
In-Reply-To: <20261125-hawi-maili-camss-v5-0-1483b7f68dce@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795587942; l=1476;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=BTDhy4Hj9RCXelLYOtQYezLS7KR1Rsj0YchhEiP5678=;
 b=JJ7++Y37/ybPg6xYkSO8GXSgnBGrAyv+rXXF2osM/rznJEoenCuk1M+2TlUaPQdogEIt3/ino
 hdkz2L+nvH6CnKCXfVEbGONlEbDBOzbv3PQo0TSb82cLrdMDuKHn3vP
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyNSBTYWx0ZWRfX+QArHhNtRG0i
 SbDO9VyQS9aofagT4rvkJ6GE34kqCX4uwl92nEx1hkS/xD6uNU312UzInk8AMvua0IBHawprXge
 ax1hIV6doEO1BDAOHwcJcCouFTDQcZCee2Vsjjpabtd9mov88Not7wx2mKRuobnXRhbnquhFInr
 sA9SKa3c4X3jRhpGZY7/FQwA2mMnbJPIrQWVua3bh0CSYDH3RFR1Lv6hFJW+oKHDYv5b2wGMz7g
 lwbPsBn8OG639hA6KbDrYG33WXDlbHeCzaVXR7cvB4snpnbfbgis8M3idaQvN0Uyxd0GplqrDV+
 kt8Jd3M1IuNYfqDrx+vECzuTvP7vpLx/Sstok/MJPMJVLfqF8toh3huUmrRy29UJuntYurB+0eL
 R7584EPN+aRnO0ZF3E2KhV+Bdh93HMccqPHB/Z2pzz8r2IfSsW8rz+1xbnODVvcvYj/FZ0/Imre
 Q/1Z4mJzqCHCeaLV1oA==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b067f75 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=LDBv8-xUAAAA:8 a=AartCDbB9JJyHY4DVtoA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-GUID: PZCpXZD5c-FyYVIghS2X9uB9SaG2XXrw
X-Proofpoint-ORIG-GUID: PZCpXZD5c-FyYVIghS2X9uB9SaG2XXrw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyNSBTYWx0ZWRfX4GFjCYDYqJL7
 MECSUVHjASrgFKTOdBWI9HYiXvcyCntoWrybDz+etdZuPYs9wgeiPvbPqIM+BLSI91+ii2bfE0o
 shIDwyOgv2V108RGP5emgg6y3s2n9Zs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250025

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Document the Camera Control Interface (CCI) compatible for the Qualcomm
Hawi platform. Like other recent platforms it requires two clocks, so
add it to the corresponding clocks constraint as well.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 1e8def25ec0ec1ef6b34859709d10a2a36fe36f5..b2b4d4bcf780792515ec153c873bace1764fb3e3 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -27,6 +27,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cci
+              - qcom,hawi-cci
               - qcom,kaanapali-cci
               - qcom,milos-cci
               - qcom,qcm2290-cci
@@ -137,6 +138,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-cci
+              - qcom,hawi-cci
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,qcs8300-cci

-- 
2.34.1

