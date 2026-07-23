Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0B842FCCC
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800588; cv=none; b=jRGQN2OgBsqgNF1RVcxNYeK6gcE51FL7LFng0FOl/EfzuONV5vjwPtuhZIdd9r2hNKkB1lJtdTlT//PKCYO4oQznb+UbwZJxe+lryLf/9gUVvgmyNT4cHecmxlXiirZ2tte4ERXpJ4gIcSpGDsGdGb11Lm2zehHY15dOD8Hbstw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800588; c=relaxed/simple;
	bh=US0TF2U3ghWsaszzBpUSGSpFLHbyqGZc98PEKS33tcE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IGfONAncEFYnHd3qISRIJ0cKCUUjstoUqosFH21hzl0LV69RXTSYcut3vU/LiA2NWQGtScXj4Hjrjoy5D3hwG5fVdQn5+pgQo1U0eT3MDAsETYcvOgFrtKawGBe18dQ4OE92z8FF6Zk+LJF3fRp85dmSViSKnw7ejbVbozTn4Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PCwucvp9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vz/dpSI5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PCwucvp9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vz/dpSI5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qiHx3387988
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4lSDEt//Xaaiq2pZJ5EPUK
	qp5M7wWI6L0iO7YtKCNpw=; b=PCwucvp9DD+Q/9jRCA/4JIC9QZv6gkw6MxH/Mq
	EAXxSfnR4jQ810ChMHlAV2nkIUDCKMOVNhSk9Wt+swSOFQfqdDsUm4Q6HnXdffEa
	QyaaWxExiZlrJRR/IPArHg/QLD8Bx2xEwcIH/Ig510/bed1JgoFSHQqpxgdtcVSf
	PfGS9d/b3gCtHBrHjJ2p4gO5iFMyV7nx19SrcwrshszVGS4KSTnrhqko7CKkSPOC
	wzk9ywMZxbQW8wV2UgryQxGbAg4NC8CAMEJqjkO+dLNLz+q4gu//U4TAp8xMztgs
	sBR6tPIkuK/4KgX5XiVMpAEF95AzOY+cuuHi70CshP84WA8g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk275kggn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:56:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cca0ed258cso2760865ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784800586; x=1785405386; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4lSDEt//Xaaiq2pZJ5EPUKqp5M7wWI6L0iO7YtKCNpw=;
        b=Vz/dpSI501M11LB8tknt6ARBMTPT7NTcY05b1iVVhOvVrYge4eSbTsfH0AZNKJOFh4
         pAvbrQu7mrMxCtJmy6muNNsKXG3H1+Q2GtDeuyU6ehHQOllnWrZgzMGGL57W2zm1fZXu
         iWKbYLz+1lNGek1/VO0ZnilmhiyEf6qItlcNyPcGIgfEDLNFVf6gWDEa+emQxLJIC3fb
         eKlvpVO6N85ykH9OpFo9eql/QqRfDiZ/ykEmkNzac1kwGKDEctsDwwXHslTqM3FYw/wn
         KUgOUuFgyxlthL6umroWCZtNBAxKM8lRPHOnM8dF2cP0EgNu42W5xPBD6QykW0BmrUAp
         Fa+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784800586; x=1785405386;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4lSDEt//Xaaiq2pZJ5EPUKqp5M7wWI6L0iO7YtKCNpw=;
        b=bJkbyABtCti870CS6L62PFHph/EI14GCg/QXQe/nWsXlfRyVPzOwiCwsv16QDDdwlK
         uylNN8/lMTYtwzAikLM+cvAyvJfAvFuMORF/7FGaZGtRoRZO+SDSkCGhlR8IGHTaHFNF
         CKVi+Q8RGOr05CFvVE/lU3x8Tvc7gVwIF3J8svYf1Jdej1isdnkwPRIvnX3TWUJdmIOn
         OTlxR0wOKL+y+7FCXsRkG+AEyiZE0pMtGzuMnc96Wbjn2t2IUB8yPmDzubusIh1B0ftA
         1OnuMdYGQUeIUZsS7zyWomtzwBrGMGnuXTi7jS8pTxeruDVexbrKJmRwBNuXFI+Yc9HR
         9+eA==
X-Gm-Message-State: AOJu0YzFIvkeY5fvBnBPvSRGeBPqLGjFSSGkLaDO+yBRJ8rkPVU/xrDn
	XSxWKXiP6MvhMOfVek1PWU9Pfhwgd94rDbxgSHoJGQEgl2AApJgaOOYb+DlSOdx8GrHYkIxmBWH
	ODMZ9MulZ5iVSmNwMDj0NrDm2hUVnuAmRdiItlDWuY5jZ6U7oKdn+H4oSgGOnPFWBHDTz
X-Gm-Gg: AR+sD13gCwoS4CsShp6tcL+nQeDubsg61b9Ng2CCwrfNyZwN0jUK61T6OPGhMPWwLcv
	7MzbZM9hPkHVqjeyCEBIkoeoZ/828BRuVUmCoQZOEViHTi/JZVxKWLShYds3sYEsw+Y+Uu8lbvU
	h89tDPRRqq+QNf5hpTic0DeeSNNG5mrfRrEl6K9NnGwmAu8fMs5OXjVuox+6dnlqIUlhdssBXNP
	AhEf2d0+d5M4aBoHYpdH/wVB2AaIIYsXrWCK5Y6MMJEcdBsS+UoGh+ovSAtivRxZAvfHx1/0WHp
	1FkelLaKw+p+n8mv9Hfcfej2pJB39nmUfVoychvyIVlC7hA6VlOkNOsRN+Iqv6R7RF5GLv9LcAF
	gU47STR9HiqMqgundyZtFu/Dy/4ZH1q3B/QzQtmOdokkdRSj6+Q4=
X-Received: by 2002:a17:902:e54e:b0:2ca:6885:8a06 with SMTP id d9443c01a7336-2cfa6f977a4mr20250455ad.5.1784800586152;
        Thu, 23 Jul 2026 02:56:26 -0700 (PDT)
X-Received: by 2002:a17:902:e54e:b0:2ca:6885:8a06 with SMTP id d9443c01a7336-2cfa6f977a4mr20250065ad.5.1784800585671;
        Thu, 23 Jul 2026 02:56:25 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa2cd0sm30392755ad.4.2026.07.23.02.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:56:25 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: hamoa-iot-evk: Enable M.2 Key E
 connector
Date: Thu, 23 Jul 2026 15:26:18 +0530
Message-Id: <20260723-hamoa-m2-dts-v2-v2-0-82254ac101fb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAELlYWoC/x3MQQqAIBBA0avIrBuwqZS6SrQQm2oWaWhEEN09a
 fkW/z+QOQlnGNQDiS/JEkMBVQr85sLKKHMxkCajLTW4uT063AnnM+NFSNpYb1uqO9NDqY7Ei9z
 /cZze9wNFv96JYQAAAA==
X-Change-ID: 20260723-hamoa-m2-dts-v2-2067c7421569
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Q53iJY2a c=1 sm=1 tr=0 ts=6a61e54a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cm27Pg_UAAAA:8 a=GEBMHTYVcII8AEtmbGkA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfX0VR4wxGVTBh7
 V+twvcYj9qhjOhdXqCSKWOunY9iYU8FLNpH3tDS13T6zsacsUezxkWZiZSQsJiISAQzAtpCT/Tl
 cH1uNIXc+1rfeP4eGOh9He9+zQ9WZYQ=
X-Proofpoint-GUID: UVQVqeMwC0MW4ja9IN5Pa-ievUvWTFHK
X-Proofpoint-ORIG-GUID: UVQVqeMwC0MW4ja9IN5Pa-ievUvWTFHK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfX+WOQtkn7vT9P
 e1Dn4eei2R+zBISpB0Q5ZJb48vc7nEO904wACQPqgVCuEcakzJ10bG0ZqedASE5nwkkC5XY/zbl
 cQb4V/SaUUeHSWJ7xfY87djdjFhfezfznThLgpasaJDP7hjeN3NRMdp8/+Y5BBLoo/yAccm2DHZ
 9OnJxzggonRAUYcVZHgemy0A8yVnIgFB+u9HPFwN1Xpr1N2qHcUkhm/CUHBGvdXJDb3LPQ1Dno8
 TdDXsX73AnvlDYHi8zSAT6FObBogeOdeEtjHrq2thEMDRhKD6MbIvvpkGm4n3QbFeb+owFVAMCj
 /IO+ncCeiHUVFRpHjpMU0HTpvWLFfT2/c53CprqYI9lx30L3hjdYkl4pnwvnkoszc8l1BLYza1l
 8IqKCW4HB50si2tcmSjfVgKZ3dWVEfMIKUK9oBP39vEZ7dLkPLIm/dXUAjbO8BpczR6xmdEukzi
 ue8NKadQ+rCKsVkA7fA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230097

Describe the PCIe M.2 Key E connector on the Hamoa IoT EVK. This is
the DTS half of [1]. The pcie-m2 sub-ID patch is sent independently
as [PATCH v2]; the W_DISABLE2# else-branch patch is dropped in favor
of Chen-Yu Tsai's series [2].

Depends on: [2]

Changes in v2:
- Split PATCH 1/3 of [1] into two commits (Dmitry).
- Add usb_2 HS port@0 (new patch 1/3) to pair with M.2 USB port@1.
- In patch 3/3: rename pcie4port0_ep -> pcie4_port0_ep (Konrad); add
  port@2 for the USB BT variant; remove unused vreg_wcn_0p95 /
  vreg_wcn_1p9 (sashiko). Konrad's v1 Reviewed-by is not carried:
  the new port@2 endpoint and vreg cleanup were not part of the v1
  review scope.
- Drop PATCH 3/3 of [1]; use [2] instead (Mani).

Link: [1] https://lore.kernel.org/all/20260709-fix-hamoa-m2-w-disable2-v1-0-5e725091266a@oss.qualcomm.com/
Link: [2] https://lore.kernel.org/all/20260721065413.2306137-1-wenst@chromium.org/

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
Wei Deng (3):
      arm64: dts: qcom: hamoa: Number usb_2 HS port as port@0
      arm64: dts: qcom: hamoa: Add compatible to the PCIe Root Port
      arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe M.2 Key E connector

 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 183 ++++++++++++-----------------
 arch/arm64/boot/dts/qcom/hamoa.dtsi        |  13 +-
 2 files changed, 86 insertions(+), 110 deletions(-)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260723-hamoa-m2-dts-v2-2067c7421569

Best regards,
-- 
Wei Deng <wei.deng@oss.qualcomm.com>

