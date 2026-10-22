Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665810;
	b=ELO/oAXLiSEL/ymRbpmnvZYUiPUdhWQaIIC+Q8Z4fMN1gvTsCKnj8+aWS1F4Td3q/4a6
	 C+UcpxPHb6YrpsyYEMnnED0WrCmIHBgeBfXd6vLxydJyIVYKDrEwhzDFNiTKz8zG7eEVI
	 ZY0fLEmek7NIkY+4uVxUo+t+PHZROxwsqf4GaWUkmbHHOQNX8g44/f0R9kzKlcoJLWOj3
	 YLjxBMQ6vmXuSvxSLQvcsFmUEZjwQ0IrB46KNhpuNOYNXIMi46ZB+aWYjY6uGt1YEdJ6v
	 Ka3HtOInvswNILZcdBoh/mOIGworGj5hUVGoZglwC19Q2/FkXSceA6tPJ1b12IVZgsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665810;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2gbrInL419R6hHZSv2+xMg3r+A2bgFZW0N0Re/fN6sw=;
	b=3W+hysFhSWx3hl1C5MSKXU9U4U7a1bGxmPjyxVeI3OEjjLRd36L1e5Ht6FMsOgtSFamZ
	 8VRw3WL6X/45tuyl5+0tQSCZLX/ZMqoggx5aDbwi7qY4v3xA+mOChFaRzQ6qYkij/IO0A
	 i4JfyH/MqxJD/ibZtneRFbhq/NtsJ3IakHI852SjNMQrARIvolGaZAcPyYXW4c0LJGTJa
	 soiJ3Pff9AJExpIEn/OG6UEONrGqsnR9iI34G9YPX0EaljFjPFwu6KoLgJZS4mIVIrw7U
	 1soQulZEC0m7ZuViNnBIAIPxlUB/emQPVgcpb9lZ7eF/GdFswD4GjqqO5ftHB0iyZKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=daewYeES;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DUp7Wvwf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7449F606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7449F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=daewYeES;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DUp7Wvwf
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0MLv3995710
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2gbrInL419R6hHZSv2+xMg3r+A2bgFZW0N0
	Re/fN6sw=; b=daewYeESSfna48Z7aDymFvsZzyPleeuq/V+ZWtxso4EREZCT/zT
	1XstK8fzR9YaH3aaW0cFy+gXmDj/vnw+Ysojty49uGV+2VIX2NX7I7bjKde3+qvt
	p0Cr/0v80+bKA9gK1qw/F0TPKxMDLgvF5i8x4ZLl34wJW20hw0pUOOiyFou6zakE
	gBGoRVMOkGvoLREnlYvGiWXFnF1hNcVS/rq188YZqln93tRD/yfUVLUdeFC9vlF2
	3KMRA69gol89xu8CkdnYQzQgoWQqdZ8QPG1YUkm9kgk/zYOG9bLJmJMNn+lcj52M
	MrW5qlR6uRSHxcn2Pxf2TD3xKjyD+nNO3Kw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ca570-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:43:29 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd0b795aa8cso478614a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 03:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665808; x=1793270608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2gbrInL419R6hHZSv2+xMg3r+A2bgFZW0N0Re/fN6sw=;
        b=DUp7WvwfU/ao3Tjo0cY54Rmd8tSF0/mWX8XzRKiMIJyJXS4Hl0KJxP2e6S0BR3OIEG
         wIbxuakFmYuGvkOFWSc+fLfRAJVpuX0eUxEffMyjl5lmd1OAjOrP/keB61qk6aF/Oho8
         XYhUe9tnjhniOwy8QHr/bykffRHAcgfBmH3yP/iVWk1P2U+XebHrBqvIBIsjGNILF6NR
         P31rFZui0c3lWJ4rXr92Y0I4VlAqjHiub/ePBc52/GpQT1JkfaYUYeH4lchqT/7jmeXI
         rjmfsxBZGsTlORybWPMOcMMLiB3NjH7rGRbv8ldMj+Ka2cpqB2wxGSpCXu7BCDVty2vf
         1Srg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665808; x=1793270608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2gbrInL419R6hHZSv2+xMg3r+A2bgFZW0N0Re/fN6sw=;
        b=tgZYmiqB8ukX7s+gw4GNB7GTGhNMwboVWw/0IoXIYtjOf8TBp5xa+e3ksKr2AhPPpz
         n/RSxd+lAGrl6e/g1Bk1QUEZXBdzS5IrKCeCEjctv1MBS76jBCgmOtz1YIm6NQnHqOER
         RBVpUqy6r0/gBedYZycN6SG4Guy3hrDsnJxgvaP1q2fJXFVT9SZno8fAx4TNVDPe0izB
         PY5hyO/zUmjCFGNxLfaLoyljgP12Jmu12qbsJzKoDNzJgH3mzGPxHMEFWYTXnjJFF4hS
         tQMBUfnvTTDE0UDEzbg8Fexx9mGtpKha5GoEmLjRlitw8jmVPZZ7DcbYPLPjO44wM0Jk
         +KRw==
X-Forwarded-Encrypted: i=1; AKwUvBwMG2Oh/PP5Ik7rl9n2VAdtt5pLXvh64RrMxjGYT67QawlHN1lkZf6V/QlPJKgnhJpvPOZLxFdlLVe0Z56u@vger.kernel.org
X-Gm-Message-State: AFq9FYKWjy/zj9zWDNJoXmjxRsRpwxiFwVgBEmF0doo7Bskts+b6Zvl6
	u8JgpKX8ZgdhOYaw8kB0B54i4PSY+8BiHfZdt8oyAKPRmvzdsqh0GciRq+PMsedL6mNUfTgEh5U
	4D3j1mSNygFzv/HOHNc9SnKY3/epGSrhKx9pfdAE1fARKM7fXLkxcFSW/Fki8hFZh2lAvQ7yrGT
	nD
X-Gm-Gg: AYBFou19tBXejb1EwE5lmaxuWTrNtbig7ITgNzGtG9aHuhqXwPWtWTxNA/+kCY7lXMk
	FWxusXSKVwPjemXx9Rlt8h8lIZEjX6TKd8eoTip6yA1LNxAV2y0OocQBz6g2F9bStelFrKe67YW
	goqaH0wJRtAWihUpJikH5qI/Gw0ETHk2REksd4uGipzzBZfZef3qJPDHGiSp5Qe7Cc9HdkiOLa6
	R63pX0LBI1Ta4LraBUbNh3FahFTKj/xr8sDFEKZ9Y0S6BGNAjT6iquaPPfnQpO6mocq2zdsgop4
	EQXxoxxpaULfXPr31ooo3LDDncn9RGztp2F643z+7TGYxXDIKtzMHjEIYgpHBxEo7Y3+I92LoXj
	7Ioh/mlqj6aiBpzAelwCapX6x9pK3
X-Received: by 2002:a17:902:ce82:b0:2e5:debe:cb50 with SMTP id d9443c01a7336-2ea6263513dmr13737665ad.4.1792665808413;
        Thu, 22 Oct 2026 03:43:28 -0700 (PDT)
X-Received: by 2002:a17:902:ce82:b0:2e5:debe:cb50 with SMTP id d9443c01a7336-2ea6263513dmr13737625ad.4.1792665807987;
        Thu, 22 Oct 2026 03:43:27 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b43b53dsm22327565ad.39.2026.10.22.03.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:43:27 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v1 0/2] Add the PM suspend/resume callbacks for qcom-combo phys
Date: Thu, 22 Oct 2026 16:13:19 +0530
Message-Id: <20261022104321.306679-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfXykBF1Sm6ftbL
 RnyMgI4xNpG0BkxuWApgDW77hFqaUoNu+GvHRj2KgT+9HRMjPiVOaPKWu5DL1zn2rVhSNZPsyWz
 MZLNvOdeqVXX/RU+j5FT9GOpLkzVNag=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad9e8d1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=cP5vnYSvVPmSLNQO43UA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: EV99r2NthKGtfZixNhNuBXECcW0jdPku
X-Proofpoint-ORIG-GUID: EV99r2NthKGtfZixNhNuBXECcW0jdPku
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX1eE1Bqmv/WyC
 UwRgUGs5uYeSQ+lPkP8irqGispdJgQpYj/5C/FPj5pFNb7NORCfoJmwOeYjeQl4QJ9XfoUkhOAr
 coyJP69iCOutLZLiLtde8kSQHTwm+rA6OQ25JdnJ8CHjQO07OQp3FjsVpd6fXNKXxdQUItuFrzR
 F/ZMP7Org0qCh+OEwl/ngmG1FCY/pjDH4rrRETeX/ukg2wRBBLc3KpzcPYMU5m50cUyn8aghO/h
 6LI15lMplfUqcZXw6QVf4UxE8BWYuJSy97US2ksj28Yq0WdPop/KjM4WOCScUEK4ZAgZ4YJfVGf
 NmFcoqhGkHZpWvacnO1rZhozjnfGpesH+cNc2sqgvGL0SWQZrx0vXvxWEPgE+8A4vMe0PH74402
 e70BUd0/yOj/hBAN5PNl2aMikQYeGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220042

Currently the phy clocks are left ON during system suspend, this leading to
power leakages. Prevent this by disabling the phy clocks during PM suspend.

Prashanth K (2):
  phy: qcom: qmp-combo: Add PM suspend/resume callbacks
  phy: qcom: qmp-usb: Add PM suspend/resume callbacks

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 17 +++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c   | 17 +++++++++++++++++
 2 files changed, 34 insertions(+)

-- 
2.34.1

