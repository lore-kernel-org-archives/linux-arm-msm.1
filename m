Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587958;
	b=0afijm/u5iBIly2w4dqg85Tcnqn14M85L4ECjKybW3XACEMSZulQQ/Td2urFuWcdGNhA
	 KG3hQvt6kku7pJ8zRbo2gO9pBkgQhYBkERgFfSAWDEwDdBJz1qKbpd2T5L+QGrFJ5lD5r
	 WJBa6R8e2CecJ67uV0xCEu98FST3V7yhDbNd4nESDH+9YV+n+h9ULt6gIS+0VTzhztttN
	 txfWDfD3YK0DAIZHfvNGxgctqL87UU240AqB3kGr27AwxRRUgfLg7qviToAHAdUB2yKAr
	 9bMXkpGnmC/fZn14ZOWfk0PZIvN//K58CqopNpvjaDwYgO7n+vQcg6PplylmEzPmEAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587958;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pzpfeVEavQj7EiIXq7kDg+d9nbgzFa46wq2EternaVo=;
	b=eccypPfAG7Y0cSImn0KgDLYxE/RztvdsyOmBPM3VL3vi3rB1DCFpip/Pc3QXEiR2S9C2
	 SyLpgBI1OcUXO5kG5rNRrQb/oAHQibXP46WbTVIuEsC/beJ5BtqeY9qvL/C/wZ/M574Us
	 zcKdByhDEBTweSPuzwRtQdG4H6iUg4PyLwcJSPbykSgZBA+c7rA6laAp4UuwIKG0DWUXk
	 fdrI/4Rs/iuDjmOC6OXstfJik/hLr88xKVlVlkXvohn+lOv7+0C6/64sQQct8Q8naIz5B
	 6WpAgHuoEV1mdkL2lN3a51vSOmVVPp+QFYT0yNigIdKfLZasTWp8NCav/4j/NIj3AqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oFInxtcL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KR4n7zMM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1395606A336
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 06:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1395606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oFInxtcL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KR4n7zMM
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68o2S3807888
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 06:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pzpfeVEavQj7EiIXq7kDg+
	d9nbgzFa46wq2EternaVo=; b=oFInxtcLKRoWuETwDbqmV2hPLqrZy7CHA8CuoH
	EBvNOG81/+vRy/GaA/fBdT2Q+vM9KMu525D6VV2CI9kMdTRQX5Fe5hyKZr/gFFaQ
	GPEX7CWQyD4yD7fKGk8mW8KZXctuigzuY7V4nlBj3Ywrp6Xb/dScFwIKW0hYjNpJ
	JB/1p8fEhY8hUjACoFuckzX1LUnUd6r7KOn/wRslbv38sfdapzrrHMqN6u4vgSwa
	29rKdwEnIULCNAH7ArkVPsS9tMW/H1EDyJ2pD6crehMLU7/+/MuMxUwSoDULxj9W
	POyywNPrJK0ARmUfXcPpQEVcLwacLryieFDCUKBPchu4iM5w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxkb8d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 06:25:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89e05d31e54so3748527b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 22:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795587950; x=1796192750; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pzpfeVEavQj7EiIXq7kDg+d9nbgzFa46wq2EternaVo=;
        b=KR4n7zMMGY2XJaDVRfZ3iwPvhPyi4BBogPK+KU8LrQl5EUwXkOH7QHVsuzW32Tme1T
         aFg2EslHyW1MWJt85fE8ZVAFfAUQNWVa55GYcuRJ1BP8S1XJdSq4mNhQ5BZWCtvRfwE0
         XW1ccitzmyWztlZJjvMWnxvrCL+5s6U+Vfwb8PtCDfLCWb0BUpidAI1LGJwlrFTzP+np
         m2NmgjVSG+ibYBerY1GSDJWRDRO2UBWRBCy0aynyNR4VB7X4ZsY02v8VG4zVZFUD+jMo
         k9jEnu6JUgW3nkLTzVGIZRAv3OMdQx2ieA+s+aIRLQktzLjYlzBc8+ReEQYXx8MrJu0n
         IwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587950; x=1796192750;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pzpfeVEavQj7EiIXq7kDg+d9nbgzFa46wq2EternaVo=;
        b=SSoSWvvrt8WNfd0i/wdcqQOWV1iGKjsvEn2d4i1yVxPftffKpZ+ekvOveza+vouhDa
         2wsgVkTMdJskGydz54XEXGKHQr4EssGnRMikGhrVcUkX+T7VIKuFkbsyjICgp3Chkh5O
         tW0Rh1fPrMjXCZPfZdRgjBgIRrSvG8zx03Kn7V3qamiPkNFoxq4TzeYK9sgknTpMeV5D
         3EcfbPuIvx2ZvRv5I4SPOhHYG6zD8c1PTmoWJOHKG12mPZJg0r8IyQiJ4eVnGRd+TeFK
         yohItfmcwjgslZM4jhnkPf9I7hi9G3VdpLi5a1G9eyK1E/kzNQ5+Z4Me57i+zTNQChkn
         o0VQ==
X-Forwarded-Encrypted: i=1; AL+hErFrIffOWS9IxLrl2k+/F3c1fhOpmvMBjALXnPM9eblBT9qRekF03ri4Sorc278N5cdC+zagFhIXTsJU2bnf@vger.kernel.org
X-Gm-Message-State: APuU4Z96hnHrocFcUjGhd7uMZfR0pjOIoqz0Ow3lVwViRnUfGGpK46Q4
	Jo34hBLBvKy180elMlNForn47B0wOOP+JbAGM0nMAvpU714BSh16lHl5PfgB0SAMSrj69AT7MQU
	rAldyZ7+dklboTsRmUXSwVqkh+auh6wRpPsLX8zAoehcL/y8yup/apMEj5XsoRMxffS7j
X-Gm-Gg: AZFdTZepbxHHaQYtQZTs1/6rfHXoN27hGVM4j2uLGvVuy4vyvspuzLGZMy1ccuYn1Wx
	AMpcwkdiuLKPiqGkUj+j0GByR3ij2JA2fuYo7BqqkXH7+TM7pZb2aqLIgdtOqlhckzu4ecHM667
	l1GeVjzRAa34TOQATTKVUfr0iFOm0YI8LHiQU8WpGD5HrAFjjmYIiwT4P4Y8JHGQIWl+Op/qRja
	+S+O3c7wPC7ltUtGdBb3MJM+jad7TCRugj1dthQui9fzk97rJuOR+uK/hClOz6iDmKpNldHOhwX
	p+sArTfV7ocwzbEqcxSeBDxvWGsG2Hp+sJVEE4/Hu4P1W68DBsQJS/r6/Ue+NemOG3xdlPs6dYd
	VdQv5tJ4/tnpOpdOF5EzRp8TRfJPPy5EffEH6mBPldjrxFzlLEHLaRl2sm76pElupKz6yvxYv64
	hmHnJx
X-Received: by 2002:a05:6a00:1d93:b0:89a:5:92c1 with SMTP id d2e1a72fcca58-8c87d51b324mr14173215b3a.56.1795587949784;
        Tue, 24 Nov 2026 22:25:49 -0800 (PST)
X-Received: by 2002:a05:6a00:1d93:b0:89a:5:92c1 with SMTP id d2e1a72fcca58-8c87d51b324mr14173189b3a.56.1795587949291;
        Tue, 24 Nov 2026 22:25:49 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm8385066b3a.2.2026.11.24.22.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:25:48 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v5 0/3] Add Qualcomm Hawi I2C CCI and Hawi/Maili CSI-2 PHY
 support
Date: Wed, 25 Nov 2026 11:55:40 +0530
Message-Id: <20261125-hawi-maili-camss-v5-0-1483b7f68dce@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAGR/BmsC/33RwW7CMAwG4FdBOS8ocVLacOI9ph0Sx10tUQoJF
 BDquxPYtO1QdrH0W/Jnyb6JTIkpi/XiJhKNnHnYlVC9LQR2fvdJkmPJAhSslAMjO39m2XveskT
 f5yxDFdEarxRFEGVsn6jly5N8/yi543wc0vW5YdSP7j/YqKWSGEKwQJWx1G6GnJeHk9/i0PfLU
 sTDHOHH0UrPOVCcFp0BgOgbhy8c88cxasYxxXG1hYC+QWrhhWN/Ha1WM44tTqygwdrXrg52xpm
 +jpfocCpvOH5fcJruFlWBuqQBAAA=
X-Change-ID: 20260923-hawi-maili-camss-b5dc43a00ed2
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795587942; l=5267;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=9X/7nIs1WLTe0qV0OiMWh+UZ+GNApBiRWSnm81zHmmk=;
 b=0NXaFfnI30tyWyVu/ub8D+DzkJcv0nueHNtG7UFABXbpELymKwic0g8wInlL0f8csbqqX4QwL
 OveYpACmum6Dy/xHkW7iHFyjQA9nYNqOuztZCVBA2S97CPykn+KgPmC
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyNSBTYWx0ZWRfX8qwbg5pC9J22
 Lr+spTTP/hZGz7o1kGFmVKubke/JWWsmbC7v/w6ZViKM6Cm8JEo4O//CAtsfVYlPc5BvMsEXk17
 DQz+pwIHsNpNK7fDHRHvPyTKb5X1qY5OEYObT4lf4fL2Tf5cFdZQFm2MTkiWvmAe7ClFKKI3lcT
 kn/3vTLv5QdR4egWdAwMjjMPAZJ14V4oPq0rnPkzDTUKlACMOy/HJLu4Eb288V/1k8YyAsMcQEA
 z5Gyrpyaro/uRaejJDxGAlzFRZ2l/FBmdmBO2c8aKSDYpZTfmU6MdDs/3FQcTgf7EkBRnYsSL6B
 7F20hgcsW2XkHd65Z7UstN2aSjPIOa6wIbW610mBU2dsQwJe6nvZSABOrtl7JQc3KSKo01N+pz9
 suThY+2wfO+U3ncqFhqMH/TH65lWyk2l7P2+WApL2RNJYCiT9K67TpDHoZIvDQI+vBN9NJf8Cpb
 /w6r7JHBfPyCI8QNqoQ==
X-Proofpoint-GUID: eMToNrJZH6ziFpgoWZVSzWwsQFrT4YfA
X-Proofpoint-ORIG-GUID: eMToNrJZH6ziFpgoWZVSzWwsQFrT4YfA
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b067f6e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=MdiNbCTM_Z-SUpbbCTEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyNSBTYWx0ZWRfXxSZfm1PDfwZQ
 HmnSEDUPhphuptjulQ+SViZdsb9MxlzXXGP1Gh6tEExAltIbKHXVISiiQpotB0J1biIAVohCvU/
 oNjdZiVzXDJpL1kgimFiPJjczmJepC8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250025

Hawi and Maili are recently announced Qualcomm Snapdragon SoCs [1].
This series adds the I2C CCI binding for Qualcomm Hawi and CSI-2 PHY
support for Qualcomm Hawi and Maili.

This is a continuation of the previous combined CAMSS series, now split by
subsystem. This series carries only the I2C CCI binding and CSI-2 PHY
patches, which do not depend on the Kaanapali/KNP CAMSS media patches.

The CAMSS/media patches from the previous series will be posted separately
against the media tree where the required KNP CAMSS prerequisites are present.

[1] https://www.qualcomm.com/smartphones/products/8-series/snapdragon-8-elite-gen-6-mobile-platform

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=phy/qcom,x1e80100-csi2-phy.yaml dt_binding_check

Patch grouping
------------
I2C CCI bindings part for maintainer Loic/Robert/Andi (1):
[1] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible

PHY driver part for maintainer Vinod Koul (2):
[2] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi and Maili compatibles
[3] phy: qcom-mipi-csi2: Add Hawi support

CAMSS changes will be posted separately because they depend on Kaanapali
media patches.

---
Changes in v5:
- Fix correct patch history in commits - Krzysztof
- Rebased on next-20261124
- Split the I2C/PHY patches out from the CAMSS/media patches.
- Drop the Kaanapali CAMSS media dependency for this I2C/PHY series.
- No functional changes in the I2C/PHY patches since v4.
- Collected Wolfram Sang RB
- CAMSS changes will be posted separately because they depend on Kaanapali
  media patches.
- Link to v4: https://lore.kernel.org/r/20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com

Changes in v4:
- Rebase on next-20261104
- Collected Krzysztof, Loic RB's tags
- Added Loic patch to Scale the CSID clocks with the CSI-2 link rate
- Use 8775p TPG resources instead of x1e resources
- Align tpgX and csiphy_rx clock names with the 8775p platform - Vladimir
- Remove redundant CSIPHY resource definitions by introducing
  compatible-specific code and keeping .csiphy_num instead in the
  resource list to denotes the CSIPHY number - Vladimir
- Example Address should match your first reg addr in Hawi bindings - Loic
- Link to v3: https://lore.kernel.org/r/20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com

Changes in v3:
- Rebase on next-20261029
- Squash Hawi and Maili CAMSS binding as a whole - Krzysztof
- Add description for IFE and IFE_LITE IOMMU in CAMSS binding - bod
- Correct the lane count variable fallback path - Sashiko
- Add CAMSS top region to binding and DT - Loic
- Use split addr_update/reg_update in CSID and VFE 1190 - Loic/bod
- Add SOF and EOF enable bits with top level RDI status offset to
  allow their corresponding interrupts but not configured on - bod
- Move the common CPAS/GCC AHB and AXI clocks to the pm_clks array
  drop them from the VFE clock lists - Loic
- Use the GPIO function with bias disabled for CCI sleep states - Loic
- Collect RBs from Loic, Krzysztof and bod
- Link to v2: https://lore.kernel.org/r/20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com

Changes in v2:
- Not an RFC anymore
- Rebase on next-20261012 and drop the external CSI2 PHY series dependency. 
- Drop DTS patches; they will be posted separately with Maili DTS dependency.
- Collect Reviewed-by from Konrad, Abel, Bryan
- Split CSID and VFE 1190 into individual files rather than in separate
  combined Gen4 files - bod
- Remove reduandant is_lite condition in CAMSS CSID and VFE resources - bod
- Replace bias-pull-up and bias-pull-down with bias-disable for the
  SCL/SDA pins of CCI nodes in TLMM, as internal weak pull is inproper
  with existing board level pull up resistors - Loic
- Drop the unused reg_update_after_csid_config flag
- Add lane count fallback path for CSID RX configuration
- Add Hawi DPHY support by tuning register table, which prevents
  potential stream stalls and SMMU faults.
- Add a standalone Hawi CSI2 PHY compatible and make Maili fall back to it.
- Resolve conflicts introduced by Glymur in CSI2 PHY binding.
- Link to v1: https://lore.kernel.org/r/20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

---
Hangxiang Ma (2):
      dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
      phy: qcom-mipi-csi2: Add Hawi support

Nihal Kumar Gupta (1):
      dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi and Maili compatibles

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       |   5 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 136 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   1 +
 5 files changed, 145 insertions(+)
---
base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
change-id: 20260923-hawi-maili-camss-b5dc43a00ed2

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

