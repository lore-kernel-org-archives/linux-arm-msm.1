Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793245666;
	b=LQtRpwx/xtTkiH7ZuRg1hZh43uz6HDaYpILxTTADQrb9IIf2cTXIrxvZg+YWt8TmU1j4
	 sb2CePQFUDYA0nPZU8o3JbLhYSmEr2lBfR7Mxe2Qrc9LhgbTzBSPFL6/dZdBFvMgdFTw3
	 k1GMBOjAyWK/DIFDp1OtoSPdARxXOqN+NMUVCpHaGO8RbPBSUnVfm8MtZ0J24eS3JWHoa
	 jCgyUuHOWO9KqOfta4AQQeD52p5cACc8k3vvR6VYz2+LtwmUB1UaGVn3Yhw+GTF/NiUS1
	 NX9VWrtwNLFne2eYsQzCF+JAx+TVe6eNmoPpQvr//AtNgWn32LHrxa6TQG5EX6AHN0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793245666;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1siYBjdptV/BY+UrZxNYg1eEJ5/LLx6KQTq4MjFPHkk=;
	b=1DpOGZw2WqpQqpiP7OAG4dLt+r+vpY6b64GBOwDT1LGxrspU/BiSzAfqzP6wUtLgmccI
	 HTWH2/QlZ6x9v7r3PDIHKqszCK46ZBeA2MAUlUfdQaus5uSpq+5iAKQaiELmnyalI4D0A
	 WkUq6G0chMKHm12J+/R8vNSEr4V7/ln0wWy0Kc0VVNtTrui8QYLeDs9aBYveHH19FM0sW
	 4dLrrF3nubIQ+scItPuzTbh1czdqkf7F5w9w1pbvobR9VdWV9GIWSNM/TYESqqB/QDMVi
	 vAkXqo8Rl9fKZoLO/B8LtSPWglAZWzAikxZlbLvtXFeih41pJOFPRgMBh6xfPLdgehQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jdNx4JNn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OB42Zu8p;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A680B606A31F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 03:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A680B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jdNx4JNn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OB42Zu8p
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jcIm2842155
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 03:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1siYBjdptV/BY+UrZxNYg1eEJ5/LLx6KQTq
	4MjFPHkk=; b=jdNx4JNnSjRbwRBK2PtSdYaVz98ph1OqXq4WdMO6JP61fifhpTN
	poMHN3/5kTbXjjn7aGQ8CG6h8Kn0HAHRb7xahZqVXJU9zCT0aLpYt1lr9hkeym3D
	8Ib4sy3Z3ImyEvXOoAvePOucAwvVrqpEJtgEVl95p56Ph1EoPgcmyPnXd2W/LJWF
	57AGKw1uhpCXh1e7VK4rV2aJwp6rZF/JG1tr2ZjfiiIklHpXaY9hq/rmnI7vkO98
	qH/82WzD4rWzxdyVwqutgBMujiJLA626/f6xdIfVqthC/D1kwk3iQRbMprcSlFHS
	yLy6QCmFPFe92XCH8yaEjupMzfJ8oyiot9Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehkr69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 03:47:44 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a1e2485fdso3635022eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 20:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793245663; x=1793850463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1siYBjdptV/BY+UrZxNYg1eEJ5/LLx6KQTq4MjFPHkk=;
        b=OB42Zu8pr8Ror2PR8Z0q4CD3hi6STZ3euJIb1wdNqKBEXmv7SDgub5O+eRMGJpR46D
         yPGGjMJGccV1xgwws5jyumVPnzpfH+I07pIlXQveX8VF72pCe90OF7FPu/2/hAvAGGvM
         7vj+Hv1cBsNWIcs2/uClJsQaiQX5L/SDss1kwx8lgyPctbLEbpPdd7rwwrAygha0zIjT
         2svYB2WmKd14juzYoqCbND7u1RklNVQqsjuy4EdpjOsyU9J+gzeonuBJK6V0SuA1055R
         KJ/NLDOu/HExHBtjDtmHktOacxcE/WVVcZRdGvnmKI4/0WNG+Q7+fx4YdKr4r0uI7v45
         N4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793245663; x=1793850463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1siYBjdptV/BY+UrZxNYg1eEJ5/LLx6KQTq4MjFPHkk=;
        b=w8ShUy5iZcZm19U2E2UrsErTuCfuM0D02BGedosatE7Oi5LttQHBtcRh2/Z2OlbJib
         EUetfWVb6C2GfZH0PF3xMmDDimeuMBS6+E5/ai2z8a3itsqmEAenbk5YwvRpiNu/t6dV
         vWU192aP2AZWaYJwXOkniCJUgnHU32iaf4wbld7Ubhm2CQlnGjL+yxIcAc352K7uBMtJ
         WpJ7TBq7Tnc3WTpSwgke/CsXOhgxLuu0wXmTn59HUwb3dPJmSEL+urqYS+kdYw50J5kx
         tANREJ14sZxItFFoO7GbKihFi8XDOIcDoG22xLqEZgvhxlLEDMmnLVp3XSVDBDu0p4KP
         mfog==
X-Forwarded-Encrypted: i=1; AKwUvBy0QPxSHWWOBkNYpsaWcV6Lci+sGo8FQMx/c9QkMCcmVgZAFFlJ//w1Q7l9zL6CsOd0lAtU/GeA2jEOCO26@vger.kernel.org
X-Gm-Message-State: AFq9FYKHdM3SL5PNU+XkC0BDPbsBHS0x3Fc0QgeHDAozr0KCvp/wNt3J
	1IukDUfSt9524TDNUHAKGRzjLYYB3O/UCjX1fwAcHkh/zVXS0ckj6vc9IK7DYuq438TBVbriCzN
	tmFMgrIqs8bkBtJSsNcUkXCfgkIVog47JRBNuTrgRI+xNyhb1IqydEhyhtwQXrEx8auol
X-Gm-Gg: AYBFou3wZWpzmX/FDhSWm9h98HIuyDHCrN7utkRrYlSPLaQt8z4M5pk76agnegp/QjC
	sH0SmFhWlqFCir3JT1CIgqUMphy4FDZMBB9oqQz6TG9w9CMadaEIKHbLmn5K5Zcd22KOkASOF/z
	ieU95hFoT/lNobHmH8TpeiO48ziSmSu3oirTR5vM3SHGwvoWSdZyIPQBoWQ8X3sYR272MHlFvib
	I7rVGcm6hY9RFt6h11e5sckI+QdRIHfrOGDM59PQ3FoQQKFy2bMVvs4KJkm1XLGaF8O9kj35Mw3
	7zxXEfaK3PX6af4zpV2iIXdQeFzBfQy7wAo5gw+y+wv52tVC+aqnmUY0I56Ypog+pFpefzoPIh3
	nCsIXJwHwOCn2drGppQ0mavTyan1QV1f+OL/c6SLj8s6nDAztmJZBmkbv0Nfo/TbPbVac/PIZv7
	0+y94xda9Jok/sIFmQ7JfdLsgL+yceu2jy
X-Received: by 2002:a05:7300:2406:b0:35c:8b96:94d9 with SMTP id 5a478bee46e88-36a203bd31bmr5877574eec.19.1793245663388;
        Wed, 28 Oct 2026 20:47:43 -0700 (PDT)
X-Received: by 2002:a05:7300:2406:b0:35c:8b96:94d9 with SMTP id 5a478bee46e88-36a203bd31bmr5877540eec.19.1793245662793;
        Wed, 28 Oct 2026 20:47:42 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2393cc86sm11064286eec.19.2026.10.28.20.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:47:42 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v3 0/3] arm64: dts: qcom: nord: Add display support
Date: Thu, 29 Oct 2026 11:47:25 +0800
Message-ID: <20261029034728.633495-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxMyBTYWx0ZWRfX5gqKCZttVtZe
 PELwviQl7oEgmN5kDBx1NwbIv7Gpu9AhZAWAwmKTfzNI3yVg2T4R6W1ua2J5EOWmQ0tFNE5K+1I
 J1M5nfkqI7bUHwW8H4fWtWkuu2o9Y5hFacrjQSMo5bGvNLkBgVdqeoMbnWkg3TMkUuDb3OBXdgW
 XKLmc7c3u2KP9e4v7L7qpWIIiTFNBKYtdwLxsTh62VnnaUk1VmxuIAKnkBG7H+Q37461QOTzsF9
 QKejkDSUvC0FaBMMDm5X7WlHKK2P7nHP4yXrQrb30mgOxEitL6gTpK49HeLXwJbkLGibNQXigTq
 ZX2nPcRKxiksXLnCrTgTbEjXMeKp4JIejjkEe8zl/hBMmUABOQAkT/vIaFhdCVV9ssOKtT2k5xa
 c1ELhftDTH1gye0LOzIPDgmyjahZWkG43sm2IWYwntOItwfuGbZsWK73kBjHg2FQM9bwNVcWRD+
 1tkseOQ5XUiMwCxZGOQ==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae2c1e0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nVVmeSlITW91QR49vnMA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 5_blF8TkvXCVxgjPNFbxyhrHdkWI4Izf
X-Proofpoint-GUID: 5_blF8TkvXCVxgjPNFbxyhrHdkWI4Izf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxMyBTYWx0ZWRfX86Cu5fH8X/wL
 o3FAv1NfEM1EwHxhBs4CdC4LYpXqJNMpg+OfhTuSmDYDq2TLpVp1RstcBHfwTqdjHumkNHUusRX
 zIdOl1R0IDo9PhSSvrptWA4W9DRLAyY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290013

This series adds the display and remaining clock controller nodes for
the Nord SoC, and enables the eDP outputs on the Ride Embedded (eDP0-3)
and RRD (eDP0/1) boards.

Dependencies:
- [PATCH v2 00/13] Add Qualcomm Nord display and eDP PHY support
  https://lore.kernel.org/all/20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com/
- [PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support
  https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Tag the series with RFC due to dependencies
- Prefix DP PHY labels with mdssN_ (Konrad)
- Share a single MDP and a single DP OPP table across instances (Konrad)
- Drop odd blank lines in OPP table and redundant comments (Konrad)
- Link to v2: https://lore.kernel.org/all/20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Rename label mdss to mdss0
- Drop clock controller DTS change from the series
- Link to v1: https://lore.kernel.org/all/20260918013740.1355096-1-shengchao.guo@oss.qualcomm.com/

Ritesh Kumar (3):
  arm64: dts: qcom: nord: Add display subsystem nodes
  arm64: dts: qcom: nord-ride-embedded: Enable eDP0-3 display output
  arm64: dts: qcom: nord-rrd: Enable eDP0/1 display output

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 407 +++++++++++++++++-
 .../boot/dts/qcom/nord-ride-embedded.dts      | 124 ++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  62 +++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 264 ++++++++++++
 4 files changed, 849 insertions(+), 8 deletions(-)

-- 
2.43.0

