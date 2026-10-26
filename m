Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009933;
	b=fqoHWDaY+dOJCQgNoAe05wMEuOHnQCb2zDM/smRy9/nQlnSzv9/MKQCBuqFgKK/jZAQX
	 xmPVibxlK9Dd4ponl7Ldn6CtXlPKTG/2R14LI9YEw3bigUAdQf3Rbi6WLXW28EOz3MSsi
	 tVvbEgYLtCyIVtowmYKNyafTk/gSR6m8Tbisknm8cCp9i7Hap4CYbA7LdQJqn+0BXdcfs
	 4Zu/ZFUw2rDr+m8dc2rsk10xLVpYkkXTBhTQdkEY0RcQBAQTmi/234uWmWxDpEXMf7G3s
	 7T0DKB2jDADWRxjrTmqv4Xz9eNeaEYD+tdtVmY7GccP2hTUcbYFzRVp0B3WysqQEsUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009933;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XGaYi+CsERuIoATe1YOs5CL7UhAoUUf7A+yyeWfNMes=;
	b=1lhYSsrkbtUbDYP0bs/Key4xoxsDYIZI+UljMo0p24Mrite1q8pb5jJ/1WFUrmYwz7JJ
	 Kf9Qr2ldnQOxioD6RjhBvu165P3IdvlOR/ErnX1NLu77ZCWjEwlzCKqKNDGe4hTniwZsB
	 0Y89dkWEjbw7MSDrwm7j7j8aOSVRiqkE8jRLV06WYx+u72v658RYB2+kQAuqRTloRwF4A
	 w1aGM0f2vvAFhrz7bBI1fdz5lUf2xrcS3UjQTLWRJZebmUULS6Gs5rvdleNr1mGlBW3Yp
	 o32LHFTUDYOD+P9/ZoFHnWTobsKw+skqWhaVg3I4rwQYOQnrVCuJQsDkx2XzdMBoPIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="DcN94e/+";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A3CbiXdu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22E3606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D22E3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DcN94e/+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A3CbiXdu
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aVba1708697
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:18:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XGaYi+CsERuIoATe1YOs5CL7UhAoUUf7A+yyeWfNMes=; b=DcN94e/+5R22ZwDE
	2ZXIXdMrZ2u7Tc7Q/T9KcG66KQUrr6W72pJoRHTOOdl+ZM93oqNxR2qPxYBFlIS9
	qUJlV2Kb6LPwPr3Pcsuv8MFyAGS2G9lkY2SE9ZauIHmXOb06AWS20dpAugMpFNLP
	ocgWi3qWOYHUGR6q8Cd9ZsBygvQXX8Rha9NoWu7bOvIMHlhVwg2Igh0Tpm7/elQX
	3MZ529TjU6WU0KivVvLnap+BbnvErNDPhVNXmxoz2Qt6ArZxPqv6IbvPrir0FsW4
	XgDAC3CBi4DcPQDLp4cZ4TTZjrhQP+IteVVMYZz3hgOEGaohgi1ief8o/dmAAQ7e
	pFxjVg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjd9yct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:18:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1440e081so36287385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 03:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793009931; x=1793614731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XGaYi+CsERuIoATe1YOs5CL7UhAoUUf7A+yyeWfNMes=;
        b=A3CbiXduKfh1fqXKtJ5sDp9FkuEcaQ0lXEA7753RcIjdX4izFdif9biqtFdxDuZcz7
         MmzMmUF7tPFVJm9zHFiiidKLEZhpoGs2dAaomjeHI5MchUt2wZ1K4z13nao/sfK0+9/F
         hNj+HEUyBJsU8EJOH2P2Tdey7yEoge/lJH+JMSixsXFlqkzcaSh7MwVJ3LE53/cpqY8J
         ox2kfpDgTMkVQ1AgYgFZWcKTjquZfH6DGlDtORWqFaI4qG2r15V3uh923fzMfc63IVBx
         xb7alol4DGjyh+ziJm5Kgzd05nwi9Z//TUCi8oXUlluWm+36rtXco4enBhn7tKJfYja0
         NyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009931; x=1793614731;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XGaYi+CsERuIoATe1YOs5CL7UhAoUUf7A+yyeWfNMes=;
        b=dwBSIMtuv+HCixVpfuqKF0Tu2hr43qQkUyJbOBTRMSnlQlofqWqbKOR88cXcmEcWm+
         BPFxsIZb8g5rLruE7QqD97NM9khF3UFAfTogICdgCpvyOafkBfV8J8bTjEjOfpxAD9g3
         u3Jbt4Ao24nn2iN3RLWDEzzbn0PI4lFtbN6emFluY169Jfr6N0zW9JBD43K2Wi2UFwyE
         6WauymiIci4R9RW/1XlJuegpDKiKJYLMpaQkYoARRdKrk8LvKxWeNNlTrLNNFy0r54yP
         VCVb+o1MP+TxNYoeRIw6D+h1avmtQIjm9eWz2nswMcruogIWUj0UFMA7jEvltjw23dI9
         QfSQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8QERbuo0kY1zKzcb5bVgLYcIfDrJUvXuC7rkYowzFvH2s+6HDJ6/4BIib3ayitxpi8gVaVPiRWAA9YvH1@vger.kernel.org
X-Gm-Message-State: AFq9FYIxHeO9d0X6u919znzEs2dxELdPpvlGM9uEUM+z4w3iyiAmYYE6
	fx9qMDGvlB0qQeEElzYh4YxG8rX4f2MoIFhqC4n5lQJ/yRZCP5eWsRAEyi945H5Irs6tdxPYe9m
	mRI7iAcS70WoKBRy9kJweeRaZRV4uVQ/R1l5yF6aPbKcIQcrL3IyTxN0vIW+uuaiIexFv
X-Gm-Gg: AYBFou1dp89RAO6bycg77x24W5svJIYs7ZlnzjrQM47Q76QpgNHKoqj1+LxMqhSD4QR
	rWSwdtDBQ6OMAX6e+BnSAvpYFf0hC0lIkpLws0BM0rcB2VgY4MFgHvNkqAqkR0R9parBGEGB4rx
	hOddRhGXjKXiBsQ0QI7VrhR2vtDuiX4G+iAVc5HpEYeaeX60njARTfX+I/QIAv6BeJrQEqR6ITB
	t+SnX3VplXVQ8GQFQ4QmV5T2BZELovgssnwg2QvE4YAhKVB5TSNN9GFwDR93mRB6vih4HB9F3q/
	eYXgBmpZw8IcdleJe4o3V32N+rhIECZ6KQ375p7uh0xblKh8NIfRbQt8I1jeNI7ew1etweZH5oL
	A5PsfO15YJProEFov/Z8cyQ==
X-Received: by 2002:a05:620a:7302:20b0:93f:211f:7ba4 with SMTP id af79cd13be357-940ef945ddcmr917024785a.5.1793009930991;
        Mon, 26 Oct 2026 03:18:50 -0700 (PDT)
X-Received: by 2002:a05:620a:7302:20b0:93f:211f:7ba4 with SMTP id af79cd13be357-940ef945ddcmr917021885a.5.1793009930552;
        Mon, 26 Oct 2026 03:18:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34f874sm306584266b.9.2026.10.26.03.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:18:49 -0700 (PDT)
Message-ID: <fd712bf4-6854-473c-950b-5e0fabe1947e@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:18:46 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add Motorola Moto G10
To: Michael McAllister <me@michaelmcallister.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1792840208.git.me@michaelmcallister.org>
 <1e50fab3692cc285621b2ad4a674dca79e5391ea.1792840208.git.me@michaelmcallister.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1e50fab3692cc285621b2ad4a674dca79e5391ea.1792840208.git.me@michaelmcallister.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FPawpzBEZb9deYeAs0BPUXSHoq0waNZs
X-Proofpoint-GUID: FPawpzBEZb9deYeAs0BPUXSHoq0waNZs
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf290c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=JwJ85b4fAAAA:8 a=EUspDBNiAAAA:8 a=uu7B1lnH_z2CDsybQgYA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=qg2vb7sgHZQYDKbllo_a:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MCBTYWx0ZWRfXw0Rtggo8fcQQ
 qkeZZzNIWMUXoM946rhqezTom1rMtE6DMIK2Z5pvC2KCs4vH1k7aoQsp3E8sYL83sx1WdO18pRv
 w3hWfa9FCPndWxK3mh9nPSpCwD2fE0M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MCBTYWx0ZWRfX/ScCuOOO4Z1V
 I2wdlef+XJkE5TkSVbk3s3wUqQpFQVwVNyqzglG+65CB/bCXJqsXaRQW0zg5wQwebjyZD8ap0Uk
 M9BkUZKq4mKLxvpMymyJdkWTdEtE/7JHyS0axIyx5iGKQRsve6K8gtS2nS7H9t6rv4wt0LlmltW
 MMJz8HDztuFnhPq2+4Q+ZV1q/Gnkp/Zq93fnQw15gkne1jeRoW+gVlE+U7+eG8funcYYulNqdYi
 fL/QaOYBnfyl+BUI+YxFqEwO8Acr6K82nt7fO4cAjb0s6qeo5YgDzEbFjbApEtNzWESdXOl3PVZ
 uCfDh2HOJ4PqiZ3mdEimOLWjgQbxwT9iPaoVeAmuUQlPEBshWj/fLrxRU9BebJ4OFK05bIJAoCR
 Y5EAGzAUbE8ZlPlLRab/wtTC2mcb7z/6faKdsZ6BoALOYHJn0qGrsxP94j8ilULr+lW+V9IksQN
 5yOObn10RnUg4tqkZmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260040

On 10/24/26 1:10 PM, Michael McAllister wrote:
> Add an initial board description for the SM4250-based Motorola Moto G10
> (codenamed capri), including eMMC, USB-C, buttons, GPU, Wi-Fi and remote
> processors. Describe the board-specific firmware carveouts and use the
> shared PM6125 and PMI632 definitions. Put the modem, ADSP and GPU firmware
> paths under qcom/motorola/capri/.
> 
> Use the firmware framebuffer until native panel support is available.
> Retain the GCC display AHB and AXI clocks and leave DISPCC disabled to
> preserve the bootloader display configuration.
> 
> Leave Bluetooth disabled until the WCN3950 shutdown fixes are merged.
> Panel, touchscreen, amplifier, sound-card and battery-monitor support
> depend on separate driver and binding submissions.
> 
> Signed-off-by: Michael McAllister <me@michaelmcallister.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
