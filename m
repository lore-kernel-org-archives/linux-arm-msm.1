Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7DD445AF4
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388916; cv=none; b=dBKgvvvERMkLGVaYkt6bHyGw/r6t7QEtl8u6w4gqTJpu3X3F/Cf/ftWG2cNcdox7N4ANzQ4cYkcbNXp4QrOz7OXYHtMXIHj6EZJYtK+slvy1Ier24iOmhSXQYz5er8SSRmmtdOoFx/m6KBB39GmmWxYhJG8Iy4eNNgEOPfdoE7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388916; c=relaxed/simple;
	bh=9DL0kYRPp1aAw5C12Omv4zJnYSX+EN6BhsllZoa07R8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j/nDGKoxpXD8aG2cNWRpTnwNDxfFi+1hcrGQbpjROMS3NeHjDjZxdXBNm7+XQPTh4x7GzqFrctfLv3lVKtCiWIY2WldBFEkGuRuVEj4FlRFQDNt7vxPPxZfpQfCILEyPK4O8NjP1vljrHGqAnPKBEfFRARMkVOGc+7VN+kEhsBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XmeNuqhf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cwqIdE6B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XmeNuqhf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cwqIdE6B"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmNX44032584
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fVRiChZYr/F9P/d74sBkacRr5i+5ai6D7md1w2IZUxE=; b=XmeNuqhfb5Iy7QlQ
	MzsyAC4FVsVPHbCsLxMHNqeqwwnthia+TawigQ+TgzFjV7mzmTXwBDa46Y4DoS3q
	SwgWHAhI+sRU8eNicDrpqVpCxxGtUcZ+X0Jp8tkU2MpgqnefDwwI58wTCgQCBzXl
	fMYSoboKQAdIzzMtr9szjkYoc4DfR+yybucbmj2wZcZOiyNLc3RvtxLnubKgLonm
	9S5lQmC7enmhbW/GEsT8CtF9YgG+SRkWWNcvdex1XfKwQuVc+h9gUdawdhVLrW38
	JH0dA+xJJ2ISR6ofhuZoRQphSSbZEKsiadOGXfTGvJ3RE/xoPaDJd442/BtCoyMO
	4/sVJQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq8hd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:28:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9349ba88188so54286085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388911; x=1789993711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVRiChZYr/F9P/d74sBkacRr5i+5ai6D7md1w2IZUxE=;
        b=cwqIdE6BBfe//C6ySiGmVIlRLu3IRw2KCfAbyik/JIg/9C6/Z5IK4GIm4fg/h5xNNV
         j8cB5fut3GQXjjN07N7AnyM8P+/ocaymXeV7ZxONQ76A1OXgUy09f5IYUvCnSXztzoCa
         qCFrT4LDG+PnNHhMBFTruJ32WXX9jzOIjSyP5YD5CV9DGi85GDxqLy+4iXOqvQG2bNKA
         dzkYW8tzxxpCagFAOMj3FQ9jA+Hx40zzUCOH2e7mSI8llLxosM0orUaW4WV/IOmcQGz8
         TbhKfgzs2C/bju9ETmB04RTZrY1urgHSAylykYxSTTlLj5g3h6XU6y9HSKeXf82IfTt7
         4MwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388911; x=1789993711;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVRiChZYr/F9P/d74sBkacRr5i+5ai6D7md1w2IZUxE=;
        b=Q/hCJca+zICIjrexhXt2bIkZJHPSbmI7+XFyXAhw6gHM9gaFg8lYpS8E23ugefTcIQ
         rs9LiqN3cfqnjO8VYqBNpv096n0jg/k8ft76cRCrOzy7o/2whrXwVqvX0GpPFnZQIqE0
         ReVT9tx0URIAYE3n3WuakJKAjDsSOagOIhSmzImYLyW6oMrg4j/n2vG+gtYtqIWwScvG
         9CAa5Osq/uVNFFJjXPrKXIt6L/GWtpqIX1f2Ox27V2f8J1oDbGK2YEJWnex55z02TKTd
         yZw7+uw+c/qhiphKF+OA1orpUDOU6yxw0EIngE/kLkA4uTq/Y/eZsifWVjQlFta4OGg6
         7h7A==
X-Gm-Message-State: AFuF++miO/9LgWod5fDUoqu5cnovaQrPjTJ7jyjueUbO5TfNX8NzJ/RP
	guen9sR9iztEjC/pTrzkg5bNgGbH3jn0soly88T57E+qvi8qWyCp7+lEu5ipie0b3rAEAtR8sOH
	SJrA7+8m5Jo8tP7a7aThzOTFKeIFYBbXwtxAvTjYr6P1aJ9djqUtKBylCHWFoytC4v2sI
X-Gm-Gg: AYBFou0vY8JCjCrXi4OmHPn3CM7r7+46rsCWwLp52ZWHoq9LPub+AKNUd8FQB5qC1it
	SiKAna/MvgSpCBpN8SgDDtlsha3HFeBQ1fzv7jJN7LjfamjgGWhRP2KbUj6pysDML7k+qNAD6MA
	jpjnOg0Ld3Qkc9imuZfG8wN+CuIYOh4t9t0zJn9rhXP40EV7afua1nG5+SpPkhoKW1j/Yhn0PJw
	21rH9kHBI7RSeP7jYiQaap11yQPpO0BX+coUckFteJEqUflwHJ70nmMzH6/ug5luXnLXU/b7X4r
	YppoznHAEVlgBOGLiZWgdoJ8iG9wXz+vKvSApyIxjZSwlyH/582SQOX8ar+y9c2PFbMpM3u46zz
	FKt0ZpqkMR2vT9qlYPLZb1w==
X-Received: by 2002:a05:620a:4806:b0:93a:19cc:107a with SMTP id af79cd13be357-93a297c2f9dmr279733585a.1.1789388911391;
        Mon, 14 Sep 2026 05:28:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4806:b0:93a:19cc:107a with SMTP id af79cd13be357-93a297c2f9dmr279728785a.1.1789388911045;
        Mon, 14 Sep 2026 05:28:31 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm425149666b.1.2026.09.14.05.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:28:30 -0700 (PDT)
Message-ID: <ccfcfd57-3adb-4a50-bd15-6e2eb64555d7@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:28:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/31] arm64: dts: qcom: sdx75: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-28-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-28-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX4v/GY4XjdA32
 +PSQQxa/kzq1H9RUIxuNhbCEdj7xjWq81sXerKPoP8J3XqN44Hu8H1r5F9XmaeSsHtQCptpXQ6j
 pFkb3nEu8h63Oq0brJ7FbJJnPLpbu/T993DsiZscACr10mvF7JG2uRcKV3Pv1u/4dhs4nT44iHy
 cNxCcCef/Yn1w+Gb15JK+U2hzfAEtYDrREB25v08CYGrQOYa2oY0JXeVm1kRYFrPf21omdIOkYW
 VOt63uEJn1OoyolTCCRR/6r1Gf6lbs/hAB5YpbSB9zwGGRJHie4JrQXuRcJfJ6RCMnLJ7OQ4Tsq
 IRCX6hXmYPzjc5loc2qqPIOJLMh0m5ysMD+ZAs9triYRxrSlzdDRzL5CHgTpRU4gi1n3skcMsAi
 0RvozMeBrDd+CumWIv8nbGla3CUGKLJ31EC9DnQuj82+moToQAoy9vHwsYOPiN5WIJMCwAZk3rS
 uDBTf4zpSOPIFVPUiCg==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7e870 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: sfd7jK0ivybbirQaU1u3vu1kMZbs7jAB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXzm10GhjqGpd5
 e6qfSmIYhdFaNQHCjsxRFW+mPtpjtPris7TVoYjb6chi28X47ptEbCAtFMtyXiSpk4jPCATP55w
 so1MfqCLIS2pvLE/aPBZGTaKvnPnH2U=
X-Proofpoint-GUID: sfd7jK0ivybbirQaU1u3vu1kMZbs7jAB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 9:00 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
