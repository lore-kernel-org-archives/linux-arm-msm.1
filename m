Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877FC49B466
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818689; cv=none; b=l9Ws8TioRhgi5SrVdY2DT7HA/80T36jDzgP9LJW15O6R/HyGclP3PDHqjyYScSJcFvnhPvFTSCrF/EoDXYgjD2NU6d/NLmP3Zs0Gw9zoMwbnQOnuF69vBgf7YMmxBCQ36bj5UnRXFz3BFDdnGWcKkMTBJ++FFDOzG/8A5WZBGOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818689; c=relaxed/simple;
	bh=5PKfdrYjfLsN56DURiYwbgMF1Kt9itLAG+LUUyOw0MQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=leWogqmLMXv78hLN/MUn6FY0q/fCOHzipHhhaxWt09FBCDRDd1spi1HcFl0rfonxyKxslNAmRmO1cV2mEAqxJNz1E+SFafIOrRlhQWW4yih6NYKsY+SZx+X42EBhKWsjq/9Yqe/va8z/JutDq7xhIk0pHOmVJ6IBxUKheg88j90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qhn+ldJ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QnHhX89b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qhn+ldJ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QnHhX89b"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0Auv2275884
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bpObNZ8wAMhmftHL6KQaRFI7Ti3lZtsbLDUSzPpXy9k=; b=Qhn+ldJ96WNWxtKm
	g1ji2rPtNBmQGlzQziQsYccZoJoASgnjufnbbswAWStZZBcSyVBgpT1vw6BXzeEH
	joKG/jiEIQdu0+a/n54tIk1J6qooOeCI4BWW5NkaDo13SVruYjmhtFqzwZDdU2Iu
	m9tXTWSGSZGHbywSjuAgi5O5uk/gXnF6YOn3edXDg/UtenQCWKqw4mrz6o5HXuWN
	qSzL0q5fQqFTDAwuoOqCTLpy8SLomQ/pSEat5icZ5cM6aYjMLynzZOVMQnaTaZKr
	mkTBGZ8kTaHVQmCrtOVXBYIql8+7kLqSYlF+n2SVhWH4xL6fDzEvghH+2Bedk7Y9
	emBaCg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq21p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:24:47 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5d873da8093so43668e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818687; x=1792423487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bpObNZ8wAMhmftHL6KQaRFI7Ti3lZtsbLDUSzPpXy9k=;
        b=QnHhX89btU9s/k/kfFjjwsGVH6pYCNba4AbVK0hKkgGH+A6GIvvY5lPjJiFlDGoWHh
         GASKF60KGlsuOecs70xVwm74O+MIUPo+ba89C7/nkTMFwBtJqvNUlgn8o2n59NDiZX+k
         ZOz4ZxSRUlenflv+UEoUZ2+unY+fbaLlLs1U98N7+02W6MoehnvagoboWKF9s5wTU4Xf
         gJRH/f7j24CRTuGTMWKR3HO/HgqFofli2y6DtR6m8ym7vHUxQigf94IrurqJrgWFocbo
         kl3T+eHgJUfM81h6qtTVJwuKzxZ+m5xMGeNZhni0ojfnqTA85n1m+9AB8tiOFmDGjlKA
         lBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818687; x=1792423487;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bpObNZ8wAMhmftHL6KQaRFI7Ti3lZtsbLDUSzPpXy9k=;
        b=fVpAXEtJ5aSNXjlc1VYgmnkhwQQ2nGCZ7BcgVEX1PfDzULsMnb8l539bYRal8pbinj
         1zmc8OvZU0cHsJ+bzpkCHBj+saKkj9HMd7zW8LViJcPlu81WKZLPZpUYI3SMLbyIkxDp
         99v+oTrHAdKjbK+3pI2DkVu+dFjeDfRbsRrpP79aKeWft/UAgzb9pDkJm1PB0VuQiizl
         y7axYfKkHhbMvebmgYpIdntozc0bdNampMyPOE/d73QiXNmgkC8chSnJ5988ZJoqKkT3
         YflD343vMjGYgq3qYfPCtcZMsYQ9N2gcrSlz6f17vA6plMudjCVJePMkgtAUeaYZ/o5+
         jxJg==
X-Forwarded-Encrypted: i=1; AKwUvBwpAj10MF6SBLIF29QtLlrIwI+Kw6wNczlsSQtkQ3DjtidpxM9nhywHhTC7V8hp3M/pgYycgllyVHIfPBA+@vger.kernel.org
X-Gm-Message-State: AFq9FYLq/XSOgkVrLnfDC5nx0DYO89rIqcc0QSCHIkPz/bpPGyoWnWNX
	RkvL9LholT9TmtuZunPNPw6p1A09ZcoXmUB0kTqBddz/8V/VGg9qd3FSdyMUZrh3oQXjkcVtOdd
	+ekeg6eHPpm0r/1JFe0QFdxrg32SZ2rNtvfctQB9eO9O7RrZahT0/9LM5C985mvtU4bul
X-Gm-Gg: AYBFou0SEy/Ikw0EnDsWVYnLocdlCoG2rqVeRVy8psqgzyhMxIhs/YEbKEgYsLxuzoV
	mrFgEZCQPTXNk68ImSK41D9MQlMLzInkRg1/nQRPUfFnpbrVwRmtMADLPXogqs1g8uXIe6Rq8UE
	h8bqRhZ0SnE8LXVsUqXbiFlZ3AP/k5LVP3qBdaNZRt4mt0bEdIsbCOAeotiJ5svoYSVgzeqF+Rm
	IMOUpPLYXkhDxAYK3X6AZE9w1cxt2trMhmAoL8MhRqASx6SrBc3ZvDLZ4FsX0tiyYFwEBfJ4YtS
	BRyns871ZgTTwGU/oB+QputWSncIX+Eq9fda8pDIqi6hZ4gqNECN/m7BGERhI/+2R1ss1n/9huj
	xjhXwtZsmEXajdpg/sf7Rxw==
X-Received: by 2002:a05:6122:4659:20b0:5c9:f6b0:e5e0 with SMTP id 71dfb90a1353d-5e91f45e3edmr1998854e0c.3.1791818686716;
        Mon, 12 Oct 2026 08:24:46 -0700 (PDT)
X-Received: by 2002:a05:6122:4659:20b0:5c9:f6b0:e5e0 with SMTP id 71dfb90a1353d-5e91f45e3edmr1998840e0c.3.1791818686267;
        Mon, 12 Oct 2026 08:24:46 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c353033b3a4sm111033466b.57.2026.10.12.08.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:24:45 -0700 (PDT)
Message-ID: <ef0d4c1c-e070-437c-9bbc-efa02e5bc86e@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:24:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/38] arm: dts: qcom: apq8064: Add space before line
 comments
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <bdb549b57918f3d06694769b7b9f5c438980cb4b.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bdb549b57918f3d06694769b7b9f5c438980cb4b.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6accfbbf cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=tT5mUvbUHgr4e0dpT0kA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX6c3D87ttgjCU
 GilNsy+4RaaleCigm/9wmg2jZm7G8mwVoeKfwpugHsXZq5Lu0cSlmdbawYGp4op5Vd3eciClxYL
 zz0uOSjUxPlqRS6dbTWRzuaIXkZwX2c=
X-Proofpoint-GUID: Zduow1M9MREV7K0cee8o2bw7vMUwgk2T
X-Proofpoint-ORIG-GUID: Zduow1M9MREV7K0cee8o2bw7vMUwgk2T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX+NHWmblGTJW7
 qrryRSTvl1v3DaFJx8NrFFtolEsdAxWBaDruM1Pu0nYK917xyCELLBDSD6wAz8BIUAS6/tEUux4
 HIMN85saQBnK873cACkSF/vlhxe9urtsqdfDQiQ4urhnVC39GW2qD3lYDzFz4COPIJrY9UhC9M+
 QOEjJ29YipVBC9VHvpWUU8kaGtbS6Bsn14iBkI98x+SpF8DzZbBjvSKKU9RYkEVRMdcvcK1nBt6
 NsLU2MkB8SrN41FR9UflE51rHrIgpfG/Dy443mv3L/8AJUs8/rEK8I1BrLTfVHbH3pPOgeWU78x
 t6xvppo1pimty912tB4iJlq5c08jiAAHFTGhdCx3FEHcclauchBMNU9dzQpJLGlnjlWva/RVwif
 WDeTduZWM07tpU+SuN5qzOquQcmuI78cYi3ZJo2gQganyYwk20QuX9BGumgMFcwXIkStSedfBQG
 ZPsUxRi1cVormUwK1wA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a space before start of comment delimiter. Found/fixed
> with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
