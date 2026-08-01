Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C8C3B71BD
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 17:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785605500; cv=none; b=i22T5vAv3DiJolUQ6b7ldgljpJjUJ1CbEOLpg7sw8Oc7s1IlNouzTmrOcK7IhVkw5X/3Q4plC4j/U+MpscT5CoOUOBboAajoKdJqPQTw9XIK/c3BX138R2R7AxE10OMS1wmpwbGPszQix/5GJpsA6USAKLniccnnXWji5QLeN04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785605500; c=relaxed/simple;
	bh=8zIKtWkixYnWKaNS4ShLPwBlu4JArri3oVb+gFP15Eo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jNdtj+BGs3cFadraKPsccwWtCGv3Ff10FsGlJIjTWRBoCGGaobThjqE3Ru6l+kMhpph1zlLLmeDC9DViZvik6sCUnziKeSAFhdK9OlpyXwNhkRXlZWnXSP0MP8md3jSPV+GnMte7gr6BaxujqvXasgDpWSzsjm3P7Uye75/9clg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GwIfCWBR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dLuAPhXA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GwIfCWBR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dLuAPhXA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671Faejs2762607
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 17:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gMNQP3NsH6b5dYLI5Edekz
	3dzWCbr978ac4GaUxKlX4=; b=GwIfCWBRjT4b7efILdzqAX3FaHZHv5UVv6zeBJ
	mIbZttl3mwc52dj25pYC5nkkXwzTJQb8ySoC1/clovk1tzudau/Gtnedc8ypMjwB
	pqlwTx6ymJK4BbQzuwWhor4IX31MslYAqjX+TjXybhJpnffDNm2Gf1250oCyUm01
	KmIf/gw28CCNc+sAPcCn/vn+3FQ7BL3wr96qld+EtsI1b83O4SZqjzxZoK8xivWy
	JH1WlQo6p1A1OiPI1a2Z8r0gLZoluXSplPlClmt3ktkzOF0TNKIuDq670qg9IH4f
	8SFy1pHW9X7N2kYDBJPGfi9pWKZz+MCYoo1ihtOicuSB0qtg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9ygh693-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 17:31:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb7049fa552so1400441a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 10:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785605497; x=1786210297; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gMNQP3NsH6b5dYLI5Edekz3dzWCbr978ac4GaUxKlX4=;
        b=dLuAPhXA6TyRVF1qWHhwP46c1Q5+TPsTqIBqyGQt3y2v3vj8WLhcO/vJekAQZpki/f
         OKXk6sq75wdZD2w/eK7UoYtedFrMsus42kV7ZkqCxz1ryeqML6E2Z1Suo96TjX7lMIgs
         JBR0GNnjgRqPawmITXtdMPrVvnbCLiG5hzqg92zJ0EIGCGT1hwWD9/CD9ZVF9gZC9LlZ
         nKiZsBJHyIRapzmBH99zrjJcQTTrQdEZQHFZROR29lppMoiU/PkGriOgJ5N2BQXfy+Wa
         DBZ/WHFXIiEi9VIJCMbtmZpkdze3bR0uK6ymBgeIm+F6twICxFbX4CroKb/9biw5BweO
         D4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785605497; x=1786210297;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gMNQP3NsH6b5dYLI5Edekz3dzWCbr978ac4GaUxKlX4=;
        b=HUdL8OuoeCv4Tydh+cHkDkr0ZLp6xz9dMX+bHHRKwP1C5uV9LkT7eUN8NF44kJmgJl
         Or/ClQKG3rFpL3YJljNFF93NV1QlooiIneb/SkxGWbfh9EwbOym37vTtfERFjYr1nr+3
         nCFl+vFd2b5mj4O9EJ/GM8ykh7QnuJuWVA1LgR0XWKeY2eckSZ2MQNdo0OKrNX0ULWQC
         xsFL0kbkdqSyaNP+gRIAn33lLZ1uasaquI1KKn1djG5tPE5cC1ilSgbUX+/xEJBnwHXr
         O4R0fNz3+We6l/h9pBnCEYMagxBwXxN5cqCtdHu98pJoTeKQiqfR6vbPi2GS+Whd5qH5
         Vt0w==
X-Gm-Message-State: AOJu0Yx5m9gdIKfg+E7Ij2k2utz9U4QDjBWJ4MB7pNDLJbn8/ekSPHX6
	W0OtBiuxKFlAe651ZBBTdmpt4Wc86y0jObIEcHOhxzsqKp3NOFN031kRP8rmtR4Bba8kUZj/JOr
	gXf1Top+dB+H2b8Bpkj70E2JP5aaUwDkvtfs7WqHIpGC0fCWjce9dim4mtxOxjUZgox4w
X-Gm-Gg: AR+sD129ly9S9+q1BKkFEgcDA6zLvzIq7AYzqEgcMwp3Tt6CCTX/vi6MMfoSYyOrCUE
	Q1+AUewQt9CbXpMl9vj21WpZ5fRj902KqNWBJ4c0iSi/u0G73pj4jRx74eqVXHv/9DgPwFp9KOZ
	hBMzzQr5R+92rCV8Ae+kTZC/t7acUJHATcIUzL/TDn54XqONcc5fgm/zrtpv6ErR80QM+WPivM5
	iLwnAO6HJOENZUlZSWnxtv6d5O+CfN10QUXG5BPxNLWzw4S0MrEqeJlYVw5JYW6CXCNTdyli2o2
	P04ITqK6Q5ZubchY3GNFzZJ1cSJqbH7muAf3XzML6tL/G9osAM7g/oFqna2roVan+3iJifGsiKM
	/rbBy5i3SpTcFGGnVcTCr0E1A
X-Received: by 2002:a05:6a21:710b:b0:3c4:4297:d5a0 with SMTP id adf61e73a8af0-3c92a9c710cmr4181387637.40.1785605497562;
        Sat, 01 Aug 2026 10:31:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:710b:b0:3c4:4297:d5a0 with SMTP id adf61e73a8af0-3c92a9c710cmr4181357637.40.1785605497142;
        Sat, 01 Aug 2026 10:31:37 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e44bcsm21865553c88.12.2026.08.01.10.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 10:31:36 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: Mark the GPU CX GDSC as votable for Glymur
 and Kaanapali
Date: Sat, 01 Aug 2026 23:01:16 +0530
Message-Id: <20260801-kaanapali-gpu-voteable-v1-0-fe804d24d2e9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGQtbmoC/x3MSwqAMAwA0atI1gZa8X8VcZFq1KDU0qoI4t0tL
 t9i5oHAXjhAmzzg+ZIgu43QaQLDQnZmlDEaMpWVqlYaVyJLjjbB2Z147QeT2RjzouZqMqoaGg0
 xdp4nuf9x17/vBwQ8G1poAAAA
X-Change-ID: 20260801-kaanapali-gpu-voteable-458e7fb07c91
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE0MSBTYWx0ZWRfX6U9c0IXqJ9J8
 kw3/H7mQRmZMYhbYcwuG5jmJ+LeG/V588qnV0q1Vs++6BfaajhYa5MLyFUneARENRCoT096lKaA
 AP4G2l4dc2LQYEGTEhxcEqQx0vTaXnM=
X-Proofpoint-GUID: xZ3TdxsGbBbq3bX27ejPuszTA-B6lEV1
X-Authority-Analysis: v=2.4 cv=Gu5yPE1C c=1 sm=1 tr=0 ts=6a6e2d7a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=a-e0-BfYgLFPZv1eouEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: xZ3TdxsGbBbq3bX27ejPuszTA-B6lEV1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE0MSBTYWx0ZWRfX3QIg44wWunjA
 wEnZJDouRQwBSoYLu4Xr/KIj1Xp2ooW9vQang0WofbWfiMFs/qtdElqahtxGi/b1Wq36G5nDqDb
 Lu9W39kRNowShW/6KzcDALPUn91vBDeQtcz5v+qr/e29UaeXxjs40z9wFBi+2JysIDWPtMCoi26
 d2567UGhjafWTpThrOIGDmYw2TxusipS5t6MJv7yKqM7O7eb82G6nTJslrarI4crb5Q21OmGJj0
 cx8A9uw3uwJ9DxtUbq9xKSoepY+2xFhuRfsSDg/5OECbeMjCF9HaJ5Rhn+J1ayyqjGr2dcMcawT
 w6UT4HohktaszjPZya5262Ji8Ll1sLsLDzEQUYbdN6WjAt+ct2U4mtZXpABExYgzyOzOUsrlZ/I
 XCaYyu9qG8ItWOYfjXKoyVTz7Blksp1+e2V2o4kkapyeSDh9XDHzZ5mNGDQCARurM1zCcGYRWix
 11yf/BUcSgOBXhfXzBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010141

The GPU CX GDSC on both Glymur and Kaanapali is a votable power
domain, but it was configured with POLL_CFG_GDSCR instead of VOTABLE
when the respective GPUCC drivers were added. Fix both drivers to set
the VOTABLE flag so the GDSC driver correctly treats collapse requests
as always successful, matching other platforms with a votable GPU CX
GDSC (e.g. SM8750, Milos).

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      clk: qcom: gpucc-glymur: Mark the GPU CX GDSC as votable
      clk: qcom: gpucc-kaanapali: Mark the GPU CX GDSC as votable

 drivers/clk/qcom/gpucc-glymur.c    | 2 +-
 drivers/clk/qcom/gpucc-kaanapali.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260801-kaanapali-gpu-voteable-458e7fb07c91

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

