Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CD533993
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 21:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100483; cv=none; b=UP7PIJbDMSHFCBksn3Nqkg8f7pZ96w4ckPKOs4WrHHoCMvF9LWXobicRjpLwOV6NRU+J420YwkxplmqDxx47YyqwD2YWtSjoXGVYtawWbN6PHdFFVjAtuea8Qhfu5Rv4OqUm/kYiRmKgJLRX7sjUcJWR6/Oh+MCIzjhEqrzN9IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100483; c=relaxed/simple;
	bh=kdE/oL2qvaXHvtKxe2PNb2/c7DP0GEJRE2hGcp9ZR1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pqspfFTFJUfSbZVqQO297cUHh0RNRtVRYTuLH8/zDhETWupns9VTZz15qA/2yeW2txmaDONLTs6/uFihiSg2StmxzWGUIzcWs+skOoT15qbBEve/ecGX3Z+5Sc8tw22LhXSCnggt/v5+pZguSbyJDUrPmp4+3By2plA/tUo9fVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W/StAFFS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UG++uUUX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W/StAFFS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UG++uUUX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FGH3DM4100219
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 21:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4a8omtOMUvQnoW/+es8xVBAFKUdGDbUKsFkbcORMiDo=; b=W/StAFFSUlaMH/gX
	bWP5VXvrGrIROnXbTGVO+AR1RJ+1y2mROeuPGaW3Fv2a4Xg9e52C37hD10AGP5ZV
	l8L9csl+Vnocq3pep9ta5lTtWO+K9jla/+t7/Kef1QS/kS6/BUhxmvsjOwP+KEyE
	h0J6DW6yXFjbnlsB7no0uwMvXp8bGz+iuJ2k6HKCVBmANtY1V2M5h7ZR9Fk6nxAK
	aoGIq/DXlxFw/QFgh0YVZQypqTDbe+3RgbErz0HhSSyq6KQMHG59SzSPL4KLv6SW
	1NQtADzCZdgqWh7LdaiSoBh+p60HxB0d2vTSOCCJdZb3UJulSUKImnUjvOF0feyk
	HhA8kw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2raks2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 21:41:21 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso11634334eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792100481; x=1792705281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4a8omtOMUvQnoW/+es8xVBAFKUdGDbUKsFkbcORMiDo=;
        b=UG++uUUX9sCsT5iXOcUipEb6SLXyWma/F2Ln1AmLZhpqbmBIwik2U3x+YLiSuvEmgW
         EwlEIDV6RQwbWNSFhSqJHd3pdqimhBNhjRJig+yMk1L9l5b2QxWf9NyWv6l5e+vXZoTR
         fd38umcEBSzRxqoE6KSqb4vSRrDrZkQDw9pygTqTg0M834gG4W42fixwa744sispcTgD
         rbtDxGpzTphTZXalZJaOWzrhjMnXGl1kdw8SrAYvA7rNHwO1CMrip+v4r1EsQ9q+xXTs
         BYO7ac98m8hywbtehwoTRRIxRqAEYmPzZpkYJ+C71WtVqdc8m++K2fHEcXfVFaVIksCr
         sF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792100481; x=1792705281;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4a8omtOMUvQnoW/+es8xVBAFKUdGDbUKsFkbcORMiDo=;
        b=mCRvAkh/yu+uFw229bhh5t/EaY69POyHIPb4I2zOBXZ48TV0Dh+aLg+OJWNNFcr7Qx
         OsVkrLRyTbgubC2J9mexVnDI2VceyS0efiX/h26QADfdCzf8NbLwNycGXitSdZVWahVG
         pFF/lOWoNihEEJm/zCd14BYiS3rn2hpnURBXffw9hE4vVSr7bOxwJSCWax2IhfyyE67q
         vbD7BK5uw8pe4mywjjz45hjGfm5WHNrUO1EIB5aq6O2weEaL0iZPtyg1hyvdj7BEBSzi
         e43UvAngMyAke9YYnF8LevC5KpWSajJKuqMgJTECbyGs+Hmu1/NsI1SgJ1J3Y33jMg6l
         0qqA==
X-Forwarded-Encrypted: i=1; AKwUvByUstxgzzZCaWu9yhzEumCAqdw3XXIFcY31ph4kYWX6jndqhZ7SZ71YuAyYmJuhI+Ze7lyEbHyWeaE6D3jZ@vger.kernel.org
X-Gm-Message-State: AFq9FYJULPgdbvY2PngTz4ITudzSWX4fgC311S5LBkRxNHVAoxgbXeD+
	bbsteojz9HRxWZUkvXTbS4uV4ktZHdpQb1wSZbbu1Q1QR2wR5UePHD+k1xdLHRMh/ryZBYl25Cm
	CWw1oAz4lCmh7ZZmHI4z3gBSWy4uC8Ry7bStq8OG502HjYwak2oDLXckISyvvvN+8pG+S
X-Gm-Gg: AYBFou0t8UHt2nV/rUm1Nu0CAWLmTsfkLhIj0OebXeSHiHm8dClDrXOoI5PxkrrU8TS
	11FZqXe8cLggfnFR8np2YZtlAq0sfyG5q9nL26WCu8ADB7erv38lgwqEY1hKwBJXFG6HXOwqjS9
	zqhjFvfXjWt3e95bd/peQR0X6bhBkyZMIE5x6Orrbg9/UUWaEZARyOWCHmIBseO4YwS/pUi9tGQ
	CQOkYxpQqNDhgOoO1CVKdd72eeUkmSl1t2Yz7M7dIwmFcXUPQPTObbEx3dx3uv6iYsbSGGVeBL1
	yrIRdwxb25pQXY+DYbe9pVhcXGzcDw2bldNnMzjaTHa2nvO3CcVScbzdlj43ZWwdXfEchP0OPtW
	YFvIbWUKIdTWm4a2+f7osWj0lD0kBLZRzM3BABE6WgNv1IySgH28aj6eB0Q==
X-Received: by 2002:a05:701b:2411:b0:147:a685:9125 with SMTP id a92af1059eb24-16a56c9f443mr25855984c88.2.1792100480732;
        Thu, 15 Oct 2026 14:41:20 -0700 (PDT)
X-Received: by 2002:a05:701b:2411:b0:147:a685:9125 with SMTP id a92af1059eb24-16a56c9f443mr25855932c88.2.1792100479947;
        Thu, 15 Oct 2026 14:41:19 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b859142sm302156c88.18.2026.10.15.14.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 14:41:19 -0700 (PDT)
Message-ID: <8ed23bd7-f783-47c4-8a30-bfdf74e95015@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:41:17 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/5] nvmem: Add UEFI variable NVMEM provider
To: Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
 <20261014-b4-nvmem-efivar-v1-2-187c85f65018@oss.qualcomm.com>
 <CAMRc=McDsv0k0bD2LoaXfOh7uyFo=HRyO098H=N=QeMFDXsLKQ@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAMRc=McDsv0k0bD2LoaXfOh7uyFo=HRyO098H=N=QeMFDXsLKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA4NiBTYWx0ZWRfXx0TLDTiJ5S2T
 Gh8tu7rG/Y+OgP91v++Idnjb21g21XoyvB+VfRg9+mw1sSix/z9iA0Y0xgG9SlOdtuIDMyst/tL
 uLnF3712yeT3VPC2RLuB+RTmmjNDIG8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA4NiBTYWx0ZWRfX+mfDcZ/69+36
 vBxYeN+41FYI6msaBJM5sT8/LGV+l0p9YoIdm0OmFYQbOA3XIZh1O8uw92Ec60uaizkqFcjCOjl
 56hl9ZiQWfsWSi8WHBEcYxryNlpkjMoLk51DFP3JgbX88bvpGSumVT9BuCTJULFBtlZyHPD3yD7
 HOwPhjR0YyFMQTXG2uKuOUtFH2gaStUCWoYNV/qCoyMSfSmoZqF+Gj44ASK1gBpsmkHEWtFga8N
 vhy3z4IvaHNnCf0B1AiriQrgYDUzkFiBUNkO4t/be47pOOM0/myfrwQdWmZ3Mer2cyNOBqVT+1f
 2Kr1HImbxljj1kzJKC1lHvuf63PswYRLNWSuBhvedLpbXK1983C9HvFH+BMbpaM2/BkXVd109nd
 GCf/2Yx/eN7aSP2pyhq0aRm9/ex8hZN9usw7Kb1QnAEXTSS0WHE0z4O4J1vtT2lBLIezYfSkKRE
 +uZEUuz8AXkNa18GPBw==
X-Authority-Analysis: v=2.4 cv=BNMmP1QG c=1 sm=1 tr=0 ts=6ad14881 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=S4S59HBQktVEhwL6IfYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: M0HQy3ymIn1nFMlQcLKSOD_MHSiukG2Y
X-Proofpoint-ORIG-GUID: M0HQy3ymIn1nFMlQcLKSOD_MHSiukG2Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150086

On 10/15/2026 6:22 AM, Bartosz Golaszewski wrote:
> On Wed, 14 Oct 2026 15:02:40 +0200, Abel Vesa <abel.vesa@oss.qualcomm.com> said:
>> +static int efivar_nvmem_find_guid(const efi_char16_t *want, efi_guid_t *out)
>> +{
>> +	unsigned long max = 512; /* in UCS-2 chars; variable names are short */
>> +	efi_char16_t *name;
>> +	efi_guid_t vendor = {};
>> +	efi_status_t status;
>> +	int ret = -ENODEV;
>> +
>> +	name = kcalloc(max, sizeof(*name), GFP_KERNEL);
> 
> efi_char_16t *name __free(kfree) = kcalloc(...);

	= kzalloc_objs(*name, max); ??

