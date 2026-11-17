Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915522;
	b=XUnh0lmCxkBr/5agF0RL0JwIhNhE0j25sVr/oNnr82NfYMdVMlwlxtOwjtMaAwLn7Hif
	 wSgVHFUkDoWs2kZwJB/lHfq3v+UsTBSFVPAvCTUVh4dzPXGs6QtI790oxmbtgj2tBYGPM
	 94n/7f6GpxDCp0S3GWBFDEuVYfeirdyx2dmB1seoL9xGcudPPQE3GshjzAfbF9kortBqb
	 ILdnGS0JjUlsOMRV1Iy1DEbQfVjE2hHA1PJsXowXGXj3+Zs2eexr2K9/XFBAyN6MGZsTA
	 e1SryRpR5KM8XwRczaDFmneGeDolpN34IQEWdbYCbzzBtVX1T2YugYzNDA0QkFSdeTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915522;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CQvQ2XC64f8xZtkViw8OYspDjMnnUYT6pRTW9cIpfZo=;
	b=s46eNZcHlv9e0ZUrLxdMBMKPEkiN2x9nMudCRs9ANKklbohqCuJWidlnONRNY+UUBTVM
	 oMi3i7GgJHjBUPQOa/gH14CsVAEibcole9KsbCW2j100pH6RKn+X2Qy2jZ5KN63Gi2T6l
	 0zIezXpdxX7QQmSe/Tvwp2eP817Pes0rZQLMPT+KVwEV4o4Zvdbjg/fUz13o9kUUqJxP+
	 p6zy8K+3/PCMhDzMdI8D5G4hQI5C9/BPCY/nJOuXNaQ0W9zKzkzFlA5E+YumtNwIKYE6B
	 YzRKoZhGlgjUzwvhFzmuviLolgc+WY62qcew1Mf4BECZB3BCBY5JSxFbnGPhwhYiYnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TvKapnRn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T7E8lEmv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122EC606A329
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 11:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 122EC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TvKapnRn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T7E8lEmv
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8vKfX3407489
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 11:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CQvQ2XC64f8xZtkViw8OYspDjMnnUYT6pRT
	W9cIpfZo=; b=TvKapnRnBm+Q2P+N44+Ns1WvXwN1Ob8vW3mebXZxLXqpwLbo+S5
	fTWeRMmTdRJLIEYY8CqBB/5FxeYQcDc6Zx1cXp4zYrgjZM6KR3wDfT2pen1NihuA
	/VubIkhW92t1DjOT9PqgSozn7eV/jmaJML78BKOuES7oZFHcF+3V+JdJ3BwNkToW
	EM2D2dxYT/wx72qTK3bsZ+UgjQ6poaDcsys6tZGN6c0OWQcv8mHzNUB8Hcc+LTtF
	dixJuXFi0t6LB4ybHf3ioQuGtm0I7ZpYkHB5bUKA0mJ2OuwWbB3XVJRilv1HkAcy
	Gxpn631FrGm2wngerzOItOp2pn/nUptHyxQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09htjvwa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 11:38:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso2566750a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 03:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794915520; x=1795520320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQvQ2XC64f8xZtkViw8OYspDjMnnUYT6pRTW9cIpfZo=;
        b=T7E8lEmvlSs6iXqV1KzqIsA4zhylfoJ07xAcUwJQp4hQ0R4PRbBUWbm3GSMxHac++B
         P822vpFnk6v1SN7a5uIsCMLg+ROVmFw15G/of/DrkK2pA+jpuFljEtc0QopbUFrTJn5k
         gDRJ4i+dmKPtk1sY41ppryIruTQ8EVZk6MW4HpOBaEwDO4tvLgfAlwkVPujF7lY6uDbU
         KGXJCKk23V5ZOordgKrqW4WVDvxZt7jikPbELibrdhQGPtThtUq9tyOA3buWXW/NqGJ7
         Qhy7QO2OarWSk2ib+GFv0LGSqLGasofPberrI1S3rKA5AeM7X7lm8BsPlQfdlMKxBZU2
         27GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915520; x=1795520320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQvQ2XC64f8xZtkViw8OYspDjMnnUYT6pRTW9cIpfZo=;
        b=Qi+WN5Av60AgrxoyTJyJKwuHHzWY+au9HnV9tXIP84DuCnRibfaEzVIr2I/rtBoowo
         etupv2r6vgUsT+sZHaQ3BLAOxtSUy0BXi54XDLtZELMX8Ey9ePO9NTiHGEzwg7Kt2PsO
         uI2OIgBxlxOC9iFRdNaBtFOV0D28tJElqbLJG9JXeZ7TJcKyZlTW0/wxaI0F1bMWtHkG
         N9sdY1vlSi0tsOh5zobl0n+iRH/6zhYPWGd6hCVSbT+G+d0/G6LoQdWqlfWr3MTIyQx4
         WS/VsTHIDSyE6K8wljNycL7pNbBG7exMbQn8QLPrImeHkL1CPJFBH0M0tNZnK1OpJT0L
         6AHA==
X-Forwarded-Encrypted: i=1; AL+hErGIy8neChntg5uILHsO7S3JnWuu16GCOHGkCN0f6uC3fQmbY7hFqB4aooSSYyRoMW+t0Zs7Dti/H9muL7qr@vger.kernel.org
X-Gm-Message-State: APuU4Z/BgCgyn1Rh+4C6ejKPMuC3ps6Dp117PVGVss1hDA23wPGL57mb
	sycE03wSCecW+C8ML/0bpt2CxDobff9hMGHHSPh9nCTLuOOo7KksLBAvh6CTZkoijGuK/sxJWzp
	M2zWAQnVTyFfi2QDkvoNnTsXAMDTOH0J1jV+oyZWtIKfO9so90lba1C13BMGuZn48fLBH
X-Gm-Gg: AYBFou1yQl1qs1QRkUXEhHGxpcKNKQIApyYha5Nzj5nuNMRIuhE+husBTJrzzFAcg3e
	Z8HmtS20N2sm7UBTsGsmXwmKPOWknOvRcKXJAHQ5Jw0p77Su2ZSgC68xqhoTXEjFRarjWCTs30t
	6+0oKSmpD9z5KxfY0Qkm17fXXCgeraEX1YadmKtDt8+wUbS74U7qX2HYEz3E4B+aHwXeamCndnc
	KFTp8ILZ5ovsT6TQygY8NMqUM8q+dIZCsp+8ikGZmCpVjb7nfDX/Ba0hmLl3kgnqEZdE7a1Xa9V
	PW0bU4a8tMoC+a51kmX021In0hLG//SeCzTWNmxnIyBfdQAdm+sfRZavod17sMEXBL3cyTSJv/v
	20N2qH9QR5MfR5Sb+PYJtf4p663hhl7MCgKndqGdC6jRXsnRgvXI+iCQXKwKx7bEBAhDnpMfsIb
	uBKfg=
X-Received: by 2002:a05:6a20:d80d:b0:3eb:a638:7c6e with SMTP id adf61e73a8af0-3f7a85c3a5bmr12849400637.60.1794915520543;
        Tue, 17 Nov 2026 03:38:40 -0800 (PST)
X-Received: by 2002:a05:6a20:d80d:b0:3eb:a638:7c6e with SMTP id adf61e73a8af0-3f7a85c3a5bmr12849361637.60.1794915520037;
        Tue, 17 Nov 2026 03:38:40 -0800 (PST)
Received: from hu-taparana-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc186fc81sm5886985a12.8.2026.11.17.03.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:38:39 -0800 (PST)
From: Tapas Rana <tapas.rana@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        abel.vesa@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, 26rote@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tapas Rana <tapas.rana@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: glymur: Add mode-switch to the USB controllers
Date: Tue, 17 Nov 2026 17:08:34 +0530
Message-ID: <20261117113834.925310-1-tapas.rana@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0NiBTYWx0ZWRfX3q9VTdiclLv3
 w8Mp177A7Mu8zaGip8TBPUfPJYJIe7D44ZhD1Qra0b98+qtSmmXus8S2jPtRbXmd1vF9z8uvgJ+
 e+MDkrMakgI8VPQoHGEHipdyf2QqDNM=
X-Proofpoint-ORIG-GUID: sQqHIu31ZkP4isNqg34JcwEnxdi7RXtr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0NiBTYWx0ZWRfX4FZ0dxCWinPP
 8ABIRVbOuGdfYVnBk1RMb4RsTclRhbUGovZbgQJKnnDyJ54dTf5WYNV4LRZ4O4sVA5/d8eL572S
 /h9fMZzCulpbhc4CJkY27M1jwUyKw2Ip8S8F5DZ7BA478weCgHc0BxP9PBe7pSnNqRpYpzzJTD6
 TWc36sEdnTOoboYnzusNPD4DeIip3TLTo413dndwHAHIf5Jy1xYgU5qFLKvFL+wIkiwwZ1XPJ9c
 HBfOzxK3KYXXSRrQUfkC/zGhp6U5NqTj0qFj9Sqx/BMD7hqj4bIs+nSDLenQvpYOasP5XTQEOs5
 DDfilWCkYNam6dOJI7Ji5/KCuA9dOA9dW6XtYpXEXWQTgzIipIHBbhfwcypIH3F+fGOLlR/FxHh
 P9J/jR5b3SNEKm4ESqAinucOzlSH7bNRBY7InnvRiXLP/sZg/XCkUWDRUc606K7qItP+kyHKw08
 7cN2QvNNgsk12Ngx7iQ==
X-Authority-Analysis: v=2.4 cv=K963jCWI c=1 sm=1 tr=0 ts=6afc3cc1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-rp_c-N0KskbNC3IIIMA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: sQqHIu31ZkP4isNqg34JcwEnxdi7RXtr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170046

When the USB3-DP combo PHY is a mode switch, DisplayPort pin
assignments C and E put it in DP-only mode, where it stops the USB3
PIPE clock. Add mode-switch to the USB controllers as well, so that
they get the Type-C mode, move to the UTMI clock first and keep their
USB 2.0 ports working.

Signed-off-by: Tapas Rana <tapas.rana@oss.qualcomm.com>
---
Depends on Joonhoe Kim's dwc3 mode-switch series, which adds the
mode-switch binding and registers the controller as a Type-C mux in
dwc3-qcom. Without it, pmic_glink_altmode defers its probe
indefinitely:
https://lore.kernel.org/all/20261112113838.506-1-26rote@gmail.com/

 arch/arm64/boot/dts/qcom/glymur.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a992..e9469bb7a832 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4998,6 +4998,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
 
+			mode-switch;
 			usb-role-switch;
 			wakeup-source;
 
@@ -5088,6 +5089,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
 
+			mode-switch;
 			usb-role-switch;
 			wakeup-source;
 
@@ -5178,6 +5180,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
 
+			mode-switch;
 			usb-role-switch;
 			wakeup-source;
 
-- 
2.43.0

