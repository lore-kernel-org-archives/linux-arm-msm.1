Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92535376465
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161803; cv=none; b=Gb4JoVkwohzJ27sBbr2NUgk3V7fPkj1l96PfVxQXY0Rbd6Rzg6l6UMHYngOyikJC1X7Y4gV8Kb9Uj8ng3eMaAC1cJAjMD26IwjyTdcWDzSS0mcospsqAQ2gdm+BlkgK4ruwXAaqPssvAoUgvQitzMlG4N6d+8nNWXQkOByqjXM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161803; c=relaxed/simple;
	bh=MzCMi/u89b6ENxzppj4pkL9lmnVb7CCk5Bl+93vkVcM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RDZArev4G88h5yK1gc3lt1wHDj2VM3HbPBTG9NEcMnAn2D5SZH4ULCd1ZMix1a0v17OvV8Yi/0tVTec5+eI7BrL4Q4UJyqdNwNHK5o9gelnPeg3CQ+9aZEuu8a6LzsLCVOrYprq4v55v2sWAKSj0VkeI3h6KTQ1i4G33dZplnlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c5KZ4xoS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hZV/Bx+4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c5KZ4xoS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hZV/Bx+4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDmATg3823666
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bmYIKgWcVyOLqclc7V7XCN
	R7ua7aOSEctfJ9wNDIB6E=; b=c5KZ4xoSBhj/hp/GBeI5zBxOi6TIe3FMSFJQJD
	Jf54gURXjd3AaB07cwHjmq6CLFxNtZGzOYv+AKdaLNJ7J2AWEzC+XiK79WWSIrOn
	wxhir6Qy+WAi9oJjEvo/HmxJt++NTT4PtPuO1TpzJLbX8okCfK5n4fvJTYTbzleA
	uN6JgCSoerJH4P/wlcM70UGmuOzdd+abETAm617J6mQrg4vxepBI4NOP+j0s0V7H
	IZrK1EpA7aqyAg6Z8rdFq5oWVu/LqepjjFTRiwAlkFQB8Yxs2K64ZsbTli9QM8vO
	d1cEZamX/9tkrP0JS85fGBUhqB8PQcJQ3s/vSVp2SNM1bpcw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4nbs3h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:16:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811d5ecf66so812233a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785161796; x=1785766596; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bmYIKgWcVyOLqclc7V7XCNR7ua7aOSEctfJ9wNDIB6E=;
        b=hZV/Bx+4mtMnkzqCLj45yEi4hlYmigLv0KnTsKrBQWc3rtEP5q2/s9vjwcsFbeOBuP
         X8EqJJKkvQknOP6TA+XKAl1/Ci7SgXCwRrnIemZ5ogaHkwHUjtqIt4a6u88CkPaBJiF1
         K2XRYhOJFzPmszqNY2nTgQGMtiAiYAPBydHRIai3xqJ/hF3cRiemKYt4bEYZliKf/Lre
         pTqI8xue7sTB/W58rTgTOUItUNeSwCBJ4VUZuVOWFsl0VBcAHOUezmHYWPLxj7oh2bdR
         euv3RTy/IF1qKnFlCG+JrU0A0i3qkS4TaDLwF14B4yartvBVqyGxPDzqdjsHWsox3Vfq
         Ok0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785161796; x=1785766596;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bmYIKgWcVyOLqclc7V7XCNR7ua7aOSEctfJ9wNDIB6E=;
        b=bMbhosngzqxi2AGfeB8hcC7lruZCxQdyvYcrsJfs69QS29PaeYrhxyRVmFMGt3LppT
         ih+woPcxy4yoyIyBfnUA1wUBH5/1usc0f4Oy2Mi459upr+NMEPVOA42rGPrE+oQ5kHfp
         Sip4XPYB+YyRH+gvzSyr6PgMYR8mSjUOgVFKzgZcsAsQMWgeqdg/C4hDQqwGCzBNRPtA
         aUiJbu0GxcYAep+6S6ncj/0mncRgIR6usfz3s8K5P0/isdV4lGN3xGrLTKhU4UTNNMdP
         5+3c0S1I07eL6g+m+k/FZ46uhJeWq3JWC9qXWq0gD/U1xyrsNXpSHLjdeknjXAOAmzQo
         Rmcw==
X-Forwarded-Encrypted: i=1; AHgh+RrU6ySKl9szRCMonMTAJ7z11NhcctJIwm7L49uAUkL8sRk3arsNPl1ucyue0nW4HuFJyOeIp+euYnU/n9es@vger.kernel.org
X-Gm-Message-State: AOJu0YyHbGPra/T/OoqpYJQX44WMV1M7f5ZOLt988uPA2J0g6M6Tc4rv
	B/WVHQ5dkHexFO720EVr0zi/LnzSa+iyV7115L7oV0gvPwVY/tRt00KIp1++V+MSH7cBBYpZ8lx
	ofgZzQUvUdi10inWbvcMlQ2qJplFcMYjaQBCpjkvclPD05ECF/8Hr/LdnFBkFk9+OwcPRe/QsAi
	A9
X-Gm-Gg: AR+sD11ls/AtALVUuR5tJlchPxZSsdHh+lAdSYoCA/JXWDDRlQ626rU+VrfgGr8XH+r
	hLiv+DeJ9MbUE8ck1gq8l8o5azd6WkAo/2tnZu2GlB6kbajbz5HeTAbm9Iqn16HcFdtXMvL555g
	dHdGzEUwnoZzgnYN1xAD1yYDLvWx7AV0vQdqzf16wnrtracKt4X3ShuPuJAe2HWEYo9A1PpZLCG
	M2LbsBeXr+F36v4aP433yHyj5fFl6wqPUbavDHmrSxNeTBTUhxpTBXzeSlwMur6BGWRhunvUMQU
	T6hnGR2MJvr/AZqObGKmGKIrY3tz1riBwP7qE8dDNK+/fvWYaXbfpgl4Q/U2JTNrg1+wqIRr+mT
	VZ/x6WVeWJfneb+T87qCD8Kxwcsl+cXjG+nWqzIxfnoJ0jSk5Nxk=
X-Received: by 2002:a17:90a:e7ca:b0:38e:89ec:5254 with SMTP id 98e67ed59e1d1-38f628d0e68mr309377a91.7.1785161796330;
        Mon, 27 Jul 2026 07:16:36 -0700 (PDT)
X-Received: by 2002:a17:90a:e7ca:b0:38e:89ec:5254 with SMTP id 98e67ed59e1d1-38f628d0e68mr309332a91.7.1785161795815;
        Mon, 27 Jul 2026 07:16:35 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm88012281c88.15.2026.07.27.07.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:16:35 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: Describe the PCIe M.2 Key E
 connector for Monaco EVK
Date: Mon, 27 Jul 2026 19:46:30 +0530
Message-Id: <20260727-b4-monaco-evk-m2-v1-v1-0-5429cce68599@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD5oZ2oC/x3MTQqAIBBA4avErBso+7G6SrQwnWqINBQkCO+et
 PwW770QyDMFmIoXPEUO7GxGXRagD2V3QjbZICrRV1JIXFu8nFXaIcUTL4GxRmO6ntZxlI0cIJe
 3p42f/zovKX0Jh86RZQAAAA==
X-Change-ID: 20260727-b4-monaco-evk-m2-v1-dd56eb997378
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: _oiKG-PfIDhmKMCGUrFKdDoftou26LR6
X-Authority-Analysis: v=2.4 cv=cJjQdFeN c=1 sm=1 tr=0 ts=6a676845 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zz_lQt2UcqaARhYooj8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfX4HKPMV9K3Ryb
 1xUhcVMKra8B8eS6w2Z0EfYzxX55P+pKqqJOEMSWehtOVk/qbIDblW0hHFC4NXMBPM7TNSE8z46
 qtfJLU8cmQWmFldznQTHRK7fSI/jFdg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfX94mmohQL9+xr
 PxsMOdRRP/athO6zPgoKLBpvcuLFjoU138aQjyva8P50XL8yPWJ7RDNcUsb6u4fHm+hYLUR4/HB
 sm1pDuCzoIgLzDcGknjFFGfN3iCqKxWkOC43eKcJS8Ev4oKt6+sGlpd77x/Puow8qNPSbZNyUio
 QDmgqIMIK5RUcWOSHVK3ZGn2cCVQWZYdiHE1AQj6auumJruig+kJXKMt7wNCPr/9H4sT9d/5mZF
 JNnzVkPBkHzwnu7iNtGrlhCyl5uvfGwiELg21ko6UDSOH4uJNhhczGOiEWiTeI9t/VBLQb/WkNm
 w1dps+NUHVD7KB0RETxhu3jASl3PfHpSIywi6cA3v/dqRNC/12E7oZV2SP0OfsBBZIBrNKVY6Pc
 k9x03edxWmClkwhuhGd+1pozni0d9srTRVW92b5i3fcv2++py0h9lg62uhTQOalxP8iX4Gcqs/g
 CDXOEJV8qL2WAE2kkqg==
X-Proofpoint-GUID: _oiKG-PfIDhmKMCGUrFKdDoftou26LR6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270135

Add DT support for the PCIe M.2 Mechanical Key E connector on the
Monaco EVK, following the same pattern as the lemans-evk
series (already applied by Bjorn, commits 67f06acf/a6d4bb0a).

Patch 1 adds 'compatible = "pciclass,0604"' to the pcieport0 node in
monaco.dtsi, required for downstream DT nodes to be matched to PCI
devices.

Patch 2 describes the connector-3 node in monaco-evk.dts, links it
with PCIe 0 Root Port and UART2 via graph port/endpoint, adds the
vreg_wcn_3p3/vreg_dcin_12v regulators, and adds the serial1 = &uart2
alias for BT serdev enumeration.

This series is based on next-20260726.

---
Wei Deng (2):
      arm64: dts: qcom: monaco: Add compatible to the PCIe Root Port
      arm64: dts: qcom: monaco-evk: Describe the PCIe M.2 Key E connector

 arch/arm64/boot/dts/qcom/monaco-evk.dts | 73 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi    |  1 +
 2 files changed, 74 insertions(+)
---
base-commit: c5e32e86ca02b003f86e095d379b38148999293d
change-id: 20260727-b4-monaco-evk-m2-v1-dd56eb997378

Best regards,
-- 
Wei Deng <wei.deng@oss.qualcomm.com>

