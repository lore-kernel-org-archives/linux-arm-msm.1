Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F95426CE05
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784729926; cv=none; b=gVZoBzdNfv2dpn2e5xu9kXEzR6rr52/vDZ4UBhPygS8d3ho1Vw6c25N/WFQvynr7XfgmxY/XhrHG/pFj9C2+7VUF8fuRxMdMjsxH2szWfA5sn2wJLjVIDQhP5ChKaIml1CwL/ANoxJgguweZyaEgTrD4v6XP5UO4EpsAilWLIng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784729926; c=relaxed/simple;
	bh=uMAoAmVmA75k4uja9IthJA6zpWfioazFl9+7uS90M9k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K5km+9d5HsYx1xSuxR+xNcG8CfHCO5Sc8lACTx0kW6UPwyNh1cBzoY7Y4IPbf9dLAaHhtOyc6IJExci5ZwjElUB0vzzvhDvYQgY8CtT7NrQ7CXME4BsuBzzx8f1EZ7mjYLwckyhOOtIo9TKtPUGhmLHqFcCRRSJNBI+XHNUsqK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=or2/ckZ+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NS6SynXA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="or2/ckZ+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NS6SynXA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWrmJ755498
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SIxpvHHV8Rw0FjxpGQS93XkRykIayd9oYItU+O3kyQk=; b=or2/ckZ+qSLsojk7
	CfhlUJVCNesJDD2GUsadEhs2qIBxRBwLoTnbwMK/GTjihjopeael0Kn/JAL7ND4H
	STy7WZmLYbyRbWJraci8TSUg5mN2ufdtlmJ5DesXqLDAATZANMdkQBA0EKJ+SF2/
	+P1piz/Jmg5O0/eNJq8BPU4S1cZQESsDaqNdewzUBeG7Sxw4cqyc/j5okmszhp4b
	FmvgttjbInbobyskP42AwY3n7zUchAXptXl1yrDriCoionA0K0dKkbtSI/MYELEU
	OrCn/6SH7ogv1dQaPwehnznjvdfdo8Vg0J4FPcQURCL6hM838kCR4AZpvXAx+4xP
	so6wBg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjnu4tjbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:18:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3811279d51aso17251456a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784729924; x=1785334724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SIxpvHHV8Rw0FjxpGQS93XkRykIayd9oYItU+O3kyQk=;
        b=NS6SynXAjlLeO9zFLC6F3DeqXNRpJqc8VaKLk+r+XpQexmec3HjI6DYGEGW30R6+Nk
         VE1CSBEzpH9UywxPFVzPCLfvRXIS4BTQlBSuRHwg7Cg71Nqvh3HwUtumCSotE2jSUnIQ
         XGkSSPz7CscfRDDUfE8tTR73gTNz2wafmklDtEgki7edqNGCjnQZuSWispXtivLZzm9L
         BOON7mbHwaUKQ0+TGwi7DYXDTU05z2dYx146Fo24t2y+QT9nBAW0Stoq6DQwfDbvyXxL
         PDDmsnj62wUb5Fwg+22ULqau9xfpRZcX0nE0qJrugkhpx/M0+yFC4b972JQZSNqw3QKb
         E+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784729924; x=1785334724;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIxpvHHV8Rw0FjxpGQS93XkRykIayd9oYItU+O3kyQk=;
        b=Vba968p+yI44w/DETVsT1uxDiXVNafyRCdlyf8W4MIoIXZwxYQQAU+IuSVlXt7ATfz
         9oxgoVscohy5oybaKCDY6ACdyB9thsXTLOFPdMoqEFuQtgpsDCujcoXcxZVq4qGodP4z
         ffWUGLPAM/9B8BpIHvVlqvCTxUId9pQApB1JezAB2L4/Hm0SOq7jVb2m4rIGnZHv4wRK
         vumUQtUWpmpdGu9eXlwXlnG+EDEUmSXdyKg5fgeMu/5o8yRvGR2kPlz5cYJvRUxDSHRe
         cBbfDfd94ju3yos1/HtTg/ZywRZhaB76Zc5QoH5FVbih7ZLst+9eKdZs0ZRz7ZL2Qnl4
         xtSg==
X-Forwarded-Encrypted: i=1; AHgh+Rr4l+19fQ+yG9LKe8nsHbOKk2r0ymh+pg8o+QDabDX4wTEXSLq3DPJC4F3Rj1yUz9vfw71IA4CuqN6FIdPS@vger.kernel.org
X-Gm-Message-State: AOJu0YwcCw4SGehRA2vSGJu753UvNqqqPIKWY2sgT8uFGKnWS196/kiR
	U/twE7KMnvkvfeKw2CSKanHPzuSTogcT1/GBj2hU/HKP6WQicffwKA+7aDEWR7ZDUuLoEeVC9NW
	4blZ0CJywLC1DJFR/qIck2I7BQGlFlssgz/JWzlvaWGywT40N20WX7O2Rmjyx+ESg/9Yh
X-Gm-Gg: AR+sD13w/UJd2C/9qv0xNEnafL6drBSryHrSTt4tviHKiteshy5P4as2WqKbc+27KLM
	nHXEZl/y878r/X8HeS4BSpWI9xwgPRa1LRiyQpRFuF+WmJApOmTFTIv8zgzQkl2ySV8f1XI0QXT
	hRNtybEDW3hsN7u131RtUnav/gP8kI4WDXh1vsq5cfiEk1AbjQEghNfv53EIZ7AJ7kwIbn0QhBA
	j+M4SgQTLlQOQevMcJJ7/QcYwuzu+DYTsAoyRnzj9krtcFonDR4oxzuMTPzx/toTxeUKM48xrMR
	yvmPs9UYn9dEQA/kbIhsvKqRMmg7jjLv7dZA0Ec4PVNuBDjPAB38ljvkR893K737yRLxcbW7Cwd
	9dOwu7hUn02I9PdcQeg==
X-Received: by 2002:a17:90a:ec8d:b0:387:e0db:3faf with SMTP id 98e67ed59e1d1-38e4b5f2031mr23406631a91.40.1784729923546;
        Wed, 22 Jul 2026 07:18:43 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8d:b0:387:e0db:3faf with SMTP id 98e67ed59e1d1-38e4b5f2031mr23406565a91.40.1784729922900;
        Wed, 22 Jul 2026 07:18:42 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e07000fsm19256670eec.21.2026.07.22.07.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:18:42 -0700 (PDT)
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
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: qcom,lpass-va-csr: Add HeartBeat pulse clock
Date: Wed, 22 Jul 2026 19:48:38 +0530
Message-Id: <20260722141840.596101-1-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <e28077e2-dec3-4e75-9aac-fecea3f260cd@kernel.org>
References: <20260717-master-v2-0-ae200627ad62@oss.qualcomm.com> <20260717-master-v2-1-ae200627ad62@oss.qualcomm.com> <e28077e2-dec3-4e75-9aac-fecea3f260cd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kU_UgEjXkJd7dd7AuE9DxYDgpsA3L1M4
X-Authority-Analysis: v=2.4 cv=KLhqylFo c=1 sm=1 tr=0 ts=6a60d144 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=fneZuzUJNEn-4h4bZk8A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE0MCBTYWx0ZWRfX+X8JTCt25qnP
 YUX5rX51dOo3KRKko7I7oXfCl8l0QBsh2pwtp8HaPTCloeOhhJUfTWRvnvgN+PlPwEFpTgvg7NH
 OGIEAUFKXYUCT1VuRcpSbVAnla+KnyU3EejAz1M005TPYE4KafGjl5Z5KfQfhjuLutftDvVkW58
 dkcBdnu+DF2xQRJVxUJvtRTwM2+j0ZW73aYC01wtG2kN8XLAzmmp9EoxOS5Kc6NTxmYiZ3aRmH8
 gSmLKFmA7nDAT3fs1kjU5IygcnUo/ZM165m9DCRn0yhxQHJ0wGYIn4WGBiXPB/QTrttRs9ekP5L
 Rec5/SToI4OIINR49rE+uWEMAtNn2rB6fepfGPPEHKGaHLoj2XmR0fY0pgb3bUZUHJi10BRPeRJ
 gLPYWC2Ood8P8dQs9vjD+9FsnWVnSlUxHkfu1M7wVpIcKUsT6A43OXiJH5u916TzgXfb5OztGqN
 RRxiY84usW+r9jsaW2Q==
X-Proofpoint-ORIG-GUID: kU_UgEjXkJd7dd7AuE9DxYDgpsA3L1M4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE0MCBTYWx0ZWRfX85Un96L7AUou
 45e9fF2gqfas9oHMGxOFYMWZyQjN2Wl9GsgPF14oJJSKxiNSf0eb+S+JFmspZk94Q0kJnpYFCiX
 DXiOujypCUnctM460pT99yeBPB8Swnk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220140

On Fri, Jul 17, 2026 at 11:00:25AM +0200, Krzysztof Kozlowski wrote:
> I do not understand why a clock controller is part of sound. This makes
> little sense and desription does not help me.

Ack, will update in next revision.

> Drop last syntax, explain the hardware, not duplicate schema as text.

Ack, will update in next revision.

> Drop description, redundant. Why would not device MMIO address range
> cover full block?

Ack, will update in next revision.

> Drop description. Not even accurate. Consumers reference it however they
> wish and it is not any business of the provider.

Ack, will update in next revision.

> And this...  [unevaluatedProperties: false]

Ack, will update in next revision.

> Node names should be generic.

Ack, will update in next revision.

Thanks,
Sarath
