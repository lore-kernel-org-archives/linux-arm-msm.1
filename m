Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527027;
	b=cZTLNEUVMHeZPhohv656uRdNcr/x6GICf/hEdlfTpPXZp6fXxmM7CfbKtsFzaGF8iJVG
	 eKElxnL3GoPUmZ7ojlwPaP+F7tT5Bs3aOyHZmHes5iqs34/B3uGTov5XjMPHlSPBkFi1n
	 FaR1BC3lWsy0sYmJK8giBQ2A2K/5otwJqM2FmQoVL7/kK+CNpVtdeH9eG7ziAEHWAPlNU
	 2KSLBiJLJkHG6cN7PTlZNIWObWumH3ifObWQktSj8wVU2j+dQG6W4H7B1AQCGT96ThaWu
	 H0YZ36W9BQ4yFtoMh6uE8n7FCuMHwtZMWTns8dLnL7C0v6pV78Sw0JzOnKyXNxlGjKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527027;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kwhDsvnO/o8qcFU8scAsqJnEmyOdONiJiRn/s9wT6pA=;
	b=cZy9dzsRme/z2WU4ICmNwK3ku6jAayj0T8sBzn2MhhWTuJQSXzSyTO68EE0vUTU9LHnp
	 ukaJei3wvkVLzeN6hsOnFmQvqGqk/eB6HM3NY1BpoNVh3GKoGrMOE3FR2aBXX0zGbapJP
	 gtlmeMWltqVnz/PzbcWIRh0lDjL91bHCBpRctq/URVKpmVGvFCKZy1KDAZGc4gfUuuers
	 v13IyxKLq9o32C1gHuaFGIQYLcO2o+u3eEZvKhzLkkt+nWMbwtgM5NDMidVSePU19B5Dk
	 AkS7v/v0fXaZkpbA/QCwHmQkpwSJTzNeqjxm7gk6rw/z6zG3EQ1BC0SpZ1Kp8/JLbJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RJnoOyXv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="d/pTIpfz";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6238E606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 13:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6238E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RJnoOyXv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d/pTIpfz
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuLnH3541827
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 13:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kwhDsvnO/o8qcFU8scAsqJ
	nEmyOdONiJiRn/s9wT6pA=; b=RJnoOyXvdvN3AmcUH2C3QzCBXAvrSdLfkYfbw3
	zluG3moIUTe92tkhtWQAQYqj3nxA41sevfTM8Y7n06cckyTGsA/StYeICrLmfLe3
	mPFfmDI7Eif/dNTS26sahHEU4IaEAHm9ybz05y3Ag27zazdQIWpcxuR9yr34Wj4f
	lgXhuQIO9EbxsJbpHOj1xSFWkl5mVm4JqQHoU/Sp8g3QzYWbnd0Kr+pEd1n09UEV
	w0ehyjqh0B9XqSKRUEVJuISMvZRIZQTX2P8la3PN88o9M0Bb6PBz9VsRcYZ7MRiI
	Cc4PGXj2pYjv2qOUPHjU+7aQkL80df1ui4ftxt8rWlmdr93A==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rh9vvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 13:30:26 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b0d1cf5ff4so3291097b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 05:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795527026; x=1796131826; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kwhDsvnO/o8qcFU8scAsqJnEmyOdONiJiRn/s9wT6pA=;
        b=d/pTIpfztYvEMw/no34pOw1I49282aMkG7lJ4MxnRTfkIMu3Fv37ZEto9i55NM6M4x
         rg9YU9CkXtP/cTYNxdOdq1XJOvkG3soNAlCkeHDvDunm09tNubmA8+CTonCfVWiPTPaC
         PCnt7UUDDedfper/Ge2lMA8Z/ZRAA4v9X+D5yje/YZfXpTMpiV6fwXCn1ZX85GcdEBIk
         wm88Q6q4JKlbNUO4p/SyYFCOk//1mX69vuYDNCnGhyhlgqpiQIWtOTmjZcrgvS/+3O/e
         HH4Rv6hvDkZDXMP5JJjWEB8k4fmvVkv5WhAZodWAl9ZbheLrFL0DOSmGg7WRqp+kJ2sB
         ueXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527026; x=1796131826;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kwhDsvnO/o8qcFU8scAsqJnEmyOdONiJiRn/s9wT6pA=;
        b=PvdVfeHctLkVQm6T4IJVWlVFYhw/LKkY2uPM5Gqe303R9XPau3YvF/78pMitc/T+mN
         YSjQVbnrbm0DAPcyJzX+r1+bzf6iWRD+0+s+MgxQfX5PcS5Lzln7nvrBKF99ZhQnLM3U
         3uJgwBEmej36HrDZ30D5++mAOpAWAyuEVnP7Y9SgQ23FMf+a/mESNyQBg8t7Ahr2mRl7
         vaV1UhxvFvw/D30bfVVf9DOLDHCT7VGYQZJoWrY8c2tXeF/OYjHvpyISVVFn/5edd1GB
         iGAZ9gmF60h4cBrLmcyqxndJeQ/kP18RGQ21v2FeCTNmytAlZE9+dJaCLnQQXOMKWbHH
         EA+Q==
X-Gm-Message-State: APuU4Z8OCCTr3g/iw/uyLrmRfJd+ErAL4ybvnWVB41sbSvfQ8CQiFqf4
	i8mXEU7KQdEqaz8nc6thuKQaCeT0+vSY/QFcpiFl6Z+SEiyG7dypNyRz3fEUKjhwRyNtFz3a1Bl
	Xm6ZbN/qCkZIQiBmMhV4dZGHXwMBE4HezelJySpKELMhCFzH2P4fjxzOjKwv85KP9P/QD
X-Gm-Gg: AZFdTZexFs5NRyuzXpYSQx41iScOi09QZcApo1mnVu2zTLbsNXHtUEravnNbfUDSRQO
	pRBwKKjb6xMkJH/JmnnurEAeHpkIupWCvl8qA11kM94dYTNc4maIz+zCUx9R9yCNmPtMfp8jTLq
	umDNNOEa+eXhD1QcIV/yWrcIRT4o2E85+SoMuM6Ra+V9xpzSrxdgmKUxGfla/Z+m0xDxAgIcire
	+/a4vSgg/2CUki3+xE/x6vFD7Nl3fXcGeRvydlmBfxCCMvTtMylWxUUuFIAfm0bNCsDyd7Dki+K
	SGNySwkftO5Ay6FMQhpQ4nKn2iIgSnWrihh62dYDAh965vv5Njy1hBN5akl67xbPuu4tCp73YfQ
	218QCA3xfPEjpkj1zJxSGUqy6te/Taqc1CnyjFo8BbZHnlaBoD8CCkIm5pzjqm5YkO83+/ijZ39
	a486pHRp0=
X-Received: by 2002:a05:690c:4006:b0:8b1:beba:bd5b with SMTP id 00721157ae682-8b5204d9c46mr90521447b3.2.1795527025323;
        Tue, 24 Nov 2026 05:30:25 -0800 (PST)
X-Received: by 2002:a05:690c:4006:b0:8b1:beba:bd5b with SMTP id 00721157ae682-8b5204d9c46mr90520817b3.2.1795527024381;
        Tue, 24 Nov 2026 05:30:24 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:a546:3db2:3be0:87d9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b1ed8b6a05sm11659080f8f.43.2026.11.24.05.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:30:23 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH 0/3] SC8280XP USB4 clock fixups
Date: Tue, 24 Nov 2026 14:30:15 +0100
Message-Id: <20261124-topic-8280_usb4_clks-v1-0-be083a711eb4@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAGeRBWsC/yXMywqDMBBA0V+RWRtIUl/0V0Qkj2mdtmjIaBHEf
 zfq8izu3YAxEjI8sw0i/olpGhNUnoEbzPhGQT4ZtNSVUroQ8xTIiUY3sl/YFr37fVlU5UPW1nh
 vjYGUhogvWq9t293mxX7QzecL9v0AxLgVk3gAAAA=
X-Change-ID: 20261124-topic-8280_usb4_clks-65307baddbaa
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795527022; l=882;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=fAEcrKvCtRTvsoA/LdfvhqS9SoTGc0oxmz4TVXpFLfQ=;
 b=sUVSEdiW6LW3cEX5GTNTsan8jIqLwtf0zAxRZWKSFh5Y01XN+RFklBSDnkrRLGyUT1SMOC9I8
 WauilzOzb2zAdNtRPW5Cmcg0b5mZZEEp7cXdmBw+6IF/UsLcZpa5C8e
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b059172 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pt43vheFiXy_iBxo0bYA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1MiBTYWx0ZWRfX7QU9NcgjVtdQ
 MLAIO/IkWyq6KgfQaF5+t5pfYc9Io0zxTga+L03R3jSDv8H8AegSdm0wSKZQlepjWbksQ9/Hwo+
 UQ3LG8kzSAvhDwlAueUIWyRNima9c6s=
X-Proofpoint-GUID: rotWAO4ZlRyevwVng2s5glCDtr11PsM4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1MiBTYWx0ZWRfX9x88oxr4tPtn
 16eCwiaipdXPwSQd9ZAJVU/nignm8pY0IPWVWiNKuwN9p7OndRW1QxrOCILwe+MpTHPBwYSss+w
 t7Fj6vpYMIhC+vSXFyGy+nMP9UEDlq+ZzmNiFTrPRVBz8Tu8jNGVGPZOVTFHF35N77oFTIO5Epk
 zOp+L+bITRTZN/nyqpEVeDhWnGwd5HHhv8PJHC5FuxSAf3b6csd4viE6OsGknK0IgzXkV3dxMLF
 WYT9N7F2aHfv2v7a9JmJBmZcDmTseFPsrppIc8q7LcTxp91RSodULW86eEiUUa6XF89OAXMGHq2
 W4rkSOKKJuic1A3z9kodiL97OQKf3xrRUgXB78nMuZ7e1PaoWQbQgAbLDrcZVZblByyS33cVxLF
 UToPHhXlJ+WWK+UiKU7QuMcd+M1wDFea7dTsF2W1OAKkfcsFxpkEigieiWnHfXg5X9ZQ5MU/TnB
 nnk9zle9hfcDo2fj/FQ==
X-Proofpoint-ORIG-GUID: rotWAO4ZlRyevwVng2s5glCDtr11PsM4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240052

This is an echo of the Glymur series [1] for SC8280XP, as it has the
same issues. Not validated on hw, but matches the docs.

https://lore.kernel.org/linux-arm-msm/20261123-topic-usb4_clks-v1-0-531ab5635c03@oss.qualcomm.com/

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (3):
      dt-bindings: clock: qcom,gcc-sc8280xp: Add USB4 MISC resets
      clk: qcom: gcc-sc8280xp: Describe USB4 MISC resets
      clk: qcom: gcc-sc8280xp: Keep USB4 uC memory powered

 drivers/clk/qcom/gcc-sc8280xp.c               | 27 +++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sc8280xp.h | 20 ++++++++++++++++++++
 2 files changed, 47 insertions(+)
---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261124-topic-8280_usb4_clks-65307baddbaa

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

