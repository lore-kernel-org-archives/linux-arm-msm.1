Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A0C45A2BD
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 16:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785515194; cv=none; b=vE+VfR4+TEu06lbawI3A8FI5Fuggdgs2eudhJMIk2HR1JBruOPynz2HlhztnUS7JpBaveQggoI1Izku98XDeGLolBSh5/CGx9G9qsTuv/dpwf6Al/F/PXgw2/HngGuE+o6tCqKqCMVNjR+Bx6xzFUJvCmK3zNm5N+ew3So9drTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785515194; c=relaxed/simple;
	bh=QjHteE/S2XIJnTaG8Ab3THuIR701X2igiibRc5mEgOY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jJguiUvssGAChFrHXtIbGHGQgWCP7YE5mjR7q/W3Y/azZOCIsz5G3Xls8KIsT0C8EkcagbRKRkyXxC2EnMzVG4effzGihbUUwXtdPptWjQTgU7nEVuGY6vRtPWChVy+KZEHrzFzF12jmiXS+DcZPujFe5GWNXBxqpYgSlwDOZ08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MgHNoN/X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RNv2KwFE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MgHNoN/X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RNv2KwFE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFNpR1700374
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 16:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pxjc3msrNjJ05g7Vh82ZNLNha1GtGxY2Kj2
	9qTjpeDk=; b=MgHNoN/XDJBnXhjgry2GX2CKRw5ywBDLoIxfh4FBFshOj5spWXf
	1579CsYeTU71sRLhqHxLaNFu03KaJq8TwXIDSJPZOYMz7xO1mhkjJZXWU18JC2UF
	POlhwMF8k7s/UgJqSlLEoSr4ltRCtXm2vTxwVSD15fdQqVvqw/grV14NYw7i4zI7
	QW4qUgbm5rB1BMu/KIsRYwDVqWmXXcMlXuH0/E4xys00N6CYsu3s3GtVIQt0FZUH
	BRSaGpMUU292ZDeji84h+rcmJTvN3FmWAUJAkleyL0zaAQ4ma+1f7o0dnYqWY9xE
	MoCHYe4SC+NAqOnpocM2uwtw2OSxIf4hJxA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru1u17un-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 16:26:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0199faafso11639791cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 09:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785515190; x=1786119990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pxjc3msrNjJ05g7Vh82ZNLNha1GtGxY2Kj29qTjpeDk=;
        b=RNv2KwFE389UQqBzuqRjlmocd528rLe6xqNflzTrqdjHCbQpxhxbL/rahpE3E8sWVk
         BF+F43m+KvdxXdJ0NC+dTHZqHQdfWhQ/xQBErD2MLKGfwmR3L1Fe4xh2NAuKwosRayw/
         sVAG/hVzjP/Vtgs6bRsRTHOKyluF+InNto6hZKeyTNn+fOcYru2my9iDOpkPYP3Gdm/S
         eCh+H7wqvddOHzPvx4wB3HLsmShHjZPoyElCtqrWjkB65V/bgSZhkkkQlmUDdLw5ArWA
         w7lnxo++VldZTKVLw9ivlO7hfRCtNDiQPSZJY+cZcp3ji3PnNFq37GBk1CHA4nkLcJHR
         T1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785515190; x=1786119990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxjc3msrNjJ05g7Vh82ZNLNha1GtGxY2Kj29qTjpeDk=;
        b=rVDKM4erHmjDx6dALhEoLNcOBzW+U4mld6MKXtpKAIK4Ot/l14/UO9GAGyD5YADoUa
         SwvXmiLbjzm2cAzRgdJptmjAyouu4EELJHik/lJs9qpPoCDIAnWld1Zl2I5/kGh7k7PY
         NYh+Zu5FO2ZDDyeopWaUWBvShlKAIfr8YOGsOodA83KGxaBn7RKunDSq76yFZTPiLwSy
         HxnpQ6SJU0aQiIZRaXVnr1OUL6QSWp8wr7l5r5z251VrqbCLS6L38VEDMgvRRIo/qELE
         9/OqzZlQ1lrZti8P5Z0GQ+HyaW9QgUOMMMqwa8II8LJHoQbXuYxMFoqC0mfVJ1mdk/qS
         5FNw==
X-Forwarded-Encrypted: i=1; AHgh+RqQFuIXxy7M74GvpgmNKKP/PjfRrLQXX1XtbLWvAeU0X0+850ob+0BAt/+orSeLf5IxdtsXtNYSIntuTrV8@vger.kernel.org
X-Gm-Message-State: AOJu0YxTFp2CZgzj/l//9v72xmVfIaJII/aE+qsLfgyE08p9NcazObvF
	jc/r5i6jWxs45/TECPCB+c+7f0LH6F0thuW17rb/KzI0jWK2JU5BcfUqfnpmrDmZQjbE8ILQ7Zs
	kKMBRz85voZTzx5hW4FPS9/flxwNQb1qKIKdb93s/Zch6t5v8i4a1q8OGx7mgbF3sRIvn
X-Gm-Gg: AR+sD11T6cbt9hl1I8JcXjEySQGrdFwAhqDxpzAhE65jSQs/8iBj2rVmHbyufvBxAzA
	nMkoVpXnK6R8jj4knVSvtKnEoZTa6IsnArD8AHuQLnOqI1JPtfQw3Bdfkct37JYiyPAoJlq1EOp
	rF6ObdYAbfkr9fwga2k5uSxDljJEBkq3wJBmwpkxJ5LPtFg+bgqwIeWTqp7rWkgrSMAvw4Hdw4o
	UhLjuvc3LGw4CIPB7L/B5ZwBXf7HCLPVXJaJ3fXXOr6FXFkb9nSTTlYwkvN3jTiHLsXjkUH5o+Z
	UJciHLUaVCkGpZz9l/mtlzqscFNrCV8ZaDQ8cQrh7xoK37UUgFdrHAnQF81RI0Hxnu674wSUhpR
	n3wFz0PhOkFzy4w==
X-Received: by 2002:a05:622a:1f8a:b0:517:8a18:7624 with SMTP id d75a77b69052e-52b5667173emr17920111cf.3.1785515189827;
        Fri, 31 Jul 2026 09:26:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1f8a:b0:517:8a18:7624 with SMTP id d75a77b69052e-52b5667173emr17919481cf.3.1785515189299;
        Fri, 31 Jul 2026 09:26:29 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm7084050f8f.7.2026.07.31.09.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:26:28 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hongyang.zhao@thundersoft.com, neil.armstrong@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/4] ASoC: qcom: sc8280xp: add Monaco/Monza (MAX98090) support on QCS8275
Date: Fri, 31 Jul 2026 17:26:22 +0100
Message-ID: <20260731162626.1588561-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H5vrBeYi c=1 sm=1 tr=0 ts=6a6cccb6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=T8MdWcauDMo65KOnN3cA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEyNCBTYWx0ZWRfXxIFo62MTfCAp
 JRNG5Swa4mI94J4ixxwaygL3DCFthoU87/I7JQbDjYK+V0j5yvFBtMvB1EPZJCqJpcbFoyvIIy/
 R1uaq86LjGK0C7Maw/MYN1Wu8hnnc8y6pt12kE9+0n8ZyeAq0ed89wXnO0VTc91btg5xsNmxTAE
 ftDmRyuSgi0Pl9Mhh2OuomclSl3r82yw2/v94r8JQraY/kxtO7na6AyQCQWEnw06Gj4BrQuaCVq
 GN10d5wWlK0I6dQXsj7O26xnRBlGIEaZ/uOYM9WHKaag//jPgeZpjTg/6qGLQdwP4kZ7/dtHeTr
 u1j+Bo0ikizkbBst1cp6TJWX3KMVD/vjhDCG539VojIRkxoHM5R3+y0Hg7oUOrfqwUGJwWWYJK2
 m5FZdYBRXUAi8EaEj6MdWDTB/TF/aGCcNSl0p6vYBiSXaB6rAiE75JNeJ1mIlKPkbx0Q024Oz26
 gdPE8NpyyzNBMj+MtAw==
X-Proofpoint-GUID: aZdnPvHplYVL0ZvCjmw2_gm20Yufz1zq
X-Proofpoint-ORIG-GUID: aZdnPvHplYVL0ZvCjmw2_gm20Yufz1zq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEyNCBTYWx0ZWRfX5cHYPpPUn2z9
 4lzaVKy183X3cpmeRRubXLyTwbn3XbD4MEfR2FwHV84kkm2K9zUhiNITFnxcKfE4rQDwbOPBtIo
 pvY11UKcduOSThQlU5TC7SCzC0ai1nU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310124

This series adds sound support for the Monaco/Monza (VENTUNO-Q)
platform on the QCS8275 board, which uses a MAX98091 codec on an
LPI MI2S link.

Patch 2 (from Neil) registers the LPASS MCLK1..MCLK5 clock IDs in
q6prm-clocks.c. Without these entries the DT clock reference
"clocks = <&q6prmcc LPASS_CLK_ID_MCLK_3 ...>" that the MAX98091
node uses cannot resolve at probe, and the codec silently runs
without MCLK.

Note: this patch has been posted to the list more than once from Oct
2025 and does not appear to be actively pursued by anyone. I
am picking it up here because the rest of this series depends on
it to get sound working on QCS8275, and it makes little sense to
send the machine-driver changes without the clock IDs they rely
on.

With these patches now we have full audio working on Arduino VENTUNO-Q.

Neil Armstrong (1):
  ASoC: qcom: qdsp6: q6prm: add the missing MCLK clock IDs

Srinivas Kandagatla (3):
  ASoC: qcom: sc8280xp: tolerate -ENOTSUPP from codec set_sysclk
  ASoC: qcom: sc8280xp: rename snd_soc_common to qcom_snd_soc_common
  ASoC: qcom: sc8280xp: add monaco/monza controls for qcs8275

 sound/soc/qcom/qdsp6/q6prm-clocks.c |  5 ++
 sound/soc/qcom/qdsp6/q6prm.h        | 11 ++++
 sound/soc/qcom/sc8280xp.c           | 91 ++++++++++++++++++-----------
 3 files changed, 74 insertions(+), 33 deletions(-)

-- 
2.53.0

