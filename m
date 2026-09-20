Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6AB3D525B
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 09:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789895478; cv=none; b=HIsneFaIRWeFbOdVxIZO4k9oUbLfKse9fVC2Y2Xzo+i4SeLjMDU4ZDnj7shZISmVXGDwgAzG14aDKSQwqtT0hSbRWHojI2V4Zmii3yrzkqTxslW/rWgNY6yYN1KIHFYjIjKTiqCuCUMqunHtTwh2NlBaNjb1NRUG+xdjHTWY0Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789895478; c=relaxed/simple;
	bh=vPB+IKWkyYLVK/HIwA8GBqyA/TjQ4UguCmaAsumcsGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pBfjMNbTKBbvSKo3bnJeSC+xkdFyyHZUY3ufTB3S7O+oDjH/T40mIl6sBtXVVU2RuZnNeg6k/NyPPtsg0TtgYliZGouI35vyBU6m5tt8LNaW7LpYKm34wTbftGIGae/Z1OyGwzVzHz0Z4QcN6DI2O4fA9USTN3wG/rpMWHrkIHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RgqB9WbN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UPhgNOpZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RgqB9WbN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UPhgNOpZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8VkIq2025285
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 09:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JM/TzULn9Zo
	9jMZeBxqgPBCbcsnVao1kQaEPNgl/ZaE=; b=RgqB9WbNwWq3xcmeXkdwDuGw7jW
	HU0o8ozXTexpd+kvEiqjI12oUcyRF5bsgdQmLz7OzCR/c+pFj3bU/nAiykNcW63g
	Eznn6dx3I7tBiRGwGYfRqLUVm8aKnHOsd4mR98aVWXwxnnzQXjrr0rnx5XxepJ44
	oBYXGSgFOCSRY38tckRIw7pOIdGwX5bhHEMk+/C5y9CnuN6+KqMoDd8THcVKPsFi
	JELJVoT5UAQS58Bnz+/VUWHfp0StkjYHNy1Ilt9Gw3ro6XK/A7H2KGuW72K5TEIJ
	3Bh2CyCsHBU1ixG3Yk333UOMeD6EQa8ZdpOtjB0kZW4+g1FJxDMMl0hyVRg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjm32n4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 09:11:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so806134a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 02:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789895475; x=1790500275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JM/TzULn9Zo9jMZeBxqgPBCbcsnVao1kQaEPNgl/ZaE=;
        b=UPhgNOpZpYJCv/iPwcGFWMowHcA+PJetBUzMMpJ4SeuHASDZGb/Xuawd7ck5BhR8SY
         4q/RIcEoXPFTH1yKbRn3JCPi3zkwu3jrtgmr1eRTR0K1lumTlaAXXJiZGAbbKY6NlK9j
         g1kZ8oFEBMPUbEy0lKLi/A/rZploTDVqcakIQZ3gJHBKrGAFqqBBSvzrTQVU2AZK0ujn
         XyqTLi4l0BznBzR5HOMvnby1WcqvV947akLmfEh14u1M6OFjoUwTirAASSgrB+sTuZjU
         DJIqUIp5HXUNenuJTuIlwIkkhSiYGcWanU2ZrmcrAINGtGmQNtml7wa5zVPFjcpnfqpP
         9W1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789895475; x=1790500275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JM/TzULn9Zo9jMZeBxqgPBCbcsnVao1kQaEPNgl/ZaE=;
        b=n0TZdWTe+HN58F4zRob5pKEVkkwAfJ2LCOYdXhLdFjsARsaDsKNt49fbPfnNmUt6im
         Ga9+0Vcq94PBDd2A1WHy8u+2OrYIh8fJOUJB02vRS8rTCP/hhPYx8Piw7bKy4ra8EYzc
         0DrOc4yH3NtwNzJXtnGXgLg65a6Jh2v7KpKQEBAaeLeVyDTruGazJlJeSwr43FG7SAkL
         0+XQh59+Xa2yfbL4/95ReGppzYLyatpnUTmkuTsq/GHtzfD+xnREEC0OibppFqgv+uCK
         6rHRLqclD70wx/a2wuNyZy6PpbpMoK+FbrOwJCNNq1kb2odnd3KPesVVLSaNy25ZDMs6
         s2WQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlBsjisWY3GEcG/sdhTlKhCv17E1ddcePXE2HdGBxGdLCSEyEwIQ3+4mZQxhVOLw7Vzq65nGbIlbPCp4tS@vger.kernel.org
X-Gm-Message-State: AFuF++leBxbp3khkPAa0gA4pLPfUsSU6KzQX5ZBf1lwdIYXVH09nBcQV
	Z/eH25TUNfBPrzuSiwOJQcRTvrythKYixkQrT/ZNpAEwrA7dXAiR5hGch1C/Fn45toNY/pUOMIx
	UxWlUqKQglNVTEteBsS/PwZtkxmCeEUu8yyj8imo/7U/9xNSNIU7xnB08CzkMmkl0SJs0
X-Gm-Gg: AYBFou3Gs9H+KCRGxirC+8yMvddM46TTlVbLwodE/SNxw38sj+m5lVcB9u58clv5UrS
	8Y4Kdh2QucF9rzSOZg6WV460PvJj50RMgoMRqy214+gQK3SROTCiVXatIeSHt36c3SKEpguBW2j
	jatYULLCBKhYhxBBFuSK2j4nWeQkZXjAu7BPFRoXiMGgvbzdRkQM0Ll/gPhP4rsjDBuVspvsbRx
	Hk6Jf2mxoW5PvBHEPkbxF15uL2n+OnTjtQNsNAxuk5rkTSlA6Cmsh2Aex2D44wls98q5qnZdgHz
	mf5FslKtUddf9hU+cvexdbK5jjeFjgiHMmHBWSikkucmgBw6IfcNCNZcBEIRon3EhXvwOGV/+o5
	5TRpaAFIU4oV+IcBus07I+HNbQopp9Jm/9fJhz9W1W4PQ1J8IaZ/C1o2KLxI=
X-Received: by 2002:a05:6a21:398d:b0:3dd:a006:ed92 with SMTP id adf61e73a8af0-3dda006ee1bmr6587587637.40.1789895475193;
        Sun, 20 Sep 2026 02:11:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:398d:b0:3dd:a006:ed92 with SMTP id adf61e73a8af0-3dda006ee1bmr6587570637.40.1789895474805;
        Sun, 20 Sep 2026 02:11:14 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3313d96esm10730242eec.12.2026.09.20.02.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:11:14 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/3] arm64: dts: qcom: nord-rrd: Enable camss support
Date: Sun, 20 Sep 2026 17:10:52 +0800
Message-ID: <20260920091053.2214965-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920091053.2214965-1-shengchao.guo@oss.qualcomm.com>
References: <20260920091053.2214965-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: klwGXwRVrKsBwe0rY_0osQ9ASbmqTqJp
X-Proofpoint-GUID: klwGXwRVrKsBwe0rY_0osQ9ASbmqTqJp
X-Authority-Analysis: v=2.4 cv=DtfDa2/+ c=1 sm=1 tr=0 ts=6aafa333 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=9JaSISndomsK3UERfiwA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEzMSBTYWx0ZWRfX9Dfr5SDDx/Fw
 wW4ps5IUovxiWF/ezjqbitAL6KL1ws3wrwkwOuBOAZGfM40m92oSrATcQ+fwvFVcyvAzaQqfkpR
 eXQC4VnfxC3PdFJWlNgYWh0utD+l3e9jhMDDWPZZGjDDNbgIKi2SgA+4cKl//uoW5ed/PJi4ugY
 r8P2IQVMoZtmF+p/edTxBFdvlp+1AGAjmVAedApNVmj4GgaciClTG8r5ZgNTZgOdnVrozWip1XR
 5Vq5hzQwhBMFLFrX/K/sUeGZqfNXnLF4nbA8gbxjA7vcV38cwDcfo0yI+6eqs8wqPKqMZeC1D10
 3MevBtXrRGrHWpl6Ethupvniy8HK/Sik903rFJ2S8js1QSHhF+6A/rq7HGDv77BJkwxlDThjtZ4
 VPL33HctgQ/hKJXaNuXeZn7OT5ocT8CMw8MdgK/MvLaxsqxcSbzp0d0PuLzgVoUO68aHGwv0Rff
 ApLfm2uy4q0sX4p9mHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEzMSBTYWx0ZWRfX7h93SQAlkG3v
 cOWCNk/SvV2G2RBK74Isepb7RlWO0ERbvBP56vvPSF5T9MCSzL0HlyBSkZiYb1e/XqTdmeaBHKj
 8wPYDtP/i+wiqfWLwJ9H9tKwC9sm4Tk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200131

From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Enable camss support on the Nord RRD board.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index c547963371b4..aa126505a7d7 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -366,6 +366,10 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&camss {
+	status = "okay";
+};
+
 &i2c7 {
 	clock-frequency = <400000>;
 
-- 
2.43.0

