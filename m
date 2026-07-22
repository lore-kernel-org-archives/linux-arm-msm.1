Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E8735DD1C
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784729903; cv=none; b=HhE1e5ykEuFswxNPiF78ZddlbcpbNN1X0otqhaLLVNLl+yOCVMbEWhdvUSwIBe72wPcJ2did77TqIHvATOPZQgSN6Qy5LGgiRxAxDwh7OGGHzJ1US78GMTi9M4hoRI+aDZGSQV2Sjy6nJ79q8i6UWZBIE2yq8HC8qCPV+IxS16s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784729903; c=relaxed/simple;
	bh=t+gVF74D98ZCDGk1vuLKZwAiZcOamvsPyVqq7gP3p24=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T8db3dtLwVOLnGEbqMK347BObHwKuJ6V3y/H9UYol/g+QNsQCxuWWK01iv5i772VtoumG43k+755uuxumrQWdczQPvov30CR4w8Sx47n8VvtkR+eHF4e8TKkZDmGdJclTaC5lCqFpnUl0+M8GUyNss30TUMermiaOnT2Oxb128A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SirqkLFt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G4dbV6xV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SirqkLFt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G4dbV6xV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWRRn891398
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t+gVF74D98ZCDGk1vuLKZwAiZcOamvsPyVqq7gP3p24=; b=SirqkLFtXIR9Iowe
	BH3jtpl9RT+bK6ccXAMAMnhbPJAEotABisW6Ab9FUmeakqqMPa7LCsrY1qlGJp3P
	XSuYPa6qqkN3Wqtuct41Ts2scfzMXCwEexz4BY0tGhkysCtywkHX4Y7YX8YGfZWJ
	bEA8GrvoGXriY0G61xScGc8k3OToMIvkc+o1KmEhhNUX5jpJHmPX5W3e/+mUUxLC
	Uf2mFdGj49jYlYGnibWBRJ3IiVepLLR1cI25QDHViz2UbGz4gsm0uqLVAIexwPUZ
	3om5ho0J8ObUB00vjzNV3SGiTYLpkiQPuCWkFoeadZYR+qEpkiDo8TrupuirSreV
	9JWcRQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxm10949-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:18:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c7f385887bso306591915ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784729899; x=1785334699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t+gVF74D98ZCDGk1vuLKZwAiZcOamvsPyVqq7gP3p24=;
        b=G4dbV6xVN5nhRL88fkkJRHAUDC+nYr735IzD2CwI4j+uADMh3VBIH0qI5xi5lodtLa
         m/q5JE/tQhz7SYO5sH9jJde4tnNakpk4T3XY+EknCah4uYMST/nOLoKSQLaEwvUJwuN9
         DHXm254zUTWim2jIHO5No1m+6Ryhcx9/SAuUbmpOtS9FOe1ZakRQReQ/fjfhGOsttlZY
         6bS6wE2BRG76+Gt8AhBdQiIVlWzdKAkd0SjSrzzpz1QyDb9gL7d0rAP1UJzSlnM2d0tM
         NInq3Zkb8HJ+F7FsaRtAS8sv1KvMtjVIuM2hUMULpZ6+XWGWZHyaP4ZzSuiBmnoXqLTZ
         FZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784729899; x=1785334699;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+gVF74D98ZCDGk1vuLKZwAiZcOamvsPyVqq7gP3p24=;
        b=Jc05muZkpT+gL5VPWoZXbjSCs6xN+bxxLOCEH50YvMgccYx6Ja60arRjYy6+pQ03lx
         W5dBS1MEj/GV7nox7jqZEaj6UgbH7+01DNkrxaUNsARiRcprjAjzvp2LegWU78grh4iY
         GLALEaGZx18YNpvz3OUqlN9zHkoz5DIA/pwG3o3pQb8YrmgL7DDbeqrDBSMwI9/LbRbo
         vLua/QMQhEWyXh3CuJprCGaYP7g8JFdAkfspMK9VneIFa/O3psPjclAVrFzr3W2mr6RH
         8aowdKfGyn/A93JycGGCR/uUjUkhx+8HrlAAVCxQdWdFj9qynzMErLAT83Vfh2zFYk3L
         +gPg==
X-Forwarded-Encrypted: i=1; AHgh+RojJ4cqiPt3e4KdHhws9YHqgqPmMvNct+26lPtemcb1MrGrUJSgjOHY2B4Zxk4f6u19rI+042tnQziVC9hX@vger.kernel.org
X-Gm-Message-State: AOJu0YyDZ/m2YDlXtZc8RpN0uTc6s5JG1IlBywAEXx9VOY3EuMMuZg4c
	fxnxUl7FvMABx0zl7TxnqcZjb+Pa2LO1KSXslix23RSwB3PitY+uZJBZg1W9bscGFzLp1jXA8H1
	ujDHOjDGFz/0guxLklqZRLSsU9SPpttLn/ldDSR+CAuTMExP+tEt0hWJTV+mjese43Hvw
X-Gm-Gg: AR+sD13MBJmZQIGADsJJzqearuquB36isq/yutVif4cXKlZjQT2mKKeIuyubDmNdpg1
	hPi7Wcvgie5H1/E9YK29Ql3GwVbyorYKOCg/t+FBXRS9dJzdAKJXRQtrDX8jMj5D7jrLOKoQULA
	fOk4XfrOzVk+DbuYoHe8gQzi5tBbbcLrjZv8G4pfDZcYwrHIi9rzvExArFbQzogBztYMZMTYQd/
	i6lUcI1KNCY7/o+CFv5JAtqpEaGgSIU+b6TbF/80jhg60it4lgs46MZ2YMxF3pz0vfFv2Rwnqyr
	SqBFxLFECHc8dOOp7cuOH1EJ4T3Smp2vQgpAor0N3fnN3YfxuZvjMW7ZFuSS0v4xvbHpklBmNSV
	2u53EeuE2dZ8QTgVbdA==
X-Received: by 2002:a05:6a20:3886:b0:3c3:b628:6d17 with SMTP id adf61e73a8af0-3c3b62871a1mr16436341637.25.1784729899210;
        Wed, 22 Jul 2026 07:18:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:3886:b0:3c3:b628:6d17 with SMTP id adf61e73a8af0-3c3b62871a1mr16436307637.25.1784729898704;
        Wed, 22 Jul 2026 07:18:18 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a689sm10768990eec.4.2026.07.22.07.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:18:18 -0700 (PDT)
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
Date: Wed, 22 Jul 2026 19:48:11 +0530
Message-Id: <20260722141812.596004-2-sarath.ganapathiraju@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE0MCBTYWx0ZWRfX6JyIV3r7oUGg
 BypKD5gcGYa/aKxRdIbBvpcAA/cq8K2cC8RAmiU1IqxQUeyNfza5qfBHBhnv/QIbluh8xXo4IOy
 4BHkFzS0v99mf/rBCm1iySrNw3y6UWM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE0MCBTYWx0ZWRfX+jb9fKF1ahju
 TsB+QjXFplRCVR+RhSCMJdmp7ad+orjKtte6EnM1nYl2zwqBi4DWe6gtwWq4101Z7YhyrfxPhyS
 JPUGIgxbtCgsl6FrZ+MqmpUdr9TxTbonBZL9BAGE42o1uPr4BnQVmusN/JnOD34/YLMOkmFVnia
 m0Gcvcqie7d8qXljnL1Ov9eyte6txrqj/nzHaJi7NJBa+nPjIbppLB9uljeaP+HlgQKEa8ymC23
 sxXzY1ieRFF2Z6wbZC4/oyf9GsrPPYft/t++u/0MEkpklsavc1GGDHQe7UlG/wiE4URSm8/YYXL
 OT0kOi40kFHmqdnwKn8SW2q7N2bPRcVJJhacIfXvLjS8PtxOF4wAcZAi+HXKXH5RlCOIEGNAz38
 IkzykF8ESlR6y64tjBwj61X6zvaVhqeSQsDCdO74DYF1vhlsh08Gsb6WTDvc1OTjFMJTp602p3a
 iGM3e1xEZSIBR8CZhBQ==
X-Authority-Analysis: v=2.4 cv=Rsv16imK c=1 sm=1 tr=0 ts=6a60d12c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=_lnWTncF0BVR8YGM9z8A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Vs8tLxUSCDCRexf2Yl1uutbuqpt3J40X
X-Proofpoint-ORIG-GUID: Vs8tLxUSCDCRexf2Yl1uutbuqpt3J40X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011
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
