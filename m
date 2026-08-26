Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C618BDF59
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 04:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787719741; cv=none; b=uY5DzXa3HXaarPd+kDGkfaOLHxEyHK6KI9w3ZBjcBYYDEsCO1xjoRkSicFs84fYQ2fOjHNxKjL05qCbOt0dSjxilNP4+CvrdpFvcdbZWiVGlqJyICKozAFM205jxJ+8Fo/nf8f0gWNxzPQAgyxiRPE6boOGpzZMwg8dkKTKDrec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787719741; c=relaxed/simple;
	bh=G73Gea+X6pCrTad5LK8C8ejMSm8oWHzB/RI7wtOtRM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KYmerWzcHif+kxxi7iKS/F+IA6j9BV1MeUjvGKbVXsqnQOLJMbrF9oMdfRVwM64OeRHVY5cBWlKIZrCJvJeo2kh1yH4riH2RGaaQsbWW2O7b3mvm3hpYYtKFPw5jmw+bDP7YEDqU65o1w1wAMGfU3514lBretWyXm+4h0o85/Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TrwNezb2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TlfyZZvz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TrwNezb2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TlfyZZvz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q3HYCN2705866
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 04:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UkMuxeciej74YqTR1ylmVxJmdnK9fJHKv1RQPq2U1S4=; b=TrwNezb24hgMKbuQ
	fHlDmn0k5oqcgRg/9i4d32pZRVGPQJq4yAdGaJg1P+wjqBTSqs2IzJTvfOwN8je7
	tTqcpk39q9DYrmnuavpgMdSILcQSgH9rHJYr1I8eEdgJtwQHlXfBZBD0swdCCym4
	ejULaJMvVlDhCwlJUkmjGPhlup4Avb2xYZS4vdk7e4tuUVK0uYjHIPX8tmnLUVBz
	e2j1cywWgYclaE/qfkZuDPjlvT6q+MyXqJrKImmtTkyG80a71ikATsXMqdvS1V1P
	C77cWdrou2gVB0QhPMB3qBfOT8mj6wRtCnKAk0kCMTMezVpPRQJsOYxlHXoAbTji
	fqxnfQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9f9ut263-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 04:48:58 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1b8088203so775109a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 21:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787719737; x=1788324537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UkMuxeciej74YqTR1ylmVxJmdnK9fJHKv1RQPq2U1S4=;
        b=TlfyZZvzHTZk1WnxKE+y9JJF8L/AxNqyy8zB++bfesTzISBurBEu4XnFFj7O51O6YM
         MF6xqVrAtkXAkfYsPBAIMJ8u88G6dne81SHhKP27ISR3zfiRHFkWgyJSw7SVwzQaojQd
         pGQOTDbhJg4/bbbrjv+Gvq8tYLfIFmBfHylOtTrR8T0snlv7Yoc3c7en0p2tbFEiuMPW
         iD+NJYmdwRyAiocl10gbfPRlguVpg+fXUnOKGVd9XLMRtelhx0ZpNpcCBQPCRczeewh8
         QGqSizgQI/oefgPCdanLfhh5DBVmjfKnyYwPl7YlCDsqzIDJLz21nFpbXn0GpjTYFIFj
         6BzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787719737; x=1788324537;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UkMuxeciej74YqTR1ylmVxJmdnK9fJHKv1RQPq2U1S4=;
        b=cZ38rk2+u70gTtcWkCN1kC0Jkln/XxF/JsM9k7A09Z2pUncjDZ3dmwFgziTYq3ygS/
         +ggHKHUDFnec2MFXHG5EL6aCDeE2Bz9CuJPopDmsFe5x3cWbZPCB+IxHhMFc9m3+Scx+
         680PuquZxkzGXWNTOQBzWGB14lxNe3PXMgDHCnUMvI7zk6f0MZkF4HSLTLZCGRR3C/Cc
         EYX2REFlzp/L2eqW02UUBrjz7X1GXuzI7PyxTMdcMvKy52zyKq7MUEfFxmXTRIAgTyod
         QGP237fWrbfj4NxRh3NIU6WElw5OfPIv5dmcXASvf2p2zsSgNYi7vAgko74YhL3tI+xi
         H3HA==
X-Gm-Message-State: AFuF++ms46H4MwJ4vCMW6TsjR78r+DZHgxpIX1S8ChlSn3QhZujJFNXW
	Yu3USuUyQ5Ksfr6N0RnFH6w2vjLdjmEnv247bVQbQvZ4rBk2hYY/6C3Nw8O5BVkmkhgcH5JRl1I
	oSrZTbQsTDn1IVU21MFSRVjxaH7PlFa5wI3e+FZ4Rpg3L3FwrXph6o3qLhtHxlAxL9/jM
X-Gm-Gg: AR+sD12p0LBIjkmVIWvD095cY4D0jrGbHMNN3Vc95vIxaZjna/cH3OAi/4qkmmOTEZh
	j36bWERE/2s8Pz4wZthefHZMVJZuDNcR+MKFSpa4mTSGuRUXIVHXO+JCWjmVa1icwuHqwy/sPIy
	be4JE1878ISQEgOPXke8tLNa7CVrBGP6jQ7nfnvjI+RZFTr7f59m8UugNdK69sih5ELf2Cn8sSE
	kPRwQ42rtQVtEsUrhXY58bM9rir06YijP+cmZe9b8RAxtfIbOgOSoRQC1jtx/Mqh0cRxgfmvzFZ
	uOQ98cSvPSX1iLJxnJL/T8KxWp1TyII2MSCHv7pcP01m83lR3lVQ2eut7UIwHGVNBHt/bAZqIn1
	uDI0ii6iYlnAZALvY/uE1TQsk7YlY
X-Received: by 2002:a05:6a21:6f06:b0:3bf:9b3d:61bb with SMTP id adf61e73a8af0-3cf84b4ffb9mr8167652637.16.1787719737508;
        Tue, 25 Aug 2026 21:48:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f06:b0:3bf:9b3d:61bb with SMTP id adf61e73a8af0-3cf84b4ffb9mr8167557637.16.1787719737017;
        Tue, 25 Aug 2026 21:48:57 -0700 (PDT)
Received: from [10.219.57.13] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283da25c09sm6496011eec.31.2026.08.25.21.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 21:48:56 -0700 (PDT)
Message-ID: <fa3ea7e5-2624-494d-a754-3ecc73ec832b@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 10:18:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: NSP Images upstream for Nord Platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        kssb@qti.qualcomm.com
References: <ca4efa2a-41c8-4658-b386-0bc691e95179@oss.qualcomm.com>
 <kug342o2og57tdhortgabobe4vdjn2jkv3bxoqzfei767neg27@46p2slgpyj3w>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <kug342o2og57tdhortgabobe4vdjn2jkv3bxoqzfei767neg27@46p2slgpyj3w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZlLKQ4VSRZOSQE3J6pyUb0ohLIzY5hbd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAzOCBTYWx0ZWRfX7rZn2z+pNcVL
 Nl2jSI3WErfFkM1xC0Y4G66hBECPj2bdV6NKu4RxX/m1c6nlC+3Y7S48nxyiSbf6afqJu+SLp+7
 9ZdhNpr6R7DsGm/A8R0dZLW+46Msku9Nd+4v7aY5UMRQ4+pesQjRhGLsmfofSYGKbZWaMW8rAb/
 zeUs6TQN6H9q7b7QFsaGwed4BNEb/yPxnvM3mACDldOgzzWPYYhof0coHSaiFJjOmUAhKwzDwYu
 kY/2gKAuz4T0Z7TXYMbd50bVug6Md5aKbHz0G5V4X5TQxovlKQePQvcmIfScXMb/s+ZMaXfxt1K
 XYiC0E2bgbkM7K+cxn3gH2EokkIE9C6xbJ+m03BRf38HJRo23nCzrJlOyi4QTK6JWx+vVE0yITL
 P0GL1jc/eEMrXxZ4Nu6WXAnU+EytHaGj41+k6mXRsvUOoZ0Rle0iu+fWPLfNJWa9ciddmELDocQ
 8/aU61zxhCr4EFtaUTA==
X-Authority-Analysis: v=2.4 cv=acNRWxot c=1 sm=1 tr=0 ts=6a8e703a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=BBcmEtPGImQZU0PHwccA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAzOCBTYWx0ZWRfXzSg93CCM9ehG
 Nx1DgQZsWBkONMC58tEhd1QfNZEklUnjAFeSC0smn1hlo6xgnP5ibGZVzYlifR5rFBi0gZBnzak
 fGic1/0PzGL/Zv/zu2GZBY4+K8zBhEo=
X-Proofpoint-ORIG-GUID: ZlLKQ4VSRZOSQE3J6pyUb0ohLIzY5hbd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260038



On 8/21/2026 4:22 PM, Dmitry Baryshkov wrote:
> On Fri, Aug 21, 2026 at 03:50:14PM +0530, Venkata Kota wrote:
>> We are currently planning to upstream the NSP firmware for the Nord
>> platform. The platform contains four NSPs, and a single NSP firmware binary
>> is built that can be used across all of them. However, the current SSL
>> validation mechanism requires a unique SWID to authenticate firmware loading
>> on each NSP. As a result, four copies of the same firmware image are
>> generated during the build process, with each copy undergoing a signing step
>> to embed the corresponding SWID information.
>>
>> This approach is consistent with the methodology followed in the earlier
>> Nord program where firmware was successfully delivered. The same reference
>> image is used for both QLI and upstream releases.
>>
>> We attempted to upstream all four NSP firmware images; however, the
>> submission was rejected on the basis that the images are identical. While
>> the underlying firmware content is the same, each image contains a distinct
>> SWID and therefore does not represent a binary-identical copy. These
>> uniquely signed images are required to ensure successful authentication and
>> loading on their respective NSPs. This requirement arises from the current
>> SSL authentication implementation governing firmware loading.
>>
>> Several proposals have been discussed regarding potential enhancements to
>> the SSL authentication process. The SSL team has evaluated these suggestions
>> and is currently assessing available options. However, any viable solution
>> would require significant design changes, along with the associated
>> development effort and validation time.
> 
> Thanks for providing a good summary. The mdt_loader, the module used by
> the DSP driver to load the firmware, already supports loading ELF
> firmware split into multiple binary segments. While this (legacy) format
> is considered obsolete, it gives a hint on how to support the Nord
> platform, while keeping linux-firmware contents sane.
> 
> Please split the signature segment to a separate file having .bNN
> extension (where NN is the segment index) and make sure that mdt_loader
> can load it correctly, possibly extending the helper code. Use symbolic
> links to share main firmware image, while keeping only signatures apart.
> 
Hi Dmitry, I am working with the concerned teams to get this implemented 
and take care of this problem not for this chipset, but a bunch of them 
that would follow. This needs work from different teams and validation 
as well. This is not in the purview of the image team to make these 
changes and push. The solution needs to work upstream as well as on QLI 
metas planned internally. The estimated effort has been provided to be 
roughly a month considering changes (generic) to all branches wherever 
needed and push after validation. In the interim, in order to unblock 
the feature testing for NORD across teams for the next one month or so, 
the request is to allow the copies of the firmware for now. We would 
remove them with the right solution as soon as the solution is available 
with testing.
