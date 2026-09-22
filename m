Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3844A491587
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 22:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115120; cv=none; b=DXWdd7/UQ2DHU+Bt6ArH2Quiqx3tjl9thveRuvwsrEjkjfOxvEmeM3Cyydzr3LxAkmH7NAojj3vU6b7z5HrVnmZN5LVYKPYuFfzE66vx5XuadAGv2/+HjEmMc/SKgfR6D49ivB+LmJnRRjDE5in7KTEvh7BxIkfyYtnEk86nsK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115120; c=relaxed/simple;
	bh=GV0RIdXOtkfjMVPId86FT3OFmS+8Og4nR8K49a3WgB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qix/U6GIPqMSblZe8QKLkrTSzfCJwwlrtPa+dzFc3ZIoosdSgH4+Swdmpo2IhywOXZ199cPY1vctB3jcLMK7x9C6VHgOy6W8uET4ksNcFWua1xTNSt2eK7pfos6Ii1QmyTvAVhO8lPVyv6IDQMw78upbjtlINvaYvk7WE9budCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W+9A0AUE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Re9ZD9VN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W+9A0AUE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Re9ZD9VN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6w3S178728
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 22:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DS28oPm7nJH
	+RSuD3M1Gk+EsxwlEoa/DmGIN9P6AsqM=; b=W+9A0AUE7+o492Aohc4oqSvJK57
	jTSaWEjZS2CTjKIEyy9AOrOZ+QO1H6VuG88khneuaCOj6YQsr95ghGyv7F36lw1G
	1T4Ac+/lIqafE7DG8hguqfQ9mdM7CYZ+9DRpaHA+0Orx8TEzBAw0UoFCZRLGTC7G
	KRvGVn7B+PzM71irgeA6djIqtteiFavwCVmAyPLnqUA9QnyJO7bJW+j30prsDwKO
	G93aoSWjTJ62/cNtlOWVyybfbo2nkBeQZG/PryDtcbZi8blrM0mrSuwO+t1X3oYz
	c6OHoHSvxmS8Pz8qtgm2mUWP3x/3AFZPsAE9/Ju6G/JBnUTKMx4em6UwJ7Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec2baw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 22:11:45 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9806e283b0eso281050241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 15:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790115104; x=1790719904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DS28oPm7nJH+RSuD3M1Gk+EsxwlEoa/DmGIN9P6AsqM=;
        b=Re9ZD9VN5kaNiiDa2EvAfHpcMOfjWssn0f5pgoCyOXtmiGDG+PLfoluBOJutyJ2ttX
         48/Xru+LWMIUBwbMTxqbtp6TVY2Nx/Jw8wJ4Jjxqz+BXNs1pLHOxtYpSOUMfDVVCQh8x
         tWqSH43P+qFahWiL2MRMSkkppeel0Krd59Vj/3kCZARTibK2ALVotuJi7kT0azyfncAx
         Z81GoFdV/KJu/1FzGdd2L2CJzz9OzN89Ax2Hth9QmZcVGHasWrrAdeDNyt7zeI8pBUrP
         a5nei07Mr6PmCrI+/8eCJFBcnT3RAr9Iq03KmTqDdZnooLeyI+iJfJujoli1GXPz8yqX
         v9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790115104; x=1790719904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DS28oPm7nJH+RSuD3M1Gk+EsxwlEoa/DmGIN9P6AsqM=;
        b=x4g07y29wcxVHhU4JWEaTGuHJUoTjYMAJaC7werncB6yuMyUJyh/u1tduvEcmUfl8l
         jzPIxeii3ZoYm+7IQBVxJxF4h7F8cvevF3kNrdp9GEgXMwB+aVmaez7f1uP6Gcijg7To
         hOz1EVTg67PLvnDTC2gFhV1gLUUczU2V7fcoJVcOwM6C8OZM9szAE0SnWr7Mgl72Rs/h
         xkd+tA7SmOjyuupTOzacCKxQL1ETz7rQWcd5mYyeTX3uUNxvc5oni/rkQ3sPewToLACc
         +W4z3fL/bUleqCQIV8h3nGF75bwyggzO4bqOUSNdq+a+lRgW7FcvRhq4mZ3AdtD6REBI
         o/pw==
X-Forwarded-Encrypted: i=1; AKwUvBwSNTaC/1tcFEL7EUV8a6PW+nm2wxqk76l1L8jf7RxXoYsG9tA49nYBmRCk93ud9AdxfriF0bKdRxCyp3cO@vger.kernel.org
X-Gm-Message-State: AFuF++lazxMEies4um0Ijg37UX73E5BNWCX1MoPH4htJaSZey361dp24
	b99isSIbo/NQuCxcw2BH3pTnS0wUi9LQiUhO4c2JXBIN5vQFv9NqZILfTrlVFlvkozArqtKle8s
	j3AgQ1u5+Ra1zTsUqQwfzdRdsxswo8UNUU4OcnKLX6jLhbSr2Ap2ZUPrwYlWk5LQB/oKj
X-Gm-Gg: AYBFou2Wg/zA4i+FerItHnpPibbMSbPgvIRkmdwJZEZrmQWjTraITHS1pHA28zBQOO6
	UHzZcOjGnd5o+6iJLZAIZ/TqhhP9GW2csQBCNREh7df9p+cvtb1eYb5tzpYCrFZDl1/AvFxNTn8
	plqAzBs4VdkNZ+SSUoJsHj6d6y1bbnkf854VFMPfDRRDwaOqN4RLpZiax8XoaygBIyzyGXr19ez
	1N672BUkeVcY+/uE187WeK+6MqSakTrgUUGp+pBPPX6ajKf7M1MRW3I44uEdsq884AzeDV8CMWq
	boeApiUy+3xpVtXeUnbIVKCrIe+M9VseUikBDsy0siKG8g/qL/Gl+riX7j8qMERbCKWM1dj/CHH
	2w3R6M1XtBVTQuFMWRDOZBy1jeyHML+7SY/3qP64odpas4FZG0hTc0U8pJS331OZt
X-Received: by 2002:a05:6102:f83:b0:7a1:f7e2:aae3 with SMTP id ada2fe7eead31-7ac1d0cb103mr873924137.21.1790115104443;
        Tue, 22 Sep 2026 15:11:44 -0700 (PDT)
X-Received: by 2002:a05:6102:f83:b0:7a1:f7e2:aae3 with SMTP id ada2fe7eead31-7ac1d0cb103mr873903137.21.1790115103968;
        Tue, 22 Sep 2026 15:11:43 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488688856f0sm1400270f8f.30.2026.09.22.15.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:11:43 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 0/5] arm64: dts: arduino-imola: add support for sound
Date: Tue, 22 Sep 2026 23:11:22 +0100
Message-ID: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223133950.221234-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260223133950.221234-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX2/SpJw69dnSp
 pfvfdBFwO5MxAzskGG4Rc6XiRH9VFkdFIdtxlJW8vKN5Q+uKL3uO84G6VZ8oEmMXIcr+xsEF9xZ
 imle0KuK9ojSJenm2TOGoXceU9jyzdl5jdzp366bJ+xt8op0y9y+IPFrNszpYR/g2/jSM2DWWnJ
 LZAFgum7/Uv6brkSL/fkwm5EOPtWlygrKoVOanoFXKkTzdLgGpFaSY+T9qRAOOoaw0MJEa54/X5
 v4xFORwS215RHK+c3k1PuWwhZ9DnEsxFmWGRoKeg/u96OlKvxYqRZsRrMH4YDR7gDW2S40+Iw+n
 jS8auxH174HufkAPItTdtdcE9u8EC42lmkGo8uq5VZXmUNt61BcBAIKyJmV/4Db0qVEBH6whnNo
 xuCJxQCmMTnCLAIOOnh4twtCAa/6w9hCjY8Bz/Prut6aDrp/XJ84wKmuwWldRHKmw7N3bi8z2fC
 OfRoYcKRjNt/9Ch4nIQ==
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab2fd21 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=qC_FGOx9AAAA:8
 a=cOr29_qJNzhy3HpcGCgA:9 a=TD8TdBvy0hsOASGTdmB-:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: crR_SegNDvtfbhPfzOhvqr7-IEM4W3mz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX4FKb/buscuwY
 2GYcpcKsYB0uQvt444GDVI36gJ68pj1Wj4+P8pUITgA95U999Bs5Tt90uomCtaBmoJxMLOVJ3ev
 4RhU6jUS4rexf/U1CmNX0ufhcPwJbz8=
X-Proofpoint-ORIG-GUID: crR_SegNDvtfbhPfzOhvqr7-IEM4W3mz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220301

This patchset adds support for audio on Arduino-Imola platform which is
based on Agatti SoC. Some of Alexey's patches are reworked and sent
here as per previous review comments, mainly on the dt-bindings part.

Base SoC-level dtsi bits are picked up from
https://git.codelinaro.org/alexey.klimov/linux_next_tracking/-/commits/rb1_audio_wip_v3?ref_type=HEADS

Along with these changes, add sound nodes for Imola, a clk fix and
defconfig changes.

thanks,
Srini

Changes since v2:
    - dt-bindings/mfd: switch to properties.compatible.contains.enum
      with required: compatible, per Rob.
    - agatti.dtsi: collapse each <&q6afecc ...> clock cell onto a
      single line, per Dmitry.
    - keep qcom,sm6115-lpassaudiocc / qcom,sm6115-lpasscc compatibles;
      Konrad Acked staying with the established practice.
    - defconfig: carry Reviewed-by from Dmitry.
    - rebase on next-20260917.

Changes since v1:
    - updated various register ranges as per documentation.
    - added a fix for sm6115 lpasscc driver.
    - updated commit log
    - fixed various style issues in dt nodes.

Alexey Klimov (2):
  dt-bindings: mfd: qcom,spmi-pmic: add compatibles for pm4124-codec
  arm64: dts: qcom: agatti: add LPASS devices

Srinivas Kandagatla (3):
  clk: qcom: fix SM6115 lpasscc register offset
  arm64: dts: arduino-imola: add support for sound
  arm64: defconfig: Enable configs for audio drivers on Arduino UnoQ

 .../bindings/mfd/qcom,spmi-pmic.yaml          |  10 +-
 arch/arm64/boot/dts/qcom/agatti.dtsi          | 157 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm4125.dtsi          |   7 +
 .../boot/dts/qcom/qrb2210-arduino-imola.dts   | 134 +++++++++++++++
 arch/arm64/configs/defconfig                  |   2 +
 drivers/clk/qcom/lpasscc-sm6115.c             |   4 +-
 6 files changed, 311 insertions(+), 3 deletions(-)


base-commit: e657a464aba873f5eaf3ca821b6e4016674492d6
-- 
2.53.0

