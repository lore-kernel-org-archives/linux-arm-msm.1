Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E81DF59
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 23:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082216; cv=none; b=pxamdkQLCXVy/wKrEZybW//Kx61+UKcSfOv73RJjhInVUG/TeBBpyPYZv/LP4eMv8ENPGzqNuqKSbQm6MKUwUU+BBfRFSw7dcvDKZXR6DMeLAj2KPqqwkO+k5idu/zQdWiDsLt+/sy3KfNFdchXut4Yr9xtpg1TGnX6rGS5r/Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082216; c=relaxed/simple;
	bh=Dr5Iuf4k9Fo9Xzhbyx3m5ImmN753LgrcpI5ZozfKH/0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=CMXEcebe27Mv7uEmVwR+ruXv38LQfiSaAwOiAf5seAnm46mCuVuRa97c8B+aMwl1Aom4OXcIc4/5Xk15Qvli/rKA4RVfo4pLUf75xOVqVnIzWpHUeZZNeJBdjUCKOCFj12Im3Nstl9g6tsf3swbgrO2bdJZO5+swp6G/CkvDT9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aGKEIBR5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cUlrOIlD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGKEIBR5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cUlrOIlD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALTT6g2995849
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 23:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=r5/hiIdFrPwvj9F46iRT7f
	RMfEtM0BwXeE3UhxkGKSE=; b=aGKEIBR52Tf4hgOPq1rPZdk9yfpnlrozXV9IsN
	nU+6+mLf5QCl23ozEOkiUBWURnSNXfDH95DD6d035K/QouoO+aYqVJO5+OqD8IZi
	p5LkRkxyb0ftvewOkN9O97fQr/XkcKQ/qleFZgE81+PRSAhx19NIxI7/zY2Jtioy
	2xQ6ldmDc51sutTVwdSuPFl9j+L9EHoudnqSDAsP8E/8BF8k1v92xtswGu7W7nee
	nq9ZnWcMLIHqRftjp9q+6yxQz2h0Iiac9LZh+L3MSnvERNU17fpXrDwcwFrQsaUK
	pC3rAz5lxWSpoZpbqmDwuVN6RzHOwuYWAokrqkmtKkiQS3WQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkxd8t4c3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 23:16:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so269020a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 16:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789082213; x=1789687013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r5/hiIdFrPwvj9F46iRT7fRMfEtM0BwXeE3UhxkGKSE=;
        b=cUlrOIlDPNMit+gmEn6itmM5AaGT39R22MHxvy8ISL4viFTHWIC8IKtOHIK26hpbWq
         VUNa44Xxbs+HLc6IPzEz3jy/kKjoca8VryJGD80bcRQYHk0DAdLRPyoFzHdTOli+s7vJ
         o7j5UjWlVdVdna6oVPR+px2P2W2zbonZpNtKWAQ3DSlmgGWkbfL+iMf5PDgeFU+3ny7t
         Ic7NNL2H+KkqEHiZJ03RfWMUBIghSWybvop7S0DErTwDa8ZKiVKPXwd8bUWemIjzxk0U
         uP/ytmCrSTl8cwF9Mzer/1vzN4Ye8NWvPwa+6iZXy4CodEjtLczDSIpLdynaPsdTTAEb
         D7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789082213; x=1789687013;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r5/hiIdFrPwvj9F46iRT7fRMfEtM0BwXeE3UhxkGKSE=;
        b=OjilN+qjPocDsOCto6J19ObYcprP6sVdDXE/QrVvJAs2sF3Yy3Scpr0NsL7MNDV130
         00kOwMZylZPM8i357gq7GUQZT54bV0JYVXeIQJ/7vDa4iLcKs+ucCqCYvbQHrVNFP4+J
         DkfOPt5Qgpy1VVigDPZPX3DajS3apmNzKL0g89vvfcKSGtPmeNzsIc0d7v6nsYnSafrT
         1McFxlSncBudZydvwQ/kcoKJJuv/LaqKhkxLYyFCjazf5e4+xmUqnTcVRr9Y1cxfgbug
         szetSj6lZ7ALNzF/yk+61TgHOh/EFvXJSm9bWyysX+hmh+p30r9DjacPswf/E48PdWOw
         HYhw==
X-Forwarded-Encrypted: i=1; AKwUvBxGWXCm+8dPuqKG01PE566xrwPrv5Y90WWlbs8DviYna2/mTxNp1+ag2MDdM1X+8DbrJPWQwpOyv5dwJoQz@vger.kernel.org
X-Gm-Message-State: AFuF++nEyW3Ic132K4a9S/pPFCopHj/2BWraFW9f6pTpcnQiiGL1+e86
	lVkRGka6P+8ifKFF7s7J9nenjiiqn4I13b8phG/zKgUjsCwfLcHzWsLTSJqkFZmHHQCF9i/SAql
	z53miNvBY8tmcWQV71+nrqN1OqMNh0MMPd7Ll20GXtbBPCr/iQ9nnmvXUUs/hw+qC5plA
X-Gm-Gg: AYBFou25YM9RkRX2K/9iiw+hqoAFWa1tVLCv5nROulOCsvhFpH5I83BWguFiPyMsD6n
	InFDviOmIqAPFMbljUhk011872IEApzcCOIjtxH/139EVv4aFGwwR9rAWWYM8Tb8/NhSVlf/021
	/Kn57T2bwSBYUJDKsdXrtowunnlyVgUhhTTvzF+HvTiUWhxcLm+rAOVFd0B7eapQbkxLHghip+o
	icAxinBpROTVJopZZSKox1NOj8l7DQb4E4mmxmDrvcHXCpHJIFfnA734WjSG2D5XmeqLwhSYG94
	cfwgEpjiLiF/IdxNFhp0Y8L37n7FtomOJhgmiWAfjMdLtnr8lmqXbn84r0Cyere6UprfNH/UwPS
	sfccPh2M5zyKIOjO2VOzKqCUJhT2YeUxeKLdX
X-Received: by 2002:a05:6300:670d:b0:3da:5b4d:a89f with SMTP id adf61e73a8af0-3daed64d8e7mr2613953637.27.1789082212546;
        Thu, 10 Sep 2026 16:16:52 -0700 (PDT)
X-Received: by 2002:a05:6300:670d:b0:3da:5b4d:a89f with SMTP id adf61e73a8af0-3daed64d8e7mr2613890637.27.1789082212126;
        Thu, 10 Sep 2026 16:16:52 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f7390csm1204374eec.26.2026.09.10.16.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:16:51 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/9] arm64: dts: qcom: shikra: Enable audio on EVK boards
Date: Fri, 11 Sep 2026 04:46:33 +0530
Message-Id: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jobzEYFhj8osnfx80wfE7X9TUjG5zaT7
X-Proofpoint-GUID: jobzEYFhj8osnfx80wfE7X9TUjG5zaT7
X-Authority-Analysis: v=2.4 cv=PchqFShd c=1 sm=1 tr=0 ts=6aa33a65 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=XxL5jg9vB5HpZleAeu8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX03eYi+IOjCVo
 tml0WTJLcxd6HtlRwSq871mos+bN7hVGU4TzNOJAwFmoJuUBxn+0TFliAaXMqxLT2jxIX7zmvQ/
 kHlFB8IwWKl9zHH9zJ8KRj8AY/3SDkR7hDWdaLY96AlCfKTanUvb1hpjA75ZY924GObFcp0X8U8
 HkAHE8IorSHSoFLdpbDUaSzjPhybDFzwx501OGOKwLf+md+JMEVpGv/fUQ7bvO/lWe8ZNHg3Yja
 3sWL1k9eOfVezS9wzZ6MrhluemDE/c23ddnOtgXabn5GyRLf3+8mqqrLMsc41UL0GWh6BoyLPuQ
 AfiCpdI20PmZR1BU99qZg3LuDwRIMqWaJIPsGFkrLwMXwwDPFyx7Hbl1YGTy+Dk+4qHbXidHBi0
 TBvYzElrX02Ocrrzr3GNU138/j5imsvPuR8JGJ61Wg+J3Osgab3vCK1FMExtVTY5kHdsD6K1t3k
 gzE7hyYgChM3yMYbXtQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX3fCPX4BDB9S9
 c8yqG1BclGZiKT+acEkNhspZJ/Aus+OU9lPFOMCRAgfEZZY1w9wMIo5NMBZdcV3vJPlI/K0lSAR
 LNL0Wb91Mf2Slp0E+c5qZV4iK/rWq6s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100293

This series enables the Shikra audio path on EVK targets by adding the QAIF
CPU endpoint, GPR/APM/PRM services, SoundWire and LPASS macro nodes, and
board-level sound card wiring for CQM, CQS and IQS variants.

---
Changes in v2:
 - Fixed Konrad’s review comments, addressed nitpicks, and alignment issues.
 - Added PM4125 headphone support for the CQS EVK board.
 - Documented TX/RX macro clock constraints.
 - Included MDSP carveout memory and updated APM DAI memory regions.
   (https://lore.kernel.org/all/20260618113509.2025881-3-ajay.nandam@oss.qualcomm.com/).
 - Link to V1: https://patch.msgid.link/20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com
---
Mohammad Rafi Shaik (9):
  ASoC: dt-bindings: qcom,apr: Add modem_apps GLINK channel for shikra
  dt-bindings: sound: qcom,lpass-va-macro: Add clock constraints for
    shikra
  arm64: dts: qcom: shikra: Add QAIF CPU node for audio
  arm64: dts: qcom: shikra: Add gpr node
  arm64: dts: qcom: shikra: Add soundwire and macro nodes
  arm64: dts: qcom: shikra-cqm-evk: Enable sound card support
  arm64: dts: qcom: shikra-cqs-evk: Enable sound card support
  arm64: dts: qcom: shikra-iqs-evk: Enable sound card support
  arm64: defconfig: Enable Qualcomm PM4125 and WSA885X drivers

 .../bindings/soc/qcom/qcom,apr.yaml           |   4 +-
 .../bindings/sound/qcom,lpass-rx-macro.yaml   |   1 +
 .../bindings/sound/qcom,lpass-va-macro.yaml   |  15 +
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts   | 185 +++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi  |   5 +
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts   | 220 +++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts   | 144 ++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi          | 256 +++++++++++++++++-
 arch/arm64/configs/defconfig                  |   2 +
 9 files changed, 830 insertions(+), 2 deletions(-)


base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
prerequisite-patch-id: a056f645f45682f1008b321f5e639505f22bb979
prerequisite-patch-id: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
prerequisite-patch-id: 32a1efe2e364ee15c466f496b1ff3128e5326c66
prerequisite-patch-id: 1ddc51582586120795d86a2ff9f0aef20c0e891e
prerequisite-patch-id: 1e68cced9250cf9fdfbb8cdc27ee8ec47ada4a87
prerequisite-patch-id: 99245529321cadedd30d9e38845b53dba3725de8
-- 
2.34.1

