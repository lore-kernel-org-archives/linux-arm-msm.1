Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF08E425878
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109430; cv=none; b=l/naX48D8S0VsdSANEl44C8ymLJ185tbsr/dg4cz+uNSY6CNIuTFhSAOpljiRC4wUrFPil791tVpS1BP7NJ2qN9WUolsaLL/Vd5s3YkDaZsK4pjFWyxHViE58KcpZoNrEcWb1DD6k3g1E+NaNtpojSRkEmRyKmrNd6cLsAns+Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109430; c=relaxed/simple;
	bh=vXbtYJ/0QnNJmWuNtoAZa8iC/TA2rpk9NVH6xFuPuFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VT9Ni01D15998JijoN4KZ3t+/duUweKNwHslGfJzQzqGa1ufGNQ3GO+TJculzpJwXYXV/3BJ6Cz4HVQjnftSWnsyYhwradHtHoqscdrUL0PsrOP0hdjAchluaFcpHNYhHBj+OG8bigHZs1Jtf08p2HfwnP5rfVK4BvfNZD2vbjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hBCoHoQX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cyqio0/n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hBCoHoQX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cyqio0/n"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kG9D3328465
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gXTM5F6UPAo8bhocaTwSxKvXBWJws+V339zaDC2FtUQ=; b=hBCoHoQXZsdmquwU
	MnyG3RvMoGRC6xJ8C2QIOEMsfWTrIsq7s0zgy4yRtWro8YKXfBrJtK7LkazUm/PJ
	4pLdaoEYtrKZWgOfHT+UjHeLIZoMVF2Q8GAze8RAKUXzUqp9BZj+vD38SHv/57vH
	iHC/6//G6ySZLxBpE62KjmWmUm6V1k17ClHf5d689r5KT0x/5zyqIGuK7v01FGle
	smq9BEMXRSrkhTLfmRy2M4ZlaSnJUFuHFPool0g0uHiDTrH8NL3uNN171TmK/QH7
	uDdj1J1t//qzSMaMVrHUN9tKKqPgknu15t618n30dggXZK7JGlp+eoHUzG9QZE6U
	Q6cNaQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdr8ar4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:50:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so777563a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 23:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789109415; x=1789714215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gXTM5F6UPAo8bhocaTwSxKvXBWJws+V339zaDC2FtUQ=;
        b=cyqio0/nj2Lri0KBykmsTI6nJ6SB7IjlArSj1slhjSgrl4zdK+uGNYjDfk+kuyApAi
         j0z/6WUAJVw1F81MjmEzb0uUvty78kTR2NBlwomZKfM1naSYSLSWWiRuGLq940CdhukR
         bZnkOuW88wufUsS3I2R3CRXm749Ua1P+h8lHCJrKc+iYauUmwiE0aj3EsoMHwR73oY3T
         rsYcu2XvrummuS3I54vRe/xdTyf81WvjsKCJ++mEw4CE6/aBw5VrRqikNxDTb6u/ATKv
         jLw3cni5DmEQgtvEL2QjvOY+BienL8VHkg98vHTBpH5iot/1aBXztgUyR194zBb3h+ry
         EWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789109415; x=1789714215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gXTM5F6UPAo8bhocaTwSxKvXBWJws+V339zaDC2FtUQ=;
        b=I9TNumB54q7n1WW6kXwuYP9jHZrWuJSiytnVk4djW3ZFCPcj310p9MbK67h7F82gnr
         s3uOiFvmgA13X4potkcBh1/DXTVj6zKbOAXZuuhMn1NT2vi1W/2N3+dbPa8kFRLg9B10
         RB7Shc8TevdpkpO8TEX/Rnr0i24Z8APUlQbmLKc6RMDQeVXU0UrnHuqZQ3ArieFCVhGu
         LZb+9zu/RJeTB36zk0HHfH12cNeUEPYevpMZDvJ91V/VpNP8guiaEutQxOrdMXaUP5MZ
         s3pFFtUhGKXBLq2322WWixrL7URDhnzGkzUPyZhZLIWlGyHeh7VZbKOHOtHHWroc8MrB
         DAyg==
X-Gm-Message-State: AFuF++mr9iPQ1LQnIzlw5lYG89tGU1NyT3f6dLdYGiikQzGNErhz7SR5
	sjUPp1t20QTi7ueynVfKkGWp6gxGZVqvnfLeo7VnsQ4826py4O689g3EAKPs0XLLBVJbKC7A3cT
	QMWLnonmu7/nvdqDNLiWrJ3n+RLJ1tyS5ncGpAzbdxLT2upvzhXX3ugHN/5iBwDRREVb8
X-Gm-Gg: AYBFou0oM0eD8azAKoqfwhNgh4mDl1P3hXV9/CsZ4ZJhatWP5ohXCCpRhY58wgbCuNc
	hJIyPJB4AIZi7PefVrEgQr30NU83Bz9gsCzl1SXqWFzA5taWekrZJ35W1qFed17PxwxwatmM9tl
	yGKPqWzXBG030L47iUIet2EO5vEczBy0pg7RN8w2nBxFNRbI0g+EYu4tAPPMm8rO78F1weeKR2r
	xeoRSCEQKi76E4v+ATMbxDrBYqzBltgrPAO6WORGOBqnnOAogzJRHBgGdT8lYzL/PC4r/OJ9Pii
	pfZ7VyDtpAyJvZbUWFaf1H8s7V4Xwkbs733YNBRqJ/V7Ll0+bmDMAEU5tK6qnXGXC2Yz/aF/IYc
	713JhAjFxvxO8a2FNhRvr7GSOPc7uNVetsUA=
X-Received: by 2002:a17:90b:3d4e:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-39d9bd8f788mr4863075a91.6.1789109414450;
        Thu, 10 Sep 2026 23:50:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3d4e:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-39d9bd8f788mr4863009a91.6.1789109413867;
        Thu, 10 Sep 2026 23:50:13 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm3934383c88.1.2026.09.10.23.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:50:13 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:20:02 +0530
Subject: [PATCH 1/8] arm64: dts: qcom: kodiak: Add t-power-on-us property
 for PCIe root ports
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-t_pwr_on-v1-1-c9eee197d082@oss.qualcomm.com>
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
In-Reply-To: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789109406; l=972;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=vXbtYJ/0QnNJmWuNtoAZa8iC/TA2rpk9NVH6xFuPuFk=;
 b=V/QjQ73NA+Zxxi3EPxnngJjNoeGrZFJhj+/yyYr3kmfD+98g5tZEGBYgE/yxDmW1wvHKLr3ew
 FgzQB+aIWePD6GegNwwisY+IDrIkKOnaEJQK4a25K/k0bRfuBIisaI5
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: dUpRHXj59Y4CFnzDdtqrITfj6zC07A6o
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa3a4a7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: dUpRHXj59Y4CFnzDdtqrITfj6zC07A6o
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX2kdY6vRm0pGs
 KVPeJbgKSfQtSgEBNicrfLeDOuV7N5vwTAow1a7QNjWkF5YtnMJL+sX/BBBbTDCF7SS9LU4PL/N
 VTbjl2Gg8JqrFQ1J0YUkRH6EserVz+k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX2Up5Qb/EstWe
 xNdVPCit3dfaEMUs5W/8HvOPh0K5lGFMMvm7E4AuYcRPb0chyfp4ZGiV50EABVnyeaCVos/Ltsg
 /z7IyIbWW5HqzsxDyhbdkdjET0B+u3qNu4PdiymJtrW+nJTEB4TFD4+rwuT3BDBvyqlmpDkkEVX
 S5N5cWSLHfMos9HcE13FvuAupKPrgRaXCInjzpLvd9rh/CdDOVlcup4k3RxjeI26WHV8svEf5Yw
 KFraraX5HTWoGwu+qnR8FJCF24qJHO1UfyXuhml2N7A8mOVkVvazoc6pukhWj2RSBOUEcGdnXLi
 ZTbu/a9ArUif6K+TPVSzlzmg+uqd7J1JZB4fOTyjVwEPvGihrn9OBbf9M7qtwaamjzqmwx9xBEi
 hIklrHY2IZryAkthQl6eD/y3op+3WjbORvlJDiOLyaAtrMzxCneC57X+gC2dKZdV1PHY8/QY7me
 vO80yYTzf4nyh5LsM7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110093

Currently the PCIe controller is not programming the T_POWER_ON value,
which can result in improper L1.2 exit behavior. Add the
t-power-on-us property to the PCIe root ports so that this value is
correctly programmed during host initialization.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index f2da3706d5c8..54acc7d9bdea 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2306,6 +2306,8 @@ pcie0_port: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				t-power-on-us = <80>;
 			};
 		};
 
@@ -2439,6 +2441,8 @@ pcie1_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				t-power-on-us = <80>;
 			};
 		};
 

-- 
2.34.1

