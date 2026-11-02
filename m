Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634818;
	b=Ozg3gZqjqXOUOvrgLRnNilK7tm/hNnYwnMB98bmMyxGXLWq7XJ6KnshKl2jjaSAegOK2
	 xBl3A2WvruxFydAn1UdMrcyg1Usb8nYJ8Lsx0WJwvU4R8671zMqRux8TANaueiiYjnEwc
	 aZlG1CNFgE2FHIPktjaYsdZf5zPbrLaGJyc8WEMZ0i6ZVaQ92e+4rNMDniez10pEe2ACJ
	 sT13R3fbWwhVfnZm5CmAJZuf+laoPvJw88ybtXv8W2Ib7tgddqAZvh5JuN0mMYZGtzlwg
	 BcfVMX12qzFgv3j5VIMAILFWMuuarwF/s2aCqmPjRryV+qNYs4Xqhy9uocAi86NcjJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634818;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=I3J9gkmF9yi5CuoHAy2TreOE2N6iP5mtEvlt0QvWhSc=;
	b=Z6C36wg99w+qhTDh5G/KVenU1GI6fKFepbvO3ry7d40WWm9Z3BKcIUT694v47NdZUSRo
	 7d3FTGbubyRzRBri5Kl15FWK1UlmHGZnIi5Octz+wFZAug03nSEeK6ywEfXs9d4+7T5Yo
	 CbNBm+4FBel+zIE8Acjn5lTBvWOY7S0nl+N/hNVklIPm+9epcYfM3JbzvDc7xcCvrvDzu
	 A5RIQY7T5rm4eccZTSt7LNZZ4XKItuK4pkOlJXj79+PX2gFFUUDVyoySOR+J+Lo+hbeKh
	 xdyZgv4rqwIVLKHzmjM9eUfQ/OXO6O/lAwAKW8JfAPrptrEv5l1p6wKBS2DMUdGc5fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XqNFgVM4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NFve2r0J;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478C460B4D10
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 15:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 478C460B4D10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XqNFgVM4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NFve2r0J
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpMEE4070512
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 15:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I3J9gkmF9yi5CuoHAy2TreOE2N6iP5mtEvlt0QvWhSc=; b=XqNFgVM4u1/+7jEl
	dfjFJcnji1V5QNjBIpmSXmn0vPhkJV9TvA1kpSQvHMKPKetwC7dL3ojF8efMTG/o
	5Buj2qRIAnQPWkGGoI5vSww6/cISNBqsHC6RdPgBFikN/hchzMiQI5BBpfnG7/dd
	CToucGyxYUZW98YnNEAq0pBCs2+UkufhExCzOXc5/F+kSv39uYP7LqL7DlPHKMDa
	z+1rXyYatSYuoO1Sd5b0BKTndbf++kZXT8AIBVxo9vVmtjmCe759yVBNRHcwqXeF
	vHugSsMwmms246jE5+LFI/2FDaVy2nDDILKK1H4HCGuoF8dMy9V9MHM5Jb6oXPfj
	ydQvXg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpss5h3g0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 15:53:36 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc06b9ca9eso579296137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634815; x=1794239615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I3J9gkmF9yi5CuoHAy2TreOE2N6iP5mtEvlt0QvWhSc=;
        b=NFve2r0JCSektwUeNYNT1FH1XRNh1FtoA1EfEF0/TRN+yONbo2v5zGxA+IMUNRXQEa
         SEq8EiI041FPYOJh31rEFslpdUsqjlaBi3FqNZ8EitN5Sd+pkuQJyrAWRDNynlbWcA1O
         yyFaa832cXn6qyCd36zH6eaFp7jEoSAUo95fIm/xiVJ7HaFGrTB5N8nSjZ9LyoRNS0Gu
         cQzFJVuelhcDN8MZ6RiAB8meOZavdl1twvMjrvX0geq3PVefmnY/3Cwo5Pui7Fw+kOty
         trT1zGin9j5u+nG3jzAlRQZZFcmI/YhgVt6qA87dsUQCtOBcry6CO/MeXFFR91QU4Iv0
         gUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634815; x=1794239615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I3J9gkmF9yi5CuoHAy2TreOE2N6iP5mtEvlt0QvWhSc=;
        b=Q/WAnFBx8DkadBle4CN1+3aCl9No7X4/+g2w+0uRB8ymAHPvhULjlZPsUp2BmDAb4O
         IKkGN46jZoT8ud9uRuNqlk1ni72q4Z9BGkdSDWC4IzPWhLKF0L9id53VK7bjUpbgux0l
         y0nuOaBME4mZQMFSRgzSzaiflCIYHrvF7heXyNCi8JrFahT1U/cijxJP28emTRywkYnB
         UOqDqFR47xNiirADeqhl4MWeowSDaiF35vcJi7oIfonh3kSZxIzKjNrge21jvCz9oRMY
         VDzeMEKsPi0MhZFsjpub9f1+PE971n1Ioz1yYxuwzD6QFSveanLf9w1Wb5lWFNOKGdus
         Waog==
X-Forwarded-Encrypted: i=1; AKwUvBzHjEUigFXdlOj9qvlexVwATQwrDS6qQhDQf2Jk0/wnwKy+qm3xX41W3caJLRW4kO2dCy/ZoOQK178ylDZ4@vger.kernel.org
X-Gm-Message-State: APuU4Z++YmC+/ESCc4Cxaa5SJTFxzQ+7pgfFf+Iq1LjxnfXitj2qDmJs
	jkNHESNbrURTPYvfgInrDAY0sEIdNj1aYxkLr0w8IUWY/N2ELbtriLrPUGURSXN16BOUuCCO1n7
	7owB4JXdJHcTMKdisnbpmen+y27i9X8AKye5IBVCPh4RK+46y+L/QN/hb8eCS3P1eGuWM
X-Gm-Gg: AYBFou1nbRTxfLA4TTn7/JlGGUCW1P+vzusydB9U6l2p2mHhI1jdxofAVrm8w7SLUw1
	Pth0JCaSWa9ddQY817f+7kcN6MVi52t2kdt6PIn9l3juyFtAQXK30FIdxxVQdEy/nNReHo6x/BH
	ChsEj/YKIv972p+48M5bijXNitAKHeVqUu20rmL0ttWLpaH14MLJe4VZmO8sWQMzZcit8YrM4Pk
	Z5/e/zj9X7WEg6+JQp76YjilUj69H/GgzMxC0hCb9sLiYzMVbkCg45WNfvJjrpZOju6XIAYIAT4
	NqiCIFgK12K8hAd7GLVpzr9yIIiHr+KU23g5HvzC2XC689fA0WRCytjvzWOdY+BomirepARDuDZ
	ZyZTI8hXp18gawFYKSN9csZpGP69ID+YuMSCaUrPaZ+w5KiPA9QzNUACnQXpWxTi2sG5OJem0WB
	oqmlOlpxfu15iKTO/lXHhE8rN+2Zxv3wT0UYCAzH5FxDGYF4awnxgPrLtvDMhxV+SgHrZ1IhS45
	ANhbz5DBpObKgUAg75eWCNBxshr
X-Received: by 2002:a05:6102:50a8:b0:7cc:2bb7:1321 with SMTP id ada2fe7eead31-7d072715882mr3862063137.31.1793634815484;
        Mon, 02 Nov 2026 07:53:35 -0800 (PST)
X-Received: by 2002:a05:6102:50a8:b0:7cc:2bb7:1321 with SMTP id ada2fe7eead31-7d072715882mr3862056137.31.1793634815005;
        Mon, 02 Nov 2026 07:53:35 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm20700323f8f.38.2026.11.02.07.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:53:34 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 16:47:40 +0100
Subject: [PATCH v12 9/9] arm64: defconfig: Enable Qualcomm CAMSS OPE driver
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
Message-Id: <20261102-camss-isp-ope-v12-9-702254689feb@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
In-Reply-To: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=VORIDNPX c=1 sm=1 tr=0 ts=6ae8b200 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=BUwzsxYIp--Ly0ysDZIA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: 9uGDmsUZLEZ2EREP7IGOLoIj7dq0Qy5d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX9a+9PrWdYDTX
 WbuDyw6hZy8Y0Z+anEVr0YpKib3xKMdmVzQQ0ZQas/j3H0AOc9bA7t07/cYncHph5eKsR/AMjY0
 4JFiYTK1npEKssk0b8lAnxuJG7ODXszKFI6X9eq2pS+c/6EDg92syA/hJxDm2qricMQTJyTyfH/
 D46OtRt9LX2dQMrSqTH5elf1xKQcNpfr30qtFnovxm1t53OXqXdRHt3pCmJALlQUa03o1sVEBBU
 JRenQ9rU5J4GSyR0ivD30x8Xg7Y8c6YHNr7W4LEMrWfTpNqOMHxPY1OEU6K188aoBi0vT0mwpUS
 CAdSTw/6aj3A4C1htOqSBfaMOUAAA2V5QP/9VWdRlHZpMckNX+0XwpEEKzKknGOu4OleaQehP8q
 EsDvZQ3msi5bkSC7d4fE+cJ0U46DxzOOhgZITtGENxW74U7eTbWFyiRqNsqQ3bJu5FnhubEv9AP
 8RBgIbfF1o263zv/aYQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfXxxATj3fxav26
 4Pwt6C42i6uKT0E9AEapSks2konycjhHdBB8Lin8OMd7wOBLzwHkrTUyLjj4jMM8k5hEaQASbdS
 ZXQp8jkUKY3PoQFAfTHmrTwtbIwRmIA=
X-Proofpoint-GUID: 9uGDmsUZLEZ2EREP7IGOLoIj7dq0Qy5d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020063

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Qualcomm Offline Processing
Engine (OPE) driver, an image processing block available on Qualcomm Agatti
and Shikra based platforms such as the Arduino UNO Q.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21c440c7912f0a24665bdb7010d9e4..6ce0907bfa8eedccd05c91dca45ad7c18fdb37cb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -942,6 +942,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_CAMSS_OPE=m
 CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_CSI2=m

-- 
2.34.1

