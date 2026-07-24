Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5014343F4DF
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905247; cv=none; b=q5u6XKAYn9BzVzKpL6rUF+yaRyv9/veZpX9yJFa+AoFj7ezAfhyuP52mKc9qJxrkSd699WQQsDWNIX0BDwjmPsSrx/ARoqDitJSBnqW7dSDJhgMBBYDSSWw0afY3UcLtUfAMrWmqI8Z7aYJuV11JCdBXJ3HmG4T8LpEGsaj2ewg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905247; c=relaxed/simple;
	bh=wbagZecBaQaRTzpU5oWRY+OBJJnCD2znP6i38nr/QN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tm1kz9q3cCgYXlx3/GmWXmlUPcgQUCpfUWy+lBAGTN2/DTgx8aHmUnqrCjVcegtyVKgDT/NFW50tM60QQ1PXWnBpB1add8sVEwKN0BMu/H+GshXtkJyJCoewDYyHafoDpLlGW1Tyl1uzMWHZ6TPMshdvUrUU4jH0XXDVB5ap2lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jt6KMXoA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eV7Cejxm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jt6KMXoA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eV7Cejxm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbMPl3071684
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fla9eVpDtoO8o2/FJMp5AumGNTB0vGzRk4H0vkXm3gw=; b=Jt6KMXoABCG3Y554
	syw/UST7zaZqjp9sQ/ZDNusMUycnpCAUBnpGXf16fmg3kjXibgqmVLgGpC0KxfX/
	PaMMJSnHzIjgAg9HULthgXQzodtFRxuA3CgHT6/wFUWk8a0Gm9/WuRpfsNJZwaQn
	nPZ2k3xYBbG0qKeQ/DivqjTu3YBqj3xyQsng9xcMKC3RwGOrIXu4AR4SGvMdTVQ8
	dCihX8hos2I1FdClxVp47S+hZWcZqnnTQIrC3cd1PgVFTmv2TY+azsLr6hkoMd6G
	mKdTGgSI8VBvOKpn2e7ecC2m3Z8Sm9Sbk4Qhi3SknMBCvTD6NZFe9yz3hKtt0ule
	wL8Myg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pwaagu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:00:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb6823efcso5164705ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905238; x=1785510038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fla9eVpDtoO8o2/FJMp5AumGNTB0vGzRk4H0vkXm3gw=;
        b=eV7Cejxm2B4natjVaBXyUevgPp153r4SuL1+nMhEtz1ilZX/RxzEFHH65sswW+rELs
         n/17YLEmn7yBnEvn8QxSliUbaMpccwQ4mh6QN2LgZPoReRu+my2IP8qlLe172b+Jea1s
         i+lKBeNJl9B7Ccqmkdb30GEAhmN/lbXYtcVyFcV5W9tC3vUnKQ3bG7SArefqYs3rh7BS
         IusYKMqS7tEQWIM2EcDXRNcNnEmoLAQKyvnGT4hruYC7UdZhb8MXexoZ4VxMakM7B/yC
         9I0nWzjnJVZ3V+SWF/K7rXVDuNim7w0jvqv4o8rtKeth7GYiVT9KB4z02WMSn5hAtW7q
         qD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905238; x=1785510038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fla9eVpDtoO8o2/FJMp5AumGNTB0vGzRk4H0vkXm3gw=;
        b=H5vRiosVy9Uf565R0jh9ClLA8okI2/HdrBJd9CfIHv5L8wc1Ve1ayCPGzCeAqlzgCM
         o3q4nbjEDEej8xx9qz+E/HChTidd+6ZkIkLup1GexQDDvT0+A/4d7SgIJqo1rgOAkcGm
         RG/WpSLR1PPNcOA1JtjS3/F66y7ZJuo35v9tSAzPdhszfBXTwIKuwDfvLO4geSgUJlEK
         5m+zNstzWKvmNtNYdKZFVW3W25lbHubrZOrAcxWcfBejJh5ukQO9XLUZbtxrBWP3XpcE
         gOt6l0+VXjUCgiCnO2KcxTIi72O0tDZYk0kDFqr6PYzXYYjCP00OFTW8SscIRjxnvwdp
         7zpQ==
X-Gm-Message-State: AOJu0YyC5Y0FxxaYIRqI7e73pH4YLTd2WG0V/wVqpkx+PtMsGl1jx5iK
	yxydPfSzNBJ2WfnJa6wh88SQ9oQxlL+h5naBRH4CcTz3b+qUpvP2JemcZRRdeFaPWxN8yR0EqTH
	ekdm5ilPFk3s+4l4D5PuNU9411nGpDdLqnmG1XvP+zvBBTvE7WoH1dnlDs1S4lh/d41IJG5+s1O
	Wf5pGkqQ==
X-Gm-Gg: AR+sD10Rz54yuAi8u0ccBcYFt0L+37B5Z8eHS5KxJE55ty5Yqv/6Jh/YrXOFw44KfqJ
	Jh0BZZlQ88xp0WqnjdSR0N/BFJFSFhx/uPNobMYceO2Xvfxsf2rn39faTMtifhx1G72T3tzpGcY
	jQSZKQRmnpFhNY//pHsXDqm28fEalA1LG+oWn6um/faAiR2QDOyu6ZFNmYA0SunqmCQU4bQ0KoI
	qyggMc/bRdwSR4KUaxEDLhu9g2Ex5UtSzCb/JGYl85LXv6YiLjdTZhSUril7hsbGz3Ife4Lywmi
	X+wy9MyqO8F+d2gzXHlQNNEfRoLIs98O4k8f7l5QbQK239HTt+e0aWrwwU8QMniR2JtgRr4liZg
	95KF0kp65YofHtZm32nLIwPCKHU+d0xGgBqQ4RGMOluY=
X-Received: by 2002:a17:903:ac4:b0:2ca:ed41:d331 with SMTP id d9443c01a7336-2cfa708d196mr89843095ad.45.1784905238195;
        Fri, 24 Jul 2026 08:00:38 -0700 (PDT)
X-Received: by 2002:a17:903:ac4:b0:2ca:ed41:d331 with SMTP id d9443c01a7336-2cfa708d196mr89842385ad.45.1784905237511;
        Fri, 24 Jul 2026 08:00:37 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm621809eec.25.2026.07.24.08.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:00:37 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 08:00:34 -0700
Subject: [PATCH 12/12] arm64: dts: qcom: Update IPQ5210 xo_board to use
 fixed factor clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-qcom_ipq5210_cmnpll-v1-12-a8b8679d215f@oss.qualcomm.com>
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784905224; l=1388;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=wbagZecBaQaRTzpU5oWRY+OBJJnCD2znP6i38nr/QN4=;
 b=II2tJeI+QYrAlC0j4VnZRc0EEtf+s+4DoQ2s23PX28N451oypkU+KqQirS4y3dyrCa8XgagYz
 ENZHwYOcxEEACdz3lO8dJ2BdSOYHK+NC4EkY82URuCHEcJHcEQMvlXC
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfXx6S1B5KN85M4
 wS4Jg8JNFzkSilhJMiWFuhx4ICS5i6GOOYgDKRSUOnRTmE2afdJjYgjdEI+qCYtvu9WyHHBlzUE
 k6pUE9h+AbbBAQJQQVOAQKOH0ngv/8RE5SJnl0w8XvIJxhywx7LKas7jXhFlU5dI7UFwUOuLMn1
 VhxCZ6P4D+dK7RjOlIHIQKle+yJkMN6GsEZn+8OVCOr+5p7ZmG1pG9VaI+Ll4NcGNzR8iuj8lj4
 iMVcOt6N+zO4eGr5tQfHcdNIeA4AJXeYPjUJPAbhaYkeUITY7jT88dUIQorx+YCvccZi2GpsoBb
 SUes7yNGFniHz+o7tkxyC0o1cVhDOeiTtAOPz/TKLLK4mLOrDbm/yQznKCn7iDD4hPif8mr2JVN
 vrEhCVhC9sImYB6IoSDYYv8I9Ih30c2Kc3a9fNxziHfciT8L9azBM7c9JRbKSeo6SJGqHLtmUYH
 VrXrIxEhKKalZfCqzNQ==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a637e17 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=CPdYy-Otk887xBsD2wUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: QUSK9HNp3cbY1YCu1L6lmoLQawLnowo7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX/Cmd7gThgw+M
 OZWkDrnO/BJlo1+Wa+ziRHOt0nEWwHF71EA9f6O1MXTqv548rmXVKCJp/BHVMqGjBAYdY15tcXa
 KSqOibhrbDUpZt4kfc4uvMgu8hrbOUw=
X-Proofpoint-GUID: QUSK9HNp3cbY1YCu1L6lmoLQawLnowo7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240135

xo_board is fixed to 24 MHZ, which is routed from WiFi output clock
48 MHZ (also being the reference clock of CMN PLL) divided 2 by
analog block routing channel.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 7 ++++++-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 7410d092814e..fa537633d5f5 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -85,8 +85,13 @@ &ref_48mhz_clk {
 	clock-mult = <1>;
 };
 
+/*
+ * The frequency of xo_board is fixed to 24 MHZ, which is routed
+ * from WiFi output clock 48 MHZ divided by 2.
+ */
 &xo_board {
-	clock-frequency = <24000000>;
+	clock-div = <2>;
+	clock-mult = <1>;
 };
 
 &xo_clk {
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 9bbd55cc1e75..45026f7835bf 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -26,7 +26,8 @@ sleep_clk: sleep-clk {
 		};
 
 		xo_board: xo-board-clk {
-			compatible = "fixed-clock";
+			compatible = "fixed-factor-clock";
+			clocks = <&xo_clk>;
 			#clock-cells = <0>;
 		};
 

-- 
2.43.0

