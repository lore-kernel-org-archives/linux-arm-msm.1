Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6992B4DAF85
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790062066; cv=none; b=nN8Kc+djjCAQolUTUmgDDaIs8E6449bm7Cbt4ODRSBWz6Qn7ur0Lkk+Eqkq+8HU0oyBVMtb5x0HnTspsw2EzC8WB0gz8tYbRd7hqHQgkPtyN5ZkELkyPYHbi/U9+VJkySuEfNztGzwObTFguL1eDJvaElS/xWeXIQ+tzY9vAA1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790062066; c=relaxed/simple;
	bh=cydy0LF/RZKM9IAo5HRsLZwewvOr1al+EwNdfV2VZxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QLKr/roM6sfn18SnD9tdMIDCHfZnrgDyUZ47qcZbNqBjWy3JdkxyLmWW5zGsBTzpeP4x+zRkuIWGO5DBZOGb3mD02Yv45AjTICSyBlIhQrBGgBODx5TDaHdiHhY1427pMO7PXVHp4+vr8DWhbB0nJQC5BBKfnkcLfe4cUEyixog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MF3jIYTz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IIHHL4dr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MF3jIYTz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IIHHL4dr"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M6qxEI2165608
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cLPit+K9KBK49NQI2/hOA0
	SK35sPG3PGjQlJsFWvnNc=; b=MF3jIYTzUe3bEMRYwYuCj/U/47kY5ijvYZL3qz
	XYmgv4Ko3GHaRFLGGsDTOvSfE+fNOUFV3bqblmdTUH3G+OYn5TY7VmwbTFVH1eUq
	DWDAs/vCtG2Vxclrw63Oct9zuGVb6Bd8iARQRUzUiFEkRugj2hiIPb6gb+4DzJF0
	/WzquRFtkWLJB3lTsLQY1IpJmYsJVSfI05dls7N6sxv3DbtWWVr0Hisb+9/5mLcf
	vxMdDrpuHNqeCTuW3JoA+PX2muGrPaKFatRqh3iXv4u3WWEnQWkt2rZdMl7wVl0R
	BTSyFItnjFTYgkpC7/B/hNt4k1aQxOHs8YzM5G0qY0F9XQJg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xett52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:27:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca8aee88725so5661485a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 00:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790062063; x=1790666863; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cLPit+K9KBK49NQI2/hOA0SK35sPG3PGjQlJsFWvnNc=;
        b=IIHHL4dryLxLjrNbe9UlrrOvEuv+HmhRJgHZXgQTo5BqpPf6en1uTfuj5RTjLHZHeg
         hdWNucWsHRRVenISBfWXKnE/EmizFAy7Edr7v8LT8PI39wHIeQ7y5N59gM2Mn3giwn2e
         FIgjAJk4bPHRIJRRAYIFNRmajbYkgp7icvkKiyHCddl6nniX9UUFlrTaCFQJ0nqv6Xvv
         +j32lpN9MncokZ0Y3RdJqPtD0mUK8QFWjWLVjII0HI79Dj5h8XIX9rh4Led5E85ZIFGd
         y/rwiDzkab8SvYRb/by5OZZjZNXSkiDbuoibAZ11fFdxsg9tLkzv+073IzvmEqdx1//G
         xtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790062063; x=1790666863;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cLPit+K9KBK49NQI2/hOA0SK35sPG3PGjQlJsFWvnNc=;
        b=E/rAZjLQuW/uuyw0HQJoDQBy09MspyQCuxeBo74HwGiaCHwi9HdW2bpMB6u0Ms6x9l
         ndN9TnJyqgyInXHiq4evksU5+HeIbNEkRHksVmm3b29K6QWjFYQQFMXtdCbfZZ3a0eAp
         +r7v+g7qDXwrs8wsTWn+/I/lMp8BG0Ewhtr8te/aLjJwpQ+slNN6vJHYG0Muc87qaAfJ
         tQVhajHMGVds4sehEXU0t298IKetRH/+j5UFP7xL2hnFwbA5aeF5L1eASGObKCqsw9MQ
         XH7GvdnqGw2HrU3dHe7yqtGO6AQxAQqjVbmKIwaFX6E2tOXTcP24SasrmkfEfMr9VYAC
         doOA==
X-Forwarded-Encrypted: i=1; AKwUvBw69I9HGwqqOCxTDHcN4d6neQIzFDxlOk/9o9S1Wbr6d2xn6gLigfpUAEz0koFt4eTTJLze64lCQL6qgJY9@vger.kernel.org
X-Gm-Message-State: AFuF++kxGwO0xj9WB/Gl+WsKnbElgaydtLLucfsmPIQyI7rZiQQyatf6
	f1d+eElb8M0rKnFGchnhWDqjcXPpAKBB5xJ4uf/Z7bP+qtE5MN1a7mxb8oT+kmM7dcGxxkmSzwT
	RMWToh8Yj1q8CxS7DSZCbYzjtXhD8/JNZPga0Gn8W9sqU1NpwkFD+3Fk9fDKpbdo1l7S6
X-Gm-Gg: AYBFou3WoUaNDzkDMeH3jdV3wwDwXzKMGPeOP+N7sUBAYVeelPRNOF1DgpFkA0ZJzYT
	SQC+LW5MgXO2Y/X8xodRFU01HpsZqU9T7XhOa8gYVQmANdAhiTAbZe1JCclvQ8LsV8AijL64rP4
	jgf0DETS7Dh7rdv+0Q7Llrnyu004CS8jUSO1Fir37J/yqZV3A/Ut80CzhTk91YEwPdIdPP6avsC
	xOBRwXJ8vwsVDgdDEtW79wGKyI/V7b1GoC9WIYFccZzb8YXQDUr1hYt5raneBJoKaZ+YdH8Z6Ea
	fSm0lmkq/pwOPk8p48/rkos+qOFg+EVDQqZey1He7abIbkDkDG0ciJq3U9XyW631uWlYXZeEa4v
	UxuM6vSt4hbrnPXHDLHObLDTc4F6bve8=
X-Received: by 2002:a05:6a20:d70a:b0:3dd:85a8:4c5e with SMTP id adf61e73a8af0-3ddec6b6f00mr286707637.37.1790062062943;
        Tue, 22 Sep 2026 00:27:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:d70a:b0:3dd:85a8:4c5e with SMTP id adf61e73a8af0-3ddec6b6f00mr286676637.37.1790062062435;
        Tue, 22 Sep 2026 00:27:42 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f29d88afsm2788471c88.4.2026.09.22.00.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:27:42 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:57:36 +0530
Subject: [PATCH] arm64: dts: qcom: kaanapali: Add memory-region for audio
 PD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-knp-rh-v1-1-35e29b104809@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOctsmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyMj3ey8At2iDN0kA0uDNMvUZENTcyMloOKCotS0zAqwQdGxtbUAGZb
 42lgAAAA=
X-Change-ID: 20260922-knp-rh-b090f9ec1572
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790062058; l=1422;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=cydy0LF/RZKM9IAo5HRsLZwewvOr1al+EwNdfV2VZxc=;
 b=Me6NwNzG32slmnYKeA9fRPtVLegjIHa5jDCTAcgaCQG/fJwwjaqMKO2XFcaFl0tjSR7BFB+RK
 viKZYQfhqlICRl2pYRYb4lqogOlwsASj0xh151Le2AqWY93l2ovC8xA
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: efOdXI8HW9xzDaTY7FKqL-UNWn84x-Dp
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab22def cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ecT6ZAH8srv0KshgsUoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: efOdXI8HW9xzDaTY7FKqL-UNWn84x-Dp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEwNSBTYWx0ZWRfX7cOpAgBckMxA
 FY30k+fh8Yjn01ZQuqIcFsDIQXMQM0RiuIheIcAc4dOTxOM3qMWwQz2QDwhB3q2d1Rschf7/lW3
 Iplz3pAnMLI5M+i5ExUYr7ubcXJoe6An5gkrw4xF8wxa0kmOWPPK4afKUBCNwQ+zWosHMgrwngm
 u/g6WpT09l+yH0V13P23jhBKbhaPL1Kq5kTsDTtwnXNlQ8HZXsRrYTYu6POq8cBDzb1cpkFdrtP
 uOgmhJ9BT1d0GsYRc8507hUNjMGfh3kj/uqiiMo/YXRrip6tIozvzvcBcYNE05Kfgggo2N6+WWh
 uUqLJkF6yzO7qBgEcSrNqFnpbL2eOHnXl+RSvIosraaCUBFDRgjD6QSMAKxPe/qIpS2PM5GVOcd
 4j2Wu1P7bfULni+gzmoCA3E/UNHNdxZGrS0lWsR9n5klVuZy6JdDtpobQoKqWe7t2qSazQzz8gw
 xZm4YMF5m13LAe1HPDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEwNSBTYWx0ZWRfX4L/M8BCiKK9o
 1792OcMNjm0zzutYtX7uFBC8M9jzEQRpGE5YKamWYpLh789UafxU37JknQIsV7S2gTHIFtxRKxt
 BcWo4Wa2NHzCxvzN2T0/ywMOy2V1DvE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220105

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..f79f7679de02 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -451,6 +451,14 @@ rmtfs_mem: rmtfs@d7c00000 {
 			qcom,client-id = <1>;
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
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
@@ -2755,6 +2763,9 @@ fastrpc {
 					compatible = "qcom,kaanapali-fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 

---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-knp-rh-b090f9ec1572

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

