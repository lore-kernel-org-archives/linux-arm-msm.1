Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DA1434E3D
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784619340; cv=none; b=tPXC0ykVBWtV84Gy1PW19VzwNCWYdgkBABkOXjHucHZCfVBJPJAX1Xysmu1Oqy0yD88GtSCCnqAfGIiDgr7af0L+pA8Sc7w4kdQQnkxWd1vk0qGMQYGIgKuNW7FJfkFl3zmbJmkaUHCN4LdAPd9BDL+M15/AbxH/lXSxnRh2cYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784619340; c=relaxed/simple;
	bh=b7HZ/zwN8bK8Q1l9AZ4ZzhbiDe23mCIvoiUG22nzFWE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BA0AMxY4GE007YcI7iU+BAMaKPd0mcYtsDTVGYUIVMi9n7J5+92nAJO2XhUD0Ud9cJRrxKCMl/1cGpMJaRzS254M7QSqP+L6g1vgNhu2D4sqrV0Fgnqshd6iyFD8wpslkKp3i9y4RTX6CemSCULkHEL+EgD/YChNj9qkDrw1ylg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HwBAwvPH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MBCyWAzM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HwBAwvPH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MBCyWAzM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6J1R5045338
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I3cDrkkw7WcdmObSATeGnB
	kWQN16Ucd5OI+62ZV7940=; b=HwBAwvPHytCK0xYmgt/tSXuVQV0lf1xJmOVdgF
	HvLRu+g6M0pmsFNRYb3wZv/dY3a3uojV9JJ3JHbIAKxzwMYPplGQPhiWDqprAn8s
	4I7PHalsERSqjjGfr5Uq7/iApHpYpYrPCJ4yI0q/Y9H43vv8MS3HoUz9TfK83Rg+
	2E/Yh0MqtfasB7IQWtw87MNV9Amkk7ON/bsUuKDb3WZOfelQXcgbG+9TpYNFbQtv
	gRd4zqKB+lkyRRKqibAPTgY/AIqwaNCFSLO7VQ1PDlPIiCDFzOXoMJJuWgWxnaG9
	+2azbiXhRbIkAlQNomH8c9TG1JL6W3xBWHRPVxv3Z/sHHt4g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5ty6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:35:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso977053a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 00:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784619338; x=1785224138; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I3cDrkkw7WcdmObSATeGnBkWQN16Ucd5OI+62ZV7940=;
        b=MBCyWAzMmmufRc78G0N2WVWGkt/hmslvAryJDNU5I0NLTOAQv7CPivT6NPuKDfMY8J
         UUPq4D3u17OCilvJvHUWCaP5p2Ovma+1uGNfoG0efhlEqxIKhcXjH9csTgf3WYJ52RiK
         oqRmyPqMrMZ90mx98333NFuwjvaPFA1XhbCyYEXMRx/rxegNMnnDaD5OLcPjDxoodVLu
         n203hnUSV0hVTo7kgrYXO3s3rWvarU4vUFQDRwBToXbl7r1SvWTEmBlx63oPbSp9gNaW
         k1GqZUPrxqsdUquDAbpo35a1h21+sbPWw7DEWJnlyfzSBZHogr56bwydezHNo0knRjWP
         2u7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784619338; x=1785224138;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I3cDrkkw7WcdmObSATeGnBkWQN16Ucd5OI+62ZV7940=;
        b=p9Jfxbhv9Vqe30uddS1Q5pmR3AXWRv4+Dpz/8J0s8rwfPz99KhJBtRHJHztje66g+F
         oARLvoBExqBsWcLakr/W6go/LUqyyHa8JSN117zH+fpy6e8kux1lakP1qkGgUFW763HE
         O5QRzLYMbWuXiy6C/v2LmDx36UOCAYeHFpB5OWsRq8E7Ei6k25A9TVKsWh7PdFPvRPOo
         MqmRIO35C1KDocHoSMgn0zUEckTU2AnfX//bSOYfDob0fJuoNhWD+HM7L5c+LfCEKW/o
         4lj2gBQ4/CKjYXiy54QVL4ffoHBC6DDQn5Fysif4kFWy2KPPzgWiY4Xc/Rr0Kn9dNsXi
         IM3w==
X-Gm-Message-State: AOJu0YwHkOBiKYd3gc4WL2GYH2vvEORl+FqzX7oTAjDaFQdTNJYuE1eg
	88DyOucoGxiLVHTSNptts/J/bKdl05sDvfLJvlomt+xsdHVPIlCnz6/+aUbnLWBxcDmf/0UL6vs
	Sm1gHvdJA2wSuTHHTJ1Xg/yOKewFiXUOWC91vDVeS8LhThyQ+WOX/V678X9P2EnNMqUpZA/j547
	E2
X-Gm-Gg: AfdE7clRWV61vqgb09aR5XZhwj3em6yrdOpXs8nU+9n3YW0Q8ffHjgCK9GfTQBYub+l
	cl4yCxpjLnkBkLkLIIA+hYw7aOJcdxAjx0Q8QOo0Y4/PvFPAxpx5IiY+wQgWaW5g+Ik9bbqQUG2
	P6Sa+Sqb3TdA96S0Nne38u9c1oH6K2GJ/td4kIF1o8vx7YkfTycHquorKSYSSfG41bHs4Cwul6a
	StaunS8O8uA40O8g/qd1HdnvQf5KknZ6HAriSy8nS1STtuUmw8m9YoBHhJOnm7un41O8J0y3ISA
	nUeaiyvJL7D1+CPzJjC4kOB2T5Y98evIrGarNk2A0UOJTXbu7cNg+tM19n0SC6KTqS1CQNruQ5t
	TYyJ2krvk+y/BmhSoFMUii+Tvatlvs5ySh/6uC/d4eC0+t42mWFtnIla57pMld62srYtaj5kdxS
	watVYc4CkOxqMou/KeIKNtF7qA+Kxipw==
X-Received: by 2002:a05:6a21:4584:b0:3c3:84a5:f2be with SMTP id adf61e73a8af0-3c3ad5a8108mr16745412637.11.1784619337894;
        Tue, 21 Jul 2026 00:35:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:4584:b0:3c3:84a5:f2be with SMTP id adf61e73a8af0-3c3ad5a8108mr16745383637.11.1784619337430;
        Tue, 21 Jul 2026 00:35:37 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a210571sm45224271eec.31.2026.07.21.00.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:35:36 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v5 0/2] Enable the QMP PCIe PHY present in Qualcomm ipq5210
 SoC
Date: Tue, 21 Jul 2026 13:05:25 +0530
Message-Id: <20260721-pcie-phy-v5-0-8d403ef7e780@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD4hX2oC/22OzW7DIBCEX8Xi3I0WsI3xKe9R9YDxUiM1/gHHS
 hT53UPIxVJ6WWlG+83Mg0UKniJriwcLtPnopzGJ6qtgdjDjL4Hvk2YCRY01apitJ5iHO2jtrNP
 coHA9S+9zIOdvOer7560DLdeUuL5N1plIYKfLxa9tMdJthZyqBLJjXVtku+IleGvBz0slOAKaD
 qWTRlIj242zV8fg4zqFe16/iVzyOXQTgNDIzjZISjtTn6cYT8vV/L22nNLJWVt54Hl94MvEV1j
 WSlnZK6H+4fd9fwKHstGkSwEAAA==
X-Change-ID: 20260609-pcie-phy-99fcf91a02fd
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA3OCBTYWx0ZWRfX1++TO5U0yAFR
 ztFqjRLXQD0rvvSWvcH0uL0K4sXZQOMQiW17Ql21/v7qPZ28xomJ7b8JyS7vyJNFaXqRBBUwCtt
 LiJIrig3segb4rmzWuYohY7CRQoWBOHAptMxFAwkgZKTNp4FmYwByr0KFFlt9EWCNq/4IXOOkqX
 zKC8PsVSjqnXVuJV16uw8mJzWVCYbSVyohhujJ8j6jj8qSltx/Th8xuupbV5DWmpW6oFcdZdyQy
 S/Qo84UXFvKyF6plwV9ejST52e1tRysRnJRs8SHdqo3bzaJQEo70A2+xjS9ExrSoO7Vh5BaF1rO
 FzRZhCDLMrb4vVGorzgtdhBqGdjTN95oMCWblnOUAkGxdOT+h/VTj1QR6QBIaCZ1CfGm5wZt316
 JdEs0H0eIbkRmgQA46bjJ6FtACLl/QQEVB2oEBK9pS+5FQBbwgUyHT8kXeR45bWbV+gGdyMMQEZ
 HsMVp/XrY8WUHNlchdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA3OCBTYWx0ZWRfXxrlvyMc5ebfW
 P6mHhsWcIrSUCLUw/AqfVEzGFanqA79+pRVA2Vz4dgCAvBw2GU86CQGfrNQIOD2YMM5kmKNgdTd
 hTVEsf+O41NlO55iK2ee6dCRZfn8TBs=
X-Authority-Analysis: v=2.4 cv=WNpPmHsR c=1 sm=1 tr=0 ts=6a5f214a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=S-5igOXgPsmUWnL4N4EA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 4tFNoGdWpOBiMDG7D1Qo-zL7XLvDNZxx
X-Proofpoint-ORIG-GUID: 4tFNoGdWpOBiMDG7D1Qo-zL7XLvDNZxx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210078

Document the bindings and update the driver to support
the PCIe phy present in Qualcomm ipq5210 SoC.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v5: Rebase to top of tree and resolve conflicts in phy-qcom-qmp-pcie.c
    Pick 'R-b Krzysztof' for  dt-bindings patch

v4: https://lore.kernel.org/r/20260616-pcie-phy-v4-0-504677c3d727@oss.qualcomm.com
    Fix commit message for the bindings patch by removing redundant content
    and adding explanation for using specific compatible.

v3: https://lore.kernel.org/linux-arm-msm/20260610-pcie-phy-v3-0-334011b378d6@oss.qualcomm.com/
    Fix commit message for the bindings patch
    Remove unused tables from the phy driver (ipq5210_gen3x1_pcie_ep_tx_tbl
    and ipq5210_gen3x1_pcie_ep_pcs_tbl)

v2: https://lore.kernel.org/r/20260609-pcie-phy-v2-0-83bc80e79fa6@oss.qualcomm.com
    Had incorrectly made both the phys as fallback. The single
    lane phy is standalone and double lane uses ipq9574 as
    fallback.

v1: https://lore.kernel.org/linux-arm-msm/20260514-pci-phy-v1-0-482429192746@oss.qualcomm.com/

---
Varadarajan Narayanan (2):
      dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document the ipq5210 QMP PCIe PHY
      phy: qcom-qmp-pcie: Add support for ipq5210 PCIe phys

 .../bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml    |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 129 +++++++++++++++++++++
 2 files changed, 131 insertions(+)
---
base-commit: 03cfefef0119410fc464d0d56e83626cb570b7a8
change-id: 20260609-pcie-phy-99fcf91a02fd
prerequisite-change-id: 20260514-icc-ipq5210-0ab03f3a3e83:v1
prerequisite-patch-id: 0b6145b6635b18fe79fbbff5815041b43778c5ed
prerequisite-patch-id: 924c6ff7baf4283ac7991ee94c803a00fc5cece4
prerequisite-patch-id: c2fe1800fe769dccd37f94c19860a07f979e3c4c

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

