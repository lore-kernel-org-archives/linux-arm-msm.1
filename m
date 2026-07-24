Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D2E449EC3
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 18:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917509; cv=none; b=ZeS4iEW61g5ru4z0cQIJMMAbN2bpfHJjzTx6leGIhSQY90z8GGXtnqu4ffscQ7xQz9tkVKjRyuTPwpkk7/WAOSZ6V5mHijLC8pcrbWc6yzdnhSZyxUgZVzV0WcCAxEHipAa26XGf2d0pd5WydqP5K5vnbzG0YNEICo/C6BizLNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917509; c=relaxed/simple;
	bh=fd2gjsHnk17kRZ1sAFPqzCllwBcOgpoNKv6YUrTU9yo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=UTOp+tCLMQYYYbNg4ZoVEF2SoWT1OKj1T9pM0Kz4n758mVnwmOUP1zYkkcMLyhIx2F07RThA04wrWAStLd4PgeNkK5Bt7SHXmdbeEAyOuu8ackQGKZyQ9XFqGdTzZ7d8g4n5meY0ivCKb8g6WL3jM3f5aTMkSc/N+CM+CPsY25A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E0nA0Q91; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dwN6sDsJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E0nA0Q91";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dwN6sDsJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGqHbK3377416
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 18:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=i9y6oQUtbxwMV5JsskFIGn
	80A43nFpcz6ggSbUuDykA=; b=E0nA0Q917jIqwUp2xB9GzC9q5cW8Y0r8ZudaLA
	V/ucJbN9ZllSIoHkECxvsj5EkcVn7nPvnfV8PUioB90beIAiAOPceFbjksxMHyJq
	1JUJM0dPgg47kAKnGuxCP1YgT9ysqZlrxOis5hYTQMwZdmolqr+/CdbYzvqWdf+8
	Nys+kPbRL91DUwGevvPWaEbpn3PKxLSJ9i2c4G4BkjwQf61AMOkpPHKKHqLAAO6L
	mXwUIygwkZ6mTwyd7guMN0/H2zgS9yVNCr/xeqH2dUBPFwLArMOAtlw/OOpV++UE
	8iI4+y+/+G2Smi1DhYVNjyEvs2MVT7g+yLWuxIXy2o3hZpVg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cj96tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 18:25:07 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso946932a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784917507; x=1785522307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i9y6oQUtbxwMV5JsskFIGn80A43nFpcz6ggSbUuDykA=;
        b=dwN6sDsJCrppShe5q/Sjn1fs2jPYJ4F7Id2Y2D0QcdJ5phosawZ2z7IPiEIlhRGGZ0
         GgAvOX457Kg4ruPtaQXu6z0Z/hdGTEi8s/uPMzNKAQiGzffMGGmQWK+94rkMFssBq5BY
         ikCZ6nAK9yITfhTngoAgb6JoGvFGBOPbl+f7WRVXbSe5rv844Nkniak3eYB3dDANGYh6
         y9N2oi/OE3vTlKV5DAV06K0g+jC4Dho45Mdz3tAI4aL6b3fb3/TWFqJkZeCeF7UMFUk8
         9n7lSYwJ/ouvC0y9zNj6MO0E97piPIZP1vKAuAMNynay3DyMntMrzD8krbIUQZaBIll5
         vFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784917507; x=1785522307;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i9y6oQUtbxwMV5JsskFIGn80A43nFpcz6ggSbUuDykA=;
        b=TQWGDnD3aQsISkQkSqszwbLmaU8n++2qCsoGX4uFcVhqjG5rdPvUG/X/243fjbJ5r6
         8O3HxOF1LUgP1Nk3qrlkp03hF3snKf+rESxHjZWTHnuWVwFOgu/mggHJiPev7Wa+CjLy
         wDimcnVWL1Tjrw+wpWlzmMXxBd1a2+MURViGrsjb6aYHA5znGTxTAu5KP6xlsJCQn8xy
         O9KhwiuTxQVqMQ+uo24yd0KiWstLMGlQNld//qL3ktaEwMLJ+jwzLzCVqPaXekchdgb2
         1y3AINP6XviQkqIzoJ5320L2dxTWQ5yrvpmcwIeE3L1nS9DUe3qBKZOFiGMGw72wAiIS
         u8UA==
X-Forwarded-Encrypted: i=1; AHgh+RqQQwvZsM1oYKSBXM2DfG2FVQsaTzmIQeuyE2DOPTdhIBibfANBHrDyP50M6t9x5y66nvY7KwgXHM4dsoCv@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu2MHd9DcJg0uu7EjxhtSLLBkZP266K+wzJAsdCOqVMG43Vvl7
	I3NpnPKtaj4jhFLV/TuSOd5si+FLbODMjuv38wcTEyd5QKIX/Z9NcEy1Epllz/SKEnhJMw7jkq5
	AEJlF0s5SLv3zwLnZMSb5AnwsbySkqjpPCI0PXawIGzhllxbUWoBJ5geIwfF0Ot1Jp0Yc
X-Gm-Gg: AR+sD10EGUSCA2j2AFC5AHtYsSgwjdQSFqUKhDg3UWXJQ2gCzESJoKL6SDSxtLVJdbk
	zlfOMjQ2jR7JtJS+5AwgUhyA4I3TXXK/t2QPjdF+x51anDRRSqnBs4qCOdOmml+5h4O4jFDcotX
	EUUZs9p+2201TdW+26pTtmbUuQX9yVwLJDSQp2KBd4nq4267BgTH24paAzzwUD1w/J5xjsTWrVu
	863aSEn4q7SWRE1EcEJZbVCZfMoS8/VQ2E/v/Xwv2TmWIDRypPeAjRGjEA+Ue44IaP0Sl3nmxFS
	Kqz0fYy48LU7yPMgB4K4qiHyYUocEZzqDeTz+mR7nx9CiUNJsHpndiujLcKDhT0f190w/DeSccW
	RwdT7aL1SWazI5Zd40LEbyA+7CCNKhCpi9LkS
X-Received: by 2002:a05:6a21:e0a2:b0:3bf:e2dc:bc85 with SMTP id adf61e73a8af0-3c44b1ca809mr9520156637.40.1784917507188;
        Fri, 24 Jul 2026 11:25:07 -0700 (PDT)
X-Received: by 2002:a05:6a21:e0a2:b0:3bf:e2dc:bc85 with SMTP id adf61e73a8af0-3c44b1ca809mr9520118637.40.1784917506739;
        Fri, 24 Jul 2026 11:25:06 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5a67f3sm1669324eec.29.2026.07.24.11.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:25:06 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/3] ASoC: qcom: qdsp6: Add MI2S clock control
Date: Fri, 24 Jul 2026 23:54:43 +0530
Message-Id: <20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GJE41ONK c=1 sm=1 tr=0 ts=6a63ae03 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kcwWOOnH8nsvB6J9kCwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE2NSBTYWx0ZWRfX9h/5KYBONmlF
 mVN02+gx55jfYshqnSkqgZGc1z9VJalf67dtTQGftoEW4lu0FogBzH0Jq+yl8mrwyJXI9ueiZPq
 jWQaMX5xPpeDgkGQk/UiM3AytN871SdSFAg7tlY+XORS+eu7lFykD8z90BkeJGWsfAfSWgHOM46
 kxX1kNTdcOfKxwrkQ48A4y4obwTFQUJan+46rQSj4YXho7697+m6yLUSl7U1baHzNJC3RDh96Ay
 1Kn+vasybP2JUA5jwYszMPKWMEsYNfJ0UpQ1Pd5S6APfWY7sjNeCKik0h9E+UcqTMr5n7lXiK/U
 pNtKQMptoys9vsrsUrA6sCGWRTPNnkMoyMzOf3f/8WO2/iIpX+QW9LqNkZpyg9DNKCUPEiTo7ft
 FYzb8E63YbrOhLI95XoaPiuw6NWeo3rJO4Ql63GNgGYYaJg/tdzT0pKJF1rmOoO5jRewI5Kaf9i
 0fOs0X8UArOyiY3G3sg==
X-Proofpoint-ORIG-GUID: QW43yDaRWN8M3Y7-4cgO9B9GDnfB68Ce
X-Proofpoint-GUID: QW43yDaRWN8M3Y7-4cgO9B9GDnfB68Ce
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE2NSBTYWx0ZWRfX1BPwoXONfbci
 c9tNRv45a1pzqP3Bfq2TTxNks0df+TAu6pFpNfzEWEUviDxGqGsUsOBnXgQRL8XMsR7/GpMNDQg
 J4/Ja3w7X6X2KlDm3iyEJNFQwMaiImw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240165

Add support for MI2S clock control within q6apm-lpass DAIs, including
handling of MCLK, BCLK via the DAI .set_sysclk callback. Each MI2S port
now retrieves its clock handles from the device tree, allowing per-port
clock configuration and proper enable/disable during startup and shutdown.

On platforms such as Monaco and Lemans, third-party codecs are
hardware-wired to the SoC and do not always have an in-tree codec
driver to manage their clocks. For these designs, clock line
enablement must be driven from the platform side, and this
series provides the necessary support for that.

On QAIF-based platforms such as Shikra and Hawi, responsibility
for voting I2S MCLK and bit-clock has moved from the DSP to the
kernel. This series introduces the required device tree binding
support to represent and vote for these clocks from the kernel.

Enhances the sc8280xp machine driver to set the boards spacific
configurations.

---
Changes in v7:
- Addressed review comments, reported by Krzysztof.
- Drop ECLK handling, which is not required.
- Link to v6: https://lore.kernel.org/all/20260720160226.1026440-1-mohammad.rafi.shaik@oss.qualcomm.com/ 

Changes in v6:
- Addressed review comments, reported by Krzysztof.
- Resolved all sashiko comments.
- Link to v5: https://lore.kernel.org/all/20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v5:
- Addressed review comments, reported by Krzysztof.
- Resolved all sashiko comments.
- Link to v4: https://lore.kernel.org/all/20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v4:
- Addressed review comments from Mark Brown.
- Resolved all sashiko comments.
- Link to v3: https://lore.kernel.org/all/20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v3:
- Addressed all review comments from Mark Brown.
- Fixed OF node reference handling, clock configuration, and sample-rate
  handling issues as suggested by Mark Brown.
- Added proper error checking for DAI configuration APIs as suggested by Mark Brown.
- Added SENARY DAI support alongside MI2S DAIs as suggested by Val Packett.
- Link to v2: https://lore.kernel.org/all/20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v2:
- Added a detailed commit description to clearly explain the need for this change.
- Improved the machine driver based on Neil’s feedback.
- Link to v1: https://lore.kernel.org/all/20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com/
---
Mohammad Rafi Shaik (3):
  ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
  ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
  ASoC: qcom: sc8280xp: enhance machine driver for board-specific config

 .../bindings/sound/qcom,q6apm-lpass-dais.yaml |  50 ++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       | 168 +++++++++++-
 sound/soc/qcom/qdsp6/q6prm.h                  |   3 +
 sound/soc/qcom/sc8280xp.c                     | 251 ++++++++++++++++--
 4 files changed, 450 insertions(+), 22 deletions(-)


base-commit: 9eebf259d5352b87080d67758f483583d9e763d7
-- 
2.34.1

