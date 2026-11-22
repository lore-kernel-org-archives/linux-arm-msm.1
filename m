Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364099;
	b=1ikG5jhCmmMH4sI/b8b7IYOB2s5RMo1c8rluyCwKVO9pOm4VtSRGXsNIzEiJuf4nhD6K
	 b+Ibok2eVocTjMVAUyq3RJve7vBu5sjzpuIq7Sdm/5pQXjHq/yVUePF0qstS5QKUgQqYM
	 nvfLGDkK5ebu7hwSPR3QzG4XgDyNd8zyDBLEimb8YUXotkY5rS8U6drvMmwKR5JJgJV4H
	 fSd+grSWij0YIx77I4eWMhwvOyFaReObxLKOvIeaCpIsp0LQOrweKkFhuZKpDK8EJN9To
	 m8bvndwAbVAFQNpw0q6hfONE2+Vu+pOSK+ECoVXmpTTkY51JkeKI41qUmsZKi1jepQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364099;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sdHfAwVsSM3RcFXjJBfo1djxmQ4t9JJY0AduxKTzTBY=;
	b=CzbRK/Gn0ZmfX0aACqw8CGDRZsZJYqfo+rHwpTqJ+O5PwYNracJ7F02mPeHY1M0OMzPW
	 56t/uuysyH4dp3akZutgdoKz2V2f22Zyi6+DRy4n//SNFp0kaeTju2qJTGGer5k2cQgkh
	 5of3VzrpERnd6lJtdhnzgf57tJs0WbcaPjeMM8uwnZRtqPcGs7+ANj1JdEKBuyQRTTFKq
	 Jf6MshiAAIsOFYPhgNQZkfxXQfyP/XiMfEWIjWsCh9mDklUV6UijYutTEH7gWYdoeTOEg
	 EgNvTps8JVRQLQ/iAMQksoC2JPFRag5tp/0R23SFWFKdPgreoFLOH/X0FBHSwhxHvkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pv5rWnXA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WCVDwtzr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07FB60A261A
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D07FB60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pv5rWnXA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WCVDwtzr
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQnD51248383
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sdHfAwVsSM3
	RcFXjJBfo1djxmQ4t9JJY0AduxKTzTBY=; b=Pv5rWnXAOHiOMlusuRf6oQBoUF0
	hB7OVlCxAnYy2lRljKUro/mpgAsVeECe8RggnmLu9tQ/X9NPOp6JDokaAl4OgDMm
	0bLYWY0BUWcIF6mTWM2dTXUIYsIp7LEuLImMooQBdP+01nve5feol4hEITT94kPz
	9cbowoOZ5o6xLqlWRyfXYly+B1XFmqpmfaaZIH6bUDXHqfCwSTSQUpOwD1assI30
	MORj/NWCfD1JI+Sy4/Z7WbXLoauyE7+1dnKpms1ivyT+EOraS4Zt5+heUn2f3p+o
	FJ+dWX5o6MmuxNW620OUWUrkCLImb1XAH+Rp7dm5w1hJI2mVb16jwq9Ze1A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32w03rts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:14:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9211d51dcefso54541846d6.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 08:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364097; x=1795968897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sdHfAwVsSM3RcFXjJBfo1djxmQ4t9JJY0AduxKTzTBY=;
        b=WCVDwtzrOWwN+i89thKUuaWZlcr4KKpHIF0zmVvqXx1QCUQkZtUB7gBHJ2rBY2Qd1v
         ShA4FUdfa7KZA7yeGsbLuUxmbrdEwdYchuO7n5m2iZ30q0ym6RixIhTi6otASUwEcuid
         uELuMGY4pS5ruxiJ5/DH7pRnK/F50ZQ4C1lfBEAldMKJ1qgDbApCfLDFd1Jtoi/c5ARF
         ScxGdmYaU3M8na62UcWrznmlRFD047N0Qlu9uKbr5C6kIn5MilfaOO1J/2lfHiYJ79NP
         m/ejPbfVnpJKtocYLEDY8aO2FzW+VwqKPR6teIRJDkYRiVRIPBaY0dyuVaGKn5at+CuB
         GmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364097; x=1795968897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sdHfAwVsSM3RcFXjJBfo1djxmQ4t9JJY0AduxKTzTBY=;
        b=HmgpYmlKCUvPIFP4wSDDNqKg7OEfL8vgiWmyzNNsz8ecgS54HonWGfimePzPbrU4yN
         9DfMw/VwcJeFwH9o7OcV/wG80e9GO042wO74R9hjRRLLR9iNDa/IE5IOyePJbSv2zf0F
         eb2IhpRshF6zca5ukIlSYcnWT7Ykr4KPVbsvo3Y7cOaO08XoFEi/9vcnAgBtH7aUTJck
         /Lc4+wc2JmBROF8TuBWe9Nni7RJGvvszZI3u63AfhCwYMOjtMjjyIWn2hqAt/R6ulObF
         QuVLCeqtvFC/eBEIGJQqDpaBpdUEirzZKl5P8Zc+gWwejjHhJ2p9c2dJ94/VxnT/vqDl
         P19Q==
X-Forwarded-Encrypted: i=1; AL+hErF+on1vtiu25C1+I6X4zCiUhtZsFkBVX2DI+3FusKRSJgpGjs/D6EbELF3MplVbiwkG/v1qwclP8/AoKzRl@vger.kernel.org
X-Gm-Message-State: APuU4Z8UwTa3czglvf1F0Yf5C0XyJrjIPsesU4p/wmZL4xRMe3KoWr+q
	eJyXudIrrfuMFDvacvksw/nec1X4U7NxPNWvATcfL+R7SVWmlpek25RnPNeC2VC/cfIh8C54Fjb
	ngY1YYZy8HPQn1OEKPlmBFBvjGCwmBynE+dAzSpGkTp4karjdR0ALp0ZmatBIHU6k+Agm
X-Gm-Gg: AZFdTZfM536mMv0NwXJXBonpP1Go+KszjQWcivW1Xg75iFu3a/3elfSwd6Gqfx9+D2S
	/17FyB5oq6Q3C7EmRoG4AhWE7nVezBrIVWM1cAUl82QMm/0TkMOO5BdPVM+hlbXFcIZyDRWVx2g
	z2GgFGncewwBeqRTBcWM7iu3megVyycVRRujTJuluDDxoF+GogNv3bLJ7cXZAfrHkM/VN7Hn2bT
	rMH3ic5mo6y4QFmYk0CElz6c8Z+xzC61hoxkvTzCuqE/i46oR7cR2XoOtePTI0tczKx738bhT5N
	89e4iExq9zd/DGo1i+poGOLEKSOETbOadMFayPBvnpIcVZcpQ+ymL5wt2PIUzYMmPSwYc6gV/mB
	9+8dpXt1SWvBI0qO3qTdhhLzvsIT8z4w8rKpQ3ZmyPc/w4y59r0kd5y5YVJr7nW0a
X-Received: by 2002:a05:620a:4403:b0:93c:7f48:8f46 with SMTP id af79cd13be357-949ba7e2b4dmr1532058285a.4.1795364097195;
        Sun, 22 Nov 2026 08:14:57 -0800 (PST)
X-Received: by 2002:a05:620a:4403:b0:93c:7f48:8f46 with SMTP id af79cd13be357-949ba7e2b4dmr1532053785a.4.1795364096750;
        Sun, 22 Nov 2026 08:14:56 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:14:56 -0800 (PST)
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
Subject: [PATCH v2 05/24] ASoC: dt-bindings: qcom,wsa8840: allow one sound DAI cell
Date: Sun, 22 Nov 2026 16:14:18 +0000
Message-ID: <20261122161437.5994-6-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXzjFA+5LTIOSd
 wvoZrwC1yKq/ujrqS60Nw0FMYqFP/R3DO+ORCAmHOK1OVM6qdurs320nsrW3rh7n7OEZ+4qh9ro
 pCxb6vGZ27EZ+5Uymh8qKeDq5W3Ij0RPB/BGfPg2E265K9Ke6IvYAg/Cf/5B/LhVISufByDyNwt
 0u18507YsRSI7UJZM58PLGO5ac5nd131BNXAmZ/IBJf39RwFoAGW+shMu2/wwVKjZ94EnHKSwHv
 qW3OZRHDmmckXQguhzu/2Ga0GSN/pZbPwqD/8aENoLQTCvHMkCZUWwr5Oo2+NFibhDbktrdvtZJ
 B3tGEwEffeXeYNqndlMEKYYAKNr6g2jzz3uN5bnvaYhimm8InrHEEvvtO9Cnhew4vm9l9ss0MSU
 OlprOP6QwAwBlBncIRatJGzmYLVX/49R9ezIC+XM0TkME8+o9e/wsEAkgvHgGH0rOFxibCnTypo
 Z1K00eE/ASrShR85HSg==
X-Proofpoint-ORIG-GUID: 1zKGLZNjJLrZ2q8vesCER2kYEbO-y-57
X-Proofpoint-GUID: 1zKGLZNjJLrZ2q8vesCER2kYEbO-y-57
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXz30rMGm9qPxz
 3iCakvkWc2E+laetvfNA2QNtcahQn18y+qkrBoDnyxlKZAqDvypD63ticCg2ZGkIIaCf67I61XJ
 8mllYybmBAoqUrItadI3AMKVLkALWxY=
X-Authority-Analysis: v=2.4 cv=S+dMU4sP c=1 sm=1 tr=0 ts=6b031501 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=kSI3p4Jxhxt2vPjtXf4A:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The codec now has a VI sense capture DAI next to the playback DAI, so
boards which wire up speaker protection need to address them separately.
Allow '#sound-dai-cells' to be 1 for those, keeping 0 valid for the
boards which only use playback.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
index 866c5e780fb0..42ae6d60a874 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
@@ -41,7 +41,10 @@ properties:
     maxItems: 6
 
   '#sound-dai-cells':
-    const: 0
+    enum: [0, 1]
+    description:
+      Must be 1 on boards which use the VI sense capture DAI, so that the
+      playback and capture DAIs can be addressed separately.
 
   vdd-1p8-supply: true
   vdd-io-supply: true
-- 
2.53.0

