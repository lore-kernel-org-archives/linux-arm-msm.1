Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189931;
	b=v1jJgv3T4ENZ4rPG+AXOrz9TuXASMIJWbZwJZcI4EcFSyKpBqhBJ5L4a8Yfl/gIXxgvm
	 VWv5WPqc9w/9OquHHSdomD+yqihJu5WrNWWeksaPOF1gwcd5atQ5teIBry92msUkMLg+T
	 fElYGcdRscorz+otWbOSoQmGAtaSjCxeThOoHOoRTaZCTSwhQ3BEn5ATBx7UEB450ejiu
	 ETwiP31x1KttWoH4BxPABjTIcD01HZ5TRtd16hj8fYeM7P+ncxhBU1C2a9ma0a/Axpc8m
	 b5/CsB+LObcGJB37dd8Zjcda0Mr/BS4/DveGZR90+nNiCF84+vjOEFs3NVlgkoDcLxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189931;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7CyZ7nH+G643rjUlHyDDF4wo1yuv8Eoj67PnRsw31kY=;
	b=sgnsnjnCh8ZxjBY//4Qwi26LgAzsymVyLObXIekoF3BymwEyF1coxAip5uxy1dTRo0IQ
	 KwvdKqFSvB8YcifR+8f6p8pGOHz/J6Jo1OlU4DtH2A1vT9fywo5CM5wlDVhpCd2bljBS/
	 c+iCyieueHC/3cZQYOi+3X3/J0y38Yb+0QzMrfhFifzMi60mjh7FX3uu+VDYjQWyBOeqn
	 XYh7yzpXsiqz6DbzgwWmMW4THimDzJXp7oGBIJ2ZjwW2vnsq29Cp/yq+CuMvj0b+NOrbj
	 gaFHykV3r0eIFxcZJeC9UlQCLrhVHT2U1/WpgJRIjnr/T9f4P2FtyNTtv/uGlzShN6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fCtHKZ4y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SypPVcm3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078C3606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 078C3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fCtHKZ4y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SypPVcm3
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2GF691856
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7CyZ7nH+G643rjUlHyDDF4wo1yuv8Eoj67P
	nRsw31kY=; b=fCtHKZ4yGP77HrI1JydrJ30UEdt2FHwHOSUoAO7WCKAce6jnEeD
	T6EW1tD64Aa/Vg8abM1N3W3IfcVia79nr7R1k0Qmtsu3FIwRK8FTlgvy3xtgeBUZ
	Vxs6ROlBWJ2ePn9x/DAsZW20ifFWtcBMHMu/KsYHSV+J99J4AhJIvTnAOpe4n3ye
	a7sZtyKkNibMoJF1dsyB/1YF9q86dCjfXGbHPohEZveFlO2IqmushpCrrguxdkER
	nm9F38BoCsLU8kLRoL8zR6fwxxVueqUi8cF0Tz3YYYAt5Wox9UL4HZKcC6zlpSRm
	EH/q4t9niLeKFh1/Ty3WQsYUMqkEC4cKqQQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be2ch0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:18:49 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso1280525eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 05:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793189929; x=1793794729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7CyZ7nH+G643rjUlHyDDF4wo1yuv8Eoj67PnRsw31kY=;
        b=SypPVcm36JsNJNqEv+rxhxGd0bz9NGX96Jejuz+qBDx3KUDwcObyJ4H8W6uqUaIN+i
         mysfu9zxocVL9NvEV+fBCGX1VNN9eBqjA3YUzJkWWYp3PXfRASPhMZEPEyMGBeKKenAJ
         Wu8sekMnWW9GusYm1mgfK4rEi51VrfaV37EzjwwMvpM3jDmHiMONu/MAFfta+77oQXzu
         sISXZ8vlJeGBvaplhCZY2R34aQ11pyq+OYm+XYxXye5jcG23CkEjEgaqQJUVhW4mDQDp
         EfTmyUneyl63Ksh8Z5N9HuZnB6s+SNGl9TghwsaVdMnEkbYXWQBRS/PqfPDPpOXSXu4p
         LgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793189929; x=1793794729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CyZ7nH+G643rjUlHyDDF4wo1yuv8Eoj67PnRsw31kY=;
        b=oCh7m3WcUubKihqiv4PaSY5n4ta/OnoPdtn3quRndpHAy3z4iDz/LOOQO5DU77tnu/
         ysxo6PMluIVWhvN5cdqRF577JqR+XmTSg1STWebxYBsJoyUNs8nx4yfIjdxnAp6kYZ1l
         mH4nhZF2Sfs6jgPHMpqzHWmlF/H4srdnESp8KeG9fJWd54IUgZI+TFlS9wVmYiBV4WG1
         35HJwvx4AMLwMTFp0c7CroFYoPZs9zftbtBPaolWUG8w5IAzGIvvEr87OrYjsy+pcSVY
         dVai4Di+lmAb4OHjeNWYhNSkF8UdcoAwocQTEsItgyRU6r8RbGI/dETbe8jT1j6ZqRhq
         2SXQ==
X-Gm-Message-State: AFq9FYJz7trvDWcIP9RwKbQ0v+dkbPZn/vtI8AuA496OkhXIRRPWEEq2
	LDDImikmykkxjB/xKn5RMnVAnGGlajl/zF0fF8Cy+fi16wSMayBLMzzQfBvaCgXaXZ4jXT9509H
	VKD3QgbTy1tfeCCXJ4ekkcfD0wGZpbIljjFq0od1OIFqtDZEmN+GysJLzokPu20ba//8lTQMM+o
	AL
X-Gm-Gg: AYBFou2Kgz4I1OPhKJhlrC21aLNc8Ci+47CskUoQy8M0yWdmnX22ziVZ5bjzT/i8NPh
	B5l9HsHE4fAWxjqESCL0uRuAZxp2w1dShIt8muWabmjHCHu4RFhdw6N92O5qr9KleQyPvV3Zvlh
	0DHn7EEjtYsYJ3E5eTdiWzo4SfpNM6txMqR5+gDGkgXMNfv/Reu84GLB8mkuRCg+byyI0XgTrO8
	4x4v40ukdJpGhehhffF7Rgm6UdgcJHNJdhXxzdBwLOSh7ltgHcAyeL7rbEIiJG+/+Rg5CPYwE+Q
	VZ6hNWqckxrr3GQGvWJIsVW2HFsMGuEtM5kB5GBhHbk43/7ldKIuEpzRCWzzId4D7uPftcFTWBW
	1Bb7tqNWjdPJe9RmPJyZwG+6aEN0O8fAJCOp6vnycxrErI7+9SljTU26Qk5vy8hGVyFTOzl08W5
	w7z6QzO1zn
X-Received: by 2002:a05:7022:f50f:b0:18d:9eec:e0be with SMTP id a92af1059eb24-1a6c9cda82bmr3203070c88.2.1793189928647;
        Wed, 28 Oct 2026 05:18:48 -0700 (PDT)
X-Received: by 2002:a05:7022:f50f:b0:18d:9eec:e0be with SMTP id a92af1059eb24-1a6c9cda82bmr3203036c88.2.1793189928006;
        Wed, 28 Oct 2026 05:18:48 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a7549528ebsm5056143c88.0.2026.10.28.05.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:18:47 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: talos-lyra-evk: fix sdhc_2 vqmmc-supply for UHS-I mode
Date: Wed, 28 Oct 2026 17:48:40 +0530
Message-Id: <20261028121840.3111281-1-monish.chunara@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: IY4gbk1-kSSOcZPKdZuW6-zYkMw9J-uV
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae1e829 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GflR9JRM7eMrpslxb7IA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0OCBTYWx0ZWRfX+q8ty4bcBFnQ
 gYy5YIfN/gyKoa9kKRz904Lsumd84pPbgnD0c03qj9Ggch43TRNzoiALgWCKJ+qzBqSVLOHfu2E
 4hWFvYR/aRhwUREn6Ml/hEsNaUTEsx8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0OCBTYWx0ZWRfX2Fts1b6Ve/A+
 1I9gT7XGGZMmWF3hXzRcZv/AxmDHxDhXWjjkfLHpdNb47+McIKptwNbvgr3vy/sEY4aAg1GGgM0
 Jo+SZ34yfm+DHhBE1krvCPUK05HDvfJfWSxVLf9PHn1CZz7WnFrEmGZjB6mWKtvxsuHpoovJFt7
 WJ7nMpgLunrQHQ6uA2vt08QfKQLewZo9hrOym2KaUtdZtmkN8eRshoJNHjo7MIaytqQ00hpmx62
 So7rnGvsCecvESkSBdHdIVictW9se/NfkddpALTx2qqC5jvL4FzP1OVsI1B3wwOUwse6cHF/PFt
 5Irw9temQVdYPM3dHSpwHOIi/huIJsx+3ps/HrFQBYWCEr/SsfDNqH9yG9W+eykc7WIqNgouYjq
 CXuqJndRhcgUpor5NJ+9iSJEgHMEcp8HkDoW8ThtmUedro4+YWiR7dO/4s6+1bKTQjdKiPwu2Zs
 xESAF+9wlei03Grr1kw==
X-Proofpoint-GUID: IY4gbk1-kSSOcZPKdZuW6-zYkMw9J-uV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280048

SD card is detected as SDHS instead of UHS-I because sdhc_2 was
configured with vreg_s4a as vqmmc-supply, which cannot switch between
1.8V and 3.3V.

Switch vqmmc-supply to vreg_l2a and update its voltage range to
1800000-2960000 uV to enable proper UHS-I signaling.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

This patch depends on base series -
https://lore.kernel.org/all/20261027-talos-lyra-evk-v2-v3-2-658fd5a7ec99@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
index 7d9a08471906..65a2ca78106d 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
@@ -57,8 +57,8 @@ vreg_l1a: ldo1 {
 
 		vreg_l2a: ldo2 {
 			regulator-name = "vreg_l2a";
-			regulator-min-microvolt = <1650000>;
-			regulator-max-microvolt = <3100000>;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-allow-set-load;
 			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
@@ -224,7 +224,7 @@ &sdhc_2 {
 	bus-width = <4>;
 	cd-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&vreg_l10a>;
-	vqmmc-supply = <&vreg_s4a>;
+	vqmmc-supply = <&vreg_l2a>;
 
 	status = "okay";
 };
-- 
2.34.1

