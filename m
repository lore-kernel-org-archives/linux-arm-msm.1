Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568243;
	b=vhi7Ye7KtfQIUSq/Sfhm3nGt3eUDXjwBl52wkyKHblfleO0+DNCbKtu4rG0sEuZQ9aZJ
	 /8EUuT+Wpe9tEgaeIxORufZmcWzN8Se40pEmHXwWn1prNkmjX8FDlUV1gdyEuTJ8c1CGX
	 a1p22HLwKAKdCl3/lUNJOumgNCjmdF9cRxwAmoPAkxD1f9/CBwldD1UnFqCZlyHoWLTEG
	 QtKyMqtdUr6QnbWxeDv9um232cvUgqhXFh9PXBM9jzKrNcTShrPWngT4MHTuqk13QgGEj
	 N4hUc3gs8L6ABfbyq6Rk1S6TS+n/kxcR6+2TA0vH+jsDG6YdH6poNErV5yHo3jrmN7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568243;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xFjlgVkkBc5JN5V4EJlSw5WFPM0IiobTdOr1Wh62s1Q=;
	b=gq2ASuqaYQ0CAuPQiGFj13L/oJ/0Ndx1n55v+KXxkkBxDhnwrOtuS7N+DAoeuOWE/0ts
	 I7lgn+NqCGuXUFlk/HI7sK9QoK7KLbYETbfZOaqOmuo1vA/YhCbtpiOTR00lyBEMQPtW8
	 w1b/OfyjmSl9MuLbiwCzAD4TCZBy2DnAdjTBFiC+HSBGMcff6HhgdTpYRJ6Iho2h8/4o0
	 oZcejSeZQ232KGBzWRSV+XF7KQlTc5npHC23iRefVa4Npt8TiM650h6gyOBA6IeOPlbW5
	 fhhVfiZADBGNQD8jKnsHuoZZXgZTwelTimDDmhs8B5FoHuG6kZnLT+7/VcYDVgya6fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EuL4TOi6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jedbhIVG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A675C606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A675C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EuL4TOi6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jedbhIVG
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jMUN3573312
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xFjlgVkkBc5
	JN5V4EJlSw5WFPM0IiobTdOr1Wh62s1Q=; b=EuL4TOi6VdzJ6Lyn5azxY6S7176
	tyZj7tTeneP/jkP27UOzjQ5YylbTBveqHHe8i+r8U3a1mKzkRk5V+1lW9Z679yM+
	2aK0lZXV4Q04vOt988wMIHd2pPYTQb+e/F9Uyp5nNS3+X0FroUo6UqStTvccbNkU
	6LyUiZwd5Lel33xOoJas16+7TT1Uv6OUJ82mGEs5qdDDk/sQghOYTGrsCg8Xt+/a
	pHCR0QDScNXPkmcHoLcLJeYTqacWR3MePk8d+e6rrCSJ3xvKbxInEATx29h0/69L
	0Gz6NeCx5uTOiWTJbGWodIWOY8on2D/TTcUvP2y5N/sSmxrPcYU1oZZ6h9w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9htkq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:37:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c902e0da2so1946320eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 00:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792568240; x=1793173040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFjlgVkkBc5JN5V4EJlSw5WFPM0IiobTdOr1Wh62s1Q=;
        b=jedbhIVGPXEJpKEkGhWb95ZWA0cuqjdmepNYvF6LtCpnLvYaFOv841RHOCTS7dcZNW
         6rWEHpcrk4AVKmF58JyJZ6myH1hfMmhMu77E5kDWiJxdamGuKWnZgxLllohiHBIn7VL7
         Ln+XsDIOZkXEw2i2vYPlV0B8D5iiis7KyPiJDDSQaVfFjoudZmk0wAjEqZB3MeMSx8tV
         LvCZPwpOkBkpAmjNejZFg/BYJlBcgZshZavpWNdy2/W3xnfi7F/8vT5cUuasKSl1sTsq
         7eDARGOuDxcK/jjiVH6l78KdiI6SlsbeRJq43N0mtFYBhS4y7UVc/anABiop5GZiXLO4
         oTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568240; x=1793173040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xFjlgVkkBc5JN5V4EJlSw5WFPM0IiobTdOr1Wh62s1Q=;
        b=C2b/S+lT20Q0kU6EC7bbTXbUggAvXqKd1E7eGqkZQXewpxbDoQwNLwXqtwNJuLmNgl
         Uw2P9Tv41fkkkKOcCeZ7IElBDXVrC8VJRNC1btEXTgpLZ+3M5NOD49zx+aIgJnJXJxXJ
         y8GgAkhw1FxrGW7v1woWMAzFj6VmUdZdpGmpm9+bchQ2J8Yd6+Wp8rv1e6THwayjNoN+
         SOQX+fBmsAI4pfa5EOxVoppzbGLtoTumcQpkaL390z/DAJAjxzM5frgcy3mw+Yju3tZa
         kVsdNvVx+9/F9eEhQO/tL0awn7tYbzJky5iNzkvAvGsjYMSxAv5IbxWsDzl47V/lovYU
         KajQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAASWbnWOnsdYlebuWAo8te0hkt+XJCrvWV+SXizI5ZRfN7wtfr6PwSbDIUiWQYz/NvcYxcb8/zRXOkRLG@vger.kernel.org
X-Gm-Message-State: AFq9FYKZJActCik1B/POUiNfW6O7g0nSafmm2T2/4CwnZrsru8EBRHEq
	tscoWYVDBlSDr8tjuZTSL7JIsPdAx38PBNIisfRNKc6WfZrTDex7rri0QUWB7YmRj8yPjxdDVIh
	OZXTZXZSqeAWGiAX7ijG5i/SjfxOavYRuK/9yT/he9Z1klXP3NWJYSll4hFrfgCAMHPGO6nS4NO
	mMfIM=
X-Gm-Gg: AYBFou1eoLpDkvRCgmNpT5jXwGId2N0EIM7DOzFbgwVMrsC9w8kN3ujDI8mHKnER2mP
	AN/LQBYSEyvvgdNClNe6d8OYnHGfg0vEMPG3MqqwRMfDW9gzbDYDfH8N+lwmoBswkG3A9nzwKGE
	JdEevZlU+932GSoD8NdmDU4CVxtyjexbte9cfjfkuHhQqMhS9d6BCTSD3S2N14ZQhn05LJIQ7IH
	cLMEvYY/Dhbm18QN/Fei1TjAfvXhBUl3y27+AKbF07KWvGWyEVxVFK9ANMIjjqLB0p8qBrhjg07
	SfNfNkX21rVK1GOE5Tn8PxfznzbyCq7dtUiorq5fM3WKHW7gnBd4MXOIQoVbHeTQMgQb3EKM4JJ
	lK/Fyi+aSes8h/Y69xCVwDc+KucspYHxYxStF5tj7T/LoEPU34yMXO2bUc4w=
X-Received: by 2002:a05:7023:d07:b0:143:3769:c680 with SMTP id a92af1059eb24-18dc14ef3cemr6480202c88.25.1792568240424;
        Wed, 21 Oct 2026 00:37:20 -0700 (PDT)
X-Received: by 2002:a05:7023:d07:b0:143:3769:c680 with SMTP id a92af1059eb24-18dc14ef3cemr6480176c88.25.1792568239738;
        Wed, 21 Oct 2026 00:37:19 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm4042471c88.14.2026.10.21.00.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:37:19 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 3/5] arm64: dts: qcom: nord-embedded: Raise i2c18 pad drive strength
Date: Wed, 21 Oct 2026 15:36:31 +0800
Message-ID: <20261021073633.2163128-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad86bb1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=W6k6ulCq1w4nxQ-T7_IA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX1atLxBFote0w
 DQWgp2E1g6nTagvrs3cylOHE4c5vNdGEbRUq9Zg/zUyRp7DjCqy5QuZIkToLZKEWjZS3j2nDltv
 4XDjU5ygy1xEh0UNEDbmGRFjxJuvW18=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX2z9BGoO+FKAO
 WoZHL7xYX1LDHi/yT0UH+g4EHci40fvhqRpUJI5IDB3OGfRt2kwP6FPwet4gKwb9rEewt8Nsdq5
 C7EEbp2QNXlBStguIn7pnE7qpvxlFNOMlBdmdssw168cdWM8K4A/EpWFq+YTwmjE4bGZOxJ/ZjN
 clUZ7ieu0gsw2NPjPA5qTwPO99lG2ZghF4LOa9nQIHII1s+q/diqoQ4wbwXNsW/UKx1ALqOKOMU
 zJddjm7sDpmnYTUdHaZKMjbF/njHfReptFNG7rarbT05adEfLJyNOJbtDWFJVUkWYO0z0M6G8O0
 aj63uNHdMz0wYuwHR3fmq5aqt4/Hpr/KlsVY7KsMo5K0rz9kDlWoQizfbl1fQcFcpoR0fckaUxu
 lsgv6E//nVysVCvtdrv09TIJr8UpX9GGahZzO0mXs+O6WNPYm3ag8G/WD0nwHd/EE1goqjC5JTR
 /q/Z9HmTjzmFXbaP3fA==
X-Proofpoint-GUID: 4PLlr6rOgWn06vW5jyAzmMDfecrRROv3
X-Proofpoint-ORIG-GUID: 4PLlr6rOgWn06vW5jyAzmMDfecrRROv3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210030

The i2c18 pins (gpio154/155) are configured for 2 mA. That is not
enough on nord-ride-embedded, where i2c18 is the audio control bus
carrying the TCA6408 expander, ADAU1979 ADC and PCM1681 DAC behind
TXS0102 level shifters. Transfers intermittently fail with arbitration
loss and unexpected start/stop conditions:

  geni_i2c 890000.i2c: Bus arbitration lost, clock line undriveable
  geni_i2c 890000.i2c: Bus proto err, noisy/unexpected start/stop
  adau1977 0-0031: probe with driver adau1977 failed with error -11
  reg-fixed-voltage regulator-5p0-dac: setup of GPIO (default) failed: -11

The failure became much more frequent with commit 8cb5c17be3a2
("i2c: qcom-geni: Restore the source-clock selection policy"), which
moves the i2c18 serial engine clock from 32 MHz to 19.2 MHz. That
commit only changes how often the marginal signalling shows up:
reverting it, or lowering the bus to 100 kHz, still leaves occasional
failures in a codec unbind/bind loop. With 4 mA the loop passes
reliably at either source clock rate.

nord-rrd uses the same level shifters and has not shown the failure
at 2 mA, but that appears to be margin rather than a guarantee. Since
this audio I2C arrangement is the reference design that customer
boards will likely follow, raise the default in the shared dtsi
instead of overriding it per board.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 6dc4c871f41e..1ead642254e0 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -1221,7 +1221,7 @@ qup_i2c17_default: qup-i2c17-default-state {
 	qup_i2c18_default: qup-i2c18-default-state {
 		pins = "gpio154", "gpio155";
 		function = "qup2_se4";
-		drive-strength = <2>;
+		drive-strength = <4>;
 		bias-pull-up;
 	};
 
-- 
2.43.0

