Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219719;
	b=mqM7zAZBtwZ2KMgwC6yLBUT2dLdvFxc9HJtPKccMBchO5eAmEzImNBvAr97/L/G4j4fm
	 j7rD1qPP2olwT/9Zj/+LU1GUPzBPv27vWvsTv5fTV89B/KmDIQvKsHPtuhiNj/JVV+DNW
	 BQbJlseC8hsf9zVItl8yWqRUl8LokLhXUvDgcqDP3NjZOQe+i65mkOwoxgrSZyHTQeocK
	 FyOrO6OSICSvhK7yCMeT4F8ikXIgdrW15Grkl6syRyn3CeB3d0kGudUsYlSc7Nbiia1on
	 mGJQyg3VensJT0h3U4FfTzuCH+3ze9rQekLmFfWESoRYGKj+YA7H1g7IlJOiP1gZe4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219719;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tXrXtlQCSd9l27dDZzkaCBWWQ7huOf1nA2Nv9XiEhbk=;
	b=4ZLt3iN14IRYw/L/7L/v7dg7onF4+UvG31MiCiYl0goDVNVl1wRyzeFbj4vYV2pW/AfH
	 PaaDnQ8Qww5szRJ5SGofxx+tKzTIaOlhVAjMJEXTDRxcckRd/RmpEk/yUNNbKXdeI7gwr
	 oW4nr4VPu1VYV7at1R8AxenajRcNqj4XP86uH7mVZyQDKlxCK1lR3C2CUh7SPK498j88c
	 sK1JkXkzN1Br632yBIB1a9L3zAzyXwCizz7k0xz6uo7pJLR7AHeJGQGkkygZ8GAszXE9g
	 8sKOdYUbJblKRkCrtQPbRb1eQ6TcxXs7o57qn3wnc490n1YGU8Ew+HWHbE1fNqXhLZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J7IVnPk+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dchNHW3Q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4072B606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 10:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4072B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J7IVnPk+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dchNHW3Q
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99un2a2502957
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 10:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tXrXtlQCSd9l27dDZzkaCBWWQ7huOf1nA2Nv9XiEhbk=; b=J7IVnPk+ZvttqHVE
	1ShK7YYJXJ5T5DuVWct3V7U7ie1ys0Q01RRPpg/qyngr3THIHLdIsRKOfZ6094/e
	wbIUQuAq+ngCYPNKPCwpVeLoOQ+3a+KfBz9jm/+ZtcMfvee3F/V0qw3Ka2DbmZUf
	m510ibhRFGJXouWOiV50oeOlmcVWZw+ItA9bE3FcOI5zjO1Yyy9w/ANXkTa936W1
	3QkCleFz3WEZUYNwsE/mneX8ukpn6GuKvu/xDpaYt7HA+vZeZ8mWUugQew/0iuiN
	NpBOJaXoVmQjwA9vX3dXtByuaCvmhNr8gkgBLFmLoa3v/WQLtx94O5+hrSolrOI7
	hKCxYg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hubt8r54c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 10:21:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-943fffbc5dbso16418685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 02:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794219716; x=1794824516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tXrXtlQCSd9l27dDZzkaCBWWQ7huOf1nA2Nv9XiEhbk=;
        b=dchNHW3QKdrtsCKkTL+vy9l7Z46Z1Z5g+dxGSmq915YXYRh/qWqWIwDEXxN1eifDc+
         MTO1LoFMGx8oh8KsVnTYyz8E+XtKjeK0TtKpO1yrFNOABgKgADHDsRARNidpp0XdV1+F
         ++ShccSO8D510vjL+v5OpBmNlk52xqvAWTpPhR/o2fdtPYeVLXHc+7bf/inydymzfcP5
         dcuxc6AcosA4e+zrjR1hzW3kjGH9/OEWlwZW7MhZTAkjYHXmufWvAITSTFPA9XSvFIkn
         MRCgQ4MNUU+9Hiy6XU3HmMy+mQVljibyqxuEW/QNcWLUvAJz9ib7xPfQc+utK36amSN3
         ZoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794219716; x=1794824516;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tXrXtlQCSd9l27dDZzkaCBWWQ7huOf1nA2Nv9XiEhbk=;
        b=WraJPglB0jItJpCDfJfQyD0C+1l1Opk49eHejfZUwOglmPsWDDAdg8NrVrOCkkgPR2
         9XHIu7Ge9Xkv7rxkgJQW9tEPrRgAx+t3oalf4kbaMILmK9t7YwIgOTsu2/jbfwRb1gIP
         tCnWyi3qiTOkFzAF/l2MpDBLE/9assC3A7pfM28pZBsd+Coq9n+tj3Se9CfvRcRwsiEg
         uzIWfbXWLBWWMLCWmnIraFaIyU3sWmsS3rSIyWc/4YXHqIvUFBeI/u08phHLuc3fu/cb
         6B3haA3HgXK44qOaU1ijg7fLY1XPpYuXBpvP7VCHJtt0GxR4nplOfeX3EPVNE2jSNDbC
         QcPw==
X-Gm-Message-State: APuU4Z85g0PP07zuSzGM4b/wn2HIrsk96cyOXrvSHeTLl8qadAEJrMr4
	mQLmhvAwbJ1FMyaolOPXOgzf+oBG77yhBNgHlmKIE/A4CLwC/BH+NvNI0BK+YqdZpXfxPGIRkil
	5tpz0wikJHJFPS93DmcZMdC2TvJ7+Z4rEq1Ncw3NsCjgcwdYCpPlSzsjEm/rzpI9ITaqG
X-Gm-Gg: AYBFou1TLqLJW7gzgGtHRlyTbXQlgYkCPgpQIwEhGGNm6atwwOoi8AZAW3kBVVvEUE2
	pLEkClxLvuCkGcyAO4kZwWMcQialwsq/JEmQEhrWOKEc9R3PqQOxHs+bMOeSf0NWtWlg7qYzA1f
	idU+amRHlJutaZVyHQAq96VMgHYmMPq5tqaIH2VUIvl1P2bDqloXpBv/AUc14PjjUKuqvkT3m+A
	DL2/X29+4rc4HLydDkjbtBDf++/FE2FITzMtQ3ZN9dwpGHFU9mIhwyWXipidun6UNzFN02OHfnC
	d6ZJ7tYWju9EZxh6SRwozyJpErjDePSKAVRWJ+OzeJjkwxcqYLP127WzW8q3eWN/MMiKwFhCx1D
	rjw2yQMyqEVljZ4jn7KRj4Csdk2QsYY8kNav38lIXZT6RSwLD1zYix2iCLSUpzr3A1Mlppg==
X-Received: by 2002:a05:620a:a2c8:20b0:945:db0d:9cc7 with SMTP id af79cd13be357-94783fcd83amr526951085a.0.1794219716436;
        Mon, 09 Nov 2026 02:21:56 -0800 (PST)
X-Received: by 2002:a05:620a:a2c8:20b0:945:db0d:9cc7 with SMTP id af79cd13be357-94783fcd83amr526947285a.0.1794219715892;
        Mon, 09 Nov 2026 02:21:55 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a474e3dsm148159066b.42.2026.11.09.02.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 02:21:54 -0800 (PST)
Message-ID: <099aaf7d-f0a0-41a8-be75-98912e11094a@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 11:21:52 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Add
 touchscreen support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261106-mahua-t14s-gen7-touchscreen-v1-1-d638ddd34170@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106-mahua-t14s-gen7-touchscreen-v1-1-d638ddd34170@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfXw0s9ATp1GBnT
 nFPzeDBRXF/clxF89J5qfazTiJjJ+mA8BU9meGadtJlXFLC3EfoB2wC+osO1hUxFzLCcPn1oAfk
 GHUo9nAKafXXO6Py3jOqW47BFggkvHJ434Xg+w4vNBF5HcT/jxmwyDTQZ2M9F/1rtXmW2uftwX/
 sGZ3y3BU9kJck3N6k6IB/whBHrHqgMu2eQrh4dBYZY/i1JmoRAE2I0AAHXZ1i7Mem3JvUGb1oO1
 +RRGCgx8vUsncIg8eI8nHe1hMhWk+svIFWiHvwcOJ+366PjN+va/AJmo/h8/JqxO9QhBvRhVnBy
 95aJw4FdFt7mG8FJrrwhtXDtbmtghAmeDxJPnTVRBcpAz8Q6rBRcUadNyXjCV3hsAdrJGvQ1Mcj
 bvdfZkI7QTdIre1+t20BCCRWh2dDhSS8fyP4I3gO1w1YfreAC6UlVb6HjEjYFmKMAu3LPN6XDe0
 zAgiBNHMX8lahPIBFCg==
X-Proofpoint-GUID: twbAjCIwLBm9yMbEOlX_uySddyORjMTQ
X-Proofpoint-ORIG-GUID: twbAjCIwLBm9yMbEOlX_uySddyORjMTQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfX5FyBooWDYoJG
 JuE0ceQERk8OKe3Ecx7hV2v7fmAf5MUES3EAwvKwZrrcpP3tOrOiV6f+Y1A1+qXDbchNJpHPkpI
 //4vaanKWsOwW01Jq9p/BNy8YDQwP2E=
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6af19ec5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PEJKZ92eUzn2SXrnmagA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090041

On 11/6/26 9:47 PM, Abel Vesa wrote:
> The touch SKU of the ThinkPad T14s Gen 7 has a HID-over-I2C
> touchscreen (Parade, HID 1da0:3009) at address 0x24 on QUP i2c8.
> Its interrupt is GPIO 51 (level, active low) and GPIO 48 is the
> active-low reset line, which is kept deasserted.
> 
> Describe it so the touchscreen works.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]
> +	ts0_default: ts0-default-state {
> +		int-n-pins {
> +			pins = "gpio51";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		reset-n-pins {
> +			pins = "gpio48";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +			output-high;

I'm afraid you'll need to add specific bindings for this touchscreen
instead, see:

https://lore.kernel.org/lkml/82a96d57-94fc-470a-b7eb-f0fde0c0dad6@oss.qualcomm.com/

Konrad
