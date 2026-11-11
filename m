Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382312;
	b=n3gxuY1irj0CVbd4nYPT29+JLYy/VYkzplmEWXTj94DVDDvic7N1V06yxZzgB8xXqTED
	 Q8XIAf1SOVdAuJGy8/h7Cfpyplw7yx/kblJBDNqUymZLlSMXzI8ou8a8brj6HdFfDeadA
	 pm9EePdNP53w8irYFz/VcNlpIzM8MVQPRp8OVaXH05JDxABCsvgkRGp0oxRtIeFJ1zERZ
	 gvBBJPdCgnJ828l9Hx6qo9ik8s11lrpoUu/7UQubx4+rLy3uhm8H7EG8pWI3D7eGTyYwQ
	 lJqri81CKUNLCtzKo3Nfcy8efkloVdOUv0NQIOPaDCu+J7VYonHXECuL+mNzsX2TwTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382312;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=whaNoV2zARA/Tl1+q9SOsPQlZziCwZUpaFnGneKJwq4=;
	b=DXfxYGwZ4V+5o29NVbnmuzNNIHfFmLXdUHLZ/2ATbgbYNxs2UcZDg75d0PKhUkpRtcOC
	 1degO3Ups+jVmePEzd1jFSTdnZEJOp4U34ekhL1BIAuVagueqi/Myjn0W+UtHSZvneeyW
	 soGk6kbzAv+NTFxEdwwaTsQw99rWCEaEXGJYT09iIB4bjjQXB15aEXxF1bWiEpJduy+VQ
	 sx/BSj7ugNylPxdVE6GTTezN4nykIJIkYPgDqzmwN8N3Zihf237nYS2XlGK0e5EtRoBTE
	 ny7uzxNQtFc0c8gUJ0coDR+RLVBRIBWHfaSa+P5SUzx6nH7MI8x9B46bIS2XSPiJGLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QSEQI1MV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HrqVv9zr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846F060A3810
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 846F060A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QSEQI1MV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HrqVv9zr
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KDWs863470
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=whaNoV2zARA
	/Tl1+q9SOsPQlZziCwZUpaFnGneKJwq4=; b=QSEQI1MVrTQlP0zUt+4EYMyS5vS
	PjLDejtKDC5EgRRvC8+zcxS14DTVg3bGlh+c64i2AWOSROzHqTl8kUtHv5b9IaR2
	ZWOzuCVGlpBKGMrAc230TFU2B6EfnR3VMoXwiexpppxaZ6Jms1t8mSdDlQOIF1ZK
	7pncxV0JbF19eJUsT0W6OmWiN6nfGIjqD3/ChnPm6/UrBpR95De8XTpqhC9KFrUw
	u3DIgPvuBAp7rwjgTxDW99D+74nqTtfHt/ztSOnczReKhv9YFmDXOstYXWoQA7ts
	UcrRxs9Pb80qckpjRS7pvZbFUHBXYq3q3ossHJCPUxdq1GNgzNjBYYMvjzA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawh1t9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:31:51 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f26e6abe9so4609295eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 23:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794382311; x=1794987111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=whaNoV2zARA/Tl1+q9SOsPQlZziCwZUpaFnGneKJwq4=;
        b=HrqVv9zrpRk23pX7cLtGVuRn9vwMv6+8Lv1y2c3+w23iMBqdSBDPpZuGwKR31XZYxI
         h0aN2rrYQ4jj3CYne5tZ6YO2fMPAVsi9QMaDMOyminoUyBkjG9z5I0rey190CVBIrrwE
         /SDkcoN9K/jNXoiSQz4apEvO29UxDT+OG5Pa7ExhCoGXxEMNmqZ7B5kYlj9SgCRq5uAz
         pBnUj8vhY1bq5Q6vbgyMCfDUtoWVWi6349vx1zYk9FmHg9UAut4hNKoiNEZJFUeKuclX
         QfBQfXSoP1y21/kiOJIqRP9oOkFEq6GB35TLYNVlmVJ26R5Wb6BfYop55knYqv8DEBLM
         P3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382311; x=1794987111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=whaNoV2zARA/Tl1+q9SOsPQlZziCwZUpaFnGneKJwq4=;
        b=U/qf+vrtxJ5BtWKizRei0bAUOTbj41f92LKRihCvdIkE5kFWXV2Ngv8Aw1V1hLtNY4
         dgdXQ3toBr4/Z4M8vgRnNiSMKOhvJdiZs681wI20K2+Zy1VELsTCB8BkMRs6OoW9CtPR
         9LkjELam3DzoKFqKMWlYeqjhXalIhxTzfnPIESQLY9ILXKMNdshyXJNRHEr2H/a3b+sH
         tcNAuIusW6/zgO++0Wq1buYUl71ljv9Nox44ZAZW2l51e7ah/RiVv8IMCbSGTuZyhW3T
         O0erGkLyomvFBDiUvNcSQEKQU9xPnvyNW4rmi0520RlqdWwnaC93O1H4XOO8o/c36v9F
         aIYg==
X-Forwarded-Encrypted: i=1; AL+hErG8vknZFir1qYdRM3OfbAfIjap91bY50ee8qEMi8gOOmIFlnlbRsDyrCNItNiuilNGPbnUKarrhx5Uqwuvg@vger.kernel.org
X-Gm-Message-State: APuU4Z+QXDJvcTKbCM5PMypFSbbWyGUtA/OERUarGzJmDzPpNa2O1sp/
	hHDrafPVPesBX4xnRrxx8SXxxb0XhWs8sh0mENKChxxVoD/GugVHMIfaAmubSnky1lGikxUf7n1
	eK/88pQiIDyPBNVkbZosz1dfV/6M8jYiWbdg3b1nCsaaepu+MtyXttWJJYvFcVp8roqT0
X-Gm-Gg: AYBFou0cG0FQPZe36QND4XNngrQMa/AUahdWesR7B8/NKIW5E28LHYei0e8YhFOqISn
	aFvrtoogFEpdUmIbQCQEODpuxocVAWmTb7WIW9kyQix1SzpRDHxbPWiWL9yfD96T1S6JqrmRGoE
	hJnWQaTyke1QsLCw7OqVJgJblORlFNXfEoJJWgjKT+9fqo29tFRJLnpnBH26xyczZ6zMvr4mfe2
	WxHu5w0VHAKb/7NMoC5fn3HQxPBsROs1iC++Z9xdVqmjUtvygpUdY11Lmj/dQSlHfhEffJH6qWu
	hbzqX7IzTwNQonNgk8eZqMkIqJ9TXm+trHRr1XGTKhruSx3dGrjH+3/BQ3axTT6eqpxN8PCQxX/
	8KEpUZdlWT+0WU2oVpWifm2buMVAnL1L0IA4zhS6MQpFBg1q/WaNiVaRNRS+Q8yFKZIyScFW2oe
	lBlepSUNNcqr85kun4UXbR4wl4GxSVM3VN
X-Received: by 2002:a05:7022:38b:b0:144:fb31:a597 with SMTP id a92af1059eb24-1b3c03b2be6mr1811630c88.47.1794382310815;
        Tue, 10 Nov 2026 23:31:50 -0800 (PST)
X-Received: by 2002:a05:7022:38b:b0:144:fb31:a597 with SMTP id a92af1059eb24-1b3c03b2be6mr1811593c88.47.1794382310144;
        Tue, 10 Nov 2026 23:31:50 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm27220027c88.10.2026.11.10.23.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:31:49 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 3/5] arm64: dts: qcom: nord-embedded: Raise i2c18 pad drive strength
Date: Wed, 11 Nov 2026 15:31:19 +0800
Message-ID: <20261111073121.3707030-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
References: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfX9pXsgmrGOXd7
 zMEbd01XSMLmwm4efTA9/HFGv2GqCucW7ln59ajeww1QCZ1Qd0GFFFQxZJ3xqoVh8+Q8sR3PuTY
 3Pi4F4lI8xcgF5IpfjctXALFNu3JJbA=
X-Proofpoint-ORIG-GUID: tSbhKrox9ws9gESsROcKs2TXmmXcao_X
X-Proofpoint-GUID: tSbhKrox9ws9gESsROcKs2TXmmXcao_X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfX1Gdo51uaFBbD
 XEf0XQgY8innHwmkiZr2bg95GtUF+OBDHi6tvCNZu3ZQ2xg9Vl5qs0ru9EPQyTuJ3Vgx+jAM8yR
 ZYTQV+18/1Sb99vSFI+vhfEXKQe+yRsvE8HC7RXZfmhVDWuSDLmuWKUUJdO2ITMIDShO0N5qwYk
 M1yJ3znXmofe0VIHO+zJ52BnckX2exXTTDGW8ancIwZC9oSODEAH2wp05pgFrVCFAllyCvCPIue
 1VweTl7Hcvbr9u93uZtTDVdZO1YomVYKMmTnntcGX+wpORqcDhxrUevbZJtZRwAw9xa92o6Zr9Q
 8PGTTcka3NBhczruf+ZJIiCZjvcn5y8qik9RU9K7ORPjMVKBL/jfrIzNPCCkbyXKbuMMSGtyaTx
 E0dW7rlo2Dcqe1sb6PYsY7snOZXjJYLksUK11UMzhTFQb4OjC8Kp+z3IOQlbCuTg/dqQogZJCWO
 sqC0MOlJUNclSCD6Slw==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af419e7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=OVRx4QOUdiRTB1v6uAIA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110029

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

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 5a1520e436c6..003c5ba2771c 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -1255,7 +1255,7 @@ qup_i2c17_default: qup-i2c17-default-state {
 	qup_i2c18_default: qup-i2c18-default-state {
 		pins = "gpio154", "gpio155";
 		function = "qup2_se4";
-		drive-strength = <2>;
+		drive-strength = <4>;
 		bias-pull-up;
 	};
 
-- 
2.43.0

