Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D9D17BED0
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 00:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792195883; cv=none; b=u6xkoQFpcTP6WaKGKOcDs8UAwh7U35X1s6of6E6CtH3EF67PafHEXUpd7x+mLKvlYhwvLUtk5Hxh6+dkDCLHW9iMNOZn/BjBG0iKqEoztAXtdMxu+GRC37Q6JzOc1oZdmD7pw70ih8p1Wbfqo6Da9cSWHHsr6khFOlwAeaC+fXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792195883; c=relaxed/simple;
	bh=bQChtrLj0fV4NUZooNZdboNgMs39XExDGu+d9ixnI1w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y36AFSVDko6UgK5QmUL3qgitW/NGcGz3+kMiHLgwpMeSDa4yOLXckiZgwPLHZwkEp2ttJ0XAEJvYkHCwRcdYlpj0cGJmZtemnOcZkMBTc01P5gEqiDpHeEY0PHciSlJRJgC6iKE94rd4tBgVyys7t+M8AD3BZlxNsq9jhjtddD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/891Hyf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HQcFXgSd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/891Hyf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HQcFXgSd"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNF90d3663943
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 00:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oKphrI7ZiSNKLYHVhj/lH5Hw+pQG0yApYyA
	hWQjXN5E=; b=n/891HyfjTfpBOLGYs1KEk7gOul6VMtCkk+ayYiHTJMh25PfHZw
	sUQoshI62BDvN5fU5FwmeUhJndiL1tT6JKkDYcFlfsWXwsbUshEW8+rNtuaAeE/c
	+vtGViBuTjdJ9pTPB3laAFA/MZv9uxFmGQQexyM6D008JQzuKn9xd8VqY7mfkhb1
	01wKIZZJBjnssadBj1m68hd2/le0Aa9IwU2n5Qd+VHLJFi00wdzKUVPbaODsGJ3b
	JsWgS/sa6QVqiVHCQXv2pFWAlL3UgA5JLcPO8b1ttdXO1vdtbZXkCI55m99rPKwa
	uQOJBuND22mHMdB3d8oNw3/eRm9nAMv1Nog==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbrwms2rd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 00:11:20 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso489129eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 17:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792195880; x=1792800680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKphrI7ZiSNKLYHVhj/lH5Hw+pQG0yApYyAhWQjXN5E=;
        b=HQcFXgSdCP1/2lkw5JBGQiZxKW0cUf79LUn0GOXlOgMgdK7kG8M1P2mBxiR+okX8MA
         93uyh/ZixI9lfMH+EKSuZ42mz+Kn/IzLT+LljWovsvlg4zorQDdj8CIU4Mwj1OItxMlk
         nXME+KTbsFw0aoLDFnsovQz2ElrzfD7elF+2STX/WCJeZWo6OZcJ6ErJXC92fy/mqHr0
         KcEu+YZg89NnnMgx+E7/57yQ6kuDOP7jNQFB1lgMSMwfFGRZTP5Gn5bzuI8/1OoOgd+o
         qBmCpoGKVk2mXPI/NbED6oTuDBCjUlw0LX3y9TRAbRPKnKUiqcvFQYbi1TgxilJd7cMT
         4jmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792195880; x=1792800680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKphrI7ZiSNKLYHVhj/lH5Hw+pQG0yApYyAhWQjXN5E=;
        b=2j4UPm8Bx4L3TNlxaQz8jQFUTmeTwhzjrpVr1EdMQISAarB5dW7QdolKLKPvtdqgcM
         S5+HiwXwIkYKrFPoy6BMxPxQ8NagOZjsUZjICwi2YjFxcKds9BSScUA6K0w3tBd9goYK
         7T/+AVUVafdXYlpaL87XmJ26tB6HHWVaZcPC3bCiWcZN7ki1Pze0TJWsXo3e9SBNQsnf
         wLwWv1eRq/HQASFuSX2cxnqHOgDHiIVZa+Gw7mKNfqkD/HfAu4QXH55NFcOeDv1SqvpL
         sjH7WDUX0AeHYHVTUiHAHovaZhda5ZbmfI27oJ7eDveiEHFoKOGQO8lZ+MRhXdrwdul6
         zt7g==
X-Gm-Message-State: AFq9FYI+/pju5Fs1nC3K53yVyis+CeaeUmXKpfmSihdmSXJSIEgJEXPV
	k9Djsea0Lu8BDziLKFr8uRBvSoiLXeFd5SxuEfN0bTzCjEuC2s0aah1zP67JsDU0FORmfvjDGNv
	1P/OshhdWsnYEd1vZQX828QAKDcP+I64sNsuCwcmUNIL9fDDeGfCFT4mgfpAMHuBfuJkr
X-Gm-Gg: AYBFou1YRieix+fT3FrTsbu0M9ZoDzDzsHo8PpCJwMmkwGqXHmlkHPrfJuUslPVyhRp
	ARMn8xVINEGAof4B8jGkhbc9ZOS8Y1MjjS+8jv/LF6U8T33cf2c4GjnzOH7MPTODzQm7idHK29B
	EtrcMWs49cCp7mUy4C/N7GNQJIjFBcO3F4hzNDycWUI4AVtEko0Wd3n0vLgjNUUNLQIzzoFiNoN
	lupIizhLKiL3CCd4Tp9y0igJQ1KwZARbDJQZ5oYLnQ4F9EVMcbiNG8Ewg3NO/RhNKwfl40AERJ1
	KSf3C6nNkY8ydy0PPE66Tf2Z86tZRsMQuhGTpQ/xSPkioYS/20SviRQTzlrWvU6a2aiqK9DcctG
	dcyvcsx/PYrDeH5x6n/mVnX4TqgvOuVi7bWaroeybDyAb2R2NhWbfVA==
X-Received: by 2002:a05:7023:a56:20b0:166:3e26:c4b5 with SMTP id a92af1059eb24-18512296a15mr1732233c88.18.1792195879622;
        Fri, 16 Oct 2026 17:11:19 -0700 (PDT)
X-Received: by 2002:a05:7023:a56:20b0:166:3e26:c4b5 with SMTP id a92af1059eb24-18512296a15mr1732201c88.18.1792195879082;
        Fri, 16 Oct 2026 17:11:19 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm13441361c88.11.2026.10.16.17.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 17:11:17 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bod@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
Subject: [PATCH 0/3] arm64: dts: qcom: Add CSI2 PHY common-phy providers for SA8775P, QCS8300 and SC7280
Date: Fri, 16 Oct 2026 17:11:13 -0700
Message-Id: <20261017001116.2318647-1-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B4osQ+tM c=1 sm=1 tr=0 ts=6ad2bd28 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=g5diQEdcA98iFwkwvTMA:9
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAwMCBTYWx0ZWRfXypN68c4xHpAb
 3oPQYX84wUH+1eoflPi7X+SlWMyTu2C7ncKw0B12bV3YeJvl1BF5I3YLVkWKIQ92e1EsCGxLuE9
 xqG7gbbCCj+Znh1EkXtuZHmWPWx14FLS54MRBMhMwHP2UMAtg0woRujAdUW3ErWyPLgmxqFx6Qe
 PnWtvDFGsIqnZmvYODJZzbJDHNt98oEUelykWuhBfL4i6H9zd0ryQgdE4NCPvJ4bD5FjrGFBEWZ
 XPgjII0WW1H9e/pDlcMk+xgPePGVppaI91zwW9aZInPxLB0n4DyO1448jUaEXZS+U/9UqnvqVsb
 W/FFx95Kvs4wSDLPAIMnURbMEZx/bTqSdn4eGlN0lqePFQJw1aczxM7qBxWPHg0pkD/fYXL9crc
 rhZ63NfMEkgRpPtoysKAWpseMVQ2Q5ot5cr5gdGFq9WKVv+rdKJaSHviHwskqrwEtwn42fDB6W1
 WkJv6DWi4CLl4zMuN/g==
X-Proofpoint-ORIG-GUID: LfCGoz-TUFtTH_ei0QQBpA9eeyMgrZ58
X-Proofpoint-GUID: LfCGoz-TUFtTH_ei0QQBpA9eeyMgrZ58
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAwMCBTYWx0ZWRfX12q8y67rsHXw
 gijc/5V2E3+BJywKpN6dkXRwZPSjbe1U/IrkEbM2pBBk7fYmKiiCBiktTC4K1DPS+2Q50Jx2Ojw
 8d83XVWMm1h8kLK1xymvZn5aw6FKaXM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170000

This series adds devicetree nodes for the generic Qualcomm MIPI CSI2
PHY driver on the three platforms whose compatibles/soc_cfg were added 
by the companion "phy: qcom-mipi-csi2: Add D-PHY support for SA8775P, 
QCS8300 and SC7280".

Each CSIPHY is exposed as a standalone generic-PHY provider node at
its existing register address, with its own OF graph (port@0
sensor-facing, port@1 CAMSS-facing), so that camss_detect_legacy_phy()
picks the non-legacy path once a board wires a sensor through one of
them. The camss node's own reg-names/clocks/interrupts for the
CSIPHYs are left unchanged, so boards that don't use a provider still
fall back to the legacy in-driver CSIPHY handling. All provider nodes
are added disabled by default; a board or camera overlay enables the
one(s) it actually uses.

The three patches are otherwise independent and split one-per-SoC
since each touches a different dtsi file:

 - Patch 1 adds the four SA8775P CSIPHYs (csiphy0-3) as
   qcom,SA8775P-csi2-phy nodes.

 - Patch 2 adds the three QCS8300 CSIPHYs (csiphy0-2) as
   qcom,QCS8300-csi2-phy nodes.

 - Patch 3 adds the five SC7280 CSIPHYs (csiphy0-4) as
   qcom,SC7280-csi2-phy nodes.

This series depends on the compatible strings and soc_cfg entries
introduced by the driver series referenced above and should be applied
on top of it.

Depends-on: https://lore.kernel.org/all/20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org/

Anusha Arun Nandi (3):
  arm64: dts: qcom: lemans: add CSI2 D-PHY common-phy providers
  arm64: dts: qcom: monaco: add CSI2 PHY common-phy providers
  arm64: dts: qcom: kodiak: add CSI2 D-PHY common-phy providers

 arch/arm64/boot/dts/qcom/kodiak.dtsi | 172 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi | 148 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi | 114 +++++++++++++++++
 3 files changed, 434 insertions(+)
--
base-commit: 37dc35244bd8c6be6d79a6ac591d14c660822dd1
change-id: 20260226-x1e-camss-csi2-phy-dtsi-52c85c0d4da8

Best regards,
-- 
Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
-- 
2.34.1

