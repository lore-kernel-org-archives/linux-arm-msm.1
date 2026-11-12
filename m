Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458346;
	b=ulrwq3MHyYZDtD9h+SDEVJqrAfN0zSeqwF94p3ThyvoGkrDU57bWcQZ6jg+6SrZXUyPm
	 zhRIlOkQjWDKQjVyQohcGUVNsbmfxc9zeK0OPTfsorblLbxpUOFSz+XhBc2E8aTLrGVwk
	 aYCapcJ6VK7xwlkL9v5TXkihs6nOXKYJa6Biuyf1OxJMKD+sAutBunghyjj6lybHs6xXu
	 B1il6Fo1LCwZCD4egbBHOCC/ve/j5jMOLiforvF5o16HS44n42+u6KdFYobryBlf/5LYC
	 8SW6tPIbDOLNAYUxubFxY5OEIgRen5kM7z00bhKWfRY4m9+uIQA+8yL4nfe47cdQ7LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458346;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dcp9uV7WY67YAfdBK4ioc7eDyML/68Wx1+8UTucN0ko=;
	b=Lzm7croR5QqZXTLNRhhv1FqPrciznQy+uHCCzu+WUc97xkOuTqWbPzgKzi3F2G3E/oTk
	 P7MXav+SaVM4clzz327eiOqt1ARgZokkZsrEbOL4ul9zB7IEHvumFHlRVQPGh35y/NfRA
	 xCq3kApQAOVFMNpcCe60KXbZivhWLMA/UtSg3F1b/VWIEzLgcIlsvZdO1xTXThAH4oP9A
	 xhjmqlWwLVvdaBX8ToFpl4E243zMJKD22TiQYsIWDFTBFW9WBT+bcfslpBMzQkuGU/qDm
	 m6PNj+55b1mYXkd+JpoKudyd6R2KD6Ytl0+6Eq27D5f6p0DE5b0Yw6Q7zwB+YV/PO6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IY++QUlU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xv4fJTNc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF96606A335
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AF96606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IY++QUlU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xv4fJTNc
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZfOp3812883
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dcp9uV7WY67YAfdBK4ioc7
	eDyML/68Wx1+8UTucN0ko=; b=IY++QUlU5242cBVSG6c9gq50hlGe4Die+hinVJ
	X5Oels/dJ2YDPTJvW6i8TwEAJGMju6JVZEWWzq2YEdvKPg9WE8O43UoYd6JJHux6
	RiMt5N6vZgfOXWcUlH4q6Km60Aq3xJiMwRWg81q40QmTcPXzUji+hkxvx2+NQSUA
	2Ymm4eEx6hkvuUAsvftCyucx72V1Ak1sW1eqYN6YqjafRnKExWpzh9sCOpBKn2nF
	MbV0SLqKpBzaHgwuGRjePjVtIg3rpPRBDuOl5ZmI5AsobuUZ5XdkqyXsIiiAbeAd
	7los3QLILAlC1FNHR3Max3zFicH67HhXfKqw7QmSsyJQcZBA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvvw0j4mk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:39:05 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36ecd5db581so989334eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 20:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458344; x=1795063144; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dcp9uV7WY67YAfdBK4ioc7eDyML/68Wx1+8UTucN0ko=;
        b=Xv4fJTNcWbuffauOtK7MDwn1yuk6CjPWNPdHW/5cDRF6wCoU/FQS9WAoEclW7YyKKe
         242phyw9x0gqgLeYcY941ie3FQGjsCGaBMyMkELQO4HEtOVVw0KM4QXFk3U6BQ2sCTsZ
         O2UXcIyfqVHXAVdMNXd06KumDaPQC3e1eUd8DCb3cwFeLX2uOW91vNhX7Smn7ILa2t8p
         TXIR88CDRkbG1yYxHcF0lWG0Dk4Dv3fwhAorjnS7U4u0mrqPXkBh3ymYYtrvye4nX9FP
         Oc+g7+GCMMU7Nuo3ALuQdmXtiXqwDNaKZNh7o5+vMAhObpN5+FOMgb2yARjchuF7OixY
         pjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458344; x=1795063144;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dcp9uV7WY67YAfdBK4ioc7eDyML/68Wx1+8UTucN0ko=;
        b=Jb4soA85EdCTyjHyykXUjdLBHw+C3NkXAp0vWW2l1gCjixla207S3FauTVRGI0Il0n
         K63sd6vkTI/hWBKnYiLvhbAPg9BsF2Kg6CxsTT9CacMlWPxtRbYtJdYoMYfe3ayFG2Qx
         9ruQzd+PDcoLedNZmuYnbmOjHPRaiB4SQdLk/SveCTrkMgVLFq5Y75/HfijLTOieZ6S4
         iZDpKRr/Y9iY914GvMFxtyPzB3gF1id5kxQWsUXpHsYvBAFGdU2uQdF0QAPdfYCBOJbm
         9r6lzmIYxzqWbwCDZtB2akDKt/42qD0UaVZ4hUOQV0ol+tOivsNkUgel/w+V2GquW1F9
         Q+Tw==
X-Forwarded-Encrypted: i=1; AL+hErGo3eMo/LPALGOe2VnGjE9zTgIRk8GyZmhzFaMflrxAIWIb461aZ/YsJA5M6iUS08Zq9onh1hVuEw926e8C@vger.kernel.org
X-Gm-Message-State: APuU4Z9pNJY3LZD5Pr0CBvwLIoLHApGlUvdnGyimE1JVqUC/Wuo6G0XT
	KoJtM6D6WOop5/HlbPtJ1tUgU5NiFWmV4iFsLpu0mqXF6P5UqSF7Y0i1DeckEWlvtekPuLMpzXw
	Fy71i6IOROki2xui/qH+vExIamY4W9V1YeyzpUFS34396DqGNtOV+hIaiJtMlsi/++/UNVC1U6y
	uf
X-Gm-Gg: AYBFou2jDFFjUOv0yyQD0TsjMP7p+/1Oos9Xi93bwo912xWtJILY1x6X30AZuDwGtcs
	C5C0fEoukiwLS97AtbZJXLcI+5+x35SKIGc2Dmn+VUai4CP71Y2CUpHvSWE0o7fW/3nJpZXF0v8
	J5kmqDh3PbxmGXqta2Q7cT+6j8G43zXWxZteWrV3EFfzUPkYo/VTxQZFYTPRg5OyuXAG1m0qXy/
	R23izMTdAa4+omPDYMxiuCJBItm+JvVvQrS4E3BPfOUsWI8lIhcluTiXOXQWUSxHAdt+tJXzeaI
	3Fbf9LmA8MjxqctzmOp2ly6pE2eXu4HQg+eDqVTlAqpyScD9CiL8QokGetvb273ceviCwSUn00K
	4tYvADMgBlTr10wXIYvOttN2WTksRpjP3Xi1BK6L9VgbfKNQiL66eH6GMfTUmbDDwJREQkDuV5d
	cMdhC8jVkfGd9I3funbboBIdq7+Aoz4VyRmcCOOaGMsi0npRLu2l3V+MBDyFFi0Ot5+NCAL+sgw
	DIYgU4aP2Mi
X-Received: by 2002:a05:693c:66cb:10b0:36c:b138:651e with SMTP id 5a478bee46e88-3768675fba8mr5074201eec.22.1794458344026;
        Wed, 11 Nov 2026 20:39:04 -0800 (PST)
X-Received: by 2002:a05:693c:66cb:10b0:36c:b138:651e with SMTP id 5a478bee46e88-3768675fba8mr5074181eec.22.1794458343339;
        Wed, 11 Nov 2026 20:39:03 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm42344790eec.23.2026.11.11.20.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:39:02 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Add support for reporting boot status on Qualcomm
 IPQ9574 and IPQ5332
Date: Thu, 12 Nov 2026 10:08:55 +0530
Message-Id: <20261112-imem_restart_reason-v4-0-3c7177529526@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAN9C9WoC/3XPwW7DIAwG4FepOI/KhkJHT3uPaZoINSvTEjaco
 lZV3r0kvfSQXWz9kvl+cRNMJRGLw+YmCtXEKQ8t7F42Ipz88EUyHVsWCpQFp5xMPfWfhXj0ZWz
 bcx4kmmA6Z6Lzxov28rdQTJdFff94ZD533xTGmZovTonHXK5LbcX5bmlAAFxtqChB7l00aB1YQ
 HjLzNu/s/8Jue+3bYi5qKpnSq1TqlEW96CD1VaR/ofSTxSu/7vqRpHtMEZzpNcdrlDTNN0BXp0
 TIGUBAAA=
X-Change-ID: 20260929-imem_restart_reason-15c5b95f9a5a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: Uy4_SRUY4F2GqfBrfNivLx4MHOu-32rY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX+0XHMYMfJG39
 G6iFwkOEnSectoJmV6fNaunptlFRYuDcsyF31Eaqe+IPM/G6hphJcxHAPtL8UomXQSj3QCFzg9q
 MFA2753ivOfs46DU2hISMS/8hF5/l4WiDjQSYfgJAcAgtOykw4fn9pNJIOGbK+zJMyYyRkLmt3e
 8cqKNTmbl/+yApn++00wNc4FH3OvkhtCjkLrdaHSFZkjIMEWj5MGFahBAd7BYflIAnit65P+Foa
 rjyxPpUVtSopW7F6m9qsGU5KHTAds70pPTb8ndFWv2f+vf8UN0i2vERMC7jYxILNojeywu8qVn3
 BJOAd2Dfr1NeLMcn8LlQp+9KwpN5r6MxGnoCfVp0eVJb+xM+R5XLfNbr9UbfV/tNty7FsuimBFk
 MFGgBmJTVyxxElvr3F4vil0fHixpzGkRaGABsHXzt1GJO3ttTMAWiMHq9UbcyJCGW1FaKcQVzwP
 ScDjCl2xKxU+PLqY3GQ==
X-Proofpoint-ORIG-GUID: Uy4_SRUY4F2GqfBrfNivLx4MHOu-32rY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfXxe06FDhTYoKc
 KST8+ouqGobOT2PsRwziRwkMYJtiiItBBXDs4XSCMrjQXeRu9rzj4YrG+Bgr1f+Ej3henDGoLwf
 kcV+WrC/tYz1M2V8kL7QlV+TTpi7z5c=
X-Authority-Analysis: v=2.4 cv=ct8OAF4i c=1 sm=1 tr=0 ts=6af542e9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=q8ES6JJDbZgftUInmsIA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120018

Similar to IPQ5424, add the IMEM node and the restart-reason child node
on IPQ9574 and IPQ5332 to enable reporting of watchdog boot status.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v4:
- Rebase on linux-next next-20261111 to fix the conflicts
- Dropped the binding which is applied
- Link to v3: https://patch.msgid.link/20261019-imem_restart_reason-v3-0-e6b1ff5de841@oss.qualcomm.com

Changes in v3:
- Picked the A-b tag
- Squashed 2/5, 3/5 and 4/5, 5/5 into one to match with the schema
  definition
- Link to v2: https://patch.msgid.link/20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com

Changes in v2:
- Placed the compatibles in alphabetical order
- Fixed the unit-address in the restartreason-sram node in 4/5 and 5/5
- Link to v1: https://patch.msgid.link/20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Kathiravan Thirumoorthy (2):
      arm64: dts: qcom: ipq9574: add support to get watchdog bootstatus from IMEM
      arm64: dts: qcom: ipq5332: add support to get watchdog bootstatus from IMEM

 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 16 ++++++++++++++++
 2 files changed, 32 insertions(+)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20260929-imem_restart_reason-15c5b95f9a5a

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

