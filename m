Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4DC3515ED
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 19:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787685220; cv=none; b=e+Sd/KPUpT48YBIjsJQ99qP+fIRYmxzLlY92xk3x4mhMCYLCJ8wlF+ugtnZeJRVGkF5SBv9bJf8mp3PPDlvmrk5wTJ2K+VLAa22xb8GOKIUKvlsci70LC1ADuhM7KARXXbqTOya+/N4LPDw3t2y4gigybptBwKhsPfE3fUmZjpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787685220; c=relaxed/simple;
	bh=k5pErw5pWcfIMHx25Ki0gZNUOC8nLjUsDc6XlyKxZwQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hwV49JjBwcEIqXqEyuumuCzqCYb3Rx5Cx70iN7gq/KJGZTsZhGGqAd1PGpBnO4wfkys4zAgHNSOc1FyypO4dw1l6EDSZk1X1MHgWRuNtvKrb+cZPXyTUginjTqzZI40213qL/T3Rt9oxrTEAX02e12S6iPrwYdhbVwwLems3yIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZOjCYBbD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JlAkL0ZH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZOjCYBbD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JlAkL0ZH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PHdJIK2645877
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 19:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pFbHg7iQKy14IhKA8u68K4
	JT9+SQJD19MuWOafVZXio=; b=ZOjCYBbDCfiGNTErNj9oEtkwxNwY9BtfNckmPc
	RyyT7KEnX9/t64HLBdFswVCO+0tBhPc4w4OInt6p9KOr+9We8CUfs7XeWO2r9L3E
	PI4jp6+odoZW3x0Vht3a4aKqwyL9rbUDS2Z8U7QFufFBImkZExXyoe89dNECqncQ
	xatv7DPHtvdEUKxAaoBgcEkaEUU5Rrgti3DW/jExfxnDlOLjkFJHIegxl7Mczqd2
	DsQcwuTu0EsYPAuxBOHT+tJVbbGFRB5Zb7GEXm9mk6FMuzsV+xApvzIR/D8FNCwc
	CENhId+dlHFFEVqmjZlrt7sSPoyQxbAAZuxfpmmp69Hf59XA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9bku9mnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 19:13:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbf293831so422433a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 12:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787685216; x=1788290016; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pFbHg7iQKy14IhKA8u68K4JT9+SQJD19MuWOafVZXio=;
        b=JlAkL0ZHCTm4zzp1NjY6JgGDq0pFvQeqhbOwBGtEcZ2BsHarHedOrsGqJXmBVjJ2hX
         B09bRcaDL7aDAJQ1xhy2j17NFphzRfi0TuUtM1RlovQDdiTw44S48pXtIC5NNy7glLzc
         vdJq4QpoEUBRApT9dQ9qxU0xExbgWlfMWfbISch63bgWrVTYiOvmMgLx0yQ3WJScOb9I
         bRbhmtEhbxv5XpI85KqE1r3h3geykwKA/yVyv5PPxODsXanPDnOrrpVb6Jy+ih6F+SK3
         //ih/1P39KbhR9Nzhr3QCVjsJH6Qsc7TuAsqIYPHutm2arDvpHGuBDUv53C+XSXD20Eb
         vp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787685216; x=1788290016;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pFbHg7iQKy14IhKA8u68K4JT9+SQJD19MuWOafVZXio=;
        b=WLfsA4XpKZI7GtLcfPh1hSLFdlSwS3TNvuWsYdUHmStW+IvS3wqwwc3BWOzjL0buU1
         otWV3CSpl9w1Jsz3i+qIPw1CtBJeTrjY6w+S03TguiMXqFiHtt8KGq0BFP5B8EIFBkMS
         IlnNIoi3NRfBqGnrF4Z9bFHXBVc7x7Pmxj8NOvZMCmN7a7O3XOxxVnCL13XrUEqLzhh6
         QRi+bIhR1Fygal2GhtoQ0ZGWDvwGvfJ02SvSt09120Sg5dn6xxmeL+Rn8KoU3w51HANi
         Gw23Ett+QSPdyKFd9m0pW4K5XyQUbmlf/z2t3kDO8lMzB2YyI+mrp7LBKRhIoRD/zKpc
         awrA==
X-Gm-Message-State: AFuF++n70N4/D7AiKVux3MIv97TeyQ9bKPW0LlO4zXrrUSQRfcbv/pK/
	zh/C0aINM3mN3ixTZzDseGj8ZSxoDRGPw73nysy1GBjGET0UW4uVCGbrjIMZTS2ZNRmO0vmBalx
	+3pZ1LIpGe0zi+POVeQDzl0ZBcjD29BGrZEUFB7L/10DmeTyuBnBTDcz/HV8PB6wTH0y0
X-Gm-Gg: AR+sD12imBWCGqOrBC+Xh0R4Egbf1PktGIJ5cSopEpnp65/HYV+PzKfSzuAVAdcceAQ
	c2oiyCxPEeg0YIzwCeRg7wtFwJfxTQgkEeSi3dIc4qY2Av96ruXWKoOA4f12/LJwTqU6yH3wOjK
	AfbPIXbF3Vd77wPsj6Ong1ntCKPKdKbiqqLiT8nvOOwaVV6Wfo/msJy1+ySLSF3bR8q2gPfzYWS
	SWBXqixmu3pWddbrrV6F7tCXG51Q4m2l7x3APyaFNkZtfnimBzw5GqX+sXkb2AZad9TpMTAPIbU
	8wt+9JAwYjqepB2t7FJcVHnqThmxsl3ywv/4N8TUcli9F7RVj1MLebNjINo/XPZbTeAVE0QYD8+
	OzNXL3B3rHdNo0+o9WaeijYtpjgZGqa2J
X-Received: by 2002:a17:90a:d44c:b0:396:5f7f:52f5 with SMTP id 98e67ed59e1d1-3966d366aa3mr2559409a91.3.1787685216499;
        Tue, 25 Aug 2026 12:13:36 -0700 (PDT)
X-Received: by 2002:a17:90a:d44c:b0:396:5f7f:52f5 with SMTP id 98e67ed59e1d1-3966d366aa3mr2559337a91.3.1787685216130;
        Tue, 25 Aug 2026 12:13:36 -0700 (PDT)
Received: from hu-afaisal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283da048d3sm930416eec.28.2026.08.25.12.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 12:13:35 -0700 (PDT)
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Subject: [PATCH v4 0/2] arm64: dts: qcom: shikra: enable ST33 TPM support
Date: Wed, 26 Aug 2026 00:43:20 +0530
Message-Id: <20260826-shikra-dtpm-v4-0-8476223184de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFDpjWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDIzMDCyNT3eKMzOyiRN2UkoJcXXMTS4PkxOQ0oJyZElBHQVFqWmYF2LTo2Np
 aAGsV601dAAAA
X-Change-ID: 20260825-shikra-dtpm-7490cacf0266
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787685212; l=1135;
 i=khalid.ansari@oss.qualcomm.com; s=20251105; h=from:subject:message-id;
 bh=k5pErw5pWcfIMHx25Ki0gZNUOC8nLjUsDc6XlyKxZwQ=;
 b=hBxIefE7AEhSR8MViBfMKFNTveMuGdGt/7uGFiddRc7S7N602V7INLyTSIH2wXYhLDbENV7d0
 Y5j0ZnRfT4VDrX6U8lGpDdySnrfNkwZQpMKnzRYUB+lDqM+URCGIkFe
X-Developer-Key: i=khalid.ansari@oss.qualcomm.com; a=ed25519;
 pk=eBXrIUgTWV0cgG+GsNeZPPgvj1Tm6g9L2sfcoxMGrKo=
X-Proofpoint-ORIG-GUID: UtyEK-oLfj497PFuZtlRKhO9MR65HBLA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE2MyBTYWx0ZWRfX/o3qfqntyqgY
 8zt7qp2p3kgvq0VqoQCKHLoi7vrysrTYVhW1UZ7U4r8QBTV0N8oHydtN0b8naW5P1Gejc6cqmwx
 KcwhfHCgXwB/l2Ov6/XINr8awX6Fn00=
X-Authority-Analysis: v=2.4 cv=TZGmcxQh c=1 sm=1 tr=0 ts=6a8de961 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LFEp--mz5Qji-3JE28oA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: UtyEK-oLfj497PFuZtlRKhO9MR65HBLA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE2MyBTYWx0ZWRfXy1hULohLZBxD
 MEhHQdKM7bW4TPD+cV70r9el4AmQwKOi+UMbrfzaodF0M6uEmtnpyuSiZxeDEhVLbM1PA38DBV/
 QQqF1NHAA/COLYmM2YZ5G0OJJxt6ERHlwgyhrf4tjBijGbRYjSdBoYBtVVRplVUTRPVRUqM+ECB
 kBwNnjda5/VyufizyvXUGsVev5IKhmQhbsPIQdgUeeDBxri/hVzUzMlDZ3+aR7LAGmT5j5rhQd2
 iNEzgub4pLlrAf1om8+n4651Fnf3jWalSq2dmUcp62O8S+hCMpUvomWp7fJxa5QylNmQusI1wes
 6gEbAtR3m4ew3e9VH82PnSSxj1hwCYG97ZGsCgOFnqXmGY/Ve4XwBEZ6l07JzhRKM3RVwV21mq0
 eF/1kcijbc9s5gpdisQqPqiaQHnVzLEuL0oXd7hwViNBVA3duF8YPmdVYQ/GOArY930AZGB+ylf
 oj5UxbcsFTenuVEWFrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250163

The Shikra EVK platforms support an ST33 TPM connected over SPI5.

This series first removes GPIOs 14-17 from the reserved ranges so 
that SPI5 can be used by Linux, and then enables the ST33 TPM in
the common Shikra EVK device tree.

Changes in v4:
  - Send the interdependent GPIO and TPM changes together.
  - Add the SPI5 and TPM nodes to shikra-evk.dtsi.
  - Remove GPIOs 14-17 from the reserved ranges.

Link to v3: https://lore.kernel.org/all/20260820-shikra_dtpm-v3-1-93cdd4f3e8dc@oss.qualcomm.com/

Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
---
Khalid Faisal Ansari (2):
      arm64: dts: qcom: shikra: unreserve GPIOs 14-17
      arm64: dts: qcom: shikra: enable ST33 TPM

 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi |  1 -
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi     | 10 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi |  1 -
 3 files changed, 10 insertions(+), 2 deletions(-)
---
base-commit: 65eb47183e176d8c1220cb945edac71dbedceac1
change-id: 20260825-shikra-dtpm-7490cacf0266

Best regards,
-- 
Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>

