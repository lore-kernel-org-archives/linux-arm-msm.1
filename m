Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636362;
	b=CLa7yi0Iw0LhnTGjQDE49q+UtdPkS7sOLC64u7my91eSIqXVd3aAZ1i3a9xn68rU2KSx
	 kq8AWWCqiquYos2ARWXxs+yI50rkMrn/HzzpMuwo0Bw5wg4qpDBzJoNwMHLGRnMi4r4n/
	 0jUthrmhC/DVoeAhfcBID5g+oEsSoub1197fhh8bwI2VZEZT4QL/Feilrw8arME2f/VdV
	 Qq2q5xP5XecQ6eWwHNaRTus0tMYFOAppyKIO/1QLdPQeqvi1/BG6RIIu14jDBsdlM0zGj
	 Dxobypl7y9eC+0xNDDaffIo5bnlFHAJO4YeCvbk0WCD+fGZ2R0TWX6LO35NamCHHqsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s5Ba6vNo1bDvLyrL+TUYTgaQ78+DeLtUHqSUd5UyCEE=;
	b=cK3aDplOJEkjjfhVv0miFoAwHH4Gg5uIbN/hIacFmWt3u5YOsPOZ3diTsyhJo8PizZsD
	 j7Utx8Z1/AHzPJtCUWj3ZpMng4eHvKEAQqi1Aad2K7gK4RR6tgG+DKfkPYvk+PJAc9sjN
	 pJHd5oX/2RykK9v8abILTVhNKIJ2d1viPeh5jmjJo/rQM4KvwD5nu8zTwyNFdyfsDMGNA
	 HVPhf5fuZDS6kNoM8xlSXpV7MauMPOFiqqwtbeDPV2cTdY0yCCdeC3lEYwXip6LQXD3uU
	 A9juoQhsKYG2/WKk7hSTMaUFQVqC1BMBNdQH+moIhFyg/TlbCnb+yTgXSZ1HL0bmyzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GMgKYdXW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FDZ9GH6k;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F16606A32D
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 19:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92F16606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GMgKYdXW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FDZ9GH6k
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJgts23661516
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 19:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s5Ba6vNo1bD
	vLyrL+TUYTgaQ78+DeLtUHqSUd5UyCEE=; b=GMgKYdXWZ0gm+Ob3m02qRVB5PEC
	4KolNbAyyw/cqFfqySAd59iHE29pI4+EZaCQ68iR333XQGljNnQX6fGglPumAWXg
	hkyjeFTKwNNw5KgPZAXpJIKo+AWahgqVtXrJvZ4rQEvQStZag0Q9JTzCNY+Gotfi
	ttaN6cf1TEDBx7lFoS0KFzSapkFr3yD5Zfmeg1G3bIvVrTBNufy3HMXqXvK1OGhP
	4LVwRfuXy2fGg/3V3LfGmwoarjdKnVGiKbU9ObaOy++RuzCoQgH4YVBWFCnTLPID
	ezWEBjcqJi2NUHXFlaupGGtlFErTBPFroEaF2iOYIkJloiLGIIQ93zUAjfA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y011y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 19:52:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f37c94ceeso1167293785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795636360; x=1796241160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s5Ba6vNo1bDvLyrL+TUYTgaQ78+DeLtUHqSUd5UyCEE=;
        b=FDZ9GH6kamTMbugi6haXsezU3CeblbCvu4LGkN5ZoMlqf8SV+hB0jCQR0hvz3cUhUK
         vr8py4EkxqiY5R7b/aCBOt6+9R+Y/uOWgpp8L2qgU+Op4miMNrl6pd7So4xKwaNmnDT1
         U1/5Yx/gzfjeLFDfPESpMErqdp/s5j2dk6RN0epaXw+Nb6MlseBQg7E/+S/fg49CiKm5
         dWRphyNpD48KbYvQQ1FPrqgmL7Nq+Jw6rHDnpRInae1y5kUHq1nGIP7W+ZXaF5Ftrpcb
         wcWbyQWPr5aGNPtFZWKjNXX/wyfCj3kEIFtqjgGIcn5nSzGG7O8VbUxn0B3OiwQ4R1Ew
         Jt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636360; x=1796241160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s5Ba6vNo1bDvLyrL+TUYTgaQ78+DeLtUHqSUd5UyCEE=;
        b=qEjgFR3ggVim4e5B7bhDAKOjVYuj3/S8yoXRzcCe6OMl9RW1aNhLeDmVyf/GTQlpux
         zMQ8OzRVLwIG38bamWHSH4qe9AyS9yjDzj8eXgfCPA5BDfxKraoMxpPUXfrs6QQlb4MH
         sY2R4gU6GyqGuUh223Dy5DLcwbUJ9rMia4qMAluHJ7X+pCZoih7GFxGI7PFuOrLxGbeK
         KPj8mInO3c1YoB58VWP6/kVzOb/OLZMpjWSbW9B24XHu2R4032kbKesNvZ1XhKdjT+bI
         Vu8B/awqBZ/ZmsWXgW5uLb99dobrIMRhC1miQi+14JfLtG5hdEasOu7VMkEH70vWimP3
         KU4A==
X-Forwarded-Encrypted: i=1; AL+hErEbzBYcc7f5EO57HEiGBQthlCBe1shNlf1SAr9QbVuGw3yRkCTiDP/vkVaiyEGkouUiMXm/waihY2VaHnDP@vger.kernel.org
X-Gm-Message-State: APuU4Z8qzGAyXpDy2fOQ/wXuwacu15bLrGbO7gevsptYpY7WfmvNJ0fF
	WwivhxaSAOZTjQ+2QDA+/hLcSIpIjPCFeADc3KmzslD0vRBya2BYSLeAHSXhRMAqDQtAoprSeVW
	Moks92aGPF6QfLpXRZ/4AsdyFdtBqua+gAKno9OA/ejOsgw28kCusTIM15Dj8iNRKt0MM
X-Gm-Gg: AZFdTZctAzSi2dwJT8XHVjnTTc4iiN9HEettgpLFfDctI+iY9rpRtz7bsjKFF4/WFPB
	5PbCGZsxVK4AylQrSIujx6b0z7Fv30zq3Bd8SjKlFNxZNMXKJs4n+JAu8VrfDUUC2scub8OUE/D
	kCEnZNH/cZ+lLyoYoAvPbLF+hvRqqQALmMKol7sKwnUCSaZ+4WivrdTTQVe/7cGl+v3fi0Zer96
	4vQDgqJswQC0EgdbyHyAeQzbogtkgX7eIcCRIhmKDMuxbNCHJ/qlSQQ9PDJHpzK1zRLpWHnONwY
	qk0TdPkBWbKgm/ZAiEbFi9w9Bn13EioYp9Y3EvJAs7DwcV1DTnWNJ915J+XSnwZWUlvLk39NKTs
	nS5bgCfi2A9Tjicx4l+yfyPjOib9iQPCGWuj/goXD2amMPGOSeA2uA4+w91JWXFpO
X-Received: by 2002:a05:620a:199a:b0:949:aceb:b77f with SMTP id af79cd13be357-949b36034edmr3386852685a.30.1795636359866;
        Wed, 25 Nov 2026 11:52:39 -0800 (PST)
X-Received: by 2002:a05:620a:199a:b0:949:aceb:b77f with SMTP id af79cd13be357-949b36034edmr3386849885a.30.1795636359464;
        Wed, 25 Nov 2026 11:52:39 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm774316205e9.11.2026.11.25.11.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:52:38 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>,
        Luke Macken <luke@phorex.org>, Srinivas Kandagatla <srini@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: leds: qcom-lpg: add qcom,pmk8850-pwm compatible
Date: Wed, 25 Nov 2026 19:52:24 +0000
Message-ID: <20261125195226.1563577-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125195226.1563577-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125195226.1563577-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfX40iOTqgBm382
 1azQxTaEVy2z6cnabzDGm2t7pt0njDWBb2qb2nQjh44CopPuzZkSNR83zz+Xdw4bAxy8P1lHWC+
 E/Sa/OoWMUrj3bQq/X3BF8xjTqZqABhC601EMgy37h9LhIlAqD6yXYtPkYWGsx9fyg/+y3iFhFZ
 rHUOUKXeP073ggObHOj/YW3/607ls99ihuMUNjUDpcwuJJWWHmnzGmDrz8Ga7TVplHLAgZL8+HL
 quZYeZZ+9Q7mXMJ0M/Eb4JvNCpIOabW4UjnFUk1ako16qrao/Ad6ueozTiOSz/Nq1WIIr+1RycM
 Lyd5X9IFfZGwMXeCUppbiFNHLk5ei3DsTBgk5B0C/GpWkuh5UrvrIiqygEgZaDrKcFwDPbm6VDa
 +plHbYbiiZV8WPLZpedb4uXh83/GoApcmntYXtpqC6/Mbe97y6+S/3wetRvPcbbgwRM1bfTRkU0
 FlXE8wpuOGslEMsuh0w==
X-Proofpoint-GUID: g78Eb1qtnEpPv1ITmtB_G1cD5ntWN1Hz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfX2IuEuxg2Ex8L
 FAnoZrgqwAEzWh2RQnho3j//0ljfhvhwbkUk3/kHTomwqyTizpZ9DccwoPqphFO5PxXpExYfJvy
 8NmzEe8EcvY6nSXbo+/j7h8j4Zw9ySw=
X-Proofpoint-ORIG-GUID: g78Eb1qtnEpPv1ITmtB_G1cD5ntWN1Hz
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b073c88 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=vMC6Bm_45Gru1Dc4I5QA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250079

The PMK8850 sleep-clock PMIC on Snapdragon X2 Elite (Mahua) exposes
the same two-channel LPG/PWM block as PMK8550 and reuses the same
programming model, so list it with qcom,pmk8550-pwm as a fallback
compatible.

Used on the Lenovo ThinkPad T14s Gen 7 to drive the eDP backlight
(EDP_BL/PWMR_BV_PS).

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
index 3da0fe532e74..e018f1f3532a 100644
--- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
@@ -49,6 +49,10 @@ properties:
           - enum:
               - qcom,pm8937-pwm
           - const: qcom,pm8916-pwm
+      - items:
+          - enum:
+              - qcom,pmk8850-pwm
+          - const: qcom,pmk8550-pwm
 
   "#pwm-cells":
     const: 2
-- 
2.53.0

