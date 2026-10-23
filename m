Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775909;
	b=btTxD+MsN1qYtEsWmnWYTtwrx7Y44CjdtUpq+1bYOCScPi26KWbwt7WKnfaXiaEwscrK
	 DWkxef2vrfal5aESsSfRpjkuoOhKbkugevlgZWiQDZKEdMCgaSfyQGPwhp0TgDScW+wIy
	 JsGTZHDoyflKc5Acbmiu8sQWCxwYKCoNgstmBlw99WyRfhB2HaT2t4eIUnGyQjVvbyFIl
	 2aBgkaHZEqZDd9Yt/JwPJKWCw5VsFwqVck7UTgMUxfY8AFTfYarNKAHM9sNetEAT4Zd6N
	 jG759q9vTelvRNkRn7uX70D7LElvbOWweh407Zy/f5676ViKWKKyVCWW1y7E3myg1pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775909;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cXMlmuKppBQb2uNG37YMLCql+EtOjLG2XfTFyB1o3YI=;
	b=JTG2vYqBdgP+UzTpivBlwWZ82WRS32nNtSQoEbCYy/nPRmt5akrCHaMKq3ecemGNB8ro
	 rlMFpoUiFOWPgmiIqkkoHmQ8zG6ycmU9vskMkx3HVus+viE2NF9UnkwqW831S5dyZ5PId
	 wTgxcsn4wDhedvwUecjzhHY8bk1eGRqVBJ4H4r32YqIGU4EGq0qPdyRrT19zUNr7aDnja
	 KB0UW8hpqhrEHgKE4gF+PRHzd1PLSqtPYKUiRuZMi6dKF6tAhL1jghrJ7GnfQipdNjJY4
	 x3yL+ueODCUXbZCwuecNMZCip18kNEE3ip+bS/xFH4y8iv0qytfCO+ELAzEoZ1dkd0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i347DQ9x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P1lKYjc3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AB160A381A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1AB160A381A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i347DQ9x;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P1lKYjc3
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG6CCO2215802
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cXMlmuKppBQ
	b2uNG37YMLCql+EtOjLG2XfTFyB1o3YI=; b=i347DQ9x7D1UCl+LQHDGivzgiQu
	MebQJAqRBiZswZYniNcj5Zv8iP+HMpB7ZwWeb9iYxTazXB48fLHKix2u40Ycdhr6
	p7NSf3OornhiWcGJh4hl7ccTfWWxY7u7hLYeuECdkDdUWlh29adAJ5Ors3c8+4Fd
	ijeNd/z9urcNS2pNIuZDd8tFzJxj1PCDGDNfJsGhPpTUjwHXtddqnOsqGErtY/c0
	anDMxKUASWUX7PV5dXOl9MPxt2RFg0l0a7TMEn4RngvhSjlb5bJ7Wy7eNPVsLGVF
	ZeHqzXvKk2n7J/K+1B9sUfyjlk5unAfG9xxTthDq8F9xGvkMj3/1L2qR+8A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgatc896c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b875639ceso23838076d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775907; x=1793380707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cXMlmuKppBQb2uNG37YMLCql+EtOjLG2XfTFyB1o3YI=;
        b=P1lKYjc3lw79SU5QhNz9T24PTWiyXITkOa5Oon/GLu66pYx+jczmCxrkGly0Whu9tv
         3kd4743s8G4LVkLHk0RnyxxJ06soFfeYOFIljif87HeEsy3f/JlAXVWnGstXCKu41V43
         OUW6oKHTk9w81a82xdnfjhpndlNbAi3ukzNP7JP+zluiioEnRhznEd2XZ+j/PP24mK8W
         9Fdy/Lk9eST5VI3xKUxcINqFzualjkeMGpy0UCqRt7Leo1QrZwhLBu3eBfWqYZYwqjv0
         oVDp6PzMjwicF0pWDeNfZtHq98JSO35dKFNyhwK3Xw6PK4zWI/KjTaAeU+X5ALtHoeZD
         UFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775907; x=1793380707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cXMlmuKppBQb2uNG37YMLCql+EtOjLG2XfTFyB1o3YI=;
        b=Riofv0UnWEozyUffsd9q7nmyipLllxKyCve1Td8y1ojlIbfPcPtbCWjPeDwtfX2Ddr
         izKvkC+jqPDONF84X93vhuyBf8nPB6mhSAzdSysBefEIU9KBVHPWN2RJaomOiz0D73+Z
         0PKSdKLeo901J2aClTYxBg30b8aX6etSjabhV9DFIIJgf1YBhDYfCPLAAZDFkjJuoKR5
         N2VtcLpzjr+pVX3Tmy3hYd5IlE6j6Dyv3Z4NALcblck4lF31TgANjTtI87NrJMDMeBHE
         V0IfBbLl0bTkRdOUQdtvFMAw6orkS5wTs2Ta0nfqH9v2C7pWZ5K2szgkHpsUYURI5mfG
         ABWg==
X-Forwarded-Encrypted: i=1; AKwUvBzgUfZuKxuCTfTtKJuvoAU7dr92WK3yaNuhqwzcamOdwsUwvpQ7pwvPcGjYwmvhrtlSSQTqeXbGs0mh1hts@vger.kernel.org
X-Gm-Message-State: AFq9FYJKauZqWI97F6tKALgbNu0mzjCVEm4g+1tUK1zHhMDIySzBwNnB
	EHFxQCvaw+6W7HtvmjHmswK7OPtHRDBtvHHso2S9qFEoCaAwqzdMpStsgCZufeyCv7ZQimJ5jRU
	ktbJbwsjNTht1OlKiVjpultTtqHqHREd60t1legfJXHUzsJPpLP5jX/5C7agGIAh3cTEA
X-Gm-Gg: AYBFou0Xatdmj/uw7Rav7LzrgdhCjGdUJIvs9zJ92vGnxNOoL6dLvwI360QQHS9sITO
	CSIafhMJiZNiizBvCi+ILMUwhJBw6yodkuTzoSVB9vtrHLsMQ/A1d7nRw6SuvVHYQeQKaxZLfhS
	SPyp9ubkZSjzL5w2FXNEKrSTW4LkGYEjGFYJbumGWVGcX2AoEt0dxyI4cxm2FcOZfwIkzjSnB+9
	DoCJuertKpZK5iP/77oepO59q00pJTBORUrjx9xUHYAB32WRDVlU7D+UR0QvZC09EE3+zGg6b5x
	F9cDSvksj2vE7xZwhs0HSbD+T66oh/Y0KG+P64FzWuHd1gL/8HxI4G5BQR5Gw3lE6fiq/rpvx4b
	0WS9rT0bLpVE9
X-Received: by 2002:a05:620a:8702:10b0:940:7e5c:7424 with SMTP id af79cd13be357-9407e5c748bmr97337785a.66.1792775906837;
        Fri, 23 Oct 2026 10:18:26 -0700 (PDT)
X-Received: by 2002:a05:620a:8702:10b0:940:7e5c:7424 with SMTP id af79cd13be357-9407e5c748bmr97335285a.66.1792775906330;
        Fri, 23 Oct 2026 10:18:26 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:25 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 22/23] arm64: dts: qcom: glymur-crd: add WSA speaker protection VI feedback
Date: Fri, 23 Oct 2026 18:14:32 +0100
Message-ID: <20261023171433.820092-23-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX5B4z+hLwjYp+
 qRkZWGLrnW6ZOw5V/skeF7gdONmkDXxVo8aMIYWkmPEWyttqs9HvULw6pVg6ep/ToI49q9YFmDQ
 bMpvrFYVprpCrsQZeWvldY8x1NaHMwdreyQGZHCBsRRleGBoW2Skn0jKH11lYDF0IZeFWUC7cfH
 uH6v1hFojAdQRQC8zqhi2g75gdH0WWBatrym7A6f2Q4uvpce3i+1i74SrdZoFYu3nSX/RQ/FAXf
 QJd+aihAR2i+mwsRCmzHGFX6CjLwQJMwoyVhpJBu13kYQWvs6pxDy5QkMEh6J59HSSrHyQVDt/0
 +0kJFP8amia0iqQnLMrk3k299mRk7hpeei01OpgtDXWNULrluPoqaQOzYqbMHxyup+9or5x7X2P
 sw+RM8XPHa/2dkYACxZYK+rt+Xxfgft05qMlgPu71IFkDswS6F/EduZxU+2MgsZtgne/7Sqcb7y
 DWU1ODFyMZA4P8pxlVA==
X-Proofpoint-GUID: VLB27n0iGzvTXxjrgjia4ecyinhmUEmq
X-Authority-Analysis: v=2.4 cv=Scxi5fRu c=1 sm=1 tr=0 ts=6adb96e3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=gpxm3BjZcJp1ZicY-GEA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: VLB27n0iGzvTXxjrgjia4ecyinhmUEmq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX4PZ+UMrWvDZc
 c3jktwEGlQv5FuAyYRAuZoyMjHZ4xgzj7Y8rqimypu2JBeDh+fzw28YsahcuYkXCPLuamc+zEKp
 S1jdfmkVyGTpT4zJnVU20G4N3e6pcAY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Add the V/I sense DAIs of the four WSA8845 speakers, the SoundWire VI
ports and the WSA macro VI capture DAIs to the WSA Playback link, for
speaker protection. The speakers now expose two DAIs, so give them a
'#sound-dai-cells' of 1 and address the playback DAI explicitly.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 29 ++++++++++++++++++------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 58158b51fe29..fddc76f59557 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -256,11 +256,26 @@ cpu {
 				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
 			};
 
+			/*
+			 * WSA SPKR playback-side codec DAIs plus the WSA
+			 * speaker-protection VI capture-side DAIs on both
+			 * WSA (left) and WSA2 (right) buses. One MM1
+			 * playback open brings up both chains via the
+			 * machine driver's multi_direction_codecs flag;
+			 * the SP<->SP_VI control link in the tplg handles
+			 * the DSP-side pairing.
+			 */
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
@@ -923,7 +938,7 @@ left_woofer: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "WooferLeft";
 		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
 		vdd-io-supply = <&vreg_l18b_e0_1p2>;
@@ -935,7 +950,7 @@ left_tweeter: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "TweeterLeft";
 		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
 		vdd-io-supply = <&vreg_l18b_e0_1p2>;
@@ -951,7 +966,7 @@ right_woofer: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "WooferRight";
 		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
 		vdd-io-supply = <&vreg_l18b_e0_1p2>;
@@ -963,7 +978,7 @@ right_tweeter: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "TweeterRight";
 		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
 		vdd-io-supply = <&vreg_l18b_e0_1p2>;
-- 
2.47.3

