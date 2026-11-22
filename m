Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364126;
	b=KTBCF62mofdUsA22qBE6Kjw+wtJi7mUcMdNpfJFhaUqS+z0oXswwX9RqztDPQrGIydGd
	 8ibFpNcrzZB0KYZh4GMviOxGZwFjbxZdlrABBmrkurKw+y4QhjKyzE3y/ramMxxIn1ThG
	 +xl8JZOgNfzJoDA3k+JznRvfBZCdh3m+9XLGrfYVjaLHjqG526v7xhJICA06twjYZNmw4
	 8W2OjAclzxi0U82WjuHSIjIUzFufvCKfgNIjkzhfYOILyOx/KJ0CgbWjFNcy6NM1bwl2K
	 0WBAQ8qRCGnyJROFz/CucTPsby62qgAnGzfOGp+u0AgsMYesalPzATS4lN2bedOLRYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364126;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZXdUoqdbSRJd1s6e9oV0QbQ913cHDkV0icZzT/bR1R0=;
	b=hTjrVEdbjFcUT1VxTRX53yWkVyfkaENdkeiLD4ka3TdgDvJVUnQOBYs06MU2eSEnc7DJ
	 Hte2ITuFPkdX0W04FwbYsPvrolpOQ68UgOmP7EepoS+r1OoyboQcwio3FJ6S6KfNW3gIe
	 0sk2RMV9alS5vqNC2ecjhJwQkNpro6IEPwu0pHL9CmC6ZbePrdefuu+JXsx98Pvvk+YWg
	 n8gGpv6nngXue1zREAVUK1zkK8vK7uy3w07asBfb0mVRaolQolaK9gPXDNQWyPRl1k14J
	 k3LOJp/w6cASwBhTYNoYSFkAOw/4j7iiH9t/ujZgCvSHBtYdqb0VHIz57IxL7hQ1Ttw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F7ZLBf13;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xn+R2jNS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CE2606DA2B
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65CE2606DA2B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F7ZLBf13;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xn+R2jNS
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQ9wk1854232
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZXdUoqdbSRJ
	d1s6e9oV0QbQ913cHDkV0icZzT/bR1R0=; b=F7ZLBf13BN2DpneKCSqjS/7EyJD
	A94WvUlT1emakZgFcG5URf5GhdyVec/7ZjBK/JrcWLPpfPH4Tx6g9cAsrbdbCu8m
	Ofjx88MNGFZCtZ4n12ulVJI+y4CJ+x0EmYTHrG8ejAQznNAuLZku7vknakQ07ADF
	naUV98Q0axFU/Nssjc8sBCflRrTNCs0kU6h8KUPa8p6R3GipmnEWZzKeYu+laIgI
	baKvoQHuG/mS4YzZbuembAjfi9IIbh+AVQTqGHrfaQsFY1ZFjGxvcWEz2zL9yiYN
	pSFiN8hB3y7Ky16HuJIWe64Vb52YsqXhi5YQZnMNvxRp6UXhahbkeQvHqNg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nnv42v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-949dc497896so56179185a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 08:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364125; x=1795968925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZXdUoqdbSRJd1s6e9oV0QbQ913cHDkV0icZzT/bR1R0=;
        b=Xn+R2jNSxXixcqiAP2Ug8TqFY9Fog3Ba9w/J2Z4coeYFNmNen5hxB6tT//0aPiilTc
         +czWrd+WeHajdb1HkC5wfxVO7uANlPPOat7QKO0uM+aSdF1fnGQbKeUAzh+wiN6OtGtn
         l8wEbWtzUqfvUWlOGOdsSH88hg3Itay3UqcNX/TqpXLvFvXJMGcxcAegq67LdQ2iW+PP
         JyhONMWbIIpXSzG7cmR2iCbxoqhVG6NaV3udXNtNox+Af947WKCYBPD6aSWMiHV4lSGj
         Y0uPkLTO4UyH5Q0umH4AxeDUZi6BVBRiDvLk1x11TdQ5PmpMP5ZUPivR7YC0z3TI0ywJ
         45Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364125; x=1795968925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZXdUoqdbSRJd1s6e9oV0QbQ913cHDkV0icZzT/bR1R0=;
        b=uN93EApMWSohDgxLtRzQyULna6x7m5gYxYec7fmoEwW1xHd0BivDNLk6Mp1X38jmiK
         4H/bKBwBhSIbxoSNHXPK5eCPbQvFrct+75t9EDsb1lyEXbK2yQwaog4rHjTKwr+WNneV
         suKA+6UH0WF1vdoZNNdoZxZMYjYS6vereJWMUlP5pFn8szBtQckCB+95Xe7aowqg2h9j
         hh0d+PVTLc5bdQxMihtqVAzSU7OLP2oCxon5sgS2mcF4mlcJFIW1PT/Hr3FE60c0yF7b
         IKck5Ml9OvH341nqlO1fIkjAQ+qzKq8u/LUG/C087tIidmdnuiNA5+e68vOcNJdmGBVM
         33wA==
X-Forwarded-Encrypted: i=1; AL+hErEKXh887sFWZwuywCkdgA2FIKw8XB7Fh+o4VjKTVJjfc44OXQwYOQcTlLR9tAcwAWUkY/qhY7dhuRrUadZn@vger.kernel.org
X-Gm-Message-State: APuU4Z+GLVasUMsYiI6kA9SGBY3yzWn8Q5M+vNzy7+i6hM6T3rVA5FT5
	H7cFIpwLrwgZ1w7i6eoRX4Fuuv55+HDJ6Ptg0RwVL8iuzBQt/vlKVXgg8IEVPvtyQOdtzFUWFw3
	Zsmg/vfRE+DpP47gdkZ+IWbmNsOC+CGF7G6sPuvK2djMgXUOG/WlX+dAFmtUcQn8pm47f
X-Gm-Gg: AZFdTZeLwN0ulv6VZN2kFCOMWYKN2aWRP5DDU0bmXHXjHu1iegHjgqbRKy2Ky8mdDBt
	CKH2hdMY6E6oOxJkivPOz287qjUfW1U0kjyLwo8Dq7wniWMh2WNPdz5Gssb42LKNK9Fh9S0THbD
	cvHnjHhiXWznNK5jG7wdZFDq+tcdmkorU975af17KdvwACEjEV/LlwNpY4REfFjKOib8mkjT1kA
	dqmw9fp0eRSP6SBEgpsTUjziH2XJuSsGkCaiprH1LrQpN/HNBnxgTX5Kef1v0AxS0CilxVLRdwC
	t5TQuIubn3uGA20UbaqBr+YHQKDFbH3wATxfkpFKKZ/2S9uWNAmP4E+JWDnoa3xa1EGJ5hyn+nL
	+xbrBqTo1+C/nvm1TaShOPe2nS1OxgGSg94Pf6dRzVKJvv8V4YbPboJPRlWnt8QXS
X-Received: by 2002:a05:620a:6491:b0:93f:565f:e46 with SMTP id af79cd13be357-949bab32659mr1278944985a.52.1795364124787;
        Sun, 22 Nov 2026 08:15:24 -0800 (PST)
X-Received: by 2002:a05:620a:6491:b0:93f:565f:e46 with SMTP id af79cd13be357-949bab32659mr1278937585a.52.1795364124226;
        Sun, 22 Nov 2026 08:15:24 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:23 -0800 (PST)
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
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 23/24] arm64: dts: qcom: mahua-t14s: add WSA speaker protection VI feedback
Date: Sun, 22 Nov 2026 16:14:36 +0000
Message-ID: <20261122161437.5994-24-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXz5EXQpT5janU
 jne/bXQUXCV/JbJE0JWOs3FpwPdW/6K44RzJBjp5XxptisAUw84le88a65oT6sz70m2GFEfKLzQ
 poH6LnmuIqaoosOypqk5dpOxrDLCpPhXnk0HWRmr3zPjk32ajHQK1D2henpodb0/z/PK4urHAGc
 CwvcAbpWxVb64mAV11S3iug0P1LQqluxPL5lgAKr1Sl35Lj2v/WEDHGURBoBMamKYh5JSwersQ+
 HMV0ECUgjWctFmZl9EoGpmatU0RGb2ILS0JjtuDwZV6cfAEGWcijgVHxKR7UghD+wk6Gd6oTllv
 z+k30lNX02XBmGJ8b8WG8mdxR9TA5w90f3es7p9zrH0pAL+t+ZWKDsu6Tw4G9Dzx7sUxa9vmk4z
 iz6rlchQPV2DFkC+Bywqp+HZ8KQ0DTwvTdutNNM+T03fcjk8c2ztkdSBPD3yazHo50aElNVqUOs
 /rEfMb5lITzSEB9mcMg==
X-Proofpoint-ORIG-GUID: zZJecHq7O7JXRtiOiIrhQw8CiOQf772t
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b03151d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=PlqI54VOmiubEWYg86QA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX7+o8he6l5Qbv
 FPrj1JStHH+FJforPbEufqmq06Mhm2HShrlhEt7RCy5NzfEOrqePjpBiNW5cMckIVFEODPLhq6a
 up2jRt22e5SFxw7VhtrA//kvORp+fcY=
X-Proofpoint-GUID: zZJecHq7O7JXRtiOiIrhQw8CiOQf772t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

Add the V/I sense DAIs of the two WSA8845 speakers, the SoundWire VI
ports and the WSA macro VI capture DAI to the WSA Playback link, for
speaker protection. The speakers now expose two DAIs, so give them a
'#sound-dai-cells' of 1 and address the playback DAI explicitly.

The playback-side WSA SPKR codec DAIs sit next to the speaker-
protection VI capture-side DAIs on the same WSA Playback link. One
MM1 playback open brings up both chains via the machine driver's
multi_direction_codecs flag; the SP<->SP_VI control link in the
topology handles the DSP-side pairing.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts  | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index cc7ba3c21bdf..407a8490e6ec 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -273,8 +273,11 @@ cpu {
 			};
 
 			codec {
-				sound-dai = <&left_spkr>, <&right_spkr>,
-					    <&swr0 0>, <&lpass_wsamacro 0>;
+				sound-dai = <&left_spkr 0>, <&right_spkr 0>,
+					    <&swr0 0>, <&lpass_wsamacro 0>,
+					    <&left_spkr 1>, <&right_spkr 1>,
+					    <&swr0 12>, <&swr0 13>,
+					    <&lpass_wsamacro 2>;
 			};
 
 			platform {
@@ -789,7 +792,7 @@ left_spkr: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "SpkrLeft";
 		vdd-1p8-supply = <&vreg_l15b0>;
 		vdd-io-supply = <&vreg_l18b0>;
@@ -801,7 +804,7 @@ right_spkr: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "SpkrRight";
 		vdd-1p8-supply = <&vreg_l15b0>;
 		vdd-io-supply = <&vreg_l18b0>;
-- 
2.53.0

