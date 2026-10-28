Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793223971;
	b=qAYFDpfDU/0PPd1Kmn33S8UFf7BFNKTlzxRDrQb3GimcsQpUCh+OnLfGuhRt5D5Wz4TI
	 b9uWA1ohOX5fTYgkymfi6dnxH/JyWLOerYLJlv8v3aUbVoUY1RjKigC6kGjEzCZiyNPY2
	 mbFxp1bI7ItixpZZ9xGd5wI6qADA6Npxts7eHiNjGVwmJUeQiKFrogcSs9V5U3BAmXvaz
	 o5izYpyftdYox5aagBT/+bQIjiD6OW2bu8osEKzyrqL5dVaIGXQLl1pTC7V7TnitPvtfo
	 OxktLMp98J0z5g80apma1THtYGJRpUspGBCP4jN3adCqEQ+d92jROvx6IWnQ2LORISw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793223971;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yatBU14VGzZ1rXDUAbqIfl87LI0npKeI7qDgpdHPAIE=;
	b=y0ayfJySyefWMQWs5dQHP7hWb0EkrJPXi5/j63OvXS8gP7bQS0aHN5n7hkQw0jwcFYQt
	 UcHvqNrRRbojWbtMHzkiuu3r5l+Sq1ZnCCvU2T+I1yibwu9XUP19R8eyRG2SJerm2Fv2P
	 poxDB0hhRUDjWXhtkYqz9q6vVXj03B1v4eKF0vDLLYlakm4L6Dn9QQyuswozd7vPt5IWK
	 qra8fG8z9dk8hxqEsmK5RaWqbCSsSsW//ZYQkTVLIbt1toI8eaE53aEV3O5pJlmheXawx
	 uRt63fLoN/oJoCGAjxWABOXpNEdI8rh2Rv+AHDz354vJvKTqtQ74c4EXWKUebQkngzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qr+CGQi5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NOqqfziA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B0C606A324
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 21:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1B0C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qr+CGQi5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NOqqfziA
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIkJxS2546880
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 21:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yatBU14VGzZ1rXDUAbqIfl87LI0npKeI7qD
	gpdHPAIE=; b=Qr+CGQi5rIYEDNqxvY0FDiFyL9jPmq29Pwmoeccb6c57Yuq+Fjf
	iRlQWk9kFq3xhCSMa6EVEOZ7ACmFabOma1s+E8RH9qM1YzhtGufS8F7/E83jX887
	Rg6IihX16MLyeLQB2Zsx3ntk9/0MjKyIbHT1eHReFlCkE9soJyB2Ouv7L2UmysV+
	QOxANO8ZCeusvd+QDjec/miL6f0co8CkzD87hVufsP6v387leB/i4RUgLfr4SC1A
	ahrM8Af2LkLrrtVcm2gx/8RUg3mbJHbgRwSnJH75CkkMN1/WHW5jGjIoX8nsfGeX
	V5e0e4QNqZJa6HqHhCd+L7SQgLJU0nlwirw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc0kxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 21:46:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-536720195ebso30488281cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793223969; x=1793828769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yatBU14VGzZ1rXDUAbqIfl87LI0npKeI7qDgpdHPAIE=;
        b=NOqqfziAKxWFFwOTCevh+kVlSLCnnoMBiZ/FIMDUcQ+Q24FpjcvV1Zne9Qr2VvDa8L
         jDpUZ8nTzRfTOMDHg+UyrC52fg4uuGS6vFKQNg5J8H2HHol4mYvV7lVJv0jd/RpDLKLN
         A69JXgQrtqnwRE1IhSR0Cb0W2DqlEzeoZoK4ayCWmPK/A0rq4Cj0xM0dynt7V4LiegXA
         CxpXMj7qSFXL/4t5wcUlVu+xc9dqGvgieQ8c0AVwnEkcvOyo57WksGKpEYboBM7xuHMr
         /GeytDHa87mjHE7wyFp21vGDBeMYMd4a5z4+89UkqOA0ZuySFyAgSFdz612ifufq7ViB
         t+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793223969; x=1793828769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yatBU14VGzZ1rXDUAbqIfl87LI0npKeI7qDgpdHPAIE=;
        b=VIuixn2jR2JCk1U5RKTh1BGOba/b1h6zwx9zW1OS+BRmg9PiOASLh65riN8PTXf6Eo
         o5IqzBPqoQ3uNh25jQ4c2ho+9gAhkBJKacK3v5NpN5yLoaLucLKUdabaaMYLBZzl4Eqo
         p2VnUZbJYWC3ChU1ZsIPrLKKw5YZHXJi7oF7Zbn+oCsLiN/Di2uG+NuKWZ+DKbCkf2af
         9xxlQLeSDzNoYY+iqcEqYzer+0bGS8QifVMQoqySsRxlyOvVPh0ZVALcwezMqV89CtDb
         XRD3s/EU+lvTrT/tIXy0vIVeKYXMQ7ehXabF15TusJ36x4vliBoZ0Wne2nuS+/qHglc3
         /+UQ==
X-Forwarded-Encrypted: i=1; AKwUvByjQyo4e1RHFqFEMJGpEJymp8qZEkVEweFbnrol1/1Aq25E2/BVNqvaCdZ7zCqbqvKFUhxDtF0cJ0zKB/5w@vger.kernel.org
X-Gm-Message-State: AFq9FYIaiYFKOedRz9e1qAgtmS6HNjWbykcWrVNNoIm1fjCvnfSXN25D
	dHOaYcdvySnIFwFblTk2fe2QLk9a2pWCLSKRbRhQ9MZbdBJGdDPAAy0uEQBaKPsjsnS+dLyxBZX
	DjZPC6qPmtqicR8fjDlKRwNb4Wkj9dB7f8o/+87TYdij7xtoqFJ5vV//rNE2GL2Jkp86E
X-Gm-Gg: AYBFou2w7E8natFkdp5vYTLuifsBEBhx8KVNmPo4HEE2SmYoxu7mcACGL+8ZsiXgrfK
	W9PC7y+vfZZq2BArCpEykvCtbUQnAG3DlQ/CwY73TV0tkPUuGM4KWUZx3ukf2kiAqCMpuiNzV22
	Lsm/9VCMchdniX2rJb1N9FsxGr/HC7lTrtyKeE8sSB4/Hp322skBSiVjVrlAihK+jk3woMEoI61
	uVLwT5bbd9doYhoGc/KCloA/Jep2fTuOKh4Xrsz5gzGKUGpnfEAzi0HjIOIs5cbpiUFIJevb5s5
	2XWiEWC2Ovj0lwGH7EjzsuOMG3Iy36fIhHYL7RJzEbt8ni7vbB2Gg+TQ+Co07OfE/gJ3dF8p1/o
	CSKi4X1kjbj2X5LJI/6TwAp4Q3Pjkk1xInbg5LaZjffhZLe0STpaDQV/NNaSLdg==
X-Received: by 2002:a05:620a:469f:b0:93c:7a5c:77d8 with SMTP id af79cd13be357-94408930328mr566038285a.4.1793223968802;
        Wed, 28 Oct 2026 14:46:08 -0700 (PDT)
X-Received: by 2002:a05:620a:469f:b0:93c:7a5c:77d8 with SMTP id af79cd13be357-94408930328mr566034185a.4.1793223968293;
        Wed, 28 Oct 2026 14:46:08 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fead817sm18642395e9.12.2026.10.28.14.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:46:07 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: monaco-arduino-monza: Prepare JHAT 40-pin connector for HAT overlays
Date: Wed, 28 Oct 2026 21:45:49 +0000
Message-ID: <20261028214551.108424-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae26d21 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=3ufCqafKAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-RhnwN_n8znzIZ15-MQA:9
 a=kacYvNCVWA4VmyqE58fU:22 a=aIhU7PV4tMzn2raNFj2v:22
X-Proofpoint-GUID: ytVkBKjZdLiiDDUpyg5_xjYql5yklOui
X-Proofpoint-ORIG-GUID: ytVkBKjZdLiiDDUpyg5_xjYql5yklOui
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4NiBTYWx0ZWRfXxILgBL38brMV
 SjWJEjtfyYaEmYVyaqPaxbevWxS/FyxzHuwNINmfa0sWgusEsbAekKXyqkr/u2EcvdR9sh+E8hL
 fZ4Mh0OGtf4C6bBg5/V5w+VYgc2q2UBQsG3PjGoG7US6wFDM8XKmbkkHFHp/XV3eRWYU45IY0Zn
 6v2NCeyFmTHx0EkV91QcKTQLVj+PELk05ZS6h8tTQ9jffghx7jDc4X2Ku3m06Xpth5UX/st9odL
 Az1IIAAEkEZJqw799wQ5GYQ2MblMFpiS/r61ac5z7/D1kPQWD4xPVGKzMuQ7HSMGTfd2Cer6Ysw
 c1bC8NiigUZhJnkNXoJZRNoXzM+9sVnhuQOLzjQ3u4iUJpn7L30/fvqPKFeK7DdI7girIF+UmtP
 HO/5Gno5eBxbYzd1Eq7ZjmeeIj29u5+vlmTnpyKf3LSeA0WQ/8MS8A6R6JNkcprTc9zusKjiLui
 lwylZpCPn2FtcqH8v9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4NiBTYWx0ZWRfX3DeeA1n8Hrm5
 hAuUqjbVcg2D9AOTQdTDsa6R8dxJhSLCk5/3niCBen1BifjU62Lja2XicNyRGlabUvONtYFjmUV
 pCl7dU3J14kvFotN/KttaeVKq4lHHDg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280086

The Arduino VENTUNO Q board exposes a 40-pin JHAT connector that is
pin-compatible with the Raspberry Pi HAT specification. These two
patches lay the DT groundwork so that HAT accessories can be wired
up via overlays:

 - enable I2C0 and SPI3 on the JHAT connector and add the i2c0/spi0
   aliases, covering accessories such as the Pimoroni Automation HAT
   [1] which uses I2C for its on-board ADS1015 ADC and SN3218 LED
   driver;
 - add a label to the sound node so audio HAT overlays can extend it.

[1] https://shop.pimoroni.com/products/automation-hat?variant=30712316554

Changes in v2:
 - dropped patch 3 (Waveshare WM8960 Audio HAT overlay); needs more
   work
 - picked up Reviewed-by tags from Loic Poulain, Dmitry Baryshkov and
   Konrad Dybcio on patch 1
 - picked up Reviewed-by tag from Dmitry Baryshkov on patch 2
 - rebased on b-next-20261028
 - link to v1:
   https://lore.kernel.org/all/20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com/

Srinivas Kandagatla (2):
  arm64: dts: qcom: monaco-arduino-monza: Enable I2C0 and SPI3 for
    40-pin JHAT connector
  arm64: dts: qcom: monaco-arduino-monza: Add label to sound node

 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)


base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
-- 
2.53.0

