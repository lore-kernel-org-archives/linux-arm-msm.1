Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1CE38C407
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 06:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788850393; cv=none; b=pkO9ZnWkfY5tsp/YxRerDWCIwkAlLYSbgHXjfD9x7SvAdCucaVYyaA/15ZnOMTuepVY4e0+4YmJ1nZrbHsC+Qn4r4I5zUiThdN0rZEcCmVhBqkEWwMWtXd7gRJFPOjkwxPIWeMOrLx5xpufBGijXW1juzFgyy+IYMIP3QDCuvQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788850393; c=relaxed/simple;
	bh=/rHP3l7Gq28erKII9JbPiB+PWMjwfT4NtvvwFQeB180=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fJOIIGrSPuYx1JqFrgyJK4xkqlOfw2VjNW8Pxxv5QpJTLYjYwBV23R31Qi3cWjIX5pcvbAIJOXEayA1K7GdsF4Qjn1mKbxstEmX3iWXceE3CTfy6m1BMB46LW63j+sz6w3nOFiDwY1lbg5bVfuQyOOdlSQuleUPztcd7xUotjkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GMUcJJ9U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JXjeU9g3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GMUcJJ9U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JXjeU9g3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886Lr8U2502531
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 06:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8u90eAf+GOGer9u+qAuP5b
	dr9jQFbofFPJyNttu8OIQ=; b=GMUcJJ9Usd5QgC8dmVdXyWj9vS/e9WBHaHvlHf
	mzui1t67GnqdeFrtCnBWeLdKoSiSjNtTbpujp/Ynqp5gcV0YC4vUdJe4WRfxGxvW
	ztrclTYprFN3WYrUDePpsb2fCaEOQCEJkBBlObzfpj8MAMSnF5QaBMvjQ6yYOKPI
	27MlXbNtS4OML3Gj37TeR3wcJTwIPIH/pA/ivT9rAC9qjZrIXPK81B9plVsn32fh
	mgalwnPQLqfxUl8oC6zo5uA02hLd46QsTTdUjemvjoVbXJ35Aavn5TcEZH9N+Knh
	RveDyKgid2btGIx9Uid5ZHDhB3AdRlui0r67bkaiObHkrnvQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcv7g60e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 06:53:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396901263b6so7768192a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 23:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788850390; x=1789455190; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8u90eAf+GOGer9u+qAuP5bdr9jQFbofFPJyNttu8OIQ=;
        b=JXjeU9g3g2hhf0umgwE3ZyB3HRLqHV9pw+RxOD6H9a2SZp9dlgWgjiLU3A4z54XjJM
         F8V5quwBfnxkxXhxrNzjBcM/cN2aaHasgrmsBbET8B3Lo5ruFIvGaSMnpKU/C76KUVy/
         8fhz34jk19tgXX3GRrctd5odVpPD6ZX1bpyzqXC/MEhnIZq5lEnQi6IjZc/0q96anh2d
         //q0X8EiLfwCnt0ezoCUK2PbCn4wSD+7mC3va4fA0P++kd7cH4nAYlEgNnqmwwWMRAq1
         pCAU1qBkLJvj2YBJcPXhtWh69tpFxtA5dmnKJ2Bh5OZ+LPRa55jsCIFXL8WxpPuZGJdL
         vR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788850390; x=1789455190;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8u90eAf+GOGer9u+qAuP5bdr9jQFbofFPJyNttu8OIQ=;
        b=NBHb872JLEL8VTuyiqQc/FnuDwOnAkJZ0h4InWY29PRz4OMfMjckkhTYAsCnq4O81e
         riEK2LERb91tNIE2hC6BsJpjJze8mP5phtOM1UhHAGZTlOXuxCO5DrN2tcHY95kSdys5
         eVq7ZTu6Ko3gdEpUD1cX4XLPUViLayge/HZmb/Qg+prPBXsAv8iL3EskL2SlN6zIbIgx
         xnkFOI0QDFjvVVdkVYeW8LPRoQjXEa3HZq0DbHx9mvJ7LND5h79Uk+bdQovVy6/cBbTK
         PiVFMfdG4pj5RiypYxJaQr2I+VeTfpFTlnHERA80u2mrXSNqQOMeDB29l2MMuVRXmWqU
         8JKw==
X-Forwarded-Encrypted: i=1; AKwUvBxlKyuc38fndAFZE+u5RpaNkAKD3Mc334H61w+YwpHh3UdM8XvlaSFdFIWYVIMqZ9z8KyFpL+2t2HRK1sEq@vger.kernel.org
X-Gm-Message-State: AFuF++lAqBw0xZ1wdLwcLSl+HxZkNTDq24ler08bts9lgTF1lSpmp/U8
	J7v/eeC3BpyIs6EcH/Mdsj7cXtx+4QIy7ENqaripKhCW1KJaD9a6jdQLBLand1O/WmZIAn56cWj
	lSG27C4OrGU6hY0+DqSlXJJcHNRaypK1pcKw1d+NyqCzt7XitVAdep7aGbXhHDosIItDF
X-Gm-Gg: AYBFou377URft6r0WMbPdsBxNU4Q65by4i+BnwGCLe+AZ3GFvSPxrncDxrqOacpzVU/
	C9HUJNV8JV41QkDUSZhpikhAx598PFc0gH189lx+iD74msG8NKBKGE3PMnt0LnxCWLezisygPUq
	xqIUiuI/IEaAOGN4i2KFiMSqXkKEuV9BXrH8iAcvJx3rO8Nd+zgEhoVexXoD3nv0tRG7+kF0evk
	/zCwtQm+VYLtZkr52/dilyjdpCU/OMqty+QMtoluRiCehE1ULsZ+MWMhhYtlCloedmk9J1PJOTV
	dSROJJ1ewBs6FuSeWU3R49UKe9EK9KpHAU2aGE9pPZuqbhATi6nbO4FIauABGCVzLiXAyUxKzCo
	d25gL9cdLBv+SLDfvPoXTTBkTVIX/QIa/YQ==
X-Received: by 2002:a17:90b:2ecd:b0:396:40e6:f631 with SMTP id 98e67ed59e1d1-39b2609f306mr46201436a91.3.1788850389929;
        Mon, 07 Sep 2026 23:53:09 -0700 (PDT)
X-Received: by 2002:a17:90b:2ecd:b0:396:40e6:f631 with SMTP id 98e67ed59e1d1-39b2609f306mr46201376a91.3.1788850389427;
        Mon, 07 Sep 2026 23:53:09 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm28231417c88.6.2026.09.07.23.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:53:08 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 12:23:01 +0530
Subject: [PATCH v4] arm64: dts: qcom: agatti: Add memory-region for audio
 PD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-agatti-audio-v4-1-b3db91d3fdec@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMywn2oC/3XMQQ6DIBCF4as0rItBEJCueo+mCxioklRpRU0b4
 92Lroypm0n+Sd43oeg67yK6nCbUudFHH9oUxfmEoNZt5bC3qRElVJCSCKwr3fce68H6gBmXBqw
 stFOA0uTVuYf/rNztnrr2sQ/dd9XHfPkeQGOOcwxWSCEAFIC5hhiz96CfEJomSwct3ki3htwZN
 BlMcWVybUrC1YHBNgYlO4Mlo5CMSaKkc5z9MeZ5/gESEZORNwEAAA==
X-Change-ID: 20260806-agatti-audio-357bcd74ae9c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788850384; l=2319;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=/rHP3l7Gq28erKII9JbPiB+PWMjwfT4NtvvwFQeB180=;
 b=yLmZzC3rXbMx6rEvh8K9U8LuTyZG1JpSu11wy4TufoCp9al/pHtMCf2nz1mXK5OD65iJk3/dW
 Q/0VmPiVMIzB32zRbms0v/sUMdWgScxjJ97keeJydGmmp/dRBzeeB9p
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6a9fb0d6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tc8gWtmjloUqR9SNod4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3MCBTYWx0ZWRfX8uHphEOF6XUf
 bFzjXumEj2PNYET4CGrZDjgsNSjW7oi3WNoBQKv/ao6LRxKPas5QqT3OsMD4rJyWYaXGK43V+Z4
 vsfMHoWARKLrPH+G9b6RgZdGwJFJQsQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3MCBTYWx0ZWRfX74LC1M8Uf+Vv
 dV2vkqPgMmyAwknITYZzxJpklxW0y26V1OXEYuSiCj/Mev7KviduwpsFYk5wbmhdjsdf1CASlkT
 YrQfNDiUe6VIy/X2cQAi0qWGnVM72z1iJpBMqIxVpwAt/AR4AbKOinxU1XoVz9JkAA9bNdBlE47
 GflTMa/+xY8nQRL7srn9gBHjldA2P0QZE8iw7iwMAldeDM/NYIbV3qq83GmRFD357HAnyfWbaVC
 vdhzm3mrn/s7ZEHVdjUg3UZxcye5N5gzkq0AOU/8bYTCbs308AC5DFaD0yLE7LXqTAJrTsG1KCg
 y+zLtv1wWIzdOg0wGEAKVW2dWK8UYtcT++XArs46z5Egm+4AFzE8KU2ZDQrpbch5Ae245j3fIip
 BR+7+EB7CPwFdjHzjS0V3pgTWCyWdHsuf3iEWrW5iJ0WhJ97uGKK/B/WCdj0Ya56lfTEZdeIJ95
 +2uPLIiFqcTDiuyXAEw==
X-Proofpoint-ORIG-GUID: ZJletWOCHfOPAaSQAi0l5fC-mVLEldpp
X-Proofpoint-GUID: ZJletWOCHfOPAaSQAi0l5fC-mVLEldpp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080070

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Fixes: 851d5ae6003b ("arm64: dts: qcom: agatti: enable FastRPC on the ADSP")
Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
Changes in v4:
- Added a Fixes tag.
- Link to v3: https://lore.kernel.org/r/20260820-agatti-audio-v3-1-47337097ee53@oss.qualcomm.com

Changes in v3:
- Changed alloc-ranges to <0x0 0x0 0x1 0x0> to cover the full 32-bit address space.
- Collected Reviewed-by/Tested-by tags.
- Link to v2: https://lore.kernel.org/r/20260807-agatti-audio-v2-1-3959b1ab8059@oss.qualcomm.com

Changes in v2:
- Fixed VMID list alignment.
- Link to v1: https://lore.kernel.org/r/20260806-agatti-audio-v1-1-cd6766cc9ccb@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index e7fed60a59d9..8d557010d3c0 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -381,6 +381,14 @@ rmtfs_mem: memory@89b01000 {
 			qcom,client-id = <1>;
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA QCOM_SCM_VMID_NAV>;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x0 0x1 0x0>;
+			reusable;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -2346,6 +2354,9 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 
 					qcom,non-secure-domain;
 

---
base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
change-id: 20260806-agatti-audio-357bcd74ae9c

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

