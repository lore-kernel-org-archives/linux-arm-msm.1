Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31434386C3E
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 05:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784181332; cv=none; b=s8YNmTF+djI6gKGNGXgg8gNuSo8FSs1KofwMBC+sTIZGUY7Gw+woSgBDv10ncDeeAR2jLEny7JCwxVgWons5z21jqpJMy4eeL4tn7RstZg88Nd/rlkKao3VeRolu+VCa6fzwCTT06vap8c8JN87LSEHIYUc08ah81RN5ppx2Kek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784181332; c=relaxed/simple;
	bh=1srLiVBCFDIaFpMyeXpWcduVKJcbcac5eYq579cw2jY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NjR2PMOidLpRfJhbNIzckttzWP1J5bRJ0cl1/UhfW9wscV7KNtm67D6rgPtkLRDbsGuLJOa26E4dBFKyvFEHC5WRBGUgUTmTl6lmUZXTfOOX75idh6wHhSYIkD5CxKTgNenjz2/l4/o5HJg/Jac8qXni+1AgciHgHw1gchl/WYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KDPjlb62; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y3liOSiV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KDPjlb62";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y3liOSiV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wZun1610336
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 05:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EJMauIEmAsnVad7EuVfQLyGdrCSj+4Tgp89NPGr6fPQ=; b=KDPjlb62sZLD3cvc
	/ZLFJKG56OazZlYKFHNfyUnLFQBCJsnlor4+vdB8ngcPt40BCIw9Rze+KX+KItgT
	DFiFQGTNCH7cmgXdGG8hfpbFAxmRTc4Nuv86rMHSQMmJyizRQ6kmQEvnRPMoLCpF
	0RYHKnLFxrgTF3Mb1FaK+KOCf8DR1vw5PwHvJk579cpdugS4PJCjitttiv8fZE77
	iib/ezBsLgfo+BaFQ9d1h8TPqfOTw2u8NvnL+tX+vMW4S0VRT4WTS3WulFlm7bq0
	rNgPcTVH0g5IDbvr/W3M94LBiTWuGGLw6CvZgXVCPP2243NXVXgaftO/R2ganoiq
	HEX1aA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feayfkdtf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 05:55:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so352590a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 22:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784181329; x=1784786129; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJMauIEmAsnVad7EuVfQLyGdrCSj+4Tgp89NPGr6fPQ=;
        b=Y3liOSiVWPYuyI40A88+m1WA50eL0/XAiSrR/1CJEx0fguzskPGY9i4EBhGbRFNm16
         AKrlYtcitw7zsIfPlrLGdnA2OmGwJNzdt3XfvAnOvrnNZz30F50jhek3kXVAGGXck8NH
         SHYN7ZY2LL7UayzYj+2o6ZjcuU2yjDNq8PveXlXXp7QPbZI/VpuWulZSIR+815EO8TxF
         0O469Ju09DPyHrvlDJg8RLiVlDJPWB+Xg2QrGyE7Dfody+JJQ03mAN2h3+cnhvp8E8pv
         /ivIJQbHTws5iaEPXTda35/8k99HG3sNhtNHDApm15KnyAS08XZcwlCD4asqIOgzm1I1
         ErFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784181329; x=1784786129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EJMauIEmAsnVad7EuVfQLyGdrCSj+4Tgp89NPGr6fPQ=;
        b=o4Piu7jpLKShJiGv/8F+AMPUhTsGfeswVnRqPNH7gc4TPtCfZv9L5/besoIM4S0IRA
         1ww/Vk5z740iAI2KvJQGPaDiUy4HjHAu09NRVU1vO9dYa18nVfTtojmMqnh6vDkYZX7N
         swUlLcykBkDiqjUUam1yH0nyn6QKH97uEjOh956BSIPORMX/AlbWXQADeWAM7HqvRnOh
         +2C5wNgdI5ieTqduUxKvws1pGU1NiwL5jf7n25tXZa3DPLjR+aRcuuhOJfHKX1/fslhJ
         ITIJLbQ7Usym99RnZr4pBWssBL/6lugtv6rAhWfgKvxAI1AyADAteFCF+MA1a/VEAGR6
         EUFw==
X-Gm-Message-State: AOJu0YwVJpU2GSoVg1DHpftYsAT59Mpp3k3WlB8biuAnKa8aKiujmd6g
	iqW32ykTTPx4mAjI75SS9kgk5FHdG6V4oBZUeq3FK4+hQaEymzFATnDEsRKZriUGhwQKR3wunmX
	NWJ1jQk51jS6WiRjwQ3f3ALNKQW38C/sBYpApTnXcYNDPtYzahCNeWXJVjygQlyDuYVWo
X-Gm-Gg: AfdE7cl9N2kk7eU62hdu5uWE85CMxGpiqO1nBtlJJntFGD2w+2VGFg82u6G2n/WdSBN
	KlbR9hqzLzNr+OsbTX5xzO9iX1B7VFtTZ2vKT1+6grorQIunZ73wZoQ6zDDl47p0gIcc6fYxE4q
	jrHAi3wHYIq87faZD8Xouo/FDLwp5Kmf0fWujWjhVHY3vgTyZWS1V0TaOIdm/xXhj4r95ofFXP5
	TF32DtXlZ0UujHAKDCfADeJe8yhWJ7qT6Bk14ZbWSqJCJQ4pNRnrdkeCVVF/TmQWNxy4Y7pTy33
	/KhiIZcs928ruHqiPhApo+8AO4JSGOOUJDvMlXA0x2R2l21E5FOFovtnhFUnyMQhvoyOq1ItIbs
	WPmI+hDQKsfHlZWhnMFNQaSI+37LVjkmEQNOnjrdVzDhrFdJ+TRlKlyALWKyX0l+4d4sCjsTwRr
	1ufg6Mxx8Txx8=
X-Received: by 2002:a17:90b:1d01:b0:380:8bb9:aba9 with SMTP id 98e67ed59e1d1-38e3d13426cmr1250180a91.3.1784181329035;
        Wed, 15 Jul 2026 22:55:29 -0700 (PDT)
X-Received: by 2002:a17:90b:1d01:b0:380:8bb9:aba9 with SMTP id 98e67ed59e1d1-38e3d13426cmr1250154a91.3.1784181328516;
        Wed, 15 Jul 2026 22:55:28 -0700 (PDT)
Received: from hu-mdalam-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6a4779sm9046846eec.17.2026.07.15.22.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 22:55:28 -0700 (PDT)
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 11:25:13 +0530
Subject: [PATCH 2/3] arm64: dts: qcom: ipq5424-rdp466: Enable quad SPI mode
 for SPI-NAND
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-quad_dts-v1-2-74d86792944a@oss.qualcomm.com>
References: <20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com>
In-Reply-To: <20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Md Sadre Alam <md.alam@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: t1ht1382-byW1v38bE5Nwh_F7eUcntf7
X-Authority-Analysis: v=2.4 cv=WoMb99fv c=1 sm=1 tr=0 ts=6a587252 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7mV663YIiae9hK7Uy8kA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA1OCBTYWx0ZWRfXwC7Eb4UG03KH
 IVbFl5/4rfZmxsxb06f89NXg12JZxQhXa9wmEfGdA3fjiOHxhL81CSLgNfAO8eQD7+PE2nY0Ww8
 U9eYdgrAdUSEa3iYQGy9eQStG9kOgF635MITkkIjUmydP445Pq+bCbK2wUcj8ABkmIcv1x1VIYQ
 HQjucaJChM3WhgI5Xz8NJLxLapEjBy8/PoG+BCJWpbUSu2458adE2o9hVnHzbQCnPSSAXjfDDBx
 hfbioqSjdPcqJ/W0xatgSVNL7OkELkZnKubTcT06GPpAVxxJmD7Ysc8lbCVuD1vnn8axlGzIkyN
 cy7VyD00lH3cjpQsJyDLzrDlLoIw4EhgHVqlsQiJubCP+PdJRZ1o/m9do45P6pOxTlJNJs4yiSp
 tc1USkN44QR9Me3Wmye5eG593+RHmszlyBl16H2GdWEv3wWnq3hNMkrmGA2HhdoKXFOrwstYjcD
 EZIgVNlDiApXkBoM3nA==
X-Proofpoint-ORIG-GUID: t1ht1382-byW1v38bE5Nwh_F7eUcntf7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA1OCBTYWx0ZWRfXypPjL9rnJQKG
 u3t++SL9WD8bTk471V42f4rM6YuYI8vYvucDXBJHpON6/O7obktfuEoleHK9vPIE9t+O3Uh6f+K
 UdpCbj1iUzl4sefujtvJAzqPySIglPI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160058

Enable quad SPI transfers for the SPI-NAND device by setting both spi-rx-
bus-width and spi-tx-bus-width to 4.

Without these properties, the device uses the default single-bit bus width.
Configure the board to use 4-bit read and write transfers so the controller
and flash can operate in quad SPI mode.

Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index be8657239c46..793afc3ee82e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -261,6 +261,8 @@ flash@0 {
 		nand-ecc-engine = <&qpic_nand>;
 		nand-ecc-strength = <4>;
 		nand-ecc-step-size = <512>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
 	};
 };
 

-- 
2.34.1

