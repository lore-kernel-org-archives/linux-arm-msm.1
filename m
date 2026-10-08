Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2186443307
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 08:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447078; cv=none; b=ZWHOWHCbJEKkKTCD0+ifeWvHIuraiVlOj29Vxmk5U4BqY8LJtaYjtQk63JBSgtMRQlK1lCPY9nJUWKYBxbYDs8MON0m3/nfEvBXBQVu4ESDIZsx80bRFQDkc/IhoZwxxaFNs5YDlC4IcUUnY+doi2KmROpBxvjZFw4RDMQmNQPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447078; c=relaxed/simple;
	bh=KLSCJNqWTfQH3hCgEppY4XAKXGuCvDCp1TPzxwkMcv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dMV95lOZ6AB4v5n4sEAhO/IhkFkgEktvd+jRo/BxipCUP0rH96QCwZybaABT2nOiwKF8RdzEW10R0C1stYfUfeBhLcBVgmeUrLhuAzNE9tXr3PNZ6oj3VSJd2OGf5/rsBIjaWjbTOgYrrgMH0uAvSAh/OnHy9nqb0boMqCfJNJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBbLNoTk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DFntsM90; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBbLNoTk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DFntsM90"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KaXW730846
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 08:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+YSuDvOoF29
	231NTS5Y9qMD1wu3gOUz6rCSgcpTgpGg=; b=kBbLNoTkninLLPGDlqi3hsZIptQ
	a/40r68KnX6acR0fd66zyls/hkS2Z7hYP6kaobnupT9oVAqstkTfCsIVzqZKkxim
	XMiyI2MnHNbmRhvGqwQxkgkOs94yGeP3ZxiWbqZ0vgWXuk5jXsG282myZ8tAdyzN
	sUfaA5bOfOw19E0+Rc/xOjKtO3bbS/BL0XMfoRI90MeAQXSaW8sa4evSiHI5G7mK
	FbUsQRt29eAUoJu7VyXdczJTj8x9ouvRbqzVvTafdcH2w/ilOTVziQqhUv5pWlEp
	RgBBEHEsY+83dZ90QS9JNyPBCzkqRiqmVqeqirO8ek64w9KA+aVAaXCT3Ow==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe31tja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 08:11:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-313d1015161so14490179eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 01:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791447074; x=1792051874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+YSuDvOoF29231NTS5Y9qMD1wu3gOUz6rCSgcpTgpGg=;
        b=DFntsM90gzLfHlfqVYPF73BoRHH6ehRGRoSHoIuhXoQ9BqycPa2ra4+rNpAIVuyW6g
         0aDM7XtQg9AfUCvdthqHLpZigjPhEAmQvV9R/cJNK5AYGZEE9VT21YP1s4cZvUkJNI8p
         QFM7hjZ5bOA0DBrrmeO0Wkct9a+iL6Z4vTIH+qyoDvuTkxo5d/RMJpIjyYitnyarPjcC
         mGf3ht9jRS5vgyZe20FIH2HPa0DJfZxnNAQJtH+lKxY8blW5OIS3FJJdCbkV+tcD4cm0
         TtdLtvNbyNk/2inTClojzrQoP5H/qkP0aJZ8GsDGiH6WQiB/3zw5CmNA6anMAfkLX7O8
         /ZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791447074; x=1792051874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+YSuDvOoF29231NTS5Y9qMD1wu3gOUz6rCSgcpTgpGg=;
        b=I+RG6S1ptzUlQQl3Wqtbkk2osIwSxu77zNeXIjazLGucFkXHMYL1LYKenGFDtuVTc4
         WpPZjZTSD2sW1261epfsuKyuG8Pp6zRPLwsr7gZO8D8KAIMfF8vWfuVFyDEcl9nzMKqP
         YFulR9ZB5Vw9+p4/ml0F1WkXiFkBzBT/tucZgruOvYuHlaryixOCXUHVqYE/ZxjGDyTC
         zghnhadROaXVp3CdcoACy6DiZMPOn7TvpoolZPB/AAJdpYJBQr0tEO/oP3CJH8uvkpLW
         6ft3lVMD4CkkDvkPkPHAUesNv2/if96INQHbGKIW3pTDgF0pBzk79DFvtSQmEzV0VHAZ
         y+kw==
X-Forwarded-Encrypted: i=1; AKwUvBz4KukbPKVeM5MVGcqQ9vXwNwbft6avmsidzOQYnr4RvcvP+V4anEOaqU61UbOhzqExomHpRjV4MuDlfmdL@vger.kernel.org
X-Gm-Message-State: AFuF++nugHBpV4P2WrOiCAjRNx47e/3x2/K4PxyZK5fXtG1kWal3SRCH
	0F6QNOSL3z35KRQWmQOhMyVUzwE+IKlMZ3nR7bMoF4A0iggReA2ZRdQqKXkT8GK7KKiM9s4wlHQ
	QluhgUy4jC0rWL2SET0DfYHqtXAQ1Qk5DOSjOj5LLqqVGn2OQyGJ/Bxd7Ia8zmnKLzwuJ
X-Gm-Gg: AYBFou06phxGjf7Lj4KTQgTlpHW/5IKT1/9P35vAsNsSGnelL7AjL4lQZMtuMGSTVb9
	6agrLu01nrOIBe+IxyobS1qGi+7LZIHjaC1AsyLG2EYJpL8BIWtmf+pzGnNwxG3IezRY7jmQ/Mf
	w6xV3N8mC2/qDB1IVP2XxhY/i51mMGIcELXAQU0O9bndPyLWSsV2eD2DU1SNF4o9h1HPIPlMQNM
	UaThNXuvMmhdFzB2/8tfWvV7sTeYu4cEJLqblqH+00EajPtjuxTHd07wFvjL7vsuDhmw2nmMdmF
	qtNFWBMXrIzCeF+1JUngDZ9AMUNZhRnZ1ow8xtCcUPzCjhhIXMU//s6cthLCPCq2p+twppmnMlX
	oDrjlnWMqei2xopnrA/3Zy4UsVW5q8zqhllFHqhBIPldp0mqZklf/GYHO/wI=
X-Received: by 2002:a05:701b:4354:b0:160:8d8e:7e3b with SMTP id a92af1059eb24-162047a18efmr6279148c88.10.1791447074142;
        Thu, 08 Oct 2026 01:11:14 -0700 (PDT)
X-Received: by 2002:a05:701b:4354:b0:160:8d8e:7e3b with SMTP id a92af1059eb24-162047a18efmr6279101c88.10.1791447073475;
        Thu, 08 Oct 2026 01:11:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16166121f2asm14522277c88.4.2026.10.08.01.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:11:13 -0700 (PDT)
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
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 4/4] arm64: dts: qcom: nord: Fix videocc clock inputs
Date: Thu,  8 Oct 2026 16:10:36 +0800
Message-ID: <20261008081036.3492003-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfX+TZJ0sl4JpNq
 Pfd0PE10x68wRZ4R4K2ZB9gd3GyhW32EnyxCMepUtnBy3QOmsgWZOTa9ni6W8L8UcpfTaKvzwVM
 gsPYobj+rVSnDNmJzf1MMzls9zfQ6nay4HHshUB0vE0Nq3U/tjJ6qp4zdqpIteYuUpcaWBz6q7A
 WMzkeRgXRHsu0h8SDrz2O+w/yoaI1LBRWGXHmfhIbu4gjWYsvnBhh56/K7A15S1gJv50AUWKkzR
 J+6wuXJ8KUjHGBPHsuyM11pRb0qj5szHwe/WRAFHodhGyw3mfXCm/kzMBBXFFxrzt0yqgWicp7r
 tJ9uz92T2dEmyzL77tm/GU3sQgZyYMectJgM8Yi2VZbUjcpgyjiQGkG2OeVwcY80/niUu48eNQO
 Nf9GLrWHuum8uw6GPqwBWJMbqZ6VZN5U9ndxZj9MutekdtXkilnQ61Q3VETXvOfX24hubZwluVh
 NE3RMypQAIDy6xWeJkQ==
X-Proofpoint-ORIG-GUID: guiL8gh4aGtEufr3F1kkvUIW0Bj4xUUa
X-Proofpoint-GUID: guiL8gh4aGtEufr3F1kkvUIW0Bj4xUUa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfXwzCx2BKBGmpr
 GwuwgQE2atOPaRDa+2ezmOXD7wZr1jBDDZ1g5gMnma04sGK9+/VNBqkx/ZYlzwBmGvireHnnwke
 4kfRLmsBMH8atW4b/nIZY5I6nf4D3pM=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac75022 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=I6E1kIfsyqVcGmBSIt8A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080032

The video clock controller binding describes three clock inputs for
Nord: the board XO, the always-on board XO and the 32 kHz sleep clock.
The videocc node instead passes the board XO and NW_GCC_VIDEO_AHB_CLK,
which is not an input of the controller.

Pass bi_tcxo_ao_div2 and the board sleep clock in place of the AHB
clock. No functional change, NW_GCC_VIDEO_AHB_CLK is kept always on by
the NW GCC driver.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 1ab7d9bc3cfe..62d14be55839 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -886,7 +886,8 @@ videocc: clock-controller@aaf0000 {
 		compatible = "qcom,nord-videocc";
 		reg = <0x0 0x0aaf0000 0x0 0x10000>;
 		clocks = <&bi_tcxo_div2>,
-			 <&nwgcc NW_GCC_VIDEO_AHB_CLK>;
+			 <&bi_tcxo_ao_div2>,
+			 <&sleep_clk>;
 		power-domains = <&rpmhpd RPMHPD_MMCX>,
 				<&rpmhpd RPMHPD_MXC>;
 		required-opps = <&rpmhpd_opp_low_svs>,
-- 
2.43.0

