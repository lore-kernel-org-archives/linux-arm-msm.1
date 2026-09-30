Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C994F30E5
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 13:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773345; cv=none; b=MH0Zj0JHDU459DOji5X405LV7DtYq1JPgxLmCaVId82ySwkoigQXHBmQ0fezPlGjjmWLRUO9OIFuh2vhVqNXQHaPnH06KCxb1pPJAyTKl6lvXPDBs7TznYfUA9d75yen+PEv8J+u6QvkB4Tq5T8/KGvyttoJlT+qPoZpQQgSUg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773345; c=relaxed/simple;
	bh=JKZHxtGKohBE4ZoT11CFP5jaeOV/lyrn+N6XAtOFAuQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VEFWNh24aj5VlQB8YAQI1/aaIwSBdpqSk4kFKexVID9J+V96Y2N8ofBEi4uUBQLlN5PspMs4w5Ivd9B31QNkqTd8M1ECqCAbAgHKHmINzEn8oWpzw3a/yLsPd8JXMboKtv+mSbKLi4Ll3DO164SlMAN47EeDP5TXaBfkqUiQG9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PLKQFRT0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LO09piaC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PLKQFRT0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LO09piaC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7aL2319197
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 13:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ELYydnqIT1AKLfnkD/Hb9W
	Mgj4O4pzTeFDAFrMHZCMs=; b=PLKQFRT0z7XGcJ2JN4476QXU/eBELofJ4kKdlD
	sxR67n3xoGX2w2vp4M07Xrzt/5bq3uU2lS1jW2i0wS79aa0AsH471Cn1j8zrqfWo
	rs1unI9NnbwGOYpRdrBbIjogPsGu5I4S1ZkcM6Ko+xSlytqRcm0RmfAiCKGTkpMD
	M7c9itq3L3bgovCsI59SUVBKd1j550mroQG5uznE1NxlJjBzBuv5WekicG2H3dBN
	iTMtb3GULV02KBQZ33qQcUuKsD7P+/hJq2C6ggjejS3RtmqAk60GMXqpWh1S2Y9r
	miCgEipD9k/gE3ZvDW6o/2/pbCBXF5QBh2Gk/QVDhZOeemLQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0mfabsx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 13:02:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a0be20102fso5109148a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 06:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790773335; x=1791378135; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ELYydnqIT1AKLfnkD/Hb9WMgj4O4pzTeFDAFrMHZCMs=;
        b=LO09piaCNAKonNu/3TzNVdXgV180BXYUJ9TGW10UhAFL70RecEf/nF8zj6JKwIp0F1
         /hx6fffbptzfZ70y4gNWepZoQbDvY7Vfianb/V11tg2aPGhwRUgJWz+dYkvaVkJ92yyk
         AikdpVmBWrHC/9ErJpfdgKtcy8hxvMKsHXwplhGMZND4/7d8u4bo4h6dXF6CMy5JvQOb
         nj4ipid1LstqT4R3VFGf9DxbZ3T3Bzj4zOsRRZI2VwpqzdsBGaPrsPTs4XQqOfQFu4LB
         0OsuKp1SRwcnZXthYz3TXdOITCZG3FiImcUo+PNx/3gJahoKXaMrhl6lNdIokFcAqJYN
         VBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790773335; x=1791378135;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ELYydnqIT1AKLfnkD/Hb9WMgj4O4pzTeFDAFrMHZCMs=;
        b=gpFHbTBUErCZjfGzAvPUMaXgvk2lrKSOQ+jram/i/F8qiFF4ALHpXnTFi3Ti1wx1lJ
         /iSsyakmQS3TBHjQofm7VD7R2t14ov3KwyKpTcYnvySQwHBiIlogpEIiF5mXdtR3Z+ze
         G8ym6jc8bhfKehb/VlhdjARknSyUBllqBWyIYF1ya3+0dHY8JCy9uCSi5QKtbxWCnXaT
         LoMWCEB8bXgR5CCZBffglUieFowE9mzhQPxOFdiIdnSANzSFrUHbWe7vWHA4xo5RJR9z
         G7jgWPDtSSpDVjUijWL6ewyod7lRUkR2Hi9zD5tGX+DrBtvADolys0XyiE7iHJnEIlOe
         J2pw==
X-Gm-Message-State: AFuF++mMeiyGYfdJTEfYZB551qrvWi7i4gLRwyRudGS+GMCVqxg/AIIE
	SP3XuEyYiFCYKoTeeLdLTmpq4MSCQgZRZi5ufNq9iej9iNKjJUCQY4owM+cilCOQWQ6DOsHxCwz
	tvpzw2LX447UzIBfGyUSL4e74efSK07K0yXIa0I04NbuU0iBDhoPA24ujfH9fO4JIz0Hr2Vjx34
	HY
X-Gm-Gg: AYBFou1ohTI1NiTxNSnORL614JqdlbLrBkPJKvXKNTmIsmnxSQgV3EnCoRwR4Oq1IWI
	Iuf2wY3foHDVAz9qgzRGkdjRNWiA07u7U/1N2xITXqOIHEG77gm0j8+ySiR37701lSMpPMHIZYv
	nxf2leB7rGnwkkfEG8gSfZeUtEM3yOMxHzG1GEIbLDEr1qj9IDsk98LenbdouhNBcXf+LscozM7
	ZOsxiDvbF4Yx8R/dPi40JwdeqyWsuzZ+lwaSnryeK630RepU5YTQZHCCA9ZcM43YWHQAeJdgCvq
	GK7/b++H4cbey87jhewNTD4IvFGGTQFnv6sVCPG+qSCgRXsyCnQ0D48EMYf0NAUe9W8/aF+d55K
	Lnn10pc3tp1dZm6U=
X-Received: by 2002:a17:90b:1b03:b0:3a4:9f17:4cc with SMTP id 98e67ed59e1d1-3a4d18e7857mr1302050a91.55.1790773334705;
        Wed, 30 Sep 2026 06:02:14 -0700 (PDT)
X-Received: by 2002:a17:90b:1b03:b0:3a4:9f17:4cc with SMTP id 98e67ed59e1d1-3a4d18e7857mr1301991a91.55.1790773334015;
        Wed, 30 Sep 2026 06:02:14 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4cdf25c6csm3426058a91.5.2026.09.30.06.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:02:13 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: sm8750: Add watchdog support
Date: Wed, 30 Sep 2026 18:32:04 +0530
Message-Id: <20260930-sm8750-watchdog-v2-0-b16fcda275d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEwIvWoC/3WNQQ6CMBREr0L+2pJSaRFX3sOwqO0HmgjFfqwa0
 rtb2buZ5E0ybzYgDA4JzsUGAaMj5+cM4lCAGfU8IHM2MwguFG9Fy2g6NZKzl17NaP3AeqXUjWN
 9zDXk1RKwd+/deO0yj45WHz77Qax+7X9XrBhnqLmy0poGZX3xROXjqe/GT1OZA7qU0hfPPXIRt
 QAAAA==
X-Change-ID: 20260929-sm8750-watchdog-f666b0e43875
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790773328; l=899;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=JKZHxtGKohBE4ZoT11CFP5jaeOV/lyrn+N6XAtOFAuQ=;
 b=0O6BQKmx+08UWRMTWsDrJ9g6iGMQyfRrnSpJbSMGmR7PWkMOl5Cifq1SvaLTcisszTZBQnmS+
 /8b02wezuD8Bl80zwNSlmOmQ8f2gx4/R4zJdVfwf9Z+HM5T+tL5ebLL
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MSBTYWx0ZWRfX31Iaohl2JhT3
 VZ/LV0wKbMugOvc8qokfm0aMdGmhySg8jdGTc5G4fOXjye3+tMlPTN4ltVyzhAxko3uFKQ6dEOa
 vokIzPOk3k+rgQiJkk8ND1Eo/3YbyrZmDSPt9G4BThGEolSGjSOXCXlj1eTsdOcvODFNSGuHMex
 A0+0y+AvsJAFiTac3pukMXKQWHcuA3NszwgNT44a2yiWeSruIhLoWyYEKgBep3ep9JdYQHqQC7X
 RCe0U6oQVXgyisqu6mC4UC4V0Zvg5nwf3ClqKFZnTVXOtTNEpEGxh6h6CCPnqX9lozzcBkHlWBK
 RZY64kJOVi0KUTk0xBB6qIpZd9zrnviyVo3NDkewe3Vu6nUI/UScnL0KK27+WCIKjpFqq8h79pg
 +suIGQYBoPHx9bhsFMvdxWwOImD1iNnBdqf2KY/wNuYaarhdQL24I6qxTzvdUTm9L/ky2Xp6cAf
 3uEUrwtttxMcf04ZqRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MSBTYWx0ZWRfX7S1dtR4StnBa
 gqRnsROWINL1nEvdm+Q33UNdP4BFW+KbR/MA5PqhDFodL4ztHZCa7xW6J+Btb5L+JCoi6+jeIec
 Hqpl+/dkXYhPmKH2rInB6h1Q74CFI8c=
X-Authority-Analysis: v=2.4 cv=RZEFmFtv c=1 sm=1 tr=0 ts=6abd0857 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z-B4HAslQSYTmMnCEm8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: vQ1P0XY11iYbFsW6X9KTLexQumuJc2pO
X-Proofpoint-ORIG-GUID: vQ1P0XY11iYbFsW6X9KTLexQumuJc2pO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300051

This series adds Qualcomm SM8750 watchdog support by updating both the
binding and the SM8750 devicetree.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v2:
- Collected tags from Konrad and Krzysztof
- Placed watchdog node in correct ascending unit-address order (sashiko)
- Link to v1: https://lore.kernel.org/r/20260929-sm8750-watchdog-v1-0-ea06d5dc7e54@oss.qualcomm.com

---
Komal Bajaj (2):
      dt-bindings: watchdog: qcom-wdt: Document SM8750 watchdog
      arm64: dts: qcom: sm8750: Add watchdog node

 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi                     | 7 +++++++
 2 files changed, 8 insertions(+)
---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20260929-sm8750-watchdog-f666b0e43875

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

