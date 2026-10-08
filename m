Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF749446C17
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 08:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447066; cv=none; b=MIXB+N5YGevTaXW2zJKxabNwheTT8pro/wxdA3OwY+16VrgJsJsODxrXyA0rrTN0jy9QZdDs4gD3aVIWKvbXZ/7MoCbKvBFDzDJOjFBAmFPua+3u7w42bhJdhlkFXnq/bmuP7dar7WJNmEwGy6cBPZMALVJh9Ce5iMInwKBow3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447066; c=relaxed/simple;
	bh=DvQ8wWjzAFYX10JuqGOvkohCd+ko4JNFR4il8Qwjgbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n+UqJtE+8glKM/NFlsru1Ey/0LdU0wWpBPY8tFmQXVwlSl+xOEmAwn8ZHG8aO/YgiEdHKA10VQksNKbSAOLLpomcd+88yNO+PrRblZOOmEEbOpbS+POATxT3BiAdNioJKAr+VhrilRCVZxuABqhiHv7S3Gg9CzEk0vZANYEjs74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CXM/+pF1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YRIplpqx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CXM/+pF1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YRIplpqx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KcWV730884
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 08:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ilmh++1N7R6
	5dkDcOOtxHaZj9s5Kb/r2ALcRYTEeVlA=; b=CXM/+pF1DGPpnRqE4xlWxFiD8q6
	f4/t4u/5gOHemlS+f8Pv4IY+GUrtoKAgYFdYAiOR1NExyk222fznyjAu+PXO85yU
	OFpkCZvAKS/P2NLWENO3RDo2nza4MDc2yR+ikupPwCEmq28QoJfLqZRcaETQxewV
	JJC3CySS2IvcBhDx/dfbbFyvi0Xx4c+EMgnDEGDmX0lsxbZ5aXWT621+bT5ef68s
	w1G0o/wCTkcJWdRqVC/nQxCq1f1hgyObdpdRZE4fd9sprN1qESZ7l7eLD8XG5sjM
	nzF6RHb4R0OMdAeKu4zfoydJPhJjwJNYQ7QPWy9pJQQaZ6/rBGhmUD9kbtg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe31thk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 08:11:03 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-147be78cd56so18058706c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 01:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791447063; x=1792051863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilmh++1N7R65dkDcOOtxHaZj9s5Kb/r2ALcRYTEeVlA=;
        b=YRIplpqxX4ZuqOMWk8ZqZPwgC0Hwi82Insti138OIdXiQ+FVYyBinL4UJ4T2oiDwLv
         Ur754oZstGQbcVzb01RWBKus5SAm2IjaN9D2R+KXZ41R8SyLFrQMOeF419EWRM5RAfqw
         flGKP2iGtt4bdDFO3HpkvXNBDmwZzmG7T2A6F9e1MKF6rq6v3yidKMr1JjEv9a1Sz1gH
         bLEMpma0jv7UGG9ttJDvly1LmJU6ftg+cVDcp6B51CeNt4UnwdfDG1PSMKDC5tX+4L+O
         +BDXQFKL9CCpK0Ds2mnZquVfcKcPIPsfRRSuYNho4SnpTfliYJeXI4eIO9aNMQVHoXs2
         oOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791447063; x=1792051863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ilmh++1N7R65dkDcOOtxHaZj9s5Kb/r2ALcRYTEeVlA=;
        b=IwM2IGeBqWqDZE+pDPJp3KjGqepeGxFxFMu/pzgIncwELkKhvd7EIQL9MhJVRd+66r
         uSRdh3VZVw5I4hZYzoqZSGns1jJS1016+JUnmT2v2YKjaqIHLik5ZO3yqkc2jyXVeI7C
         A6KJXn02M9ZkqQqtSQPSRiozZGU8ggvWgrEvqEyHfrsJA1ExzryoZitN6kaMvye2fgQH
         pKkH44qXcpKryPAdTc/HiEPO2BJhelvl+pGjDHW3hmps4efJWGRD+wste9AzhfHqgt6j
         K9FX3va1NvDfOgXksIyHT5TV9QGjWaPXgGO0uXdmkbfbIQkFO9kccgvY8KgnUsfWUmKl
         FPOA==
X-Forwarded-Encrypted: i=1; AKwUvBxvb4BwcsW/Z/jppIK7vYz4Y10TQEkLP2BZR01zdBD53IXYJlbxr0vWRTmyvYroe78vzBjZ8Q18yMwMm9jC@vger.kernel.org
X-Gm-Message-State: AFuF++kZb9J+iDpHxdkPvN/oDbIvR8TsIjOjoeh4zHNQmL4db/szMsKR
	iIwGBldsQaAHye0CmI5BzgkwFNfX91HLkCnHzceaiI3UsX+LwR6Jcfgkb/wj/8idDOY9FOthACu
	FVMZ5sAfDYGuv0Q6wwiTljfIZVOZjSvlgVIo5aZq4BIdZPbDYjOz8YByidPbQsXrU7ue9
X-Gm-Gg: AYBFou15J3LxXu2faraoVtn4+MQSFPErWz3ZG/9MB0KJ9H7jcZLTJ5gpuflZba4Woiy
	sIZ0Aegur0jph+VO+5GYlP8RQyCW9iU8M+KO8NeqnomJhQU3AUsAxISSK00kBAuIuUoAgVjzWUH
	I8TgJMAIcuFkfPIpCxDFI/FwLu2uuJYHeIbvTW9y6ijDgWcgBTpFck8yB16BJEdwa3e6HHDIiM6
	TNMZS8B/0JqmOwT5NfpmG9NOXs12748gel7qMTceYEg/evviM3eFPIUg8c6QUpcPSFVTWm5OaPv
	NZ6BDpUJMCJC88jCwjzbOpytn01IO28XxuePd2L3707ccehD6C6aH52xWShum0ud7B/HRfBDXNO
	D3j4YcRGWMJwJhVx35vPL2rqM19/0zd3Lr01YDBnyM+Rf6bV9V2NoTpCLrKg=
X-Received: by 2002:a05:701b:2096:20b0:15a:9834:73c9 with SMTP id a92af1059eb24-162089f4544mr5396707c88.40.1791447063269;
        Thu, 08 Oct 2026 01:11:03 -0700 (PDT)
X-Received: by 2002:a05:701b:2096:20b0:15a:9834:73c9 with SMTP id a92af1059eb24-162089f4544mr5396668c88.40.1791447062702;
        Thu, 08 Oct 2026 01:11:02 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16166121f2asm14522277c88.4.2026.10.08.01.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:11:02 -0700 (PDT)
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
Subject: [PATCH v2 2/4] arm64: dts: qcom: glymur: Add videocc sleep clock
Date: Thu,  8 Oct 2026 16:10:34 +0800
Message-ID: <20261008081036.3492003-3-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfXxpS3F73YceoB
 MSltuhAIlViACNwbP40pyLc6f7rO9lTOzXnuLj7pg6nyct6xiPfmjH/UX3gnA4Eyoc1obknRoFg
 ByyZH7RT/n55rfE0lumhFlJ7/APR9ZiJZY8I9kitvOLiQ+WAycoovLOH6JVHgYYPWYcMVyVyTES
 VG5qF2VimADd1tc1qD9iUZT7M/Jvdy2pP7Zpe8vSrAxWGdlJ75kb2s0AmBUAZdj6bRzskqmeU9v
 WudvBu+WjM8mcvcmtgHB6+cLeayuoHh2Nv53YYGUE03PxQkESrBwVicWcT+z27jALIeag9OM2Le
 bd13GJ3n0Qyfm6jdOc4jYwbxv+OK99bSmaiOCG5b/Y1E338kXIEmVqvYYTEhy+92679HwmLxtqV
 5N7bUGEyJlP8K9HuB2NZEQsoNojr79f1XtL61KTmbQcpSX/Ww+//zof84Z9teNplqjtTNBdUyRJ
 cjBfoPjn8vqIJkOipew==
X-Proofpoint-ORIG-GUID: 2DdbsDVLymOpAUE9LRiNUMUY8jbMUM0Z
X-Proofpoint-GUID: 2DdbsDVLymOpAUE9LRiNUMUY8jbMUM0Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfX0Fa8iBbA1Z2K
 Fqv1MtyQT6T1qbK3nc9Y9pJeRW1jbdY9vOtrjDJVvmJlBOZ87tRxMkFXlG553Kny8voWnHHVS/P
 XM4dFp+lLXGgVQ5jYk/7gihZWK0v/Xg=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac75017 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=kYVbGFCUSVokFan4DuAA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080032

The video clock controller binding describes three clock inputs for
Glymur: the board XO, the always-on board XO and the 32 kHz sleep clock.
The videocc node passes only the first two.

Pass the board sleep clock as the third input. No functional change,
the video sleep clock keeps the rate left by the bootloader and has no
rate consumer.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a992..b389f953f97f 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5810,7 +5810,8 @@ videocc: clock-controller@aaf0000 {
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

