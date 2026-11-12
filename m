Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794498245;
	b=a8Kgd5NzJau9CMpI2p7sFr31dLO5yNC+/M1JbryCWBz3M+tylBHjv+na3f0EWCZAjNcJ
	 iI28epfZu2u3oFSZfgUpROaL9ZJu8XoXOs3apayL4naiFyc1Vet49T5wF/pN8oUySTn4V
	 PgMAfZVz/KK8HzFGqiO0fJRt+FVQE87w1W0wnjKiQRpVJCsa9tLaw6pbU0oClVJnwvMdQ
	 rxTti6a65L4pJT6v/QbkBwJd47KlkoVXDnwF9vH/t+mcXdICnr34Giml8pgIYUMQN+zET
	 aWTkkAxi+xlsMIaKxRW7kw/CmtKOIb/UOHGM5N+QqKI3UCbgonIW3sXPxE1Um2vnKwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498245;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vijXeEfm77qaUFkbqHOmBEgEJ6GlTLFtkhRoObThLTg=;
	b=SMNZZDeJOVQ7G3RjDJwhErbqF54ERi6gfdWP1gU9p6OyIBj2kE1rudIsQuXjLXLfbAWb
	 BHDzUvykn/S6Ck9VlynOcmt+jk2pPdYzewLGY3fzvQLBsx9ouoP/szfQF/QxC/sj6jqPx
	 zwOXD8ir+fBcHhoUm3uerwn78u2mclusgc4oldUBTq4wiaiFLA1/XLaKGjXqc1G2Lx6uJ
	 tFFaH0DK8yCe1++lnbgBgQeDWdRaYkqhNJLCa7tPR9oi6K4D3ldzQ08rF8ffNvnvVxv5j
	 VhHF37E8Yl5OLPRLUUrPCtB70OdGdVDzJU9lN2uhm4Lx898JtBnOc9cZ6e+g2qMupcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BesBSvfu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WjvVpNR0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0705606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 15:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0705606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BesBSvfu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WjvVpNR0
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFaOI61593529
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 15:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vijXeEfm77qaUFkbqHOmBEgEJ6GlTLFtkhR
	oObThLTg=; b=BesBSvfucNVWwXG0Yk3BAVUgkQD40nmb0GiJV9cal2w4WfiFIT4
	uJyQMgEhJfxYyiFtD+CbaBHILrEsH5qIn4zaGfQh432EhnMmlBq/4DYZ3xiItJNw
	r+VKdIiJq/TW9Z/rk9Tfl1fxX5KOnisQZ3h0BOiAnN7K3EZrzGqjeHkkD7EOWrxS
	V14IWnAhxApLJJ11jCBWo8fVt3YkemGdVI/4oaYCNgeyP3ZBMvwxqMJWg88cKp9E
	Z917PjKJTSWzJG/w+Iovqr5VIV1fC1YfoGh2rQbrZrY3MlBfjcOoLkBfAD9xILRh
	t+b8aYTAO5TVV3l47W8rRKGWZbyvm8gZuIw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8kgvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 15:44:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f559420f3so529728785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 07:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794498243; x=1795103043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vijXeEfm77qaUFkbqHOmBEgEJ6GlTLFtkhRoObThLTg=;
        b=WjvVpNR0svU26bE4uBmbym5pioq/0kNaZ7SH1sphynwwvTSkhgprr976CBXxGFtMjS
         5X5Ex/Fibu3rstcjWga7oHaAYCD6IPB/1QngV3nAExCBSCfnCklhKT7lIJI9ZW2MhWLQ
         z0dl+xLdjU2of3aY0mpv7S+iDMytt3kQc/hAxeQ5ACs+fbBxOrWbkOboO1qtSFTHC6hG
         q9/ADAG4LqUKLTALUVsvGuyG3XcARZncBrI9tEIep544PjyfI9lAuONlYB0lpiwEH11a
         8z76ZmhNvQUP0jIPmq04bzAjDjuzqyi2/V2c1oju6R/DYjdD/k7p9jGr3HQJq9D6Mqeh
         Uk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794498243; x=1795103043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vijXeEfm77qaUFkbqHOmBEgEJ6GlTLFtkhRoObThLTg=;
        b=k4H/rlupdFwsFrUKVL1xxqTCPRACqtltUibHBxun7XN/S/cSbRf9wQC0vrqki0USB9
         xT8MaQ94S5oZNiExK5BsMWcARR+EtPbuvkc0KexM2sfRPrkf/NiP8cUh087yL+LWjDAf
         s4YpJS77qlegUXmzme5DWIXmhYEg8Iiep57e/Rtb3928+ixlV924HJ0Z0jMII94V2r/2
         nFRjAPKza62ZIp/AzQL8y34DOcaApXaNtINhwaQIPTHYOgY8NMpL1wUJXYzGnKDMAgmB
         WFvVaSyQnJdlGEqtF1bVJYY3N42af6TyoPsttj8oCtCLPGrnjYAdhwqz7b1dDb11zB1/
         FBxA==
X-Forwarded-Encrypted: i=1; AL+hErEt5ns/QEvJxgzoDsmVTNsCRwlp5gYUS2WqJFCppZMt5mLz8bhnoPyyFLUAzSmhOABJJqx0y4xTzPQr7ICR@vger.kernel.org
X-Gm-Message-State: APuU4Z9NXxir76rKMfOAQBZYJjEKXXXlmRKApNVWClFnL/0RdsTk2amA
	9iFAE3pa42ZHz+YIwxbiGgvIenFxGsRu6duaD8pzkC9LGDTifV38Mux7DPwHmu91TCawPzH2yZM
	hDM8vjyDX5cX0Nx8kMylbaWGmy064wnJx4O+WwK/C1eAVjnNvBJI1QIE8vXTh2/v7Hp7m
X-Gm-Gg: AYBFou3OYk0q0Oad2T7BdJb/7Bv0QhZkcBaU4Lce1oA/6YGXueA/UC1U3Pn/5wALkya
	eRQEanVpLuwcHCg4Ggb5pfWLmVZgiDJbI8BOT9fR7UOs2kQY7ZFrMUM3hW3fSJrg1BYdVidzvmi
	2a4Qkhmi2AqEKnYMeOuFTADLFjkLrP3m1C96tOGPrlfNOtN11JnVysMMRO2k5aZrXH/DbSHgw3W
	1ycjI0sk7B7lrLHvKGKvNDuy7BGfmm5Q4jqEuUvlnlfTTzJH8knyandFUyWmSlzRt1dFte5aSqu
	PyGb3e8M+9MG0Ko8y6ThH4eJlXJYxNXF5fIEhDFFvKI0BNRJIeY8IwMevKJwFW5GdetORJLcX+f
	fPbRz8d48FRyFYAHu03PIV5hDJDGhphHO5OjTynZ+H4J0r8wyr6zBKsbWStMtHw==
X-Received: by 2002:a05:620a:4706:b0:944:2f1d:950a with SMTP id af79cd13be357-947affdbf4cmr1107779885a.47.1794498242958;
        Thu, 12 Nov 2026 07:44:02 -0800 (PST)
X-Received: by 2002:a05:620a:4706:b0:944:2f1d:950a with SMTP id af79cd13be357-947affdbf4cmr1107775585a.47.1794498242449;
        Thu, 12 Nov 2026 07:44:02 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498811fa70esm15653540f8f.19.2026.11.12.07.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:44:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] clk: qcom: hawi: Constify known static data
Date: Thu, 12 Nov 2026 16:43:58 +0100
Message-ID: <20261112154357.271072-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1849; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=+9G1x++waY3FZmbS5XzFqR9Ri7Cj7glIWwNL3cyr4Ko=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9d6+Hw8Ck2TV8fYw/32sQuZ+6QlQs94atYjc5
 42n+gg50rKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavXevgAKCRDBN2bmhouD
 1xcFD/0Y5Ldz0Kg8I/9Wc/P9c2P1kq/x24j/erAnqL3JbGSWl6q9AmGIH8fd6t0nby6ItpFYZ0B
 c32AgbgpDNw0WiAM3jenAQ0xrUlFLFwig1o5HL8p94zW6h80N5s7XWY0R2kSik5wUAbp0/WN1Mg
 rSltJUPqdjfOc8uIyu/qEUOvyxtjcgw6tZkgaRiL2dCjZInB+K1T5zo28edH7b83E+eiB9N9RGd
 3asDfK9APkZJjbUA9Hl+YtgCqU23egHlHrH6APFr1lSGA29Iu9QoCD0vgtGPNaWSh5CD0HB7sl7
 nrGEB1L1YcUixrWwzHGPZsXn7xdxzuQnM2NOXHl2OI4PDO64l5NS8itDc6sTBDXkimQM+mYZ/S1
 xs9QNMo7g+HBHUBSgO8dAwtm+cbN3lhPGaLTS0eBRbiE2/mk4ei7bpb3otSAySNNM5E8bPjvqJd
 kBzOuIlArgAh86P85ESR3IX5zddN50Kqm21LeZbr2eXkjVRS+TQOzAb3gu0nRyq63x0+xu4H5km
 U1wR6oX5JdVuKRhIU8LYMl82uS5vN2lHnHWr0q6iBseLFaYfiugrTTOMnhmKJi4TGeBx3FzsEgk
 mJw1wI/9MPeMLbW1UFFGXFK7BqMp0t2MyEaq0+vn5/DfIuZfod5L9+2lrvLYQsC6aLHgtkSW5f4 wkj2/JczuPPUb1A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2MiBTYWx0ZWRfX8eAamaePYU36
 hT0oBo1UoudPSk+AnbWKc24ip9PcYgdwreUq5dvdsGkDX/iRJHq7lUUlN63f52LPV2ijnDgTSdq
 WNOZVbllEPegSHS8ShtGdiDHiakHuJs=
X-Proofpoint-GUID: 6CfIU1EhE4YkvC1wpgK1tYjWZfZUxPRP
X-Proofpoint-ORIG-GUID: 6CfIU1EhE4YkvC1wpgK1tYjWZfZUxPRP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2MiBTYWx0ZWRfX64erG5t/oIsr
 FCctld2klwcynxrFbJXB4uqY3E1TYVFXtFi+IjqYTybun8aRFFOqv7Wam59ZS/4OOsrbYM7GiIo
 u7RWM6GLPWpcH/x8/ezb4/AbeabSGE2uR8X4rwb100+jnmGcXJPxkroiSLSCZ1TcKFDMSKtXhSU
 QMFvCOkTdRTakmpKDyABblGHFsUf2+vKhMBPV8QZ6dRhtBtrMvywvg4T1DH6h/T5iWv+3F7w1SU
 A46i4P1ybg3UJSqgFm0pM829JcyRkaW1G2foq2N9c9Vta05tYugm2z8gl7oRlVUNaOeRJPv2AYN
 imMheGcnjOjCA7yHhVNw9OFEQZ9z0MNEjWLAMIOfNNBmoHL0jKvzpHvJqKD1Uvc7fEXJgCBdvJ+
 cAD5etRFLWcX6gbin63skYHL3B+oQ1U75rQ6ITkROgKHMjXmsOwYiMPjakne1DvWyI+uPczhKs2
 dHSET/l/p2Ok9z9ITUQ==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af5dec4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=srLn0zS6XOEjdFiaqEEA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120062

The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
are already treated by common.c code as pointers to const, so constify
few remaining pieces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-hawi.c   | 4 ++--
 drivers/clk/qcom/videocc-hawi.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-hawi.c b/drivers/clk/qcom/gpucc-hawi.c
index 3deb7edf7810..ab6c4598bae6 100644
--- a/drivers/clk/qcom/gpucc-hawi.c
+++ b/drivers/clk/qcom/gpucc-hawi.c
@@ -411,7 +411,7 @@ static struct clk_alpha_pll *gpu_cc_hawi_plls[] = {
 	&gpu_cc_pll0,
 };
 
-static u32 gpu_cc_hawi_critical_cbcrs[] = {
+static const u32 gpu_cc_hawi_critical_cbcrs[] = {
 	0x93a4, /* GPU_CC_CB_CLK */
 	0x9704, /* GPU_CC_MXG_XO_CLK */
 	0x90e4, /* GPU_CC_CXO_CLK */
@@ -429,7 +429,7 @@ static const struct regmap_config gpu_cc_hawi_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data gpu_cc_hawi_driver_data = {
+static const struct qcom_cc_driver_data gpu_cc_hawi_driver_data = {
 	.alpha_plls = gpu_cc_hawi_plls,
 	.num_alpha_plls = ARRAY_SIZE(gpu_cc_hawi_plls),
 	.clk_cbcrs = gpu_cc_hawi_critical_cbcrs,
diff --git a/drivers/clk/qcom/videocc-hawi.c b/drivers/clk/qcom/videocc-hawi.c
index 318270105dfe..fe9691a02e2b 100644
--- a/drivers/clk/qcom/videocc-hawi.c
+++ b/drivers/clk/qcom/videocc-hawi.c
@@ -795,7 +795,7 @@ static const struct regmap_config video_cc_hawi_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data video_cc_hawi_driver_data = {
+static const struct qcom_cc_driver_data video_cc_hawi_driver_data = {
 	.alpha_plls = video_cc_hawi_plls,
 	.num_alpha_plls = ARRAY_SIZE(video_cc_hawi_plls),
 	.clk_cbcrs = video_cc_hawi_critical_cbcrs,
-- 
2.53.0

