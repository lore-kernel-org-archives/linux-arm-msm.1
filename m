Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793452256;
	b=fYJqKMjbVkF98o4o7j4lrS8EePvHyhmG8IY6eXkTZqAg+00tYmok10e9ZHBBjXtoBIo6
	 eQke5Lmv28/DnfMH3JpeLAVPHrLx2tVCMF1YiSR5BGlTR/5tI9rhe9AgEhF+UQRgXEiWt
	 Pl4AN5201PwzR0l25YsDzXhwk9uFFtUF/T3D/ZcKou2R6nBXae/BWiErLWosbGuzZpf1z
	 cCu/P6VAoLGIF4OtqVUbKkhPX0csR9WQeJu6ZT0e4VBLHyu1uNciuGyxmU8asSmY5D/Pp
	 7IhiayI9NkX8tbcmQvfVc/1+Irf1n9sFXVbRLrw5yb8bBrdU9fX4XT3rdhPKzNYs36g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793452256;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=duVsG64Sl0l3TykskMHzQEgoMi89wQI8nBGjFfjz854=;
	b=uAR5WTtXyCgkgsBf2B0G7Ps4jkW6WeOtaOzWBA9KVXYREYi6ScGqDwvoE8qXcYPAHOMK
	 Hpt4og7O9ufpsvljPoW4N4zkBSf4fKOZzoPB9DmX1o/No0VXijd1WTY3gilCljZcUe9Ck
	 b9iVXkIV8Fvg3GZx8LeBe6COCcU578Auyq0UXLUspsTcQhpK809T2Er3chzt6T0iBVOcG
	 euN5kLAJ1FYumbD/e25t8YWLtYN+i4lm5PfTIBn0o2QbN61lmqw4N4s1QUxZ9mnKa84fk
	 PASImlIK4/+7DGQ4IYsdXE+XUzgLRZJ4Ag+AEVhNydmag2T0yeFTniAmjs40LW9VqZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XewZK1f0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jyovGDIn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E850B606A31E
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E850B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XewZK1f0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jyovGDIn
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD1Cj62199878
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=duVsG64Sl0l3TykskMHzQEgoMi89wQI8nBG
	jFfjz854=; b=XewZK1f03Y09b3WxwuvrLwzAXwW8z1ZKEn8qZJkkjL5lcKGlf0c
	CEgNXVXug0B+qB8VKhVfOuzQbVWOJ0NhL+ImEx2IeWLfKbb8YLL0pJC02WRBR4mO
	9xHhrH7dSztg+6fl3ghIUlhyN1uwqXbzzB6tpIOrtx021HYrNd7or2I8gZTPLc/f
	uJ8zlf5NcI6D1wUUpESwmWnAjuoIAM1rMfDc6EgddUdXyZvK/lx69mRgJY2DJI5W
	U8cul8D9xbwZepVcEc+yGj0RpMGq2aJCcIkalAEDfd/8+yvmPQ7pY++dAkH8LCGe
	74N1fAG8E/t+MQoTVdTKkbJSr+vN0V/zMVQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8du94ch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:10:49 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-189d17eca17so1239938c88.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 06:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793452249; x=1794057049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=duVsG64Sl0l3TykskMHzQEgoMi89wQI8nBGjFfjz854=;
        b=jyovGDInC80ZC2XJpvG/J7eLev5aYPDBg96cKm2HH2ZSY7jm1rtQg7ab6h+DA1QRX1
         F06OrWyg0NgpioRsR7BJVURh6tamuRVWEzTQGpCs98qe/qPmi7GedQ6rCmWOomTeb0AY
         Bx6EhwHTz7GiUJUtV8yhU3/er+QNUFudGfZDQVdBwyab3IRm9glYIgZruzqhYAUZu2bO
         RuCE5VkWeqB8lqbgF4Gvoil8T35OPp3CplMu2WVTVq6lVwOtiOkG9Uvapulj6ctariae
         DwkVcv9BjGSGXgAFErG0nO7bmj1m9DRsbFbDqm89VkRHF21YYKBT2+ow6b57SjlxyN7J
         OB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793452249; x=1794057049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=duVsG64Sl0l3TykskMHzQEgoMi89wQI8nBGjFfjz854=;
        b=2UREssTLyYbp5M4UuqQUaLDm12oI0FR1nFHWi5lrMRjScvdVNQhTawBFsjNmILCu6X
         wlXRws7nHyC94Kaxi8QnAfDJKAbQA7QIvfglfdvWOMgDX85h67XLXR5+zpUEPgx9gdFr
         XfkYfk9YDAc9LJlzYqyDfCB56XrlPU6Ack1XIrxN/GeWwQYIuuPeF57dIPQZKfPK8WXS
         C1FJs2SQ8zGnNAtIDr3a3GcMquy/Gnqwr8R3FrE4tK90O2oEtVZxDwdFIvlPKixSHFHe
         aqTnJOQ3iTx/umqqXsnqW/X/MVFXmxI/xtgrXzFt6keSduBkWol9+OUyu4fPg1NBeUuD
         YqyA==
X-Forwarded-Encrypted: i=1; AKwUvBzxwbBGjbSfGdyIdqINsnoe7wH87v20QsL9Kky8b4ZLgKgnLnzXHVMi9wLUSIGJhJzhrOR8OaT7KTxBCZwN@vger.kernel.org
X-Gm-Message-State: AFq9FYII3kjRjEtb0+TZ+tahB8YDlNmvR4QXci7/XON4IV43mixXaYTG
	hHvdMWT5VJYkeTXyW2wfHp3Hv6QZeezBMPN48kBr8RRT2R6Vbq8Wkek90DVaBud7iL7dHM0Whn8
	mAt/IC1Cl2KOi0aRf7cnvTNEkGF/TRFqhKi22CK2jWtcdF4wPtrB9ZZ1Lwr8MdIUqPVib
X-Gm-Gg: AYBFou2LfSRtRSH72KW8uu/vxvFWxUaWPriy9Yt6QC9mEl9YH7NlwmgdkIhSeez0zoQ
	pI9XB166HuKJrycAC3qu8LNTpHwdD9kGIjHVpA5Y24uAxQsl8w2hklVKFNfhdJEToXjtWZJpvUh
	XZkTjlpMauQ+LlRr1FWYMtTyD7D6cHvHOpSlpto4b14v7fygsbHZ9QSzLFb4qKGrJIK4ZIg9Q2X
	DJLp0E9MP3SW/5RKyfGBTtG+vozr+gJ6/DvShTDZgmjR8Dho7jH0PlUm38JzroNkCAM4g14Q3Kr
	vvYj1Gs9zcL43VM+ai04OP3CBL4tcMJ2QPfu5o+/bg73ImJ9iz9KqYltRMpCnRJmA8hjcwz9f6c
	l72XKVzL38KralT4iXJ7quMuQSfjceRk1J01ijeyw/m0JWWrWNgjXn4ZCFvZlwjhMXvC6fbo+n5
	p0I5s62zODyHbhsqxApNPz/vSGBBgYqSvX
X-Received: by 2002:a05:7022:285:20b0:1ab:f77:2977 with SMTP id a92af1059eb24-1ac5b027fa5mr6919204c88.14.1793452248704;
        Sat, 31 Oct 2026 06:10:48 -0700 (PDT)
X-Received: by 2002:a05:7022:285:20b0:1ab:f77:2977 with SMTP id a92af1059eb24-1ac5b027fa5mr6919174c88.14.1793452248139;
        Sat, 31 Oct 2026 06:10:48 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm15717872c88.5.2026.10.31.06.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:10:47 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] arm64: dts: qcom: Introduce SA8255P as Lemans family SoC
Date: Sat, 31 Oct 2026 21:10:36 +0800
Message-ID: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae5e8d9 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=QWYla_iuZz5IAfy8WBgA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: C4Wiqf79jzf0Vab-_NJJbJsLfDqm4m95
X-Proofpoint-GUID: C4Wiqf79jzf0Vab-_NJJbJsLfDqm4m95
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfX60lL6PTrw7C5
 bGay1bkhi+KunW+UQFmNSbVZLN7elw4qnpsu0Kax1WOCGyF0XodVWaEUUbjcQ2McH9Mwc9hJovd
 5i/Hg1bURh56oOITfuv4dkU5Spf2ejVpWFQJHPUYcr19uRiuBCjk9nt7nvP4XMByCSnWkqXz2iu
 OX/1pMNwUHa23DGHg2hSwvoAcagYslw75967wPhNT0KRf1eCe5F/r1wEjrONjey3pqI1rSiIL10
 7wkOADeX0cwTZ4XVLAUazZB7CVDOu/ennkjvwQHxJUaULTQV43GR8vmKoJTmWmGVI4j287txGxT
 G+DejD6ylwPAhh4s6ODuY0sQxb7YbRY6t+POYDdP/fgcIWHu1wbOuMfoPOHphPEcIa7ZnBHZ3I0
 51YjqVJafj367Ei+mOzQFDJNpBgXW0XE3B1y4BOJVK9fln7IPZLbBPzZgrrWdwG3S9sFdtSo7o6
 SIMeBN81WvcNKT8/cXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfX/ZD9qnb+LIfK
 nH8JMKD8lvk5Qzx2ZB8IYr3ggBTfG4e5urMy7N0G5kdR34GdmE6eMScKX5+nQFvRnJySA8Ewm8r
 6bfl5mk2lURzGfMeQOtntSOPXSMQBWg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310052

While the patchset [1] supports SA8255P as a standalone SoC, this series
offers an alternative by introducing SA8255P as a Lemans family SoC.

Lemans family has two variants: Embedded variant (IQ9/SA8775P) where
platform resources like clocks, regulators, interconnects etc. are
managed by HLOS, and GearVM variant (SA8255P) where they are managed by
a VM acting as SCMI server.  All Lemans family SoCs actually share the
same hardware configurations like memory maps, interrupts, DMAs, etc.

This patchset moves those platform resources out of lemans.dtsi and gets
them accommodated in lemans-embedded.dtsi, so that lemans.dtsi can cover
GearVM variant as well, i.e. lemans-gearvm.dtsi includes lemans.dtsi and
overrides/adds properties as needed.

Changes for v3:
- Rebase on next-20261030
- Squash patch "arm64: dts: qcom: lemans: Add label for firmware and
  reserved-memory" into the GearVM patch (Abel, Konrad)
- Add label for scm node, so that lemans-gearvm.dtsi overrides it by
  label (Konrad)
- Override QUP I2C/SPI/UART nodes by label instead of nesting them
  under qupv3_id_N, in both lemans-embedded.dtsi and lemans-gearvm.dtsi
  (Konrad)
- Use SCMI channel 9 for QUP I2C and channel 10 for QUP SPI power/perf
  domains (Shazad)
- Add a comment that the SCMI doorbell interrupts are updated by
  bootloader (Deepti)
- Drop unnecessary linux,cma node from lemans-gearvm.dtsi (Konrad)
- Clarify in the GearVM commit log that TLMM GPIOs controlled directly
  by kernel, e.g. PCIe EP PERST#/WAKE#, are not abstracted by firmware
  (Konrad)
- Sort top-level &label overrides alphabetically in lemans-embedded.dtsi,
  lemans-gearvm.dtsi and lemans-sa8255p-ride.dts
- Link to v2: https://lore.kernel.org/all/20261015023711.721837-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Rebase on next-20261009
- Drop patch "arm64: dts: qcom: lemans: Move PCIe devices into soc node"
  which has been applied
- Drop patch "arm64: dts: qcom: Rename lemans-auto.dtsi to
  lemans-sa8775p.dtsi", as lemans-auto.dtsi has been removed along with
  sa8775p-ride boards
- Follow Nord naming to rename lemans-iq9.dtsi to lemans-embedded.dtsi,
  lemans-sa8255p.dtsi to lemans-gearvm.dtsi and sa8255p-ride.dts to
  lemans-sa8255p-ride.dts
- Move linux,pci-domain of PCIe RC/EP into lemans-embedded.dtsi, so that
  lemans-gearvm.dtsi no longer needs /delete-property/
- New patch "arm64: dts: qcom: lemans: Add label for firmware and
  reserved-memory", so that lemans-gearvm.dtsi can override them by
  label instead of duplicating the node hierarchy
- Add SCMI power/perf domains for QUP I2C and SPI controllers in
  lemans-gearvm.dtsi
- Link to v1: https://lore.kernel.org/all/20260409091100.474358-1-shengchao.guo@oss.qualcomm.com/

[1] https://lore.kernel.org/all/20260304-b4-scmi-upstream-v5-0-f8fc763d8da0@oss.qualcomm.com/

Nikunj Kela (2):
  dt-bindings: arm: qcom: add SA8255p Ride board
  arm64: dts: qcom: lemans: Enable lemans-sa8255p-ride board support

Shawn Guo (4):
  arm64: dts: qcom: Introduce lemans-embedded.dtsi as a placeholder
  arm64: dts: qcom: lemans: Move pinctrl states into
    lemans-embedded.dtsi
  arm64: dts: qcom: lemans: Move platform resources into
    lemans-embedded.dtsi
  arm64: dts: qcom: Add device tree for Lemans GearVM variant

 .../devicetree/bindings/arm/qcom.yaml         |    5 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 3685 +++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       |    2 +-
 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi   | 3224 ++++++++++++++
 .../boot/dts/qcom/lemans-sa8255p-ride.dts     |  222 +
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 3371 +--------------
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts  |    2 +-
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts     |    2 +-
 9 files changed, 7147 insertions(+), 3367 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts

-- 
2.43.0

