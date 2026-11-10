Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794305935;
	b=z2zyL3ef6Dq87iGpJKxbEwtpnMJHU5Zz4NXsmYNrsfPeQ+WVI/Qwb0IVmECX/vs/4CuF
	 AGjubfoZm4HIKEK/HGv82wCWs6RxVgzllV5nu/xrYUiEeGlVrlLHsdZ5Z3wazCE4guCgG
	 t4IbUJYulu6sDMw/hOo63cT8PWM+6F4H5AGM/rRzN5ZOIrVgm6xd+TM5797KK/2drnaYa
	 M7baCdexiLbrwtsa4qqXUoNhXspi4sFNUsznwKt2bPA2RDlo9w7n8/FdwWR+XqA4iLtlk
	 UUZcLF/xQUk77TauLAFNFOH9Vd21MJB68cW9GWOaBXBptG2R1TulzLm0xVOq0yi8bxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305935;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=I/EFu7Fs/aroypMjEq5BPl5EvpaGvb9lezW04r2LTCE=;
	b=BaFLBGJn5Xosyaud1U2kPID1rBRktrbzosFrFIeoQLsAuDXovq+/N6QFYoMZfJLsJYGV
	 piBa+MUGvje4NJlYaiZHfEdijbyxpr4FJlDEj/L78czZAN4Lo4fzY2hl0A7Pu0XwB26aS
	 z3RrFLBT7odnfbSBZAZ97fj7ClxgCqLYNfSKWJkAAJ54KcWGY7bjdzwySAc4O4B7vwAyM
	 f7+4MT3Li5KbsZ9Eqreohcv6WpTZjxCwlnqcMwYO6c+fHVlZEt8+jRmYwXP/PhyKudN9m
	 pB8VkXgHdyTp4uvHUsCOuwM1jUn6c5Mj3Fla/Kh3LU2l/17SIA37/mFpiE85HUOnwaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xgv2aIeX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H0hhAM2B;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CF2606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 10:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18CF2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xgv2aIeX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H0hhAM2B
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8W3Sr2833613
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 10:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I/EFu7Fs/ar
	oypMjEq5BPl5EvpaGvb9lezW04r2LTCE=; b=Xgv2aIeX/aafN7Ei/rMWPqmcw8/
	1xTLyJHBiscFRwYSoOsDxc9RZeUw7seu03C1GVCqSyzLLgRqvzzVuBMaVgNOsaR4
	+A765VBXjklqNTRJPO54YRoR5LrFjdqGAwEmJt3ICm8H0yEAFKOlSYjhDiqCqumy
	IyfycVeSYxFxdTQAUI8ghyh19PeziFnYaWhejUdrSc276ZLEWAqimz37itX3B92t
	vzNe9J+labWkSN7nGVQvRUE1Li+QUcmm+U4IAiJ/3S7f5Q8y02cttfvq28uXTSYF
	hpPG1EWgvRQNQ7UxbDrheFwch+RaQtbtZkjAJkU+12DjRqp0dJCFThgEgMQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufrd4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 10:18:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so392919385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 02:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794305933; x=1794910733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/EFu7Fs/aroypMjEq5BPl5EvpaGvb9lezW04r2LTCE=;
        b=H0hhAM2BSin6OoSYGbeHKUNAqzlObCheQ1XOkBXt5UGMORq7RJByImX54Wzwu/67x5
         tg0H0vCX/uuJFAd95L1ECdEWLniFt7G4NSkzed8/de3+zHBM37kFnVb7bnzj7a8V663M
         8klFjzOoJuoaLkEqn+Lkh470xDNoWU1I6JIO1brrlJS1rvtB53e5RLJG8fbP2oZQdh2w
         Sq017FP+GAgFJzcNFQPAvssfTfY2ttAqXCLsyfAxwydMEvEy+Qu8hVYPBocZ75dN9jJk
         u0ezET1LA2qfVN8McJpN9ZndQ3a/0Sfpr5DsHWt4PyQUUzjAOkiyeeieZNnUJmmf75km
         CdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794305933; x=1794910733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I/EFu7Fs/aroypMjEq5BPl5EvpaGvb9lezW04r2LTCE=;
        b=OI4wo4N+K/NC+V2Oc5Pdi1pIMCbeQ/RLX9THXgpvj8VCjemr/BzGJnY4els8HYO4rl
         7wcLYhLFtYs/VoWM2IkL5kdN6j+S4ym+mHLEuHotwPg3yxmXdTEyzIlBY29XLDi7pOdK
         +0coUGcuJPstPMKXTt8Sr2WAY/aDfpbOmCE/t74/upCeZFvQwSmeG8oKt9usUbWLnyN7
         MOLFgMt3nuUEwXGChy2dXz8I9xrujjm+BbBuHXx5yx3bV4I9PsOAwiwrWp/b1pGI1U0S
         Y9Yr+ne4139I2oNvFcFcXpfqkJRYuUFDTxEf7SKmKLu4vHPnhZDcSHpzsZDiIiFOwv1z
         gEiw==
X-Forwarded-Encrypted: i=1; AL+hErEvIkExc4Ln+Wmc0ojRhqFFMOAhJ45uQNRANKScgzLa0nWg8Sw0FaZuDCu8l0vTdStc70qRqwoxBIT/qNv/@vger.kernel.org
X-Gm-Message-State: APuU4Z/ddfJb90t4P8sWc0MMzQSATkVeKNdIfFyMYxMoHPv3F7IqqzUP
	AcJsU5OfANP0Lc8YP1ZRVsXandND93qPm4vTTysdEVALMnPWK+jCJfBllYnU97XKcsrzKGHWphA
	TtouScN2IgUXTzyJALuji+90cyDECswc/1yntfdZ+vwtk7YzaLpX+EV3QPUtVtJ3bm4t2
X-Gm-Gg: AYBFou203Qn3kmVNoXroqrUdiMGJQn1/eLLyyD7ckKKYFYJ2ntb2N7rU+q4DmoZFVwQ
	z9p6q2U/C8Im8o9v40vvBguK/I+fCpJiBmXEtKKlDpY8ZJMPyuqOHfIauvVbEG4RmrXITh6D/nJ
	hciArzavXm8UNV7xHJ1W1tRIiEWcWouXXZdSRnHGvt3Ou4mnEsmsk0Z4tktPYwrY33I6ZLEVpvI
	rr2k23C5eL3+cJTOyY9jLsdMx2qLijdhexM5pnAIv01eDDMSfTPit5lVhVAbPQsOq+u4Dtup0ZN
	03buyoCaSzvEkPnl2OTEluxf7Els0zR2Gzk0dX5RCpaeHTFHR+VW111sP4rwOi4YshmUjAfs5FX
	oeFIj6IrT2ycD2kLxH3VlqnR4IKZg5IPH1MRbUR7bEVC7/z/7vcfC28V6g9bq7tetLHkp6/pqIQ
	==
X-Received: by 2002:a05:620a:4593:b0:93e:6c4f:bdf1 with SMTP id af79cd13be357-9479f2b062emr334979285a.17.1794305933388;
        Tue, 10 Nov 2026 02:18:53 -0800 (PST)
X-Received: by 2002:a05:620a:4593:b0:93e:6c4f:bdf1 with SMTP id af79cd13be357-9479f2b062emr334976685a.17.1794305932853;
        Tue, 10 Nov 2026 02:18:52 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe2f09sm63168165e9.4.2026.11.10.02.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:18:51 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, loic.poulain@linaro.org,
        loic.poulain@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: Re: [PATCH v7 1/8] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Tue, 10 Nov 2026 12:18:49 +0200
Message-Id: <20261110101849.3768125-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106133143.GA2705755-robh@kernel.org>
References: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com> <20261106082522.1448390-2-atanas.filipov@oss.qualcomm.com> <20261106133143.GA2705755-robh@kernel.org>
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
X-Proofpoint-GUID: thS_BOPcbQHj9l91rSzt4_rTrnpzGTkc
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af2ef8e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=cRrya0eItvTHvl-yL4UA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: thS_BOPcbQHj9l91rSzt4_rTrnpzGTkc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0MCBTYWx0ZWRfXy1rdw21f28ZP
 4Tmjg+xAW2XxnP1/JmBxrbSBbtlgqZN6cT6tAGiG8uz6JF5+ifJT4GmRT+QaveXeQpEis5kQuZ9
 Yp2/cocZLgoVqQsBcNvkun/jSxqiU4o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0MCBTYWx0ZWRfX5UHEq32dONhb
 gUPJIpw6RaWf8BZwKp2JKU4qHHdMX5FrPpvn49z6bHNdCNxglNdK53D/4td3xJxL7IXy+Lzf7Og
 Ve/mqUODewjxjZwSwBGuKdyttL+KnDnylQLcL7AOebofIRJ3e+lEWzPWSfBSNWSi/850VQraGsm
 Pd4yijcdJhqqHDQ3Eva175tVi7oQ5F03EeW+wcy4Em+huQxPTAmnPCUK9QdK1WWKGL+W+P3W7YG
 dOT1Gq9bOfTDAQPCo2YRKlmc2UR8nwY6k/PsTZDYjLBRIbaHW0MdZ+1EvKWWT6JN/aHt0GwPDeR
 IcNzDiVlXslnjauTPEUWty7IVF2vei2dKJUxjg24b1QRE8qTzOBqGp/UqvbCaiHyu9Hcp/+FHFB
 7t7mkb0hKpCHogtRp6daYH29nbNOan5G9ZDWJtnvldm6FSfmsGuuholKhLVUorh27/lUDGsCr42
 KQxc4n2WStr0R/nTmDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100040

On Fri, Nov 06, 2026 at 07:31:43AM -0600, Rob Herring wrote:
>> +      - const: camnoc_axi
>> +      - const: camnoc_axi_src
>
> These 2 don't sound like clocks that are part of this block. And 'src'
> sounds like the parent clock? Use assigned-clocks for parent clocks (or
> just retrieve the parent from the clk api).

Right, camnoc_axi_src is the parent of camnoc_axi. I will drop it from
the binding in v8.

For the encoder, camnoc_axi alone would be enough, as its memory
traffic goes through the camera NoC. The problem is CAMSS: on SM8250
it sets the rate of camnoc_axi_src directly, and a rate range on
camnoc_axi does not limit that. So the driver keeps its minimum rate
on the parent. In v8 it gets the parent with clk_get_parent(), so DT
does not need the extra clock.

>> +      - const: core
>
> I would expect the main clock for the block to come first in the list,
> not last.

OK, I will move core to the first place in v8.

Thanks,
Atanas
