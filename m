Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF8A18A92F
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784810209; cv=none; b=Yt4n2S+bHFhIPZ4fvi0mUjQLoR+drT+4FAeHzBTW3/IN/2gCearBeFUCMHm0TAdObxCJen63FXi/iFfrZKw3j+Ilrj0wu7mZPJZIKYIB82y/Dn16c0TCwLqV3n/RptumUBczOncZv0C/2cfBTOYU3N2bWKrnz+De2wllvd8nXoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784810209; c=relaxed/simple;
	bh=QNVB8O7hVWJg702gCWNCTaBEjYG5HzIl+/6J+f6oXHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WOCxkWT5AUAP2LZ2K3YqIsfpJOM0zpIV5zFF+zifhWSGAI7sm3UMIGtEYmYR+9jMtohCjqXkQk3FFyf2lvEuPqn6sR9fR3OnETq9bfLPj10iUzW2pQwGbteeli3Zz3psr8zipfmps34hGub9NfcvEJuKXA+8creFCKR9hCUXyy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WQp/uWH/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e9LWWBND; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WQp/uWH/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e9LWWBND"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qdCP3668144
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r4PK/2k1a6tHryB1sthUTAfUlknsFtu8WXkM20bAkdA=; b=WQp/uWH/K9NyABx0
	1fZHyes2MAX/o/g2YgQ1WwVJo9BswxbiwGCHsKy/IEcQqE4Ph7vdmQ8RC5tZoqsi
	FAcXhKkAxi85ed3QY0i7YaiuayObNYJFmfakoh7i17q0BMC8/UJ16TVTYl+5Yw57
	gWpj1zT5prPv4GkEp1qEEfKa06zkFfeI1hYmEX0wNKcm3swU0n8CsiUU/7pufetl
	HZwPqYNnRMLE5GAoI9LBcA+8kbVUcTpx0htDKaew2y238oz0oHi5k6Kz5surQEVX
	Jb6KZSgFE6YjekcjiVKGJkEW4e37PN+3v7hbjT0kAL/vzZ8idHdPSGQsM+9QxhGw
	SqIpkg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc37dm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:36:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2caf4173b1cso13232755ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 05:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784810206; x=1785415006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r4PK/2k1a6tHryB1sthUTAfUlknsFtu8WXkM20bAkdA=;
        b=e9LWWBNDwZJ/iw0sAH2iWSHh27Gi25tsIvoaiL6qP0VewJVioqEYXUHtwQkF4fziz4
         d8nm0cd49grlHk+b3qE/J5yBJU6DxBoCAUio5z4h/cwYgFoZTMKUmiTRHGPCUjZfJKc4
         ujqpKOdzNVqarfqFJz6uLdkrwiuYS5LZ4fsaZ5kTGBO5wdqfCeZVxu6qB3YMODkGbWOb
         KMa4FuPW2aKHbsn2KcLnSYuj1JPpcrGdqROP8bHsMmgRDI+tJF5Nfs1qrQqVRxHWVju5
         o3CF3Se3czXsnLlg62+BdHNrC9gZSIE04G7Wa145jxI1lLAT+Tx/dEobf43N0NxgAWI/
         rhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784810206; x=1785415006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r4PK/2k1a6tHryB1sthUTAfUlknsFtu8WXkM20bAkdA=;
        b=fwv7iaqOn21oskF3RvoexRDpb0pYtZ5x6puy3EhWHnEA5ZjUPdpT8WVYNsga+F7l1V
         1k+Fo2tVTZhJ6evdv6fURnXyIkw2W4gj6zJ2GOIevWmmOdK/PdwkIUvQFg1UBlSLnJ/B
         kl4fNHh7YFO8+wthJIBAOezh8sH7jqmbtknQezhr1QgB1k3nEq3rHUidcJ2kiY/wX+KC
         Lo5OI65WotEZOEiDv/QqTf14VKMSpWtgVVXpbDSSOyp4xptNMf4cnB4PxbbYPeQjjxAx
         83A9FUxLfXNaNfRRkRqzFScfkPb4XL1FSIpHl4Bir/VxWeZ4TIUqiUQjUUDSPBkEMUaf
         Iq6g==
X-Forwarded-Encrypted: i=1; AHgh+Rpvn+hrwcY0+3WjOW574woO2TzOOfSUSMVv7yuta1dxL/blR/P3SJ3uV5xgwYteScz94+emSkdv7a0M7ocx@vger.kernel.org
X-Gm-Message-State: AOJu0YwhY03xCEI/rNtsOMecgj3iYydC9xzjE//DdP2485AhXfxoNNpQ
	MX1Q4IGYGzSkwTFqeKjp3G3Kf7pWH64TFILh5ObDXw/i3fpSHUlYb2cd3gp+utQksSosxen1Mkg
	RZg3Fi77UDEUJQ5+zuzKGb9MguCIIZsE7qDx7D4lCwbSkraYxn9OR17iXi8da82o/bDLq
X-Gm-Gg: AR+sD126HN70i1o5x2iQF7xb2Po+NNLywzKKuEXxeoEi3P84t2ULhFncFf3/Fmss8H0
	PjMl3Ys0VlWoW18Ykw90ydpT9xaNigt5850DQvnhiliDP9ZNCI0UkWGx4ZwAGIXpyiSRCsQ6f2O
	ObCI9r30m+hr3TZRuc+GNYQJWHNNy2WWCi6ruPrNvwqnIUm93UbJgQIRBjfN9ZI8P0J1UxtJsVH
	9GvtVQGOKB5LMGmT+ajZXewbf0QEhd8l8KxS00BeIpffycfFq0lVoJ6eXFitCMHxgrbQREs1734
	DcZ6ZDF/98pF5LwjmYvpz11EeowtDwwj4FyZhvNpWCDqVaQiljI6uuAD+SfhNQ9X6WIG1M6ugr7
	+8Gd+VFd0zFbSFXFQTt5RcSLYyrYxfg==
X-Received: by 2002:a17:903:2c08:b0:2ca:d31e:ac50 with SMTP id d9443c01a7336-2cfa71d95c0mr38934455ad.17.1784810205776;
        Thu, 23 Jul 2026 05:36:45 -0700 (PDT)
X-Received: by 2002:a17:903:2c08:b0:2ca:d31e:ac50 with SMTP id d9443c01a7336-2cfa71d95c0mr38934045ad.17.1784810205393;
        Thu, 23 Jul 2026 05:36:45 -0700 (PDT)
Received: from hu-samana-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd76c4sm33851225ad.23.2026.07.23.05.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:36:45 -0700 (PDT)
From: Rahul Samana <rahul.samana@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 18:01:08 +0530
Subject: [PATCH 2/3] arm64: dts: qcom: kodiak: mark PCIe root port as
 bridge
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-rb3-industrial-bt-uart-v1-2-3c8e580c09d1@oss.qualcomm.com>
References: <20260723-rb3-industrial-bt-uart-v1-0-3c8e580c09d1@oss.qualcomm.com>
In-Reply-To: <20260723-rb3-industrial-bt-uart-v1-0-3c8e580c09d1@oss.qualcomm.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rahul Samana <rahul.samana@oss.qualcomm.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_hbandi@quicinc.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_anubhavg@quicinc.com,
        quic_mohamull@quicinc.com
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: qgOvEth8pA25GImj8aehcLbk0aUd0sPt
X-Proofpoint-GUID: qgOvEth8pA25GImj8aehcLbk0aUd0sPt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyNCBTYWx0ZWRfX1JgGljpTmRl7
 SWxE3QDqVnQz0yMrBnWFYVSNCDb14uj53Pm+pzzpi0VvjeBYlCGelGOPiI2lGcZj5n29AscALRS
 6FFvV5gIgh7V4J5KRmVOYFo15tC/PVI=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a620ade cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=cMMLQAvtHmgBvpjJQrcA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyNCBTYWx0ZWRfX7S3jzMzr3qov
 MpNNtJ4DVO2Qj7OxdgqKqM2BfECkFPrQbitDCXX6EvhGs10PO0LKmZJyTTiO8cEWDNwoVbgfvrO
 QOY8FPJR7+ml1a749hDf8jE9RcwMyNHlHqsqKlb3zE58vQlLPwsXYe9/CEy3bmgtO466fXm++oW
 x37CKQ0+rcokuC2u+4RkoIf1oWR1Wx1NOOUXQf2AWF9G2/pGt3T3AfMGhuHPR+kk/P4Z6rvoP+U
 7ymykpfplyuUL9LRl2Zr6gbzrTn3ilb4YzeDDq4hpxmb4HlVTuQUZK7jpvAqYftPn12IpvM6MDZ
 6E3wZ/3P6BGhHzO5bEYQ5z68dQ1OC0H6RaklOCZBN7MBiPgPKyfyLOtfG6JL95AJU5G9Jm6tjfK
 be+97VKvff/ZVVQuDqS+Flp/7M4w0+F6iFY8JEjCvNHQFq1Qs37/oQDju/F73zG2iXmjmRIDWDf
 DK8Budw2CCemcIHbEuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230124

Add the PCI class compatible to pcie0_port so child nodes below the PCI
bridge can be matched against the enumerated PCI topology.

This is needed by the M.2 E-key graph description used by the RB3 Gen 2
Industrial mezzanine Bluetooth UART overlay.

Signed-off-by: Rahul Samana <rahul.samana@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index fa540d8c2615..12594967d2c2 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2296,6 +2296,7 @@ pcie0: pcie@1c00000 {
 			status = "disabled";
 
 			pcie0_port: pcie@0 {
+				compatible = "pciclass,0604";
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

-- 
2.34.1

