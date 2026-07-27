Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC1437C926
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161806; cv=none; b=H9fFiIX9BSoO3fKrfP5VXRss1qMCJQx/Lt2fZZQr80vLx9gU4+agFh8qbOJLfB74CB5IGvqSo8+jUKGBAyesDc7mtkorKFx1ZPvW8lb8MMrhZYYqJQX5Jh5jbVEC6P3FOzLpv5+tzOGxPpGSqGJ1wIbh/ocvJ24SCznpZnm2gLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161806; c=relaxed/simple;
	bh=2Kk80nisesvL8slohwKnMYjOfVBgofMCO+Yse0A2qOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K1K0lozZBLN4qkqzrFONHytgwXGkrCVsohZ2fp6VetCdrxo+7fJb5FaRQmuJX5OQYu+be1PV8fCHa94aQE3e3siLIUj4ciuddntU6mYy73ztNQ+rDsLeH/DQ8Ib8A4+9yqX9eYmk+7i3WpTGoiQ59mwQCLjUXIUiUjP8w7sq7rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYN4jRMw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PYZKOCj6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYN4jRMw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PYZKOCj6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlsNa4035522
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	blnIK50OKluSsed5I4jwK/iq1A2hEgJWuOzhPzLg1jE=; b=CYN4jRMw5SOX1O5b
	BoYtp3vrSWRVbfXZ/IOd/mLI6FqnCeEv1Zw1GAIOG3TSxdtcAMOceE64TPyvqsYj
	H8zfgfkUHJbtjSXX+7Da1mGrspTpw6BpUAMnKVgkkmCeNRApPJGvKDoa4nz9WsO7
	NFdiCLfekTGtnGnxwtNJN3b+BPfNROJ3lAM1ZoIWtDw9fs5TLvFc1yZQkBIWvWh7
	qxqsd0AOPTHWStnzwnohMDTBd21X+T+h+uboLszagFZDum1VS+tn7juEyEfai0zX
	94FC/1zMgE6w0oR9InhonFEoXZd+dEyV8dH9Pr2EmiLwBgfxAw19sXi8XCyRpKLu
	fdGzfQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp30g1m2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:16:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf44f2c49bso11133955ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785161800; x=1785766600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=blnIK50OKluSsed5I4jwK/iq1A2hEgJWuOzhPzLg1jE=;
        b=PYZKOCj6vo383n/XwtOgIk2eloG6k97vjtXcHvl+0h9OyDsoT3dNKt+27cCE3wyvM7
         m6F9ZCjmQTp287s9X2Ic+I0TzrViL5TbwDc2Zw84Vo9zTBbxJfP1gPZrSR0Wf/BM+o5p
         n27PthJasThkcLqUz8deJcDPMeITD1Ddjp9WyX81gT2H50XDIB+5AwWFfkpTpvzDevAt
         CTB1qwlbgRMG6mMk9Vhpwe1640pwgANDgLEMWanyCJbZKBJoPX3pQMy+oyZ4VpaPhSCM
         /0qNcx5Dacugttsp/BBxHmScUW0Sj7ASFZZEmwlqSAjslag/AeSUrwvADz7MSt+OA6kU
         KASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785161800; x=1785766600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blnIK50OKluSsed5I4jwK/iq1A2hEgJWuOzhPzLg1jE=;
        b=L95wyeVqiOxZHO6fIntbWBEhXC5Pm0BBPe+5qZIW0NpHJ6fot13Pju0OuXDm8LKI+Q
         meMhGgtFgSLfS2bU9OwqtclUY8i/2HkmE+7KXXbTo/LCMa90XdFPcM1LZ3s3vvTNJRkQ
         EDbb9jGxXWkzqI1EryEeLq3RDQgSV9CWCdFjkaFdRpQYklcMe+Ch1snIOgytcErOh4QA
         9VG5kzV8onK7JOzAklDKPUpKx4gwB2wFXzLCs7Kma+bFN77o609Bpc3/rHysb1RM6G8I
         f9IEYr56YfAIf2auH7B6a5jgQjHZAeqhke7Nr5qW6iMvAs1Z5CAIt2PuJkQbj6YRdac7
         xQKg==
X-Forwarded-Encrypted: i=1; AHgh+Rqr703zg1Cy98LVAelS+ToCsdM27L1/WX3l5f/Qq+8viapisfPufcucbS4mf80xjz1ec1cFnuRyomJUgHPv@vger.kernel.org
X-Gm-Message-State: AOJu0YwMRvYRctNrN7erShfSZ9Dp+1qAWCbuI/++S610SwM13i7h3Tdp
	46aTZdVFChG6kOJr+XXL1PxVGZmycsuZk+VFzm0wBtiMbJHYJeKfN5lrNLvt6VphIZJuA6FiDCI
	cWuCMywQ9gMadqA2kKgpUVP+W73u+nUkPylUwgqNKGBWp+my6WrsGQyAXKxkZT8V2QhTO
X-Gm-Gg: AR+sD13aCWWsGpzzipnhj8uIIrVXgRdhglBFlYSTSPoI0sXh8YgcFKj5AYYgqG7R3W2
	z1YtMhMrekvs8uBDKtum3EBaOD14g3CPp2DEJ+XL9f2dIPSQ+c2TINcRN21v+i3VaGoQ5taoOnP
	EiTpBkNZUEI7imInA88WUrpK/Lmo6bNtxJwXcUk9BJWIwyYD3D1W0CnynFwFQ6rwzTOJc6i9ylP
	b5KRmOS0YEQlOr92NxSRLGe62qP2+ZVBRrzzFrzv1mB5uMoEmtVCj20VVECqvy8pgAzTCpsp6Wc
	JekM7dVPu/eq8bTHGIZEWtDkB9uWorxLWjYSm9xV7fOUqpH+1AN9w+D1z4xzm8QKARDUZaGUHpN
	ev2jAYl4Hd2XRkRQc1UoMi9O4woOykY8AWq3unKzwsA6neO3/9eA=
X-Received: by 2002:a17:90b:1fc4:b0:38e:6a7c:abbc with SMTP id 98e67ed59e1d1-38f29625594mr10207181a91.3.1785161800031;
        Mon, 27 Jul 2026 07:16:40 -0700 (PDT)
X-Received: by 2002:a17:90b:1fc4:b0:38e:6a7c:abbc with SMTP id 98e67ed59e1d1-38f29625594mr10207133a91.3.1785161799625;
        Mon, 27 Jul 2026 07:16:39 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm88012281c88.15.2026.07.27.07.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:16:39 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 19:46:31 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: monaco: Add compatible to the PCIe
 Root Port
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-b4-monaco-evk-m2-v1-v1-1-5429cce68599@oss.qualcomm.com>
References: <20260727-b4-monaco-evk-m2-v1-v1-0-5429cce68599@oss.qualcomm.com>
In-Reply-To: <20260727-b4-monaco-evk-m2-v1-v1-0-5429cce68599@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a676849 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=s3JIKy7HVgEvE3Gl7h0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfX8Z4J+zbTRIyg
 tBDGKkNxxpmEqYVl2xLQV9rNkvsQHauCG/UCw4TIGNrM21cfdrXGcS/5GqRefdHXhHE4A12MDIy
 9VyLGPWZ6yL++74UCY+CDjU7zeptz3E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfX69vPIJWeLLKN
 8GOKGTStccZ+Nf1KT1RHQATBj75qcJsHCO2ZKTeLjOscvspG6Pkc+yn2cHxk22wCviX2W+RDkL6
 7hKHRzJvR8R1CnMVZuEPSPv9TA/9SF/W71JtDtr68wXJPvWZSH3tzKxqv/16erc2G5tuHLTm0oN
 HDZnSidQp9BgS5+MvmCAFjYTuB3DkUIGU7i021yiu7ODtjLKNfod3py0NbFf2eBYF463+y9EA49
 BNUkREztQDFxHDYnWl0omoDbNO+LwqW6CjZlVBUWgk2pcf+jPa5isVRr0jF8FUy+L68QBV7yivG
 I/DBQPRGGo3b70y/Rhjiwfoj7RxK0H4LIzzY7XmZqO9Vdmz6oB95VqJ2i/GibiBLggH5JA0cgLK
 aSl4h4aw5lC1YTGPcFbx9kwbzuldpkIiqc49Ue+DapffbD+xHTHJj/aJ5OV++6//qgIbqdS98P4
 XY4tBDFed+jYsSr6Ntw==
X-Proofpoint-GUID: whpvP5EVhbUkV91zgj7wEI22I3pZ3SP7
X-Proofpoint-ORIG-GUID: whpvP5EVhbUkV91zgj7wEI22I3pZ3SP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270135

Add 'compatible = "pciclass,0604"' to the pcieport0 node in monaco.dtsi
to allow the PCI subsystem to associate the DT node with the PCI-to-PCI
bridge device. This is required for downstream DT nodes (such as M.2
connectors described as graph endpoints of the Root Port) to be matched
to PCI devices.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 64fc0d592282..438ccf6eba64 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2393,6 +2393,7 @@ opp-32000000 {
 			};
 
 			pcieport0: pcie@0 {
+				compatible = "pciclass,0604";
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

-- 
2.34.1

