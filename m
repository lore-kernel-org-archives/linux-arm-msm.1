Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884085;
	b=N0oKtevi72xrLYhc7y3ayLMrd5w6l+NWEkRkgudx1OlEUm4YJJNXgj/fU41RyCQacAEW
	 jA4rfEtO6Psv3ob4irmhg2ZLOmTNhMVAdZJ1mYF4Mr8l11w/iwDkP/aZzOQ5YX4UZrSRK
	 5Mt3Bo7FKfBi5IHi+47GfZj+aM16UTkhEC7AOiYodo8aq9KVxnkDYfAKKjucUdkUp/5N6
	 bpeffg+YL2fCfkfsyhwUysYt1OCHA+uPqskm+fo4NxfQzo3zUzaEDmznK0yMdX8c+HaeZ
	 DLH4Mw8M4lQ0jSttMAeMOEb5q2VHgfEhRjnGndpRfZ5iDFli/A7vyHK+uUdxPaOa5PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884085;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qGXbSeZlkSz4Cin5h1fvK5nVxqBe3jrdrGrRDjDWmYs=;
	b=vU8e63rG8sNWocl2KP9rBnXs/81vBTSfICdkQdAIXMhAgInMSYL9cmwNRL1oPpAPa+if
	 3t8XwixYSDXTGBqnCrSTY3iqOIoRIBjy0d80LAc1Gh+VVbw8hxn4gprUqg5NiSVwXTLV+
	 GkFQkU86JMSiS2AizIie0mCr5BesOKjgSMtRK460kyxxBP5nUWsNo09WW1O+jQWEW66WQ
	 dyadsljzoS94x3Ik8yjm2bMMdwhkAt9lzybTiXdfHOmMtUsK1RwWdxungNVr1SNamlQ+5
	 C/CfGTP0rom0EJJn5KnBy5hXSgXQshCtc5wJZAuwF0YSdVqYb6gNusKb1pxuiRXtLlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f2Xx8w7s;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bB+dvqV2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBA1606EE9A
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 13:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EBA1606EE9A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f2Xx8w7s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bB+dvqV2
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59thMR3531994
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 13:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGXbSeZlkSz4Cin5h1fvK5nVxqBe3jrdrGrRDjDWmYs=; b=f2Xx8w7s3yMUKtuF
	IvYhi2RQTzagLYMaqzVa2WnLKnzbYJ+pCUvBQL0UeSziQmcEp+dEWf3WIdDPiumV
	9itzRHLAZNA7wcenN9XD7YcLQMKznGih+FvNUILXUfvXyczJzrOVbnGNC4F7660W
	ugKDI7WSMZIiFcyEtQdbvv6P/FDd/DCLIZMhsNqsGzgg47bqPF7hUx+3DhGeaq2w
	R5AMfiTNc7WaeDafHP86mLPEPUfBwDFoaGHaAoflCelulEtSsFObBk7qMrlc3die
	mqvE6fIgqHyiQcJMx9SD+S+tvnIh8LgaFf0l8LtXxPpwo4BaYVf0aktPeLqTpkx4
	K95S4Q==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksq9ryr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 13:08:03 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-67be4f2f42eso3030644d50.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 05:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793884083; x=1794488883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGXbSeZlkSz4Cin5h1fvK5nVxqBe3jrdrGrRDjDWmYs=;
        b=bB+dvqV2NXnlZvco1aHuMzn57IqQ8KQ7XxASNn+6tLDbeDmzwIfyPz18pYwddOWH6Y
         1gFXfmpxJQalVLejXhVmuNhmeebz3VrQaNSpdwQylOKYHQPigOPkViwq/4rE7Ab64995
         IwjDNxim2seUyYzHZFjs/nhbS9I0QukaA4+AklE9dMvnOXqd8s5f6c26sdQ46crDxzCc
         EtySKfdsDnNGYHr4nmEEpb8isCRzB4Za3cLDrZ6G2OmFpLFlojyWUCIqbWMhag/kM5uZ
         FcFktBXMhsq2M35/9JZMRVSqm7SPqYWVQsgEyEQOk3olaVEW7kradsrJIG0u2DoJ0XHc
         ERTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884083; x=1794488883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGXbSeZlkSz4Cin5h1fvK5nVxqBe3jrdrGrRDjDWmYs=;
        b=f1NHn9u0DUWleYiQwDOpMU7BCKFwqQfqlMYXnQ8/CApaiKgNLLTUUVX/1LQ7oK398g
         sfHR/5KqY1q3bgWFHdDhe+pTOslN146nSBRdVslURWpiNWlIkkeYPGgl67sFJ2XvRm4V
         ODymrGPbqOW61qQPxdZDxMeSa9uiAd/UBXMQchcAwPVkLKNbuVO/YLZtZIVLjI9hXWDO
         FmTjoWqcKzkgvNc2yoJ7dyecsCy02aIO2A7aF5/oWbfXwC+DjeSzVA2a8V7aG/npc0E4
         6vyjbrmtiJomYH2O9XOzQrINRqQWxbzTKNRAqb2N1SZYgmcEm/67686Jb9VsxmAtABNh
         izWg==
X-Gm-Message-State: APuU4Z8Twx9kuz+8eTgAqs9mNQXABrdoIn510a+Zhnq6gfsA57H1Figk
	D7SIljTC8mnDLT+xLx+rMEkJMkc/IOWIpUBlenpPBfEqVbU3vmej7R3SGnCefPp2auYcD8y8WhH
	HlLTL2+1tZMxKNlLliVmODqjBQ5/LXAaI1WjSJNxTA8bekaYYYJrYsQKYqELhYEhG/iis
X-Gm-Gg: AYBFou3CIG1t79nWthJH18mewgloLC9wW1KjFjXg2af1oiwlbV6xU4q0uhylFZZet39
	KQ6QaA4nFct5DJVUbW5ewtuu8MFoZfeNuux4g/LYcsiGb5d5Lpqmf6+pB0LSFkYx/hVZf7IcThi
	gb731wV8WKPJ9YvJxsRUigd01sk+57v0/FQ5B/pNYB0bYYdj48b4Ldsr12+XhaDIyJHMFHzKhqs
	eKegBgE3YQnHT/xwB/21bnjGw01v1CQ94c0U8dGOqCkrGWzwdvKFApOhldokYIvfuDcwFTKGHQv
	6C8sc/0uRmwLAhOgm3WPfDE/JwBvWffJyFPgyrwUBl0CN8uYauNN+Fd4jMu3T9FcnVg1TAX8L9M
	FZ5faT83TdKqWZKSekP+hfqGWlRdFzulZLlWQL5/o2lHZJ7BnVjNW/4zj9au8j9oLpnBtPhcPWR
	ihrDGE6Ix7C832wXNS
X-Received: by 2002:a05:690e:108a:10b0:676:86cc:c3ba with SMTP id 956f58d0204a3-67ba4f54b7fmr6712609d50.68.1793884083003;
        Thu, 05 Nov 2026 05:08:03 -0800 (PST)
X-Received: by 2002:a05:690e:108a:10b0:676:86cc:c3ba with SMTP id 956f58d0204a3-67ba4f54b7fmr6712590d50.68.1793884082464;
        Thu, 05 Nov 2026 05:08:02 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309bb4406sm38915937b3.40.2026.11.05.05.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:08:01 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 05:07:15 -0800
Subject: [PATCH 4/5] arm64: dts: qcom: Update IPQ5210 xo_board to use fixed
 factor clock
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
Message-Id: <20261105-qcom_ipq5210_nsscc-v1-4-d4fcb5c32b51@oss.qualcomm.com>
References: <20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com>
In-Reply-To: <20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793884066; l=1379;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=5TarJGRML2ryvcb/ClCF+1MotlwLtOVZ//s8pIACGiY=;
 b=3mqRC4X34pzKkW88rrjp6qxCP7hp3Ti8ZBVcdSCHjWbioQuMLytsd7ZQFXH9LJDd254AKeU1X
 UORE1rhCVcsCm8iT4fKvmQPNiXsSy4KDI90CKFvid0gAkha3KqfZvpp
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfXwSHaVRwJ5j9v
 bfgz0xEEA/i/LYC8csn85b87KZ+8BPjMKv53KoCguRY6o/EdabdR0+mtZiq2VEEogpRDrLfBcnB
 lJWk9QxnCLLco3/qn+yGeOVbWoN7VCcNGxZiCSq/CCQuNrNCtEeo6tFeD8I+0dGhGk9eb2vWXQ6
 lRfMQYTQOfZxjcGm9PLvM3P6ngi+YnC6w9FGwgOY3Vdb5aF7itjZ/gtQmSB0W+Y63NiCVUpLOD8
 +EvtPc4gh1WunB89BgKP5hv/doyqy1nh0y8UqDy0WP9RzahjZtaJdPsFpLajNsB9KS3ZPaBhFU7
 b0V2cGZeOniy2SCPZDo9xP4STP9EWci2KlQnTkKQe5M/ZeA66Ix4Ec/uy4visbGOKGzdONvR8fB
 XT5Ba59QTnh4h4p9xAGggdSg0UeOGwjaCaMLp8kFl5ngux/lHWTej7MpMh9RZ4XPQ87rV+XThXz
 dGhQgMBx1OqO7oSrMBA==
X-Proofpoint-ORIG-GUID: cFuDVFQCq4DeIS2zY5CMosyI4nZV0Ss1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX6fvnpUtbxfm3
 8aoKEsOJ7JLWKhxhuJGjcuGrUbZw07wcRWdbydqv2FPo8o1dKH4DP4LvgzHj/750bFjVBhoPXp4
 Dlh8OjA8PTxhgwfluEXcANJuzFR2evo=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aec7fb3 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=oqiXH2A-fwTjus5yMdMA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-GUID: cFuDVFQCq4DeIS2zY5CMosyI4nZV0Ss1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050052

xo_board is fixed to 24 MHz, which is routed from WiFi output clock
48 MHz (also being the reference clock of CMN PLL) divided 2 by analog
block routing channel.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 7 ++++++-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 61a53361138b..519307c6b61e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -85,8 +85,13 @@ &uart1 {
 	status = "okay";
 };
 
+/*
+ * The frequency of xo_board is fixed to 24 MHz, which is routed
+ * from WiFi output clock 48 MHz divided by 2.
+ */
 &xo_board {
-	clock-frequency = <24000000>;
+	clock-div = <2>;
+	clock-mult = <1>;
 };
 
 &xo_clk {
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 52d851a0dc2b..0c1ede0f73b2 100644
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

