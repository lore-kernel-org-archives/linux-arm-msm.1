Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67E741D62A
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888069; cv=none; b=VadUfIHhrY7T1qku7HuHzcf0Hh88DOyzpthfzpuNmC1GweBPQo0wpnp+2kugAF00KVnxAbbKDC3eD3g9F1K0wfFvqorlv+Ghy7p6KqKH9CUb2KBp+d88anFH4qGbmXXwqFwBwmalvMNgqXhtK8uzRowCGsHu3a+xaLxQHCFoDI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888069; c=relaxed/simple;
	bh=wgkNwTMNmxbTucxWWGqV8TlTwvDtraM+5KHqckNDjbM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hTmPOw++XeHqSZhrAkMYLA70hbg615IQNz5+CqpQTr/xOTYrxJ6zRrEsNsuzrTGqUCvcN3EHTprqAet6EgsIW0WRdU2at38lcZMPa3Fy8129dFqzIGjTSbfUhZkuxXBv6FDOuyWBFpb+Rlt4fOrXCGXtpQXcmyNMJznKZCLgt6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZMO2LRH6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=As/uqreR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZMO2LRH6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="As/uqreR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OAEOZC2743904
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v20uZoTQ/mwANO1IBMlc3W
	zjT0tbgg/Y7EG5PuLU7pY=; b=ZMO2LRH6rKF+/e+sqvCz53zLmwsKCaIjh7ZmWK
	OKoSYpyroG63NJVPaKwKJFnSu5aGfYgO3HzEW8lXQMDH5lMqEg16KK8PKcQe6Ocq
	Vuo4gkvTyUZkiQcQws7iv9EqXoxucczeUK8YM21nfNXXkmI+WwphtkvKh9/haf1x
	fVgG05G8gqHels3YSxczBJgL6dSA6VYmBvsPKufq6yvShw0TV1d2Kpg709MVq8ch
	81lRANuE6+GWKNRfgTYQuqfCmLrc0RhUIulndNki3rXu767t0AaxLXCeQukqmnSW
	5V5ETc7nRwfVn7WAs/AGH83iv3smTywBygb+IApD1zLvlgKA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p519ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:14:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cceabd70f5so7302095ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 03:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784888064; x=1785492864; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v20uZoTQ/mwANO1IBMlc3WzjT0tbgg/Y7EG5PuLU7pY=;
        b=As/uqreRg5S9tu8DvS+SqmEB5Es6bB9hdPMisScLngfXcc676GCAjZ03JEsax9HIDH
         L8+FJfv2Z2mjnUAEym7SpcHReij0RtEOtut8uMYQIxecauYbpHWUpJl/xmzUmync9ata
         Wy5hC3aavaSufazNk18X0gVst3SVbOz4KLmQNQrgLxXBpLo/c0PuQdHX63dsL3aSiL9f
         ZK0FS3w8Oip3FfHS5bzgeKbmbmREC2Oj39QXNl5t99HHmLho84qpH8qQmzvh6g/Eet6l
         1gsvV9f3XnmAspCuxLykRTcfJUSH+RX4S9f6BR38A/Cs8SoBCxTlJ/Vc1ZvX7ppATfdl
         jwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784888064; x=1785492864;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v20uZoTQ/mwANO1IBMlc3WzjT0tbgg/Y7EG5PuLU7pY=;
        b=IuJEMi2QdjLsy5MUy9gQbz0RYswkXNIbJ2GNEv1Wk3Ni4DCtTi1/0Hb+ns9IzlHEWm
         fPtolrv4RUKYwFqVBgyVT+xBol4xHVUL8qdqIXHEjSFBCnk1V9xX9zxHjJUQMYpsBxNF
         1CmGm9tljPr05bVo7ekLSCCpg/6777+8DOIAA6rbBmX3S3YSeLllbDbQ62ABWMwjfAbw
         FXJulAa+cXde7lYI+5ibQeYmRm/qEJkn+d/inLjRLlu7hL0Qm8be551UHxx1qnTh1sxB
         SLtjgzmsEk77JOsqX1p4l+YMYvT7kpP47DuDJ/VVXaFvLkFcDnRlY2Rqw9X4djXv0SOW
         cLJw==
X-Forwarded-Encrypted: i=1; AHgh+RrwVSdH2/mXIKA9FBCyGWLc/gYKr6Y59iOZO7oIIDYJp4OKq4OADXZDSrl2vNm/zRfWT2DANAELP10OEyYF@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm3amvK7++zp2mopnrWdXvVVMLINLDfY4kodzWUWiipjKQ4TIf
	57lTy7NWQWDW30HVuY3GWVlPIEGazgP1zSBb+CEle78665rUWK3vHhcNMFKeiHOxcfieKBMKeiC
	K/9OEsWYz2U7E24Bs7fzYMrIlTcx/jgM+RABIdKsULaUP4yZtYxsJLo/XIpm9lj/MIco=
X-Gm-Gg: AR+sD13E3Qn0ErlI4hOfodHE++w/Fy3xo+DYyi113H1DAAZFb4KDneVukUtZJNHsDEQ
	MVTIOXayWvrRnWQmMPDlwDYI2hY0ERUnRKiihdxl0nK+IXKBTquRNv+Rtf4WHUfLUmebS0GR9ed
	Oe6mvS98dZFDzvv2pV51e5hTpjt+sj+dAR8WGCOTqPhLYl5zmmUPLhfXAtOTTKwIQ28IQLXDtsG
	tC9nwmrSUn0aluEEEkG64n4r2NHj6v6gtHo2Zq+L1IcjPIasw+rcqMJoZ9ReKbwEr/XSDMMBP5d
	wjGnsIefE2UVZQdHLd37evvwdWUded7Yby2Xya90pag0cuR5ozTZ0dxMAIFvoloHr5Y4eTUYLWb
	Z7EwejN987OjsxRNv3SJ7hkfwcIGNYQ==
X-Received: by 2002:a17:903:198e:b0:2c9:e961:d256 with SMTP id d9443c01a7336-2cfa748869bmr79814845ad.27.1784888064477;
        Fri, 24 Jul 2026 03:14:24 -0700 (PDT)
X-Received: by 2002:a17:903:198e:b0:2c9:e961:d256 with SMTP id d9443c01a7336-2cfa748869bmr79814675ad.27.1784888064107;
        Fri, 24 Jul 2026 03:14:24 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f31f14csm48486575ad.63.2026.07.24.03.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:14:23 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: [PATCH v6 0/3] monaco: Add PMM8654AU PON support
Date: Fri, 24 Jul 2026 15:44:10 +0530
Message-Id: <20260724-b4-add_pwrkey_and_resin-v6-0-41acc214d93a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPI6Y2oC/33PwU7DMAwG4FeZciZTmjgp4cR7IFQlscsiWDsSC
 ExT3x1vQhqHlYul35I/2ydRqWSq4mFzEoVarnmeOLi7jUi7ML2QzMhZaKWd0trJCDIgDoev8kr
 HIUw4FKp5kjopwHu0ZrQoePpQaMzfF/npmfMu14+5HC+LWnfu/prK3wablkqOHljtow/ePM61b
 t8/w1ua9/stF3F2m/lj6X71vmaYc12yMeqEGPwKB1fOaLPOAXMh0ggEmJLBFc5eub77h7PMmUg
 Bekcd2FvPLsvyA4OvhMKvAQAA
X-Change-ID: 20260226-b4-add_pwrkey_and_resin-2c04d8d53f5d
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784888058; l=2254;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=wgkNwTMNmxbTucxWWGqV8TlTwvDtraM+5KHqckNDjbM=;
 b=UiiX9vsjfmuU2k+AWLI1P6g10B+6ExGnH1EWvr/Ugc04LRRBKnGUGdBns5KZt3fSHWUfwo6Ui
 tXELBeNz3ttDKdWckYDSlVxzBnoTeib3Wca5wrni2CletflazxIGdKX
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a633b01 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yKtiMK3Jr8YiAxjqaX0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: u2VqJlYQQd7jOcSflhBAU9K4X7wNfMBQ
X-Proofpoint-ORIG-GUID: u2VqJlYQQd7jOcSflhBAU9K4X7wNfMBQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfX3jGAdJgSqssL
 nwQMIIEEqYLLFcAx8tGj9VtuDTReOEztDW4wMyyH6wLvqkw/U9dA6GAFpuCSahwApcsDqD21UfF
 gBYu3psNoEabf1EbFZ/cvjBmaXZboPU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfX0iHBxwjhdjiq
 yNLivjSOYTXWz+zbXpxOYEk2hkDLcQWTDqc+T5fsGsNiWaB1b+OLJMjTdssil5WRVFqvxw9bJVR
 tUZMJmDN++iK1OlSmZaUhipIp8nuMNPVQanGbTc5GzbPrZQds2KCs0d6jLsQH3RMblgEMShdror
 12Eo3tUm/983jGzN8ezEThs4HFxWYTarXl9f2F0Om8fHCrggGSxStfMwBpOGv09t3ECsMpkGxst
 QQa/PYOeVU2ihOwsz1zhJgMpY/7nNvI7XkzXHLiL1HT1q2Xaa6CyjqG4U+crvUhkTSaPmAgiLPh
 TjIi8IXbvk6FjNS1a8B/j14nrdUUdxeDai9cxh59lp/KEdh6D/+D4V0EPK+9IDBFPc/pRyeuuqr
 gu2pD+gdcSXE6oVfjWFO9JW+Z9NyJlk2hWp0K9vXuH8bNy383tv6d8TaVhYUOSjoxHrJxQ5qIAD
 KSYTm1DNKsftG8CAZyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240093

This patch series updates the PON power and reset dt-bindings and
device tree to add support for PON power and reset keys on the 
Monaco platform.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v6:
- As suggested by Krzysztof Kozlowski, split minItems: 2 fix for qcom,pmk8350-pon into
  a separate patch — it's an independent ABI fix unrelated to adding PMM8654AU support.
- Link to v5: https://lore.kernel.org/r/20260713-b4-add_pwrkey_and_resin-v5-0-3bea476e1453@oss.qualcomm.com

Changes in v5:
- Set minItems: 2 for reg in the PMK8350 if/then block to enforce that both hlos
  and pbs address spaces are required for GEN3 PON peripherals.
- Link to v4: https://lore.kernel.org/r/20260323-b4-add_pwrkey_and_resin-v4-0-abef4e4dcc3d@oss.qualcomm.com

Changes in v4:
 - Remove the contain for PMK8350 and new if:then for PMM8654AU as suggested by Krzysztof Kozlowski
 - Link to v3: https://lore.kernel.org/r/20260227-b4-add_pwrkey_and_resin-v3-0-61c5bb2cdda9@oss.qualcomm.com

Changes in v3:
 - Drop the dt-bindings of PMM8654AU qcom,pm8941-pwrkey as this
   patch was picked - https://lore.kernel.org/all/20260209-add_pwrkey_and_resin-v2-2-f944d87b9a93@oss.qualcomm.com
 - Update Commit message and disable the resin as suggested by Konrad Dybcio
 - Link to v2: https://lore.kernel.org/r/20260209-add_pwrkey_and_resin-v2-0-f944d87b9a93@oss.qualcomm.com 

Changes in v2:
 - Introduces PMM8654AU compatible strings as suggested by Konrad Dybcio.
 - Link to v1: https://lore.kernel.org/all/20260122-add_pwrkey_and_resin-v1-1-a9fe87537816@oss.qualcomm.com

---
Rakesh Kota (3):
      dt-bindings: power: reset: qcom-pon: Add new compatible PMM8654AU
      dt-bindings: power: reset: fix minimum reg count for pmk8350-pon
      arm64: dts: qcom: monaco-pmics: Add PON power key and reset inputs

 .../devicetree/bindings/power/reset/qcom,pon.yaml    | 19 +++++++++++--------
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi           | 20 ++++++++++++++++++++
 2 files changed, 31 insertions(+), 8 deletions(-)
---
base-commit: 9eebf259d5352b87080d67758f483583d9e763d7
change-id: 20260226-b4-add_pwrkey_and_resin-2c04d8d53f5d

Best regards,
--  
Rakesh Kota <rakesh.kota@oss.qualcomm.com>

