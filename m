Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198B735C684
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784729931; cv=none; b=CxyGjmqsT5C68+r7yVm6QVT/iJMhntEgPY6Ab2LZ52+0TYrTTK1i5uzNAImPSTTOmp5HKxkf2O+Wp8h5Ld46oh8VBr8yanYk+mSH9QxwvJ15oWB900eG3Isx3yqGhnrPi8038Q3DSyPxAAPOdkaWYs6Ww0NXyy02mEL9Dy2XkqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784729931; c=relaxed/simple;
	bh=t+gVF74D98ZCDGk1vuLKZwAiZcOamvsPyVqq7gP3p24=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fqda0aX99OnFTRwLD6wO/c+RdKXr88QAx5r1+edAuaIQCLjAzIRrLwbtylj9jzqDsyx+YaZzuKKbiZE+nIj4xUFpfNwxLIF2NYg5MAh0mjichrbSPSvm7Pxz0D8LEF+RBEoBp6OgiG0EScz6eRizPL3whM8gUmDzhXgw7YEtyQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lSwt2t2s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P9TRBkRV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lSwt2t2s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P9TRBkRV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWUXE1027039
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:18:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t+gVF74D98ZCDGk1vuLKZwAiZcOamvsPyVqq7gP3p24=; b=lSwt2t2sbAiUA89l
	IN82FGl/dcq6AfXTx2vUdRPKGhw9zBVIr8B7JfExAPZUL3AV27MO6d5d8BSE+Sz8
	lVq6dEwUnNOnqqC7yaHrjtbOyiMYAvnLBz+YbE2bqOmajvshl31/E83Po4ZPoJRc
	Ys6tpnoDC+Gb75wKBBixLAs2APXtUBS1u3qOlIq/tbFfqw7f/AF5v+JGoJRbxx2Z
	WJ7ZWRbB+J4TqIWqh9HBubh5cxsKrXMdUbJjilAJA57qvOhKfFccLVr/LdepqFBU
	b/X4YLxxXj7PPSVAeJOAmOE0A0Ute71t29NxHCVTtbfH3cVhxBvhhLZkk4FNij87
	h5aKDg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjt799eey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:18:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab041eced3so15545533a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784729927; x=1785334727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t+gVF74D98ZCDGk1vuLKZwAiZcOamvsPyVqq7gP3p24=;
        b=P9TRBkRVZ+og8R4bjm+IwKrYY5mnUenWIbudpOzJ7Y/pq9nevh5u7WOREJY7ZNIgEo
         QSwscx8udvrAHNnLqjbwHqteXVoUsy99+qa7bjybpNLWkuEXREAmg+8FyG5xbPp/oF+s
         4Y32EpzeBcm04USYYABRO2aCzgL9CuEwMiiExECFn1PcDT6VOUS7DVsQ1OjOf6HY2rvp
         HPDXfmQXw7jkSazCSTjXu34g6hMgf3ghK5PgJjzjSraajHidUWuOZme+SIxsepjhsM24
         J7ZH1tXkM1aZ/QfWhR4M0oF4ebzResFzZv4oEdwWLTJK1S3NNlu1XOWXMLlEeuQ/Xd/p
         GAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784729927; x=1785334727;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+gVF74D98ZCDGk1vuLKZwAiZcOamvsPyVqq7gP3p24=;
        b=RyMhrs5r3LsMkzexi8CblL3H1PMnUleEwvdVq6d1mUyCyW/e9g2uKu8IKP4lswNTpt
         wmd2MhdElbtmJLw1ztzMcC4I+OFysugnRsOTnyehlQDb6n9EjwiBNqNhwJVa9My1uZMA
         EDZins01SDz9l6LZYBaYUOYiI99wG/DQG9voeek7f/QsXH7diB7O3rmlydeVlR4uB1ws
         7i8stdPGNTfGQfP6bEjt2a3vlp5pTBMeGtQM1sjFe2OrVb2GZ96zivNR5029s2H+GEdG
         Tl1YpgLkzKa4gTASke5XeUOb3KJOqu+Spru32x4rgMP89hT7L+s2f3mAepewl9G1StK8
         qTUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1HQOsbj4hsE1WJbWp0LT5pyfrWU0ihAmORGW8uapQ0BkW8yZyYzEl58dzZUFUQZVZMA9QMUW1XIcVLwfk@vger.kernel.org
X-Gm-Message-State: AOJu0YyT066SNwC7TmM2fWb4lRylZ2RE94HoR8zmUQAqXFHj0TnONIZH
	gwDBQc/ixYlaVaKUbyRH5bv8Olfls+yK0hKSq7nkxD54IfIN490wNt71PCLhkTEqaBRNVnFzuhg
	tqARsXxRSqH0aNpjWhWRYxKmLNRHD3Yqi1TcP+sa7MAW7MiobF8feigtwTPbilVEJbYac
X-Gm-Gg: AR+sD12qQNigYYPiAwhOu8JbKiZKRDYaPLCKANt2DPLFRZQdHDFRQxWlwYrzNPWylCv
	Cboc/lSyV3n9IWsirkhLtNA7iz0igce0opldJCz9HxgMOE2vBTF8QwBhMelE6NcXfAq7EV4k9zX
	pfXcQQXUDD5zEkzNSghziAsHWlPXdzKR53pvXJOA0CI6Q5ydBSI+s8ABKfeWdwK2xo/+17Zx0bH
	NczFOd8hUzPO6p31xE+OVAtlROZ0wm9PVim1jfLSfStCHzQWCVPDahL0gjY/Vla0gImhLVN3S2p
	EeYbpesqAvNDiiXD238rsQ17aFuD6tpmJGqBRH/0boZ5Y8p7+NBgrY+GxAjLAYRA9LtG8vlTk78
	1BohHwHr4lBvYEXPQfg==
X-Received: by 2002:a05:6a21:62c4:b0:3c3:a08d:5b44 with SMTP id adf61e73a8af0-3c3ad64aca6mr26199965637.23.1784729926668;
        Wed, 22 Jul 2026 07:18:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:62c4:b0:3c3:a08d:5b44 with SMTP id adf61e73a8af0-3c3ad64aca6mr26199915637.23.1784729926195;
        Wed, 22 Jul 2026 07:18:46 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1b99esm10084210eec.3.2026.07.22.07.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:18:45 -0700 (PDT)
From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: qcom,lpass-va-macro: Add hawi heartbeatpulse clock
Date: Wed, 22 Jul 2026 19:48:39 +0530
Message-Id: <20260722141840.596101-2-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717-resolute-dexterous-turkey-3a5bd7@quoll>
References: <20260717-master-v2-0-ae200627ad62@oss.qualcomm.com> <20260717-master-v2-2-ae200627ad62@oss.qualcomm.com> <20260717-resolute-dexterous-turkey-3a5bd7@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Sr6gLvO0 c=1 sm=1 tr=0 ts=6a60d147 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=_lnWTncF0BVR8YGM9z8A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: pgSFMrmVanhcflEL0LxTIJmpx4mgOzKJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE0MCBTYWx0ZWRfX6oXaMZMh4cl6
 J7GZF+FEAeWfVNDWQmMJLQSWTH/c9hMpASqPBqQ0ifKrcEnuruGZPLWk/xszIjsuOHxHzzkL8Ib
 bzlxC1DXpk1TM+V1gDBD4KxO3noLtaIPGu4dfZFGrRYVIynYtQk+yYUcb9qEGTZgFeQak1ZsAim
 y4JHpikG6SmP73Fduv24pGMkYHwL8SRbBVeETciULfKlvSKPvbEQ/4Mokha9sMBpk21ZnLas4ZY
 4b04/kfXYm7K3G7LJtiFJW6bGMK0nIziRsAXKgKRijoc38nOiKKtpRqrISoo7MgOFnGSnVDo5sn
 eO78Ji+JB8dqUb4KDFPTGIuXtn6Z9RoCjn6gBFVdcRBmFyMIT98S6wlBDwrzxTPYEvHtg9OZmzP
 ac4/zc/K62TdGH9s+J1+ES3Nt1kQIiKT78ReBRY+o+ewNpiOhtdFDZRqUV1BY7t244aS5f1FEIc
 din91Fpp53OpxJdMa2w==
X-Proofpoint-GUID: pgSFMrmVanhcflEL0LxTIJmpx4mgOzKJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE0MCBTYWx0ZWRfX6P98BsowzHVL
 T6Ku9m7TBORgelTWSAPQbjTVs+z547iNLhPDb9pVfCA6es5myp2WW+AkNxhrQHOFw1a2RYBwCUu
 XXZdGca0gKRdoTccR8eIylTaQlhPipQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1011 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220140

On Fri, Jul 17, 2026 at 11:01:15AM +0200, Krzysztof Kozlowski wrote:
> Put this as first entry, trying to keep alphanumerical sort.

Ack, will update in next revision.

> Anyway, where is any user of this? Please carefully read submitting
> patches (both documents) since this breaks its rules.

Thanks, Will remove in next version, as there is no in-tree user yet.

Thanks,
Sarath
