Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBD02DEA93
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 01:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435237; cv=none; b=D3LRDu6Rra7ZjTWTMg2eA1Oou1irfHETaIhw92Gfp2pz8YFoqjz6iMd0ixvXrbCI+HCaT1H318HU2pX0663ZQCTjFpzdrkILVESbGlef+m3QKsjxVo12o0mKkEZkicXVSJQMsBsPFKN9W1r06kjuITVDH09iI9FnO5eiLwAFveI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435237; c=relaxed/simple;
	bh=odgso7si0D+HJtBaRRkr+elkQ6gwGtPGCZeiSn/buw4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lAynjqwWDvRzzJNpUD1eqXHu5cbgB2uXkAwLLwQb0Suc6NvDPDRhmqv6MqDt3zcXzVwXFyuHR02zVSQANhQp6cQ7J3kL/15fO5fqEF87uQdY3PnkjdA2PQ6TfkthMOL+en4zBk7jTY0a/lLNOLfmw+9HcYkguuZW06OilqshHw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E3JbfoxO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wp62EmjA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E3JbfoxO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wp62EmjA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EMxodJ1984578
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 01:20:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2wqGhKhCvfksusQnfhBnSQB+Eve9RoX70et
	djYEZIzo=; b=E3JbfoxO3Uv8ltyHcugsZQeWqsYtLuR6Sw7/59+b0dC8Qslxkwa
	1UVVhIkp7lL9K74TqBVAUFe2TyJezH9P1wkb8CrWtmvBeW73dTfVHEX3dZDwcwJ3
	eq+13cn6avh0RxUGLoIpIIAF6Ykt4mCBHtrNxXBuIk9847Iv/7i7kG20J927rLdS
	/tgAa/V4oYiiFPMf/vc3PGBfv5C/rH+/VnLp8TdXaA+Xj5CMyyAwtTWW/wz3Woxw
	OHgSNUfG+Qt63vSFQhTgj40SZxRN+npDZCJywq+mxcWzNkYUBtBAc3c9PD5xTekJ
	xNeq3WLMrBsFYnS+HhIgrqggGX4LKwdO55Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpnet1ex2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 01:20:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-385d2703b64so400732a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 18:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789435235; x=1790040035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2wqGhKhCvfksusQnfhBnSQB+Eve9RoX70etdjYEZIzo=;
        b=Wp62EmjArbGlgWuw5mNcikkNALRpYyN3Sw5XJRaP59XEAX4GbAopzdrETy5sljsUui
         eYboJxGDNAUcR3qeAhmqsrAWQtdYW9v0I8WxvNRYsmY0q9EKjoCdad+oaET+ZeZwu9og
         yk3tkJkMnNqJ/TBCxLeBHg4zo+dH2YH+B92YQNn0Fv/KC44fSRnOW4VG/Icnq3k+jTSB
         /EqUiuW5h/ZXuoRCCPbZeBTFp9v0unjDWrMI5jUmON/DaFyiAl1pM0do3XojYddRg+yE
         3UuSr3gEYi7rOms2TY3R7kPLlepDZo0+iu1syBUx7Chz2ibicbMgwosiZTAySHlxCSvX
         1VrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435235; x=1790040035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2wqGhKhCvfksusQnfhBnSQB+Eve9RoX70etdjYEZIzo=;
        b=UqNEwdAZ6cmKiarCaKwk5veToTqlpkEEflrlUD+0634ZwZj9aR5MRnldb07jk1T8Yt
         x10aDvno6Z6JKR7QGjZxDxO4HEMvu89iwNabFKWqGxhQYF6KX86NAXb5mvsViiWbPqa2
         WPHG0MPPg/4I5ZNZ+FGFagXyj7B+b4iUmd5TN/mBo2t8XmioZ4xBZ3XDSKC5hqkIvi6y
         Iuj1cElgKIiYKSG2d/OLZXIrz2P7tEVt1y569gYTo1OYvn6jlt/EWXxQNvu549KJhqrP
         UksuukztH6eX0rnA4WRmSRCkfAyjQv96CMZuyIOsI4fIOKI+a0+NJ/BREQYWOSvLxoXJ
         6edg==
X-Forwarded-Encrypted: i=1; AKwUvBzPQJAcBVnW/IXueE072Pj51jHHISJN0zsm4qMnyIC3/jV2omW+/6eFxCHNiiWPqVD1XAH2HlOqgDjz7UrT@vger.kernel.org
X-Gm-Message-State: AFuF++lGpAewNy59pqQLy1VzNdcR2gWBzSEKT2A61SB60GD7afM//GfG
	w3pVSQxkknRDSTLro/GjQvRnlOx0kzzbTvFrXkKRBdC1rRjuXJ32WtCt8HNsVoiSFSoxf5Axv8k
	rImLZbbX45RIXY9jeviGHbFXjSKV+yeTZSl/1fOHhkoJOgI74NS2WGe2yvvyhqSpwcCiN
X-Gm-Gg: AYBFou0YbasbH7ioGRvdk9mUfGjpOxeMPzTOcwgbMeI6i5xpc/DI86TLFk7qx4vsSTR
	4jBBtc/bYMb3VNwgUlDM3JtR1X3hdDj1AwVmzmr7lvas+oL4vHcZl484J7Z6cj1ZV4k6cvtijZ2
	Ec5iJwpAxoSZw0lwC1IDAgP3FtZ7D4xyL+3UWsDLZKY2+IPQK+TUm+byPVdUVRMPwJKa3oqaXFV
	vAFY8UcHfd1paW+s2HUGdEymhoYcWnXHCA5tFvWP1NtrQ0Wuo0PcdF1XFnLWLAHBcpuSnn1dZNd
	LI7U3TZMXeIyXHqbIUhIAAuPrRCxWhIV5Ym9bv9L/4XV3wPhono9Zh5KSfbdH1RghwJlw9eyOUF
	4G2wFH2x9gd3ITgcvS9nMV/GAxrCLyHizpRo=
X-Received: by 2002:a17:90b:4a92:b0:398:9beb:a2b9 with SMTP id 98e67ed59e1d1-39dfe1ca2dbmr2501323a91.27.1789435234664;
        Mon, 14 Sep 2026 18:20:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4a92:b0:398:9beb:a2b9 with SMTP id 98e67ed59e1d1-39dfe1ca2dbmr2501272a91.27.1789435234220;
        Mon, 14 Sep 2026 18:20:34 -0700 (PDT)
Received: from hu-hongchen-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e4fb3esm29216573eec.7.2026.09.14.18.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:20:33 -0700 (PDT)
From: Hongcheng Zhang <hongcheng.zhang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: hongcheng.zhang@oss.qualcomm.com, hangtian.zhu@oss.qualcomm.com,
        miaoqing.pan@oss.qualcomm.com
Subject: [PATCH v1] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add PCIe wake GPIO
Date: Tue, 15 Sep 2026 06:50:20 +0530
Message-Id: <20260915012020.2667577-1-hongcheng.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAxNiBTYWx0ZWRfXyxaYuiIfjl91
 +CYf6LdXTX0nUvbPH8HFU2834bXk52x/07teJrlqEaMF0gzAEFUcgt+T6yFD2cC5fwF4BSQwqKA
 NmE32Ceta8wnpa8ru9w0gORQFg/azqQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAxNiBTYWx0ZWRfXxvtjBtCPwMZ9
 VN9pnTmVWr73V4ZsW6ZSBAht36S8Z6pWpyccUHiAcc2UcQhljQZ2WhMhILusZR9OzZo22StHD8a
 JOatDP+CqYRM4cuOjFjGjizXfzN3hoj2JA57tE011ir1MsxLcyK0gDMiHmy35vhkeHyQ7zGPeJP
 px15oegkrAkbWB4dm5Bvy3vvpN3b9wS/z4f9nimxPk5G7WSaQTmr0e7gx4EfHe+rDpNCKwrQAMT
 VCIRTIqG/tzgWMjvvVDdVnJkHJOuxfVjdJ1zEdXxMK1CWlZoAV4dvTXBJzFlgV2yfdXam2uUxHn
 REbaWLbSXnvsTFREeiBRzhlLDJLsrfZ2izMjv1wMG0RSacOGS7vO60GYQ3mYr/n2al/OPDmTv2Z
 zTycfLLlQrMmCX2rIfr2Z+RIN4UTt0uQPgFig76XrPyr4SPW//DrBJZdYihdoFIuAcF5JIW8KGA
 Takh3XLauM6hVFT+hRg==
X-Authority-Analysis: v=2.4 cv=PKKaavqC c=1 sm=1 tr=0 ts=6aa89d63 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=6FOz5cXy--B9gFNoW_kA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: k2sNZvLRYaPexDgJxZ1pIzTv2SKklCy2
X-Proofpoint-ORIG-GUID: k2sNZvLRYaPexDgJxZ1pIzTv2SKklCy2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150016

The QCS6490-based RB3 Gen 2 Industrial Kit cannot wake from suspend via
PCIe Wake-on-WLAN.

Add the wake-gpios property to the PCIe port so the WLAN wake signal is
propagated as a system wakeup source.

Signed-off-by: Hongcheng Zhang <hongcheng.zhang@oss.qualcomm.com>
---
 .../boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index 46bb52c667a4..b2bd60dad1cf 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -78,6 +78,8 @@ &pcie0_port {
 	#address-cells = <3>;
 	#size-cells = <2>;
 
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+
 	pcie@0,0 {
 		compatible = "pci1179,0623";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;

base-commit: ac38b483e5aacffecdf0c91f7d767ce6284cf57d
prerequisite-patch-id: afb3d6a9952fa85d5ea4e9a6e19fdb54b03bb9fa
-- 
2.34.1

