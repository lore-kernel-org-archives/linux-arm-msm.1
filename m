Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B84142E004
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 19:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093676; cv=none; b=nWAuG1qk7Is2IAeXzvPO9He/KWBXe0zOC8JCQ8eDr6ZSNvOasCGVS+15CpNhm3Jqn1WJmhNmsPkXyyMCH4sCqjaDV7Y1aUvLLoSUB+RORCNO2jYTWZ40jM1Jmjsv4WktGGaYprLI+KxcIbgfNhEbM0lS7v/zZ6ljEtb2dD8irlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093676; c=relaxed/simple;
	bh=a2eCj0h2ijL6N+sNo19p+jwZRN2ssbDrAbTTPwAG0o0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wjldsmwqtcv/nAw6uSaHNLAafaWgR9/iz+MfenonAUTYhATb/lNjyw5wG3NdaX+EdkMl0wB4iIzs7O4G6mfMFFO+iu/K7tYfa+DirYB1If14EVdCH9XDMgoOnVd04HG534qaS47feaPTvobmaAIViuMJDuyAJXJfNVZ4J4HKVbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xe84cgqm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Su5RFUgF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xe84cgqm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Su5RFUgF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FDYO9Z3462799
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 19:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TGe9ukRyogLXaSFIz9AterLL9ZxnrCl5Pp0
	plLYdHlE=; b=Xe84cgqmIjAfum+WB4q1jdGsKoBgc+8VwLX1fmsmmRH+4cLyzDz
	MbP3VJkihytT32yXZJAz2RSJxAlgClVHh6Q2j5vQWDtUPdSf+BwUnROTtn5fU+uh
	i2jtshv7+b24VXMm/rngyt1ZXoF8wVrXN3BkuTrHGAntBrE1hcOcGV7rcukQiVCh
	LE6FzwUdp6ZkrmjkUbjsKK2NfYy1Kae+V7JnLgEA/6Hif2vrLbJTj+zJJy0CqJWl
	vQJS/2N2ETAOwTVQLGpLughDUCsh9aLBTh8WHTXm5UIUCI4yHYO/tx7Ok966WlCX
	MbZAt+o+s8xqoZPJpp7TgBeP6PW0JGD67Og==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hayu69gm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 19:47:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc0b31ecaso401925085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792093673; x=1792698473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TGe9ukRyogLXaSFIz9AterLL9ZxnrCl5Pp0plLYdHlE=;
        b=Su5RFUgFChwoY8NV6KlLd9rvk7DNGYvj4ARqGvuvY4HalzMGSp3pcWVsZjcc3qR38m
         NbSJtyb5DjdfV4GmvqWh7FUBUY1bgjXyrUF26i+7pXTMXOZJar9ykVuRjYqjMnKSZ9C3
         yDItPrWt07N+CiiT2IKiNFEEqO5ns0q9VbTW6L2G3Bhal+SRt9eFM9V7RtF9WuCaK8Af
         H53u3DxZ4+cSI+dQsQKtORHrY8PeTAGT6dRs8s50qtpKvS5yu3q9hveJOFfv4f0svvUG
         sJGarjtceBQzyfs2g/YjvdBwqamGykF60NDBE9aevDbgdUqUPNSCLUuo0MUeqHNOqgzg
         oOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792093673; x=1792698473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TGe9ukRyogLXaSFIz9AterLL9ZxnrCl5Pp0plLYdHlE=;
        b=jU2Vd3lswJdrd9zm1ZHKz3/ro5VtSS8sh3Gb7Hf1RVCy6aDQeGbeY8YIhtw44g2BHj
         G1XOcm+AfSjxTtcajjjRH1/YW+cl7OO/6qffEGgGxYF5Jbwl45NxtCmr0TBdsaDAAT/u
         VatizjwrrUlO+mfpiosrUQvFM6imCOXy6tGdTY3m5hNDTbV2UDxJE5aU9sS7PFXNoEWC
         tWxiWOuCvNiTTrszE4FVXPNZmbX+GIIiL+ofN5DrZcU7sWLRh4FjhhvgicxVaYhEaE9H
         FVLdV7v7BMWGTHaoV/Y+udRmOt/EUmxXB08J08I0A4USnS8uo9BSA3greZy8mfceGcBY
         aqxg==
X-Forwarded-Encrypted: i=1; AKwUvByrnJP1Ny9r99cLfk+2UbTtK6WZ2kDIDNLfQoerN2Lk+l4Zr3JufrvYIQmAz43y7qHHK/QKnT892mcf+PUz@vger.kernel.org
X-Gm-Message-State: AFq9FYKXjuckU6vYvnVvoWp0ePxLkYYJtYRfegMvUoUPffcTZHLvpgok
	FBiIN4OOW8Zuf6l1kmnzyd9PsFHb+TJ5JOqDVPxmZdwlt4YoP/dE7PulVZFRDWHdDYiygNmc2lL
	RHd3qK0keC28eDKmoLpusobmGBOoJth9xK4zoCf2gu0Rj2ioQNOlhQ5UOrxydScEG2l7SvcYpdz
	ar
X-Gm-Gg: AYBFou3NLWEiWSWMi1N4A3HrUYH/lkxWbrTW4ICy0KlQqxRKl6l5pb92/ZrYCz2LwN9
	48nkx+C+zYW4P1kG/doB3acnqp4bfCRtNK/MWiHoCOY9F6/SeDUMA1Czj16Rklx8a8jVk/QsvQK
	7Jr0lkDYJNaA+QgObxvmbmXirlHfhmfQsvpBfviwsDTDnhPpLAB4omktTwjCF8lJa3pXWq4gaAv
	QHGA/RxME0zoJEeAGrzcSJavyLtcYdpqSEnN/oSadrjjAEVt9DccRMfvH+BhtsJBurXLCO7k236
	SIjRF2q/mWWZNxr8ld+Z5+i/Aa8zG0DJYZPB0/oOMdEgIKv87V6x/jYSt9xl9Zb55SsatAaWWNU
	3c+X70a8YHHxU
X-Received: by 2002:a05:620a:8012:b0:93a:1048:7d2f with SMTP id af79cd13be357-93ebd25a423mr3181565285a.41.1792093672612;
        Thu, 15 Oct 2026 12:47:52 -0700 (PDT)
X-Received: by 2002:a05:620a:8012:b0:93a:1048:7d2f with SMTP id af79cd13be357-93ebd25a423mr3181562985a.41.1792093672234;
        Thu, 15 Oct 2026 12:47:52 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c4fc4sm138027f8f.15.2026.10.15.12.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:47:51 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/4] Mahua T14s Gen 7 eDP backlight via PMK8850 LPG
Date: Thu, 15 Oct 2026 20:47:27 +0100
Message-ID: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: okX-7LGFuGO_GjLkkos3XS0s1E10nteH
X-Authority-Analysis: v=2.4 cv=ff04WEQF c=1 sm=1 tr=0 ts=6ad12de9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=6d4XDeVx90xq0oCfjTwA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: okX-7LGFuGO_GjLkkos3XS0s1E10nteH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA3OCBTYWx0ZWRfX6srAwzJfNasx
 fOs0NyUskniyYOOQo7VhpjIa2ALQPTRouuK+llZRP3cSC63JkHPmnITlQI1Sh8Qgf2suWj7RXxg
 X08uliNakXvrZt6W71ppiDBgjZYwATMin8WhSl9R+QWUbdn1d7bNbOOqRW2X0defffesojqXOAh
 szMmFWEEJjzhuvoP2EGm/1TZnIkglSsryB6XFwnOg46OswkqKkOdeDOUn67kLuRwV1WYw1A1x1Y
 xzZlbOVJJKYAuO5cYJ3zyxdmwb5bBvEbbLFt84d2P5rCQ/+7RqYQ3S5w38iBoOcFOcpOr7lkrlE
 9fEkBhx5Y1gk/9Yds4AnLIF1r+RkIY85ocieGNOh2SQg71kd6GYv/VYgd3qvf8X6RjNaobHAl0C
 kKukYVAAL3z5vMQeWjr9+Uf0Z8AAE6U3hCYak+j3Hv7vdJbeEynzlxinxLNQX8pNJI1THoVuisO
 +mEQPDgzTxNuheVR3RA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA3OCBTYWx0ZWRfX39uBP6zzppdb
 0DCbQzR9Paj/ySnyJTwJ6IxVhP9/vmc0aRTrAX2TrZ9JF8inGMeY9i1Li1cjPNss8vGw55enKL6
 aEpS23dERiyYCODH5kUjHjEw+R1NuB4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150078

Enable brightness control for the Lenovo ThinkPad T14s Gen 7 (Mahua,
X2 Elite) eDP panel.

 - Add qcom,pmk8850-pwm to the LPG binding and driver; PMK8850 reuses
   the PMK8550 two-channel 0xe800/0xe900 layout.
 - Describe the PWM node in pmk8850.dtsi, left disabled.
 - Switch the Mahua T14s LCD overlay to a pwm-backlight.

Based on next-20261012. Tested on Lenovo ThinkPad T14s Gen 7.

Srinivas Kandagatla (4):
  dt-bindings: leds: qcom-lpg: add qcom,pmk8850-pwm compatible
  leds: rgb: qcom-lpg: add qcom,pmk8850-pwm compatible
  arm64: dts: qcom: pmk8850: add PWM node
  arm64: dts: qcom: mahua-t14s: wire backlight through pmk8850 pwm

 .../bindings/leds/leds-qcom-lpg.yaml          |  2 ++
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 26 ++++++++++++++++----
 arch/arm64/boot/dts/qcom/pmk8850.dtsi         | 10 +++++++++
 drivers/leds/rgb/leds-qcom-lpg.c              |  1 +
 4 files changed, 35 insertions(+), 4 deletions(-)


base-commit: f53c44783aacd8920469531e7c45f9f70afd291b
-- 
2.53.0

