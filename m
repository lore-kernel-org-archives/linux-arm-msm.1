Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14628345CDD
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 08:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114499; cv=none; b=XqT1VvvC+71tqxLyL2ha696izvnULbkatFETGvhbF51DN7s/gO0YIZptwE1cXmdGI0ddxL1WtN6HkMxJclN0Qnp4uq9YsO49DB3br83t8Cxl5qPysdHj2DlioxSxnHJRe9h3dcO7lUfP87WBtgwBuqvbh4SJBVIc7LPLsm4yz2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114499; c=relaxed/simple;
	bh=my0Fgf55/x0oPgqdhFZtPFG0YVdcZeXfcXqaPyFSNLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s9bqrkHHw3DwYQxX3dBFarZj84rFXajxDz2Yd6/mRSSSV9hPSN1DYf0j9UxeWFNdXEHgDwBBNNATM1eFP3b43xqE42PzrlJTxUJt1JZSuPD4glderPAYZvY81FVw+T0hGhx1c1kNOB2HxusvqvmtUcciH2Ty3YSfOcUv5LwQdtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e3LQhjVY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QRsJAfHp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e3LQhjVY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QRsJAfHp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kk9b3016909
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 08:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NfrHeUtPjIuHPwi57+sYMSNmkhZYmYo/gjn8wEnanq4=; b=e3LQhjVYm7cjByMo
	xBLFl2UWijbc9IncNiNhAf1rk1wCAQwuAOCI3wiRsO4VOay73xPGoUhHh6lWSmU/
	SHjqmft3nj9fS2G/XBSs7fk5FKLDNyZZFACrKuZT0FbRr+jfbySkFeAjNKdshZDG
	xZd39EPJ2/yfcna7woEUocJz52maXaOxQRxQGVEi+7oNB37cYDw4G/lw3vRGQNq2
	aDs7CoVX8DXoVIBOy6xbXtc9fUUwGMaN5gGirPC7Qih3v5deToCXtUToc8jKyjNp
	G9mZPeURFwYjCaPHqOGSxGRlpqqQfLCQPtOya/AjbyxJZTrH2idDXoIwju6Ab97l
	+HdcKw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwvx46e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 08:14:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db8e9fe9c7so8692345ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 01:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789114496; x=1789719296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NfrHeUtPjIuHPwi57+sYMSNmkhZYmYo/gjn8wEnanq4=;
        b=QRsJAfHpFX850997GAYrlZGE+UX7bU6xCwJqjWfQU/GCGnJlZ2wSpnMMwMM97k8XSF
         JxjHabp9sYA2SFwxjU47wJkZnj766Jvny6n1FvfxEacOf01/DLsHgt6Zhb2tqR6m/Cwv
         5zlseQYDlxvCxVuQi0scZwU6hnKaZuZy0hHJwxQKnrFa2ecDbdZtV5gmJV6Grj9I62pb
         wKztXZmm0KfkknSs/nxMQDOOvNvnfs2tOqTVJJ6+Nxchnk603oHXOOMwtip+SlVdedHH
         3ARDOAFomXdNHdLODXywzVSfXhcRUtd93NYMfixDCVg59O1VwFSz6LBOg58QjoOoKrJ8
         UI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789114496; x=1789719296;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfrHeUtPjIuHPwi57+sYMSNmkhZYmYo/gjn8wEnanq4=;
        b=QJva7bf1vlasn2AL9sQWwKA+icuYlv90r3JekTxdQyZIk/ftQSUuKVsOwuClTJq2iR
         oP/sAvXcyLGY0W0WODTzqCRYZQTOi/95hylRyY2ifMcjm3XdKchSzO+UnNCS6dR95kyE
         Vmkbhcox1Ssd4o/fvEiIeZCpMziYgT25RhivP+YN8fr7pIkhN67zoeKnIZX+9XZVfGeQ
         Jbq+Qw0xiEpVuX0DeYQeWI26zU8P9etokNrEyHfC3rUZ3Rwo5DwUSYqEO9bQ7KSs27wx
         cGXB8iv90UJFzHHR+WtyPXN1ZZOJ8jBeyS0dbbWFZexmLi4arhlCzpeS/uqyYIzY/Ohe
         IhfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxg5pcVTt16/QM1V/zfuHKQtZiIR9YaAlTOH1MBmCwCJwzk6hKuliffBMDkmCvLEi56agf/YikiZRT5U9qv@vger.kernel.org
X-Gm-Message-State: AFuF++m5GG7brP28uCWpOES0bIUwFAMlRbhGfFViFGmfX79ongPqF8ju
	0oE+8VavseMNC7tjUsgRhZ5ZDn/RjOdyw0PrVc+9zI8D5IlHlfniGT20zcea7xE/NPuL0nfYUbO
	0YBOr7Clz89qx0+YnkMtf5bMRUGzkrwxRDfeNsNh/XD+Rgz6U+E6aezkOyuCD4Pysl8/j
X-Gm-Gg: AYBFou2Pd81/54SocPLSMM+ilxQke64EesCdtQD2/i+H8zqFyHz5OqNpOnaMGwLXFb9
	KKI9DdU82BJk0GPQ+w9R+oG/OVU0LJbtWODJF6nCtjNYZbZdU1NmA/MUlqu4n5NPcvAakw41VCw
	w408xj8GA+2hhgpEMYRm4GGGrnaYmU0bdICI4OiUU4w+FqvMaYxHKI/hdNQS7aRexuD28jUYit3
	5k/ohRiu239fbkuHrfRwlyLxFDveFaEAQJBJ0L8UjAapQqnzbyZYrBM/0+Bn8t9W4axyg+6jCMf
	pKHksy8RznaTCweeU/hjw38/hyjGsSNOvmGkEJ6JLvI4MnDAY+41OMtQIZHH7kK6aS8FTRKWhmJ
	Bzi9UfQ1iXEb86fjkjEFv7ZHR5IET
X-Received: by 2002:a17:902:dad1:b0:2d5:e3ce:3988 with SMTP id d9443c01a7336-2dd2a33fb90mr60084455ad.11.1789114496503;
        Fri, 11 Sep 2026 01:14:56 -0700 (PDT)
X-Received: by 2002:a17:902:dad1:b0:2d5:e3ce:3988 with SMTP id d9443c01a7336-2dd2a33fb90mr60083845ad.11.1789114496021;
        Fri, 11 Sep 2026 01:14:56 -0700 (PDT)
Received: from [10.218.20.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9b359sm4340213eec.14.2026.09.11.01.14.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 01:14:55 -0700 (PDT)
Message-ID: <9a0379d4-8263-4688-8a39-71dcedf6da8b@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 13:44:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4 bytes
 for read request
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260910-rsc_read-v1-0-c9b7fa3cdde2@oss.qualcomm.com>
 <20260910-rsc_read-v1-1-c9b7fa3cdde2@oss.qualcomm.com>
 <aqK0D-dnQEi9cwCA@baldur>
Content-Language: en-US
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
In-Reply-To: <aqK0D-dnQEi9cwCA@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDExNCBTYWx0ZWRfX5voMtNNxcCYN
 BQ5nPh/s0b61UNSfSs0gqNITx4gTJphRK0Y7A3c3oWexowNuqB9Rxsu+39buugAdweseS/AzxIg
 qQbybz/W+PQLxbddlRGDnH8l0yy8wOCT/5xPXPHcS27H4CgDFpmCuc1j8o6V7/rc0PBRI8WwWg1
 ecaT196BFkWHRcAhcT8OCcKviP2/8eMqGGinC8uYpG50cju9MXj74b3eiQXGdtGWWzADSpL13bK
 4AwCVcO5k280Ixtc9hNecYjTq+nlyp3hUM+JqLskue94CT4t0dMW/fXFL7ZtfPQ35eFvFoicXkC
 vpd4zL5dsRSwtwceFZOq64bipgxE/LC0SeJ98YdLoDQiuA5XDyRlhzLf53huvM6DhioWkumy+o9
 OlZ2qwhhv8LfbbgMBVjknq59Dc4DGVW+5K9kYQ+6T8zwvKBxnaWql5fZsgtj2M/fmBAS1Y0QQr5
 vu8PH13eYhchFf5Z3Eg==
X-Proofpoint-ORIG-GUID: wVFao5fd6JYWa6YovMIxtSefgQN1J8-3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDExNCBTYWx0ZWRfX6ugfeixJpimS
 Lc1EEbbaU/w2B6Dv9uWKkL4PnuMbwx40vMD3UNc0XQQo35q49fIGwFYuiDga8kBWBzcC62LofgV
 i05qI2BnRH6anmiq09z/1BjCbVsyWmQ=
X-Authority-Analysis: v=2.4 cv=AdkkjHXG c=1 sm=1 tr=0 ts=6aa3b881 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=ig1NifZgnZ2dU8V163EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: wVFao5fd6JYWa6YovMIxtSefgQN1J8-3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110114


On 10-09-2026 19:21, Bjorn Andersson wrote:
> On Thu, Sep 10, 2026 at 02:23:01PM +0530, Maulik Shah wrote:
[...]
>  
>  	/* Convert all commands to RR when the request has wait_for_compl set */
>  	cmd_msgid |= msg->wait_for_compl ? CMD_MSGID_RESP_REQ : 0;
> -	if (!msg->is_read)
> -		cmd_msgid |= CMD_MSGID_WRITE;
> +	if (!msg->is_read) {
> +		cmd_msgid = CMD_MSGID_LEN | CMD_MSGID_WRITE;
> I know this follows the current code, but CMD_MSGID_LEN doesn't seem
> like a "fixed" part of this message anymore. It seems rather that
> there's a few bits here which denotes the CMD_MSGID_LEN and the value
> thereof is either 8 or 4.
>
> If this is the case, I'd find it cleaner to define CMD_MSGID_LEN_MASK
> and then just FIELD_PREP() to put a 4 or a 8 in the "length field" of
> the command.

Yes, updating v2 to use  FIELD_PREP().

>
>> +	} else {
>> +		if (drv->ver.major >= 4 && drv->ver.minor >= 5)
>> +			cmd_msgid = CMD_MSGID_LEN_READ_v4_5;
> If I understand your commit message, this line says "on DRV 4.5 and
> higher length is 4 otherwise it's 8" - but there's no way anyone can
> read this line and come to that conclusion.
>
> In contrast, this would actually say that:
>   cmd_msgid |= FIELD_PREP(CMD_MSGID_LEN, 4);

I will update to use FIELD_PREP.

>
>
> Also, is this really supposed to apply to DRV versions such as 5.5, but
> not 6.1?

I will update version check in v2.

Thanks,
Maulik
