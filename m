Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3DD38D6A8
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 01:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695497; cv=none; b=f6WF7G51lni3zJC9wu3F+GKU2iRPKGynuCVd86NvNnV2icDsQgZqTVmxvCR0A/Hq0xD2zawyF8yOayqn4uMpiQDbYuU/NHzw+jbq6TXVcoFkFBj4/L0xAw0geiXeZoaR+pm8DFkk//Wr338bYyJ0FRX8d6JfSACblTZH7m/uGGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695497; c=relaxed/simple;
	bh=TPOMZ0Ibtw4HolQFNNFSkZ9GSiy09loNaQa6G1mBBco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UFov3HR72HMvpv58Mzvek49c/z2/BABN60RrJBNIvrJ2qTnf7FUCCEiF1BEVahmydRR/kr/Aa4bqVf7H87NRxetTU/PwBajvYSNs4Opf2cM59SwzXRcWFYyZANBSa1g6gKpRjgPgqPM4+kwhLcFCGd+Yz6bJhI2kY24g8KJb2Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AYm74jzi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RIbnrf4t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AYm74jzi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RIbnrf4t"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HLuQP62390179
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 01:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RJFv4jaDk9DSuiAZjb8SracgSSjeQqpG2+n
	DPX3Lu14=; b=AYm74jzi8Fdau3C3hyuKAiVmE5PALKfzjjHiIwGCLSZ7avd462N
	EhaxO6+72/PB2u7ry21VAwfZOjxMq0ak1HaTKoJmwzS3QuzdrfdH3Ib8a8rlKEOD
	ibYxOkaHMw+JpfkGd5zBTdjIM2AsXp+QLxOEMSe7QyoIh7TD4K2A1O9Aly3qql6I
	O8qWbqPGopb0G5WILOZ9jM3u+GGL/+2U7x1ygf1DBRfa8BUmC9KOYtN7/6vhvoOH
	WTf3AgkjTddGhuNKxAz/JIkDByEa6H7wX4yfgEUAR2qriFuAmpeRTdKDJCqReyMq
	1MCmZ0kZQENSNMAK7B+GddZY6yyNhXDSAUA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdrre9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 01:38:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39e25a5f6e8so533404a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 18:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789695494; x=1790300294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RJFv4jaDk9DSuiAZjb8SracgSSjeQqpG2+nDPX3Lu14=;
        b=RIbnrf4tXyOGjQCYhfZ+L2Ci+ZHcu8jfDR6gC5EXs2zpBMw4MUPX268ufqfKh2KpKR
         u4+/zmWNM/hAV9NluCFcx99B2T4Sus4st7H/L4/7+z95vq6fgQd95w8ZwUjnoqjGC22z
         lf4ZoQJi7fl/5xyCzeM4H1vZt8dRk9JCb/s9wauJy2/BKQJnJ3X7WGudonZa57c2dH2B
         PMi5+SfiUC9ewjNw++0VkHvkwjHV0gLpjg/XQ0sRz8jDcl1Hamf2FnQNQwntuCPPenUS
         R/4fEcQmdtaZNqvHgN3ER2VkmCis6k85OndnM1ud7BVe7eQOPiEuE7wbpIv8wzzzFBtB
         MxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789695494; x=1790300294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJFv4jaDk9DSuiAZjb8SracgSSjeQqpG2+nDPX3Lu14=;
        b=jx5Mx3K0cnAzFyiD0yD6Ao8ZRCV/+NBvLiRIM6WVLEEiVVNNk48nHW3Nazxb7bG13P
         k43zax6AwZoXClyN9PlUO+or6+4lau9GxPUom/p7MaYNt8JtB0Q8eD9EVVqfM4QrBOkj
         2vJSJhXQlbkAMQsCFDwYe+KJg6Q8yJ2vxfm9OG2hsoVsQ66/re+Ll1lFFSgZ16WchBmC
         8BMOTCfxzk127cCdi22rjtFRsPlC56MHb2Xi5igrFQ2avGh1AhkFLYRLaS9i9Hu6nxkg
         qWPXW9tGnbqrSV6mRSytVlLtQ6L6Xv1HbBEurhXpz+Oa63bae/rMOQweEkU+N5TqEBoU
         VtPw==
X-Forwarded-Encrypted: i=1; AKwUvBwclYewR5iVzVnU9lFyoS+Er8J2eLnJTP6cRamc3quejjs0JZvmhvAl+fmJpScVS2+SAVjT0WA7UBkM6cL6@vger.kernel.org
X-Gm-Message-State: AFuF++kuJA47Z+KYm2c2FMfFaiXeQ7r+uQvGf+RVCCDJ1fVhW/rrmTzc
	NZOHN+7Xt2wK7KLrc0SPaRWOr3TcNtPDuLs5CJkEwSiXUhjbFXOiKKQae6js0xzAp1sSsWitrEH
	tvNob59Cv88RjYMOcdb47edf2V3pXnqM60AmTFCZC63X6RiQtIeXWEU9NSkCnLjkCzLEc
X-Gm-Gg: AYBFou29lm05/dSrOnk6IGqQVPNEged0QpnSjKmfjDQFtzhxVfLiVEkpiLg5X1PdWrE
	Bi/EBNQWVjN7ny7EsiIMI+zKfnsHwmT+LFWolTbkDxBKajk0RUUTecHiorgjTUQJFMKFHcwfabC
	Ax26hvzjf3YFBcB59GLT8tCpVG+8fJ02i8hL5jQdEkCha3/vaknGst39DkNGCi2Dhfm8WF+eeGQ
	vbJrfkMA2kRa0EksfmcBw8t5d7+5VDF+g6bfI1q14Oo4RW+mRWg5tawfGm1IBPSwnWYnmY2S49D
	wGQ2VJ13z5MMUY39J1bWA3CA0AhmhpeuPInCqPv7AuwyZCP7d3IpNEVrYSXw9BNVtpy9V7Jhv/T
	zeFEF7XUwRuChbxF94ycOPLb1fiGmH80hF5tk5c/3O0pFxGDmjk5wa5STYr8d
X-Received: by 2002:a17:90b:3fcc:b0:39b:92bb:9eef with SMTP id 98e67ed59e1d1-39e54c9c4f0mr2277672a91.22.1789695494613;
        Thu, 17 Sep 2026 18:38:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcc:b0:39b:92bb:9eef with SMTP id 98e67ed59e1d1-39e54c9c4f0mr2277624a91.22.1789695494193;
        Thu, 17 Sep 2026 18:38:14 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce03c682sm821276c88.10.2026.09.17.18.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:38:13 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/4] arm64: dts: qcom: nord: Add display support
Date: Fri, 18 Sep 2026 09:37:36 +0800
Message-ID: <20260918013740.1355096-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDAxOCBTYWx0ZWRfX7mZupwn7eDJG
 ryHYjZdusrpcCzszSJo6Gihm7O+ldqW19RsYUtXDya6iAo7kkgzR7ydOsX3dG4Efw8zi5L8bVHT
 9AO5sC86/8eKffC2CuQKO1OQk27vJz7/pj30MLAKy0IMJTO/i6qLpK+9RI2tBi1VCUtd5y6CkrJ
 AfrQEP7xFETnUIjLCoeZv3NICeodbGpZ3zvPub692+nj55o5oAWRBvoYNOt85eJ83oblb2Fir4m
 6VGPkvkZEtj45IADCZXTM/6f1Jpu598LSCPR0mepftscAnSD2WSXeXHpLTvTC2ipilyg1tzeoP6
 RW5izzqDrU/L5thWhVyIMugZESK4Sr58ekotJxPFAGPgABcNuleVNMb7YjId9YQ5cs+KPMcv+c/
 we0wc0iR2MpcKtogcyuwLBpnwtfyuthDRmRKN5KeAcOH7hNIFF7jUdgDE3bfIMbSoB7qRommOiu
 yryqBdxzT5twYQvE5NA==
X-Proofpoint-ORIG-GUID: ZbEv3DJNKTOdjBkpDiP5H1ipDF63V_mF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDAxOCBTYWx0ZWRfX9EyD2x2BrtYt
 qhIHOCxh7B56vs3Efo/tagXXJETKwDlyriq48QaQjdrvgbfQ8kXPz7lEogu+B6ZhgPAnzbDIRIU
 mf9wvB2mCR6qezeSsnwc+X5XeJcT+T8=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aac9607 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GFXy-_TRr_QrNxvuQDgA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: ZbEv3DJNKTOdjBkpDiP5H1ipDF63V_mF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180018

Nord has two independent display subsystems, MDSS0 at 0xae00000 and
MDSS1 at 0x8c00000, each with a DPU, two DP controllers and two eDP
PHYs.  The SoC is DP-only, so there are no DSI blocks.

This series adds the display and remaining clock controller nodes for
the Nord SoC, and enables the eDP outputs on the Ride Embedded (eDP0-3)
and RRD (eDP0/1) boards.

Dependencies:
- Display and PHY: https://lore.kernel.org/all/20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com/
- Prerequisite DTS: https://lore.kernel.org/all/20260904081619.593602-1-shengchao.guo@oss.qualcomm.com/

Ritesh Kumar (3):
  arm64: dts: qcom: nord: Add display subsystem nodes
  arm64: dts: qcom: nord-ride-embedded: Enable eDP0-3 display output
  arm64: dts: qcom: nord-rrd: Enable eDP0/1 display output

Taniya Das (1):
  arm64: dts: qcom: nord: Add more clock controller nodes

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 615 ++++++++++++++++++
 .../boot/dts/qcom/nord-ride-embedded.dts      | 128 ++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  62 ++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 266 ++++++++
 4 files changed, 1071 insertions(+)

-- 
2.43.0

