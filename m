Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893393AA4F8
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 10:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368927; cv=none; b=tMhc3GxMkswhTe7jq7tm9tspn87aaduqQgMRQOcVcRamfJ7mLJpq74tJOaRyt4ePdySN2IgXP+etABd3oMVumF0FEyCtYGSG7TrjkDex5JHTsQqVQpo+c6V3bLALq4xLrzL99QrOkOedtJcEkl5y9i8yIYEkd+Vt+0pKLZaCHiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368927; c=relaxed/simple;
	bh=ykhcPrrbeFy+nNEr/jpSJsH0A4nJvqK4aa8osTz/xXY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Fi9GCtAsJzzkpgfWREYhvQ73VGWRnelyfkJjYHzi0caSMBGV1V2oEg1CGreAQgI+VWm0RA2gpxQNU6lVYtkb7fAEwi+UVodS5+RnEKVUJjO56nz1Crox/MUVdjbFRTxlSOW8ol5J31VkGYfcXCxPHIxuRFP2rcufQUhj4/V92b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JJk63ZCW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvnQRmFd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJk63ZCW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvnQRmFd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jY0B3810943
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 10:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qJd8c3YcS/jWGwlUkQ1NCk
	BRZMwGD6CmRMTRMWeTdPw=; b=JJk63ZCWnX6obCkxRwKCbG9eLXvvy69Q/K32r6
	FXCp76zClHzNC/W1YmrhyYuQK4IEmoDya1Ce4/hstcLYQ/dIpoIHHhhNvsOxoVty
	hRHUMwSGby/WZRC2w+8lpB8CEK4hk0ginvddCbgXKmQV3DbVvGKGtp2eFW0CqL6P
	kUoLMCWZnFIhmyMwvCJ/u9zMXWoKh3wiI/uvJwZePJlkrUyswGw7/VGUNBs0cNIV
	/orQOd4MF7l1ptg5f+un4Gm4YiQY/wXYa3JqzGgPqVHmIUvc3wMx9G+tLSjh/TnP
	486ioGkRmK0zfkiqHZYi2CRRzFbUKzAvtFbhe5eR0OVm6OVw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5gvrrsmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 10:28:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e4ade8670dso52771975ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 03:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791368916; x=1791973716; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qJd8c3YcS/jWGwlUkQ1NCkBRZMwGD6CmRMTRMWeTdPw=;
        b=cvnQRmFdeBzMcv0omrc4M8EsZvF6ra1xkU3bGnLnju2Oaq85i49qrJpKS4SW0yqahQ
         y+dw5x23X/xHWKB4k4tJ6ZA6q96jdgypWO7PEfzAxncdTp3yYqKztM0YEtLCMaEjsRCx
         sDmY4K7nnUvGWSqWnrAm+C+E7U8tulsjlPPvgAcMTUsXsDst1v6JFDCQ6T+puN9IP5Ge
         9ph1kMSMt0B0lpIUwv5mPhYdLBGuNVKXGxGZpZL5H+P+vzv06ZhTvMlV6NdNpmFX6e+2
         GcRzNOOHpTGDcQTbqtsW1jwxqqtqLdrlQ/gP2iZcm+anq8rCgWB37aw93e35fAg4pCMN
         7vbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791368916; x=1791973716;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qJd8c3YcS/jWGwlUkQ1NCkBRZMwGD6CmRMTRMWeTdPw=;
        b=0OQ13UCPE6qwgaYTp3yP+DME0YCfFJvXbVTP+diO5PkVkavbQNUSjKpv84s2p3hV6j
         pdoqFX8z+p3dqhv5SFnmCEx3Zo8Z0ushX7gttTk4aWqmxFlliVQUS3ZbjY3E2YsY35/n
         QNOhAR8G5MOkwhl+YH3SOFpUZhw8N5NJ9H1Gj6fMgdjHLxJyH/gPqoKqHJx3JBdC37wG
         KTUPzlTaoPyz+Bda0RCBB1WVqOGKVBm9+xFEpU3PEG0yJ1v/niI1wxmgFsQcLwmvieTy
         Qe+yDMQiLs8Lmuf66JjBau/AX8G1mqnxnBIjsrfRMfi52z9h/T8FcCcWUhKirozgfw8Y
         vXqA==
X-Forwarded-Encrypted: i=1; AKwUvBwDgKVcJ+X9vzRHZcQDhYi1JTBg+KwhHjMaXn2hskRlkNqE/vAMVSqENIYXmRCxnfPwhbGuAfCvTFt61Wcm@vger.kernel.org
X-Gm-Message-State: AFq9FYI6RJwXVyGcqoV94sYga0326Zovyrn9/oDv9Iqa93kosSL26wq0
	+mO/qrIumQlKTqvYBUrgpBJSnSeIhXVWQmJcnCfGFi9q0f/vRauvALfb2NTfAFZP1F+7/rR+rzc
	IhppV038+Tgps+2ok0+tXV/klKXEEz0tvlbGZbZO+vSDet131CejUv9P8Catssims8ki0
X-Gm-Gg: AYBFou3UP+Xg2Ubm6TADJGfRBDJ0X6NE+WeYum1na9Eie6G0wAvvC1Kl7AiFsjN8ORm
	bDHVBXaSyA0bdTr/6mcKAQa5Iqk9OSW6FyofrpBfjvK+HONNhK4Cjvbn5B81CJ2YHfSrFobSJhq
	q61BvOwNBgn/v+JL9amH/X8dR1g53pVQDNoLVOqWKmGerIvqfr2+KpE9P+YLEvk1k/w6dgj769F
	b+UVQ41bcrTbkVmLh59UoAN4w9fa3TkJ83DOeU58S5vwHApuHLMNkcEwn0otFWsuym/+jbCq0L5
	Hp4fzYjtfbsqwSY0iDkQF6MgpLZ9384nOLY3KnDILnSzJAYzS2mxh+TtEPwEjvZEObPYA+eX/7/
	HuE/i2P68xU4tOrOazI9WdmD8n/1jodCZ
X-Received: by 2002:a17:90a:51a1:b0:3a8:c0cd:57f7 with SMTP id 98e67ed59e1d1-3a8c0dcd0c2mr285658a91.23.1791368916202;
        Wed, 07 Oct 2026 03:28:36 -0700 (PDT)
X-Received: by 2002:a17:90a:51a1:b0:3a8:c0cd:57f7 with SMTP id 98e67ed59e1d1-3a8c0dcd0c2mr285649a91.23.1791368915689;
        Wed, 07 Oct 2026 03:28:35 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a8cf2b69sm1221334a12.8.2026.10.07.03.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:28:35 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Subject: [PATCH v4 0/2] arm64: dts: qcom: glymur: Fix fastrpc compute-cb
 reg values for cdsp
Date: Wed, 07 Oct 2026 15:51:16 +0530
Message-Id: <20261007-glymur-dtfix-v4-0-31f7143e759b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABwdxmoC/3XMQQrCMBAF0KuUrI1MJmm0rryHuEjSsQ3YVpMal
 NK7m7oQEWVg4H/4b2KRgqfIdsXEAiUf/dDnoFYFc63pG+K+zpkhoIYKkTfnR3cLvB5P/s61FKp
 EbZUFZHlyCZTrF3c45tz6OA7h8dKTWNo/UBI8X1nVRlsgqqv9EOP6ejNnN3TdOj+2eAk/DfllY
 DaMsqLCLYHb4B9Dvg0BoL8MyYErRWhdKTfgfhnzPD8Bz2IQ8zcBAAA=
X-Change-ID: 20260922-glymur-dtfix-6314526b4b02
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791368909; l=1874;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=ykhcPrrbeFy+nNEr/jpSJsH0A4nJvqK4aa8osTz/xXY=;
 b=R8AdO6T5D4uOuzoM4i5eqCgiEViZPN8V/RpmXDihtqOw+o1i/IEgeieJKdcFHlkCHs6su6iKv
 qwPyaLRSPK6Ap1LGJg0SWMApZ4CDqtVVcM8KWGLz39r//I5d6OlNGd0
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=W66txhWk c=1 sm=1 tr=0 ts=6ac61ed5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=p04a6VuR7GaqaFzguDYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 9YpCWxNj_dqyr6Taj_iWY27ew-5hQV6m
X-Proofpoint-GUID: 9YpCWxNj_dqyr6Taj_iWY27ew-5hQV6m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX7xe3gAuZ4ss7
 ZChhU12lyP9XAw7rXp6wMOShr4UCz/Gs+W46INAH5zJwZC1qQyH/YV9u4vWUMCo6Shbe8KmSohV
 HKMMyvFKPUthflGlMV8V/K7CBZOB0kqU4UILiyZ0qlpF+++IAG9iwGkNS+mOsz6t9a7tzfkEAGy
 jvjZWlEIzRSqCL7KKjFfebzgz4HzjNwJymmirCWBPoWNzE5qUJcF/LwQZGiBb+rIb2slT4wq2MN
 b7072WEZZJp/cnScJkP0C2KiJdYnifoVMXt5JW9F9rVCY7yqn1Itk2hvY9SuFvOQTwQgNK2WXjB
 SbtKYjXTyjG8YFZn5pQrl/Jzn93TaK6pLPVvPPUjfQ8PNNK/ogtFx4G1V6yGcurW/HnM5ds0Pkh
 PafBJ4WPZYqsL4NjFCyBohgNQZ6NxQAI5SlZYeOj3ua6ZS53r8V1sx6lHIDr5OgPLLuXuugMVxk
 E1yU+nR6oNldBOzPOsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX1mUDzciJKNZM
 EgyKxZwrxNkQwVJsObXYh+Ja1h9HR9rsdGBWUNO0INsmZH3ILznz0/Ikv08WGh+CLFLuR1Z0Gu4
 mqml7bRPn6mhZY3e9Uh7qXg84PCLC1I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070041

The reg value of a compute-cb node must match the SID (the lower nibble
of its IOMMU stream ID) it is associated with. In the cdsp fastrpc node
of the Glymur SoC, three compute-cb nodes had incorrect reg values that
did not match their SIDs, leading to SMMU translation errors.

The fix renames the nodes to use correct lowercase hex unit addresses
(per DTS convention) and corrects the reg values. Since the fastrpc
binding's patternProperties only allowed decimal digits in node names,
a binding update is included first to allow hex digits.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
Changes in v4:
- Change [0-9a-f]* to [0-9a-f]+ in the binding pattern to require at
  least one digit in the compute-cb unit address.
- Link to v3: https://lore.kernel.org/r/20261006-glymur-dtfix-v3-0-44e2bc5370c2@oss.qualcomm.com

Changes in v3:
- Add binding update to allow hex digits in compute-cb node names
  (required since unit addresses must be lowercase hex per DTS
  convention, and the corrected reg values >= 10 require hex names)
- Link to v2: https://lore.kernel.org/r/20260923-glymur-dtfix-v2-1-a4b1928e0c72@oss.qualcomm.com

Changes in v2:
- Change unit adress to hex.
- Link to v1: https://lore.kernel.org/r/20260922-glymur-dtfix-v1-1-159da6b0eed9@oss.qualcomm.com

---
Ekansh Gupta (2):
      dt-bindings: misc: qcom,fastrpc: Allow hex digits in compute-cb node names
      arm64: dts: qcom: glymur: Fix fastrpc compute-cb reg values for cdsp

 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml |  2 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi                     | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-glymur-dtfix-6314526b4b02

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

