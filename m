Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F564BA1C8
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 14:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791471110; cv=none; b=niPRnLeIzL5Xv8oij/wcgoJ7OuwCGX2xZ79Tn8lCisCBmo3N78BhwguuRUTGW8ar+NqV3ySNkEy7BiOxIktZAzM0eNObBd9BLEEc7Xg09SgUVOfDDVxzSZGxoE66cuqEDqXAHoP5+8vD6QcM0brFH1KqZRjYNo+H/v9mqe86XGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791471110; c=relaxed/simple;
	bh=oCWGAVD49YdBIgkOj4c6h9+SpdXeUDdq45Vs4HvnfGw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PGbr+5cBQp9Jp+TnVjSTAAaINKzBAU/8ugbzbE+y01Ezidr6XjSnOYHYdBLavwNwdj6XcZ5cFPg+RGzIfF7Iomdyza3kZPzuFtSWFyErIP6/6s+rj49MnRu3d2KTeRAsGdpYtdwClOe7iAR4vz2ApwRj7Mhgib5CFJMnVqF9jxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h1ozsFOn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T5juBghO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h1ozsFOn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T5juBghO"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EW5Gg3518152
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 14:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uOCjdhX9Z3DZ3any8+Tmzh
	t13WMlD5nhMOI0kLG50hs=; b=h1ozsFOn8KG2GdaYyrSzOaEO5Ly/yJUIZZhDy4
	zKvUOhuEMJ5SANOK8Z+BSmbkGZidS0yp9IJSOCWKFIp4F2s3RwbSlNg++WvS+GfU
	07wef1kO8mHp11Z2UAwVavNUTn8/P58UQ1mzuaKPwCbZCAbAVb/m8H09od/LNXGD
	+drELLB62jI5+A23y9kFsSBtHbCNt7yKV8ariI8l1N7RxV5MRdWt6CcpSzpJU33E
	1JmhNnT9SXwOa6xZOpY97lLCtJCQ1lNghW1zNQ5JAeawlL1++eN4z0tLW+HaBiVO
	y3KwC3ca95/f3RbBVJ5H9xccY6+FNHA3EydsZoYTKSmlIKcw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe83ar3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 14:51:38 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-893d2c627b4so44694627b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 07:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791471098; x=1792075898; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uOCjdhX9Z3DZ3any8+Tmzht13WMlD5nhMOI0kLG50hs=;
        b=T5juBghOWuSXE2n46f8ri9q6fkdyxvxvyYxxj4MvORIy+j+UIP9KVz0dmdpkPvDZQl
         ruHzUHQ9YmrNvYQwK/VViRhy2qA5ZqTZEnd5x5RfqEHA8gtaaTMcd/CvmcCCtPrBp8Wt
         z4V0D5lEJMEjkGcYTRzp9xIMJfxMA5J2As4jYxD4pMfvdCAYPJ3qBXjjREgflREw4OyX
         4Na9+MnC3ZyRcxCp8x1pNw8FjL7Or0C5CsEwzRLg1JT8b9A2szXfA3EPPZYq9KnGMu7P
         9U+rMMiI+yysQOVQvgJ3tpoAFrapUSptYwnrEyjwqhojoronRVo1EKnZ030pm59OwmTq
         VuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791471098; x=1792075898;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uOCjdhX9Z3DZ3any8+Tmzht13WMlD5nhMOI0kLG50hs=;
        b=XnuQgJSiK0w4VTRZinB48P9UT0Vic7hfjTZhF+Ay1m2Im0J3g4SoyX2kl5fWhIyRSm
         4gZP3lZRE5szdePLWQLhorEBlRSWn2umsKG4JKSJ+1aAarfdfXspblcZ666nLVGS6exg
         /KpLTQGyvIa7q0mqCrm9cKRwb/biOdPZnvDEn1kOkZw4z+cnAz08xsLcM1SpNq4J+wDB
         iSmT5DhosOcSaBL2VolJ07yG/sjmZqOyfPkf+/ld8YCnHTp7yMtRbQFkT20aQEQliv2U
         zqBlcaeY8Ojai9srd+MqWvnGb/ovI3/r4OgsZPf9hT3kU/TeSThLr25jZBScXt+7Y3dX
         TE5w==
X-Forwarded-Encrypted: i=1; AKwUvBwjy3NLcpAsAYEi81TrIG4MT4SCD0lngWlB9TSDUkHJ0GCSz9cgty7jpIwnEGLl2jzRQo2YqAPTZm7N++7b@vger.kernel.org
X-Gm-Message-State: AFq9FYJRGC96So13PH7BnJ9xCepS/FmDNftObBNiqCbSg4IQKenqhJFX
	OSsyhCfK9sbmjHFM6TmW1+9TxwU4HAUhKE4pQ1DBClw7+iNsn8fVkt7sPEFrFql70FInGHBfKTK
	PwzABG0xuFo7bbE3BtEfaw0uessGXLTSWVjdqmq4BkmrFsnSmLaT+mTkJ+gGOFj27XWxy
X-Gm-Gg: AYBFou1zl9upzq9FI7IYlgsbikjHepT96sef/LWOqCuTxnvdEuWHDEEWuadjqaQLc6Z
	Ypq1D+5iyxCvK1er+cAd3lKV77xjmIst3VPngQbUFgFPdWqqQqzb38Fbxy4eh2w5llKB57MvaIQ
	UQP8pHJUUcyrnOCsiObklQXp13WFsnaagfu8bBXXDlEYt3WTTzqk4dVQ/74VFoKxO01S1qUrH8Q
	SXrz8PwyB+rEJORzPLcBO55pB1+e1yANPEecXnsDTfZTsKvosoR+HhAT3giLWsTZVzXIFK0v/v0
	rG+/eMsjX2BYhxoyPsL5DymGXFnauq8WDDdO+f0JrSo++TTO2KPRUOklaaw1vz3pfpG+A8INeGO
	fEjyxn3MVQSYOZm1NkeM7r9mH9JEwJkqUfk2giRL5XlQ=
X-Received: by 2002:a05:690c:ec4:b0:8ac:dbb9:2204 with SMTP id 00721157ae682-8b05af0ab34mr37347907b3.16.1791471097908;
        Thu, 08 Oct 2026 07:51:37 -0700 (PDT)
X-Received: by 2002:a05:690c:ec4:b0:8ac:dbb9:2204 with SMTP id 00721157ae682-8b05af0ab34mr37347647b3.16.1791471097191;
        Thu, 08 Oct 2026 07:51:37 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b05ab62607sm20903407b3.22.2026.10.08.07.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:51:36 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Subject: [PATCH net-next 00/11] net: ethernet: qualcomm: ppe: Add support
 for IPQ5424 SoC
Date: Thu, 08 Oct 2026 07:51:32 -0700
Message-Id: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPStx2oC/yWMUQrCMBAFr1L228AmpCpeRaSY9FVXME2TVAqld
 2/Uz2GYWSkjCTJdmpUSPpJlDBX0oSH/vIcHlPSVybA5auazmvz47iROrTW2ixHqxI7RW+0GDap
 ZTBhk+S2vFFBUwFLo9jd5di/48j3Stu1VgFitfgAAAA==
X-Change-ID: 20261008-qcom_ipq5424_ppe-70b0ed41bf1e
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791471094; l=2932;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=oCWGAVD49YdBIgkOj4c6h9+SpdXeUDdq45Vs4HvnfGw=;
 b=rzGpmYgNsG0lr3bF/XfyuUnXFiLwu2o0NpR09B+3ybsKPsVE1hmg7ForYx8DW7Ul6msq9jYRN
 vmdUCagTd+BBgqThhD6J4te/kjpDG6YXDqsOHsiEHYKXu82Pw6bAIzQ
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfXwxWlz+Cj1DCn
 DZTh1rBoJuCyhsF9rPBksNQ8aNjRkYKL/4PqZ11yrtvWyLQDIIRU+9eHHtaIvfO0dLvlY/bMUX5
 tfjto3V4ecUScqHGIuMmsKvR+4uwqvITk8vzVgAa45tkTFrFE/sCChUwJBFyzsYethp/SgnuBpk
 S2gO7xaEFhTO+3DAn9fFPGVaMtx46SbqunL9iRHKrAdJT5nSM77Cy6pj8WbEtOMk+jZze8TET8j
 zFelqGigE/XROFXt9jfnvTFxY1LYrYfHEEPBEagP8qtdKF94NsB268xyyskfJLLkRtIAmj7Fode
 XQO2FdQys+EB/5IW+pvC5u3d6rAeu5HPhLy0283MJEvrPtph7iHIv523cZRBrQzAp3htHwT+X4C
 /kfzW0jgOpAhEa48ymplmqFKPpHka1JANDHKxfNxhtUCLRcUVp7y6sbM4r31vnSF+0Zm/a29+cC
 26ppeycRTBXTQ69T8bA==
X-Proofpoint-GUID: C_kwEF3iTz3NjMW-HyMKYxo5PrGW55K0
X-Proofpoint-ORIG-GUID: C_kwEF3iTz3NjMW-HyMKYxo5PrGW55K0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX4XL6IpYLhx7x
 Tl0maj0a2sMB/RArbgSYvJAzl8ZC/1GA+h5nQE27Swl0e9DCwyazwbSkoo4NPX7Wt8RSqpuC3/v
 oVPIAPLk8rssY28RbqFxDf5mMo74b+E=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac7adfa cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=GpcH6MytHv7TmvdleT8A:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080059

This series adds support in the PPE driver for the IPQ5424 SoC.

IPQ5424 integrates the same PPE switch core as IPQ9574, but with a few
differences:

1.) It has 3 Ethernet ports plus 1 EDMA FIFO, instead of IPQ9574's 6 ports,
    1 EDMA FIFO and 1 EIP FIFO.
2.) The PPE clock runs at 375 MHz instead of IPQ9574's 353 MHz.
3.) It requires a different, smaller set of interconnect paths.
4.) It uses different BM (buffer management), QM (queue management) and
    scheduler configurations.

The first two patches are fixes, independent of the IPQ5424 support:
 - Split the EDMA reset in the devicetree binding into the separate system
   and APB resets.
 - Fix the multicast queue configuration table index, which is out of range
   for every multicast queue on both IPQ9574 and IPQ5424.

The remaining patches add the IPQ5424 support:
 - Add IPQ5424 to the devicetree binding.
 - Document IPQ5424 as a supported SoC.
 - Add the IPQ5424 platform data for the clock rate, port count, register
   space and interconnect paths.
 - Add the IPQ5424 BM buffer configuration.
 - Add the IPQ5424 QM configuration.
 - Add the IPQ5424 scheduler resource configuration.
 - Add the IPQ5424 scheduler configuration.
 - Add the IPQ5424 service code configuration.
 - Add the IPQ5424 counters for debugfs.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
Luo Jie (11):
      dt-bindings: net: qcom,ipq9574-ppe: Split EDMA reset into sys and apb
      net: ethernet: qualcomm: ppe: Fix multicast queue config table index
      dt-bindings: net: qcom,ipq9574-ppe: Add IPQ5424 PPE support
      docs: networking: Document IPQ5424 as a supported SoC
      net: ethernet: qualcomm: ppe: Add platform support for IPQ5424
      net: ethernet: qualcomm: ppe: Add IPQ5424 BM buffer configuration
      net: ethernet: qualcomm: ppe: Add IPQ5424 QM configuration
      net: ethernet: qualcomm: ppe: Add IPQ5424 scheduler resource configuration
      net: ethernet: qualcomm: ppe: Add IPQ5424 scheduler configuration
      net: ethernet: qualcomm: ppe: Add IPQ5424 service code configuration
      net: ethernet: qualcomm: ppe: Add IPQ5424 counter debugfs support

 .../devicetree/bindings/net/qcom,ipq9574-ppe.yaml  | 103 ++++-
 .../device_drivers/ethernet/qualcomm/ppe/ppe.rst   |   8 +
 drivers/net/ethernet/qualcomm/ppe/ppe.c            | 137 +++++-
 drivers/net/ethernet/qualcomm/ppe/ppe.h            |  15 +
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c     | 467 +++++++++++++++++++--
 drivers/net/ethernet/qualcomm/ppe/ppe_config.h     |   4 +
 drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c    |  14 +-
 drivers/net/ethernet/qualcomm/ppe/ppe_regs.h       |  83 +++-
 8 files changed, 742 insertions(+), 89 deletions(-)
---
base-commit: 8df0638138d3e0344fd1fb36cf2d1ca1cf5028f0
change-id: 20261008-qcom_ipq5424_ppe-70b0ed41bf1e

Best regards,
--  
Luo Jie <jie.luo@oss.qualcomm.com>

