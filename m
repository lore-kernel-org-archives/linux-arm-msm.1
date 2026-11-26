Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718300;
	b=emKT9HBbwbG94Djmt3dAoEH60D74KwHGle9GhbcT444jV/NDHc5ys/kyUx7JfVL4wAV1
	 524LKq3STLGGntetiwAkEbCyotFULinJeZj8xgXBGNHKfkhlgXgeZbQzvfyZU//g6zl0B
	 Qs1qBpQdy3HOtWR/8RZWpclYl+KUFZnrRr+/GmbOo5TKNXXliAx83sVEc+hQmW+MDirV/
	 vb3jCt15SzP8BSQlAMUu2pUe8/z4JNq4pC1vth8OkYPpeEmYOKTViWdV7UiwICQTif00Z
	 43IVXZGblC4UIeOGr9n8pLKy6iYDG64zFvkPgHe4r4OupUtXUX+++zwn1n4SxfLoJ3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718300;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wKhRPqNkIG6fPCBwmHdWSXbw4/Nf0HqMxDnELoPBjMQ=;
	b=hTkZr/o9Cm+izFaqFyZZgd+rjPeM0WViEShPC4mTIePVGkhP0cGg//uSTX8Wwh4jbl0Y
	 9sQD9JZ+/JL4P5jNo9Il4jNNYNBZ5DsqQl1lgcwIyXGDS14HrxIKCiv4B1S+gsbmDOfWQ
	 T3+a8vcJw9jV6lXQAfgjWZDYpxdDw9oXgHwR2v/cKEw907Z8M2gjLG1aayHC4ItEnU5nS
	 xFnFzmsxsin1JJTD+SVopgvWCb1afxQyVV49+P2Pk8T391Z4eplHbaxJ2T3M9oRCvEzm1
	 USV9qCDcRM4v7Qhtnr/P4DVaeQOdP2GnEqdfs+XWwKqdcHAbp//WyoBbfopo/muWjnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fv4VTkli;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="g/ErBnnV";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55651606A691
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55651606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fv4VTkli;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g/ErBnnV
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQGc8tC596793
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wKhRPqNkIG6fPCBwmHdWSXbw4/Nf0HqMxDn
	ELoPBjMQ=; b=fv4VTklixmFUYwjniiesSq2bKFQDtBm6qGnPZ0kLTT9SMCbGYKY
	XxTAz9lMVwCh93OEhZkifCNe6nrpP4/ITinitYC49C/15WYLwFtoPcTkNAbP0/AJ
	O+Z6E+7CKj/hBWT7qhWaSllGcxJB3k0hK4sYoa07fpgZYvQTGqP9ukfXdEbUxKgO
	3A2teacFHPSlZ/aUchNYmxvghLpJPN6oEe1txM9ANxyWcJuVFfXU7/g4EUDglMEp
	p2djehEwW8ng6UrA06hplwc0JcLIlFFfzii8i/sKf9lTOhZPuEqLSrH1JaUOTsbQ
	CulWx8D1NoBuBNRi4yay4eyqpCIN2eSuJAQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf90c06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:38:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so1379325785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795718297; x=1796323097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wKhRPqNkIG6fPCBwmHdWSXbw4/Nf0HqMxDnELoPBjMQ=;
        b=g/ErBnnVTkcCyRkKxXMIf/GIiDEiCRB5R9p2DVwZOnKR0Nf1ZdmqkrcJIKFI9bpiaz
         ZW50O0Yw2uWDnPjWZ/ZGpN+zP/bg6HADOW7oXa+4oPC/R0f7uUDncV+VVlACVF2+E6Z/
         6fxAvg3pTGeLXM1kogGl5rLvHtJuGUjrwgjcLRxvaE2tGHhjuDl2FpSV56qsrmZx0grv
         j4O5WiuVmP7AdGCZXXPRDsXeMVnpo6e5ReaKbRUY/4eTGFu/W9Sm80ndA3+/1yEFAnC0
         rLqDldkcjzjUdTfUEYhNv3togS44N4/PEmBmsY6NNOb5FDP+1sh9nO3oQ64AIMfdfq8j
         k7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718297; x=1796323097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wKhRPqNkIG6fPCBwmHdWSXbw4/Nf0HqMxDnELoPBjMQ=;
        b=hVALni++xVIWw+jlH4Er2vFjX5QGQJwx/vRmCcbtJBi+ddx21ctuvB3262HoEO+FJ1
         g612tquyFp7NKjDPrg9/T4Dp9taqTmZATdDZv1KNbwfbNXZow5z2RQdxH8ry/SWbhjxG
         yzOgyBK9ob99CGgHzOFwVgbQjOz0kgQmJAe94bcUm4/IOgJMWQVudHli7V4Da30bbMYQ
         SYJXJOxLpEVQ0qBlLXMiicq59hgldMn7BQmOdSy/cXsaH/8gfVYFHklQ0lE/iO/+hzZd
         2x4jJL5sEWGaopR6Tm4nEy7JCG5dH2CHc6BaxDPK/LSAiV2TirPum7CQXfZ1JHWVedhF
         Bnrg==
X-Gm-Message-State: APuU4Z8Xk+MSZeq3Y+byBLyYicuJ/JFD7UARFG1W1eLrMS1I/DUYQOp4
	38Da8RLVV8utUbjjGFGQ/mt3e9QZ0LPQKoj265eF+5pnnmd2iPSYwlA0YZeQIFz8KVH+n+ODMh+
	zsXDUhxjKVy1dsRzDA1NmWE9bDhPboiGRNIxKhX/RA9B7Y2jn1wSBYWqG5ojY3hZWhp0t
X-Gm-Gg: AZFdTZeCZ8RDHQLZv2WWJiWUbOS+jW7S1X19NeH0w9DbsBnTxiBw3RMX8Hak7Je27fu
	+tYdE0HcQXKRr+0N476DIeIGpp6fPmGxzmdHlnQHxEeJ9hNwdJRsPdLLQPiW2A2gpHd5VtzQV1E
	lM6xoYdF9bEXXKdAtUrCQcdoBWbXb5pXyq0HN4Hj6xdds6Ltsnolm0JsEV9UaK6h6PNZ6zk1rKF
	cFALYxo9p5uZtX2+CiObFRD86lVMzPETYrmZh+k7fIQX+nUme/Ih4jzxRNjZ11/5fqIDS7In9q5
	CfmYteff5MtJiiQHnP1/hKnm1M2lzej/gbG7O31oggrLtbE0x6pkvZnoEpiioZaYisWdjlYUphx
	PRCLqyhYMneGR7FACvf/KtYhUYS/H8m38y3E3Xr50ELYugf3ANwabIbT1OgJlN/oz
X-Received: by 2002:a05:620a:4008:b0:947:832b:5527 with SMTP id af79cd13be357-949ba9a967emr3906147585a.42.1795718297362;
        Thu, 26 Nov 2026 10:38:17 -0800 (PST)
X-Received: by 2002:a05:620a:4008:b0:947:832b:5527 with SMTP id af79cd13be357-949ba9a967emr3906143185a.42.1795718296863;
        Thu, 26 Nov 2026 10:38:16 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm239659035e9.3.2026.11.26.10.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:38:16 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/7] arm64: qcom: enable WCD9378 headset and DisplayPort audio on Glymur boards
Date: Thu, 26 Nov 2026 18:37:59 +0000
Message-ID: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
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
X-Proofpoint-ORIG-GUID: YU3OTKvbgne_2YOiW81AGvwfzS_mhtyZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX8cwb6tZt5LQK
 8xl0YOtpZKTr0DZ/4iMsM3Ct36tbTe69tJoUjzI6aZyrWkYktTBnnm4hAAH2CnxLuY83L6R0Vu7
 ZjGuLwAGm0hTG51OUvkukESEt+VbZ5Dm1l8KzPI+LFmQ3T9M+V+FBHg+XezI9MfR6H60js39b0M
 F9S45zYrlfJW2L2Oxc6RjT1apxHYvZj7L+zNU5V7ttA8fxsve5VtHMO3wGCIpt42NbePpr84lco
 kyii5XT1Gy9xMr7w08MJNMwk0li1XWTzEy7gBgWUm06AdAUOpq13BJt3eTGRGus/8DQrS1jtZaH
 k5Svs6Hc0BdWgyJ4hwEpY7PuDF/zxm28TtOP2hbYjpGxJxYag+nSxsQi085oQTJsaM7UPHIgJvA
 X44fyjAE06brw9bxgV8RkjgeGtIwYa1AWSn2khYtNyGNb6goe9+zYx3Q89uNtz/rh381r3PTDE6
 gwL7+ebtiksakzAJ3hw==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b087c9a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=H8Vl9kw8bzbrLTmWWJQA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX6wePaH5w3+x8
 VPZ2kGc9zyHMRZ2pqY/HBckGRrpqNSrwFjGT2jFs3kJ2vU5UzCn8ALsvvDobRuE/ClaVEadgtWi
 kxLlZh+3042vKMup4g9WVOcfjYfqPQM=
X-Proofpoint-GUID: YU3OTKvbgne_2YOiW81AGvwfzS_mhtyZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260073

Wire up the WCD9378 (Tambora) SDCA headset codec and the DisplayPort
audio DAI links on three Glymur boards: the reference CRD, the
Lenovo ThinkPad T14s Gen 7 (Mahua) and the ASUS Zenbook A16.

On all three boards swr2 is the SDCA primary and swr1 is a DATA-only
multi-master dependent (lanes 2/3); playback and capture run through
the LPASS RX/TX macros.  The WCD9378 SoundWire port-shaping arrays
live on the SoC swr2 node in glymur.dtsi since every Glymur-based
laptop uses the same codec wiring.

Dependencies:
 - SoundWire multi-master support and the Glymur LPASS clock
   controllers are already in linux-next.
 - WCD9378 SDCA codec changes are posted separately and must be
   applied first:
   https://lore.kernel.org/all/20261125171831.1458954-1-srinivas.kandagatla@oss.qualcomm.com/

Layout:
 1/7 adds the Glymur SoC-level LPASS glue (RX/TX macros, LPASS
     AUDIOCC and LPASSCC, swr1/swr2 controllers with the WCD9378
     port-shaping arrays).
 2/7 enables WCD9378 headset on Glymur CRD.
 3/7 enables WCD9378 headset on Mahua T14s.
 4/7 adds DP0/DP1 audio DAI links on Glymur CRD.
 5/7 enables WCD9378 headset on ASUS Zenbook A16.
 6/7 adds DP0/DP1/DP2 audio DAI links on ASUS Zenbook A16.
 7/7 turns on the SDCA class driver and the WCD9378 codec in the
     arm64 defconfig.

Tested on CRD, T14s and A16.

Srinivas Kandagatla (7):
  arm64: dts: qcom: glymur: add LPASS macros and RX/TX SoundWire
  arm64: dts: qcom: glymur-crd: enable WCD9378 headset codec
  arm64: dts: qcom: mahua-t14s: enable WCD9378 headset codec
  arm64: dts: qcom: glymur-crd: add DisplayPort audio DAI links
  arm64: dts: qcom: glymur-asus-zenbook-a16: enable WCD9378 headset
    codec
  arm64: dts: qcom: glymur-asus-zenbook-a16: add DisplayPort audio DAI
    links
  arm64: defconfig: enable SDCA class driver and WCD9378 codec

 .../qcom/glymur-asus-zenbook-a16-ux3607oa.dts | 138 +++++++++++++++++-
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi      | 115 ++++++++++++++-
 arch/arm64/boot/dts/qcom/glymur.dtsi          | 100 +++++++++++++
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   |  83 ++++++++++-
 arch/arm64/configs/defconfig                  |   3 +
 5 files changed, 436 insertions(+), 3 deletions(-)

-- 
2.53.0

