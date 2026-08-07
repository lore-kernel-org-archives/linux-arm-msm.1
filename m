Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5349338D3F2
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 16:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786120547; cv=none; b=n/EM5nluisGbK5bpNo801i8CQvac4rz4RgQCIVe77FjdhncTDIap0DEFLOyMVzXePbAK+3CpIlEzNCUk1Tmtrk3zOMhKO80BvOg9fEwsID+SwyNBSkFVkHrmk8Z+SE+vLyv3aLmYLOvjnoVwmqO65HQRa0Hej5YX1oLF9hvb8/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786120547; c=relaxed/simple;
	bh=MJ944Dtr3G19D2XynmpIhnAfwYIoBM9PiM0Uhgg8izM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TcD5g4nv7xLcH+yC1WK+Bj/j7dBANA5XYqnGymmAyMIwN0SCYiTF5xWiVdV3l/XBQiHvpnYsNbbveH+xnECq5tummJTYrPxhANjH30SWjP5r5UkHIskGPoQrF9E4zcYtzNVrMZ9eAfgnH76p5qptXvmprMKdmWOTObn4/pTq0z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dwzt/Sh0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FdJ3oSkC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dwzt/Sh0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FdJ3oSkC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677GO8BO1545136
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 16:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jYt+ntlGlsC9bib6n+X+G/
	QEoQvnYS0LNaVj45QyDEM=; b=Dwzt/Sh0eehI0RXM+ndq3IVg/gzoUdIkiVRxbM
	Y3/F3Bhgm9BQbhlt4DihiYzWmESx8nGJnbDmaFMSosGT6iKHViitxc1KIwOBKw+f
	a6U8fOyaUKfZFlKHJqCuWtKJghjjL0O/pzlGHDc9yjJn2dVYmYQswEqVOv1LhJnV
	n+evjcUruZTfd08fkWiwpPgTb4bHSSze91T6IDf9uyUt6/IoRW2H7bLV/++UAjBI
	Bd6RJPU5EQdSnzKy14e2hZESd8iMQSfstshg2aUR9EbHKUc3JhTa3Kg/C67FXR/y
	OO051j9++CFQ5D4bG9zsoIJPEhVfoK/4VGilaePlfqhrrFCg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwege19e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 16:35:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5ea36f969so3645857a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 09:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786120545; x=1786725345; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jYt+ntlGlsC9bib6n+X+G/QEoQvnYS0LNaVj45QyDEM=;
        b=FdJ3oSkCnh2lwfC5zBrGf96AxejbZn1xggRwAZDbb4h4suPT6F565j70t7HQ3f8lQH
         NEtcXjCI897PUqAyjjC+X7MFHMaCOgQ/ISSwbn1UZqvvxher/cB5Np0rqu4L5S884Vnr
         bxJP5bpEtrhBfaPU5fGua7zg5Mhfde2nLo8dcxYJdogALAOl3qUy//WOBCGCgfMaiUru
         YKbx6JoAiLGX7kfI7VWrIKZ3qPgoCDPY3m3RWM1QfU1ortSvDkZC7bPG0Z6RVntRLLR1
         4ab/oazffMMVtOvY6OcUglb74sojlqzZAlSF9BGEBCqFgMuYhdQc8N5wzRdDAJYgcYTY
         NUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786120545; x=1786725345;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jYt+ntlGlsC9bib6n+X+G/QEoQvnYS0LNaVj45QyDEM=;
        b=kg3+LxhZ+mHWViB3t8mpYAsItmGIWPLS29Z4osEOCcKE7haG0UfCmJjn0ZjC746pNp
         jq2b1EXv7aiEs7OMBDTVg1T/oAcDHlf8AW/s5T3YEpQsvFHf0VtpL5odA5VwrsTqNBgI
         Fh1vTM1fgvtcW1oTm67w7MwjdsoQ26NQGpxH61n27bAkE+TBXkhv+w444+brRKFu9Q3H
         EyfXxmeqYoduHLAwd87pSLoWXlk42nYg/48fsu4Lc3RWYt8deuyC3ymzPEHIZCnbjkpL
         ixgWOuy8VBhKhJtG0ZTaDpv2+SJGRrSjyJCqGGIx0srVe/QJcYDpYTk9STUY4ZIULDxu
         Km8g==
X-Gm-Message-State: AOJu0Yyr5bt+5bFVGGgwIHS7IKNqesNDRKa+dGKNevHGIt/w4g1aPiVP
	Xkgz8z/An+EZifXbtQZ9dYJ9hU7kF3JKXr9KJoVHChtGip6Iet5wUOouTkYpfXAwWMLobh1qvjh
	Qaqk1D86E8FPwQ4CxSdp+q8XBPLScoIktVgEKIAa8hjCBbA4opSTrb6Sx4krBPH+HlVQF
X-Gm-Gg: AR+sD1301tCnr4FnVWXH30tCsBpJcGASEBwb08uBQRIelcZorku55ALRSHuz+ELvm4E
	8j9p+UHN4Xe+SL6OaKrdaQ+Fhs2Y3qn+X0iRiv1vt54DBMVT7PToVZQK8V9wrr/L0hnWpwiRZgf
	nLAeseemb9iI/ZsRHxp/D/RWUsnCtY8BGgwzTOODn5QEbudpjOJhckLPNUHukH1AJRiTto/MXLq
	PjiN3mTRzC+8QCAA/wW6j2mNY6itU0NtpTI6JrQhd9TG6hnDmjefO0Msl+Ae83yg9lXuYJrOPFD
	iG3d2UKpcvUvKZQjgO0ECHpGgfh8nRnsoYliCug/3lq8Cs4WQrWbP4FzKjStSF5Oq9nLWzjA48p
	yt93Cd0L9GipCGwNdJbSj437s3+vyUKFxrLmAHailVJ8EPe7E97nerWaSk4xLwQIgSaEXKaRbio
	qh7BmjL0a86gw=
X-Received: by 2002:a05:6a21:164a:b0:3c3:a08d:5b44 with SMTP id adf61e73a8af0-3cb85ef9234mr29856197637.23.1786120544883;
        Fri, 07 Aug 2026 09:35:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:164a:b0:3c3:a08d:5b44 with SMTP id adf61e73a8af0-3cb85ef9234mr29856099637.23.1786120544299;
        Fri, 07 Aug 2026 09:35:44 -0700 (PDT)
Received: from hu-mdalam-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde2e6sm8918689eec.21.2026.08.07.09.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 09:35:43 -0700 (PDT)
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Enable quad SPI mode for SPI-NAND on IPQ RDP boards
Date: Fri, 07 Aug 2026 22:05:30 +0530
Message-Id: <20260807-quad_dts-v2-0-6f578d4152b7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFIJdmoC/22PQQ6DIBBFr2JYF4MTgthV79E0DeK0klStDBob4
 92LuGw3k/z58B6sjNA7JHbOVuZxduSGPgY4Zcy2pn8id03MDAQoURaKj5Np7k0grmpjhdTSCm1
 ZPP72+HBLQl1vR/Y4TpEYjiWrDSG3Q9e5cM56XAJPVC3Ufr9DIpN8WfQfRZl0fAYuuEaroUB4A
 NSXgSiP1Wun5XGw3dg6CoP/pL/MRVL+PnsuIquUjVZlBZWU5g9r27Yv0zW5mhkBAAA=
X-Change-ID: 20260716-quad_dts-6bac0484c08c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Md Sadre Alam <md.alam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: yX_XCGkfB1BLnLRycl9yMKyFkJWWaaje
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDEyOSBTYWx0ZWRfX7/3drUR5XyCU
 ZQb2lyAl95Xc7Iv0joVRYpiKjfOdN+3G6R5e9L1U+I2qwLmHBdng7QrEVt8TCePquSdQLaRul/Q
 k7teBqe3l9UAX6+dT2QDG3cBAnru6qQ=
X-Proofpoint-GUID: yX_XCGkfB1BLnLRycl9yMKyFkJWWaaje
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDEyOSBTYWx0ZWRfX+W5wNkgZxX5P
 xoqb1Y+oEmNkiIqwIiXJMzIO1q/U3LehhmHkCXSDQLb8CwE2haVrq2UlFISofc7759rT7I/GrcV
 J8OTzDRXZgZ5CraTWBPL02ywT1f/x6Fkh2P4SUpWBfSfgIkz5x3Y9pOXBUth3nf12RPtLx15rMt
 bQWETBDFeeIwbKvsmbqlXFufbSJpxFGixCM1edbDeTpuXcXID35EATumgoxqSu0fIwzQw5CoXiD
 NYuPJFAcXLD29a603JAhzDWzC/tDbu+R3K4IoAuATKGfptBEIyFzPLuFEc8HWm9pPj2+X4BobIr
 MEkvUS9pcsJ66+0vEywbvcbNZUjAj6rKBshfqEKa1ynFhNPnBPCqLc+gYvXyGRXJo4Rj2IPV7Fc
 gCytRzawt8aVxBeyu/P2TZIrtuY8YPvIrIo0SlXzq6qY/U1mdFxnrt6w559Oimda3UEjn8U8ywZ
 Yhv8CWjCnXRZApJZvrQ==
X-Authority-Analysis: v=2.4 cv=X71i7mTe c=1 sm=1 tr=0 ts=6a760961 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JIWmn_IX-yUVY0fGI_gA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070129

Several Qualcomm IPQ RDP platforms support quad (x4) SPI transfers
between the QPIC SPI-NAND controller and the attached SPI-NAND device.
However, the corresponding device trees do not currently describe the
bus width capabilities of the flash device, causing transfers to fall
back to the default single-bit (x1) mode.

This series enables quad SPI operation on supported IPQ reference
design platforms by adding spi-rx-bus-width and spi-tx-bus-width
properties to the SPI-NAND device nodes.

The series updates the IPQ9574, IPQ5424 and IPQ5332 based RDPs.

Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
---
Changes in v2:
- No code changes
- Pick R-b tags
- rebased on top of tree
- updated the dependecies
- Depends-on : https://lore.kernel.org/linux-arm-msm/20260807-quad-v2-0-8ec821e2f22b@oss.qualcomm.com/
- Link to v1: https://lore.kernel.org/r/20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com

---
Md Sadre Alam (3):
      arm64: dts: qcom: ipq9574-rdp-common: Enable quad SPI mode for SPI-NAND
      arm64: dts: qcom: ipq5424-rdp466: Enable quad SPI mode for SPI-NAND
      arm64: dts: qcom: ipq5332-rdp-common: Enable quad SPI mode for SPI-NAND

 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts      | 2 ++
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 2 ++
 3 files changed, 6 insertions(+)
---
base-commit: d56fa0b2bd2d9b2fddc10e8f5bdd42d56676935c
change-id: 20260716-quad_dts-6bac0484c08c
prerequisite-message-id : 20260807-quad-v2-0-8ec821e2f22b@oss.qualcomm.com
prerequisite-patch-id: 912ede01168ddf0476ba69ab0db786186073f817
prerequisite-patch-id: ab86c050f49d3180b10e61ec20bdcc6272c8100c
prerequisite-patch-id: 932ca3dc3893df6de25928b24c7c24550907088d

Best regards,
-- 
Md Sadre Alam <md.alam@oss.qualcomm.com>

