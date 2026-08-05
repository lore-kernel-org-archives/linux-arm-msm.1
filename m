Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E2742BE82
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 11:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785929254; cv=none; b=LBg3B4irp/x8hxUfDg5FdOgCIdleRtLuR0e6u3yV6Df7bfLvwHqxwZJ65uVmaPV+wG5RkO1FN25dpuFHCzllbA20qcH4kJT1Bs7wVmdtcWoYTCaWU2Ea0U5reLXBpWrgxCiwPwHkTeXquWPakO2PQ5/kVzOhhHa9l1dJcRh+SUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785929254; c=relaxed/simple;
	bh=T+99mWPksof2VSF3gzUyZ6wZ7TeXqjB/x+jzl1QEcYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=S7thtyhkNJMfcNA1q2HPrApyM6PnEb3sCh+e6CB9Np0lISW2yN7mLxP+4gRR6ju07Gaum2sgqWHb+VIzTGC1bqWRCPBuWA1xQjElglP8n6zQXFDAWSoBYQDRvnibAPHomSEXhvnICI/BtdNxGyjMEToTP89z2IBUYfHxdD31CJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YuBszU+Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DyefGaAy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YuBszU+Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DyefGaAy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758diWv1713383
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Aug 2026 11:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UF1gKpY5yyAe5I/iG7Uzh3
	Si/u9kz5pXI2mpXVTlwrI=; b=YuBszU+Q2GGkLleuuVYsLWqt7uiRs0nh1indmW
	6HN6WUKF0+d4vHJiaSHKUJzz430kAfHQprsztRrqbGZlOIKjNRmBQbp/0C3wUa9x
	bSPQWzL7WrodC8G00U6MOTr5vgPLmX6jYJzB2Wjb6QfCGq6y88qSRieIQwMyQv0F
	R40PRo+oeSMcMO3AtCLORMudrXa+z+5ITRQ9OHJ6ds8DUC24kWOS574Hrws5eO9P
	l8tNPSBVLTisQz8flLyVyW7h5Ti9uuJsJmfoTfMz4XZ+YgzCg+CN2A4+J6oUHGmM
	2lddPzSbDPbPfzxi8/9nluflKVvG8yJY1VTO72Fi0WMtseYQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuwbqsv94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 11:27:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8485b7e18b4so1527303b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 04:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785929252; x=1786534052; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UF1gKpY5yyAe5I/iG7Uzh3Si/u9kz5pXI2mpXVTlwrI=;
        b=DyefGaAyVAKDM4So7AXCSiX+mJPfDdCAB+pEh7X86ykKKmL+fwzFWBZAd0NchfjfaY
         R/0eZUMdmce0fKcASXeV4M2e59nC2QGwmGtrJE+7mRtOYl5GQUnsVl0BopIk/l3+Qn+N
         1miJ63rijWfuuLYdI/0dhoFlh5+DHAW/S6qUZOABC5RKZb2r7zVV+LBsas9I+sF0YX91
         iSnWE4L4ayecv/GVESvnoByX+Zvknarf4T2d2ZdqPmYf+lJ7L+8hznLPuOXK0ECkXwf0
         Gpr4YBszKx2gzSJw/0/xpK7boTWpkB6+7uj1MyEc8obdC+QbFECCrWTCV3KoK7ZcQLI3
         AQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785929252; x=1786534052;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UF1gKpY5yyAe5I/iG7Uzh3Si/u9kz5pXI2mpXVTlwrI=;
        b=S+aeAGNffXA9bVfeGBTuCr1kpC8sb1d0SaqRDXUr5OOb53h0Wh9q+wwD26fgrT5lUP
         GeLvdNjzyG3GQ7t8a49KXH02ZwKODK5PolwoE+irhLhqyRPBJVMfA8jl1dppQEbjZW/j
         FJLjWhWalaX0W4wXCOr7zLCR0Wf6m/76zaZDoXuQk9+jgomsN3rEnqyMcoQ67MoudHbh
         /xzwbcWC6zjOzdpZrteTAyx/TKm/QCd44oy+Vt6Fwopm0Atx6xe90+ps80epPlVFuh1u
         Hh86hZySXSsOSPSdknJWfKfg1gtHyaO0Lz0ENzmKW0Qw1S8mbu+F7x2l6+pDmd7QPDUZ
         zdfg==
X-Gm-Message-State: AOJu0YwdlXT2vLfNEzgEG7ZDfaUD2tQ0oib5GJKCtQS9J+fa51CZJs/U
	yuydKWHaD4Ff2NqLNs6cD1XsdGiGoc3n/aTtPP83qCKcxtPxmGAoGsMWhd72olFjW6rIxwvc0bW
	yxyv127CQcr7MUzvpGP/hG3lYcBqVGE+qP850qr9cB2i5wtEnM37XV4zXv5+3WimVoXsC
X-Gm-Gg: AR+sD11eEGk6LulK4OBjqSLE/vmvVCv7LHdPLa4mhlgDur+6AnFCesYtmb3XK6f1/i9
	Wd+ERjrAFTPIF9LBqHmIyVwljRukun4CsF0uhrkLllDUu43r6WMHPMSIbtGJWTFxKT+LPlqoP3d
	YPGLbdlZgO+9s3wnbfMV1iulRGJYRmPkyAf3I7iELI5Cwwk4us2rGFbKw+EP8jCn7GpzXfxg0+9
	WqnyGPg/uS5z4UN+MNu0L5cXViKhXrZU4GIFYOqYcLCbyB7s6a9WcOOLJMQ0S3dWQQkf0SPsVsW
	le2Dx5uWLe8WbSpTaK477IftQ8N8x0F+4YprNv3Q8x/loK4QXUE7u9+Gz1b6nP5wNnKnPXVW9+o
	Wyp7wvxTqf1m7vtByw/lfMuJdeHc2uxCAPIOo
X-Received: by 2002:a05:6a00:a226:b0:848:2a55:7110 with SMTP id d2e1a72fcca58-84f2e13b00emr6267225b3a.36.1785929252137;
        Wed, 05 Aug 2026 04:27:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:a226:b0:848:2a55:7110 with SMTP id d2e1a72fcca58-84f2e13b00emr6267185b3a.36.1785929251659;
        Wed, 05 Aug 2026 04:27:31 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f2e2c5eeasm710197b3a.7.2026.08.05.04.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 04:27:30 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 16:57:23 +0530
Subject: [PATCH] arm64: dts: qcom: talos-evk-som: Add firmware-name to
 QUPv3 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-talos-evk-qupv3-firmware-name-v1-1-3ebd5e5578bd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABoec2oC/yXMwQ6CMAwA0F8hPdtkDDTqrxgPZXRalQErTBLCv
 zv1+C5vBeUorHAuVoicRKUPGeWuAHencGOUNhussQdzNHuc6NUrcnriOA+pQi+xe1NkDNQx2qr
 2htypaV0J+Rgie1l+/+X6t87Ng930TWHbPj8RpJ+BAAAA
X-Change-ID: 20260805-talos-evk-qupv3-firmware-name-234f0ac9bdc1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785929248; l=1389;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=T+99mWPksof2VSF3gzUyZ6wZ7TeXqjB/x+jzl1QEcYA=;
 b=g6xav5QRNJzsJZJciMYZOeFDNm+ALlbwVW0fHyiVv26tR5lN934qZUmHm02RUjA9dtj5JmthP
 qVs1I4q5LmcDTj7ImQZcc3ejvZmIutK4I+EDf2t231koxBteazAo6tv
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-ORIG-GUID: dWY4uMOiMff3ZKNnz2DdkwuqwrHAGVIe
X-Authority-Analysis: v=2.4 cv=B+uJFutM c=1 sm=1 tr=0 ts=6a731e24 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=8rlZebuS5uYMG-XfLoEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: dWY4uMOiMff3ZKNnz2DdkwuqwrHAGVIe
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA5MSBTYWx0ZWRfX809E6a/cmK09
 yz5jFT26y9fO6CVAgvs45o6rlxqL3iST0uM7Y8My8xMgSU8t1hPiiw44acLA998ozjDWLswKQTG
 67eFGZSBpwDapBzLLkC4boGSwhpHDF8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA5MSBTYWx0ZWRfX0QfnLaCxabqk
 Vr0kTsGvLKNLLKhe9xCat7/qkLlJf3XwfofA/b+b349yfmini9Byw70oXQc2ZDhzzOBxlCmvBpl
 jOqytdkMNLNYdGOSJ1nnlnjCEv4BX091O2AfkOk5++zD4dknPMtcShayB/+/NE6c4byBrxrp9Ih
 0QfJ66vktWll/olo2UauL6v90xE0OUyq9MFpeGgAXAJioYjdgubSJd4UxHi3lCES3mmv2OgTLdh
 lBg4wmkGuCfEUbYXzcppyOVvf02lS2pYozrBfiWcBi8Ym1NqNKG5v1ezBrNa4nferBnxyZbFDpW
 5zKyy3HSGQkMkgKLDEpYKg6XFzMxiP3Ne4/sNd5GLebdDadli8SaU7sDBa0VoAPMO3uC4+ln7LA
 hzZg2sTGKVa6tIOP9kdwlnbun8J+cqAFLBga4lD47WtQLrplvrmJ1pvLA0dI9ZF+ehZJhSxQtHH
 85e8I6x1R3BxN7d/Agg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050091

Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
ensures secure SE assignment and access control, it limits flexibility for
developers who need to enable various protocols on different SEs.

Add the firmware-name property to QUPv3 nodes in the device tree to enable
firmware loading from the Linux environment. Handle SE assignments and
access control permissions directly within Linux, removing the dependency
on TrustZone.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index a057a7271480..8bed53a8bd76 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -411,10 +411,14 @@ usb2_en: usb2-en-state {
 };
 
 &qupv3_id_0 {
+	firmware-name = "qcom/qcs615/qupv3fw.elf";
+
 	status = "okay";
 };
 
 &qupv3_id_1 {
+	firmware-name = "qcom/qcs615/qupv3fw.elf";
+
 	status = "okay";
 };
 

---
base-commit: 9a4cdc958dd79fc6c3b20b51a10debec6ca09fec
change-id: 20260805-talos-evk-qupv3-firmware-name-234f0ac9bdc1

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

