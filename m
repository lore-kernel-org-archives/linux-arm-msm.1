Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794661103;
	b=PF3N3KCqdAoZ09pOE/d7ugSWPgHcB7nftItI61iUtylh53YmE8rTgIu3beV8tCOhVuvJ
	 EcyIXTNHY8BeSOYe5v5Xifdc8UThmt9nkV+8TgUCG7RwQvv3ji954wPy3+0392kJUmbSC
	 CqY+ZGdSCOpN22C5eRH1ez0xJlMEgPivqvSaX8bdaT53A8B6/pI/AT9eev0R1iM1TyWjN
	 BCF41ybOdgeSWLVoVyrqzi2IIOUHT4Xw1KPRBgKU0F1DU26AXcJNqs3gYcWFNi1NIes+R
	 D3ag2luJLax5TYmvQeBP930NRYo3Ev1QuMdPKfPcPZ0SsEJC0rN1CZQhXkEd9PrWxug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794661103;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=j/rZrx6MN30UMQmgv5sHNe382bHvIt1HflERn7+b+/s=;
	b=5ebYMIkeiTIP1UOBWX38/mPja+7Ov+YhtTm5vpPSb8cCB21BZNbWeZ9VqEObEzFJd5Rf
	 PFZ3P9sn7KxSe/StCzcH18tXuHDJM+jqjnle32FeWfWygsHX/B4AE6mz9itTaf+MYcFP5
	 3/T7NGaac+CyeBWZYY4pIR/iOGpZHX7Z4UqmvxutsIe8Sg88tAtV00ajwUkwU/9YvyM8H
	 gJiB5tfY1+Ctvahw5hOv5Zbd5WO2pS6Y5asvQ+OriY4bWP1J/kIMsq84LW5P8PaPOnO0N
	 VTQ6LN5xcmjPs6BWD27dDVDaN0e/Cims+u5B0g+g9Nk59UIqrnU583Uu1qLKCYOUWlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OAlW+kr8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DMUZ441j;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFF3606A32D
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 12:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BFF3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OAlW+kr8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DMUZ441j
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wNXV3650146
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 12:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=j/rZrx6MN30UMQmgv5sHNe
	382bHvIt1HflERn7+b+/s=; b=OAlW+kr8VUC4IFmdyOpDqfG5IUjEHtoo9X2UEu
	xx5io+27xX/pmtyVkLLDyjahu8FgRSPRT51D6eCJFAMVWShJsgkI4pcqDqnyg3ix
	lkNm7vch7G5n9/iArc3ERBhSkdvEM1n6uupryO9bqXGlYoYjcyqVkqsZY2PpbKvX
	ocV38DnS8ep1JBVnAOkWJAUnPeiI2fO4E+xE02+1zyOXiTwH1YNuP5OIvUewy7wT
	JceRYuqmmYfz5Ca2QRdKFHQxBrubsjX2xprsHHRMlmFqKwl/U96WVyRz6p/StSRV
	AU2keB2iZ8LX/d4ziApMHaOL4arLA22TG5z1ISorOlzGDDbg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjrtdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 12:58:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so431457185a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 04:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794661101; x=1795265901; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j/rZrx6MN30UMQmgv5sHNe382bHvIt1HflERn7+b+/s=;
        b=DMUZ441jEQmJJwJns4vrSU73fsJkWsLmSTVM6RMFmnLbOdX6nZJKSm656GGkcWK+mx
         +QvblMxxca5u2xg0IHW4QOf77istkc6SvgMocHhekD2dptFMEJNWWbE26/vMvO2UJvR3
         iAV8UxLYqJ6OadjprlGKykShaaMhlwzvKwoQF3kxdQcw7549vc10QQypGazSGqE4XZ3p
         H3v2mgQO0rZKwtqXOnVZuULQ7o9aWbRRdutXpysS12GpUDBqvrtxayEVr5ZS1IIJOSw0
         BljR7Taqq/Ns131lrh8K20XgY9l8T8/bUymtE5EfIpP2Wb0LIdLBlqgbIYqPFinBkYPX
         qEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794661101; x=1795265901;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=j/rZrx6MN30UMQmgv5sHNe382bHvIt1HflERn7+b+/s=;
        b=qWTokBrm5Ymcl7gHVe++qGwVlAB2B3DTvmmoOqKQpMFEevsgmV0zpEewL2J0sFnxkc
         bsgIe7mUEUTmIKclysDdbcY7QzQwt16m4pY17X1DSZGKhB0ZK3a5C/jNy3t3N6oVC4Ka
         pc6yl+0kK94hssOJhPWjt40xGvcShecvMv/ndu8CpXS70ZP7tD1rTo3oOEME1fqbvEO0
         zWi52xlEpv2HRJLyDg6lmvDOSHWDJ9kgWCzraJ9QQ3nMIqS/eii/olaNR57UA/NPNJYN
         vevqSiQQ7VOCxqlmkjACM9dDD/dbt6k1Mfd2AYkJHT1GzfvF52qhCgiHRV08HqvoR6XE
         DHLA==
X-Forwarded-Encrypted: i=1; AL+hErElCy5gOmuytQ/Wnp9TCX99AYx+0Ic8Mb9uIJCBBXKTW8MM6wZeTZLcxojWh27l7B5mv8yhuWrfIRBm8TCz@vger.kernel.org
X-Gm-Message-State: APuU4Z/DL+ja8/puEutdFNwvkBIMgd2D6uFGHgLLsgtaYOF8LC2vBEjD
	GiCI5OZ2PG3H3Lrnsek4EHthbg63A20ybqCLkBPXn6b7QRGy3GCeFKUpkXpO+u/ceqONIksZsbi
	IkXBHOGy16fkdQjywE25PmM3gHejaptFFb+fYRhrPQO9k77tVtZbFTdJOP9zeWUp/vUzWJzPpkt
	Qz
X-Gm-Gg: AYBFou3d/c81gK2SYX4ovvfxQ8AOBcQ/V4VgeFLlmRYk/VQc91Qwe+8Ya5YtYAg2v0k
	xziXSC8jsftP4HndWUbKV9rLSfUtfRhRHydZlozuYJi4eanuZFVg4sOHklNQLY786AlTYyZ0GyG
	IJPk3DmPllh0IU7JABP8kLjND5LsZlb1GtwbRPnJbWnXyVSMFzlOsIWujSQ1CEiHm3WHzjKuGEu
	pX8uJ1K5HGCZemCsiWk3WFKOg1nwY+kcZbWa4Pww/6EG8yLjpZYOu0E/tYIHArvwZfXqxFm7M8V
	Xfe7MiTglUGT5uc3B+EZc2aHM7TPtHctYKQUJbDR1HC83Ci8Rq9rHuHFk8OQLbpv72p027ojFAh
	M/ddhARF15K+YeQK2AGDuiboApbdNvXmWfA2hYB8qnI++NAhKNvvS6T5m8QeU6l2iDve71XmQcP
	gDk5uA28pzyrXV
X-Received: by 2002:a05:620a:6606:b0:93f:3cb0:4639 with SMTP id af79cd13be357-9494bcc695dmr812346685a.72.1794661101464;
        Sat, 14 Nov 2026 04:58:21 -0800 (PST)
X-Received: by 2002:a05:620a:6606:b0:93f:3cb0:4639 with SMTP id af79cd13be357-9494bcc695dmr812343485a.72.1794661100961;
        Sat, 14 Nov 2026 04:58:20 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c21b1b5asm2134684a12.4.2026.11.14.04.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:58:19 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 13:57:47 +0100
Subject: [PATCH] arm64: dts: qcom: arduino-imola: probe the sound frontends
 first
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
Message-Id: <20261114-imola-sound-link-order-v1-1-71d8bf1129b4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MywqDMBBG4VeRWTvgBC/YVykugvltB21SJlgK4
 rsbXH6Lcw7KMEWmR3WQ4adZUyyQuqL57eMLrKGYXON6EWlZP2nznNMeA28aV04WYCxdQNuPDgM
 WKvHXsOj/Hj+n87wAE1/+zGgAAAA=
X-Change-ID: 20261114-imola-sound-link-order-15de4692e7ef
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1MSBTYWx0ZWRfX6CyplRfb5szg
 sA9rt+NUcBC1W2070CAZReX1WJtdv+bhV1s2gjfwv/d1HmDMICwCn58po6yX/U7tQxy0bhthyjc
 FLkTjwMWgkeJ7ZF5nLMBn26SSGSW87HgTARixMGY+tCoTyqoTj81X7Dmq09bEz7mOglmCHQ69md
 Ra0nJ9cI3ZvydjNfZ4AIRecMxYRM9S1fMacs6w3v9IFOHUj1psRO7YXsKEcw3+DJ8IJRqpZ7bez
 c3RzaS9qw1picn1AcLpykYcmESmgp5C7fcS7KDmTDEx200DKvnVW+nRS9gw7zw7PYapVZiIIDWx
 5BjuKeK8HxA3ieutfUtETYauve56bt9MBhuyx/7APaOfqDGkW6OOXOFlp/gnWYLE4rES4zhHnPK
 011XZLm1ELcgz5wv8xc5Lt8UWWu2YqDtphN0S+6dmKtQ2JbQG1z1JZ23Qs0l08lvsChCxjRgsrn
 hD+aVFoik/O5D92v9Tg==
X-Proofpoint-ORIG-GUID: OXhK-A5fjyM8ZhLOOenZxRgMnV-wzQ-p
X-Proofpoint-GUID: OXhK-A5fjyM8ZhLOOenZxRgMnV-wzQ-p
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1MSBTYWx0ZWRfX2J5PAZhrR9tb
 +Qo9AlIJEB3/VN5SKL+Ett4HMh1Z+NMdCLSbjb5KnzzikLtlf4lzPvVZTMtsGJO6OqgqENYOlb8
 YeE6RQ+f1z4vTUgaYmra50Y+uqCAXGk=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6af85aee cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=QaMh6c9EJkddkog0sY0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140051

The card probes its components in DAI link order. With the codec DMA
backends listed first, q6routing is probed before q6asm-dai, so its
routes from the MM_DL and MM_UL widgets (created by q6asm-dai) cannot
be added, the component probe fails and the card is not registered:

  q6routing ...: ASoC: Failed to add route MM_DL1(*) -> [MultiMedia1] -> HDMI Mixer
  ...
  snd-sm8250 sound: ASoC: failed to instantiate card -19

List the MultiMedia frontend links first, as the other qcom sound card
device trees (RB5, RB2) do.

Tested on the Arduino UNO Q: the card registers and a tone plays on
the headphone path (all 11 DAPM widgets powered).

Fixes: 61a95870e0f3 ("arm64: dts: qcom: arduino-imola: add support for sound")
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
The UNO Q sound card from 61a95870e0f3 does not register as merged in
arm64-for-7.5 (snd-sm8250 "failed to instantiate card -19"); with the
MultiMedia links first it does.

The DTB differs from the current one only in the order of the dai-link
nodes (and the phandle numbering that follows from it); dtbs_check is
clean before and after.
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 47 +++++++++++-----------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index e99d2a56dc28..3efd80f36c6c 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -117,6 +117,30 @@ sound {
 				"IN2_HPHR", "HPHR_OUT",
 				"AMIC2", "MIC BIAS2";
 
+		mm1-dai-link {
+			link-name = "MultiMedia1";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+			};
+		};
+
+		mm2-dai-link {
+			link-name = "MultiMedia2";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+			};
+		};
+
+		mm3-dai-link {
+			link-name = "MultiMedia3";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
+			};
+		};
+
 		ear-playback-dai-link {
 			link-name = "Ear Out Playback";
 
@@ -181,29 +205,6 @@ platform {
 			};
 		};
 
-		mm1-dai-link {
-			link-name = "MultiMedia1";
-
-			cpu {
-				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
-			};
-		};
-
-		mm2-dai-link {
-			link-name = "MultiMedia2";
-
-			cpu {
-				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
-			};
-		};
-
-		mm3-dai-link {
-			link-name = "MultiMedia3";
-
-			cpu {
-				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
-			};
-		};
 	};
 
 	vreg_anx_30: regulator-anx-30 {

---
base-commit: eac8f0411262ea7d156407da4baf260291cbfe32
change-id: 20261114-imola-sound-link-order-15de4692e7ef

Best regards,
-- 
Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

