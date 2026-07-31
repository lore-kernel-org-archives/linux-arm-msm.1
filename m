Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D39D30C60F
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 13:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785506107; cv=none; b=DQ4u8f+GHi+aJlH9VpI3zks039Y0t3XDbTAbrI95y9FCUeHQYiQrAUUIgu8KoETcU/tmSep+RVYEZbGAq5YqprOzDOeP9MXZcBs/UpVat7pWIRAHFjrv6DFM9Fb+/+ZgxmUtGAftyFx0vYeIKId6fNUB1n1E+xTJuzfFrVresnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785506107; c=relaxed/simple;
	bh=qltHpxWSsF36DB0YxP5qnxLYpnR0OtZqg9/S616ug48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FazP/77po7pcyNrWlg/97rABo0nMoSBJ+ElnHbSSL1WqQaj2jJyDgBEMnw9Hh6XiOyHZrEEtuGRyrgvh9Q1afj2CuF2Eru1C///bsTOKqtnaXCueRpiGomFXxXbUew6YyA5kV5roR2L/0IC3DrEdhqI0UqaPqf+glKMwwymFqhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HHcBfJe1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fp7zhm/r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HHcBfJe1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fp7zhm/r"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBcsSh4185493
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 13:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ClB/brBzIH44bySys+RnRDOt5bjtE0y4OtU90FT2kac=; b=HHcBfJe18xDQ8nQ7
	F7UQ4EPaD+M4Qi/Br9WFAhU9YtMcM1JY1yn2/kVxImJ/AHH5uUZry2bwh8O7WfNj
	gjEzqHVT77YU9Zi+FVsdDtBC9Bbn/s8943Z9AZ1+axj5gh4dDbegsFuHilnna1vm
	pTnPXfdjalbG7LujSS+x8aRF09x951ZCmZiSSjt7i3IN7YvhgaIEyWr6EYEAKdvA
	4x2DDYACAXrpcZCW90tr1Og5YIBNJccsT47fbRHjPPysnK/OHt+SnB3aPz9wjtDc
	UZ+klotby0MX6T9+ReRIMtXdiblmPa3XgIVxnryjZuUPmraOSR6YQxMmXZ86zQ32
	0zfigg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru130hnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 13:55:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c9d953b71so1192651cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785506103; x=1786110903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ClB/brBzIH44bySys+RnRDOt5bjtE0y4OtU90FT2kac=;
        b=fp7zhm/r54XLb3yr2tdjYqcMaT8dsz+bf60blO1mA9gGL7+rZ5xFsHEA2PZC2YsqMa
         xspPDI4cBuazKkjY30YGcTBXKp7vuOV1CNGceUDDr45GOmoTeBCvsLgkrzcWsKlbqVYt
         8U2dmk+4CDIGMBRyb3Vj2IYl3hrsDhU4FePvz4kkWSrVDqvF4fS8NPQDsIVJgE6CvRa6
         FjfTl7BiYTjUT8fD8tTq0PMpKGgRs6dcGCOEompzbAPON/6plT7aAvVTkyy0InAk/ZDI
         gg8/S1N3bjG5OGgL1L4qCW6eUM+ju9+QDTnztD0vPloAcCztP9sY8lM24VrDJ+t0+IPH
         cWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785506103; x=1786110903;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ClB/brBzIH44bySys+RnRDOt5bjtE0y4OtU90FT2kac=;
        b=VUC1tEVTYIn9tJ4rQ5C7uciAgmdK3mkn+UtFcsc2iQC2nw30qqfXE6l9EbIb6zMiko
         50EbJGzuhqXvQF7egrkDvFpYjmn35fPWDKwhpUtV9ZhXXNfK4YbsgJpw/zl6a+p+2Aey
         Zd7zagNWX/0NdZopC8miryHCYi5PX8PvEHfQO2jAO8F4p0VDjEnIKo7p2GpCbhtkRIsO
         5Ka1BL3ywa5b0XuQ1rTj08C0E9GYuBHFNebyTSbfh8lwMMXDxpE9X3O74Mk/3HMZ9PF2
         TB5lzD13LnqUWB0128ZxZwZydgNiQ1bz2FXFsuNrMyaXytCid26LKVff0PvM2w9pzSPo
         Z/4g==
X-Gm-Message-State: AOJu0YzHDZV041sk0qRL8+HltrzwSb7yCmkLoMsbd/DHB97wNlnBPrAG
	tIJWusUH2TFZLoBHQeMV3XDr1feaXYgk9z2Z7x0P6bVQ1fx61hqmAbrn/IqUO2/iD/6qCF7BzSj
	rklyE+e4FiuLHygEIvApBtm5rjuQwfcQ55Kzf5/tzioeR55YJUy+mh2rEx0o/XA7M1Ktz
X-Gm-Gg: AR+sD12FSfnJNG9f6XzZ8ByfzbUZEepjOzqHey6zzXM46v8DPxF/dJI9u/jce6Im1IN
	VqMIKYHR3xhCLOxWEgHqheNsgXQqC+IhdNcaHHk/cCQgpxzCar4NlirzdLjEG4StttZty0U5WFL
	srZovCMox490wUHZQCtDtsWrnan7AtxwSU0muZrp91ZP88MhZVmoB1sYgtRvA3Ay+yrCoHFnKE5
	2foFIxCGw0tJcF015QmiRSzJg1z80xX3um/ib2ZwgP1L1wOqeraJbTO3a/QhkMwavlCpkBdArxp
	O/9ibtUgt9Anwnxz6g8AaRoIKlgId8nEzzKH7Z+zU9i5NYSUt7j5+Hk/opIdw+Wbxtaa1/FDIsM
	KU+XTldd3ONNR4bWBQ4ySeWVd
X-Received: by 2002:a05:620a:640c:b0:931:10e:befe with SMTP id af79cd13be357-934a0576703mr11144185a.0.1785506103273;
        Fri, 31 Jul 2026 06:55:03 -0700 (PDT)
X-Received: by 2002:a05:620a:640c:b0:931:10e:befe with SMTP id af79cd13be357-934a0576703mr11138785a.0.1785506102770;
        Fri, 31 Jul 2026 06:55:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c63d9d6sm2033821a12.17.2026.07.31.06.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 06:55:01 -0700 (PDT)
Message-ID: <fe431e27-4d26-4c92-9d50-d4273ecd151c@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 15:54:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: switch sound
 card to ayaneo,pocket-s2-sndcard
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260731-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-dt-v1-1-0528ff6ffe38@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260731-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-dt-v1-1-0528ff6ffe38@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEwNSBTYWx0ZWRfX6GINKWP/BhMd
 6e9x1JokvDrd0qgFkBnK5FYm69pgxWwkJSANYtIZx4u2nbO8Plze5oorvZCL/B4OihI+637ZrmS
 2PfhW99ZIIcg30kUBvyzdZS5Mk7H/qQ=
X-Proofpoint-GUID: 1qA4uN80D-lPtbjfFVJL5qURbCJ0q1dx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEwNSBTYWx0ZWRfX57FSt5/oGORx
 FclMulnpvyR9SerYA5W4kN/j2xHhu9TLPapze+2hq1wS5d3xXTXPpqvxNCYa9OJDu06trb9m8KT
 l4iFK58M09yJvKR75q4uc4SK4RkSzM0szQfIBCn6ODxtV+r+BulEnE0YgyH+bmYZ0nlFA1B9MeW
 yw2ceK65WrHF4IPDpB3gV+t+KdfZPoiLmnuRqSDl6aaY6uraSCYQDAP7TDfI3Dwe/RzctFxVGMp
 mhyhXvVA7nt8lwuzu/UtnuUieUFtZLT8lPYSAJHzqaT8NDE5atW0VNi4yyLY9H2+cm9mkyJy0dD
 Mkn5zP7MOdLJTAoQE9NHrl4TF2UKGViZ84ctYV8Am1DvLI4ZWgXYL0yuEFbg6JKbktYuiStxbcC
 MoqOsar9ZPa7W5sYfEYVchUcAPI4Gnvbh/c/P6OfBo0hle+iGZsL3MPrOO7qy8FlLOLjsa3tB+Q
 UpQGFIPHS8eobIRmLTA==
X-Proofpoint-ORIG-GUID: 1qA4uN80D-lPtbjfFVJL5qURbCJ0q1dx
X-Authority-Analysis: v=2.4 cv=CYI4Irrl c=1 sm=1 tr=0 ts=6a6ca938 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Gbi0VzeWitClxa_Z-XIA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310105

On 7/31/26 2:36 PM, Neil Armstrong wrote:
> Switch to the ayaneo,pocket-s2-sndcard since the hardware connection
> of the WSA speakers on the WSA2 port only makes it is incompatible
> with the default SM8650 generic sound card.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> [1] https://lore.kernel.org/all/20260702-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v2-0-1ef8ceb8c9ec@linaro.org/
> [2] https://lore.kernel.org/all/20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-0-b29f44720178@linaro.org/
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
