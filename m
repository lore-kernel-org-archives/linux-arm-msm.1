Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143603FADFD
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 15:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574161; cv=none; b=eouSoIcWFDXkhpfUy2quF9u9z2M0qUzac4Kf2CwdNQJsl2benIss86tSY/0Ybct95wsqAc8aLyHxM3yZ19CDwDtKiU1cDLFLXtAbMmwx3mwsmXQT2agFhE0LmVzqTBRJsVm41BB7MdGD5VdzFhggvf2iq21vlhK2EENKzvhf9cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574161; c=relaxed/simple;
	bh=DIO04uzroUuedOOaszUBuucgUOhScwy9gT5HUgyCdZU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J6FoTnQuA68kvhbhqa93pMaXp8Wa+DtKdB9gEBYRQ6GebQKkA7tp+zPp46cxnz61197fHKnp65HxVvNY09EKKypKssYyyc14KlxsBDMUcX7Xsy9OoRnCDPTsXKg7SXrx+M8+ViZ8M+oWg35j+aB6b4z5pWECS7ezF6BAI4swGNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LaCXLmwn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XGy+7I+R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LaCXLmwn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XGy+7I+R"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFeKtS3365466
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 15:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z7qzSvvt73cSpQcU8e4RWI
	Qu1jaXpwh9YBIhF8t2N6c=; b=LaCXLmwnYeaHWv7HE4QWyZwl1YgCQ0ZHuSoA08
	DIjnaQVuOv2Lj+C7iDUWkJ4qVtwwj0C6jWcsNXcV3Xd81sArOq6r7iJpExZQkFEY
	3RatSAIuvQ6J+LQK06cnaW/ZdWZK9ap7Y974qK/RptSgbXgpRfpMWTMUbpKrVEK5
	o6BQ4oRy4cwMWXEjEtt/Vk6qhC4X9EmVDJTh2D/tiSjjVyNCip7Vib0WSUo/Sxxt
	15rUfbBS3ijt+ijQcjRA175SkY/wIN5McJtvo/69svBQnZXA7+P8zTLfsrqdaY7V
	JRCxagtEft7ju+22RjnkFk0Pr5gttwhyMrMIgZy7h9UmhEfg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqjcku876-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 15:55:50 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97e9e1dd7fbso4303852241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 08:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789574150; x=1790178950; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z7qzSvvt73cSpQcU8e4RWIQu1jaXpwh9YBIhF8t2N6c=;
        b=XGy+7I+RYbzKM4elUgCyPZ/pIZ6Fn9M6ZHQ1q7w46f1uqYxxaL3KFfusg8d9UgQ3yV
         5s4btxTo4/uCAeQLtnURpbwa+cdBD8QUZbEXbA0gk4iUOlpA21uIRtbAvqcEdiGYeq2U
         yxgVygUjOIN2wq2a52uegQXPpDfJP7zZISSNuZe4sQOBX2nY/j/7rix3lj/kP0pbUWP7
         fUS1Jaaf4LK2BfD1C08+mVVbWQGxjghqv5oWwc6P4ZC6s0L6xSZe1v5hcVArRuvGipkh
         8ZAI0UuZcCC2RDVvFD/gvt6IdlTjCHNFJhdLeTcEl7Yvx2XBXVCZDM68wyNzJg/VKXIG
         5IaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789574150; x=1790178950;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z7qzSvvt73cSpQcU8e4RWIQu1jaXpwh9YBIhF8t2N6c=;
        b=iS8GOWXMenTLKDY2pXxijWirlK+9iG94hGi5xDKcwW1qEVy/Ih+SxkAgVi1G5YItHj
         OCAiVs1bjQP4+I6YD5GvY35fBbEmn5zdavgOsj9XBORwvpk0CfHqBkEeHXzR1MZ1jSJL
         QZWxiV/vqgpXNQyeHYyQReE1Kyb/mM1D/RF9pjyY7ctwYA1mXXr6MZIGiA3TbwvxRSIR
         FHgpqCtUA80TdiUBB0MVZSv5MSIcEQe/QrocsQA3xCdU2kNaIlm5u8MT3eDignOwsX7X
         ypv0fd/RhXiseGJWfGwJmoe1XgcOZ0KQL84VmVe+Ai3EXhrVpE9Vh7tEW1fWKox9Y5tl
         X0Jg==
X-Gm-Message-State: AFuF++msuIQHustbbSEp/SwzWrNQt1Nk+V4XvMnbJQl1HTfBCvebi/cz
	OxTo0JZ19TzqDI090Bthuk/gn6tVoWayRAqaNAN5JUPQ2iXEOXV6VYIsPbDTC239D16YDDNCrZQ
	OJMIz9mRZvcoWyrPURxhl9y8Ed4wEbgqzmk9yOHxZvpEa0GgqTduhSS7ltSDUNZvENweN
X-Gm-Gg: AYBFou3olm0z8t6PrLmHo6augCKYjNUOiJl5aHhX1GsLOsnPsRGvUkeDwa1KbMLxEK8
	0wpSa3IABHilq4kXrzXVYqiruitEHAOg7K9IHKtwnzi6BiQROsc7tQCGFYG6+NbDzY5KA4a0sAS
	TelomAFiOA1OCBE+xolxAUlzi5J2qIISKl7dxvUJzBow2OlMQjs8aAYAbMmu6p0V7i0JLAgJJrx
	9erRamFTU0Bn9S6YKGrduAmls5mQZDIXika2Kp9Z7LBPahRzm4n8aZSr9O6PJB3RGJToFNnGDQu
	5D0HIrXNSDBRqPr93sHZ7VrEleg2090S5o9uxmwFHBiNovgx/Ico5Uw4OmpL3PUjxnokx6C31d6
	cDU1YpbFYeQcdJ4UXHWtFknjad9U=
X-Received: by 2002:a05:6102:3ec7:b0:79b:b116:2c5 with SMTP id ada2fe7eead31-7a023d19677mr3780540137.2.1789574149831;
        Wed, 16 Sep 2026 08:55:49 -0700 (PDT)
X-Received: by 2002:a05:6102:3ec7:b0:79b:b116:2c5 with SMTP id ada2fe7eead31-7a023d19677mr3780503137.2.1789574149415;
        Wed, 16 Sep 2026 08:55:49 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2160c2sm765525e9.6.2026.09.16.08.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:55:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: nord: add GPI DMA nodes
Date: Wed, 16 Sep 2026 17:55:37 +0200
Message-Id: <20260916-nord-gpi-dts-v1-0-073e3f9c19d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPm7qmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0Mz3bz8ohTd9IJM3ZSSYl0TAxNTM1MDgyTzJEMloJaCotS0zAqwcdG
 xtbUAXkx/EV4AAAA=
X-Change-ID: 20260916-nord-gpi-dts-40456500b7b1
To: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=626;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DIO04uzroUuedOOaszUBuucgUOhScwy9gT5HUgyCdZU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqqrv8DuPa1iiZnlD/I2rWIKJ8oLUkqWR+k/9OR
 P59ZNCZLv6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqq7/AAKCRAFnS7L/zaE
 w1x8EACS85bx+67gX6slKQ2NOYTZyIYWoLDG1o99W6PPU8ac9yzeCcQxjauxJHusAW6NIvvBZd4
 WT8wSR2+c1TZNX6E7TD7AXEbwRJbmCY+tNTppKEEdI/eKrdw43alMrTnFTDS7z2m5Adl8NBDgNT
 kMkRZMN9yq9Q0ehECoJElOGq0kbW1DTan3fOupO6xCVAwM1iNbnBtZaLIy69WAhD35U/ZoJ1puK
 ix+WJMqh+43OU1eHcXgLcC3N+6ZJ8JWfLxXDacK82GiQnEjIHgY/lw7vXv41r/4Ms8my6eFJ/fN
 ccr/509fuW+++b+RotJyA0zSXmpBHfVH5GMAIWuGkTFJnIFoBd4JVnwoWmfdSH40A8CapKiZRiH
 TOoQ9zHR3DkbENWT+YWY1GrI5vkwFrjaghP1YLofwWDTLMvJeIpGq+bBh6BwgT1isyAVyANekfX
 vVZuQctfegG6RTWMxc/f0EmU7ya04IKssw2ejf1Ymhk/YtR4mDZab7wMnKrfEpC19ra1zwpJ/Xm
 bh7nCqLxgRVMcZYpxkLeLr9EaRCWE3XFTvAfFjGsH3wkALqIrZnxROaG1n99hkzvVuqgBM0tyTN
 Xak9m+wNsxNPOfc1WdIJB7YRcirPqz8141SnqhvEtFO1v45/nJLA0KmpYdvj395dem8bo45LiCS
 I+8HMrqCQrWo4yw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIxNyBTYWx0ZWRfX3ie5muD4mKSg
 m28jFDJbvabVMDgnWLEVepbrxvG8rvlDUjjRfPx/Fuj4FtFiCGqA3Y1JE1+3mIauVvjj5JLyPBF
 kCpIqa+KLKdUrlSXINnRf6qxDM2Y7eg=
X-Authority-Analysis: v=2.4 cv=PsIG/AM3 c=1 sm=1 tr=0 ts=6aaabc06 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Q_R4M8txQULSIu3kbIEA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: fh9OkZ-Fgx6IU7ScrjOQYTh_kkaNOLgb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIxNyBTYWx0ZWRfXwpH2Uy9O9tZc
 wh7JuDGt6qFZZ0kRTzOpRvEpMjnHIWxJXiQ5Gda/PBfkn04Xq6k1JObk5lyRDoDFC/YXrNhtjLA
 F6E4yB90DXB9EMXNnBcstlmTJYkNXDqM0EnLUdp78O6AljeAXEKt8l+GGEjzd68t6uSo0c65/VR
 40Wn87op7MAnUgU3aHEXCCpFtcnwUl0W87gTH9Rhu4BpkbGee7ZEv79XgkLcf4eXE2WZGeKHBF8
 UMfghf7TV0wu7pjuThUhj1Nhhhc/CXI8D/9EkuRoSxL1tM7e2xGXLSKYNMSUEl3oY7HlL+ivQO+
 osJ2LjAozNDak0xLWb50aqWYtPoxeyNPPXDIIqhGMOyshyts3M+UUP/QcXfVz+/BrAocYUSSsPl
 29bMhcGc9EMDjeBPjLkVq3TPRzqH/v5SEL+cX02Bwb3NL20jrkxQp3ypCponC/wDXGAtNNjtW7X
 WSd35qrzb5JVu8gfEuQ==
X-Proofpoint-GUID: fh9OkZ-Fgx6IU7ScrjOQYTh_kkaNOLgb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160217

Add GPI DMA nodes for Nord and reference them from the QUPv3 I2C/SPI
nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (2):
      arm64: dts: qcom: nord: add GPI DMA controller nodes
      arm64: dts: qcom: nord: wire up GPI DMA for QUP I2C/SPI engines

 arch/arm64/boot/dts/qcom/nord.dtsi | 219 +++++++++++++++++++++++++++++++++++++
 1 file changed, 219 insertions(+)
---
base-commit: 3c60a5740403002069d54463b6b0f603b9ba08bb
change-id: 20260916-nord-gpi-dts-40456500b7b1

Best regards,
--  
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

