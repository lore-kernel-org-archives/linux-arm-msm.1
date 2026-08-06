Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808A6456DE8
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 11:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786014901; cv=none; b=mbl1ILam5GMNfieGgNK410fZ3knQQJezgCWrJ4ATkodL/5Sf0LWV3rbT4EFZ3s9uKxKxly3otjhk14wgm51Y9cZMy/x/hq2pPGLnfRTm+SppK0tkEl8ZsT5kZMqeBY/dTD/Zp6Yo7hiZFZ8SuyCla1FhOXzt8XyszjDpfdH1sQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786014901; c=relaxed/simple;
	bh=zP5yDhKGNSt37383K1tZOpIC/KrHwQCgV7HfXdEKYpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lp+QaltPZcMDLfQeTgEWPznnmxNx3tDquF9xctofRIlkn048nmym0WXJMDVTwTFE2dy8YHwz5sUBzkuItsuJsZbRlYcD88XzRKMvR4BBJntGIUYM9JVcxwq7Cg2nyVqL5nJEJSUOEeWZP2zMkjcwA7pBpwKkzaiSTDaEWJaxbxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vag/dI0w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cNynX5li; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vag/dI0w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cNynX5li"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ndQ31578698
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 11:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E9iURRvErCPOU4STKiuTTR
	soqVUHZQEauJAvTV0DL+o=; b=Vag/dI0wo88JwNZzZvkOSigUlueDp3oPmaK2qb
	I2eBI/vbxsmmTFxH3Vhrb8AK4D0KfgYEBq2fpZBW9UZ6s+kroI0kdJ5jhfrv2ppE
	RgzUFxt+Lr61wo1P94sZP3Wexwlnhc/qhMJH30cGWLPk7910p41eS944W9autUnC
	h6ZABh5NnvUUPrdwk1Qc2HBp++jp98B2S2Ah2DNxyIvj57T3dEQvlKWxL3ZENYdx
	q0zaYmAyTfi+dgZiLWwim/KWp1XWnux07LXgwPwYpVlUE8+nrbQ3gYe/Gt9f269w
	jvSQ/v9eLD6oMYd8H+HShc05ZsE7pHwjBXyPvDote/F4uslg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvju8htpb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 11:14:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8487ed7f7beso2409199b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 04:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786014896; x=1786619696; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E9iURRvErCPOU4STKiuTTRsoqVUHZQEauJAvTV0DL+o=;
        b=cNynX5li5byYZv4rkCsxIfDC04FGd1/SzvIXQko/ppZdVIN8DtbGVErTLyLI3bIBe6
         J9BzrbMSbz9AOPT7PtEJPLOsTyp0kiZh4lHfv1bqvbY7zHSN0shDbngaxCvF5aWRXCt0
         xZ4xogKw62tqz8pIv9SkhRETv22fVkHLbPnxtRvJzmAKEKEpKZN1rkUOzQ57v51wRh/T
         eEvoncgBF2LOEP929+9Uc1x8uWjALXdm3zJKBmpEzEbP5IQbQO+swmuemLJ5StfsgANe
         uQRCne/1AZ7+TdKIHwLxsrh22GVN69vPnavpWuiXHgq9ztobG4t7dKacYyN/vQl+bPhy
         UGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786014896; x=1786619696;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=E9iURRvErCPOU4STKiuTTRsoqVUHZQEauJAvTV0DL+o=;
        b=rEHXhvBc4ib4MmrzwFCF/Yz39aFdB2uTdl3GhJNKwmwUabTi3BXT40xaexaPJPlSXC
         wlIt8R4hgs2ePWjHAEnGuLUGlvS4B66VEHCKSqpT/KChlwT3bizpqyKkOw6b5HhJ500I
         H+Spv9CqPsKbM9ksJaIukaQxVa2gdverOtiGL8WeEcUGHtrNLdlfvEKElBhU5LZtTb3Y
         62V6cz8rTsZEVsUmlmJG81P8QgjJaAK9ZEU7aSVVSIsqyiRhalCFludE526/dWp1ZizE
         6TimPCsKg+slAsG2ir9EU2YSsUCWHcayfwGgl175fAcgAFL0wQndB8HwEZdxdBoyHWu5
         uWog==
X-Forwarded-Encrypted: i=1; AHgh+RpklJpHwLdf3U4NpecRTfgFBUA2yEsjWhiDscPlK6v0R/kxnzwUkPGS8xr0anbwQR0G73S4sUp1EVnD+AFN@vger.kernel.org
X-Gm-Message-State: AOJu0YxrCqKIhGbDbx7AUm0e16hjKvAZbrqKk060xywSjG6gixzkXZld
	1/KI1+UvP3DwvgpiOASOW424YmhOIo5IRejUYdGihJ8OiAg07Oc9nlxJXQAEYEFphEqOvRpNALd
	51J/mT0p+qdZ2cc9u3vUG9MpvmjDqxaiRfozPBR8hqHStdv5E73mG5I7fZ0mJgE0BcH2b
X-Gm-Gg: AR+sD12XgiQVpNRhHV5XuQvJXGzjHwaYdjNimlb8D7PB2cMt6d0rklrCWcwAyAQG3bg
	SgTFE05jHLOWHv+J4HRRGdCrsPsLiUdKgbv5M0b1oiqSoOKs2vsh8NzFitrnp45lGJUOSH5TrvU
	KqCZb+rz9EJWnFx3PLqNXDNKEosbxRZhjrdqehHfpl9ru3TV89le1m/amAbJHTCLIXgioxzi6Wq
	05wpVGGoVNmNvoNkr8HC/NHVZ/wEgJt6fpehjbOX2VDE+EnysWA7Q6HYQArSm+/KcG3vSCGdc3y
	qaVKsmoM1AiXnzqwct+dMC7EDwMm4AgqGTQwe3xB/TDnbLpHB4Se1t34NW1FG+29rWgeTCegALp
	9DRneX4wuRBPN13YEaVyQs+RLUwufK6w+tw==
X-Received: by 2002:a05:6a00:4392:b0:845:e8b5:8c49 with SMTP id d2e1a72fcca58-84f2e03173cmr16766879b3a.10.1786014895551;
        Thu, 06 Aug 2026 04:14:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:4392:b0:845:e8b5:8c49 with SMTP id d2e1a72fcca58-84f2e03173cmr16766814b3a.10.1786014895112;
        Thu, 06 Aug 2026 04:14:55 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f4538e489sm1215461b3a.7.2026.08.06.04.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:14:54 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:44:41 +0530
Subject: [PATCH] arm64: dts: qcom: agatti: Add memory-region for audio PD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-agatti-audio-v1-1-cd6766cc9ccb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKBsdGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwMz3cT0xJKSTN3E0pTMfF1jU/Ok5BRzk8RUy2QloJaCotS0zAqwcdG
 xtbUAhe+NJV4AAAA=
X-Change-ID: 20260806-agatti-audio-357bcd74ae9c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786014891; l=1419;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=zP5yDhKGNSt37383K1tZOpIC/KrHwQCgV7HfXdEKYpo=;
 b=fyOwaLwClfooF9gcQGtPmBDl7KRDTHxpkMYSop+8huORDvfyQpCK2Mtj/fdKuZIXqmskv1NHl
 MTZuuqJloClBnfhVVawonwugg6hpiOMCUyhjjT7YHtg0i+URwDmQoog
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-GUID: V8vHimr-sXj3LhZPebJb8z6b_-K0d4il
X-Proofpoint-ORIG-GUID: V8vHimr-sXj3LhZPebJb8z6b_-K0d4il
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4OCBTYWx0ZWRfX2jKhhj81P7jY
 smyHBvd0Vrg+M+mfQbM3doFiE8x+XJWT7vUbhv/dYkKokqcgkHF7JKCVitbsX1P7Mikwf0OrAXZ
 DlbFBYGouKvhHGMNVv/Hmj6tC51JgEyhmcbAKSYsnESfQ/qqe9/Pyq2Ab9dsE03iL1RwKLEI/0d
 4rHbFmSkDsC2s/J1AbYGWibh17u0cqT6c6ZTZdpdEp0N9Jo0GHH3Ho8QIT8YOIOt1j58fcdXcrH
 AdeiT0VLZHZ0XfG1Yq8ssNeh/vEKh6j55rzNy3nwMdKSs/QtEJKq8A+eudCHSyWAYtdyKkFb4H2
 Vxbk9GOaj3iHAC6yNW93J7q9jCTaTjt+ciJrBmDB8wOGg+AEoAV2lRmJhsJ/6m1TODuZLgyekLl
 kG8/zfYWM0QNQGbhgn+kgB2eoXw2RSskFNNCxhrX2cLTtXf9bbnaUS5YgkaMIW7BROlddtD4Yn2
 rf+tjvkzcsg069PnRyw==
X-Authority-Analysis: v=2.4 cv=K5cS2SWI c=1 sm=1 tr=0 ts=6a746cb0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=xTAV2kzwEx0x-571GnoA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4OCBTYWx0ZWRfX30p0K1cgV0a7
 Z3+ZPCDmfiUcjVD6XOdiKISCUs12+TAxVq/D1SHvcMTR0pkdgW83xgLmF8Sm2SaZyaG2d+H2wgY
 3p0xc7zOEEA59Ubup4yq9pu0bzLH0xQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060088

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 590bd2432d85..f2277d7d445b 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -381,6 +381,14 @@ rmtfs_mem: memory@89b01000 {
 			qcom,client-id = <1>;
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA QCOM_SCM_VMID_NAV>;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
+			reusable;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -2348,6 +2356,9 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						  QCOM_SCM_VMID_ADSP_HEAP>;
 
 					qcom,non-secure-domain;
 

---
base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
change-id: 20260806-agatti-audio-357bcd74ae9c

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

