Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB8841F37F
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073784; cv=none; b=kGk4Hv9fFfmmYGSu6chfHPRShojqsDkp4O5u929MGxNIxj3gTQwi0DSfm99yHKTAkUyqYz3bnGg2NUstGUjST/lE07W1YTUym3JE7rh/na8/T9MBDfRF29d/ODPkodfCWjF4Q1cd5SrrYmN4l1kp9uPBIv10ksiptqkqQgaeC+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073784; c=relaxed/simple;
	bh=HZ/8zzEzCk4QoAnviOA0mONaVqcL84QGBpPGDjnH5+Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bIeOJMZiJvYh2gYQdZfiBcz7/PflW0r7XDI+BsvYLssEs615DxT6eA5DmudDbFKqSP1s3otmPACjFrJiGYOjfAADNRAAu5k2OLI4sMchfD9SYtsNSJeFalU+KO6OrIw9Hxk8t4c6lBmqZ5zCv2OxDZy5OyBBvTgHlvQfh/ag6Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L4HeP6LW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tf7Cd+2i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L4HeP6LW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tf7Cd+2i"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M8lE1R3675278
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jaBxcazFz0PPiUEsWBeW/e
	srkQg0kJx7mpugkd7tDGs=; b=L4HeP6LW/1pp4Qj8u9aWLDS2O+Mfxah/kXzjTl
	OdMxuXmEcdaRHvTqJusJTtXOy3OOWwht45REm6glIdywCfJKP2Ad2EftVUOvxcnx
	J8saHc9PSXJa0n37dkfNI0U8Tk7OXQgdRtbBfRiRNaD5pmWSsQ6U+pSOIY58j1IF
	Vj7MmTsYvzbRlFkd9OlKlOERd6Ys1OG4/K6U7mGhYZBADPaP2aUrEEcPv3geTxlK
	Qsh6DNkv7kdQakNuhfDqVm884t6uNOvOn5fSiGTmSIs/DTL2GG5sa+w5Uq3+WIUQ
	Xdb4u4ssOka6IwM4/M9DCIVonaeDuq+ik7xRfYH6mchn9FqA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5srsm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:43:01 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc44d708055so1891110a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790073781; x=1790678581; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jaBxcazFz0PPiUEsWBeW/esrkQg0kJx7mpugkd7tDGs=;
        b=Tf7Cd+2igXtNXJl6KpCSe91h1uI84ZAQf6mzEptkpu+UF9meL2fCR9X/omxJ54UOKB
         xanjBh5fNrETxm4Aj3nwQp5Rn0R6c4d5f9Hp77lFW6O48mRsun8rFubwpCn40FXLwlC8
         EPlEtPlo4dvXlfmVoWqlnCiZPv1ov434qydYeuf0j/3UNF4QTw/PwM6tliUeoy+95MBS
         JwlNDDie2jM18M5NLxmvXHW3GqYA7wMInP7oqxkapPnw1dnChJxPxFGp87MuPq1YXJYq
         ptZOFukW2cdxuJbgYYiEfBzPu9S5ypyyUwTOhHR9LsuEXKzUWFFc1hWYtF6O10KIVes8
         bGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790073781; x=1790678581;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jaBxcazFz0PPiUEsWBeW/esrkQg0kJx7mpugkd7tDGs=;
        b=m7cxdmkvy3AlvWDxqDfhUmwXimhoI9eeXssLD9sImeKD4PyI/fTZdim8vif8ztIZDP
         9SPVu0X+NLQUiXXVUs/eDviddUyi/9j+y/vE8LVFRhF/iHxf4CHkBqrq39v3C0zXXhgx
         wMQyJdbNynTtrfcPkrJPqa2Tlc6HOrmLt30ACLeyFiIKu1iYf1OBDR5ZzwJ79YDc9QPR
         xuVfA1LHiwMHGiO4zEa4aOFEegBM8bjfe7qYNs+UwrixvSx4ub1IFZiGl00orpNAVsKT
         otJesqw0IEkxw6nvnDW91TcZxTPQ6OnmBfcwpqlkimHnlVx9XhDvSsJnzluN/lRJSSMD
         t0kQ==
X-Forwarded-Encrypted: i=1; AKwUvBzD8C+G3w6K6xmXE88tyFnueDf3GCBR5D5vb2kNAKb+wn0r4ZOa80cyvNLUCAS6JUBnfHtPVYG7MA7j0g4I@vger.kernel.org
X-Gm-Message-State: AFuF++mdJRvCGn4XSmAAgeUFkM720gF5/kPbPk9vCGzinkaSd8OPSbYO
	MRVRzQI5AxSFAILiq+rxSLEugrTJ0Cd2M7k4fPoNpCDvVrJZHRih8a3VIRlG2nJLmcwGSTg4aWC
	NdhHxpRhuM9w+WAawOlwQ3PMXXZL54u5eNOYlDTjFWn8ru4Z/LNGgz02FGj7ldcuPx51y
X-Gm-Gg: AYBFou3mwxpGuYmIGvHmw43/6hkDFjFa1mX4zK++aEsTqcQpVckaaU8kTFXd/1dLbM3
	MjqDMhi4SuCZCBF5NQCkmNsD4K2zrGwuewGCDtbDW53Wnup16ietLLc92ikbwjKV819/jGx8Igp
	qJaaz9JRa6JbN/upvPQJciJ1jD1cCQkz3h3lSTBFX7QKGQDD8mWpoGFkqAne3qGNFTbRKHHPz0R
	z0oFR5wQHdYsySKP6YTUhyFdCPR46RnbTwgJ2LOMuKY07N6Q7FaeAiSA/Xo4xpMCbCuFN4jUrto
	Q+HfQlZs4hcyIkABxNwjSSub9hbQDhnUBXy3tDKpDOwVVsZiiUv6OrtjSm2wDTe51TFfzOyRD4r
	f04nctIdal349bCbIcnQ8D5Rl8gcTluk=
X-Received: by 2002:a05:6a20:7283:b0:3dd:85aa:452f with SMTP id adf61e73a8af0-3ddec72edabmr851866637.33.1790073780789;
        Tue, 22 Sep 2026 03:43:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:7283:b0:3dd:85aa:452f with SMTP id adf61e73a8af0-3ddec72edabmr851833637.33.1790073780354;
        Tue, 22 Sep 2026 03:43:00 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f29d8762sm4404015c88.5.2026.09.22.03.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:42:59 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: Add eDP display overlays for
 hamoa and purwa IoT EVKs
Date: Tue, 22 Sep 2026 16:12:50 +0530
Message-Id: <20260922-edp_overlay_for-next-v3-0-2758d46ee174@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKpbsmoC/yXMQQ6CMBBG4auQWdukGRXUqxhDsP2rY0xLpkgwh
 LtbYfkt3pspQwWZLtVMilGypFiw31Xknl18wIgvJrZc2zOzge/bNELf3bcNSU3ENBg++aNtcLD
 BgUraK4JM6/Z625w/9xfc8H/RsvwArrO4L3gAAAA=
X-Change-ID: 20260922-edp_overlay_for-next-28d507e40fce
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vishnu.saini@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790073776; l=2070;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=HZ/8zzEzCk4QoAnviOA0mONaVqcL84QGBpPGDjnH5+Y=;
 b=f+HWO0YlFe8s2bNfhd7ZB/TGsIbJW1DiAXCDV6KJaI4uLbku1Q1s7hoNqcCXJC8iH0Df04kx3
 9MGQsYl1SUdCRffvI5NeO3Ak/Q+xozuqYIc/FBKX9veDVOtpRWC1OCO
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-GUID: F_SF1K-AIUdQeZQlbgYp1PUEp8KtPKPx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1NCBTYWx0ZWRfX9Vcj2vN4t+Vx
 h8sIOqoRX1zBcb5n9xZ0nukS5UBumZFJVx82nwbMvvStRhsBEMobhvodwXqrwyURrL/zY3lgIcm
 IP0O0LyiDQteVPplJIofPFuRW831Mq4=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab25bb5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AOooBFONsbaObJAzweMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: F_SF1K-AIUdQeZQlbgYp1PUEp8KtPKPx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1NCBTYWx0ZWRfX298TvgjFKCWL
 uiPnc3n5cmX23hKoFNpDaxCBKMqPywRvBXdzk8VFZgrPqUPYlsCkDVewii7WV3K9XK0/m7QzURJ
 AGc60lrMou5xS/G2i1aVW8cG8XM1k77RPDBN1v5raUZ9AyoIJULsLQK4hGdmUl46RVqUW4QtG20
 Qysaj8MXY74VKEN1FzSBh9yGw37+UPWCNcgWkxEta6pZCTuA/M0kxbYjC8qHPnf5cJo/zMAHNNQ
 e9XSYorFUPB4FS9EBN5ukcVKfFuKICZi8ZGMXl6PMeORNoQZ0CsC5z612EEEpBIlRzZEHQXtVEf
 7px5LJdhBZ4EKPakdIGJM4rPtXzf/0bi85orOTtCRk49DHi5rghJXlx8gsTA1D16BPhQwuqRnRF
 1zoo0h22GwKdCOUHeOT9CT6Gy6lFPO1yqRxNR4VM2o6SdlB3W/bjKNPgUCJ9PvUfdf4c8naWyOn
 B6Kyt+k14JpYpMwc45g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220154

Both Hamoa and Purwa IoT EVKs are available in headed and headless
variants. The headed variants use an eDP display panel connected via
the DP3 controller, while the headless variants do not include a
display.

The existing DT causes the eDP-panel driver to probe an unavailable
panel, resulting in AUX probe timeouts and missing display modes.
Userspace then attempts display commits through the eDP connector,
causing repeated DPU vblank, frame-done, and IRQ timeout errors.

Move the eDP-specific nodes out of the base DTS files into separate
DTBO overlays for each board. This allows the base DTBs to be used
as-is for headless variants, while the composite DTBs enable eDP
support on headed variants.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
Changes in v3:
- Rebased on the latest for-next.
- Link to v2:
  https://lore.kernel.org/all/20260818-edp_overlay_for-next-v2-0-bd811d378fb7@oss.qualcomm.com/

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Anand Tiwari (2):
      arm64: dts: qcom: hamoa-iot-evk: Add eDP display overlay
      arm64: dts: qcom: purwa-iot-evk: Add eDP display overlay

 arch/arm64/boot/dts/qcom/Makefile               |   6 ++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso | 124 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts      | 107 --------------------
 arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso | 124 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts      | 107 --------------------
 5 files changed, 254 insertions(+), 214 deletions(-)
---
base-commit: 43d09481a91466a7388cbffc6de3b1df8e5aa35b
change-id: 20260922-edp_overlay_for-next-28d507e40fce

Best regards,
--  
Anand Tiwari <anand.tiwari@oss.qualcomm.com>

