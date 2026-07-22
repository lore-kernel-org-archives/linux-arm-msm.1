Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D89F34E766
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784712425; cv=none; b=Yd04hrvV09Xgq8bBEBWtPp8VB4aXMwusiaVj4gEsGiGvtFuk1hKEQ9rTAFCgELiqqBnLuWHCyHCGRuohmXkb1nrCauDn0S9DUHL9kBaTYk+azHamJHe9nUXZ1wxIEUYWqX4scHNhb4kkVoWZ2052WNva9acdxiZZMJPAWlXQ9Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784712425; c=relaxed/simple;
	bh=xhXspeSkqB2qxFpZU3jQxXgdJQHh1jcbAIItdPywyf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s+d7eG8haVgJ1cNPOUhlCrf1QXI9mgTyLHsnRIWOEWZ94bxu4TOspD1U3mQyArng72g7xRAsScTg85JJAwbRnb1oCLaMUvuAG4gRgZ8jwQCl5omaD3UtPofVLhl8WTGOiQNIRNWAB1X4bDpT8tdOwEIp512/XbzpXTmgL0u4Paw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DM6M3o/B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cklraIGe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DM6M3o/B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cklraIGe"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x15h523800
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:27:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GmXXSLuM+65AEjIHsAa+PdHzF+2smBIWId/4yRgNPeU=; b=DM6M3o/BC5qsz4we
	cdNf03ltSDaY2K9VRJ79T9yQS9IAn9ldHSwK2pjIrg72Pb7vO06yENIzro0aCY0f
	8J2GJ9W8ULSD3hr0LQ3NypFN6jnhBqJJJAzXva78MAMVLgWr2Ac1zkNxLa/uCUF5
	bAhl/E+b4ihgf1AjHXI5olaeUO8ZbCeODvg7tolNYt1zyXS0hWD3aTgGnw/SqXD4
	kgQk8oVkBX7wiXn7NdfiatXcnalbIDiHStdHEvhRhEdyGBFYOPZGusmAaiOKCyoE
	R9RmRvILPbWzrmA1HI1ICMGaXtzpsbN1erj+G8UwJL1X/JFnF0Yr4zPYES0+bDTy
	Py36dg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjrtt0p8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:27:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfe75b7dbso26247361cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 02:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784712422; x=1785317222; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GmXXSLuM+65AEjIHsAa+PdHzF+2smBIWId/4yRgNPeU=;
        b=cklraIGesxfZ4ph+c/sG0l5Pb1ZBEa1gWqPLbtroMo54XkXFV8tuxkZbaxNw6NkRqf
         kY/YvGiAw2/17So8bTcBdTsHZyaxkNIVEG1dVwm+8wjIhzqdqOxaBdjZvnuOQ20yqJdB
         X0uXZEoKLwYkfuZIESCT2xxZqjcUEmWGJhM4nO8AK9Gs/RsgGO4hWt2G+2BYIgb4DYLP
         NvH8J7n1Gk7uve+Ik6MsTa4I91HgRnGI+ME1KfidUzLxJIJcAMy/pL5fuD+IZvjRCzP8
         OSF9/ThwjU4IVwza6PwSq8lR6IulU4fE0/gkOuhnyRvBsQY04xwRyno+BDc2F4t3ySvS
         cnHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784712422; x=1785317222;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GmXXSLuM+65AEjIHsAa+PdHzF+2smBIWId/4yRgNPeU=;
        b=AsxZREhho/DQ2fJ/GXWpI4m30aQYSjsQm3Jbr4nrlu0TGyyY+VyWhp7q6tt6qCFiHL
         rZYfRZ0cpMd9edTKk5GsBAnzaC8MP2cWy7AS9ccIssOUANI9Vs7FGnd2z5TfPqTXLxwL
         wQ1Hk1tcpFCUfTgsmDpRYxJ88dA3XvbadSuM2oOEK3Uyf+IfFiCUguhUaWiR+nma4i9H
         +mqiVPsqhQ61zulLTL6RZ9L+sOFu4E8j0HFVRH86xTlbjFjnvEVcCyykUMN584v0hioo
         IwD4tjwo0zLTQLwFm8bmI4DPkaXk75wSrXGYrcoYRiFW4/o5K34Nsn7NXzSfgYNnG3pJ
         Ammg==
X-Forwarded-Encrypted: i=1; AHgh+RqzPpAhkYiT0kQMFmOfYA+UBYMGaNbIWHpNa8djO6TdPja5GdFbIkyQDLen4LLOLnYlM3FCr6cXQojqJL56@vger.kernel.org
X-Gm-Message-State: AOJu0YyNOWxGhpMpZ39tmWyOgNIKoI3KYNeOc38JnY61tJ5b159/8qK1
	3FhN1l/q5OkFdrhxb6zJluf4tBdIZ/iF2bokpyPyzxvWZeVcoxJuZ6mrewWN7aaVcGgdSYuBEiM
	l0IZzf2sxyrKgYTx3V5KdwKktLVZ857NNwT8suzjuuO03LpyY2lGNY/FIH/s/siY/2bjF
X-Gm-Gg: AR+sD11OgTyMap/suzEqzBuEMg1XIxJ44ouKICrEFoIv/Mi3Ra5DSK/jMzzun4Z8FRX
	6NP4CUjQmaIRxMG+9pLiYj2RhF1DN6RdWQzlR6O84zCzS4JpQVrsMNhGgLaPqUlApU0FyUpUAdn
	lNBBP5kRp54fkZuFZIfqk+ZMYO3OkqzrROIV/sHqJSfBMqXTcuhI6KCv7Sb978/oHfoJKsJWBAo
	wy7wMmyEE9qq3ihiDpcpfvE9JhhLL9pAgd5vTgNeDlCVxxJZ238hkQbBqOJ4dUFaL9kkkz6pFbG
	KqkyW7oSaOsXHXVSVVPJZlAkiw0QYYLvyfe4UuSQONg12+kDZzrmFhjZeAVoYsf5ttxxqIHRdmW
	0f6EXrRdmC9AGanJsCF4xxyxP
X-Received: by 2002:a05:620a:2548:b0:930:a08c:cf9c with SMTP id af79cd13be357-930e6f6532cmr568150385a.2.1784712422526;
        Wed, 22 Jul 2026 02:27:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2548:b0:930:a08c:cf9c with SMTP id af79cd13be357-930e6f6532cmr568148085a.2.1784712422027;
        Wed, 22 Jul 2026 02:27:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c903c2sm76219766b.32.2026.07.22.02.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 02:27:00 -0700 (PDT)
Message-ID: <b8f316f7-0036-4d10-987f-c43d60dae854@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 11:26:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] soc: qcom: ubwc: Get HBB from SMEM
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        sashiko-reviews@lists.linux.dev
Cc: Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20260721-topic-smem_dramc-v4-0-748f992278a3@oss.qualcomm.com>
 <20260721-topic-smem_dramc-v4-2-748f992278a3@oss.qualcomm.com>
 <20260721124005.E00041F00A3A@smtp.kernel.org>
 <6rmntcmouwenb3t5xk5rh2rijd3sc3re5m4aeuqive3wifn6ux@hauua7ltycvj>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6rmntcmouwenb3t5xk5rh2rijd3sc3re5m4aeuqive3wifn6ux@hauua7ltycvj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -Z7hUCvOM25brN1FR54_o5dZO0k2Jv7n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA4OCBTYWx0ZWRfX3gut3Fhigfr4
 xie0SwEKhipryMRNCbqF4E+onVoO+rbrQ0JD2KA7BodBlv7ywZH844XJJYwqMIXsL/+jyNJdZCE
 UpCrwnuZ+Y+z67y2/LcJwJ97GlbaR1kGgjjXaH/0m+HTQtkl1mYVTfp7j2cCkAVtpnoDRs+Ch8h
 qyX9NbsO6mLLoH8QCapyKnHq74C1HG+YkoncJL6x7YhXsrbYYLePtuK6ohnETet1N4PRXjM9Nyz
 0+kG71WtrkofjDRBk7mArc7A/pQr2N85njoTu6iNcWLOMymSLRvogqvqeTUcyr1/B6IAP2cCrR9
 fnuZkaOExVRiMN4iKRSaCeRUEgClZ1/tiMQbZC5+7sJHY69/efKX/SIvxE5iKj5bx2/q+kR90su
 gyVUYzEOMdrhPQCLf4WjD/ow6bw1Xc7ObWDGquo3k857fJsxjSW13qlFzUKvuXaIbhqPM1QZ52u
 6oTcz31avS7kK78f4Lw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA4OCBTYWx0ZWRfX+94knC0eH1KV
 dSm0qK6Ay5aX7BAHB+onbDNY0iHxE7gaCvMPeGYl1O5Vkc3JG/MWruMKpyo9TJXy7ccU7oOp+Vf
 ZcNfzRDPvjcXpagr1sOlN2PESLElP+8=
X-Proofpoint-GUID: -Z7hUCvOM25brN1FR54_o5dZO0k2Jv7n
X-Authority-Analysis: v=2.4 cv=V8lNF+ni c=1 sm=1 tr=0 ts=6a608ce7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=Ey9pX4ziOnSd-lTtWQwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220088

On 7/21/26 3:40 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 21, 2026 at 12:40:05PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [High] A race condition between SMEM probing and `qcom_ubwc_config_get_data()` can cause the driver to bypass probe deferral, incorrectly fall back to default UBWC data, and return mismatched configurations to concurrent callers.
>> - [Low] Missing Kconfig dependency on QCOM_SMEM causes linker errors when QCOM_UBWC_CONFIG is selected but QCOM_SMEM is disabled or built as a module.
>> --
>>
>>> @@ -178,9 +195,30 @@ const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
>>>  		return ERR_PTR(-EINVAL);
>>>  	}
>>>  
>>> -	return data;
>>> +	hbb = qcom_smem_dram_get_hbb();
>>
>> [Severity: High]
>> Can a race condition occur between SMEM probing and this function, causing
>> it to bypass probe deferral and use incorrect default data?
>>
>> In drivers/soc/qcom/smem.c:qcom_smem_probe(), the global __smem pointer is
>> published before the DRAM data is populated:
>>
>> drivers/soc/qcom/smem.c:qcom_smem_probe() {
>>     ...
>>     __smem = smem;
>>     ...
>>     smem->debugfs_dir = smem_dram_parse(smem->dev);
>>     ...
>> }
>>
>> If a driver calls qcom_ubwc_config_get_data() concurrently during this
>> window, qcom_smem_is_available() would return true, but
>> qcom_smem_dram_get_hbb() would return -ENODATA because __dram is not
>> populated yet.
> 
> I think this must be addressed, the DRAM data should be parsed before
> setting __semem pointer.

The DRAM parser uses qcom_smem_get(), which relies upon that global being
set. I suppose one way to fix it would be to initialize __dram to
PTR_ERR(-EPROBE_DEFER) and returning that if we need to, but then we
go further down the hole of needing to assure all these getters are only
called from defer-safe functions

Konrad
