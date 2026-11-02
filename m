Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621469;
	b=5QUeTzOI3iiP3CSbbKRTVBAmrMHE9YQi32v+SByPSE6J9/00qaeCCwyZBfTYKg8p0PxZ
	 w5aKtTG08SFGbC58V9mOSDiFNI3UJiu3Lc22jAgHWnvlSDAQB5tnWP3GNrc4WdkmvNU2I
	 vjC/Kj5O/ndxcu3qd5sdAMPlQRKeKhU/Y1edG69eQurRCS4pBA9M1cShodTMxjssRdctn
	 TKBkGAE06dqirolPwykdJJqvV8Xx0KTk5N9SNlzpiTasA1f7UxcjqV/RnBfERg+gzfVVn
	 66nsYfA8rb3Vs6ARkw1ZByXMY6kqMVu/g4glJGo7ezxoni5XmFU0O2XlQlWvbaisTpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621469;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TjXNI/T0/CwXUSLJuSzNROpWLr0pYtFGtMJGWn8mNSg=;
	b=u+mjSMb77p1wpxtv4m11XCNgZt9j1N7r48lmjGmQLeeas1Mnf16hcvHOUMnbeDnY2ltx
	 NhMss9iMz24Yvdd8XCofdeJznZQXRXx2ZKlb4EW/yHJRI3AishY1UQ/rNAhEVHfLux04r
	 MwJYdDA7Qp2086Lo2FMaadprtVeZCCHXpS0f48moZTFScDPVKXoS6Tb9Axae/dZY+XCQt
	 q1LF6fvAaDtbaoKEfWKNmoBWw6Jggltbn/IWiYFAbDOcjRvfWGvbfXEVPNG2l20u1rjqm
	 DiRjuAxtnxrKwn0H292548olcXkuLcEcsDHj7fiNDrw74CNSNHF3hMNkKICmZg4Gz/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dxy0R1Vl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Em+i8qB8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AD760A261E
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 12:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24AD760A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dxy0R1Vl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Em+i8qB8
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A7HK214022
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 12:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TjXNI/T0/CwXUSLJuSzNROpWLr0pYtFGtMJGWn8mNSg=; b=dxy0R1VlIzkQWLIR
	kouaBbH51jjvxxja7cWo4AyVjyTapr+n2wvqWmRxfAL7JKnsUUpx4rehLMf+d2mG
	7NI615NLzd89ahfco6beN9ZZphzBbuka/tZRWGXMZ+lsdqqzKYB0LutDoEpb/MkC
	zd6rl/ub2rhS+J68kF3yzqQLFnHP2R7wZ4WdwujD1ktKyXWYQkd/rEn3e1j4X+F8
	72cT99DreGbOTz9maxXQzwSSAqxzkV3gleVWIoo4ftjSlJRwHCXdg0sBA38dQJ0X
	SSVnUdKiTJqfZJuVQ4orWmirCy9Y+YV9CHl9mbcYzaG0+VtnaZ5c+li0jcCjtir4
	srFRrg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1sh68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 12:11:08 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7b206156cc6so2125447137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 04:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793621467; x=1794226267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TjXNI/T0/CwXUSLJuSzNROpWLr0pYtFGtMJGWn8mNSg=;
        b=Em+i8qB8fOjrB6jTnP/jjmTx5uBOkO2IbvuvHTbl9aR9osMX72pcOPI4IARPz+WGWY
         pOobUtXaDu/KC2gpItEJJOrn1GT2KSzdcuF9eT9IUnW8aODROZD1yCqFDIIoCJkCNlje
         eVeiCOuf0M818YGOM2lHcwLxTZ8/N8BamzJqnR0hN061kPMzh1f1lfMlxsxed6CW4ihT
         VW6wVLIZKWnS/Fbc5LKftaIn+gtU2TVZ6XFGC5/rPaj3EQ7vfEskiVNdncKl+6sC6LCM
         vI1I4RXZqrvX3WSVdAst2oPD5EsrlqvLdOlyPHK3PnbO1yC92r9c2Nh0umfXJIcz6ZWu
         6Esw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621467; x=1794226267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TjXNI/T0/CwXUSLJuSzNROpWLr0pYtFGtMJGWn8mNSg=;
        b=i00dC4K9O3/Kx/KAnnTZaFI8q6c+LYF0DXBD7i/MwIbhBuDKwzpyNAJU7XqXZZCJbt
         RZZvXBKT7UecTEjb4FMSk+dpOEZtAWirWT4Wps0OTZVyAy3YdWU90pB+PiLwBGuUaM8t
         0GzqS/h3MUvYLarve5471/CTxdyz9f6XLxQgQFx7/HOZJ72Up6sWW3TYZH5Y0+cbyAyp
         mthsV3u1CULvuWS+W8vZfrBQWW3fUO/gbpus9x0x2Tl9pQUevsWFCh83Ghd0zkZ/h5Cs
         12/Yr+jvklRf2lNZg5BwPMWZ73g/xIjvgcEe/Hhulj6ZtEayRtBKRAdUXG+u0e45GpmS
         7Jbg==
X-Gm-Message-State: APuU4Z8G2c6xVmgOm5v7tffV1/KmQSGJsmaJs8BKnxLcsxZoXwzm4L/G
	vRc3PE9rDKgo5C96+gq7ReP3cx0JgEn2ssJ03Tiy1CNwmeQCpFwg2neEGJpJTbwc6ntP6xUX1Jm
	mi8DFtPYWEE8tM4TmO2V99LXSEpm+P2H2EfcLzsCUgJ/WiNDpd0RM8EIBRIMfaqq+RzL+
X-Gm-Gg: AYBFou1YsaoiGfbMyIV3cIRyO9G5sNrjzS1i+NKGLq02X6R0qzfpLzltd+egNycBB1i
	E3psq6Mfi30D55/VQDd4dXFZhyNPrWFpQj4u0lV4drTq86JGKOsXV7NE7eIItca8zNhVOIYTfO4
	Bz77CgplYM53TKV1Awmi0PgoqmBy8IRfbuK54M9GMQjYKlUncVYLfucNfPitN/XqCbjwRUWvcdk
	qgUpQSSwrL7t4jz70waZD8yaaPREoqqWuSk0SauIaMtphP6xjt7PnAjW1mf5brL/2ZXEy11VSPB
	/XG1TZDc2MNzhh/8M9dC0vub5m8tYUo6e7aJC5xZ5kkV+VREeyCdXeXZqInAJTtIWl1vLHztAda
	W/HyIrAp8OfQ4mDDJ6iV/nkO/xXknm0HsAHEIvudj6Dk3+8X3XisISACPhA==
X-Received: by 2002:a05:6102:fa0:b0:7b4:879c:bb76 with SMTP id ada2fe7eead31-7d072c45613mr3944774137.21.1793621467099;
        Mon, 02 Nov 2026 04:11:07 -0800 (PST)
X-Received: by 2002:a05:6102:fa0:b0:7b4:879c:bb76 with SMTP id ada2fe7eead31-7d072c45613mr3944753137.21.1793621466335;
        Mon, 02 Nov 2026 04:11:06 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm19304405f8f.36.2026.11.02.04.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:11:05 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:10:49 +0200
Subject: [PATCH v4 3/4] arm64: dts: qcom: eliza: Separate common CQS SoM
 and eMMC configuration
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
Message-Id: <20261102-dts-qcom-eliza-add-ufs-variant-v4-3-c92512c7c759@oss.qualcomm.com>
References: <20261102-dts-qcom-eliza-add-ufs-variant-v4-0-c92512c7c759@oss.qualcomm.com>
In-Reply-To: <20261102-dts-qcom-eliza-add-ufs-variant-v4-0-c92512c7c759@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5258;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=XhU5F0eY2Y7JLYfyJ9y4P8Vpj0VdO2+8mmkG5/S4AYA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6H3R7RY1xfe3qvgfhBpKfBsT+hXbcciCqCel/
 nVndBdTxr+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauh90QAKCRAbX0TJAJUV
 Vl/5D/98RaUjw79+FRL/W0qjm6SAV6ROSYp92L9YDFLgk/tPB9gAwpOIcRpY9samr2lwBk55GKm
 3znf4wB2JOzHYlHNtfxFkIx10NEGb/SsID6EuYKLa+vrPcjCHO/7LNQwInvLV2sxCc5XyvlSvc7
 QSJY1sLeIiTrsuirqrqRnFbMSJoJQVIyndCMelfDHzyu646KZ8NA3niSrOulHvt9f3SQNiD+uvk
 UhJMiM3WYXMHRC6ZJ5yuy4P1MimmTjYqTFpHpmb9Le/DDLKZ7lpp33lL3/R+was2REylmDxbgw2
 3SqxNnq0IHQJgDMW+LhcpTynp80b5B0BFmeNkaiV98mUgZGW2neNVshbfLyiyjZ6aEhDoCJL8Vz
 gRllsgFeORN7I2jX6Wmvcnygo7ZrRN2+tcUPWfZZjCm40tjPjBJm+M+S3nt+OzYhqX7NIVysnq2
 qQ+h3dWxWr79mvf+X2swjOWJEyVlfEN9AD5lsJmZO7tljM1DCaE/YQbxwWJNx3hNbsV08oT+LND
 j3vxnv+S/lFrES9keM47taFteytlW+maaRlED2Ixlv4oQV0MUfhX+ZWByCRco5CpT9Feb45ZbCQ
 ZvXjMFeEn0drpDrezD5f5xz1fPjA39LoiS13DsA0rUOSc9nRYYaASFXaK5j9j3lxmTEkUJKc8te
 lVUq3uKnje6ReTQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: dlkMb7Hpb0jLV_32SlrqAzuw2iR7SVTT
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae87ddc cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=FfUMhDFI_infzSTnTwkA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfX02HDXZSo63iI
 Or8f5KURPRP1A8OtZOl3jFCl/HiKKZh+QWn2/STFWoymO15dEHqHizLVPc3BBiwE2GgYF+Ln812
 bxrWI/jPEG9YPPXMP3siDNHEKNcCfgkAPmAOvR2taMeiKzltFW+jsHcTf9cLpm3+LczHgLOJswu
 LtT5pGlSFBCau7kVlve69yIG1TJiIz7vuoGhwf1tWVGOPB9yIfL/VM/3dugQOUNmCqFBWzNVtmy
 K7X/fCITIgI04j3bqVHw7LbYf1ySXC0e+qcBS1BkYaF7Km9Ll2T7MytiGemrxLyyk4hL6oogqRb
 tcOibsz5ridbp931O5Hn8l3D/qxygY+eZiTK9013gkY/VA7HoJ3R+Eqo/jW9Tnsqg1L9SfiaWXN
 vuxO8mOOnOP1X9mrX7rEsp57d7eSOxvjDghgCMU5Q8h6iEhgfoPX6itT/P7DduU698h0NtGdVuC
 onL5vnSn2UMrhxdLOQg==
X-Proofpoint-GUID: dlkMb7Hpb0jLV_32SlrqAzuw2iR7SVTT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfX0BG711XYBYXp
 cCKyCIEO83z04HtBZT6Lp0APUj2Npq8rYSZFsq9pdNrmT81OJhszDrsnNgdcnV/vcFXY29w7rad
 Y7Sy2ZQ+4gCJHIlm/fyN6MSnSMg2EaA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020048

The existing CQS SoM description includes its eMMC storage configuration,
while the SoM and EVK filenames and compatibles do not identify the
storage variant. The UFS-equipped CQS SoM uses the same EVK carrier and
shares the rest of the SoM hardware, so duplicating the existing SoM
description would leave two copies of that shared configuration.

Keep the common hardware in eliza-cqs-som.dtsi and move the eMMC
controller configuration and its 1.8 V I/O supply constraint into
eliza-cqs-som-emmc.dtsi. This lets the UFS variant include the common
hardware directly without inheriting and disabling eMMC configuration.

Rename the existing EVK DTS and its compatible strings to identify the
assembly using the eMMC-equipped SoM. The carrier hardware is unchanged.
Neither the CQS SoM nor the EVK assembly has been made publicly available,
so the DTB rename does not affect existing users.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                |  2 +-
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts  | 18 ++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts       | 14 ------------
 arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi | 27 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi      | 18 ----------------
 5 files changed, 46 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..1a06b321db20 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -14,7 +14,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a14-ux3407na.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts
new file mode 100644
index 000000000000..36f63dd1637f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "eliza-cqs-som-emmc.dtsi"
+#include "eliza-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Eliza CQS EVK (eMMC)";
+	compatible = "qcom,eliza-cqs-evk-emmc",
+		     "qcom,eliza-cqs-evk",
+		     "qcom,eliza-cqs-som-emmc",
+		     "qcom,eliza-cqs-som",
+		     "qcom,eliza";
+};
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
deleted file mode 100644
index 43d428a4ed2d..000000000000
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
+++ /dev/null
@@ -1,14 +0,0 @@
-// SPDX-License-Identifier: BSD-3-Clause
-/*
- * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
- */
-
-/dts-v1/;
-
-#include "eliza-cqs-som.dtsi"
-#include "eliza-evk.dtsi"
-
-/ {
-	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
-	compatible = "qcom,eliza-cqs-evk", "qcom,eliza-cqs-som", "qcom,eliza";
-};
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi
new file mode 100644
index 000000000000..af4ade2d4e45
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "eliza-cqs-som.dtsi"
+
+&sdhc_1 {
+	vmmc-supply = <&vreg_l12b>;
+	vqmmc-supply = <&vreg_l1d>;
+	pinctrl-0 = <&sdc1_default>;
+	pinctrl-1 = <&sdc1_sleep>;
+	pinctrl-names = "default", "sleep";
+	mmc-hs400-1_8v;
+	mmc-hs200-1_8v;
+	non-removable;
+	supports-cqe;
+	no-sdio;
+	no-sd;
+
+	status = "okay";
+};
+
+&vreg_l1d {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
index 03f9192324c7..a378a500d9e0 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -278,8 +278,6 @@ regulators-1 {
 
 		vreg_l1d: ldo1 {
 			regulator-name = "vreg_l1d";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
@@ -396,22 +394,6 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
-&sdhc_1 {
-	vmmc-supply = <&vreg_l12b>;
-	vqmmc-supply = <&vreg_l1d>;
-	pinctrl-0 = <&sdc1_default>;
-	pinctrl-1 = <&sdc1_sleep>;
-	pinctrl-names = "default", "sleep";
-	mmc-hs400-1_8v;
-	mmc-hs200-1_8v;
-	non-removable;
-	supports-cqe;
-	no-sdio;
-	no-sd;
-
-	status = "okay";
-};
-
 &tlmm {
 	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
 			       <111 2>,  /* WCN UART1 */

-- 
2.54.0

