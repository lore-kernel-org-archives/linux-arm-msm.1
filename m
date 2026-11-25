Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594869;
	b=FtyIEA8G7FmQ3PeRE8CJkgoSgIzXdRWS7o80Tf94s0OW76Vg9f3AMJE8w/m54P2hjr3A
	 2P4fNA/DLgH27uP1kYbjgomiXQC25eNFMwsgh7Cz9TquMi4j/jtxlAysHqofr4TokpKCv
	 x8mCe2ozPTPe6O0yE8gNJv+h1eEISaVPmvHiNNjU6smQscaHHnlCS4D7ayNzFslTYTtu7
	 YHmtAr2SdJJdKLfmcvBpU8FqIroelv43ZHePTYM5ls66BP+k9E6nmMS/eaLzxDNLHv7s2
	 nhIl0iM204GYfdigIlykoAoqCvXSrNniUM7EA6t/Nu2fm2ULOjerlna8rE+V3otgdEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594869;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5D+7sgYJK+Ed/CDX37QAjEDz9e3h1Mv0os9TryKudp4=;
	b=idno14IeBg2lsuVOqbIoC4a7ePOxxz8jHX0AwcjTudfoRUHHMv9Z/pglXp57W/EhboBP
	 TKM4ErXa8QxAqSJl+oYEzcCBd/fqblrXwkzXF0z9Qvpq/BuRRufil5pcsrya43ytBpd1j
	 W+M271YcWs462Fu5DqD5jAXFlSsI34AmPGCNaz+FuIZ04l1Sfl4Ru3sX+yiriR35H0X3Y
	 FksA1w/KITDRvPx7z5XXrMkrot0QghSanu1eE5w8EZcodlfQl0K0eMWBTJVCIpKKyV6vv
	 2Cg+tScehxEzcOpd3q9PvU3XgTy2V8hu1P1VDe+53yR/98yLdxCftKoLpHXFa1BvqUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V46pMQV6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IYV44yOh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A6E606A684
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8A6E606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V46pMQV6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IYV44yOh
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68cL83142871
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5D+7sgYJK+Ed/CDX37QAjEDz9e3h1Mv0os9
	TryKudp4=; b=V46pMQV6qf3NI5zwwU1byyW6wNAbukobWxMV0vb/Ub/VC1j3VXG
	YoR9ii2diyFewP8Kv29R7LvJbjIZJ1wiyyvsjpZbZTqEXOg77Tu3chq3K/mm0jjD
	XnH9U+EJ+M/SfGONoVjzEa+++BKXj7sBiXWg8s3iiGoFLgYvoZ1FnFeK/S3qg9Lm
	Cc5xXMvji9rhtPONDIqBl+ntR7EDRgzawtdkn8tpqTXLM4JnQZTD7w1lQX5zlsTF
	fUitqcXRaUiTYOfW1FHSDfSpT/IAYQiM+OdL4bhs7yDupr7ka0ERUicU0tlwCgTq
	DdaIQQ3qjslSmo0CdVTmX0hoIl96aFEcTmw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc29qjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:21:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2edd25534afso46532025ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795594866; x=1796199666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5D+7sgYJK+Ed/CDX37QAjEDz9e3h1Mv0os9TryKudp4=;
        b=IYV44yOhjucimaZmiN0WpchONTZYZj//niCiEnx6tjdzXwxTNRJcztqOmwzwHYBA1B
         Rsl9xcN5VIanY9uTJ5EGlIXv9PT7kW+TXeDva2278WC7W8aXMxr9Wx6zlK2Kt0oSt/Sw
         z6qa7QPu0KW34tOn5sbnD8Sk5pxkV49IJyLKtYo+mr9j/AoEH2Z8Cuo3VWFrVnK9ONfh
         yvTKtYKRNSQtSMiW+N5ymnuZJqeUHfzImLMnNgODNWwhbHtJudEyM2Idt9xtj1ZAxr4I
         pNoOhF8uZR7J6OCOLiDMnz+z8vvvh+9xrK621WNtarSXh7ubHoV5bHJa+XBqNIgZBaGO
         MF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594866; x=1796199666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5D+7sgYJK+Ed/CDX37QAjEDz9e3h1Mv0os9TryKudp4=;
        b=ypCPNAH8nM4P8SQ0MNSTlWqnC8zUG/5qEPINCkrO6VwUyNC0NulNXC7wPXOfdL9n0I
         sCfzrRRwQOTQ1s8+u0ijnzH68iGZdgQ2BM4Qgy2RX2lobCRdxMkqJJ4mfvezlS65/NVd
         zVkjn63+9HG6ObLxDQC1BAnLbnM//+drrNyfTwmRgqp+/idz6DF8GA027xG8G194vYw+
         H0RDBpgzieCADtHF7btOa9bpOJ/Dy446Qx2eACfblcxeZZow2iA1vqnZrcplfhTmRbRa
         c0TPza1KFemUNuZ6fxJ3FZm/bXp1wQdTESqDN9GdUB2OsTQBhBK0WDtV+u2IZCnrcPJN
         OXHw==
X-Gm-Message-State: APuU4Z9x4hT0c3D+R4toPY4tQdtvk1nxz/RDWreTCI4KVkmtHdZJrTyc
	0Ym5ZWd3SlWAY/wUfCmcCHnlhlyx7Mt0Ve9u+adEDFE/ypFsMwVCunTrVLi4JFJmlnKPz1VBPQB
	U/stDFNOrt/SA2ioBWj3o6SOFAk0fIuR7uJ2w9Yk5qh8uxRn9d6vbuN2Tw/cU0semoZbF
X-Gm-Gg: AZFdTZdLe/NjLV72Dlqy3Quk6LvqHwjoAcJ0ERsh419N3TVqYsdEFO2CfHfU/dBoFSx
	/1LRX0E2tsLp+KYRYdcKiO+5ZOppDgI/n6htqwrTd3sYMR5ZS7oe3fzn96OmOUrmUIqJWSJM3vV
	iF8ALadUd0gMYZpecyc6eMEQq67NwrCsfEJdjhdMAtl8Szk75s8GkD5BtB/WSGCA6ESdCE/xFBD
	NC2JTqH0pCGnTzDPBkLze7/hIfk3ocNootDaoo69bEf3skKQkDSsWiHfu5wFpe/qDUuVv0GZiDV
	RGLVkuDTBYonm5htqK5sC2mWWfx2ZcKbfpoAHBuiRYCXl9j4iy3CNNgKUg3tidvBQOXD54CTxWX
	Mz7XSfi1W+/LoiUcMjA5qkBgjTMnDmWvzjIXLZjPwgIdurmqDxWCIOp2maw4+VL6Dir2Gq51bqg
	/61PLaPqtE
X-Received: by 2002:a17:902:f602:b0:2df:90d4:7847 with SMTP id d9443c01a7336-2f03f1bf176mr169546475ad.35.1795594865669;
        Wed, 25 Nov 2026 00:21:05 -0800 (PST)
X-Received: by 2002:a17:902:f602:b0:2df:90d4:7847 with SMTP id d9443c01a7336-2f03f1bf176mr169546235ad.35.1795594865216;
        Wed, 25 Nov 2026 00:21:05 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0457fd68dsm73135825ad.39.2026.11.25.00.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:21:04 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        shiraz.hashim@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
Subject: [PATCH V2 0/3] arm64: dts: qcom: lemans-evk: Update SDHC storage support via overlays
Date: Wed, 25 Nov 2026 13:50:52 +0530
Message-Id: <20261125082055.488583-1-monish.chunara@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b069a72 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-vzI1l0uJeKZRBTzIWUA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 0dgVXueS8JJZ92Nw5etUcf42IF9u56Sb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX71qVxvRbOTyp
 FapjwPsUo5hStUwY19HP+7NaK6s0/kTzQo1oygoXlS/SoZ08skqJtH0PelNpfQMkC9+njPhtQfx
 ez2KJmO1EJDUwy9sYlwfUdmiRqB0RIw0kr+caGNXWxXQbL9Te/x5GBVhJ+w2ld4ASsmrBqoDe0z
 n5vOnGFKCDSRL/yNKEvOJYFiowpALbbCYVrJsDLQQ3HB5LxvZ4HCqY4l7V84r7vaNhOU41y459N
 ACRTHwop6otKixiWnbhzT0RLxDeqU/CkfZtKX4FrhoTsmVFjgjbV3qZkTQR0n+DcHD6UJC41NO1
 33/PWgAOQ+OSvrf2KUTw3q1418a36sraEKm3qCouIEs2tEZayiG/THp7W7xAQ5TE9+WI8C2iUsQ
 aZlKkcFXoDUXqvB8+McjqlQn97lynrRMB/oFiDG6wD+QHE5zx0vvINZHige25MUOn2vszB67Q+U
 APvo4pDfDgYIb/8F43g==
X-Proofpoint-ORIG-GUID: 0dgVXueS8JJZ92Nw5etUcf42IF9u56Sb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX/UyHgZyj2G+I
 79DoEPO4B8wRiCBRyUfl1zV4rksBmML/m5XuO0mOaFoHmqeP3FURxWtdb59H9/5CSxajCdlM+C2
 6fII9piEEyipC3YgQJfISXx+5CDmD94=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250033

This is the v2 of the series that updates the device tree configuration
for the LeMans EVK board to support dynamic selection between SD card
and eMMC storage.

The LeMans EVK hardware supports either an SD card or eMMC, but the
interfaces are mutually exclusive as they share the same controller and
resources. Previously, SD card support was hardcoded in the main device
tree, preventing easy switching to eMMC.

This series refactors the SDHC configuration by:

1. Moving the existing SD card configuration into a dedicated overlay.
2. Adding a new overlay to support eMMC.
3. Updating the common SDHC node in the SoC dtsi to include necessary
resources (clocks, register ranges) required by the eMMC configuration.

This allows the bootloader to apply the appropriate overlay based on the
desired storage medium.

Changes in v2:
- Propagate Reviewed-by tags (Konrad)
- Segregate the SoC file changes for eMMC command queue feature as a
  separate patch (Konrad)
- Also update the corresponding resources in LeMans Embedded specific
  DT
- Rectify the register address format (Konrad, sashiko-bot)
- Link to v1: https://lore.kernel.org/all/20260826113206.488991-1-monish.chunara@oss.qualcomm.com/

Monish Chunara (3):
  arm64: dts: qcom: lemans-evk: Move SD card support to overlay
  arm64: dts: qcom: lemans: Add CQE register region for SDHC
  arm64: dts: qcom: lemans-evk: Add SDHCI support for eMMC via overlay

 arch/arm64/boot/dts/qcom/Makefile             |  6 ++
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi |  6 +-
 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso | 64 +++++++++++++++++++
 .../boot/dts/qcom/lemans-evk-sd-card.dtso     | 25 ++++++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       | 16 -----
 arch/arm64/boot/dts/qcom/lemans.dtsi          |  4 +-
 6 files changed, 102 insertions(+), 19 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso

-- 
2.34.1

