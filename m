Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564983B961A
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786953012; cv=none; b=nOeezpeXReL3Q9ewnsZQ9/t6ZmZASiYnrS24Ll/AQkCm7cHFe+sCNBeyG4WG7eLMLFwQalkiiNFDN2eCMvoAJlNDQi7sRtlPUtROz1JRifBkUoKhyUNR70Kp0NWlmmEJDkMm7s72JpSMX6G0Zux072JdFFz7aAWDY8UWwm+42Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786953012; c=relaxed/simple;
	bh=k6qJ0w8faGh5iZe2bWgTAvS1rr3idWT5/kIKss0S+CY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bbahkw4tM3VFJFzbQ54CLcF1EiJ+BjWZRbnJxaj3/lufGP1rJiJgfF66f5OIhcrXCwmuoTaKFRJAfqZTU699IOXBnykJDHy+CvvuBBw45jK6hoWETXephAO4yTM+QTfsLy5loMLjCbY5mRra/1Fs5XTJWsL6+cJENYWW3HWjx9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQUA7ZiL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bTrMxRtc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQUA7ZiL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bTrMxRtc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H74bJO373097
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GVBo0uEIEIai1loPWlojzjwt9b5wvxoTQFdfmU3fzfc=; b=jQUA7ZiLgyDksvRW
	jc0fmwKGPnmtyP9DwjMQkBEFfQk72T2+i6i347GIPVM7oWZQqMu0DlGdjyzw4Xcq
	/8UkGAwo+q4K4qBzVFdW2SK5+xWnIGMDhmkSaq7xrlBWG0GQTIkH0eTXpq5EgphW
	r0DVCQMxZszhW+z0QTLVZvbjedKGBnVakdRqgpFum7uEwpFlbkgNYUcOv33rwx4/
	a9McGXfMPo/Gd857DnTQcqsfWDuSwxaxdhsHTLCtuK7TputfQJ6NytVpmq6Iw0lg
	n3pL2tEwHlCprDljDmAKbvxEEFbKn0Lb3v9PZx2fTmOq70Sbj/MjWmPziBOOtVNH
	7+qorw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wke06ap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:50:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51e9d892f0dso9002911cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 00:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786953009; x=1787557809; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GVBo0uEIEIai1loPWlojzjwt9b5wvxoTQFdfmU3fzfc=;
        b=bTrMxRtchDRBydbuqUPQJfENh8JaCeRPIkAW6OBSZOLL8yjS4PoxBkdCPnqEQgggYv
         RRpPq+OEZSPLJoT9/wZckX0ohQT+mHGhwe+sSm1oWAKl36YLJ4F2c96OgVVu4xDsWsH4
         rTtGC7DclZIiYeixvlfIABSvh6i1PwADqETA2XjTZejTeturMiFP3EDppSnWlHJno+J9
         qIIXBZo2XBVQPMOqNss0qMo9Vol3PHHh0FiaQD5VGPh3kqBcTXnRnQYkHtN549lKgU6R
         fLBw1hmCd3tcEdvNPFViNBw9hYA7jgvXrkSYsHlTpOha5UnIjP24FEvSJY/s3lTEYqTJ
         grzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953009; x=1787557809;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVBo0uEIEIai1loPWlojzjwt9b5wvxoTQFdfmU3fzfc=;
        b=RUjZ8FV6Vwti6HIlS6Qplb6hV2OjcC1v7zFz4szLtz1bWts0eJD8tE2I1o3479IRQ/
         +9F1Ml5r+kOnOmd5bFDkxI7mXnIxmWAACXag7gBYZCvxAKGXGKwCKyxqO/NCAn4MISPb
         s3+p5+0JSSevtDSEOH5VvuZhRbMU/UpbhmmBE/BBib3Ee+2n2LfuWQr+S0cNHG4EmCdu
         xmRnCio+y4cWcTyOzqKoLTcyDIkAAkyTXWqYPjURguV0D589qMbrCj2anTBeWPXvptNv
         BSA2U/6ij/cNtHlpYMSZVHfOJjSwAN80J1SjyIqTz0YP9nIpyI/umH9QDV5BMGmyOFrr
         05wA==
X-Forwarded-Encrypted: i=1; AHgh+Rqent0F7eoXowKcRyNxtPFLc2sN9X1kKI1z4+lPJTdPHIYNb8UTCZ3ngCE5zdux7Qx+czPhObxF9Gifow76@vger.kernel.org
X-Gm-Message-State: AOJu0YxI8aKHu1gljW68wpJ9vYakb3CutS+yUyD6dyXh57EEoGoI4xrF
	mUM7ouXqVItvUEaTGL43PDqaoU2+x7G9Gx2lyceK03FK+Z0EjDM2pACAxufvj6X2iwIjKd3gcb7
	2MkYFT2TGJkKgHO3RDGGbRc9b8KSJ+EGPjLKS/QjRtcQGymhEkrMvytLW3lB+GB6q8usN
X-Gm-Gg: AR+sD12Pr13YjPyVMDtIz65Ud/hr+sIq0oiSh72R5Vxf63/9c+8P6tZJN1e/LvLBop3
	7DmBh1zFRzOCJZYgtQ50qS0WQOZMhg6u7xpJz2GhzqqsS257a3cZC3bd7agI02Q37vi6OriXMwI
	rIq8zExme98OBU74Ju7Md2flMbJD9vzgC9YKHs8CB04OSv4J/8bgCKOEU8nGv9zx0FdJEvzPFIo
	LO5Lfl0xKrjRJsaM2XRWc6VNdB4jL8y1qFIv5gKJ37L1xEjRWBQ8f1grVG9313VwbDvUhs5TLYM
	xm72iCE8yy2O/n0LCwTpsXPGoflulj1lOw1698wgbj+l/xWUpp7uZE2WpxJOZMXuqeZLYi+eidA
	WJYiuUzpHbZ3hlWY/UdDB7Uel
X-Received: by 2002:ac8:5fd1:0:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-52d852d4f3dmr169407101cf.1.1786953009579;
        Mon, 17 Aug 2026 00:50:09 -0700 (PDT)
X-Received: by 2002:ac8:5fd1:0:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-52d852d4f3dmr169406931cf.1.1786953009215;
        Mon, 17 Aug 2026 00:50:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fe6a073sm16587866b.9.2026.08.17.00.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 00:50:08 -0700 (PDT)
Message-ID: <31fca5ea-0937-4899-b8e4-6ba4552901c7@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 09:50:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm/msm: Guard the QCOM_UBWC_CONFIG select with
 QCOM_SMEM
To: Daniel Baluta <daniel.baluta@nxp.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, nathan@kernel.org, imx@lists.linux.dev
References: <20260814141724.1006382-1-daniel.baluta@nxp.com>
 <20260814141724.1006382-2-daniel.baluta@nxp.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814141724.1006382-2-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA1NyBTYWx0ZWRfX/7g7IoTZudUh
 ZptdoeRPAuP38E90IjVbPf0dcPlj9cvYL/011vyUhe+QVOxkenF5WxhBV/E8nmsQ0NvwD5wJFLP
 qdlSzjtnUWRz39BNsdMSGLeziL/cxljkz8Sf2Rn9sbBaJkw5XHiwV5up5NqsgugxNMZgf7qcmg4
 6ArBmBS68w0C/8bbvVFCRPrSzaPsnc829rcdxPnU2SQYQf6ILZBoGjRMN9sqw0BGEtiI6yMCSsl
 QhYw/DopxjOO/LC2BYZlkTl7ewg7mO8ls4aMg4BsiKHhB7IG+tM2XO0cuU4RpaIaWddbJDzT3Zj
 KMHUuVlxr4xE/T17wzV/BWct8c4lUKVDxkO/3JNw2SpQYnfXPZWIR8FoBb1V6GL8byVxfpWIAGb
 CDBJQeN0uh80Xi1OCQXQkigwtYaTN+NKTQ7/QiUXuZdt4yC4gDNlq6RR6lEQDUxBjQkOMXQ3qVX
 e8ZWEppvApfGHhfr7bQ==
X-Authority-Analysis: v=2.4 cv=QetWeMbv c=1 sm=1 tr=0 ts=6a82bd32 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=qCMfp5iw1hmu5WYrWjYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: IcVTB7_GXySQUoYWdqjPsppZWvwDBJ3G
X-Proofpoint-GUID: IcVTB7_GXySQUoYWdqjPsppZWvwDBJ3G
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA1NyBTYWx0ZWRfX+6i2mwcmZfim
 chLfSpwOuKhCDqe5uT494wEQQg8FndALu99hJv6kC2IGDx5QOPanzCys2jJQo4WnAVY7pOvNqCB
 065F5ymJDLNJ2bF5tWb+fvUFDsaslZo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170057

On 8/14/26 4:17 PM, Daniel Baluta wrote:
> QCOM_UBWC_CONFIG is about to depend on QCOM_SMEM. Guard the DRM_MSM
> select with 'if ARCH_QCOM && QCOM_SMEM', and add
> 'depends on QCOM_SMEM || QCOM_SMEM=n' so a built-in driver is never
> selected against a missing or modular SMEM.
> 
> Fixes: 1b445022d1d0 ("soc: qcom: ubwc: Get HBB from SMEM")
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

