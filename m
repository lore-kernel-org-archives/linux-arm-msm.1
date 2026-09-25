Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE02748B385
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331212; cv=none; b=XFJh1wolSFD3on8qEjan1VS+o19Sws/T/Ic7fPU2tTox4LTkYeX+DwOjUjRrvPhX7CpnYTpRjFgcDwSyHBtCZWUmA7tJH01kvqt+qFJCc1AsuiPyVpn25kF1p6uiMtlHVxiOTwCh8VlUi+nClIOhV+4ZYIucZQGpJWuoKgImo/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331212; c=relaxed/simple;
	bh=R/SsOYmPy9HIqKkbR9zrUAvXo4Tbtsa1kVdP2ariWZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=REU5VHhCsPGF14T33t7AS9CCIkM/nFnLgsSKmyqDSqGCsHrs20b4QNmxUkPH8Lf+2qwXs9Dvb27Gf0thW7x++XaEKoUUsaSmjAytxjJNEFWPP5tcmectTwCHZ07qv+BMRzBaJAbCCzr+OdAMf2SRan3ShoFFFaAJBlZVp+a2qYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kaa1S9Cc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gH/6s8VY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kaa1S9Cc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gH/6s8VY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YhLX2911825
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rYeGZrOFSjD
	CzSXx5yrak0U9HEggd13SLHLFp0Wefl8=; b=Kaa1S9CcZDbBPwO+Y2BDE9K7/WH
	jA4oo7kWAKHtZfgm7jHkhhCSURaxDiJcUZHDkfknp4a1ruEYm5nCo1qrORACPnco
	adbfa0SNMyEbNE6YVrpTzaIfj9rRvd0FkgTS+UH34YuWO4EW9XQjVv2kIfE70Fbg
	k6jYPAUh6PNWxZ5vkL8GTPkofJcGT0d9ZrUu2zmy7UTyGLSMPafGV9XOCihy8SBZ
	yKKXASibdftZJhKGikIqlzRDBIJ9dZXJ989VKD45jyA9t/K2WxoYCoq4XyCINfCG
	p9dJ8U4G5PogWC1oxCpIPJGCLbxmZdg21bzZAlAxlycuEs8K+07ehIXJP8Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwhm51315-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:13:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-342138eeff2so746909eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 03:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331209; x=1790936009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rYeGZrOFSjDCzSXx5yrak0U9HEggd13SLHLFp0Wefl8=;
        b=gH/6s8VY+1ufKJp5C0YK7J7VT1CaCtf+QLA/bSXchx4G0gcuv4F9oBN5mMCIfqhVqQ
         pXsYPx0nWXUaGBP3lUvPqv3DDGGxlJ+UMj42iFBO8CG+Wk5BEbGGG4u1km8JCHjNwoWr
         a20xpNj4HeMPfz8VjN+pb2LnoWMUpL7iXoMfdikmmsN5S2lKCdb7ieKBTsb9VzzSx0cb
         m/IrOycBdvMJQK2if81ZcBBIW3U8ZJpUvMY13Qv7yArBIV5mLEv1Rliy8GPkLL/lEp5x
         GstLzjSITrP++2HI/nqUdsbu1FbkCl8FLj4kPoosgMve84dxNUbUU5CLFnmjdTAThunB
         /QrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331209; x=1790936009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rYeGZrOFSjDCzSXx5yrak0U9HEggd13SLHLFp0Wefl8=;
        b=o22qbn5rRpCVAc+s7CYW8bo7LA2YtU0a45UrE22hPRYSQEaHRKnk1egJFepIAK4SQi
         KlYdpaaP/LivNB5D8xT9IkAz5GFd4av/HBK/PGpE7sQUXkEcnn0HvlBFdODIybusujW6
         kqkhJNkqgW2D4oSUQm1z/Q9eiOThdUhDe3iHIbqfceI07X/x/aJowg/PObkkr1PZl8C1
         fVZgLqJQUB7nlMWdbgPbSrjhh5+uxFHZPCuJU23pLuagFoVOsts6FedXHUy5trVDjpo5
         f+To4phTwfWxkO5IxJqZlNzpmnle4E94z/Iycv9xnp3tIJXcqfPD6ifXjBkMVi4BdIwq
         JcIg==
X-Forwarded-Encrypted: i=1; AKwUvBwLj+DL2TurDycZVKWxcB8qe9xxWJnVU82Ax/FJ0tjkw815sL6AW5F7lciMgX/26BGAKPi6hEONRY7VKeJp@vger.kernel.org
X-Gm-Message-State: AFuF++nfNDe2T8P1XNijXvHcoPBvl+SR4ZXtOObyAN+VauG/SFPRYTMG
	UkXz1Nqht7Sk6WKVWyhk31wwNBXGRYuxIJJ+bSzmMSoz5dsu5BJmHQ7ViB0GpCzwuTUMJVLxwbn
	6VsUnEWgmS8hjoFmVfMw/OG8aG3JRNi43wMzir0AbV7sa0vhXlBYLmOrfTb1XMq/owWBpPnwfdE
	e3
X-Gm-Gg: AYBFou3926LvXdAWuoIkCFmTeQrELuYNUNOFVbSIetlPCfS2LuNijDkZJtjV6ZbRLQk
	PAPqbDlh0O0vu3EKVgzLiHTT2Bv8yqWmj5Sa12TrdGHxXwqYrduSWWCPKoZ8IUrR9CueFshd/HM
	x3oLfm+1lmbOf7O8MCSQCLZ+tdHBlWzDrQtZXAcaW2/ZYba/tyhMduxWBejzoDraEnpG9mcJ1cm
	QpAiURsYQq4zjyVEQIYkpk+NUI85by4MHuTkqwOPrtBxyDgynzFtBOfBpsp1AT+vAALuadjWCs8
	vY0u0u+FLKpvyc7nXuHbpPCgTM5WEAxIq1A8XZG6HHKDPooadm/dZ4HYZCxMuIcoY8xKeJr3opq
	Vv7vKGH52TSxp7MB+G0Va2EcAFg==
X-Received: by 2002:a05:7301:2829:b0:33c:1f44:81dc with SMTP id 5a478bee46e88-34004592b2emr4265459eec.6.1790331209070;
        Fri, 25 Sep 2026 03:13:29 -0700 (PDT)
X-Received: by 2002:a05:7301:2829:b0:33c:1f44:81dc with SMTP id 5a478bee46e88-34004592b2emr4265411eec.6.1790331208035;
        Fri, 25 Sep 2026 03:13:28 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3413fc2413dsm5397961eec.0.2026.09.25.03.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 03:13:26 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 3/4] arm64: dts: qcom: hawi: Enable SoCCP by default
Date: Fri, 25 Sep 2026 15:43:07 +0530
Message-ID: <20260925101309.3826038-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
References: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5DmbDJ4EYX_yLaC6gtYBSe9PolBEW3bI
X-Authority-Analysis: v=2.4 cv=QYnzLcbv c=1 sm=1 tr=0 ts=6ab6494a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=5nHZ2-PuNKrVBJgNaKUA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MCBTYWx0ZWRfX96ksQa7trGFg
 eiO+yRG0SeKUO0iq05syAp5sKrWhYrUFKdgDDtI/svXSSDO7AmrxenWfgUnu4crGR0+bs/10tMu
 zWG5C3UkLNimzBMXWfPMN838Fotp/c0OFLMW3lPoej/Z2arHVYVcWOpwevePbIPO0COgqSIbSIc
 eX8TH9Ckjt8g/ndpRcetzGDCyHQ8z5+DGP1biViB59EbdvHQySdDN+F2teelW6u5p3m5bhgfnwO
 nJ5eBpkkPPH3f+DoQJGVMcJdIRv1mmDiLmd2VTyaAuX4GNs5oSyWOOETI+xm2SXq7PFkS1jW5DS
 +zxNpUw2USs+x5y+rrnhsp67b5/vLfTcXQLcZgn1I5zqI90NTHyE4DQLkP3Bgl6NeJIfgnWVKia
 fHocJJXuNS2z07d7K1RDA17wbY9pJQZelfDmouPtUx4TwZuYKV7Juj3RGrRjSFDzG8aYFnbMSkS
 gq/3gNQ7x30GqDXi1TA==
X-Proofpoint-ORIG-GUID: 5DmbDJ4EYX_yLaC6gtYBSe9PolBEW3bI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MCBTYWx0ZWRfXxFWnUHIem/0O
 YwOu7ItoZos7vxDMB+c+1jskNHQQFm5XfIBt/gMemhZTs+/o9/GCWL1Fv6+02pBZ5BjQN4ysd47
 RBhev3YXUfiyH10GIi03WjwbS/TM328=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250040

SoCCP remoteproc is marked disabled in the hawi dtsi and enabled in
hawi-mtp.dts, but that is not the right approach, as it should be enabled
by default. For Hawi, like a few other targets such as Kaanapali and
Glymur, SoCCP boots up in early stages of the boot chain before the OS
takes over. So, it is default on.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-mtp.dts | 2 --
 arch/arm64/boot/dts/qcom/hawi.dtsi    | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
index 7709582491f9..88e0afa791b3 100644
--- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
@@ -910,8 +910,6 @@ &remoteproc_mpss {
 &remoteproc_soccp {
 	firmware-name = "qcom/hawi/soccp.mbn",
 			"qcom/hawi/soccp_dtb.mbn";
-
-	status = "okay";
 };
 
 &sdhc_2 {
diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index 89bf0f59304d..d47440791479 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -1859,8 +1859,6 @@ remoteproc_soccp: remoteproc@d00000 {
 			qcom,smem-state-names = "stop",
 						"ping";
 
-			status = "disabled";
-
 			glink-edge {
 				interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
-- 
2.55.0

