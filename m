Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014248;
	b=zr+e3i3rBFrg/rsV9ttcV17YNtqoowJvjDYDHzVLgTGD9QfcH44pY6eCkNr+SMgsbEDB
	 HoIRlVqlzbv7E4URRnTvbJhJXrUYsp1BXB2UdzMUgpevlHwjYvZI7rL9xK2g15NIOvolo
	 j0rdQCXhyt7a7wA0TDOOTB4N6IwuoIH4ePblGjX1KLrtuJVVw8K6z3ItI+Q1xLnLYg4mY
	 fh9Yme8nrRThhZ0z5Xp13fdwta/1Q7y7jptTCPeqYx0qdbosSy6QrcwcksGmeAhZ3Zu6h
	 5tRoC1npCCx3YeZomNJq5QAhGRXFHfF2iNfd9HM5QfIqsE9jUwL7kYXrSQ2Xd4C65vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014248;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FFG9IQ8VMEFoUJD6bLeQT22wb+k51hz+E5W5jGAN8q8=;
	b=cmLMFZVJxzyvlHa8y7HtHsLIbCeEbd3LV1Ru+eI/vTFmkTQPIRLqGM/0MwNZKn/YADcN
	 u0KAwg31Dv/Y/w0UyCKirhRAuV0Ruc8ac5dU/0tSWn050ijMUqHeLFZJMxWonVYTiu0qM
	 RMaMJBlNZitd5gm5rGnjoQTNhi5LK9dCegdZIFjYcjcBy/KATYQuxvp1yrCI0mUXjJRdF
	 mOyfpVN/lEajQlqHhJL24GvTt6VYcJJJUEhfVXfkWUGllsO3SpdgWxfc9po7p11+3f1cT
	 mg9Klf6+1GZ1Ed8aB7h0kJWdBzm7AGdAaoBYtQN6OEKVpGHQ+dyTZDi7wOwCGrFLCOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWBIaPc8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fpMWzgyY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E8460A3801
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12E8460A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWBIaPc8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fpMWzgyY
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt1Cx4131942
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FFG9IQ8VMEFoUJD6bLeQT22wb+k51hz+E5W5jGAN8q8=; b=iWBIaPc8dS3yeKG2
	4Uwi9SITvqMweKCDEwiqzl86IkjnUjwk8slr8qxPtH2nEfThNvbPWRKDOlD39ppV
	+T4noF8Tb8bv1rbLHQTarkwNe15cekDuUXg3T16wPxCMJB4T/XZ5uQsr9gK84CWG
	uVzCX18j4PDxStz+/4AspT2Sy6ImIdbznR+0Ohw83iqmCuYreDK4cBsYfLLCstKL
	YnYIf/wiMF1ZxyyuFeBioJ8s/b5WFm+bbdRREio/g2lvDB3/zYaJENjOWgisH8ic
	j0sxDlemfAzHNRTHf6aq1wPyAivAdPXkv7/CKWgTCFQnxqwBh/mJt028j/OR4I7t
	FTl8AQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj53q07ap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:30:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab1e771632so3098369a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 04:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014247; x=1793619047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FFG9IQ8VMEFoUJD6bLeQT22wb+k51hz+E5W5jGAN8q8=;
        b=fpMWzgyY7jBweSkWGJi5RrVynz387OsWsy5QMbRL4ZwCbcdpPBuY5kzgFN5SfnrYtE
         6Lu+7+8xk/sOTYMDqtFmVsOZ06Uk6+fUl03gGW6k9si9FVknNQDq0B9eT2DkHD6shd23
         AleR61QIAa3z33l8fAVtrR59c+w1izGsdpzdGK7AP4+UdCbLJLJMbeHYoLYsugfDA6m1
         nvGsyoLyugvhdVB+HeJ6Djkz/K18bVUaPcv8R/6Sckr9/N7lGmuDrIKpc2C3pkmu7qtH
         kgOqNskpEVqGizT2Gu4rJ+utsM6mSybyDlS+rNq9xaufW+/NHWMxVKJkRUJwT6pe9Q0f
         o/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014247; x=1793619047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FFG9IQ8VMEFoUJD6bLeQT22wb+k51hz+E5W5jGAN8q8=;
        b=SmPL8WDsJwZuP1vjzMAT0wMdpQRILCCMjzuhmuopWhO9gEcsmoecmllEigxfxcoqbR
         vycMNA8cP1vM7RRZESYbRE5AzdnW0M6hTZ552GLh+JdS6eL0W/Wu9um+UJWkszLsDdSo
         idhloYz0jPvmW73lWAO06G8qAd7pRrV8yWv9+M/sSGIlSZQb5Jom0Ij0wHaFAYErn6p3
         YFgEopDx6EMkzOOruFov8Sx30KYjy+ClkS9ywCTXpGLhu/RS9mrn7dqbnDkhkX+DCQd5
         BJJOKys1rHdKXV5JYgx8eMTaULHjSOonG4KH3+cbuaeNvfcIi7YlxunEXjEOMK7UmzRJ
         RY0g==
X-Forwarded-Encrypted: i=1; AKwUvBydJAPuxtSn+VRJIJoQXYbFwa3gap0r8L4NSZy1NbqWCeZdEqLwXqdFEGxdQJgq9DofOHFwQynowFbRHDRi@vger.kernel.org
X-Gm-Message-State: AFq9FYK73c9lg++dA57H7DBzhsgvinrA4VzOWmGvPrpavs6R1Jcgz+IX
	wgSSncAbOpwbFyXI1oNFZO4VyD2ucKYxAEuNnF+BK358lPe475NKe5pQOoyYsvYaOVB9SX067Iu
	GCldFdkZtrzZJyrKMrF9VieUpIXBnD8yZuFerGUp6UGjr5fW96mBTG43YW9gERDj15U7f
X-Gm-Gg: AYBFou0QBUE3Xdg8NHXWrAogGQ5GB8NGxAVuuXR/MzT402s/o0knAyVOj7TbmXtCVm+
	qKeLkZgFr9XjoWukVuixbYOtFOZeOtWVDORFt4tByaqNchZQ3dDhI0I8lclQCsLv5CltpeHvCO+
	2z50ckAtYMPWzhROEvNjo8zc8Fis7oz0CD0zRj53GQPBCU0cjcbeLDinnnanrzq8zf0mlA3U/Bv
	LAzfw7tgPV6a16T/MRGrziLfkibYhtMKhDQBbjyAP4bli1iMjCvbG3jcwke+UDpwshvat4HPB46
	rsaztZC7iS7WnUJ+xEHBIPTLBwBpXfFcrpYWjFLOMX2P/IoXipW1ZpL3LQ+JDhslW5SQOFya54K
	1zec7aCL44XOqEVda0X31ZIY=
X-Received: by 2002:a17:90b:6c8:b0:3ad:ba54:c3d6 with SMTP id 98e67ed59e1d1-3adeb3aa756mr3577918a91.1.1793014246478;
        Mon, 26 Oct 2026 04:30:46 -0700 (PDT)
X-Received: by 2002:a17:90b:6c8:b0:3ad:ba54:c3d6 with SMTP id 98e67ed59e1d1-3adeb3aa756mr3577891a91.1.1793014245696;
        Mon, 26 Oct 2026 04:30:45 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:30:45 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:34 +0530
Subject: [PATCH v2 08/12] pinctrl: qcom: qcs615: Add gp_mn mux function
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-8-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX8p1C632J5RPk
 tNu4EJYrWR79K7iIiXlYf2W8nanrCFRWq+GmCWMpGDZSaJCuX2S0xH0ivQbrgdeh4bXTwiy10FC
 IBo0r7VCXc51lEsR2uh+IW6J04GsmyU=
X-Proofpoint-ORIG-GUID: 7ICL7hpNd-9Wh-CzrJpRTW2_a1_agRRr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX850wBO8EhbKS
 eo6llPthxNjTjGwIJ8+K4pQFxLbn5UsLoErY+qTfzwtzuKtxqewt+4+tQ6XyO/ygUshW2DFjf2V
 9jFYI3AX+/IZa1MhO0U7GAEBpOUdciyr2S1mxiGrX+no5KcMziuU9pS1F1RkygOoaAgBtqoG52N
 RQcARwASGIJPPhor4P8b0TM2gdhFjEoKlUkv6d24MsreXn8KPpRKP59qbZuVqabj1JbjPBYalRX
 1mZI/1IAjw9iW8aE/oUefkRBHjQIIcmoEsRxpxxOf4pL6E4vm7vsJC99iwVvFwlclLFqCFeaUjH
 jjNbVCplp1kjeGSJFqcZgxJUM2m062Ii65nibVOM3TG2nhhPFzMSCOueAQd37TKd8QdaKRCgAQY
 kakjElf1+4F9XTTbQeXzHDyaSCwascd6Ri04fwXHFblMM3PYQBM84OyoslMHcdQEaXHSYY0Tmln
 aWEKVvbzXHsP/X/X+8Q==
X-Authority-Analysis: v=2.4 cv=D93SufRj c=1 sm=1 tr=0 ts=6adf39e7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=lqpqssICSlazahQHq3gA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 7ICL7hpNd-9Wh-CzrJpRTW2_a1_agRRr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

Add the gp_mn pin mux function on gpio29 of QCS615. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-qcs615.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcs615.c b/drivers/pinctrl/qcom/pinctrl-qcs615.c
index 0e7df184122b5b94756a233a009ec0dd3675816f..169323635d39a7c3441560feb002e9e03a577515 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs615.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs615.c
@@ -404,6 +404,7 @@ enum qcs615_functions {
 	msm_mux_emac_phy_intr,
 	msm_mux_forced_usb,
 	msm_mux_gcc_gp,
+	msm_mux_gp_mn,
 	msm_mux_gp_pdm,
 	msm_mux_gps_tx,
 	msm_mux_hs0_mi2s,
@@ -581,6 +582,10 @@ static const char *const gcc_gp_groups[] = {
 	"gpio59", "gpio78",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio29",
+};
+
 static const char *const gp_pdm_groups[] = {
 	"gpio8", "gpio54", "gpio63", "gpio66",
 	"gpio79", "gpio95",
@@ -840,6 +845,7 @@ static const struct pinfunction qcs615_functions[] = {
 	MSM_PIN_FUNCTION(emac_phy_intr),
 	MSM_PIN_FUNCTION(forced_usb),
 	MSM_PIN_FUNCTION(gcc_gp),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(gp_pdm),
 	MSM_PIN_FUNCTION(gps_tx),
 	MSM_PIN_FUNCTION(hs0_mi2s),
@@ -929,7 +935,7 @@ static const struct msm_pingroup qcs615_groups[] = {
 	[26] = PINGROUP(26, EAST, cci_async, hs1_mi2s, jitter_bist, _, _, _, _, _, _),
 	[27] = PINGROUP(27, EAST, hs1_mi2s, pll_bist, _, _, _, _, _, _, _),
 	[28] = PINGROUP(28, EAST, cam_mclk, agera_pll, qdss_gpio, _, _, _, _, _, _),
-	[29] = PINGROUP(29, EAST, cam_mclk, _, qdss_gpio, atest_tsens, _, _, _, _, _),
+	[29] = PINGROUP(29, EAST, cam_mclk, gp_mn, qdss_gpio, atest_tsens, _, _, _, _, _),
 	[30] = PINGROUP(30, EAST, cam_mclk, qdss_gpio, _, _, _, _, _, _, _),
 	[31] = PINGROUP(31, EAST, cam_mclk, _, qdss_gpio, _, _, _, _, _, _),
 	[32] = PINGROUP(32, EAST, cci_i2c, _, qdss_gpio, _, _, _, _, _, _),

-- 
2.34.1

