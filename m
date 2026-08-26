Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F023368B7
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787749890; cv=none; b=MLOspD9DkBx+obcPhZcG5JMwZfyLD3AjHzKlc7pA82wO1z/lqwiJZ4cyN+rNMoNTMnbys2IBPgd1DOUzCHMl4h6J8sw0uDJi20XCLkqMUTAw94tZ7gKat+7YdF3KNZ2Iqg/cN3w3sYcH2nGjeKUfxYX0P0GEyD5ywVuQ4i8oOWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787749890; c=relaxed/simple;
	bh=ATYlLON9+41qrpEt1kq+/boPdshZPBXjRgOd3SdnoN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jWMIUaZTrxZj0jM/QPCM92Ft+IQyYZGQzZaI5I/ZOtl4TOHY6z5QCOYfH67pUxYe3CzoIu94XQ3kfXDdnTMLHNOpu3+ns4f5dRJ95J4imBdrRgKFAaQUV9Nh2qNw/dhzKhfyThP4ZFCnbPdIblLiazOpMuLzb/wNelQ7BTqMIVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W4GmvjPA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ak0ESWzA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W4GmvjPA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ak0ESWzA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCM45E699333
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RLoKBN/hoCc/SGUUxif+dFrKboRcx8sziXZKGnHtGCg=; b=W4GmvjPA4yV0WT+v
	uXSsbWJ9F/u5gWOY33QnERBJj8221QvIWAhwZQ4L2tQDF5ePMxSq1/WpyWznAXuq
	3nGH3g8Ib44Yr44ROiFMCodKTjtqy5jMEb/CtYGYTLom8iQl5N/dclFjToEEDMX4
	7gN1DUEJZ/fNhSKRVgoTN0qA0Ed2wNTfnPDnW5GfIHtfV6Q9icx+38IpMn/jmAXr
	VjVObsSZomOJD1TmvJ4sS6iHwHh++/DprmtB4vVNkqIeTqPmE+Yao4dOvlqfdmXG
	zNTG3FGPkQ/duY1e5g3+Hl3GouEhhY+bOf8xYdvG3dDTVnlVxouUjzwsE5lCnc9S
	9ooSeA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03a867r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:11:28 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c59dc5aa18so30161e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 06:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787749888; x=1788354688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLoKBN/hoCc/SGUUxif+dFrKboRcx8sziXZKGnHtGCg=;
        b=Ak0ESWzAwM7n7xe0ylw8zv3Hn3qwlRlWTjd7TEDhxIkQNkWAyAsxR3KDw5BvbpCu/l
         1ZJliigdaP+c88jZpXnLnRWFD3N+Hyyuxbn9VxE9vlzL6PICwpHTChSoLSFtMmAfHyMB
         j7td2HEWprLVPo1ufcgZga0/qSXMtljbP9dDTbZBnXFAnkO4p7WLNDXF5zwAT7tiUTqH
         VU5SfGr4roXIpsVy6+KQ5r6/QfI5JBzx3vEplM/bvKdvdGGb/wchPqXw4MkSfNDTDmRc
         YZ9hiySoWkrgZ3iMIfcuip09R0mhpgh6GxRvpR28WkwQ/qvk8NqjZ4Pgpqo/f784EkEE
         JZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787749888; x=1788354688;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLoKBN/hoCc/SGUUxif+dFrKboRcx8sziXZKGnHtGCg=;
        b=HDBTwo0BQz2AQnP5U0CjQCvrKRF9EQ7/Uq7vafL/FhmnHIdctSpyZjuN9e2rQT7jrE
         l/zRBxjuA1Jv0UA9yQhOFqTCxgyG4szj4Lt2fr3i1Kmq+IBwzGyJnNFVquFxJVmtyWMK
         VHKnld3k+NBtb5VaHvh/cKJU1cd2gQOPevsoMQxCTP/nt+VYD/31mRfXlAoWcTwnVbxx
         9RThPhUodJuLf5FwSuZXmbBM3aK7glk0dVmE8OYOpSm2BjSTRY76xFh6r6c6qrnhrIyw
         aj2fltqvDC+7/99xnBhPy09m+VpvUFy0QXCxL0p/TgxnaCA/GaLVbHWmfCEDAp3+d4X2
         yKfQ==
X-Gm-Message-State: AFuF++mwv5tfBxOYasdHHjRsj9PNmQP2EpsplsCBs+aB/4d0EAvm59pa
	tqiF6OTkTd5ftccSSqrAO18BbfnDNiiqUAGRwqYlGCxFidHtGl4/olRY895tre7Ehz1RpSRrrFR
	xHq0XfZ6M92/U6Nx4OA52cOtAPSZkusihJFfVz23s/mdMPUbHKivgMGbI1MiloLm3h3/d7BK1OH
	FN
X-Gm-Gg: AR+sD126EP84UDgpyhAzWHHpcKdidXnVDBxVCdg0hDuUTOEC/NppIUB5v8h9WlRtQFY
	P22dUmZQFNPO1Y0tgLGB22v++8V/3HTMNl3L2JCZsKZRGxfQLk7PurBcz74g/e+mnt3vb99SuWU
	6qDZ0uqvxIe3zYC98qn2ZOSpvHgqqY/hMmK2ls0hTW+WU1CfuijTCZolokDobFTom2HeNC3nXwo
	1kW6/Dz0hHHljiXVBhx3q2XafJ3Bg570jyfuFcGlob0Nj9fTwmL1+QraHmRvvcwIfIHZkdh3i/4
	q+fqtHMV0pOYkqdcZYqtT6qrHB7v8OsZiYnZ9A38Wj0mae2bfqR8Y4UWnSxv80hYXzPtTvANvmI
	XfCRffQ5ebQGlnKTPFpa78DVB
X-Received: by 2002:a05:6102:c03:b0:781:9922:78f3 with SMTP id ada2fe7eead31-782c15036c3mr955830137.2.1787749887771;
        Wed, 26 Aug 2026 06:11:27 -0700 (PDT)
X-Received: by 2002:a05:6102:c03:b0:781:9922:78f3 with SMTP id ada2fe7eead31-782c15036c3mr955818137.2.1787749887215;
        Wed, 26 Aug 2026 06:11:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88a928sm529427266b.33.2026.08.26.06.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 06:11:26 -0700 (PDT)
Message-ID: <cd8cdc7d-30fe-4745-aada-3e0f7db528a0@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:11:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: smem: support Glymur DRAM info
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260820-topic-glymur_dramc-v1-1-f714eef34e4d@oss.qualcomm.com>
 <cd434320-4bb4-4937-aa75-6f0dd081049a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cd434320-4bb4-4937-aa75-6f0dd081049a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZILSz1vh3UIf7nTAaKkQ8KKej9EZJLPe
X-Authority-Analysis: v=2.4 cv=VdLH+lp9 c=1 sm=1 tr=0 ts=6a8ee600 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7917o2VdScDyYRt2bNEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: ZILSz1vh3UIf7nTAaKkQ8KKej9EZJLPe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEwOCBTYWx0ZWRfX2ndDn0KvvStU
 2JgIer1nR7AeAIMXXO/8e2t46EFuOKM6coVfc2VshHrIqGudmsPViyORHe+4i2BFO0sYACCn3cr
 5bO6RlbYZoKiNnFquLCLkh8cn7j56WndAoZeekiQ+aKU9F4Pq+bl3hfX8AimlL02kxDfCC0njIb
 aQUgcxUSC1jNVmScqoH2iy6g1TUNw6Mr0wxZ4M2ues2ZNE1vSeCS7a/h9fWi1IshdiIDQDBCM5d
 3CwzM/AYLVGnOL19YbtIIjzEjsBsPzshXN2saMqTA+TIKoNfyjc2joSYazmXtvMpOBGbNg54vkP
 ZxhSAODzd4FvtKSeWgkpVApDRp/OhZ3N7IlAnUCrTqDFH0MYUOmDTxK/UGPN/BgdHfASVFmVFVy
 aUsA2eorfZfCcePMk5piGautMeN5+TefO/qF7kfxndZohhgQfLS0826mwtXY9r2KGiyd1/qmPi3
 ttSkS7j2p+DHTXB28iw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEwOCBTYWx0ZWRfXzOyyFPd27sgM
 KHS5icq2yQezurbFJ/ffKyyrhXIAuww1dJz2iEyHPvLYbOgCBp6r7qUhrZ3IRSxW32jUAl10T3j
 /XNc1yLvJaGXLK6RQiLBXuY4ONqskEE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260108

On 8/25/26 12:24 PM, Gopikrishna Garmidi wrote:
> 
> 
> On 8/20/2026 10:00 PM, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Glymur firmware provides a version 7 DDR-info SMEM entry whose 872-byte
>> layout is different from the one the driver supports today.
>>
>> The data contains 16 channel descriptors, 14 DDR frequency slots, four
>> 4 DDR region slots, a 10-entry SHUB frequency plan, and v6 misc information.
>> It accounts for 616 bytes; the captured SMEM entry has a further 256
>> zero bytes.

[...]

> I can send the overflow fix as a separate patch, or you can fold it in —whichever you prefer.

Please send it and thanks for spotting it!

Konrad
