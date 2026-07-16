Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E14A37C0F5
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218740; cv=none; b=jX6knef3cuXagZPyEXa2hjc8Z/Wl0CYOtu77UEG+wgSAQG7XIF6BZF37zY/u+J8/QpKezq63+t7BARbVAbDxNEf5VjTVx6QdJ74sx14M4LPOGON+n1U6iYu4XkfQ0c6dsv35L0B4Fw0/hmeqmuw6Osm1wd110Y9PA72W85Fz5kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218740; c=relaxed/simple;
	bh=AKJ2rYuq3UXtw84o9Wv2rgBoSN8Fv9N585Y291G3LZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IMWEtkX7/rsYjbAj9hYAVHgyTx7ZWegPKnZ9Z/yBVgW1RGOoWWpTb374SEBEHcv1BpBD6Auwg9mW+H8eC8mYj85CfHQgm88FY2+8R0cTDfDLp38Eeejixtve/kVUFI5FRu5HqiW1ooWV62ZKprOwkZXVnucDmxkqbYENgAYi4as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iASYWyQi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=USWxPA0d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iASYWyQi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="USWxPA0d"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJj5v3043231
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lSQgtm9Gy/goYjkRUPvH4fsLeTRSZbUNnPPwbkXFunA=; b=iASYWyQiOGz5VgA/
	XTn0KGINXOl7iwun+L+oaK4UAkSppUti72AQRZkNnhLuR7vlGMy9mYHpJZTlL1AS
	UCOFvEyNexd/9B8cYqhNYm874EsqBHlM2inRvqdW77kI96fLNTftVFb/lYiKLtsG
	izL6/2U1hmISKnZKom+b04CJLrwYK/woloqfhSEsBa29akkHZBX4MrQzNyd+LEbG
	YONpu/dlF9TLwyHAXLY1UknVarwA3a50abYjFz/NLt7GhRneucqbDGu+n6johAq5
	POp/1A0LGxxHL8eQfEhXIKFoL1sxcvK77aXu5LiRBgZT/jAy/9+35RjtxI8XPFoE
	ub5I5Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetcf2c6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:18:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c19493ac2so119581621cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784218728; x=1784823528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lSQgtm9Gy/goYjkRUPvH4fsLeTRSZbUNnPPwbkXFunA=;
        b=USWxPA0dquVSQCqvRP/vyS8ZY0IzO7Jnh0OHbV+D/3D4RPjH7zGsTYDLljjG4kU9QU
         0IV4wBID7q2wPFNRuUmYo99CUraiqK2SvWuyp14RKFcZKGiD52es1696Rp9oe2KaRyu0
         bzL3pveUsKO1jOFvwSlftMq1LiscsWRo6IyeDK7Kiyt/Mqft+r2KzF4f29qZR1iWiqYW
         RU2CzbBWDEUDgDB0dJFOIh7gvyCuRaVhAvIGNk+lep2tRFgvFJzqwW+Cdnvkapf0uTZp
         xgD8b1DOobcKRlYN/Zd7JCjzopJUTx6YutGEIzJTx9o+jzjzvMjtjpuBtcEdo1SmogWg
         ln8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218728; x=1784823528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lSQgtm9Gy/goYjkRUPvH4fsLeTRSZbUNnPPwbkXFunA=;
        b=pH+zBNMxdBtAUBhmCPqm99Tvrt0fg3CRECZGV53ZmkJkZFyGPWc70q7xHHbVpdmseZ
         50yA/VCIboh/JWaTJXPwsEng24bod0aG+iRrNxkI5tGkVBw1nuKDZAZmXKP2lZTDpwfM
         7smnb/J3N/p/HSW6J01Gj5ie2j6YcGD0EUut5jNrY5H7tpCaLdHeBUVtp9T95bfTSwP3
         6yWu+Ok9dbd7i+gSb0gP+5UY+lRlWqf1PpGuEptmOWq+A7nNUmM7ac5NlyOWA/udAssR
         CBgnGdaIODctXOkfVYksA32sukeL+Rf6AoL5KqYSWYre62pAS9pDbW0qNOGMX8hyEvgy
         Udew==
X-Forwarded-Encrypted: i=1; AHgh+Rq4UWFpYPOUGOx7hDqOE9kGDYCM47zF36TVy87cfMMxKf4Atk9BMcp6GuwXS5qphaqRGCcdf30dQQfugLmJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwhD3TYP1Bg1kyElJqrdyT1HLUFnxHwxX60iAJ87NwYwITllwBg
	DaMogVC3rm8xv9en+vJ3cMOkl4lebtZ6Ys9eOm0l/+QAlCipcrW/xOjU8el8lfnOfxDzugsiB9b
	Q+CDNkkDnL2xo23eWaNCKCpcryIij1LbRu+X9o1avK3jwzSlXIv5Gcfd0Ekp+B0++Oe35
X-Gm-Gg: AfdE7ckHvkZNszoAFj91q4c4RWsJz1rPpl4eNZ+VS1vI/t1ZviPy8zfWjEeVT7VnfV0
	NF94A0k2LJ8Wr8MCWbWndgPIRsO4zgekxz/EC9Ut+b/RZF0erF4u6yC/jdsQcSWimtxigsbpsv3
	RA5TZpFQrpXJMGhQtD/KaDePNL66G4GsUFXlLnKifNljeMbRBKJ9M3UaUYzPVev27e/rBS1lY+n
	W8pknXyQkuengh+xls82hqGmoZ3nbKOU0DzNpNvtOBCpnJGEs5K4FyKXt1fpOTtI1P4iw8Gi77x
	iXg4JC1P3XJFJfpmilq/3asCy6pC9QiJTnsS/RUtIm8xPXHcmBlHctIl4b+SvyoSHawWaQJxD6S
	qBMluHX0dtSH1O2AjaMGM0Hndc23H0ru93gFXcgWpncM06hqFDhhl5+zTsYM+hA+WhePHx1SKMi
	4vxYitNAfxm5zthxmMK03dkX6J3SaOwc87r/ZLSWGv7nVGRdkzmbU=
X-Received: by 2002:ac8:7f92:0:b0:51a:8c9c:7f3e with SMTP id d75a77b69052e-51e424dc615mr122134641cf.65.1784218727538;
        Thu, 16 Jul 2026 09:18:47 -0700 (PDT)
X-Received: by 2002:ac8:7f92:0:b0:51a:8c9c:7f3e with SMTP id d75a77b69052e-51e424dc615mr122134121cf.65.1784218726995;
        Thu, 16 Jul 2026 09:18:46 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168744bdddsm257262866b.48.2026.07.16.09.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:18:39 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 18:18:26 +0200
Subject: [PATCH v4 09/11] dt-bindings: connector: pcie-m2-e: Add vendor LGA
 connector compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-monza-wireless-v4-9-9b02e6f549d7@oss.qualcomm.com>
References: <20260716-monza-wireless-v4-0-9b02e6f549d7@oss.qualcomm.com>
In-Reply-To: <20260716-monza-wireless-v4-0-9b02e6f549d7@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: Q_Tl1lKh8ZqrnKRrECODaewEUiCcQt54
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2NiBTYWx0ZWRfX4RUYvBUS6Zie
 FWmFdue5+/TFQ2r7CazFOJZ6JMvdqUEMlAJERSDI8viEG1H7yj39/NistFJS7xGCW5tUBiCQJju
 za5d+kMsiAA+k8NXqWhYxh9Y5pwMWgrWylnLpjsV2wH8/x3NWCe4lAxxjcE9tTW2bzcm4MFzFmU
 Q3zEdk3uAwz3IiUonbAL0L+d88l9RaNunHZRSEtpwEBtzShbRZJRjHj+xU2U0ecXMZkLlAGgEqF
 sN7seiPiHs5dFsmLWDjBwG5grNHO363I4MgRaxTbPmH7Uiq0OWWU3xfdPj/TWx9Sah04LkiFKNz
 SdsvxECFv3TYEECD/rKrMASOIw80poDPSafTVTGUzFt7gUw+7jjaHbn3KBwETDNmDimfz0Hfl5H
 6UTtS8M7/eLqUNiBiIQ2KcmhgTCplsZUWR0HJ78LjqA777GjUC0SIpqzqkoPiGRMuyBnuLeEtH3
 Ejpof//+IjJv2i9SPEA==
X-Authority-Analysis: v=2.4 cv=f8R4wuyM c=1 sm=1 tr=0 ts=6a590468 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Q_Tl1lKh8ZqrnKRrECODaewEUiCcQt54
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2NiBTYWx0ZWRfX3f2x/a/q8VCy
 yA2BNh0nm+lkbBxUzAClTvHKVPSxa62aZEKIFqLDuEyyCYLxhydSUVeshtDxSHFMfY7EbaMqE1z
 L4cCk3vIXTdl85nNUBpmRZPSBaHnhBo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160166

Some modules (e.g. the Qualcomm QCA2066/QCNFA765) expose the same M.2
Key E interface signals but are physically soldered as an LGA package
rather than plugged into a real M.2 Key E connector socket. Such designs
are not actual M.2 Key E connectors, so describe them with a dedicated
vendor-specific compatible while keeping "pcie-m2-e-connector" as a
fallback for the shared signal semantics.

Add "qcom,pcie-m2-1418-lga-connector" for the M.2 LGA 1418 found on
Arduino Ventuno Q (Monaco Monza).

Add "qcom,pcie-m2-1620-lga-connector" for the M.2 LGA 1620 found on
The Lenovo Thinkpad T14s.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/connector/pcie-m2-e-connector.yaml        | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
index f7859aa9b63469cb43919c0b5719c18694c5364d..ce6173a0ec41cfe8ab4a5780940999c18674ab7e 100644
--- a/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
@@ -17,7 +17,13 @@ description:
 
 properties:
   compatible:
-    const: pcie-m2-e-connector
+    oneOf:
+      - const: pcie-m2-e-connector
+      - items:
+          - enum:
+              - qcom,pcie-m2-1418-lga-connector
+              - qcom,pcie-m2-1620-lga-connector
+          - const: pcie-m2-e-connector
 
   vpcie3v3-supply:
     description: A phandle to the regulator for 3.3v supply.

-- 
2.34.1

