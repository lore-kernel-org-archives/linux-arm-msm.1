Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027526;
	b=ZnWTfrP66yZPXkZO+IjmtZ3UDkVaHrAaQlG4d2Ubz3MfLj3KxLpZ6WjQ9WmauhHvnawh
	 W5AZOka7evGiv8lja+yIxG9hdBbKm0WbcPNyRGO7onzpZuNdIPnirQTMBU1jwB9KBMMaX
	 NWX3d7h32mlmEucEf9dkiybamVqJIUJNx3J9P+iFFzqHn2nLxeQFbLfCW85Un9NEUvWVu
	 bIA9LdfVFpkknNyI4qziEpDOtaV8MnIf3o6ACPYL3XMv05jlkA6lEmwgzSRCb/3m/nKGu
	 Bey1S5Xc7RywZGk7+ppxfsbArOd4P3nBXAzFiWbVuFPoOlagG854W0t5HpDDA3QIgkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027526;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Siz2D5vkVqZu7iFgwk2tA7kIq5v4uUSOUjK1Fa1sAkk=;
	b=Ka/nBDc4nRSVZfx84JbDaReZP5v50jZkD2we6AF3sc872xSsQABjcO7Zo/ZBSC3cXhtE
	 CDyM+ApShmQMkksqfD0EUuMnDxn8zn9H3hBaC0V1UFRokVifZB3micceTfV4/yUkE/1/7
	 pMKxBpLTgVr0blXeAllug0vdHgCk3ZSX7azjrJoY3e3g8Q2v+uPEr0Mo9VFmlb+5MWVhp
	 BMPvnIXhkMAO+IX0+1ii/QK1qFH96Jmm3X9EhwGUIFHxQyC8+X6fnFaxEkdsUOTH8Pp9e
	 t8/Fc0utBnvAPciUTZncf7F2spVtW5NPxBPMkFmcxO+bRw3V6FQWgM7fn3QSrzPhM1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mefbt2FT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BeQel0Di;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4696606A329
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4696606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mefbt2FT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BeQel0Di
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvYOr3618547
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Siz2D5vkVqZu7iFgwk2tA7kIq5v4uUSOUjK1Fa1sAkk=; b=mefbt2FTJ+upAxLN
	veJjYdu1o+tJ9DEyyULCLvgjWnzeQ4HqySarcMoTaumrnuDxegpMu2/HiaO7vVoa
	hlD0/EDATR46YBTmcUzKQiWp/SjWY0wrBfpTF54+iYvLd0HK674EvvT4FTf4CH+/
	llKx/zkg+2rA3+mMU4wjaSuaGoT1bsE80Hdo09NYnZXoA1d9f4RpyblIrE4qfczP
	ntows3NPP5GEidW7B8k4AcQJXkUjuwS+QKI8Jblg797qaefN5K8syAqBo5UB+ARj
	a9ytIOEYtPDLlP5Mz3kMUDvlsi+JFjYNH0L2581wkkQhnrxnbgz/uileMB6/A3v8
	SXwQUQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj79xrj17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:12:05 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc0e22fe64so90343137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 08:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793027524; x=1793632324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Siz2D5vkVqZu7iFgwk2tA7kIq5v4uUSOUjK1Fa1sAkk=;
        b=BeQel0Di6yLoDXltTsS8fdXhHZHmjNg+0zOlfIBacjXcMdS1RBVmQp8aSh4ATXrjzN
         k3FSnEw33Bt8tr0mwx9BRatHAtVtgMy/vXcDCoKlGB20TRyrfs9Cgk9Op8v2G7CunQnD
         LeM4yN9KQxD/LjqdH9FH4nmj3lJiC+VwnGFIKknJxUuMO9ustAnclJiEG2FSThUuFFxw
         haYdhrfxf5EIx04exMSjs/yGtb2Jp/jPrQ3YdbPfaRT0n+q6177tZ+ftl+3Y7q7vMcSb
         c4Ij5pulfVk/EB0I5UDQolpAhLTSjAuh1CEevARb+uOS+KaGfXfEeT6N3HsDp1qpr9Q7
         FhXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027524; x=1793632324;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Siz2D5vkVqZu7iFgwk2tA7kIq5v4uUSOUjK1Fa1sAkk=;
        b=UlkDiOWZ3At/PqO7fxjy6rsIWNF5ZDjw+M8eihlNKoL/CSIiKND0xjVee+JGTET7N7
         kmm4yDnBivVRoIz36Fknu9R2DK/5hBVZUMZV9m7nsDckRi1luz6Qmzvyt5Yl+Q1QBaAF
         a4TLwBlkhTc1rRUqz5+REFdHf2URnCRjulDI1oZQfIk3Ramc6brmBwyJqK2VCPFwFdai
         T80saEiGsEpRmj+m0XvnuteZ9dZ2nhWXoARp9lqM4OGOYd4KlKjpgsDJvb6NNiP1WuXu
         PRj+X028hxzdQDrml+UqkhpO8UBvrqa1uEj1pzDopawJ+qYSLKWuSCmFKgxKAoajyPfk
         tHgA==
X-Gm-Message-State: AFq9FYJ6yxia5XjwPvh6QLSBRRCxoUUrzp2HwZjKfKtfy8rXWf4UTrJN
	3suGJSKCM1QOsrpRVj7JP2FqyDL2EmQuj+Hs2rpKyh614zd/I6BqLiG1V4KRdbc0UT1dOBqbbCz
	WIR8HoCKKBA4XtogWpNIHa8I6FxiwG8nO9rmzleAM9nGhAConybyGPjD3CiwRKhuOiKCk
X-Gm-Gg: AYBFou32bhZJpgpVcnelh1SkUQt9vmDs11YmuA5ZUIpATnrsWm1cHnz6NaMHqQh8iwr
	aAl4AczWwDD1gBCCxwH6+4puoMDON1v6wMnRx6UCP/RHJOdVdPuKGd5FjccdW7l2S6YgpWdqDxJ
	Ad416sWQfhGPIu8eMQ9hyaCzSKyCacHkvlvT0lPjkQ6nX91BZQVxKjirJ5qisEvw2a2/jEsT8wr
	KgwTPZvKrTgTkiyIkr/RdTYcDL+f4S737zXg4/bTUCZrNUfs3ImhUeERpn3XB1FR05JMaRnobD5
	Y+rB6Pd2KVa7W+9Ko8VfjpjKvYsUn45/TJV9VpfvvyVIPXKfgC0L4BmWB1o0VNaTfhX2z4WL05O
	5BabCzp/DTS1Oby4fGfdJJA==
X-Received: by 2002:a05:6122:106e:b0:5e6:6546:84c7 with SMTP id 71dfb90a1353d-5ec230f8433mr2339065e0c.2.1793027523906;
        Mon, 26 Oct 2026 08:12:03 -0700 (PDT)
X-Received: by 2002:a05:6122:106e:b0:5e6:6546:84c7 with SMTP id 71dfb90a1353d-5ec230f8433mr2338960e0c.2.1793027522944;
        Mon, 26 Oct 2026 08:12:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66c6dbsm327506866b.59.2026.10.26.08.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:12:01 -0700 (PDT)
Message-ID: <436398ee-4bae-42ae-9137-1a4d7d0582da@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:11:59 +0100
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
Subject: Re: [PATCH v12 6/6] arm64: dts: qcom: lemans: Add OPP-table for ICE
 UFS device node
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
 <20260824-enable-ice-clock-scaling-v12-6-09271f583dc6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-enable-ice-clock-scaling-v12-6-09271f583dc6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LZG2ugjWz05t2z6V-cAyJlMUAL3Xk8iJ
X-Proofpoint-GUID: LZG2ugjWz05t2z6V-cAyJlMUAL3Xk8iJ
X-Authority-Analysis: v=2.4 cv=FPyOVOos c=1 sm=1 tr=0 ts=6adf6dc5 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=xhZcOr--89cURCpmMK0A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MCBTYWx0ZWRfX87WsYI6GQoP4
 zVjCcSURPLOr3nkO9C9MUnKE/4pRnIsg0NfEAyyedcLR54bcoEGVMuy0+aPz88rf7FUb5aRdHvv
 A1A0GWyb5jb4ODk+3MkN6JtTpZ67C8Ja44B3KW81EIMbDU2g5EcMukk+3MRiDGc7cjpjWa/n8BU
 xNUIpG9dwyGAkm2vpwjfrxxZvSHf6dBahp1rBR9Ys6z9/YwkjqnM1St3mkF21wnpboNQD4Inewj
 5COy6ibZtMYwxjEII3mnWsbFPvHq81szOib0UseNypxfYmRrIyHpH+pFQ/dG3cdYhcwG7AZxM0G
 fURMtgGbkUfTcmdbnwQ73e5B5gSRRQZjWv4JUXbr2GCw7OqBj96Pb9SFgM3QqiiROFeWtByCGCP
 I24BqO2z4fTj6YwkF6XVYy0vjvEpFwRAlLQUnugE2XDvehls7BRTWyJzSuV0Aql1TGvBf/tqaro
 I8nPE/163NGR6rzjgXw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MCBTYWx0ZWRfX1JpGGRbEFTyi
 /YJVY9XMTobid3Wv8DmCCt27AuggEXbbr+s6HC5z6KbjCiQq6m+4xMJTwZsefDNE757Gyfo3LK+
 Pvcx89nwHh758WySOciPV98S9c4JIoU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260060

On 8/23/26 9:47 PM, Abhinaba Rakshit wrote:
> Qualcomm Inline Crypto Engine (ICE) platform driver now supports
> an optional OPP-table.
> 
> Add OPP-table for ICE UFS device nodes for LeMans platform.
> 
> Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
