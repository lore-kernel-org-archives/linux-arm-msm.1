Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13068146D53
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 01:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784336685; cv=none; b=QPn8iIKA+1i7TOthth1QzQ4oF5Z4cGuG766WiHMuwa05w/ySD9NttL7ALoOy76ogpYC8ZxK+bWynxXisPpt1O0+6RiM7EQsjrJgKt81yr2RhuIFGyUMtzFDd8luILpUSDd67hrOCd+t/NC+X0XexPS4xi9nOuJYkgJpA5sNdAZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784336685; c=relaxed/simple;
	bh=svS3UQbUNSb1CVj/mEsrvkJ5SQJgoZaq9QdaytrddKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WLxRg2vFDgyBf8zZj9rv37z8viSAylGlowm2bxviAhjV0HP5DFF/F6JfGPGNKQ33/+df7wWlrXQFVjn6xDJ2Ckh3nH31D8rOTSaf/xalRU1hbwj8I8NJlqgoUtoDyUI8KU1WIKhf3yj4ODbdDEr4P1smg6YgElkKhRiEO81FUAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bRvPpj/Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZIq+Mc/8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bRvPpj/Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZIq+Mc/8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66I0JkKk3318409
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 01:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rQLRlSB7PGWIgFFnVYd8T2nZ
	Olfy4NygBjlMFmkKEA0=; b=bRvPpj/Zqt7bPVpIhmwtZY+AmMaBPhkRFEIGJj1F
	FWXqHrwjAfLU2X7RqeQpxQCo+/4PUqHomjzwzcbovlUj8QVzhJIitso+LhSTX/OF
	SgSeuLDBeEIlWqsOJyNEl7JmK0bxinazW9NjddUt3ccEMW1jWPPhdfMMTcJi9KIu
	/w2/wwnmM4HaGfNzaEZ4hJSwhXgzroQLU+NDp4Igvv8bgZbPkeL1x1+dSJ38noZS
	MQATaGwwTQ/YhR8TwaJw+uvw0qxIjYpw8nHxYfryg+t0i7ZPg7DIVY28YiQYO+UK
	vtpx/kQf7bVMI0TmzK02bfhoLyjHY9//3nKbrItkg8kw0A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffxup833j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 01:04:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ce7fabf76so11676410a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 18:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784336682; x=1784941482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rQLRlSB7PGWIgFFnVYd8T2nZOlfy4NygBjlMFmkKEA0=;
        b=ZIq+Mc/8MtcB1cENW7cQ/6XwIYal/E2lEwWXv1p7B2TTwb6hkx3kVH5iQRhAkNyiBE
         H0W5Hce1fvApoOfIvWWfkOi8kLvSmQXZA8/OZyCdpezUzJU40XnQGy/blMbeMHxdF0W1
         sEjx8mZa+9mboCMTdDFOo/y/YYezh0DfZBEt15qFG3K8VzqjSj7oQ5sMfZEZt8wxw9bV
         8VWG17W4Bohj+tZTq+LkszlGzqT4AH3Z592zrYoPZSS5+jpmnz17AzVdVm37B+7IE0FB
         cwB/aV4VUaDD6o0oX1ppb1ws7p5MzZnFKzc+uA2LaHc+pMfd33gBjNM+v9zDDaI5Goan
         Ps+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784336682; x=1784941482;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rQLRlSB7PGWIgFFnVYd8T2nZOlfy4NygBjlMFmkKEA0=;
        b=Nzf6sXLSoASIDoQrVzPBSK9s2+KObtItCCLjtKHSTSfZNxV7s091tjMjg/riZHc3oq
         cc2xNTR7fcaq/kPxWE0JNLGIDVcEF9xgrH9rdIWZLNCkg1aOIIcMp0PQosAyW9MpcQfW
         5K4Er+SkRzErSGUDbeSOotwZ9UDHgv0/TMcWdCpYj1Uan2/Iepk02vF9deG4Cuq5tyxg
         ElGP3zUfFu8HjvTcD7PVgr7TnovdpwyvrpzCxqIY+tdsf5HewsDK0ig6MBssKRDZLT6K
         ETGlFW2R7eGqF2LNAxNc2mVBldGv+1hGPqhtiRGCECQvcu7Sr/fj5AE3j6iPj4CuD3gE
         u6QQ==
X-Gm-Message-State: AOJu0YwNQFPUS60n072hkz/+bfjC6TCxBekbiHldGxt/Hd4k6/4X1Vf4
	uRN8gd5EHy+FfK89KZLU5yVdjhxnUajLtRIOiDst28YphlOEL2ZmtEfZ6fuwQbhxPjrObidlMOk
	3t+tn8zG+lXVY6cS8eBsB2MGL+AO1UFWgKitWalHW0EGJd4HwIxQxuuOyXc3Zyj6yci1a
X-Gm-Gg: AfdE7ckixxXJ2oSow/L71HcSpC2ivPUGuDB3AyirQBpsH+A/41uh5ikp1F9HFZOPZia
	iFRZN94TUs4NqsJynL71SngIB1RF4avcEr4DaBkAwXSFgz/WfJxrTRq4IuaG2rzmHBTZ7wqkvSV
	LE15BxmrugT1KBa/U4QTiX5ZHzIdLVHvnrYq6JdTP2Q4XKXuqmInyqdDp5b0gMiwwU2MXpdy3kq
	NCwsh0wJv8oLWW1PTiNL+cHOJP+hCubPyW8f9bkxE0078RSZOLOOIP1kaP8LKDmdlp2RkiQMq8P
	F+1tC7QtL/SV7Wqd2Vkn4pbydx3wUECMo425PiHMOdYJcWtisLz1M1OWn6GKARiHZ7obKl0RegT
	OiLlIW9MjGbxdHyFKz0UT9WgdbEFlJjr1uWxVqzM2jZPMGAe1gBjz30E8
X-Received: by 2002:a17:90a:d605:b0:37f:9ce3:ca95 with SMTP id 98e67ed59e1d1-38e4b54436bmr5104030a91.30.1784336681734;
        Fri, 17 Jul 2026 18:04:41 -0700 (PDT)
X-Received: by 2002:a17:90a:d605:b0:37f:9ce3:ca95 with SMTP id 98e67ed59e1d1-38e4b54436bmr5103968a91.30.1784336681100;
        Fri, 17 Jul 2026 18:04:41 -0700 (PDT)
Received: from hu-mattleun-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm11476274eec.24.2026.07.17.18.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 18:04:40 -0700 (PDT)
Date: Fri, 17 Jul 2026 18:04:37 -0700
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/4] phy: qcom: qmp-pcie: Add PCIe PHY support for Hawi
Message-ID: <alrRJQF2JcThIh4k@hu-mattleun-lv.qualcomm.com>
References: <20260707-hawi-phy-pcie-v4-0-8d9cc6324947@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707-hawi-phy-pcie-v4-0-8d9cc6324947@oss.qualcomm.com>
X-Proofpoint-GUID: PJQmY0oPrgxLt8IDT4fH6b_F7x1GgMgg
X-Proofpoint-ORIG-GUID: PJQmY0oPrgxLt8IDT4fH6b_F7x1GgMgg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDAwNyBTYWx0ZWRfX9eeSIOoKTK/a
 UHKKPVePJsXhbmTbSf5uHXc1mLdGrdEpneh2dkbE/zZ6v8jPpDUxTfJl64ofj8cIGgg8a5p8BNM
 8+GGTsPVsWhYe2YuJUCbaVWL9orAj2+ze/djKvABgR2sMljxGz/rFmBaGMgi2aMXgVF3lE9qkrI
 noz2sKLzqcW9zaDNz61SmsTWwm96MKPcmKkTzIEHxXaQ/RibuXdErSxF+DyoA20KTUE+L2cffyS
 F+mpQTGowggpb6nVNJqB+QZNbo7HDp7DtUxgpRdsMi8HBI91BAuPsI9HuSBBz6KSTka8Mh6lekv
 JZZAm82e5coNBD+WRvYGbg7eYR0a42Y9Xs2qICY2HqUSuvnBubIHM3i0vg5/1DFVRG53pRPU7s2
 Dszsf2zEDbWC/dit4yUJIF4JBX1jgsZtu7vOzg0AcsJP+eaKe+6I4ZY0WCoE0NXNV3BDhz/BNkw
 6CGZdTn0XRggXjNgpSg==
X-Authority-Analysis: v=2.4 cv=JoHBas4C c=1 sm=1 tr=0 ts=6a5ad12a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=KKAkSRfTAAAA:8
 a=JfrnYn6hAAAA:8 a=jj8kymYpkfAu7g8d2q8A:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDAwNyBTYWx0ZWRfX5fS0IG2g3mtL
 lr2/fgOTFxIhmSO8XUgz2+K1g7WBTCgVsZnZvwfhBb5uUtG9AzdKEksUUM1J9+Z7SgzYvabaV/L
 nFTMT6k0cxYguDqZ14AHmR8hlyCyObc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180007

Gentle ping. All patches have Reviewed-by tags. Please let me know if anything is needed.

On Tue, Jul 07, 2026 at 08:32:45PM +0000, Matthew Leung wrote:
> This series adds QMP PCIe PHY support for the Qualcomm Hawi SoC. The Hawi
> platform features two PCIe PHY configurations: Gen3 x2 and Gen4 x1.
> 
> The Gen3 x2 PHY uses v10 register definitions, while the Gen4 x1 PHY uses
> v10.60 register definitions.
> 
> The series adds:
> - device tree bindings
> - v10 register offset headers
> - v10.60 register offset headers
> - driver support with PHY initialization tables for both configurations
> 
> Overlap:
> The series has overlap with "phy: qcom: Introduce USB support for Hawi"
> by Ronak Raheja (see link [1]). Both patch series introduce a subset of
> v10 registers (this series for PCIe and Ronak's for USB). I have
> coordinated with Ronak regarding the overlap, and we can update the
> series to resolve any overlap based on the order of merging.
> 
> Link: https://lore.kernel.org/all/20260508213234.4643-1-ronak.raheja@oss.qualcomm.com/ [1]
> 
> Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> ---
> Changes in v4:
> - Rebased onto v7.2-rc2
> - Link to v3: https://patch.msgid.link/20260618-hawi-phy-pcie-v3-0-3fa42ca45ea4@oss.qualcomm.com
> 
> Changes in v3:
> - Squashed v10 register offsets into a single change
> - Squashed v10.60 register offsets into a single change
> - Removed USB mentions from header comments; offsets are PCIe-specific
> - Reused the tx offset for the v10.60 combined txrx module instead of
>   introducing a separate txrx offset
> - Link to v2: https://patch.msgid.link/20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com
> 
> Changes in v2:
> - Rebased onto v7.1-rc6
> - Patch 1: no change (Reviewed-by carried forward)
> - Patch 9: rename QPHY_PCIE_V10_60_PCS_PCS_TX_RX_CONFIG to
>   QPHY_PCIE_V10_60_PCS_TX_RX_CONFIG to be consistent with the
>   naming convention used in previous pcs-pcie headers
> - Patch 10: update usage of renamed macro
> - Link to v1: https://patch.msgid.link/20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com
> 
> To: Vinod Koul <vkoul@kernel.org>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> ---
> Matthew Leung (4):
>       dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Hawi compatibles
>       phy: qcom-qmp: Add v10 register offsets
>       phy: qcom-qmp: Add v10.60 register offsets
>       phy: qcom: qmp-pcie: Add QMP PCIe PHY support for Hawi
> 
>  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   6 +
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 375 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h   |  18 +
>  .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10_60.h    |  26 ++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h        |  22 ++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h     |  23 ++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h    |  49 +++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10_60.h |  55 +++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h   |  47 +++
>  .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10_60.h    | 109 ++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |  10 +
>  11 files changed, 740 insertions(+)
> ---
> base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
> change-id: 20260506-hawi-phy-pcie-283933b4113e
> 
> Best regards,
> --  
> Matthew Leung <matthew.leung@oss.qualcomm.com>
> 
