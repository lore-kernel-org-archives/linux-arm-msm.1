Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699482;
	b=GgN3E4hulaISxUcqcFNvi6JMiZ5extJKU/dIwauk+wUA7re7DA9jRCdZAnXTNwaOhPww
	 eIhYB8N3DZSBwCqX55uxEAAzr62Zy1ndmVnUhHF5Y2PrkeeMAYkEbBcDdz/P6zqEBS8OO
	 pmKQkZLxhbcwkGFd4BLcofbhKerT4HO/jiuHjkfc+kua/nfI8QG3KdQUKZEJQB28EqyTp
	 /3qWesT3EoRxelc4dfd9vmOkaLBW9c9DO07QfP00ToWdpq/3lrJpmdnyvUnSDdBHD/peJ
	 J2smWH8lZMvYsOP+iBz+ZUzLPbxzzE6yHQi6GUbFQYJrizxBA1Q5qehftqPbXyijJHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699482;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+4OdKtBkMlVocSiOViDkwteYw+81H1U7mhaDvSgfyr8=;
	b=blakFGJcv8sVd2UdU+hWLInIVFlobaT1eEbEc2uazNqEfJdw9MVPlNPCXH6sSvt3f3VK
	 lHBAO4bgvI+sSiOmsarymqRr46Zek+RKl+xJnF7+abzrKx/0ptx/O+HFq3/IyWHQct4Ju
	 CADcLx7tbQ38ZpVJKfnfp4VHVGNkLghBdRr0SAdm0A2aesZoB7i2bdHcSclJcU6p0SlPP
	 Amf0k79bIef4VS+tP9lausKD2RB3UhbLVD+VecbNyJ0XVA+zov6OJV17jYMWYT5iMhDtR
	 76ZX5I4OO7MfuxqcAW14KsP93Dij6AVs0PZkTJ2mKHTGjyIB6ewLVrvxKmpKI1TX2Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=beU7UKWx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Egf2NSox;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894CB606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 13:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 894CB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=beU7UKWx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Egf2NSox
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVVCI1275445
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 13:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+4OdKtBkMlVocSiOViDkwteYw+81H1U7mhaDvSgfyr8=; b=beU7UKWxdaaocCBC
	1n85sM1okC5pRja4DCnWzEu770DweE5dR9AL74GOl10/L168x+Hx3VL//I9rvmT/
	K5pZ5MWTmOLsVYKu9tyjnS3qH1QKQ07+CmyUEyPir1TNa9iGFKPsp4aBWjLoQDkh
	E9mnBOoqQOp6iw4Hb4RNz+9v1RF9juX4M+Xb8yFTIVEusso15kxlMbiMpDKhoLmW
	FchvGshxJSQzUilEdtXZSloditLxi0kiaB2uZwIxhJofbd7ywemMbAuuuMod/x1X
	pVaqtlLltn0wipbxL5svFcUfGYay0byTlDyyhEw3qQYRpo3hoMANdzjNFdoaZocS
	T36jrw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7sdvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 13:24:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b7614e9762so5059311b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795699480; x=1796304280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+4OdKtBkMlVocSiOViDkwteYw+81H1U7mhaDvSgfyr8=;
        b=Egf2NSoxIbs0yvl91UdP+m97xGB4+dLGulX3Ho7DbOBlXcgooRuHB+1mshso4jczGr
         xqQ16cS1Du/fUYlZQcpKLkYvr1OU21Z6SYMLLZJ9RzUq7FbQA4NvPuGa6zTfd06BEikl
         Xmqy/RSJj6UNr+I5MGeiNn5E1d9FShlp+MQ25ICIYeDOzQVD70sXVSdgl5vdlfSnmZ2M
         SzardfQMO8MLonSbrkpEn1lM8iYM0KyN1lXAMdttGWVUCseOLAT2kVcMBlmsgy4EULcG
         IEQVf5UJDLB8ySjDeG99CEYgmwB05PHwYxvEdnl+a8D8lOO9ubt+u0qlzK5u5VOy69v5
         nAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699480; x=1796304280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4OdKtBkMlVocSiOViDkwteYw+81H1U7mhaDvSgfyr8=;
        b=gG5wztfb9st/uRJHZBCfXdcoidRcaDSlfd+g3Wq5gwZ6oR89xsDs0Sy1eAi/YfGSDr
         1h5LO4zxu402IIeBISBD4CNm7yNernnmFTBef4DkOa0XXscyYHRFEe742IMCYT+mzsPq
         oKw+FpgJ7sRtSY8O/8jB89iWBgsmiHqeL8DcHHZZdy70FYZIkwsSzsEe/ZPJmPIDprZn
         1brH/RlctS5jgvglIFTKxEwfhqRtD+HAyz87rxC0jm8wQufPsCA48as2koCQV6czV7xZ
         oZSE6VvVSdu0n7N4AOHdQogYU0knLu2VyuTe0fevC8HCYobrR/R6DRxAVMhlrEDHjFcU
         HFiA==
X-Gm-Message-State: APuU4Z9aCUGcAp5Q0uKnasH7ebsdnmweDmwnhvZs6xTBzvWhRZcDHFPh
	VOU35yyTi6u+NxYPq35q3SWBwq4IApqbj0njdANv2lEOlKOXmjRvKmY9RY2ThUPXeLuZFWjltHw
	ld7pOzGocVydgsYExB4HwZvw+Na3cqHYdHtvFEFfLmxCH6IK8dEdG3+smsx0mbqeFcqzr
X-Gm-Gg: AZFdTZd6ioEV2w4WOU8SWznFN6u5TGO9VjMr34raz0WCwwnN/ehE4nLrYlmhkY5oa27
	1AM4BCIIHQFfBrJsyX5Jch2POULyAz+h47xUgBfzLa9iHwS/UxvaIKKMdJae57oNntwhuNpuuW0
	u/H7YpbpejDQmxZwYCPFtvMrmIBnqJ13ZRYI4GTP7vUbhmXQAVQHYcKETw/51VzAye4jX8znysz
	fntRjO3ofiJNw1SUj8XY56wv5XNmVmuUjiXHN7IZETSdL+4LxPUJJPpfIYMCJpMNL+cM7XU8LRf
	zZJ/DvVCM64HywWAcaUF+fWcLqv3TReBajBniKGxhVEzkUFw5kveLGhpm3hZRU5E1bHckU2JVYv
	scZeF+aVH9yy4b52cLo2SzSXwJQRU5peSjrSOx/s9ZKNHwycWkHvVAlaenellVetniVNBobzzyw
	lUMKQ5
X-Received: by 2002:a05:6a20:7348:b0:3fa:f23f:a1ea with SMTP id adf61e73a8af0-4014e35c59amr20846108637.85.1795699479668;
        Thu, 26 Nov 2026 05:24:39 -0800 (PST)
X-Received: by 2002:a05:6a20:7348:b0:3fa:f23f:a1ea with SMTP id adf61e73a8af0-4014e35c59amr20846066637.85.1795699479172;
        Thu, 26 Nov 2026 05:24:39 -0800 (PST)
Received: from hu-gouravk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d03adafsm11232196a12.23.2026.11.26.05.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:24:38 -0800 (PST)
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 18:54:20 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: nord-rrd: Enable iris video codec
 node
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
Message-Id: <20261126-nord-iris-dts-v2-3-bb88dc5832ea@oss.qualcomm.com>
References: <20261126-nord-iris-dts-v2-0-bb88dc5832ea@oss.qualcomm.com>
In-Reply-To: <20261126-nord-iris-dts-v2-0-bb88dc5832ea@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Gourav Kumar <gourav.kumar@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795699462; l=960;
 i=gourav.kumar@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=pHs2EXt3Ly7kxB/mmRHMk/SqMUVWrt28kbSeWVTkUgI=;
 b=QTF9LNL5sLtvowhW26NatXiRfhf4o1XNS9zZzkhM4ntqSq88UeLDZoU8r1Vy7Mv/ez0CqZiXS
 pJo6y32T/jHC5WSqBNisvj2xE0v6zg+B11SiF0UflUtRm405YV5Nn1T
X-Developer-Key: i=gourav.kumar@oss.qualcomm.com; a=ed25519;
 pk=pp/OfJjGYucjyEYKqArAaVDesbfWZ44Dom+QtAdDZ8E=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX3Ib41SXFgaNI
 Olwwc7xPRVqKdyJZF/yC2kkhXoaTWx6DmnnKHer6vHCyjv+Z3wKMb1DqZlzDkxC1SZRKaJhEyvN
 RPOEM9UIpvjqDLTpxHpxMiCweQ7ZMug=
X-Proofpoint-GUID: NiTUPYGzbJLmRMcdxdZPv6G_oQHbiEM-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfXz5bxhBcRnfur
 egRZ+Yl1Z8WjaY9oRDgZ9HN3j0NVeQNeCe9HGhi+1YlhUirXcpY1y2XYQS0g4YkpDleZcxFu6XP
 zC8gUL5bqYpPiEf/QaOZF4h4CTVQzpfEomA3A4rIj2AXfAr1CNMTAy03OPjsthwL89jJ6uTr+b+
 caK/bGyjHGZHfP+bHuGipaVd8uKFBZ78mo+VN7+7jiHQIoxwJLdLK/V691PywgFIlp4c8rDgcBs
 IxZ1Ceo9Pp1Oy16ixXKOxBVrFzTLiStgHMZURtCyTvHJoLLnXG4yJIgxkSi3ID2eUMk9z0UVqZO
 8sEVGTcR6lmHjzAGlocXvcZJteWAmwhgWkA3eeLwYJFxXlSKJhK+4aZ7KE51lZ00t9Jlr+Ywjj+
 BzWJFHB5nE9HeznCmIWMnGOyiSeldk3BmE5Vv0Vt+L1txQoZoAJpLsoLuVKC1ejeuXlIzRBO/3m
 8IxCxcbwfEhvLlCRh0Q==
X-Proofpoint-ORIG-GUID: NiTUPYGzbJLmRMcdxdZPv6G_oQHbiEM-
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b083318 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HtMBSpEu5xi8YlTHYloA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260052

From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

The iris hardware block is described in the nord SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Signed-off-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 827d3ba3a2383..cd57aa8b29c27 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -475,6 +475,12 @@ rtc@32 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+};
+
 &pcie_phy {
 	vdda-phy-a-supply = <&vreg_l6a_1p2>;
 	vdda-phy-b-supply = <&vreg_l4a_1p2>;

-- 
2.34.1

