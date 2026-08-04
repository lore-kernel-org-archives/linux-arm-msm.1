Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25A1366060
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 12:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846074; cv=none; b=HqiSQX/wXbN+Mzdccqhb63J0gIl10M8WThJF0fOR+qK9eV3g6r2lkdHXvZ6adLeVYSveSh4EDGShuJ9XikOhYKs3P5Olq4KBlaC9dy2uNPaUGVCEQFfKdpYxdLbr+ErWmUUh6inuIihb/U2uyOaEZXI8MvG0CD2GofKj4Dx789k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846074; c=relaxed/simple;
	bh=7M65xX2SPEAZPbTkfMIRQqvlRwJZ9lkojNzAD6XjxXw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F9pSRursGacNbjn2tygi0Djg1Q3j8cSgMY1maM8gD0Mbx23KpkCmoAGs0GFJfA2mGJj5D/x4+MarSpmpnezvJ+RQLHRET+SC05wDEboyQOzf6KE2vhiXzQmzYep+ID+o2f+hvY5TrtkxlM2/wpk4Jq8+layAEyStKIgqibMoiwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jAMXZDtO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IkRnkC8S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jAMXZDtO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IkRnkC8S"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CLhr3217734
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 12:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QW8b2paILWu+Ej0pRDMZ4QBKcqdnuTo0dY2
	YaB6hRZw=; b=jAMXZDtOWtbzFZPi25xMx0U8dZ1MoeN30qOdP+uTPR23IMQqKhR
	QR3P0sikLsk7mtMu1BvzshwKGg8VOnjq+CQYartZTPne2voG/MeO2mez0yKQ37K6
	/NUFbm8gVTwvmGFNOCbJVpxUgkbXkACndtTrvpqBfRWn3QWFqtvvlufoqa12UsoA
	/sYwUQgoNWE7CP/qseIf6cVCa+J30NsvJE9MQEt85zvO1/fr2kQoPs6okVY4Wp9C
	/TgrH5DSHlWVZ+6/AOTHFgunUEaDnN01cISPaAksvkD+hC0UoH9N6K3L2NeEEKK2
	MUs9XRy7jrhHG8oSrWCj7eXjdHl1RsGBVxg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty5sc4em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 12:21:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so7118446a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 05:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785846070; x=1786450870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QW8b2paILWu+Ej0pRDMZ4QBKcqdnuTo0dY2YaB6hRZw=;
        b=IkRnkC8S+KoWXnrtTxfBvHwJmAZcD/9h8eLi4CY6tEKJoxvfedfXDtd196jftlrLuq
         DWZzMV+eXuSzmkC87s8nzQyDT3S3AzCwoYvOiFq7L5FVT7hKHxTVDuMhzEtEop/oL5Em
         rPzbaAeSbhMfokX6Y9xd9siaLIrTo35KnyWPlBfQk8Dge0ytxRtD6+pJzAQsBFM8blg9
         ZrNnTs/R6R4WztvQQR62qIVMdInDZcnZJorQNs42Rh384Izk0w+0iRfXe1NOiU9BUSBb
         JPwh6ix2IDD1IYwPo/nieZTlM0n5IRYnDzO5BYZX4AcOoFMAaiS9WWUIv6ahgf16vsOo
         R3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846070; x=1786450870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QW8b2paILWu+Ej0pRDMZ4QBKcqdnuTo0dY2YaB6hRZw=;
        b=oIFoFRToj3uWUquo5DeecjfWjAU818G3l1Nzf4rRh4EDKn4xryHMR+xJibHqSEKB2h
         cWeAXNjakzoSN3D+Vbw3AMUD6wQNf8ZS3UfGbzRoNfVCXsuBGAzwhwi/UyVmBrYrw5+a
         f6OhI6Yr6iZ2oPwEsvvpwVYJEJ8XRNFwziIwYUUhl3vNrcaOfXs9tGtQr6nlvJo6Yn1O
         U2pdyXXLPtLb+VrI3Da5gRlhpW7+AySTwQaaF9R44y7cDGq/RO2lcXCT5G6hiT0EM+Wv
         AKfbNYHzwcX4YTxlJvHXz+tDtDKbwkeMatf1e++GcNjIRoGEFCfcVSfJtA8vIO0P+Wjd
         wgIA==
X-Gm-Message-State: AOJu0Yw66LtflIqiTxMq/S6nMSvkxW6xNeuA0IQv4n3m0y/sF8qSwymr
	1Fhv//fw58pReS5WFDovTcqsCdZH6xj0sDALmCQkipLsMaDAIf5CXXfFRKlrGGwUPF5ydlEz7dQ
	zg3LkWKrd51ZmTkBpv+LeHTodxHSTzPH13GSz1YLrTisxbjuiHeBCFzGRIskDAelbxaN6
X-Gm-Gg: AR+sD12V9TG/tw/m9H+/JOcHfLp6k9g2xcjy+sqXGExUUvVnJlTuIhR0sMvQSiKBWFo
	C7810dtUTYJ5yb0f4k1ui2qcvjblGVod5wFHVPFn0BlBMqSGooTbCTEkLg2FSBiY9ehvFHzD33T
	yZBvuPBxNR2Ib8z4aD5chmEM7Eh4mOtK/U5UCI2Z8VegeT+G7ygZjXZAyKZXQ9PpdUlEbXE7SVB
	+gcjRaXN5HY4GSXapOcGhU5dDW6beMltfNfxKulUmOCcPW4EJUDXekmBFc3ZMpn3BPdZ7hbgjUd
	Ixw2dIJsfjrgfB+kYGpB5BwhLQbV3F4aCCGZThgrBQOe3pLtqRFnI984UoYO4oNGlrLYwbqGuzQ
	HHzdlYIebrapfWbom98GrE8J31luYRiDOSag=
X-Received: by 2002:a17:90b:3985:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-38fbc4053d7mr12011111a91.7.1785846064695;
        Tue, 04 Aug 2026 05:21:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3985:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-38fbc4053d7mr12011071a91.7.1785846064182;
        Tue, 04 Aug 2026 05:21:04 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fedc650a0sm1237832a91.14.2026.08.04.05.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:21:03 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH V4 0/2] arm64: dts: qcom: Shikra SD Card support
Date: Tue,  4 Aug 2026 17:50:52 +0530
Message-Id: <20260804122054.3462145-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SPJykuvH c=1 sm=1 tr=0 ts=6a71d936 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1w3StAHzAm3vCDDRDnYA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: FItmF8NXvHKujfEs9tJjP6y5KihJGZfH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5OCBTYWx0ZWRfXyFEmGypKUupT
 mJImKDdcD3DeF6kpxPIaSDoPSHtva8A9bEhVRKVwzakjpj4RE/kKRnHv28eDeCpvggQVktnWFYm
 l0VS4xxNnIBp50xR28Nhh5YpfzPOz+koyaUXirsSVyJ+OLJUgHv2W3UYazC9dw05I8NCTOrPVy6
 M8LW8+GzpKBSoYp6mnxE/3hJL42jGUbK7af9Bt29dlvl6Vae6Iphl0YUe8ktYg7basL83XNF91S
 L/hL6OCvp52XY3PneqR19oPwZDgrq1SSgLfGbVMbM5dGe+P/MFYY5wE2lgw5uKtUeljIbpkqSXD
 ehdMEi8OBtAukfY+JNgePGrU3Cpc+vUlz+/0vnvrpGsyskIIOJBjhjDcGgWOi7PXHLHq9L9KEo7
 Wrer8FV+BQWHIZF6AW1Sb0kvwngkF9f/4M/8O3prB4WtN3mzPnVfRHIRVZv6xi+a5zlfgLcKy/x
 Ep+/kbxJgAztgScfzew==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5OCBTYWx0ZWRfX4dhr+fVI3Qu+
 pQpBizkamC0ifp2XLQBXLGOOvEIStptN2VXVAD/TNL+7N/FSIPq1GQOSa48RGYYk4ohrzv/E4f8
 jH5FrzoYoJbke4aTHqloDVBRteEhlgs=
X-Proofpoint-GUID: FItmF8NXvHKujfEs9tJjP6y5KihJGZfH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040098

This is v4 of the Shikra SD Card support series.

This series adds SD card support for the Shikra platform.

The first patch adds the SDHC2 controller node and the necessary pinctrl
configurations to the base Shikra SoC dtsi. The second patch enables 
this support on the Shikra EVK (CQS, CQM, and IQS variants) by defining
the regulator supplies and the card detection GPIO.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Changes in v4:
- Rebase on latest code base
- Collect Reviewed-by tags (Konrad)
- Drop the dependency link - since all base changes are merged

Changes in v3:
- Padded the address part of the reg property in the sdhc_2 node to
  8 hex digits with leading zeroes for consistency with other nodes
  in the file
- Moved the common sdhc_2 properties to shikra-evk DT file
- Link to v2: https://lore.kernel.org/all/20260630165700.1886608-1-monish.chunara@oss.qualcomm.com

Changes in v2:
- Rectify the alignment for clocks and interconnect properties for SD
  card
- Link to v1: https://lore.kernel.org/all/20260604122045.494712-1-monish.chunara@oss.qualcomm.com

Testing:
- Validated on Shikra EVK variants.  

Monish Chunara (2):
  arm64: dts: qcom: Add SD Card support for Shikra SoC
  arm64: dts: qcom: Enable SD card for Shikra EVK

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  9 ++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  9 ++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 11 +++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts |  9 ++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 97 +++++++++++++++++++++
 5 files changed, 135 insertions(+)

-- 
2.34.1

