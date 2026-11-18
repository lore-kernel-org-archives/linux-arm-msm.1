Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981765;
	b=JyDbH5yHChciaDBqMgBc25qJjYQyhgAEBEB4Yx9B+QMnjJCpFKupMMgmiLX2juAHfkLy
	 6xZonHmL6SzOiM8L+3nTQp7lW8O/KQHKWPt++Kr5Oewebg2WlGAM4Txcs/qjn9aTV5wfE
	 qPRLxHFEHBMQvKh66N2tHvDujEZZybtbJKvqdUzoHj+kmkwRadyWcuz56WMEmpT4Wb3Bm
	 lgOOwN/w0Xz1MBcYe8yoTRVxIpzhv6NDtzbAGKtUzIJvdLu4RHsgnUCA/FQxvJ5LM3UVW
	 bbX+iAAWUbJwzI1BCE2A/oCA0UE5GUDewS8+AA1ubM+GOzTHxtjrKsP/N5oCGF6ygLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981765;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D17HvPwn7mDck1Dt1HtFj3YompRsTaqBaJD/AohEDDY=;
	b=si+3BnEGAjFNkV2aB3ysjBy4T9pBjbWtzlis60W7/UVND3Gua+AGKem9Uy9hRTLXLcog
	 zdiBgqEva1ijFcfyZEM9E9/+AP/siofKPh4fOos5dBWA8w89bTaAbtAk0ABAQpzAY/jKJ
	 PVCnftpvQmyMoOQOao+ZJKQ25AjA7WR/he4o5CEi5W1qkcXecPH5iLsOO5rqbPOb2xMrY
	 W9mhPz3O34RQE8B9P0u63bUV/usDvLLHsi5aA9LWZubmnl08nlavAoxc0211eO9Ejr4ER
	 UY0K+jPtUvx99NIizHyEbjVu5g6mIrbwRLffyslvyIyfbS0BDLRKKl8vHhcQaYSeRug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D+ITdzay;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="cB/JEdTm";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0F9606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A0F9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D+ITdzay;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cB/JEdTm
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V235472692
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=D17HvPwn7mDck1Dt1HtFj3
	YompRsTaqBaJD/AohEDDY=; b=D+ITdzayM+s2wKHuDSXbK8cMjnpDTmzflD85/4
	7TItZOOytJgZ9SBAgBDc5GT7lWdjCi9h82mb2FHplgGKWH/9oJpMOSRz3YR3l29J
	oTEnWdbgLYwknsazq8jPHi3OuksbvdH0AbjxfGaOalgFlcctYA52q19pvjfPzV1w
	Vt4ZgfFqWMKQRxFP1rd0SS5lDvV/zzvj4cftAKZjYiu8YUsiXlPgeBVGEvU9+BCb
	BBcEu4Em+UykCAwPPg7qgXOsrsOFnaRBUE0Fnhvk9MLkwAct+JlB+q/IVsA1Nm3B
	sbA4JVNq+wJtb01huP8yrK4aSfAGOakNAsh/YDBWGEhHU9oQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv89eaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:02:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eb5375cd68so6465705ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 22:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981762; x=1795586562; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D17HvPwn7mDck1Dt1HtFj3YompRsTaqBaJD/AohEDDY=;
        b=cB/JEdTmAcKMGdEIJAK2EP/dhzizK2NaqhyIyWy3RdyaGwWuw397bkO/Pl9mubSz17
         /9f1G1Ug5m8u5k2JrXHxPz+Zv0DqtnVPZgJoRuvVim44PcuIt1R6UyynZQEqAxeSuF5k
         6wB2JYBezC33xYKvy6Z36wEMibthW9xg/PrGdcWTyZT9DmDNn0eQKJ5U6doQkZNc2fbf
         mV0OsIelTOgenBv8iikfj77JEgPTlwc3pJbhltn9o01CgwLk1R53T4La/NGQeP87FU/c
         EJe+kk7BK4h1TUyTglmCvlomV/5LS275O8FmnY3UJe/u83HGXsS/SLYUpOmAJrshV8Z2
         TImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981762; x=1795586562;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D17HvPwn7mDck1Dt1HtFj3YompRsTaqBaJD/AohEDDY=;
        b=ePIYXmUW69fmU44CPbRaItisDdu9+aPuytfIw5Lh+NmH46tJNQSnL+7lWaqPEeuADC
         1qH9XRlAoTNubfvQvfSAwCr10pJ999z72IAyOSqgjd23yEFoN6oTMa6ims2vYnTIPppl
         9xTluB3eboJRTwu7r7NYP2lenZhgsMo9oXwM9W1QaKm146IT9WjCH5J43eBNXbIRywof
         GNQwfNNhOyZP7k4RUcLqsNQhhyC3yggvuucRKiZ0zAT8C+Nsv22R3NZooMeyeCAgR7QV
         aDKteb2OWlyKHlaXYJBvUU15MhTdKafFAUnPikvMT1epKYViENuaPHfEAvcgaeoi1Sqw
         AKdQ==
X-Forwarded-Encrypted: i=1; AL+hErEhyMGcsJBXXbTRU7QCvJP80uTnfAQIOenvWZ1nc0wIV+Oyv4Sf2RzKeuHxpuJPM6qfQQMeiYuPprNznghm@vger.kernel.org
X-Gm-Message-State: APuU4Z9jUQ1g3A05DCA5lHZwD5kmXAsIaG+hwgyDa1iCrajXhlz7zOQU
	0QsAYZBhjAzX5/8LwU4uNNmTQrJFnAXfDpr5gTPirER5zfUWOPQaPRZPWcMlFKilRfaWxVyoatw
	TkJY2oZBdYsZrVMJJIyfUQly5gRoNaXopGT3vtx62DlecxGIgUQg92tTewx9M3SdJEYSe
X-Gm-Gg: AZFdTZfT8YfcG6ihWdo7y8MqvU8ZR/fvE6PhTu6YpRxYZZCjFrTy67by9gU1HsTkTDH
	++DBKiljB5kVE2nwUn6CKERbDCK+X0Xd7y6HGLORIXUbOa44cNiRuN7WWO9LlMmYjjzqEf6LfDO
	FF5OcF81M8lGkJn8ugp7u7X/edUVpEbfaduQQNKLf2BroJ8db3C+WsM5MtF7M6PaQKfZbiLUbJp
	Yd6R+q88ULSJNaumAufp/6MvvqgQWqW65kUb4RzvqzGqXvHI3jhBKDNM7C5KBEAawGHr+gTriHa
	4JSOAUlTVyoCkuRUe3UEBTYo8RDoYOecxEGFdIw5S/0UM+9mkJCoKu8mS0vCqBKJgiKvOOujImP
	a7SwkNcGtF5zdRmNex/CPa00O6L9NTmEP+pT/rlqX+l/vmcVRt32gjJ1JYqpW1w5B63nKBA1wZA
	==
X-Received: by 2002:a17:903:9cc:b0:2e8:e17d:c8b8 with SMTP id d9443c01a7336-2eff7557702mr14900755ad.63.1794981761584;
        Tue, 17 Nov 2026 22:02:41 -0800 (PST)
X-Received: by 2002:a17:903:9cc:b0:2e8:e17d:c8b8 with SMTP id d9443c01a7336-2eff7557702mr14900605ad.63.1794981761122;
        Tue, 17 Nov 2026 22:02:41 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:02:40 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 00/18] pinctrl: qcom: add gp_mn mux function across
 Qualcomm TLMM blocks
Date: Wed, 18 Nov 2026 11:32:31 +0530
Message-Id: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHc//WoC/x3MTQqAIBBA4avErBOa/oiuEiFhYw2kiVoE0t2Tl
 t/ivQSBPFOAsUjg6ebAp83AsgC1L3YjwWs21FXdI+IgNieNlfEwRobLudNHgbS0lVYNdo2GHDp
 Pmp9/Os3v+wFffdrOZAAAAA==
X-Change-ID: 20261118-gp_mn_tlmm_support-1ea40fc3153f
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: dZ4fX8vKwa3CFEDkuSZFHR_1-EmSq63K
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd3f83 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=tUJcrGGC8pjJoxVLki4A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX/bzYiUEKNVOe
 PwiY/eZYgkkDeLnqJMyIAvTXVOaMhlXsS+BWV/yqe5ULSa6l598ZUkK8lzvue+Zt0hNBvviczqB
 1ZMXbn1aWD2CMYDkyuWZuBbc0nE9c5t0IuJXTOAY8QuXs2NWn7dkcWgGo0VLXhSTZX8qL4Knhy6
 kiQJnq7kDenO5Dshc4ANaE9DO2N300QjWr1jV2g6DtjQt1Alj+VnkCnfxIZIMYe0TzEDN4l235m
 zI1InA3fECbGN7xBvPfLHmjUHyxDXgEy8e3YQ0PG5ioeuCQK/Nu8ZdXmYL/31HqRxrrz6vgx5Pk
 oRvyV1KwQwOEzM7RXih9Rl1aQS7pEnZQzPmGrJKYaHc9QNioKt6Um06Bk4YNJeWRGxlC+CgBWDT
 2EkStsjxtpoEipJV2ZAoyDel6MjnOHq9sC2oQS0jB/C8FOT0zIfeEWcvnanvreeDOKTgot1vfyn
 XFFVZUTrQqzamUDqDqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXwsFP1g2SuljF
 VQdWgoX7MnKrdTQdhXFYkz62pDo9t2Eojt9TJedTZQG3+7y/AuLs4MhOJ7NoYyKgIg2b8VqouWl
 +8YOtWYYHb+Vs4eBvijE2/C2KpTFetI=
X-Proofpoint-GUID: dZ4fX8vKwa3CFEDkuSZFHR_1-EmSq63K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

The GP M/N divider generates a clock output that can be routed to a TLMM
pin via the gp_mn pinmux function. This series adds the gp_mn function to
the Qualcomm TLMM pin control drivers that expose it.

The driver changes for QCS8300, SA8775P, SC7280 and QCS615 were originally
part of the PDM GP_MN clock series, where only the drivers were posted.
This series adds the matching gp_mn entry to each of those TLMM bindings as
well, so the binding and driver stay self-consistent. The remaining patches
extend the same gp_mn function to additional Qualcomm SoCs: SM8750,
Kaanapali, Glymur, Shikra and Nord. For every SoC the gp_mn entry is added
to its TLMM binding enum first, followed by the driver change.

Merging strategy: this addresses the questions raised on the PDM GP_MN v2
series about how these should be merged [1][2]. The pin control changes
have no dependency on the clock portion of that series, and Qualcomm pin
control patches are now collected and integrated by Bartosz Golaszewski.
They are therefore split out from the clock series and resent here as a
standalone pin control series, intended to be picked up through the
Qualcomm pin control tree independently of the clock and DT patches.

[1] https://lore.kernel.org/lkml/CAD++jLmA65GL4xxFNSHr-j=Xo2o3dNmEcKjpNEkECXb5bOX8TA@mail.gmail.com/
[2] https://lore.kernel.org/lkml/CAMRc=MeK=BV6WEQNVC5wXo8giAgnrjtdROswXF8Py3BMDLZa2A@mail.gmail.com/

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (18):
      dt-bindings: pinctrl: qcom: qcs8300: add gp_mn function
      pinctrl: qcom: qcs8300: Add gp_mn mux function
      dt-bindings: pinctrl: qcom: sa8775p: add gp_mn function
      pinctrl: qcom: sa8775p: Add gp_mn mux function
      dt-bindings: pinctrl: qcom: sc7280: add gp_mn function
      pinctrl: qcom: sc7280: Add gp_mn mux function
      dt-bindings: pinctrl: qcom: qcs615: add gp_mn function
      pinctrl: qcom: qcs615: Add gp_mn mux function
      dt-bindings: pinctrl: qcom: sm8750: add gp_mn function
      pinctrl: qcom: sm8750: Add gp_mn mux function
      dt-bindings: pinctrl: qcom: kaanapali: add gp_mn function
      pinctrl: qcom: kaanapali: Add gp_mn mux function
      dt-bindings: pinctrl: qcom: glymur: add gp_mn function
      pinctrl: qcom: glymur: Add gp_mn mux function
      dt-bindings: pinctrl: qcom: shikra: add gp_mn function
      pinctrl: qcom: shikra: Add gp_mn mux function
      dt-bindings: pinctrl: qcom: nord: add gp_mn function
      pinctrl: qcom: nord: Add gp_mn mux function

 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml  | 2 +-
 .../devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml         | 3 ++-
 Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml    | 3 ++-
 Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml  | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml | 3 ++-
 .../devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml         | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml  | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml  | 3 ++-
 drivers/pinctrl/qcom/pinctrl-glymur.c                            | 8 +++++++-
 drivers/pinctrl/qcom/pinctrl-kaanapali.c                         | 8 +++++++-
 drivers/pinctrl/qcom/pinctrl-nord.c                              | 8 +++++++-
 drivers/pinctrl/qcom/pinctrl-qcs615.c                            | 8 +++++++-
 drivers/pinctrl/qcom/pinctrl-qcs8300.c                           | 9 ++++++++-
 drivers/pinctrl/qcom/pinctrl-sa8775p.c                           | 8 +++++++-
 drivers/pinctrl/qcom/pinctrl-sc7280.c                            | 8 +++++++-
 drivers/pinctrl/qcom/pinctrl-shikra.c                            | 8 +++++++-
 drivers/pinctrl/qcom/pinctrl-sm8750.c                            | 8 +++++++-
 18 files changed, 77 insertions(+), 18 deletions(-)
---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261118-gp_mn_tlmm_support-1ea40fc3153f

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

