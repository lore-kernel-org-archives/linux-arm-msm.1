Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264FF314B63
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 07:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419962; cv=none; b=GOunays8KBbSAhrBHihEJBOgKjNFbSzHVoVZJjKTstDarC2YqlMLq7VDFTxLSbkG23TWvbSqHbYub5c6d9X1Loi8cpxx3tT196gmx30jeHfqY3fkHsa7vLoazC5xy9VipHoOYAL7VEtdlRN4e+yf8yR+gWsEJnbp5hZF23JpDHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419962; c=relaxed/simple;
	bh=ScgocSYMJZUtb7PWKiEExIwCxdphhRQmmpNH+RfPfM8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LE/oy7ohU9JCO+vZkIQdL7JLka5cSHAjtz6z4pYoBsxETaV12N0rtzpJFg8Xo02MtzvHbcmtzuQGQpJcpzBXNj+OXm0k+/UfKKSGyNi61u73YHeub3GtpqINjL/QCEgO80ef6yEklTEMaLkSeQ3/nfcbka3YEP/XhEsdGym6CNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j+w9iYcl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D1sV6Qqv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j+w9iYcl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D1sV6Qqv"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lcWg722041
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 07:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xeAWlnFDPjChrwvi7D0ePs
	+8sox9HbQqHEX6wfQpKhY=; b=j+w9iYcl1SHasOkk8ecdAyPfv1KY3JIQHD1FSy
	dOZrb6YCsUZvfOsQSMgGFjNJDWVeztrY6torV2jVYXr7vL8bvDgWAnM1V5LAspdL
	0itjPoeSP7VMawf/SHelXAHRj7WipRNl4l1C4yLh+nbkIMQt1Ik4ozMcJd4cPTfC
	35UJFOUi/RyJjbj4lG0YmluqLxWm31fxu7Jh7GJq/hoypuSQ0v8rLwurcAFv7Bry
	DRRatMtsdYOz2OJtGBhMmUF7EiCbzbAJymUT7Nt215sIrYEwoWLVdknrVivUK1HV
	SkPA7Ai5/w8NIsRtvwBVlnONQqfjZRSR4o8n16wv5wlAjSsA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnkt6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 07:19:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so20557555ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 00:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788419959; x=1789024759; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xeAWlnFDPjChrwvi7D0ePs+8sox9HbQqHEX6wfQpKhY=;
        b=D1sV6QqvufmF+tsjNfDvEH2Ckfr7jwBCBdbv6zFdJUpCodekrT+m91/+jIFL5aAZPN
         M7FNAUJ+Z/HMDxcTAIwirK6tI9U80Unqpaok+3OksaYZeeHXVY0LLMFUgqe4TxIa60pB
         XJNxKhUhoah9Urjjuul4Y6N3RCA3JPERc8CH3EjK8PMiflR7vnmugBpsI1N3IYByG2rl
         ZXWfZIl69095u0zd+7P/f521m2VBVnqUa/MXAY7alX9EnRhnYqgdqdGvnZwJy9vd4ht1
         EjiI07kLBHGiTWhZ7oKnF0geYQMRK1ot08hjF2yL7SsJOKZaIg7Fanxdom0h/i4t85V9
         bNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788419959; x=1789024759;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xeAWlnFDPjChrwvi7D0ePs+8sox9HbQqHEX6wfQpKhY=;
        b=ZGZfa6AQ0Rh2637H/ZWtXymWtfKoY0bb+odZU4u0mY6emHNFlaHu4/lupyILr0TBY4
         c53t1YaFpLTXGqvfzRbop/IYIpVPVk+kTahdvmNa70Ay2BM8jcUwc2RqVSI9jJkHodWJ
         Ig3B9MOUg5K3cl1xWQ8jna+aJGZNtLYtYjP1iKSXszDclOBhRCzY+bqL1g5aTyKdiZXm
         4L+hfFBm1m5+q6meeWq4uyOJm+Kwgy/WMqvoEVROQ1dvCsmqBE/kor2SIRFuWAm8ui8P
         5mJdeaYqfaPOBWhw8Fjs2ZJTjVuu+/gJ9wEGns8JVmlYrB+KlPs8rhXF7afHClXCV7Uo
         uOpQ==
X-Gm-Message-State: AFuF++npCLyW4f8naDPdqam/9MsuK8aIAVECjUqA6V5zZTZRe83TQ4/s
	xrlYBrW7zGckiA+Wv5bSP9wwKGClS0Mve533T5pyn9+Y2tAeAZ6Mtkm2SNpXWoWxNoD9V7lD/zr
	FHEAlWpHqynfvM6zNulj/NYAoKFLw0MtjTDfK5lNGEJgc+MXKDUXDGraIO4yLXhZkNBmaKYqviU
	hr
X-Gm-Gg: AYBFou1O4DZaOBIA5U+oP4pS7AHZOdaLHm6FBA2FseRSvx9M/WypS91XJc3Obf0s5Ej
	kcq5D+rIy5cN+83aNd6HrCxQpHmnGXsUkyPUnh7O2dwPQorLU6vuIv0OU+0LaguLrylg7Hl8uLz
	yLMfj/1SIdtm3cRCXb2UFruJ5FdZDO42Uagrnjc4pxazkhXjMaZzjVWrsvXHXIxUbp7y9Hi7Qza
	tIe03SZ2lieil8zIp7Jxd6MaG9v1NdpedG80oSw/Gpwa/c/6apGQaec26r3eeltowOY7Mu9alel
	eqcwDr/tKLHOjjUzaSuaQlWV7qjX7b5gRp6+iT3awTdaUFR5VVKqo6Q/jb/mHkJP2gFKPUPsesN
	qjr/YWAWdUZsxWHsLJArufjKFAEe0wBQZ
X-Received: by 2002:a17:90b:3f84:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-39aedf1922dmr15797337a91.6.1788419959560;
        Thu, 03 Sep 2026 00:19:19 -0700 (PDT)
X-Received: by 2002:a17:90b:3f84:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-39aedf1922dmr15796641a91.6.1788419953876;
        Thu, 03 Sep 2026 00:19:13 -0700 (PDT)
Received: from hu-afaisal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14319983842sm3992468c88.15.2026.09.03.00.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:19:13 -0700 (PDT)
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Subject: [PATCH v5 0/2] arm64: dts: qcom: shikra: enable ST33 TPM support
Date: Thu, 03 Sep 2026 12:48:52 +0530
Message-Id: <20260903-shikra-dtpm-v5-0-e8ea3ac8a135@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFwfmWoC/1WMwQ6CMBBEf4Xs2SW1loKe/A/DoSlFNlqKXWw0h
 H+3knjwMsmbybwF2EVyDKdigegSMYUxQ7UrwA5mvDqkLjNIIbVoZIU80C0a7ObJY62Owhrb501
 DfkzR9fTabJc280A8h/je5El9259H/3mSQoGNqrWUh32jOncOzOXjae42eF/mgHZd1w8PSZG3r
 QAAAA==
X-Change-ID: 20260825-shikra-dtpm-7490cacf0266
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788419950; l=1355;
 i=khalid.ansari@oss.qualcomm.com; s=20251105; h=from:subject:message-id;
 bh=ScgocSYMJZUtb7PWKiEExIwCxdphhRQmmpNH+RfPfM8=;
 b=vDlxITKLapkLDOC2sAxZivvhsWGwPP0NgQdp3T25QEnSc/LAVe7tmHV2VxdKWQfx3HXniL0qV
 Kq/XrwCP2NKAqyTtfmFTQxDA10iQZOZHQFySgY3fRvPF2k5VU0cvwF1
X-Developer-Key: i=khalid.ansari@oss.qualcomm.com; a=ed25519;
 pk=eBXrIUgTWV0cgG+GsNeZPPgvj1Tm6g9L2sfcoxMGrKo=
X-Proofpoint-GUID: XTpFtnNm3FcfSBKVCU4WV30JS3-jRREZ
X-Proofpoint-ORIG-GUID: XTpFtnNm3FcfSBKVCU4WV30JS3-jRREZ
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a991f78 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LFEp--mz5Qji-3JE28oA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2MyBTYWx0ZWRfX2d1ih2fSLlgq
 o+nItllfmH0m/HK3V+YbD7eDC6isT1UJ9eAnT+3YCFONgKkCT/M5eTSfyM6mySBDoIDsZJf69FP
 dX11rW5i9gLqDjmbMWFo0Zi7DgwCHxujvORyfmuYckIWdo+Yj7rS73tPgC0u9v88xCl0YR4bS/k
 a7bWR9/Z+E/Rob+fVvkvxmOfNue4K80OUhGvSpSIH56nKYQ9+2uxEFxB2kJc5TCKpA6tXFxVY+i
 KSn0RL8sc4InQw4daco2fb1Xdj8B6vs4xDnYfhHpQ+FKxrBWPEe+XLlS1h3h+8CpthGLFIFpXPH
 W5w4zLTg3Q54R4cYMun/FjQcYEI5vaP+V4NljAQhSilPcxosLC3MHIiEdEpTCj8yeJ/Z7ArLhSX
 mpAqPAZUp/5o4sQRb36q/eCStJZd8HqZwxX+OFp52Klyxa6ewfliV7hiP0kehjukMTpGbdoP8Ht
 KXKdinHXNJWDmLzDWZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2MyBTYWx0ZWRfXxbZqEHhyTrKQ
 vSFJZnvZPhz3nc4NG+RdkHaVE2hqB74ufTPs8hBKJQU8s8i7ziKY19+OMxEzpvdFG0ummLqdAWi
 11FaZMZoJDFz6VPfGbDbCCEZqqScGUk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030063

The Shikra EVK platforms support an ST33 TPM connected over SPI5.

This series first removes GPIOs 14-17 from the reserved ranges so 
that SPI5 can be used by Linux, and then enables the ST33 TPM in
the common Shikra EVK device tree.

Changes in v5:
- Add Reviewed-by tag from Konrad Dybcio for v4-patch 1.
- Keep node references in alphabetical order.

Link to v4: https://lore.kernel.org/r/20260826-shikra-dtpm-v4-0-8476223184de@oss.qualcomm.com

Changes in v4:
  - Send the interdependent GPIO and TPM changes together.
  - Add the SPI5 and TPM nodes to shikra-evk.dtsi.
  - Remove GPIOs 14-17 from the reserved ranges.

Link to v3: https://lore.kernel.org/all/20260820-shikra_dtpm-v3-1-93cdd4f3e8dc@oss.qualcomm.com/

Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
---
Khalid Faisal Ansari (2):
      arm64: dts: qcom: shikra: unreserve GPIOs 14-17
      arm64: dts: qcom: shikra: enable ST33 TPM

 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi |  1 -
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi     | 10 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi |  1 -
 3 files changed, 10 insertions(+), 2 deletions(-)
---
base-commit: 65eb47183e176d8c1220cb945edac71dbedceac1
change-id: 20260825-shikra-dtpm-7490cacf0266

Best regards,
-- 
Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>

