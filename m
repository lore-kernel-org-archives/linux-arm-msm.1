Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695108;
	b=mjDb3EwRT+Reuikl7Rd1fU1W8p24U+XytuRKmMdiin7LF0vIyhkXI5yRqe9mS3Z6OJdn
	 LK93Bd3M1m90TyApQs0VfyBrT9ygOzFR6gprV/WIp+sga7eEBkJgznJngCLMRf/LLDlHB
	 sOyWb7CUyTxvJX49cSNCmJ/dbQsG3J9IFd1zRyFGj4/txfRGndQU8w/dSHbSWR30nhUbu
	 XqIFiYW1ROOcYDnNxgXLRjyzvaJQAaIOcH7/ZSX9nw22SD8VYuk8jQ+ZaEu5Lji4On2aU
	 NaiRdTduWj/BcZG2m9pglo757IA0J7G+LaQpesG6G5lMmITDM857LNdX7/j2tEjkzOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695108;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6SFAa4c5nvqNRWfDfdP5XxGfBG+1U9dLVPMvbqJcJMU=;
	b=Hv/7Xd+gMKqBwxXkU4U3foSPTsfe/1kscVtbmP/STGeNmgyNf0OA2J4N3LYA+hHyDUkw
	 S/kT0b3hD5BQws/T0HMesxInwQs5yBlNbIheAe5iVOPL4433xeHDMYf0WWQm0N91oAN7T
	 5Qtq5kmvtArc/yXnNv19OGijZd9M+nZa0DbLLcYFYYi1m1CVwa8CgxOJ40g157qufe5jW
	 ZmlzT91E0tg1dL8jC5DRLxoiVd39wNdpBGQQjmACGhnSOarxvbOtYBPYefvcT4+DJweHV
	 VzriFW5dZqHrV8PpY3G0zgcnqAcwCceM/UoKV3SRrzqxiSN1qgJM/YQsgQJ2AkhSf4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ie3f3WKy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SXAtdJ4p;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42839606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 12:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42839606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ie3f3WKy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SXAtdJ4p
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVKVS3476091
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 12:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6SFAa4c5nvqNRWfDfdP5Xx
	GfBG+1U9dLVPMvbqJcJMU=; b=ie3f3WKyzA3tOSOyCvkZHZUKDRwjPnNjM4aPR7
	m/J9nm91rTiwp8P6sfsyVfN0Gj45LEQ6V4XKjBHox37BxnqZyzH+84c8FDrwea3f
	OHQHunr9JbVcrD1aZc3b5OXGNOmIHRGCGUNt8A69DukUovp+KZ49vOq6dQX5DcHT
	mYwr2BMiyNnuFp739jIc8uE0a9aHVFOMOluC9x7vJq9qBPA+cxF/IDRON/9hNccz
	0DQuIXB8o2QoLqKm8JNkvcBfoVJT5CW2H2gy0tuWEKZyWosZQcDRCzf7wfq0in81
	aPI1CraKAGr+mBz7AQ1OUcN2BUV4sjgc7MVnDTt4W3Mze4Zw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rhb52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 12:11:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386c3309469so2943482eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 04:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795695106; x=1796299906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6SFAa4c5nvqNRWfDfdP5XxGfBG+1U9dLVPMvbqJcJMU=;
        b=SXAtdJ4p4GoAoOokBp3jt3yumwQdr9/MoLKXGashGRngYzb3qnMEoPIS0nZPD9SPP6
         BZ9h0G1bWdDuDYCN2RJtT7NWB13qR4+FR6PytVPKK+vTnZDMNWj3F4REAKi+kDddnyWL
         Gbv2HeaIt7P3kOWUsGaHuDfyoR4Igtt+Ln8l5q+TFWrtPGr1LDRh929HNLg/wHU5G7cR
         mrsN38M2irtHhECVVLz/G3q5GILQqvdZDQXUk5MgIgK8obRW3Utw1DX94TkNWOtHLV3H
         xN3FAgRw0TFq7nwdbiw9F+Tgi6GjzYDQu4+ltic0IQUJF9TefDTFlwowu/VhyFcuF3we
         RtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695106; x=1796299906;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6SFAa4c5nvqNRWfDfdP5XxGfBG+1U9dLVPMvbqJcJMU=;
        b=ksrhY71BZb9rgoUMipZlEDIZgURnsyTu2NxGjWEBGB646UxLl1kO2OABJoW0RszE3g
         VbOWFXjvMubI2obvETFmvSbjZCwZpKxCK0DkLuZ/Sr1mK8g1BisPGd8xdwzBwcpW+Ns6
         TTgmQn+ZFARoYNT6UfvJoh0QsVGZJymejtNcYCJm1L7ulUsoL2uZ687n3brBfzUCIqer
         +R8CcQfiW47kPeRE9ToW3mLaGADtK3ROResO35EbcxoJuJZgERpCilUvuDWq+vksOLpE
         hXlFNRh3Y0gl4ehAX2zg13JzSwdcV9xhkrRv8CvK66UAQ/mxx5vBC4XTCzLvFsLwi5fM
         Nd1w==
X-Forwarded-Encrypted: i=1; AL+hErE6dS1kerT2q5xxeY+4IlEWkzlmsT9Am0GzVRNcPDqGqFOAXwhgu1NdF6t9/6j80rtne8jlljwmYeIb05x8@vger.kernel.org
X-Gm-Message-State: APuU4Z/pSHU/H4EMcz5w2+Y6zs3EcW1tjAZ+qHCaT5pkb968beIXm2JI
	2IQ4dg4EKHErtBVR8sQKaNs2lOWvlH7f0KVWMkSic7dMBfchn5ENNnl/MEMfffvKhvI2Mcydlzg
	0QJw4uy6aHpnObojCYc9btk18D4sPD5hRK2Pai1VUC8aBCk5v+ibsjuTGOsOyPBRuioRF
X-Gm-Gg: AZFdTZetJIikdNCkfn32VCnl2un1Zg0tq/Jok0rxlgbF5RdqDAw9glKuV/8r7N6YGec
	DrZklWAMoM0wfA7kgiiQtnQem60y9WGDflBu1+vxt1gylbqmkK1rV8Lh/m4FLGJqZCPu0q6bVRt
	yEFrnUiDhP7Iy53dDNBVhuyowDET65qYi6yRSQ9HflDGsreCuUoC+NdyNkjMx+0U/cuS0hE/sxA
	9753s5LHGuUm38xiJx1e8KDfG/hbD+iO13Z5gT8Na0T5yI+ajvC5K4Y3XTf48hakXw4B1elkmGF
	GxGxvTLeMY9P84k6yi/31+3K+myi7MnTh/9oCHja2XxL8FJ+mBlMOU3d+QEa+w11hxV6G5mYT9k
	EO5kDbgxg+mYUA0EqYCSnR8m1kGkG8i2WdtliKBAGNv+kKc8+/Yun3hMg0nSo6u00zjwWQ9TIwr
	ohrA==
X-Received: by 2002:a05:7301:d809:20b0:386:b070:6f1c with SMTP id 5a478bee46e88-386b0707151mr12614084eec.21.1795695106340;
        Thu, 26 Nov 2026 04:11:46 -0800 (PST)
X-Received: by 2002:a05:7301:d809:20b0:386:b070:6f1c with SMTP id 5a478bee46e88-386b0707151mr12614057eec.21.1795695105708;
        Thu, 26 Nov 2026 04:11:45 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm58457549eec.13.2026.11.26.04.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:11:45 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 0/2] arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports
Date: Thu, 26 Nov 2026 17:41:38 +0530
Message-ID: <20261126121140.1716190-1-akash.kumar@oss.qualcomm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfXyNwkUdBUIWNf
 vEuToTzVcDkCkPL/WOLZe8aRaCFzRDINf6BUTdFnxyLjSZE84pX9cC57sptEa2a1/iuuAsbngtP
 h3V19DKklZBDT788qZzRZn+6v2GtioQmkP9l7nApf2BGXsko+/v8HyybGKAtzXG0q96UP0G9IyS
 eGDO/zQKIg3JpeuDIxtCBdus7rbQOa6hn47Iij+iJ5oNIVRsFLKqPq0el+u9r8CKriXD6VhYuFF
 8JgJIrnlWbd6mD5puJCcdtDiyIRvvdaL7KjGZ2Ybd2xZ0ZlzT5i0VvFrQcnyCUGbRgvA+hu8PML
 FPbabsWu2X6djgTzx+MZT41ySzdWjWj+JRxZSgIQnmcIeXn/IgEYiZd/27702TpL3ivjhA4Mleb
 sSNi0lmioTTP02ACqTh+crV/y8deRz4/g7+C4ps9oqF98C4MIg43a6cZmTy+k2avc/7digToKSe
 mdr2ppUuTNgAjDStXbA==
X-Proofpoint-GUID: YuISroBHuxmaPKbt7RHFrZpt1GbpH0S8
X-Proofpoint-ORIG-GUID: YuISroBHuxmaPKbt7RHFrZpt1GbpH0S8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX0zdcIXCJHFrh
 MyWLqejYTgZO8bs3YPWw+t+s9ch7QWokkGwO2jq9jWqydt+KA5e4gUG28GSPWjW8gtIvUUQwUS9
 lVsIZAZYlTai6TEEcXw7z3UfCBKcqcE=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b082203 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TYia5Kd-hLhucc7yLcUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260047

This series wires up the CYPD6129 UCSI PD controller on the Talos
Lyra EVK carrier board, enabling USB Type-C role switching and
SuperSpeed/HS muxing on both USB-C connectors.

v1 was posted as a single patch [v1].

v2 [v2] split the change in two and addressed review from Dmitry
Baryshkov:
 - Drop the VBUS-boost regulator's resistor-divider math from the
   commit message; describe it as a plain fixed regulator instead.
 - Replace the verbose HS-routing explanation with a short
   "/* HS only */" comment above &usb_2_dwc3_hs.
 - Drop the redundant dr_mode = "otg" on usb_1/usb_2 (it is already
   the dwc3 driver's default).
 - Move usb-role-switch out of the board file and into the shared
   talos.dtsi, as its own patch (patch 1) alongside the graph port
   placeholders it depends on.

v3 [v3] only added the "v2" tag that was missing from the individual
patch subjects in v2, with no functional change from v2.

v4 [v4] added a base-commit trailer that v3 was missing, again with
no functional change from v2.

v5 addresses further review from Dmitry Baryshkov on v3/v4:
 - connector@0/connector@1 are carrier-board-specific (a different
   carrier board could wire the same SoM differently), so they move
   out of the SoM-level typec@40 node in talos-lyra-evk-som.dtsi and
   into an extension of that node in talos-lyra-evk.dts.
 - The endpoint wiring for usb_1/usb_1_dwc3_hs/usb_2/usb_2_dwc3_hs/
   usb_qmpphy_out is likewise carrier-board-specific, so it moves
   from the SoM dtsi to the EVK dts alongside the connectors it
   feeds.
 - The sbu-mux node drops its select-gpios/orientation-switch
   properties (no pinctrl was provided for the GPIO line), keeping
   just the mux's endpoint declaration.
v5 also rebases onto the just-landed Talos Lyra EVK board-addition
commit and adds orientation-gpios to the typec@40 node, needed
because connector@1's SBU mux requires CC orientation to steer
SBU1/SBU2. connector@0 is USB-HS-only and gets the <0> placeholder.
GPIO104, which this uses for connector@1, was already claimed by the
carrier board's DP hot-plug-detect pin, so dp_hot_plug_det moves to
GPIO80 to free it up.

[v1] Link: https://lore.kernel.org/r/20261012131518.858396-1-akash.kumar@oss.qualcomm.com
[v2] Link: https://lore.kernel.org/r/20261116114908.1701258-1-akash.kumar@oss.qualcomm.com
[v3] Link: https://lore.kernel.org/all/20261116120623.1726089-1-akash.kumar@oss.qualcomm.com/
[v4] Link: https://lore.kernel.org/all/20261116130520.1763088-1-akash.kumar@oss.qualcomm.com/

Akash Kumar (2):
  arm64: dts: qcom: talos: Add graph port placeholders for USB Type-C
    muxing
  arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports

 .../boot/dts/qcom/talos-lyra-evk-som.dtsi     |  41 +++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts   | 109 +++++++++++++++++-
 arch/arm64/boot/dts/qcom/talos.dtsi           |  35 ++++++
 3 files changed, 180 insertions(+), 5 deletions(-)

base-commit: ddf1ba39f517292164e13baa8d2ece96cddc7aaa
--
2.43.0

