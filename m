Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C7442BC2F
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 14:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784211915; cv=none; b=pUPj/DaBiJQBL9X75dDbmMXgX/ta05iWD0BkJFy0ZPrLEARVbmcffeLg+xXQ/leZXofOmzUGNNP3of6M7vn84uw+DQ9rLsfKfEQfmaQuUqYPaVSDDIOGD5SLm+6LkslwmwUsiJVHnOgsPWQbi4HwohYqYJgciQvUbI9tJOeSXpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784211915; c=relaxed/simple;
	bh=x6GrlPAAjSvB6wPlc0sMHZ+kLuQ1ydttgH6bAmdxgp0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NZLZI9Ax/8NjIn5QVVWIlKdNblDo/vDk/giHTT/dZglrE4uz3kamk8GTV0tMN0jdZlRF8BWjKjPxC6fOpv6UGvbdbEp6DCX+JIiMrI1z+p5Mc/NBW5hadplpTQkUe/83s4FrwfJ0TVf4AS0S3dXcuYq8oZtjI1mg1YHW0AsCDhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lVEU+HPL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BszV4tbe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lVEU+HPL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BszV4tbe"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJlYs3988196
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 14:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=t7n98tslCrUbFBB31yPG1s2bPvjAURhqrCm
	yTDJ+txE=; b=lVEU+HPL1b3fZGS9dbT+Bp2cXk7Jr9ES7mkl1Ix4tSzKuC5F+Xy
	U7+HmGA9tj6048aeScyIE1ZAtC1zg+th1eLtHT3+CRqXedXO+y+TMPNlq7qe5vVs
	gjXW/Vwp85CSfUThFpkt6M/LCjDUX8bPdrOBRHT87H4r59AjUesKJ9WKUCd3WR21
	tQw+j1Mayv9baAT0vRC1mYUvRJ4wyiG8hiHVt+00CGPIj+dh6WC9YFb/wPdGZvNX
	mwC3v1pXX2I6Tx2zKaxbjmpxIkpZoOvyhD5wYVMzpcrb+rcfigi325xlBA/xrTXV
	nOec5ypPuyaYUgy8r2XDTIOgWo6E99Wkk9A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feq3pjp9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 14:25:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c19493ac2so117003831cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 07:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784211912; x=1784816712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t7n98tslCrUbFBB31yPG1s2bPvjAURhqrCmyTDJ+txE=;
        b=BszV4tbe38z0YJKghR7JYtvk2lMeM2mUPBi9eTeDFYXIN3CDIwizhe4vxEcYPiigMz
         +V22i6blYr6Jtiwd6Y5OaEdC8QEoN4OcdeSrDdNNKcEk8M6iDsFdDrr4mBxQx2XSzylq
         AjbYpUg6Pnh/PXZBERJBB5SUgXyilhsvrzLAl7niQFtXyuwsi6ktqhLyubtfIcZEmGhF
         51U6EhlhxxaYIO4yXHJHeS5b/moY0a99rws8j2BzFYYR6AZQazNgNoCtziBDsOpuupQA
         T1KaNH5vRbtz/qjS+BAxvQsxeN4x6o1EeI4iM2vGWe7bmx2ACNV4o2q/cQYIXV5DntkX
         +/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784211912; x=1784816712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t7n98tslCrUbFBB31yPG1s2bPvjAURhqrCmyTDJ+txE=;
        b=Cf6+hV+m15XRbpEw6tjm0q9TCaDPBs0/ZwTGrTt8wR5MEZz/2dZ63v+/q+cjIy7Typ
         SMz1p9hzY4VSPPbrZmekSkxZZOVHo6p9VVgqW3+wuAbHZE0mfWi9nJoWOw+8TnYCtWKF
         6tztFWpEHmBP+Zgsg2bOlREOHVduIwNBacCYKv5cV3j0RjFDcGvp1Ux2czGQNv1f/xlN
         Au/D0pJ/d/VgtGoo6eqQGFzn/72R1c2aEoI0ZKKrSUD8RdGK9ZvGRCvrECPxYDGjQmr+
         hoSM/JOq8fIcKb8eiYPyxKWUQDXHnMGKFnC73GLZjw3dfi1mzVvyqlDz7M835hTGuXEG
         h4kQ==
X-Gm-Message-State: AOJu0YzrvSFbwFdGqH1C/irViI6LTTuAkdeZfKhgdezBgVirF0su9eLL
	BvoBTEupEtdEfyLbJaspcLPUzvKxXjWOIpgPeLa/UVXkoc0nboJtwdTPVN8rKayw9zYSNkVUpdQ
	yxKGFHbyhocN50ruys4xD+TAeL1hez5cidmvw5PYUv7ksNh8bmh2HdRVLJwS4ULw6mXlA
X-Gm-Gg: AfdE7clvJNTzkCN3ODR0frdQpbdoAt2Bb49KKSrMEX+s0qOfUT8TZT2aQKvXoDTayOJ
	88xNWM0js0N6X9dh3Nydl38dGvrKAt0Er0KC5fpJEJKTZejo3Kj9vuorqDjWzV8QJErBX7fw18S
	W5xS0RgnBa8Jk7VqFcrdKjZBieSdvtOWZ0w4LwCMzYeZ42VbA3JSbvcTCFwP/9M4lIrrDpbAos3
	XbQCE/kmbe/3kl9n5Lh2wR2ODIkaAG0OjGaGGUeehIAxYBruNCmGRfg7gCuCumfTR6tTNpyO2cF
	REEEbTXFYESRxEs6jMNISfGhdOFJ8El0Jwqiij4Htq+ghBCvNkS8IWMSfK/BXCRZ5n9/bnjYTu3
	C7Kkm3OTQGgfFFHV54tzgxpBDohxcR16V0f8=
X-Received: by 2002:ac8:58d2:0:b0:51c:7b11:41bb with SMTP id d75a77b69052e-51e425190a2mr113588191cf.87.1784211906290;
        Thu, 16 Jul 2026 07:25:06 -0700 (PDT)
X-Received: by 2002:ac8:58d2:0:b0:51c:7b11:41bb with SMTP id d75a77b69052e-51e425190a2mr113587581cf.87.1784211905498;
        Thu, 16 Jul 2026 07:25:05 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541eb0343sm62091975e9.10.2026.07.16.07.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:25:04 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH V4 0/3] arm64: dts: qcom: Monaco: Enable SDHCI storage support
Date: Thu, 16 Jul 2026 19:54:42 +0530
Message-Id: <20260716142445.2767955-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qZm5_ZMG40dbs9oRXOL7RQOrrATzcrxm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfX/PyGWntPbN2R
 DwaFQE/fQBj9NCvdWuUOWTQi9Ij3bLIvsDmwqBv7pd+7qBSuU7B8YamxM/ssv7Ey0UVdLy6/+eD
 Y+0wRbFZU5whog6BuOYjAZLxv5vYSPs=
X-Proofpoint-GUID: qZm5_ZMG40dbs9oRXOL7RQOrrATzcrxm
X-Authority-Analysis: v=2.4 cv=PN8/P/qC c=1 sm=1 tr=0 ts=6a58e9c8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=972t8ukbrjnbrM4mtFgA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfX6HkHVnDauJ78
 +4rtGm+fAQw87VtT4blqxe/CHhzf+cUeJ1mfLoW3h3SP4VQoVocC1If0aI4jR33pwFrn6z4cnbk
 7eIwFS2tyhKLEzVmYMZ6+e1n2AKoad7yVhPvczzKG5+k5Vesl2+bHNPuYR306pDjBqs65Iob9Mj
 +kbc2y9T/ZTo9A4eDmVV9+SUBvheTF6SJvwkoMK8Ilj6NKFtgo2h8MeUegjSLC/cwVTw58qpZxw
 ekusfrHv+nJpkBJFp/dDKoUfQf/H/xBN6t2Z2ABch6tAowi3tAEV2S7/t60wUjCiv1vUeUI6ppC
 BdJFLUSV3jJ+EXEVjHzbBxx2JHBdsgJ+PDvIk7B6LHjXmw8Ob6sYByu+dpwSb8etpQZrGdowNi+
 cra/Nmwv3JUToSQRz0gU33MF/O7PjQ48wBPu4z3rsQOsjSAzhaeKNVcfrYUiWLL2tEWTkdYf9R1
 SFJVsUwY7IAC490wP3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160148

Respected Maintainers,

This is v4 of the Monaco SDHCI storage support series.

Changes in v4:
- Remove the redundant regulator node - vreg_s2s, which is already defined in
  base file via another merged patch. (sashiko-bot)
- Update the base monaco-evk.dts file to make it storage-agnostic by removing
  conflicting eMMC specific properties. (sashiko-bot)
- Link to v3: https://lore.kernel.org/all/20260701081715.2580329-1-monish.chunara@oss.qualcomm.com/

Changes in v3:
- Update the patch to handle the supports-cqe property for monaco-monza-som
  platform which also extends the monaco SoC DT.
- Link to v2: https://lore.kernel.org/all/20260616130347.3096034-1-monish.chunara@oss.qualcomm.com/

Changes in v2:
- Avoids using the reference to direct supplies as dummy
- Updates the eMMC overlay to remove the static UFS host disablement and
  vreg_l8a voltage override, allowing DT-fixup to manage the UFS-eMMC mutual
  exclusion dynamically for flexible UFS/eMMC configurations.
- Link to v1: https://lore.kernel.org/all/20260227105055.2364348-1-monish.chunara@oss.qualcomm.com/

Validated on Qualcomm Monaco EVK with both SD card and eMMC modules.

Monish Chunara (3):
  arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
  arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
  arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay

 arch/arm64/boot/dts/qcom/Makefile             |  7 ++
 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso | 27 +++++++
 .../boot/dts/qcom/monaco-evk-sd-card.dtso     | 72 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts       | 11 ---
 .../arm64/boot/dts/qcom/monaco-monza-som.dtsi |  1 +
 arch/arm64/boot/dts/qcom/monaco.dtsi          |  1 -
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts     |  1 +
 7 files changed, 108 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso

-- 
2.34.1

