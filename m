Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6945338236E
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 06:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417139; cv=none; b=H0GtYFO346AsmQIhfSXsA23mtLfhU7Ux3huCNZyu4iybZWcbrg+ltZfin7YbLTu9GcjgwIPoPkZ/R3eq2Qc6V877aKMICxGUoRHD/mxBktD4/4zJHuNKbiuXhgYMxb2TH42j1fqLgn1pJET3H5RziU7mJgs0StKVpRC3/2o1D4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417139; c=relaxed/simple;
	bh=P0WZKLIMRk3awVcP4p1cnJX1V2AiQM3ZN8GnwrVM2aQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pddIhuKELLbSgpfDJfMn22zsL4m24479BRlu4RCD/Nf3lCUMaKAwTC88wG7zIy0jfBl7JBRVMHGxz21pbg0+FDc3dJP5ju0+0/wh/arljEg7jBQoje0RjkhN2bVO6huEjyMeRh5jjOMovPxvElM60yQBlY9O3aU+fDU79/FaZsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MUlR7FEP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mcr/PNPW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MUlR7FEP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mcr/PNPW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lMDX324632
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 06:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p5iK8zc6JIEJc+8JLHeWXze7Lpfmy72zwCH4OPQazjU=; b=MUlR7FEPb+eazx8t
	MXpGZLHZouE1kq6uSru1REnxF4yx2fxxUmbNfk03ujx783jlxUAf12dVctyWMoXm
	G//vEcuKw4/ruysX6FiMIS9jQ+iTlDyL6HB5j3B2Z3HMcAygO4YdpUhM9q7YNC7L
	B0bXWJVOnnOEJH13iKyRH7C8gpbzxZHRm6IROVuaiBuCeXvnFFdX8M8CZNyfJHxR
	6HSYD44SYBKa/ogv2/XBp4Di/mUeHP5Bv5lE3wi/I4I6mzMMiRuY4R4P/6eSPK8W
	MMSe0LbKEIzAJtW1bsdSFv6kTFmCYNlDke1wv8DZ28u3xT4R0BpwKt6VFUCGpxAA
	KXR28w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdnaunk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 06:32:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9375d92d0caso33914185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 23:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788417136; x=1789021936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p5iK8zc6JIEJc+8JLHeWXze7Lpfmy72zwCH4OPQazjU=;
        b=Mcr/PNPWM7ogg9rsjLVxIls+jICwmEgttwgA1vGQoZ8sK/VR9XiaqK+KVAbNLnxyI6
         KdaKMKSLRZOl7eccz8XelsfxtOti/PfZBQxclNgnqbz/oqMcgYGjY3Cw7rnwEVnFvG4c
         /EsEH4dPXJRd9PaUJqs/Xx64WPbkrNiSbXbS/bncpDlAfJ8HgNBLTY28Pts/l9+2P8Tp
         254M2mNt7RBZr3T1zIte5Y9HCcDF10qXVzQYC51zP9BAvxh8Q6hzzmxFEZ/IMIVl9egF
         7S3iancGXXdXFy3TpDmbE6BKZVejMrp27tHro5wmNotfTfGiBC3X2H8Nh7sSxXWU0Ge+
         EpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417136; x=1789021936;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p5iK8zc6JIEJc+8JLHeWXze7Lpfmy72zwCH4OPQazjU=;
        b=ojVpPbeaCcNKlEqNzVUlTUSWv/4oLdWhYakkEbWO07PdoLX1pzRyZNFD7o8CtvMHEa
         A/HyR2wEMLKA1qxtaHeSi4P5NO7aImQTgC6MNFX9kNr3hOvoP+O78/YJT21mO6JUg0kU
         Dd5O2BOkc53uYt4C60Ef0lKxltAFzN3ydhkagscD0R1BJDo/nMVVUfyYRx9vFJCIceKJ
         GoIvyOQw8V4R+oY2JGkLgPInCgHjZCur11ge7U2NZV2Woenhlw1RCDZt9wdfDA+XFey4
         1Go34xKz3DWq62YVbw0mktRbBDvialSkwMWX/UQF3sUH7idr6ZRgJviR+5EczzeT+Pqi
         29tQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+YjxW687yS5zqUabg+GgUEomzTJLtEm2VSzXxoiVi/ONM0zov+QL2DHXCUw/7Sz1V9oy5jSISbslL33nY@vger.kernel.org
X-Gm-Message-State: AFuF++l6bvSVZlB6TuOwdjmpd7uAHelSehPZJMm9yS7+vRdpAX0gGmt2
	A6xd3ekQh/UqcA8Rv6k2RCmlROc3wc9Ad+hza1C6EfAVN+A8RLwOBmNkwr6uySP1uBNuyqmMxz2
	ZkhxVlOoJqgTx6hYP2ydCfuQew2Ygnlz3VQXowCVk2QR5ZLkG5Jy/9+2ng0bhN59xAybf
X-Gm-Gg: AYBFou1Bca1hVj4zSklDvz09qoNRIGmg5QTIQhCaTDKom1fE6ELXWTmGPy3/S3DkhuV
	6plGRqsljU4ZsIeE78uG/gzSOGCbdCCSKAAROlu5RFq1YGPjr+tOCc4s+5M1VmCNlJIjyz9xtEM
	tDqu4zAIAJc/KmJHfMfbcrKlEiEvuC4jZMCad8sF5cwHKMND0CkvcMJ8axn4oLszUM9YLG2SMWx
	NnX4NxOUZrHKWXrFMnmVCdFPqNebNCtVfrOQEGk/qPKnPlcPaJH11fSp8SbwVUyWx5UimtNQN6w
	A7bg9T/NJJKU1LxmvNO5YdA03G9/UZX4QRoslWkggiee/vcnSvXql+2JbKXx3gxBGOkBkGLCF5I
	0cgn+mLLbvoj+8M41myDscQ==
X-Received: by 2002:a05:620a:2682:b0:939:287f:301c with SMTP id af79cd13be357-939610ff47bmr767146385a.6.1788417136517;
        Wed, 02 Sep 2026 23:32:16 -0700 (PDT)
X-Received: by 2002:a05:620a:2682:b0:939:287f:301c with SMTP id af79cd13be357-939610ff47bmr767144885a.6.1788417136082;
        Wed, 02 Sep 2026 23:32:16 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4172091sm51776866b.12.2026.09.02.23.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 23:32:15 -0700 (PDT)
Message-ID: <dd3c20f3-89dc-4b5a-935e-e0e142988e4d@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 08:32:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Fix glymur binding
 for non-MP controllers
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260828081542.52796-1-krishna.kurapati@oss.qualcomm.com>
 <20260831-messy-ebony-warthog-cfd727@quoll>
 <ce5bf06b-8284-4355-94bb-416a8e34bd5b@oss.qualcomm.com>
 <cc52ff33-3da4-492e-80cd-ba2b1711bfed@kernel.org>
 <6af2e860-ba7a-4f86-a0e7-872a312b47e4@oss.qualcomm.com>
 <06bce1c2-8498-4988-b5c0-ab42bfba86cb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <06bce1c2-8498-4988-b5c0-ab42bfba86cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a991471 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hQxA1nNTofH2dBn-U5oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfX7U3mqJFerpgD
 UmMazslaIdoBxda3GbID2yyn+4AVOlO5s5fZ5QmO9nOUhgrshtwyYREqHBSEX/ld6aYNJPb1gSR
 QLp+TRcd9ulO2Vs0hOdtj2MKrckN0lg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfX5idYjOdiBaeD
 9BTJOM1gXo8cPgBafdT+0FZ3U1+JafSVrg80b8Q7OFbGrU4LQfkLpeLWKZMUhIfsRtghGvk6316
 jo39GnsIuWN5urtizxt05mZy1fS/l3pRT4Qq/XfWieaSRDfCNHsp7NoMMUygX+mw/z+tZck4531
 AIizjYq6pRL0Ri5CvPiKVnPWis55fPrNAK6WhKg2QSIMdObb7WdbC2zU1AIgfBZM3U4UNAo8Jaf
 Ty8GyO9DPCJZ40Cz4nqTIIHKf8CmOILGZ5XbTgkQMUbPZW2Szu+RlU8nlLci+3826R+I15S9al8
 VMk53TeFxstZRrOzjTHWFA/MqgrNyA28fOduK7qRf2GgXkIl5b5GgT1fuPSIh4Obd7CnfKCgBvX
 ZlkhsnU4viVRHpIUv0VR+Ss03DkSXgEeQY55ZY8qgpnctEURKJfjEno3c3rTfqIVb7esT30weum
 ScSsEHgG1vXQEUsuRUA==
X-Proofpoint-GUID: cGIFME3GDZxyP2aEK1Tgl11hi4-U0GKN
X-Proofpoint-ORIG-GUID: cGIFME3GDZxyP2aEK1Tgl11hi4-U0GKN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030057

On 9/2/26 6:59 PM, Krishna Kurapati wrote:
> 
> 
> On 9/2/2026 7:40 PM, Konrad Dybcio wrote:
>> On 8/31/26 2:29 PM, Krzysztof Kozlowski wrote:
>>> On 31/08/2026 11:03, Krishna Kurapati wrote:
>>>>
>>>>
>>>> On 8/31/2026 2:07 PM, Krzysztof Kozlowski wrote:
>>>>> On Fri, Aug 28, 2026 at 01:45:42PM +0530, Krishna Kurapati wrote:
>>>>>> Currently for Glymur non-multiport USB controllers, number of interrupts
>>>>>> are limited to a maximum of "5". Either hs_phy_irq or ss_phy_irq are to be
>>>>>> present.
>>
>> [...]
>>
>>>>>>                  - qcom,eliza-dwc3
>>>>>> +              - qcom,glymur-dwc3
>>>>>>                  - qcom,ipq4019-dwc3
>>>>>>                  - qcom,ipq8064-dwc3
>>>>>>                  - qcom,kaanapali-dwc3
>>>>>
>>>>> This changes the ABI without an explanation.
>>>>>
>>>> As per the harware specification, the controllers do have both
>>>> hs_phy_irq and ss_phy_irq. Hence wanted the binding to capture that
>>>> info. Will update the commit message accordingly.
>>>>
>>>
>>> So the change in 99df63d20dabda8d7ae01bcca7cdb1e92110a555 was
>>> incomplete? Lack of context here is not helping.
>>>
>>> If they have these IRQs but it does not matter, then it is not a good
>>> reason to change ABI and you should just add the clock as optional to
>>> the end. Was this binding already released? I think yes.
>>
>> IIUC the intent of the patch is to allow specifying the currently
>> missing hs_phy_irq on non-multiport controllers (i.e. usb3_[012]).
>> Bundling the DT change would have made that easier.
> Yes, I wanted to add the missing hs_phy_irq. I didn't want to bundle in the DT along with the usb binding changes. DT change was posted separately:
> 
> https://lore.kernel.org/all/20260803-glymur-dt-usb-fixes-v1-1-0f5f52853102@oss.qualcomm.com/

Shipping bindings and DT changes in a _series_ is preferred, what one
must avoid is changing them within the same _patch_

Konrad
