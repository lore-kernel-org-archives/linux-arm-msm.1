Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569349;
	b=TGf0ybDnaHCc9w9EsOld4zs5hg1bHm7HySUFR9qF/6Le27WgyCEfGtLT2MkhNYaXbJzf
	 oTn0OJVpANvy1bZoyiYx1dU84FEuZIylsLtWj1sM0+ay9U0AjJuSCRuBj7ZFm2cBccp2R
	 1xvDD2On3DW2+CfSF9OpyZ7cLPkdkrmq7HY2GvNaceh2Kf+2odQ5vpoR5hYgiQ6aUihPV
	 5ebGzB5DEbg45sfcHtnGZtWcwabtJZStr9Ts8nO0o4n3iJUjC0TaL6l7JculeoVAzEoh+
	 KYlDeLutnv+PTay9nQc8YqdCYnLwKNrglTN7SG28H0zPMw6t82y+zkqn6sTQH8E46CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569349;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uOPG54pDdWNWWI0UImDPEIHhyYvJRCE6R7piuf/hkRg=;
	b=YNdtPyJ7zyU8fBcvul2r8gx5EwCvjNqBjHdRJZPjWWv4yIzmEaX8PmuT9do/IGfg/ehF
	 llKdMelr8rHig471bID881OMPtA2kxQN9f7/DdJR61rIRUniaDQdS/uvusA00p5M/azZW
	 b3qmpEwXGTkRZ4KyhuttJ69aa1Pb/ALq/zwm5oJKgKbCfwIriRZLpFwTY1jnWiJM1IUMe
	 oNBhW7htIqXNqv1ZsmLz13IDhWo2rGxXL5W8O/DUy9ajBYEqWhQ/5aPy6nCDpTVnH9LHo
	 P+rEjIKPU/aqZbgVhHp1E8A8gWrXlotHHZoKM6HlK/v9Axn6baIVoABhLJwICzXLTDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pNGT8eJZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GgJ4oKrj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B09606A327
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 11:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44B09606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pNGT8eJZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GgJ4oKrj
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8UwRx3619860
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 11:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uOPG54pDdWNWWI0UImDPEI
	HhyYvJRCE6R7piuf/hkRg=; b=pNGT8eJZ8CF4BzOKgfwpx9cpLJaet4U2b/8OS3
	A3uNmXNWdLMMwZ2RTTLUL/TWnHw+54vcOVOL0ArrxKvGvhHN+eDOMQ9PfQxEeFSa
	KAE05VY+8QkKdMCjKR7CaHMxIBuxVm4OMlY2O6RBVAjB7EpmVzx6RjTHK+kwkDRw
	25toPPjdCZuo8v9o/fhpjeIa90Y0jFm0P/QhRaGRuzVy5WypdEGvgrn8VNXhg0gz
	Y/wRu5D076xmW9LQU64geshL09rYxFcujonS2PWMuShw9a77khFsVMEs2zHXWwMA
	+npAdDatKd3zHT9MB7ked6homBiu98oMb8mYTWcbKDGfcCiw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvja9422-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 11:29:08 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1323915eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 03:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794569348; x=1795174148; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uOPG54pDdWNWWI0UImDPEIHhyYvJRCE6R7piuf/hkRg=;
        b=GgJ4oKrj2YBXPUMwpAwZEvrzZ6pOhyONZoAzWovFvcU6YkZWtksNL+mEqemkb34UhT
         Di5vAXoNVddcH8w5tkumPHKLh2B3CYtbRB8FokZFw+BQBnhPAkQsF1joiXTyV2zF4Smy
         j7QUWoJ9LP2W+kso/LAYPNZjtEf+DDHiyjfn/tgEL35fFMw0tLKGFBfxkBz5WlcV5nbz
         3VQOgr/Z7DheUGI7gs08LAvMgAQNcm3iC+Bf2zYkvEyJc8rPFc6Qt+/cmXkN3Ug+iC7M
         41hlNB+927JWqen7o1vK5QuhSYQ2CWR7ApZ/oknncEaagvoSkpYpVpAq5a4Cnws035WM
         QfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569348; x=1795174148;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uOPG54pDdWNWWI0UImDPEIHhyYvJRCE6R7piuf/hkRg=;
        b=ov5lJUe6uWfj9Ii/mr1PHgwBM3R1HdxvFgtkfH7u4/NYNEGexaw4OTMhFqgm1nQz0z
         gR6GM4gU46jTMeAmmSfti+6S2eFPw6ArXdI8UiliQwo4AYvkaW/8YLxXNfFU5vaAb7E9
         mwUkyQR7lt++Cq25k6hs5tbOmI0q8HZMzyK7lM+Htu8wpDm9SYWAu2O2J5u9Zq6LJvLE
         apnCQE0MNGUfzhJF66W2D0JpkxOWOYqjToKOL1dbRb1FTbvweHctEfpZGEwHF3b+WchR
         er0omYnpJb2hsPc8OnvRCtHOzdHMWePLQv0796DvnRq8ozqR0+Lt5X+DGepYFK4KCMdl
         kQvg==
X-Gm-Message-State: APuU4Z+tq5ylKSwKJbb6uusqIwyzmVlFq9N6Y9SvnBWTbna7ChbTugvf
	O/yTbDsYSaN1vglKcNv564eyDXV3krPlqeOHElxtf6kXpCHQF5O5BDxq6lGajTR07EG8BbWM6AO
	CXeg8odeNnooZARh20MlNGUr8cwhJN8/UxnNPD0kINulJF118WrjcUeCRbyHDVXjlnise
X-Gm-Gg: AYBFou2falk+/aQTTz01jfgKuEyfv2SckBQf2qvX+d2yhTv4bluSjpafe//xAvS8TI9
	wVTRMxW7yNveBecaUTclWN/c5XjjNxMTMxIxdCqHqKUMGNRiq+wczSMM4kcz0VIahxwdXuum3tV
	SsXr8SFRlIelmdz5AoMbGA2gys6R+qyiI0Ls4k4mnOA0ZQB1ntebrghe6nap7vQMWFYDnnYWULc
	FLn3ZUrAKCmDObcgI3l7uMF6SJeKsm33auEKN8sV/9RRSZ5/2DfxOD2v5y/1cCuj24lQPvOxogw
	Iezpvzw5rds/m//qmVBur4r+5UNEVirbHsbh1Qkah8xt17P7sTPrlcidTHFdQDaHzcl/9i4hhEu
	9LGORMo1kLueiXQFHkKeCdvjdouO/iRzJJvuu7A3PU2l30P+ziacLIkA5XeZIyeXkmGAM4aIXGy
	I+30U3bnKLYQ==
X-Received: by 2002:a05:693c:8816:20b0:36f:350b:3838 with SMTP id 5a478bee46e88-379671247e7mr1977155eec.31.1794569347501;
        Fri, 13 Nov 2026 03:29:07 -0800 (PST)
X-Received: by 2002:a05:693c:8816:20b0:36f:350b:3838 with SMTP id 5a478bee46e88-379671247e7mr1977112eec.31.1794569346720;
        Fri, 13 Nov 2026 03:29:06 -0800 (PST)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d73dsm7342924eec.2.2026.11.13.03.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:29:06 -0800 (PST)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add support for LeMans Draco EVK board
Date: Fri, 13 Nov 2026 16:58:56 +0530
Message-Id: <20261113-lemans-draco-final-changes-bringup-v2-0-3ae8cd1c9932@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHj09moC/42OwQ6CMBBEf4X07BIKBMST/2E4tGWRGmixC0RD+
 HdbiAdvXjZ5u7MzszJCp5HYJVqZw0WTtsZDeoqY6oS5I+jGM0uTtOAJz6DHQRiCxgllodVG9HA
 ICaTT5j6PwGUpy6I9yxQz5o1Gh61+7SG3+mCa5QPVFJyDQgpC/y6M6sLqJyPcgqbTNFn33psuP
 Hh9S1X/lFo4JNAoIbHKW56U+dUSxc9Z9MoOQ+wHq7dt+wB2fL9LEQEAAA==
X-Change-ID: 20261013-lemans-draco-final-changes-bringup-1b7b76f8b2e3
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        Kishor Buchi <kbuchi@qti.qualcomm.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794569340; l=2102;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=9JHI65o4N+P1Y1EWl2jlx8W5cI+jtPQXJIohhY7Rnow=;
 b=MEC/P9qfuN/Rdg7X2QcwPJhCMAjNawIUHeIeT8WzvrAl5Cu7gCFNDXhq25FFKkSNkeWOCWOlC
 YXoICX8yVdyDeOBUafRs63mQ15FINpxRHuhtN7RgOluGUWNu9bDC0B4
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Proofpoint-GUID: TMsBbtmZatU2PzKjPGkjNFZ2F9fK24Td
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0NSBTYWx0ZWRfX2Nj/EBiCgtRP
 xvlv9y/+EKDSX5guV+u4D5uwO2fo5vVKa1gU3cSaFIBkqKZow25UcLWhXNhW9wvl6pYo5iLWP74
 0aRrPZAGYAyef24gzhTOmgStWHuZAgk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0NSBTYWx0ZWRfXzgO5lVdVtZUn
 vuZ2wWJUHjbVtfMNLX25gfB8VE5bx4oLj9IPTO7ZIZhndKKW6bZZd8+tQFRB5LO+jSGxMO/lbtM
 oSZX29ckAjyyAjXMFE0GmdXh/nU8jJ28NMyrpRsoZb4ez44x6dq9LhMTgpXbl5wJLPadEWX4JfM
 BVK51JcmFmxHb+PqGN+2OCcvQHTke/qcuz9vUvxJMNXR5snsTA1aWuWRBnx/yTvB8a7JKS8TX08
 Bdw0IFmzCfsqX/yBfYqp5DBvmDsqodgIjSxpIH4HVFk24ZEY3gD4lQLS+WdhVpvJ8fzvclUlykG
 L/+8m2buFsRRwJ7yvAqNJEP3axaLYIHJTNh070Xp2CCKKYI+Y2hPeCJeigjIAeXOu9TLJqVpRDs
 4/0erPnl5qd8/WkWEiHIUHN/LK6YnPfFchGaOCgr2FuK8Q1pveFCoXkx76Ede//uutnrbAaoRUw
 nLm0RCA0O71LMyWQtnQ==
X-Proofpoint-ORIG-GUID: TMsBbtmZatU2PzKjPGkjNFZ2F9fK24Td
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af6f484 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=U-ZJO_i5hC5E2wvnxUoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130045

Add device tree support for the LeMans Draco EVK, an evaluation kit
based on the SA8775P/QCS9100 SoC targeting automotive and industrial
use cases. The platform consists of a System on Module (SoM) paired
with the Draco carrier board.

The LeMans Draco SoM integrates the SA8775P/QCS9100 SoC, three
PMM8654AU PMICs, UFS storage, USB 0/1/2, GPU (Adreno 663), and
essential connectivity. A dedicated SoM .dtsi allows carrier board
device trees to reuse common SoM peripherals without duplication.

The Draco carrier board provides board-specific peripherals:
- Four DisplayPort outputs (DP0-DP3) via MDSS0 and MDSS1
- I2C GPIO expanders (TCA6416 x4, PCA9534 x2) and EEPROM-based MAC
  address storage on i2c18
- Dual Ethernet (ethernet0/ethernet1) with HSGMII PHY over SerDes
- ST33HTPM TPM over SPI16
- AMC6821 fan controller on i2c4

Changes in v2:
  - Sort DT node order: move tlmm block after i2c18 node. [Dmitry Baryshkov]
  - Drop unused sub-node labels ethernet0_mdc, ethernet0_mdio,
    ethernet1_mdc and ethernet1_mdio. [Konrad Dybcio]
  - Improve dt-bindings commit message to explain the two-compatible
    SoM/carrier hierarchy. [Krzysztof Kozlowski]

Link: https://lore.kernel.org/r/20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com
Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
---
Gopikishan Thawre (3):
      dt-bindings: arm: qcom: Add LeMans Draco EVK board
      arm64: dts: qcom: lemans: Add LeMans Draco EVK SoM platform
      arm64: dts: qcom: lemans: Add LeMans Draco EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |   7 +
 arch/arm64/boot/dts/qcom/Makefile               |   5 +
 arch/arm64/boot/dts/qcom/lemans-draco-evk.dts   | 543 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi  | 401 +++++++++++++++++
 4 files changed, 956 insertions(+)
---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20261013-lemans-draco-final-changes-bringup-1b7b76f8b2e3

Best regards,
--  
Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>

