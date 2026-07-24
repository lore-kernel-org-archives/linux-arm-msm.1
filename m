Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080AB33F5BC
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905232; cv=none; b=ZgHyuMzUSaqmm1DPTlRkElxhQJJMpOX4jDki+WkmziBtvbhZcYSL/cYqd83IPhlaLjLOYnNkmkuaPzdIRPoY0EmScX8ab72i0y0sYuuyGt1Pm0ccVHWxvtv2H6/nWgy7wGy3ICdqBHFPlg6YpUOV7ILPQefjF80DKJgjkGDYnco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905232; c=relaxed/simple;
	bh=kko8v/PvUqupAnRZhYeFpLTutKewYs6xhN5RlNMfaVQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hHutz2LnyJHv9GQj0akZ+zQs5624sY9ANXf3Ch1SE8hwdjG8hX6wMhXOjZDbTfnAkr0yKVctN5g2lNCPShvulLIE7zjLt+OIGJNdM5mm8wkfG1FVdsA/YTXDGCHu+Ur5K+BFrwi/puxWXytug50/BERzq01dRxrKs0Qmy6ZcJJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ebAPvFQD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OSldBmWb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ebAPvFQD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OSldBmWb"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbOK93196437
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2+S4Qr4ecJ8vurqfXY55fa
	FolKA1DCWJklnTFRiEnTU=; b=ebAPvFQDU63FMpJ2ZmQDp0AtbK11UhBmXMOQGS
	Ch8GrLeNMFdfdDQZ3CABZQVF4NnxAmi3K3+UwrJkr2+2Q5J8dHDuuq3HmegFPs4w
	vTa+zq1joAN60jurBJy8AidLdMGc6uIiR3UzdZOxRn4pdhxQX24G+6fiLv4CK7ec
	zzYBZbFGyNxJDTPO5RAqrQ9qkvwhyH1HU/UB99549Kk+I/gq9ewGz3l+wX7MMTO0
	PUn3AE6PAIiBh1B0FY1BTLf6S3kZnS8Fb0Vh9a3iN91Smdc52XeXmw1FB4oPt0Sl
	TRZ9RLEKQVh3FSrG2rvbZofm067kpJVzFp0QFMctcz1JYKkA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p52a9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:00:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccbb61893fso11121785ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905228; x=1785510028; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2+S4Qr4ecJ8vurqfXY55faFolKA1DCWJklnTFRiEnTU=;
        b=OSldBmWbV0ql/8T1R4XDv8Uz+vKEAjOksNsrZicpdIcmnKEE56t0SrgXf44Tb4/InL
         wY34KvHySU3h5MkbvqHo0a2F2Czpfmst8/HNeC+tabdHxYc6sSn6zWOqLZkn3QyxmHLs
         Wrd+k2bkBhDSFglNX98qZziCd8LZII+sjO9+51JM4Ad0jy4TbOs3M6ju/6BcYPc/+6b2
         SoQfzlHRroUGieRD8w8aAPP4R5JIj+W6JwpsAotXBXPPyXplxpaH9cCdlcwRD7hRHjfG
         RkYx1bjAjSU5/uVrS4iTMpHCL6LRFD9PnHDqX487NBOmXzcHOQqF9OuxVWl1f62eyGWL
         l97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905228; x=1785510028;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2+S4Qr4ecJ8vurqfXY55faFolKA1DCWJklnTFRiEnTU=;
        b=cZNZQhliI8vMXmqwIchs4jXM6gQQZEy35xMj1fBINGWoc0jZm38aemawLwZOfxQhYX
         OoI18U3TIIj3gyB3OhtKv8Ruzac3c7zrX2eK8R4kYwWNldgONg4Dmgfnr1bN0MNLS148
         NxMH7Dh8Q8zfEn5oxV6Kq1Zt2i+rrNa9pSLsxf2azGfuknbecen/sHahCi7kAHqb1XZU
         MSjtb3KRLo9jrd1ZfozVo4dRXGzK10MLhGlBdYG/7mYrWbyLRaZJcLiusvZ3c9yR3EQZ
         DLJUMwAES74tHIs3B2lBpsFrIpZdoCoUJP07ColAQ4SeUtkWKlhqT+kg413EdTsw/oLy
         JAew==
X-Gm-Message-State: AOJu0Yxq6jaU/ooKUx24vsA9Yhtpz+XlmN4Ulb6bV35ybG5szSaKwNo5
	TUPl1r7/mAVSN6YIFU0bxihU39nGH2YEpgyET332d7qitGzM0/welKHvvROY7ZyJdRjOVMQ7QLA
	p/fALzB+w0vsmwGVrIaUhuHTf1ZTY1FLDloT3l1A6JV/8VKaSWUsk8/Fpua0BCMFVkbm7
X-Gm-Gg: AR+sD11do/VtZENZ1/TaiHp85TnMaG8iysn46M/V2wXBWN+G4eDrkF/cruOvBx8bmCn
	Syd+NvRftrIuLfLO7RlCbhz4y2+8aoD54MifVKo0pZHhbyHzzPGvzzpoycDqVBK9BUGXNdCVE3z
	2SOa3JhEEM9ZEJmP0ak9S8CfpiyUA6ORwUQKwrYDjSoEbJFLs6C0Az5z+s417Hl44iatLgDYTV4
	Knqmh3dNfAaIDLIaTtZ4DwBhn+vVjjb68nc6bIODZYLB33kMVYbSrlkzz3Y0oOCl9vXwHlP7e+g
	339ONekC1xeYnU1/S53guX3OyKDAUL2dZbtlPtKiDNM0u7aVNAKifv2UAjG35W7Mdptch0K63iq
	WjzrnJUtE0zsyA2uchZL7E7FNK0J7R/FqT3TakLPX6uY=
X-Received: by 2002:a05:6a21:6494:b0:3c3:8600:f0a with SMTP id adf61e73a8af0-3c44b18b831mr8831960637.46.1784905226168;
        Fri, 24 Jul 2026 08:00:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:6494:b0:3c3:8600:f0a with SMTP id adf61e73a8af0-3c44b18b831mr8831902637.46.1784905225536;
        Fri, 24 Jul 2026 08:00:25 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm621809eec.25.2026.07.24.08.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:00:25 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Subject: [PATCH 00/12] clk: qcom: ipq-cmn-pll: Add IPQ5210 CMN PLL support
Date: Fri, 24 Jul 2026 08:00:22 -0700
Message-Id: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAd+Y2oC/yXM3Q5EMBBA4VeRudakbZYNryIi1HSNUP2xIhHvr
 rj8Ls45IKAnDFAmB3jcKNBiIkSagBpa80NGfTRILnP+lR/m1DI3ZF0mBW/UbOw0MY5d0Ra5yHq
 tIZbWo6b9uVb16/DvRlTrvYLzvAAiyhgsdwAAAA==
X-Change-ID: 20260724-qcom_ipq5210_cmnpll-0eb9a9615dff
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784905224; l=3193;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=kko8v/PvUqupAnRZhYeFpLTutKewYs6xhN5RlNMfaVQ=;
 b=dxK9tBKw+7oYznPTe8Kw6mLX/EuBJBqwe+twzB2ln6M4VYEjuGjS46cuwN+cRur9m+dwLgxAy
 BxM1uj178dRAAnFnxkYAnI1L8VfKsOGCiyD4pI/0/RfJ2+pn56k+Zpx
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a637e0c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zil3pad3FGakuW8kcwcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 2IuRhaemGFABr-F9GchoWY8Q1_y7FZyP
X-Proofpoint-ORIG-GUID: 2IuRhaemGFABr-F9GchoWY8Q1_y7FZyP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX8x/x4OS4amWc
 2DNNcBGXomFmlswnZh7DKQ46omQEn9xu0wTn7U0/fwrftMIs6iLRSWFnuMlXdojfmU1MF6fCaIK
 BAYgkFwMjlN0F1RJCvFx9/dE0ucjS48=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX5RTd3so7RK/K
 0FJdVy5fBQti6+MTQcYSf7Gz65xcbialSonfrcmkkrurSgXlztNK5Oa98FoNMSzJV1azCv6G38S
 pmB2W0P00arPQW0DT8ENfmyYQR/nWxcHZMNDN8bhAK86VuMBOh+Xzoj4Iny8/+CAoCyAMYTrOFA
 64KsSnZcSO+pTzY4AzeTuxzy+9c0f3EPx30GB/u9o4EhPKriTB4UYKgvdpSy9TpUO8FUsesqy44
 wn3aSs1dW3MMOQ48edZAL+YyJaBgapEoNJ6ZELCvDiGUIuNbfHkA9D++nlqjKrXpe+X3hvri3xW
 3T5Ut/senpFEQetfovK9xn0Dw4VxCjCE1jUWCxW/Kn8w+vNHhZyTHta6+MK0mBDiRHHDX6HTANw
 HtbyNZrch/HDaxlqrG/vMaBl73msxk+ADB2pnGBLKJzJQYA3ilSWSxhAPxRFq3SVPcNUSFmn/OV
 NY1i75KZSm6Gn1hMlOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240135

The CMN (Common) PLL block of IPQ5210 is almost same as that of IPQ9574
which is currently supported by the driver. It accepts a 48 MHz reference
clock from the on-board Wi-Fi block and is configured to run at 12 GHz.
The difference is in the output clocks.

This patch series adds support for IPQ5210 into the CMN PLL clock driver.
On the IPQ5210, the CMN PLL block supplies a broad set of output clocks
to the networking hardware and GCC:

  - NSS (network subsystem): configurable rate via 6-bit divider
  - PPE (packet process engine): configurable rate via 6-bit divider
  - PON (passive optical network): configurable rate via 8-bit divider,
    plus a fixed 31.25 MHz UNIPHY mode
  - EPHY-RAW: 125 MHz or 312.5 MHz for the SoC-integrated Ethernet PHY
    (EPHY), which supports up to 2.5G link speed:
      125 MHz for 1G/100M/10M, 312.5 MHz for 2.5G
  - Gated fixed-rate outputs: PCS 31.25 MHz, ETH0/1/2 50 MHz,
    EPHY 50 MHz, ETH 25 MHz
  - Fixed-rate outputs: XO 24 MHz, sleep 32 kHz

The patch series is organised as follows:

   1/12  clk: convert fixed-rate registration to devm, remove remove callback
   2/12  dt-bindings + clock ID header for IPQ5210
   3/12  analog soft-reset helper (clk_cmn_pll_ana_soft_reset)
   4/12  NSS configurable divider clock
   5/12  PPE configurable divider clock
   6/12  PON reference clock with enable/disable and divider
   7/12  EPHY-RAW 125/312.5 MHz select clock
   8/12  clk: composite: export devm_clk_hw_register_composite_pdata
   9/12  CLK_PLL_GATE() composite gate infrastructure
  10/12  IPQ5210 output clock array and device match table entry
  11/12  DTS node in ipq5210.dtsi
  12/12  Update IPQ5210 xo_board to use fixed-factor-clock

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
Luo Jie (12):
      clk: qcom: ipq-cmn-pll: Use devm_clk_hw_register_fixed_rate_parent_data
      dt-bindings: clock: qcom: Add CMN PLL support for IPQ5210 SoC
      clk: qcom: ipq-cmn-pll: Add analog soft-reset helper
      clk: qcom: ipq-cmn-pll: Add NSS clock support
      clk: qcom: ipq-cmn-pll: Add PPE clock support
      clk: qcom: ipq-cmn-pll: Add PON reference clock support
      clk: qcom: ipq-cmn-pll: Add EPHY-RAW clock support
      clk: composite: Export devm_clk_hw_register_composite_pdata
      clk: qcom: ipq-cmn-pll: Add clock gate support for fixed clocks
      clk: qcom: ipq-cmn-pll: Add all output clocks for IPQ5210
      arm64: dts: qcom: ipq5210: Add CMN PLL device node
      arm64: dts: qcom: Update IPQ5210 xo_board to use fixed factor clock

 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |   1 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  22 +-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              |  25 +
 drivers/clk/clk-composite.c                        |   1 +
 drivers/clk/qcom/ipq-cmn-pll.c                     | 612 +++++++++++++++++++--
 include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h   |  30 +
 6 files changed, 644 insertions(+), 47 deletions(-)
---
base-commit: 9eebf259d5352b87080d67758f483583d9e763d7
change-id: 20260724-qcom_ipq5210_cmnpll-0eb9a9615dff

Best regards,
--  
Luo Jie <jie.luo@oss.qualcomm.com>

