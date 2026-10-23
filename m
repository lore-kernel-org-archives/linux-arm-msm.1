Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775911;
	b=HRv7cTR9t/pFZoIljgWZlIcP6rm8ezwUIddm5eO90afVjkMGSn3M23uC/KBU7bc4FAVQ
	 V3xAid0XctXH3ojp4kNkK3RFz9CCxVwVREXx+WIUm2pPwj151nyaKaG0ILXqJ+cvwlQQc
	 Ho58ABN6Kqru9KsgnYJ7ATMvF2YCAuNoidod5eicRPlV49O67wwE2osu9LAUkVK3/Xlxz
	 FejQK5IoPJk3jvLdLrxP90zjAnE/wDBKpZfGddLIeiMaAoiiU2VbBJ0OXVps5VUR1lhqM
	 vBy8eXASs2Rk3Cfmh/SKpJdIl2p0EYHCUURCKncxvYEPITmkR9ukkn7lE3X4nJqAjlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775911;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+nuqdJUBgvzq3TkkAc7l1O26WfkuwK6Nh8uA2GYF0o4=;
	b=QsxkuaTZ8XT2eJ/jmGWTipDcFWmdJMCdQLj00Ibj0BMzifUebJnoSvCjanm4cYYC2qSq
	 KlSVffnAEAFPmOqnzIILhQOLrf2psVh1vl00gRQzG+bSKiqVQfQkh3vPdNvngYeUGIZO+
	 U7YrTNisbV9IsncBijRY8pG43F2pZz4on0VmVhdSfTgb7ge5kddNTixEY4ak8owzJTYU2
	 ns/ohL2SPzNtu5WYzBr2hTEM+qOWu61mF4tQ4EHXJh9PPj0sKtaMnaS+fbF9ydruGkV8b
	 MLg74ZaB7orBNdHs8/0rRNiol/92bQQReuiSrSP3ZA6qcqN4KOpzQWh4barPABwYkLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R45wIbQg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VetaSVmQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B690606DC6F
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B690606DC6F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R45wIbQg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VetaSVmQ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG3uYc3812384
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+nuqdJUBgvz
	q3TkkAc7l1O26WfkuwK6Nh8uA2GYF0o4=; b=R45wIbQgErXsxYdYO1+Z/I7bC1J
	5d4RNR2zv4FYzqgC34lY9duBrZ/xFRw8HUGTsrjbL5lPqa3AB8s8gdHkRoKMwefs
	IvsHWvvVSSfkR05tt0Vd3XV/fXJ/XB54sPBcqDZ1GJeQOTsJwv+MG8MaV6lx8CJf
	BvdahcESu2MGZjr45UbdqcHn5lqcPrWqpmMprb5DrJLDP/3EAmw9EVpGV+NW7jgl
	Xnrrv1DiYsJSjGzGLWm3fPqGu8ayFg4kTgwQGm3A1lXHSUeBGwpmvWk1UugJYJTe
	mxbVMTGUHEe5NWM8MSGmcuBo1QYoOKHQ/5mBbnebitm5UHvzhGdkJtCJg6Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas88986-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93dd3c3badbso281621985a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775909; x=1793380709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+nuqdJUBgvzq3TkkAc7l1O26WfkuwK6Nh8uA2GYF0o4=;
        b=VetaSVmQRVXif5aLmH2WoNwan4zvnfkl7uhA6V4q3b4TnTRv+GdyiSFHjbO0JPuWm2
         blsRrI/cIDMRnvCYI+lhQomai303gm2xcy6Ko/W65Qf9Olf2t4C+JZ1eVhqw5G2jLK5w
         +7jHtTaIiJdCT7ouiw3jnb0YRKpnCbRe+OVNka5caqjowL27x183My4/hcGkftI9TS+7
         QnPOGaSsnT9I3VHAtKorHpP6JsnuC28wwW5iYighCr+qoSnxkmfBsg7/TkURBqTBE85/
         EizWQArBtj20DdiIYO4lDDVRBs0dj9cB4XJW5NZQnfvXuFX1ANH54AxSfT0k0kGjdzsE
         /eLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775909; x=1793380709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+nuqdJUBgvzq3TkkAc7l1O26WfkuwK6Nh8uA2GYF0o4=;
        b=xMHgIebOVHN2WZ4lnOQgJ6a5mn2T5RzzK0drBk16V9VklzxIO/qvTdyFPV1O9hCjvk
         IV4V4nUy9IV8DsEh+wufp4HaS5FOkIuF/xtePB4s1AZwQZ8W4PEvFYhhbfBBI3pSwnWW
         bh+7jqFQGS0GzUdqVg3qRZTiFXKqIc7y4tNwHR1tubN+oD8eu3IyqQxHV38AbcHtNKhA
         uFfNf/45GDsqyt+9iJrLxjn13Rm3pTxlaghRMJ4DE3gh3Q77xsZJG/ASK/9I3LETlrJW
         id3XvHU4sVwzqL2N7KsKeNDlhD90h9CcGnnSM+stxH3XrCPkAwX+Nb/nurP73i7IXpJh
         tAeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLH6wV5L7xxnGdheFet29rFZds4YSVjkB10tVcOWHduNFvLQ5O7Rd1o3Yt/mSUHqyWxAJNc06VGYY+F2/Y@vger.kernel.org
X-Gm-Message-State: AFq9FYKQl3fRdJu3f+uUEAXFYx2BjWb6TJXWLQhUyNfHrgZAhYcX2pTd
	40sbcC+VHQuuC2WSzGw6HgpOiRduajnE3pdd9ctTaUPJvEEF68VTnHkdpPIIDEHFI3aGOFbAS+2
	H8fJm8ESLaVQcNJ1JoEDPh6QNtLQNLU2ZrxWtS/pV7cq0XJLaeSZVZUpqL+IMuG0QGMLn
X-Gm-Gg: AYBFou0wp1AOkaTg9KvzWBCTf6Yw9VTv/VIGGd3LNwkf6x2yyg/JOkjZ2hrXq135GBV
	fodYj4AmrRTA4Zr4DDD4uCs0GImwMM+IcJNuUZOk4FxnpLd988XtBt+NB6Vvrb0Tj02qZJw0k0Y
	nypdBnm5Nb6jS3wpwYM4ut6etSQUuJqsNgzhtMy6zcgB7h4SQCzbzHbVDh8RkvH/c9XPv7rkcWd
	i8E0W0C4xsBiyxhsCJkPfNPOUCOffXdLiXLP0YZNtr6W3P0rZ3bb6YiXNieOF0Adr8YmbpHOUln
	R0QhIPHEZdDqOubtP5X3w4m8FcMX8et6TrDnZ4+zkbXDEpfPBlptgw/Gx8Hysp6w8uHeRCvolbg
	LwndIpI1bORO5
X-Received: by 2002:a05:620a:1a10:b0:93e:d854:4b83 with SMTP id af79cd13be357-93f6f782fa2mr545739885a.22.1792775908700;
        Fri, 23 Oct 2026 10:18:28 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93e:d854:4b83 with SMTP id af79cd13be357-93f6f782fa2mr545734885a.22.1792775908118;
        Fri, 23 Oct 2026 10:18:28 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:27 -0700 (PDT)
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
Subject: [RFC PATCH 23/23] arm64: dts: qcom: mahua-t14s: add WSA speaker protection VI feedback
Date: Fri, 23 Oct 2026 18:14:33 +0100
Message-ID: <20261023171433.820092-24-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX1WjMZw3tmwpM
 adzrCSejff70ZAwGCKfQZe16tiD/4wO2q7/IFcYRdjA4TBgaU2QB1EHDt2WLgUDJG85cvGjfXG2
 c7Ghrls17axTQpiW6f72BRSxXBTNBkU=
X-Authority-Analysis: v=2.4 cv=OPqyTiaB c=1 sm=1 tr=0 ts=6adb96e5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=07M9w8tHMIt6-5hUJIIA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX55x12z56N4pv
 6MX0gBAeiIjP9Aak8NKh0OUkjRLf8LRQkGNrLtB7oIV0z/Ohx7Re53f6wXxY5N0b57WiE3Q9a0u
 MyMLlC4ETnXARAvrd6hmc9PeHAfNdeoXH/6RAw1TiUqF1KHqUn6hurhZ/AVZUQlGLqcFUlyXEN6
 1UakfjM6yqRnnWdN3GlN5Iz9u+cux3VfYlM7BfYlfYFGVCMVza+by5ix9WzRaro/EnmL4LlyJWC
 3RtVRvn7BTq8L8ShRG3lNYV8eg520urFcPiVofG27pV2Tm170BCiyUL+YVD+VsqWxBK8QjIcHO1
 FjiEwCf4canAMv+cMmRxxsB2J+Nbmvp0op92I0VQ3dF0b5+DR2il36VmNpCBCBnGxN0tHmC1CPD
 sqzH9vqAraL9vKWp3JY25PJ+3PsrhBfF6vrUEPioKltZB1f8jxUKW/jxeWmbNRmHF7BGfTHc4An
 az6EwNUVvMp4fN3in8w==
X-Proofpoint-GUID: mnTr13Fo0oH_q1UypMvySjJYnEfTF0x-
X-Proofpoint-ORIG-GUID: mnTr13Fo0oH_q1UypMvySjJYnEfTF0x-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

Add the V/I sense DAIs of the two WSA8845 speakers, the SoundWire VI
ports and the WSA macro VI capture DAI to the WSA Playback link, for
speaker protection. The speakers now expose two DAIs, so give them a
'#sound-dai-cells' of 1 and address the playback DAI explicitly.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 26d6d8285e04..d6a921b3c713 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -268,9 +268,20 @@ cpu {
 				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
 			};
 
+			/*
+			 * WSA SPKR playback-side codec DAIs plus the WSA
+			 * speaker-protection VI capture-side DAIs. One MM1
+			 * playback open brings up both chains via the
+			 * machine driver's multi_direction_codecs flag;
+			 * the SP<->SP_VI control link in the tplg handles
+			 * the DSP-side pairing.
+			 */
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
@@ -928,7 +939,7 @@ left_spkr: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "SpkrLeft";
 		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
 		vdd-io-supply = <&vreg_l18b_e0_1p2>;
@@ -940,7 +951,7 @@ right_spkr: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "SpkrRight";
 		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
 		vdd-io-supply = <&vreg_l18b_e0_1p2>;
-- 
2.47.3

