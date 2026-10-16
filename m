Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F9F4A43E0
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155246; cv=none; b=C7AHooW7eGNLZgtUsjFIRYPaAhq5MrWle6d/sXRZXCIchsnbVPnIG5S1nbhvpW1nQv6SVC0/kVq/NHOuH9b1Q1NBnJ6gKPEi33q1KgoJ1O6bL1mcmwuHdJWBsBtJ2wRLV32v4m9GXBOgppFuTSpm1DatovgU48yh+0T7S+nk4do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155246; c=relaxed/simple;
	bh=agnKGDj9D/11ohWIAcMyJ9cAJeGIGPxxPTv4jH0y31U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PK7B09VbGeMPfKZ2BmThVT5A9hVLAeI6k9tdsVZNb6GUM7DK5Qb/uTdJ0hvQhIrvbsxNN3m3jTIbATNOhe+DofmRFMfENB52cHQt2OeQRTvmagd5Pg+YVR42yQxKrQoDqlYQPt1wC5OaHhiE/WJzBBnBKfvHRDwAL0PawA2Ppjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TKazVqn7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z6fLcB+6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TKazVqn7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z6fLcB+6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAA3LQ1647454
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SbaygPj1foUfq7XQq4qIhZBp1hiwUcPnKN9f7a+bhbk=; b=TKazVqn7RnIjs6ou
	NMs6ieCixC3sPlkI05ujT0rlEnWQ61HzgmlN7hMoldxL2xmKdHjdUF5tOnrGiu20
	PsXpOAFbpIunQFMYrmQnn/wI24YCXXnhXwffUvwU1GriB3pl+YCC+f+rU0ZtWlvr
	Naz9C2uKdkBOCWIgt4hbgVYCtVBgaVnJV3RS7HOVhHBFGb2CHeFBhh5LDsdToc4A
	Qb2tPKrvfHxfVsfoYiMEwF0EJz+OJio0eAU3xoXDNQRpS8/1WNMmXpk72qDv1Sg6
	E9+Yt2bT4XKXZiTsvDY6MfyYsdrWrIj1Wl/WTnhztUQUEC9E1jtS8K0f3HnzEway
	C4RA7w==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhumrjc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:54:04 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-17dc865c94cso2058049c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 05:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792155243; x=1792760043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SbaygPj1foUfq7XQq4qIhZBp1hiwUcPnKN9f7a+bhbk=;
        b=Z6fLcB+6FKccSaAp6h0uG9FJHOiL0OTmcSo/cp8+QWuGeuivHrFXvvO3X0OGDY3snB
         1JUgCRTpDEL7KxFwGAjMZRRVtaX7jH1TE+GAlIHF2zg9JJyb3tQyDyRVukO+K6b+mBOO
         DWTX3foLmV/8d1mN0weuuR572qQPJCvCmyFHulvYBcUjlH6enz5I0aM0v5jkYosbTTQj
         cKfvicIkh80bemZpmiDtOglAkxQKlcA7vmcKDyNP/rCw9XrxYZt/fjmNJwMi6TDPaFsG
         kHQiadQRLK+sXEhEekcElzyqVw6UCQbNBnAc8WJkq5xOTsnbu28fQqpJAc6N6Nytiuzt
         HQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155243; x=1792760043;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SbaygPj1foUfq7XQq4qIhZBp1hiwUcPnKN9f7a+bhbk=;
        b=EZTHRX9JHxDBTsUpiKIs9aWF7bs6uS5D0p8GKx4AHUydIoy/FaxjKx+q4GaPCRJe4C
         CRSOw9HgD4Owyosh5+kUVpEOfLN0GmxmZ9ao97bX7ZLHpNP2n7actM5HLVX9yBXjwiGO
         MvRG04CTiU24uFVd2r+od7+ANmL9mnW89sPzME4nKXVSoUCbWXj/eT3l+8q1hYelwKst
         fT+fa1ebdkHR37RFHD7gW+hpzi4fddMDAE9nhAf+/iTr27PPSVBDRBHd0IiMzDr01r9Z
         IGBsCqiat9yVNT4MPGPBr5aDhIfNlKKEEMoRHVYuQ9jhNbZcxt/3cRnpWeMpIPRGpxt1
         OBDA==
X-Forwarded-Encrypted: i=1; AKwUvByH8Pu1zCiubN/uX+0JWblmFjF1Mj/hMoRJttQVLMBkAW0lhXBFW2eDWVWSLIGoqB3zYV1VuUfMsEPCQWws@vger.kernel.org
X-Gm-Message-State: AFq9FYKsG12nqQ1YWrgoWZ5KHH90WMbx18WHfJ+i1P3zVS6O/qd+gWPy
	aVKIa1EJ8kxgoFYHJNCMv3ifmsyEAuAMjdyvMjfNpvPbsb+I95aZmsSgV4HgGz4Tcwo3PmV0r7+
	liW6vENtNhnqhfVrGaE0sAQSnq3zMQ0uipE9sJcpn7mIN81esntj7gx1aGQZBCajBNJaFBuk+VJ
	Hi
X-Gm-Gg: AYBFou0HfeMZ5NUzFJjret5MPYUyo24FNJGBBI3z9nRO/7Y9ALmrvLN5bX93noVN9IM
	AQPQbTxntU9LrcoIXvzQRwMbdT5UuK4kfp6lEEscWHVz+dMgpEefLZBv3r1Rw01Mf5hcizhPGEs
	sWART2/wQR+Ef+vZAO0PexR3WaZmJlwHy3HlgRHRcA3Oz3Z+Ce58AyK1GWWcPZwS0EkhUA2xl6H
	ZOLW//yQGT89ycjGXaVdb0Z3zZgaoOImUefQ1Og/y+19jv3rNd+hDobjbQJWVTG1DgPfwQJPCs+
	GVWSQYOYKN6IKQeUY1oXOvzSxiOhcmhjrH+LxWKAtcbxjt231r6XiFU0zi6nzLznacDFgm0omN4
	cQQRgadzHfaDJPC7OsOQKvHIrlMwbqQ==
X-Received: by 2002:a05:701b:2914:b0:174:7d98:fe9b with SMTP id a92af1059eb24-1747d99019bmr18067733c88.22.1792155243190;
        Fri, 16 Oct 2026 05:54:03 -0700 (PDT)
X-Received: by 2002:a05:701b:2914:b0:174:7d98:fe9b with SMTP id a92af1059eb24-1747d99019bmr18067699c88.22.1792155242548;
        Fri, 16 Oct 2026 05:54:02 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa3ebsm5344485c88.8.2026.10.16.05.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:54:02 -0700 (PDT)
Message-ID: <edaa8679-63a6-45b8-9e36-c04740f20332@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 18:23:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] tee: qcomtee: Track the object invocation context
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
 <20261015-qcom_uefisecapp_migrate_qcomtee-v5-1-1460691b35d3@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-1-1460691b35d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1MSBTYWx0ZWRfX34Mh3drQaW1W
 MzzpwrP3/VxF4/Dla2MDpmanqRh5iEgIDFJkJRcMRKolsPfzZzNwCfrFKwXo0pTKzQuaFtu0j6R
 06mRR3CI9db7xvAN2ic2Aa38M+MTkvw=
X-Authority-Analysis: v=2.4 cv=H+BOUOYi c=1 sm=1 tr=0 ts=6ad21e6c cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=wUKrATpdGnaYG2FsxpQA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: eisoCuvH0J95CUrSxlfGjbBFH3zrwzTs
X-Proofpoint-ORIG-GUID: eisoCuvH0J95CUrSxlfGjbBFH3zrwzTs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1MSBTYWx0ZWRfX9HLpFfOK/Wqo
 RpW0ASIVheBLKSH0ysG2lxs7emnCF8DeUbG9KLCPY9f3MDSOYvYxmC9Yyto/w7VGI/A8NL3ibKW
 aAGawfUvkDFnuCNS1lPcQOyx+nDsR+MpiGwdi6B/vNW1+0EOTWrh4ifMXKSthM9EYEWd7P3y4EZ
 ctDC/W3IRbKA90AeEPILlRdo6ISI1RBn1JDbrFkPoMZJKdsJ2PW+R06Ow8uO1u3jFz8wxSj/asI
 9+TMTdvXUoj6Exfm1ECHAJETIBH9PV3NHCOYCthIoK87JCtDrrJDlTTwJjGAGi6DWFk8dvRDRwU
 ApOQg53KfaUEG9d0wF1VUBmljcdKxHED/+04Or72NNLd2UmFQ2h9fJO7AoMbnI3u+meYo/7bx8y
 DrS6CJot8HZKqnkpvtqfWFX9MLDZ9TsNReNKwWQZKULwz6/7SXFlafpCKqnjAyHCjDLdjSZOIez
 DGUSVAAb7mrIKFt5C7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160051

On 15-10-2026 17:09, Harshal Dev wrote:
> QCOMTEE needs to distinguish between object invocations arriving from
> kernel clients and user-space clients in order to correctly marshal
> UBUF parameters and decide whether certain operations should be permitted.
> 
> Introduce an enum tee_object_invoke_origin to allow clients to indicate
> the context of the TEE object invocation, and add a kernel_ctx flag to the
> QCOMTEE context so the TEE back-end can track it.
> 
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com> #on Glymur-crd

-- 
Regards
Kuldeep

