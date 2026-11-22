Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364125;
	b=l4shIymBfrtc3g48pt86xWf7MzwyZmEKFO+wx9t4n1vTPAsEfa0Jys6jYeQPaaK/Xenr
	 khfcrxIpO5ksbAudb/sgXV9dgEe/UsniaRT0VDn1YOeI1LlsCxRs7Ils3H4vu+0G5bfB/
	 GiWD4l723UHGWI7Xf6sedSxpUJTwInZAU4xXOpuXWS5GnNa/dzQJhj6F+g9jAM0Ol0MxV
	 zbaoCr5z1gfphXMbnJ/e1TRNdXN4bp+8SMF42xD2mHV8uvxDwIxwWeoxWpoHwUvNnEz2z
	 R+id2JotnEDz7X0XFHNcoMZY79V33f2Ec1mayABppBM+aKE7b7zx9TGC1PN71ZHmQ6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364125;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f/9te2ernEKY868Q2tTfh0N9+4p6tvTufZbWIWjMoLM=;
	b=kzt21enCHep9trCYaExXXDWsH2P0ns0RK4JmHxBNgdBr4sYMWFY7S/cDUHZjwiXxhYzm
	 kb1OzS29cBJQEZpPQX4nFVP86xtd5Ol4Hm5afv3S/e/Oum3KtPp7ByiYrtFGPAmkW9Xqw
	 ya+9v3XL2jVqh+KtXfDgXV5h/nf0UfmYjJFXobx4mi0xt+l+Ws7mCWlLI1R2l8dpZmaeG
	 P3w8thDUI0mjxiB9ZKmNMw0XwJLv3Afz6nfYYjZUQXOwbKrv9DUcAw8sv7KFd03FuMVEG
	 P59Lk2oGWetu2uKAA+vHmEgl6d3fwtBf6/aa6ADqTdQiAMNtjMrfXN28giCJUjtQZsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jO3EZBvx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dWfZUc+e;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2139D606DA12
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2139D606DA12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jO3EZBvx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dWfZUc+e
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQfvG3496499
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=f/9te2ernEK
	Y868Q2tTfh0N9+4p6tvTufZbWIWjMoLM=; b=jO3EZBvxNduyQF/0DVWdB3CQZRQ
	yXlRKwyauMiID4XuOdDM84yhNBjGwFu67kDUS69srylYHE5LHLP7W5WT0XEQzGnH
	Mq9DfjRD8yv3RkSV2ZTB9ddmvveUskDnRIcafXMtsGM/jVnOwUlCColR86gJgn0i
	RAIvBxbWhpEcSCPdtEX+J/9KZOaUuuy8SFhouwbLnFVhMdxBqrXXfkZaNQoovKq5
	YA1EyMDsybFh9KVs+j+/vpitYQUxVe/5LSBFBBUnwROrGUdAq24VI280WZIRJYTA
	esdQcQ8glmJbNhZZTPd2iTz1+Eo5xEoM4kiabbVqRN2amgM/IglygGQ5POg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32mgbty3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so680272385a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 08:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364123; x=1795968923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f/9te2ernEKY868Q2tTfh0N9+4p6tvTufZbWIWjMoLM=;
        b=dWfZUc+epyMijC7jBl2cT8l+2Gu4dLS86FdcKA39aYSk0hRBhDEg4qRqGr58Uet+DB
         F/IYp2QPhdVs8NeY/E09BnLKAFJfz2o/eaF8rTDST9Ku1nTNw0ctIAPyZ68+YFijVDxk
         PGsSPgVDOX2BINExxgSxS3BDAI43KHJEagUJJpqu2rgW0pmYWeZZLmMc//ZzW2RPtMbV
         bOqG7+q6KAtQiD08LlgTY23q7MTsY5mg9nkakci9SYQN7WtMZxq3piQSv98Jr49pzt6S
         7zbOftlrMRRuTlUIc5a4/t/2Y8e96AY4DDm/ZEJQB/zH0NMpXvg/1l/h+WzoZvssqURq
         I8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364123; x=1795968923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f/9te2ernEKY868Q2tTfh0N9+4p6tvTufZbWIWjMoLM=;
        b=dEtWQMZU/GnIaD9Dh3otQ8mksyfCIGmAF/6WL1INfmRhOg0UBqBNh7JIsMQXQRhU6i
         aXG5HHFMWjKlql4v4NEo4LFF8h0aIvLBYC0LARxKF1UtciKQM9fKKcGxQanfBZJit9Wi
         DnEMtOLUUZOyZjb/9SE2dynPEBsiNfcfXQ7es6bMGBHyyqEi6WfhKnHsjERy8OZLsQ/D
         RK33c0QsrrUEpycX9SHRqxRjTXyIj04GbkjCoVvB16doee/YbXtWfVEWWv84qHlJtKHZ
         a6Y9W8e15m7LtcLI6TzJLIWW/xN3SwmjyAsM7HfcYi1GgiaRTADaudGF7O0YctZuHL+s
         Q1/g==
X-Forwarded-Encrypted: i=1; AL+hErFR81UoaaEFvij4PWGqM8+/HyvejV8++IPmklwwwR0TWIIqCDXx54VSjGEI+okS40X6kVQbtsWDygw1FZMI@vger.kernel.org
X-Gm-Message-State: APuU4Z8MQFfhSdUH2hT+DneVHDmzqKA3necfzNriG5zTgAa+TvnEOxoZ
	4t+ur2TFXRWrViBlXaRySpixSA3MloZP4fL0imsAQAtdiwp7XWfAut8xuFlTgL6qRSVl/N7K7SG
	67v87Btqu0+0SrAcLcnXo4gcGs2S4Gre5KRMYVbkxet07294LPAaNzaoicyTW2NQstcvI
X-Gm-Gg: AZFdTZctfI/vQdHhbL8AEgesuRyH+vLue6ggwJQTZCm9Q3venoT1sK3ZXsILfWiU4y+
	cG6wOajISvzsIlYAZkVF+NGZk39WMcHMvKFAwwdXM2JuHp3mNqzdIBEM4TDqsdRjTDcUC+6ZI+s
	8gAbXxrIXL2ZS4TKPyLo9mWq8O6oBIpdg4G5bUDYkrEizr1yZBspXyz62M42ybAqG9fcRDTHVQC
	kw8Ucx/DezDU7CN9KbunygFFphJ/bxj4zWlaloqRcfyipEfZe89PJCC/mO7SKV6nFQrTRJhTSVV
	JJ/9qMJSc0h0Xd73QTkuLe0BuQteYgH0ENhZsSXdxrRGnm3O2U1jwWTToMtAiuRzsA84d17clYy
	yaNkdGL9ygfNwgv2lh5QspURUJb1XjIvY26o0kK9JFXa4wFpitnmIZOg5NZ0ltrxp
X-Received: by 2002:a05:620a:2548:b0:93e:c12c:fbb7 with SMTP id af79cd13be357-949bab3ca86mr1519072985a.68.1795364123332;
        Sun, 22 Nov 2026 08:15:23 -0800 (PST)
X-Received: by 2002:a05:620a:2548:b0:93e:c12c:fbb7 with SMTP id af79cd13be357-949bab3ca86mr1519065585a.68.1795364122858;
        Sun, 22 Nov 2026 08:15:22 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:22 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 22/24] arm64: dts: qcom: glymur-crd: add WSA speaker protection VI feedback
Date: Sun, 22 Nov 2026 16:14:35 +0000
Message-ID: <20261122161437.5994-23-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX38fh5rZ+UX7W
 Sl8VuC1UlTQ+0gEHC9Q5+sMdvo/vb4PZLjj7s/ZM0gkyGvXSjvhL5fTTQWk6ED2ikXT9Ml3dbLb
 lbrd1ZiXpDqC/o9dbUBH5KxVJTHHZ3T0ci2kPSUnSfHf5ePQt1IQ5tmBgp56G79FxhGBF9xEAz1
 bzXMZiw3RzIUHflx9qYSMcuO6xsj05WZbSIFnVn4TMthZOYoIuxTv1i6Nw9+IeMFfxvecMHbYWo
 p9GgcAdt4x2ZV0ndIJhaHgN35ot3lP0b/gD1gE27vMQuDK4RaZsVWpP0QicWIkJK84wEnewdbUK
 zsZe/jLfuWdG/dtsFVdwRKe0DfaxZbUM3neesjjyb1UK7CcmJTsl+Nrg6hTElbWXN56ZTtmSKrI
 ZTaBT7MkkMxfxA1mGIvdKTpfdrCLlc3RHM9YZmzB/uoNbsKnRjCjSlCeprP6uPs+amkq7Q+ogoO
 /FKJcdOdJYRGL8l5ERw==
X-Authority-Analysis: v=2.4 cv=OM+yTiaB c=1 sm=1 tr=0 ts=6b03151c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Iq1yyRatR_DTk_j4oukA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXxGpJ/xBAxCjx
 adEN4hEPPmd5OV12fnQ84LLETgQxdXMCpwu/43cbyKeKpFgVkd/hnIAaLrwCgO+1QQW8EWjKxPU
 68Lx3COM3AJcJ4q6ATM0x9X6/EAqcd8=
X-Proofpoint-GUID: gjYNadbtzkSyiO2hjwkBWKB4q_tzTV7o
X-Proofpoint-ORIG-GUID: gjYNadbtzkSyiO2hjwkBWKB4q_tzTV7o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Add the V/I sense DAIs of the four WSA8845 speakers, the SoundWire VI
ports and the WSA macro VI capture DAIs to the WSA Playback link, for
speaker protection. The speakers now expose two DAIs, so give them a
'#sound-dai-cells' of 1 and address the playback DAI explicitly.

The playback-side WSA SPKR codec DAIs sit next to the speaker-
protection VI capture-side DAIs on both WSA (left) and WSA2 (right)
buses on the same WSA Playback link. One MM1 playback open brings up
both chains via the machine driver's multi_direction_codecs flag; the
SP<->SP_VI control link in the topology handles the DSP-side pairing.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 9562a432dca7..2ddbb4dc526b 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -262,10 +262,16 @@ cpu {
 			};
 
 			codec {
-				sound-dai = <&left_woofer>, <&left_tweeter>,
+				sound-dai = <&left_woofer 0>, <&left_tweeter 0>,
 					    <&swr0 0>, <&lpass_wsamacro 0>,
-					    <&right_woofer>, <&right_tweeter>,
-					    <&swr3 0>, <&lpass_wsa2macro 0>;
+					    <&left_woofer 1>, <&left_tweeter 1>,
+					    <&swr0 12>, <&swr0 13>,
+					    <&lpass_wsamacro 2>,
+					    <&right_woofer 0>, <&right_tweeter 0>,
+					    <&swr3 0>, <&lpass_wsa2macro 0>,
+					    <&right_woofer 1>, <&right_tweeter 1>,
+					    <&swr3 12>, <&swr3 13>,
+					    <&lpass_wsa2macro 2>;
 			};
 
 			platform {
@@ -792,7 +798,7 @@ left_woofer: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "WooferLeft";
 		vdd-1p8-supply = <&vreg_l15b0>;
 		vdd-io-supply = <&vreg_l18b0>;
@@ -804,7 +810,7 @@ left_tweeter: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "TweeterLeft";
 		vdd-1p8-supply = <&vreg_l15b0>;
 		vdd-io-supply = <&vreg_l18b0>;
@@ -896,7 +902,7 @@ right_woofer: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "WooferRight";
 		vdd-1p8-supply = <&vreg_l15b0>;
 		vdd-io-supply = <&vreg_l18b0>;
@@ -908,7 +914,7 @@ right_tweeter: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "TweeterRight";
 		vdd-1p8-supply = <&vreg_l15b0>;
 		vdd-io-supply = <&vreg_l18b0>;
-- 
2.53.0

