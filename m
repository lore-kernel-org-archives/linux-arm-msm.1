Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8E23E00A1
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789895482; cv=none; b=JEBaEQdA+3yYUjfb1QbDGgt57bzvRPQe/5qh4MiYqTYH4wXtB/+ZehEz3MzH+c2d3fSLhxWSR/cx3SG1TvIwOxpt7I6tLXmsCY3y5ckCQ9pvrPZje0Vb+PhemEHe90BWDPUpLID5zVDIcoui+PXygUemc08gOK4eXMeAaHlx0uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789895482; c=relaxed/simple;
	bh=lrTER2MqP0QPo+t54UPYxyOBJ0MmBWz+c+Zx7ruhgf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uVVNMsU31/f3DszFX+8l1PurVNlQOUEbg2m9GP/Lel2Zf0lFeFwqLtEyI3I9ZBhZ1qg2phUhHboHW6QGm8zMbrqDeR14m2mrX3q7Q+9lAyAHjXAFJ8qB6HTOhpYHV1X7b2mrd36fQD+4NaZvyaFIfomBL5E5e+ZCr8JtwDc9g04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YMkUEoXR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fofNafuK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YMkUEoXR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fofNafuK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8VVWi1363454
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 09:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xaLXdBBWuVF
	kmQZeXoKLSafvYIkhmxs/DUeyQwnP0oQ=; b=YMkUEoXR9tZYQ+lMUNoyvPZXd3H
	3A+hZ78j+YU+d93M8DNEikZIvjnxeqUnV49HMkPaexdqQqPR0S5ZZqv5mrw42cp1
	XBe814cTQEc67Rgfu1BpahBP4Z0XW1MnBy1jzYdawhHjcTddWx0h0KZU0Jlnp97S
	Vf4yXwytcWtd7AhDb5+NJVvqej5lgK7v3aLiInFjecgbS7sc1CwluMjWBtZjMehh
	cFN+Xd5y9Bdux04MDI06fSqbR8rI4CmUgTl8voEnLTCdaSslOM/eF8uCg3rIORcJ
	njNyxlhX/Z0EIx4fOFdw98ZimCKNDj3R4QEKHYkT36lUZjXxnKdVFXTVRng==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsk5ejjns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 09:11:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6f75c1219so45845575ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 02:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789895478; x=1790500278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xaLXdBBWuVFkmQZeXoKLSafvYIkhmxs/DUeyQwnP0oQ=;
        b=fofNafuKyg95REkuNCzyZ70q7FisnqFuubcbTE89iBPnmrEUiDtgX5A/Jz6boZ81zt
         bgdyuPb52vcQxZQaNYCca+UEake8yEXcMWLX1qCP6Jwi5Dcg7u1Fjj1WD/Q9QxcLLDB1
         a4BPt4KMEBHzwJ+kkLB20IrVGDZJkYkhT3hG0VXPHiC99f5zaL8ycef27XtWzjoF/9/m
         fizVEfkSrsDSR9IUMW2IPLsTV+qSjmouMkWpUqVSLUw1eGzlQnrc8kMVCPnL888gzgWh
         akFMqPI09KPBf79btYoCTgAxwt4Hhcs2biuLo6TZp5+D2hU5e/ittrtiXStIpeMEDnBa
         eDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789895478; x=1790500278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xaLXdBBWuVFkmQZeXoKLSafvYIkhmxs/DUeyQwnP0oQ=;
        b=f2kLYuNtcamzZps3rzSeB0axlCEmdkXQ/tbBT0P2I0XYt/YGlFBUFz6ZocSsIi3tp7
         v5bA0p1hqqEKTQ1AbBNTJNiZqwXZeNKRBrs4uPX/dMsFw4TKRZrxtzngPASBhb3YSIAw
         oit+jG6wl4GlWL2aQxeiePXrAUYk+c/r+Jnnvsxact32RoEk3tFFdOA3SK6p75l1ff/H
         G6JvZfSlyF4+9VfSkQhJx7aNrKw0ki0q2das1Kes8SKkwsnho6CApbh7KIYBxPr2tFuw
         GIS5wehfu6QDGM8X59p9pvKfueqWeaix66T2UGxEPlIoW8vF6toOZphGzEIVD9CqZkbu
         4WLg==
X-Forwarded-Encrypted: i=1; AKwUvBz0cj5Yi3V0ianWNs+QjWaiMrvUlmINhk/iaYTeCZz8ewHOxsAwP2BCffjkY0HoXwnfcvmA2mB7zv7BaOTv@vger.kernel.org
X-Gm-Message-State: AFuF++lLn5lJChKdCE+GqU/1cgUnTyxomAZ5DxJ6fqLniyo62tN6ZMVx
	kytV/C4sUD9qoeySAGXse9+XRdaPWBWm2tQH5WeTUyy435rGYByP9sAEuRuxVurMcPIXtEdzPBR
	19UxdKBJhN1Fa9lrZFAWUwaPlS9KDd9b467UI/jMmmFARbEqRcJ9Q+9vico0q/BnJK2i+
X-Gm-Gg: AYBFou05k7/hTFEfR7BnQu+zKrcERpKcWl2KoJyKxEOV0RHZ/R7oE2BwRnMlYgKUSSz
	91pu0bAkj21wJXlwPFum+ZQmLGnZIR6kIbWd9n4vJ5BTd8zFB7xKKO18FGK5qVjqOEV3dOa41ut
	AQCERai2wAT4UltpQY2qBx7ZSwY/1yM7T7Hd3bm0WGBNljctMXLKfVF+1zS6eknVXd+SVR/4CgB
	dcPtbFpREicL4L3BLbfcjC9oNArqnncjMBnXJu/19AyWbuFnwpPsyNfL893niydhKLdRed6WZ+q
	x07GG43v2tfNRzESvU1dGu7YwzL1T4bE+zZ/Mb2s0eiLceFD781vsaeBNFCFsWWUtQCSOX2fpzn
	KH7Y8ThkNawTwtAPXwkKa245qsVrB2p07v9qgsnqx8tLD2Qdpl1y8rVRSaKI=
X-Received: by 2002:a17:903:19cd:b0:2da:eba4:b640 with SMTP id d9443c01a7336-2ddb1ab55a4mr131147165ad.6.1789895478569;
        Sun, 20 Sep 2026 02:11:18 -0700 (PDT)
X-Received: by 2002:a17:903:19cd:b0:2da:eba4:b640 with SMTP id d9443c01a7336-2ddb1ab55a4mr131146975ad.6.1789895478196;
        Sun, 20 Sep 2026 02:11:18 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3313d96esm10730242eec.12.2026.09.20.02.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:11:17 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/3] arm64: dts: qcom: nord-ride-embedded: Enable camss support
Date: Sun, 20 Sep 2026 17:10:53 +0800
Message-ID: <20260920091053.2214965-4-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-GUID: KLl074d-O0DB54_nCDwCsLtulDQx-B-1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEzMSBTYWx0ZWRfX37lAd10a+gvQ
 IVFarlPNturQX3NdW6pUcVgHA4H078Az8PE2000RXh25DoaDByEUtflRxZV0cX8HmpDcaAMmXxR
 WRZ8ix7A/1daOKkUOroK9wV0npKiMLKweNdYkAOh/eWQ7K4WNo5I+lDdVSNxMwZtalHdk8GkDE1
 8Qv4X+3wEmEaFagyu+5C8its3VWz6k/c3PyMSqjuY/KiePHpdR4KPLsPqL2Mab7YXqZEBmF/PX1
 uz+7OnlPithUuKwLBfqYDREPczccdhwHS06i5NScJM9f8kqsZjLIs6dV23fyb0kKooUJLSvwPtp
 nPne5E8j/O9t5BRs4m9nVLtWpKSR69ax0oKO1t1fyjCjCuSD5/W3U2zzZ3Hfl0n6lhiY5/m61c+
 JpF/LuaVKVXgKZiizrGnIRieHln2+nNrmN/d8UFT2qan/FmkhrqfV771wlHKED7bcX9b/GU/TmD
 vP4cQLVGBFGk62n9L6A==
X-Authority-Analysis: v=2.4 cv=f8Ddl+yM c=1 sm=1 tr=0 ts=6aafa337 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=DpGDD-vdax4iYkbPwkAA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEzMSBTYWx0ZWRfXzNFw683Fx6aO
 a0QJlLFJjpqZkP5tAFHH48ZKFoNWyz617UVwcClFQz5GpJOGR0Cx/Zx9drdfvbRB1Q3AhqQqW+z
 omMHIrexbiPeGWIZKriD/7De69mh1Co=
X-Proofpoint-ORIG-GUID: KLl074d-O0DB54_nCDwCsLtulDQx-B-1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200131

Enable camss support on the Nord Ride Embedded board.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 09ee525764ef..674e2093f806 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -366,6 +366,10 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&camss {
+	status = "okay";
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

