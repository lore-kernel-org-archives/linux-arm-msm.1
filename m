Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511611;
	b=f5MnsY/diPBB/Bm93eSoT6YhBgRcsSCy/O+d/CYWV6BV+y5korfjiFw5ql7+GmI/4uqN
	 qHlJ8PxiGTQ2R2kqDbHhpxrI7NYoEmeSxHtT49HXk+PNHaWTWN6eO3B/3B9XLnNxALZxX
	 vX1clH/xrzUbXY1h59bweizLhua8IE8av9wOnTAhZFpDl4pX3EeoMmFsgk9d1kT7P3KIm
	 Cb8LKM81EkZ9g9Ouwiohg/q2XlKErPke6MHCCefi3G3uPPv97OuR+2+msKNqfrmfEB6RP
	 hh5x555rDWk0Sllkp2INB6XM/Z7rBIukjpLO1F+qCVpPj3C0GeEcxtw73B5LXC5VCbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511611;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PorUwiX90p308WI3naAWjv0o1LYB7za/YPyaLIfmyi4=;
	b=JNrl+6FUpdWLEPu8v9OGKxjBocAGWfxOOCAkQMMz20deWwJ1327f0TnCh1aPB5Wx3av+
	 UXkeHZtMiqdSNjZJW7LmagNVHRrKlVkxlf0G2liNTkTjuctR4GXhLw+4Nx1Js6MPmFYuO
	 HtqN7cJElQNs29PHWpYfqWS2e50IEHBd74GqZve63snpxZZHO7TYhze2sNL1vvaAfQZy1
	 exxX/4Hh2wmIEMlSqcn6j2BWojIiAysJ1DxVCONYzmoGp+OxnAYEzNqatL56ZYZ4XiDOJ
	 /r5r97UO/4YlBCHMsj959zwVWNZH3R4vIqrULBXCGr8jyIfCBFngpIR6+PHshL6/nDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RCK6r2LO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="M87/BK9y";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE3C606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FE3C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RCK6r2LO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M87/BK9y
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8SpPX3851149
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PorUwiX90p308WI3naAWjv
	0o1LYB7za/YPyaLIfmyi4=; b=RCK6r2LOI9AyYFjrv7TdZ/xWyLXUxrWOh2ox4q
	4FD/UogyJP66210i7nQCQE5DR+Pd7eRpe0pvSvO3W+PdDSK3tjypitpFPjsNPJJs
	JQNazvMiWduLT2VCaxtII1swhD5xALAF+YQNInDM1HU+5VOWjZq1/r1q8OLz0BCt
	mROSoYEq/8UMhTJhVvg4NgTwBUpIfZuUcqKAJ2KvNNhz4a1h6bgxh3YGP1rwLAw7
	AnP0bc54sM579FEnzfYGa5RmjRrIGn65g6mVdKSxbWkUxoyUSp1OzzvcKiaho//U
	FZ7noZRCG1n/uR4u7iPS2mNwZHWyh3Ree32MizZ3nI2d8Fgg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb1w4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:13:29 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3869865a304so3322384eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 01:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795511609; x=1796116409; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PorUwiX90p308WI3naAWjv0o1LYB7za/YPyaLIfmyi4=;
        b=M87/BK9yYyrqpNWV8xqTRawKmHtuJ0meC/qFzSrNV/TJSO75kjDdlhIHuNElTXHusb
         Tp3tpqxOR73VLX2SnUH3J5Tf4hJB0MljV5/Lcq1s3gH44UC+KoaLL0yC/h1MabxJD/Hu
         8fganaoXLSial2Rbp3xxU9xrztPTFRmE1M23aTLqlyq70kai+ad/kPXOYkqEdvVZptSk
         iv4D3n3r4AKp6D/WsP1bT6cNclO8c44rpNCfxiLdNLHsyO+2HkH0kZlSgicsoPrcw6AM
         6bUtni1rFU6BaunhDTHEZs4CiRMUGc5Kn/no8sHVhU/oeIddK1TpE6CiS9o55aWDam0T
         yGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795511609; x=1796116409;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PorUwiX90p308WI3naAWjv0o1LYB7za/YPyaLIfmyi4=;
        b=Ilr1R7uvuAmEI8pmbeD2kOHS9an/SXmzThUU4DannBPXTVuxTE3nPTKG72l6XTiRgS
         11kiQmuzblEM8+NAIhFxGEQRpFM+RgIAeR0WLSbweyfX1/AsC4f0biZsjnvXb3zzeAdO
         8skk7VOx33JK/PBfWQ62irThtr889ISMP/610gb3RYq94u8EhoatZICkmYL0Mp1EOgXM
         ek83uXss7X+NJFa6Gzh9pnmLQqz1EP99hquUC0If98IJ4MOecWONiKmpLzETVWomNS8U
         mLgQxWjUFBO7bV0Qhcan36DbaoiugE0tClEr4KjFgMU26IHzdvlelN7d+Ol1M4Phx+yr
         Le/g==
X-Gm-Message-State: APuU4Z/XeKv305miDZj5Yin7AJ9VlbL9ciJ80j3LVuYRXnT4daB3DppC
	Rud+NEXn8jcquQEu6jU1DBsaW9raWqGuzsJiFpwSoujwRvBiSNccPS+XkgVX8GXxOhKDHiYA82v
	hj6GmvpbPW53xgpWprb+OPFFK0jSj/V4agh9uJahFBgXBQyv5/0nToHlJmRik5LNOYzg8
X-Gm-Gg: AZFdTZdtGXO+9Nb+1coAfX/cFx5opO95asP4g6bjeg/RECMp0aWpiV0VRllFqP0nhON
	ifxS+6kUrkUDjhKUEaxPUQA9fWgXtZiiAWdM4KyftqgbQbARiX9nRAuB8xcKbl7by5vr66vHDbE
	9p3Yx5E4vpCzv/S9UeB7wWk77+rn+CYeEgX/vxUTJGUG7qt7ytkPfCX9p26t3Bbu0yollsMhcgg
	H9P/5Y6JQruFrhYhQAefIPgn4w7kIBQR+teORu1OsfZO+5OqA8+4u0rmp4Kl7JNHHez66xdp8aQ
	beMOMliR3o0TWq6zHw0xvZ/FYz6w57EWHG2GFEkXzmeJYE971DpNRCTJ+QG+8r70jCDSPLAiIJJ
	g4bYenVdwBJbcPIGV3bL05+PAom8yxFcDeSh6JVuZNv2+MmlLJmygYF66NSMTlTLoCj0bkVx6tw
	0o0TmAjY2AuJM=
X-Received: by 2002:a05:7300:26a2:b0:386:a415:5436 with SMTP id 5a478bee46e88-386a4155a49mr8420241eec.0.1795511608796;
        Tue, 24 Nov 2026 01:13:28 -0800 (PST)
X-Received: by 2002:a05:7300:26a2:b0:386:a415:5436 with SMTP id 5a478bee46e88-386a4155a49mr8420221eec.0.1795511608303;
        Tue, 24 Nov 2026 01:13:28 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm75674312eec.3.2026.11.24.01.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:13:27 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:43:21 +0530
Subject: [PATCH v2] arm64: dts: qcom: lemans: Enable the Inline Crypto
 Engine for SDHC
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
Message-Id: <20261124-enable-ice-sdhc-for-lemans-v2-1-0bfa9ed6b4bb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADBVBWsC/1WNwQ6CMBBEf4Xs2RJaQV1P/ofhUMoiTaDVrhIN4
 d9diRcyySRvDm9mYEqeGM7ZDIkmzz4GAbPLwPU23Ej5VhhMYQ5am1JRsM0gqyPFbe9UF5MaaLS
 B1RFLbCqDJ9wjiOCeqPPvVX6thXvPz5g+69ekf+tfW+BW6zbaSStJZ6qWGiJb4iUy54+XHVwcx
 1wK6mVZvgIk2T7LAAAA
X-Change-ID: 20261124-enable-ice-sdhc-for-lemans-7949b5298939
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b055539 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aDrDLeE5ssBeLXbAN28A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: nCZzuA83KBDGr9_Ma8iRHdh5uSANtYmz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNSBTYWx0ZWRfXzRh52KPkZIrA
 +2wsXtkCLyj2f1F3xaz+9CrzqGNERLaKFzdKohEJhlkgMX0dGXRm1tiMXLIOplS2ATJh3OUaldl
 3OE758zchF77uAykaxxt4KQLe46YYhc=
X-Proofpoint-GUID: nCZzuA83KBDGr9_Ma8iRHdh5uSANtYmz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNSBTYWx0ZWRfX1OxdqttDJpdu
 22WrsQUAjFCHM6dB8SZkgLro9sEzRBVcoEuVDJt46dZtACy6a+NJ7iam6crP90PWDR44ryURm1h
 GxhRJJKkPAriYyk7T8uwBahcu9d4R1QSSp75/4mRa6GCHB/k61sDfyAEOSEFuGd15Z8Au4lCWmy
 ysFCAVl+5ewX7Yoa4w5RF/43tOLnblxrpxMH2uHn6RKrCRHXgNDN1DsegGJWzUhYjYbi4KPwzDp
 8EgIcKj87KtWeeVN0TYMi90ZlaR9OJda4OIJwZwQQDmOTW9U4W5ia9YTYfjC4gOqAWVXcisXyuh
 vR1McGnXiolrwXVWqRaMW/Y08M9PPgi30Q6xmBJBHPT13awP8mmTmxjF7z5jYwmgaubOmgz2UEl
 qmfzsegAfvQ8g+tdl0P4/DdGJc5ZRuZI7JxbCbaHjNHN9arrPiCPpSDobXhpxcSJm1OuTlf9Ulw
 jzqq9x01diGSC3aOmuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240035

Add an ICE node to LeMans SoC description and enable it by adding a
phandle to the SDHC node.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
This patchseries enables Inline Crypto Engine for LeMans platform
for SDHC storage.

Testing:
* dtbs_check.
* Validated on LeMans-evk with custom Mezzanine board for SDHC support.

Dependencies
============

[1] Enable ICE clock scaling
    https://lore.kernel.org/all/20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com/
---
Changes in v2:
- Rebase ICE SDHC on latest tip.
- Rename ice_mmc_opp_table to sdhc_ice_opp_table.
- Link to v1: https://lore.kernel.org/r/20261109-enable-ice-sdcc-for-lemans-v1-1-1f25debeea49@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 29 +++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
index 0be39bb9de1e1cdbb7d67a992172861a5a10a05a..4cb3af416a3fccb094ecc3022aa937669a8d4ce6 100644
--- a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
@@ -1651,6 +1651,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 	power-domains = <&rpmhpd SA8775P_CX>;
 	resets = <&gcc GCC_SDCC1_BCR>;
 
+	qcom,ice = <&sdhc_ice>;
+
 	sdhc_opp_table: opp-table {
 		compatible = "operating-points-v2";
 
@@ -1849,6 +1851,33 @@ lpass_ag_noc: interconnect@3c40000 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	sdhc_ice: crypto@87c8000 {
+		compatible = "qcom,sa8775p-inline-crypto-engine",
+			     "qcom,inline-crypto-engine";
+		reg = <0x0 0x087c8000 0x0 0x18000>;
+		clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+			 <&gcc GCC_SDCC1_AHB_CLK>;
+		clock-names = "core",
+			      "iface";
+		power-domains = <&rpmhpd SA8775P_CX>;
+
+		operating-points-v2 = <&sdhc_ice_opp_table>;
+
+		sdhc_ice_opp_table: opp-table {
+			compatible = "operating-points-v2";
+
+			opp-150000000 {
+				opp-hz = /bits/ 64 <150000000>;
+				required-opps = <&rpmhpd_opp_svs_l1>;
+			};
+
+			opp-300000000 {
+				opp-hz = /bits/ 64 <300000000>;
+				required-opps = <&rpmhpd_opp_nom>;
+			};
+		};
+	};
+
 	usb_0_hsphy: phy@88e4000 {
 		compatible = "qcom,sa8775p-usb-hs-phy",
 			     "qcom,usb-snps-hs-5nm-phy";

---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261124-enable-ice-sdhc-for-lemans-7949b5298939

Best regards,
-- 
Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

