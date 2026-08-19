Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BB73DDDD1
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787147865; cv=none; b=JTiy4XqUb80abgmSTX/FoHp6C1Kr4J72Ufj54x7iEVCSGlTFhDigengT2jt4in2iu/0n1uLcikF3nzmJ/gGiIc9SGhuMRgy296C7fR32rpmPeEUaf5GO7dJ60VFH1QPjlBDTtU7nAdrHsYzUjfv0ChFu4AwEgvWzD3tIevZQdbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787147865; c=relaxed/simple;
	bh=rF6TUJT4fFt0Xh6pN9n6/C+QLa7/YYWjtH1j7RXIVW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C/MkRbTBYzO8zfn+LeeItL+g71il76wJVFp4ujTIJFY7tY+/DeP7B/Vv1n52toxgpJmX/RRE0b+3FWET+FloMoBsPrX6YZXa88KCCgzBcZq0DxTTHj0ljvo2PzVgYj3nkJn6uviJr9Sgw9aboER9gbw4H1EnLgNGDAcGGQ0B1R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JD8x4fgH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MHl+meQT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JD8x4fgH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MHl+meQT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD05Z61404674
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uxOseqOHHMoW92yeA+PV0zd2OZ36bqpaz6UTnTsrYKg=; b=JD8x4fgHKMf7jFzL
	Z6jaM2VOyiEt2LdaqLcvi4ghAzZnJ6z/tBrRJordwFc//ll4tLSQMCuKYGQgUIeU
	GGruYsZZVtyLarkWHyM8YODnqUJwHoUGVd7ov5oEIOxt49tGR1FAjRpyjn++uwTu
	DKqa81dC+Whonp5hcaLK1FQpaPQWVaeY1mUQtoMqLopF5XEt2Uvux0AZKY0Gy20Z
	eOr41aUM/MlZQsaIL802RLUMbF53CwIFCfE4RJyyN80IitF3G7sYkzhPs2hb0Fh2
	k4qAJjvmXTLd59vdH4nLRE9SMZ+OaTk+EBEGNdjdeHD1728cwk73y8IJyYWoktd3
	UO2cmA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm3hm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:57:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d0563db6bcso4104595ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 06:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787147863; x=1787752663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxOseqOHHMoW92yeA+PV0zd2OZ36bqpaz6UTnTsrYKg=;
        b=MHl+meQTo44E6eqVwY9gC0re2ag2PE0lbZY2yAC4YZE71Vq4Pk9CYaa6pg78L1AqzP
         DnuZePFVz8XQtiFjUdJ22aB76l0Wg10piYpj/YK4TXcSDZ9UazV8tx3KzMDZN1xBcBSx
         ERVjy/03ll9GK8CD0Z9Cb6ydg28mUZcjq3RhxIPrxpwdWiNYui8czQr27ltp19q/vhQM
         Ga7yfvD6OSZNOS+jMgzYxQre+DKsfdwMAHoOAlndvjFZeLlz5ilmQwtJbRuNL5vpZ9+K
         GFSjuc6kai5C3aBOpEb23i0JZJA0DP31yUnRNdWZTUVFGjofmNA9+r+npi2O6wmPEN2z
         6sog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787147863; x=1787752663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uxOseqOHHMoW92yeA+PV0zd2OZ36bqpaz6UTnTsrYKg=;
        b=Wp67DISrTV7f0vAEgxQWLE8fPtAVELKzc72okjaZMTV/X4cxKLPZBKKCP1wih6t33+
         K3u0gYr0re88GKd1ssoNqeHDlQH4b4xExJiBRVJGkZEWhSmuU6FtVkQonor++KWcJBkS
         p/bR834YMJ5MxX7CSuDa965qU2+xDRyvHjYI5IeBzHsRfTi4vGKNcvXXsg1EXU2D2okw
         w4DPQOI1J/itBZk/UKFh+rY/MH7S2mEjKZ8gavYhk+P9o5zVMhLFoNi1cwWdafKa0qy0
         zr2PcPtJuxkxA55G4cygiQdK1QdHFBBP4i7uozMMqnrg5KnR10IyRzlPle35tXVTdHTV
         d6zg==
X-Forwarded-Encrypted: i=1; AHgh+RpnVp9XMTi+OP9ua6cZFI9Wn20l8dSlR9dZ9tiYMfQ4bCR9855GvA0fI6/H32e5WL9jjgNScRk0SLRF5BoU@vger.kernel.org
X-Gm-Message-State: AOJu0YwS2cKqjvwAVrIOk7GKfA4NN6sElK6TQk5jjFlnw1/alvYUb4Xp
	HNc4G0uZfz9GAgk5g+VdNrfuc/ElzKLdU8qdobu+bmb0jkl3KxzJxGkIxJ/1YH+zPJcrXShOJ+M
	2zv2025o35ECRkm/9kWgeTqAxU56czAq7q6RoyH81NiZMiWxioL6YY3PnnulNo/y/KhSF
X-Gm-Gg: AR+sD101ppLYLom7fi1hQl2Tq6QtunJX+2edP0mMO/0eHp1vxH4MnGNDYHbOmcmMRfd
	R6Nis/lcpaE1P4wQuo0P9+ULA82NTvg2vgVOcg29O8XMNutKRmdesVgg1DhTFb1aKPb6eoWkugJ
	jT6ponn5axWE49LJxYjmLXbP/BYIVxNSb1ff8aDeBSnji3qEK2PVdkNnpMVSwIq2XjTXrdGsFQt
	kNZr/R27zw0tVXGX+BTBvbm5hseJaczd//uqFMIMC8aQTO7+6VV9OvVx94naBycmgAHji7shu9Z
	0VwSdLh/7yv4m8H17xaKP2yWH2CmqTF6tcyCmgYc+xwt3+Yp1wReiHSerOHla0P6xwYOS1PVgAF
	DfYLCmPTRXHsvaN6fmuDGqcub3Q5e0E380AjktDWInpUHfzotxWg=
X-Received: by 2002:a17:903:32cb:b0:2ca:de3:15eb with SMTP id d9443c01a7336-2d5fd3da560mr43717975ad.0.1787147862823;
        Wed, 19 Aug 2026 06:57:42 -0700 (PDT)
X-Received: by 2002:a17:903:32cb:b0:2ca:de3:15eb with SMTP id d9443c01a7336-2d5fd3da560mr43717535ad.0.1787147862297;
        Wed, 19 Aug 2026 06:57:42 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e550dbsm25318255ad.42.2026.08.19.06.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 06:57:42 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 19:27:32 +0530
Subject: [PATCH v3 1/4] arm64: dts: qcom: monaco: Add compatible to the
 PCIe Root Port
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-b4-monaco-evk-m2-v1-v3-1-988145ef65cd@oss.qualcomm.com>
References: <20260819-b4-monaco-evk-m2-v1-v3-0-988145ef65cd@oss.qualcomm.com>
In-Reply-To: <20260819-b4-monaco-evk-m2-v1-v3-0-988145ef65cd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwOSBTYWx0ZWRfX0Lbv0Ji++hY8
 YVmUpvsnfw3NCFUPTjRIehe9FSScPjObiTWB5YPaeF2k+84zenh/O/MC4ZJlt2RQ1ikYqbt3t6D
 rVBj+ej2W4BkC513qSXtHdelWq2GbzQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwOSBTYWx0ZWRfX2JTDlVYdrUBb
 eynlDm91QSsMqpPeBRFCBm70uiLz0ieKciw5jwXD2e2DBr9Ic2b3lPjfwFNhlBsFpvwIFmhgruG
 otWAeTgp7m3f9Nu/dgS//w0FhTVqCjjussqtjVnJxKOVcfvXvJT08RttC97G73hwx45Eorp3dbj
 X3pGsqpoBCjnA4tNrIQet3gkOpyrqrfC3Sk/BEGmaBnMSdvC8f54Sj0VVjmPzRkOy3zdS7EtV6o
 C2BTtFpIHdVx5KwOQgRlsgjMFXLlK+hcUslP9nyU9EcqChzB3sc4QqWgg01Z85crwv4/rhezV1U
 NxRmfHh4/oPCOZKIqMe57iR5ZhlFJMgeLvbflae6rwc60fHXCQCcf9KDdQ/FveSRu42U6IOXRsO
 1LEbROYrbBJz8K89GNhzIaQSVs1/lrXuLO2Wu1Z3bsrrnyt97IkDuzOULdxRNcFesuCq/u6b8Cm
 DhNukPhJj06qY2AQrIQ==
X-Proofpoint-ORIG-GUID: lJKCCp54vubNk_vit3ZmnWU7lTO21xM8
X-Authority-Analysis: v=2.4 cv=bN0m5v+Z c=1 sm=1 tr=0 ts=6a85b657 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=s3JIKy7HVgEvE3Gl7h0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: lJKCCp54vubNk_vit3ZmnWU7lTO21xM8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190109

Add 'compatible = "pciclass,0604"' to the pcieport0 node in monaco.dtsi
to allow the PCI subsystem to associate the DT node with the PCI-to-PCI
bridge device. This is required for downstream DT nodes (such as M.2
connectors described as graph endpoints of the Root Port) to be matched
to PCI devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

