Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C5B4A99D7
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 16:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266344; cv=none; b=fbfMiyL2VCEsQ3Y9C1GHkxEGywtlDtsz3p59M84guZ+VU4Dg7+8a5VLZ6HZtg+5bl/PdV2tzbFAlvHAo25OhrHxZh1Ffk1nOMFUoc1vsstqXRiQPWJ+djvBJ0m2RYmMlMeBpI7rr+l02KmktJFkK9h2n9BLTy0KoNw3w18CPSIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266344; c=relaxed/simple;
	bh=4fWCkbCSJEJP19PcRqOGcL2gV4GFzJedW5FbddvEScw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VeV7iTDRAbgCTw4yE0oEAaV87FlgF87o5NZ5y8rd1qDfLG3eRNH1/+XGjZ+WNui2FFTvV6LL2b9R7QK1Vgi6+gwCHbs8+2rrko+FF9/tOyEAj9V2YcGCQ1FcIDL/TH2e7m4Ww1jCMuAA3BHbl6864eiQ+XX814y2B57uQRzx0eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pr6NpkbG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=crujixm2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pr6NpkbG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="crujixm2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFfNtf1279233
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 16:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=503Bl05xGtP
	s4LB7TSz8OXyx3B9WSiW4MVuj4zuxVHo=; b=pr6NpkbGmBVFoNlV+8+97iKKvmj
	pAs/95qoTpA3jYGrk83to5hR0iz27BQLmZbUG0VZ3SSQ7bFSFB+kSGzeA2QpvqHT
	4yCNd86LY25rARQQB3i5pVU6I8yokcU3qVhxsdXniufoYxTeb6CYfuZ5ic9yOeP+
	Eor+uBE4p+zZFLXRroisVCVcjY8hrv27lxjJFuChMIsXscrx3zjNQDldcpjFsEog
	82i1P5Sj0GhNQgM0rCuDc4lqUouw2LSshxOBPdK3LiS6PtgXT9GPoHHf+MRPObcp
	ZwT/q2+X6GdrT8xBF6R09/EoNK7I7smWl+L1OCD0FGP1+8bsnATsk8/wkWQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc9jvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 16:12:22 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-673e272fbbeso124024d50.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 09:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790266341; x=1790871141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=503Bl05xGtPs4LB7TSz8OXyx3B9WSiW4MVuj4zuxVHo=;
        b=crujixm2k0e3fcHt6L67OHFySVP9Wv7Vkh+tR8mZYqF6jQEALWCfW7A2Enlv350OQW
         X+0ebC8XrRvIQtIaruByQk/pOu2W0ikUok7P/fsClwkxZPiZH/rMfLLJCVyRhHMD6IC3
         AxUcjM9Gn5pnEkN0z2rq6XZiZKLk9lSEfC+iXEcEL/wXggctiISjdTaPvkoZI+qKGM9J
         lVl3dqMtxTJlLws+pV7etXSic0sLSaXSh2MakMZdwg/csWiZRlZC98UkjNw7Lg1H+g+Y
         jjbsOdVX002fguUh592BoWORLK9g6cWzIkaIjobIYrVIpqpZolXCp3B7rgQSOw8LnZfB
         XlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790266341; x=1790871141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=503Bl05xGtPs4LB7TSz8OXyx3B9WSiW4MVuj4zuxVHo=;
        b=Z/qIpovdQpR8BBwRY6CqMdYSFXlAW7PzsSUq6bSYdVvAxtQ8+pD1meabdNKRFjRctW
         bjFfa/y30scLNUREvfJ9cZv9FAxTW4rIKNXOozY8Z6oHgQYPwoZMvVw8UReec93F9+6b
         W9o3LT9vVJ78fqHKLhCWPpF9ibtFgB4qP9Q+hgDPLUbmRQduBfqoFyxCYd0aD10+KsTY
         Mv/XBHJ+g0To728QyZPINnRhnPo3fKw6i1fg4pBL7CCyJ7uxRhu141RR1jbuUU0v82+X
         bs61FyPMVYSrBIYDD7SGON3CO0YQrxNFUr8Jt01kLb0fPoj6t8E89gn/m8xMb09KRIUW
         qheA==
X-Forwarded-Encrypted: i=1; AKwUvBy92qWTH2sLmJo/kKgUm7lwcxbrHrZmHRs6I/ownhZ06um4V2Qf5uuK0CHBzm/N1VwUbWjpG2y4UogjcZTs@vger.kernel.org
X-Gm-Message-State: AFuF++n7DfZQ0med3K44LW/ap8M1l7exAsZ9mRNAE0r6zetJIm+/JTZs
	WnYrmBNU7sHDMBgcbLssoBzrVFvGfRnz/LGuPn59n/wm08yTHNk/VytVLn4Ia6PFrGadWTKs8Up
	hIdesa6uQ5ZHsPxJhkdEwXgXhRrFduSJ6NfqXc5oH95KjSCNEB/8vJOnRBvfnTUdcWdMU
X-Gm-Gg: AYBFou1o5SWyfW9ef3Dqy1XypkZIg0dVAFuHnqrW7TaxctkPOdgdHoaC5eIiejbaYJU
	g5gY5PorowKWAp3d0v3Rn4gGMIoiTVvw3vFVxSV2eUpDvCKC5yXqcSn49B+LgjxYCZb8yOflpRX
	z6NLlCL0v099JY2NReO099l4FNL6VVm8fnTHKVGs7wE7fgG9QeM9AkgOiSagmix8ruixGxH+Oay
	WgBcrZXags/tIIGDdTSoVwahGubZw5n+2XwORwj6IssZNVMySZALbnA2KJxwbNUUYm3ZYuxuYHi
	eWx8foz1nY+T/IK2jOoputZ6fL2YpeTVdV9Ao9rLonrQDPfET2N8oRh2z2/uLkSPPwBtUL5ZReA
	o3c1imQ+yeFa7vrtj5/N33uHSg6fVAV+6eAwF5X+OUsplTwpPw/KghQMG7pg=
X-Received: by 2002:a05:690e:4184:b0:672:a0d3:a73b with SMTP id 956f58d0204a3-672ed4c3137mr1155116d50.96.1790266340084;
        Thu, 24 Sep 2026 09:12:20 -0700 (PDT)
X-Received: by 2002:a05:690e:4184:b0:672:a0d3:a73b with SMTP id 956f58d0204a3-672ed4c3137mr1155094d50.96.1790266339607;
        Thu, 24 Sep 2026 09:12:19 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91425cd8416sm9698296d6.17.2026.09.24.09.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:12:19 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/3] arm64: dts: qcom: glymur: Add videocc sleep clock
Date: Fri, 25 Sep 2026 00:11:51 +0800
Message-ID: <20260924161152.1162301-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: S2chxVLPmf2UgVWCkIyhcdSAEF0az73w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfX+6YPkY1qR+W/
 dI91YOTtzc1/4aPybF5WKKyDU9Ljr2oZTCEM0p0PR6wjvsc37bDspmwIsVS6S9gwbF1ZajqRsbS
 jqquTkLpg7GylphrT/61hD+OYXU7LgPdxLc2xVWIK1fvmmkSJoEKDyyteW0EQfRfI0W8FB2X5iZ
 YK/94UDyyNVhgnu1Hg02M6fdA07mdM0AEgDZmxky58ooCEe/e8Jye9aHchjb7qS/i1uCNegGexp
 tXBUuNsuuhndVgitfjZps6D8p9adxaK8pXVSgdWHaa9GBy9gqauGN1OFPLq/n/qM0/ChaJySwqX
 J5+E/jngR0uQnmXE6hjg2DN5BALzwW+Jb5BhLvtugxf1TIrEiYuJ4tz395OrjRVzKy1dJL9lJ1o
 nyKuOrn5cPWdkbANFxSvCZJq1ODFjZzSXRy1XXvrSdfGjx8Hdk7c1DNX2PQZeUtfe361anySiGU
 tPvx5bjKgx8CcBwJUYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfX92Xj12odcehC
 78o2NLdGVWT8znCEyy3X5622fCG+OBzh4i2tGunQwH/iksx1LgBVBAlYOIAI67KtbQR5FWqRLAY
 zPhr4MtvZI7AvS+eI61zGTsuyDoH474=
X-Proofpoint-ORIG-GUID: S2chxVLPmf2UgVWCkIyhcdSAEF0az73w
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab54be6 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=yg7C0sGLIsusXtrQKFIA:9 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240066

The videocc node supplies only the two XO inputs. videocc-glymur.c
expects a third input, DT_SLEEP_CLK, and uses it as the parent of
video_cc_sleep_clk_src, so that RCG cannot resolve its parent and ends
up as an orphan clock: any clk_set_rate() on it fails, and it shows up
parentless in /sys/kernel/debug/clk/clk_summary.

Nothing is broken at runtime today because VIDEO_CC_SLEEP_CLK (0x8138)
is listed in video_cc_glymur_critical_cbcrs and is therefore force
enabled through regmap, bypassing the clock framework; the sleep source
simply keeps whatever rate the bootloader left. The orphan still blocks
any future rate management of the video sleep path.

Pass the board sleep clock as the third input. The sibling evacc node
on the same SoC already does this.

Fixes: 675fec65df73 ("arm64: dts: qcom: Add support for MM clock controllers for Glymur")
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index de7c395d9c35..26c15092bcba 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5758,7 +5758,8 @@ videocc: clock-controller@aaf0000 {
 			compatible = "qcom,glymur-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK_A>;
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
 
 			power-domains = <&rpmhpd RPMHPD_MMCX>,
 					<&rpmhpd RPMHPD_MXC>;
-- 
2.43.0

