Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396B245562C
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 12:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547588; cv=none; b=OMBVqlqHzuXPc/Gtf38PButCiBxvzry/RHxGzDRJzRxFFgY7zCUaiY3Ft+bcYmryUY0Xb9JjKxFok/EWwWAvY3NJdxuy7wZuozt6+0/50nJamrYgAz9Kc0rssmpglPIwaxt/iZigjedDdWvTRUF7cvYfRnd5qY5fiy2WW/gB+VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547588; c=relaxed/simple;
	bh=KW0LlYcgIekVd5iwGN9xOxzzRGAL5Lf3F0H9QU9QRBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tddZUCe9giZj4Wql64LS/7P1Tsnv40Ia79h1NdfdXUwvpfp7IOxGLfPnY7xapPW1M337hyXmOML2rczv60g3tq/Nzj41Sp2FNTRQb088lYm0dQvggkqbDKYjLMwjd2+0usNF+FLwkq1AiqiXiDTuECICgO7ZuftN2SzWl53jGts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZFgOMjS1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gxAqkgoB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZFgOMjS1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gxAqkgoB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KGbB2257140
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 12:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3baEXoP0uS0PxL6jcVvm1v
	qspBsroAlCY8IAaQ8W77A=; b=ZFgOMjS1V2mFDZ6Jhvugk13av5pzCKGMctKCck
	9qbJWmoXxVyejXNy12e/3AL9ahmZBT97FR2tU7AEW9sR8+2i0J7aQe3/QOHwEar6
	l5xRnVlBHgMuruQXgzMkEAN/Et/t6WlL6fomQw+gJ7N7Bpr4wzrC/xznUEgRigeB
	yK1vOi++wI165p/nn5mtYhUr4U8vHGnwRWipMtXZQaiBnucUSHAMhAZ+aYEqrKEG
	6htw6cOLlVmjuEn+k0zItX1B3VfM5CwpErGCxToXGVCSCoel2q3EQAu895pXMrBE
	AhhTKZU48r1Hh4cbxtpmw365QDWOqmBr5XFXCtZ6hokaZa1w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6nuft7ms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 12:06:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso2447026a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 05:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791547582; x=1792152382; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3baEXoP0uS0PxL6jcVvm1vqspBsroAlCY8IAaQ8W77A=;
        b=gxAqkgoBSL+XK6AMsa/OnlUNjCxCdNsyg3cxgwl61NrMuRM8e3QYdyRTQGGNsSmLjV
         q5G4joSw5mIRBJUaLLuvrE1syu1kI9DBTSjLwZe3f7qQ5MgO7rzbwAkwRLuyv0eG9n8g
         a43cwb/Ymb7N4PB8WwsnXDARFFUy2VxUHz28/FJEJbN1lBCrYaP67cne9ru//XwL0h7i
         LDMTIwURRvvyST/VdGtaVxxaRvDdyww86qzYOW/oGSpYdQghJgRpnmbtD3YMMJas74mD
         xHhOklkHlx0uML2HWRg8HGu/Juysa/Mzfhsz/0OVtjjGYPOssH2mKC9jWbgksnOhbNUZ
         fiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791547582; x=1792152382;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3baEXoP0uS0PxL6jcVvm1vqspBsroAlCY8IAaQ8W77A=;
        b=Zp1yxSBljWEMltD11pA+YnFbCOg9kkIwq41AZHOJ7DBr3CnWOsun2S0vqgOe7Ga/2X
         XFSOO9Gm60QwyUsdbnq7RlzqvZl9M5QUYnAq3ueug0f4lUA0Uel8RNqNUAa5KM8TfNJU
         my9CZc0dnzR4mw+fNwIjR1kG1EEFXA/fSYzHVN7NPXGCWmDsRNAj/sN1Mhflfy2S52P8
         3wLGgJOdfWbzFjaxVO9XBmqSfVFjCo7iL+kn3EP7qvW3kAuTn66WcVZGqlp27OzHZC7G
         7616Z7mbwgeWZ8buwgtvpm83SlCEB60jmIU1MqnaJw8u3VdFa27m84/l2djvu3itJ42D
         PFiQ==
X-Gm-Message-State: AFq9FYL4so/nbIvJk0H+GygYczMJxCrABdprw5r/gpQron9b/GqSAmk+
	09yBAQkB1WQpqRSwSiIaFxuUdlJJitRiI+/AwCthkvma5ykytW/QMiTjB595JW8snLKx6C5KWxC
	eME+pndLWPpZUwkO9qKWTfuUVBf/k1eyUIggE0eMUbfIuSBmD7LnVqdfAfX4yTOZ65EDJWGTzfJ
	5Z
X-Gm-Gg: AYBFou2KJ459emUvMF1IKbtPpidO74URESf1yppjErgGgS0SHJfol/mJaEY7BBIfz6A
	0MXGNXrJYPvsrqxuSWwyDHZHt+BClLWUIQCxBOzswE4ndVGb7ZIeqzxOB58PIKGswF8Q3TfhqcI
	SvsZN/2dPYmsf67v46STc5QdWjwhnyuGcrYvbOf0uRnI9poyXVfzwJTmoU3qpH6nYV+uL6Geruo
	Q2QwnePnozc/6I6U22bmKP5a75YicchxI8R/wjx3Y8FU1KDZ3gax0BQRsJ7tKCoQbB2GjMaKsVy
	2hw0xyqy7ksb1KOl1tKfefjgVtLnoJyCya7x04p/8/CdKnMKbZ/ILqWMd+amEGNf6r4PRwV3Lvm
	9sRedBdipyK54HoXrU9ssAZjy4p9M7w==
X-Received: by 2002:a17:90a:d2ce:b0:3a4:97ea:f0da with SMTP id 98e67ed59e1d1-3ab3a735fbcmr1525756a91.17.1791547581415;
        Fri, 09 Oct 2026 05:06:21 -0700 (PDT)
X-Received: by 2002:a17:90a:d2ce:b0:3a4:97ea:f0da with SMTP id 98e67ed59e1d1-3ab3a735fbcmr1525731a91.17.1791547580936;
        Fri, 09 Oct 2026 05:06:20 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36fdc75esm3254084a91.12.2026.10.09.05.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:06:20 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 17:36:05 +0530
Subject: [PATCH] arm64: dts: qcom: glymur-crd: Mark L4C regulator as
 boot-on to save power
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-b4-regulator-boot-on-l4c-v1-1-7b76c2b2ea76@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKzYyGoC/yXMwQrCMAyA4VcZORtoRpHpq4iHtc1mZDSSdkMYe
 3erHr/D/+9Q2IQLXLsdjDcpormBTh3Ex5hnRknN0Lv+TM4NGDwaz+syVjUMqhU14+IjDonoEii
 x5wla/jKe5P1b3+5/lzU8OdbvD47jA72wsCp8AAAA
X-Change-ID: 20261008-b4-regulator-boot-on-l4c-8d119b1de4ef
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791547575; l=1467;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=KW0LlYcgIekVd5iwGN9xOxzzRGAL5Lf3F0H9QU9QRBY=;
 b=hF6mVqPU6Oo8YNpQFk42lEb16ecqMPWDYSfxLwG+01VnmnB7GgESqZZhg2CMymxqzH3FYIf7O
 Wugx+N6I1XVDbHapLk3T5ECFEFld1an9JQ4366iIcz+XEuwmzFUGuJ1
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Authority-Analysis: v=2.4 cv=afn0Dhot c=1 sm=1 tr=0 ts=6ac8d8be cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=NK1Zv9-Dd623KQK__TcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0OCBTYWx0ZWRfX32p46LtbvIzu
 SFDUkes/cJmcNKTrfkmuvSSQBHVJASDPzzEQBebOAM6Nf1LwfrtVsKh0UR0rsvUclK77pS22zlw
 0CCaQqEisipA68DDDloGDzNFDsjBjck=
X-Proofpoint-GUID: 5Dx3dDMRIM_rRdBGcVHKe0zwG3GKDvbQ
X-Proofpoint-ORIG-GUID: 5Dx3dDMRIM_rRdBGcVHKe0zwG3GKDvbQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0OCBTYWx0ZWRfX/mI1B66tFIMQ
 dUA5JpxhWKsEIEgkMIPUn/DkNzaZg/1BPmsHiDyws07ZBMCY9+VY5anPGfcRBgt2rNvLvj0Oq6V
 h0EGxFFO72df7MgEbx6dXVBbdlUgxxYFfuk8tmZVbdrFmZo2b0/JfYGRdxc5AN5iaKNY61CEi11
 a9UIYIaPo/wHojcisZNGWSwFdKiWNxnIMhl1Dbmt7G8kyFWqM8ldmaF2g3ZHI2HAwp46YaCkWl8
 QXFnmbwSm1I7taF5bh+Py/H5tqtWqWJXK9evxrNjO+2pwcm2WBtRduH7Ui5AjlEBK7UIqsblqA3
 4lCGy74+dwNQBYA0lSSh6mG+tAbKnxNKN7yZZOOdHoK4BDRy1WqzpX5sX9Q3qt8OytciCHSSoK2
 M9oaH9BWbaU0ClUhym8jL/QIQ3LxeeOHQlZmqVwOCweDyJIIUzTiFJDJu4NL+pLLyFuRF5zt0cc
 99ldEEsY67FaDtLCDYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090048

On current Glymur Rev-1 boards, the third USB controller and PHY are
not enabled, so the L4C regulator has no active consumers. The
regulator node cannot be removed, however, since Rev-2 boards will
enable the corresponding USB hardware.

This rail may have been left enabled by the bootloader. The RPMH
regulator driver cannot query real hardware state, so without
regulator-boot-on the core assumes the rail is already off and never
issues an explicit disable during late cleanup, leaving it enabled
indefinitely while unused.

Add regulator-boot-on so the core knows to explicitly disable the
rail during late cleanup when no consumers are present.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 58158b51fe29..ab4c9c33f4e6 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -472,6 +472,7 @@ vreg_l4c_e1_0p72: ldo4 {
 			regulator-min-microvolt = <720000>;
 			regulator-max-microvolt = <720000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
 		};
 	};
 

---
base-commit: b018686719706a781c45a874ed51374a2dc4b767
change-id: 20261008-b4-regulator-boot-on-l4c-8d119b1de4ef

Best regards,
--  
Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

