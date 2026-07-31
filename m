Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980C62FFF89
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 02:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785464157; cv=pass; b=Pa++P0MTr4wDoin1SSEovENz94UHOD3ru8tpclMyFHdhxQ4/eUBuRqh482LqXnkZm9LzSgmoLettvJh695ezz0rEBfij1+kDQma59g2zK1ZIVtDP/FoFKjdu4cJOe0liTtzxECnSOQ4hu4vF4iAuzqNZ0UWqn7lV3eyl3MPQdlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785464157; c=relaxed/simple;
	bh=WUnHklQ5Ba0l2/EdXcAG9n4coc5blXeAvMdqGp7gsO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ihuCv4ZcV3yLxpciBGBa7mtuEIMEA48l+mzatHbG3lw848fY4YyxsRT9DuWb/YyT2rjxf/7lV89XO2owSv+iQ1PI4Jkw0qJBzJDKy+psrjCsqMavhCNXKDRBSYRlVbFHvuINu5ufdD8zPT3KzGDoY7aUBrL3b/5I0vkfa27859s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dtHAHu/1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GV8gwe12; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dtHAHu/1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GV8gwe12"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V1ueus2869301
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 02:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GO4NuLroNOQHAFGy8okpcL7d
	vHtULB/L036T8NANI9M=; b=dtHAHu/1D6nrQDqpiAc8OQ27uc7KMMhVcV27CXkO
	jVk6PdJIJ9pnjtrprXsFNmaKWoLJHjIqVhjDCRd1h9FsHWZr/+wb2jg+YJeGdC9u
	tvcRroVkb5s+WeR4s0ySDx41h3zLglaewv+w/Qb4m923SFzM/6dWVuhFp7/CUbKE
	RlS+CY+h4vvZGcXslw5ND07t20geKAvgyLqTJY2q17jG+L45/cUEm+wmCi+XWLeK
	rTRcnXtE07eD+hMFfDweDI0onVVVcBr/UlOAJs8ZfBqLDtGfX9wjxG2FaiCxTqRB
	2qbQvEa6eicWr9zUBqYnxS6K6NXIPnm5KFrnwI+7E5P1vQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frhnrg60u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 02:15:54 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-975b2fa99dfso334817241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 19:15:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785464154; cv=none;
        d=google.com; s=arc-20260327;
        b=X4Bk9TMJ75JQD72HOsXd66Mk53FclVVtGJFiBkmkTXgWyYw+j8plvgwEjwFOKez7kS
         iR6MADmgfxkK9JFpH4TAdXoxjZEWhmTWdMQ/JWJFdi0NnhWXnnBwsryNPaLmyQJaGhAi
         jX364rBisvcIA4+hQqy/awfKBLSsun1/Oh0hkqSeDl2xsA9zOQxmr+kTTiZ5877wJPr8
         au41OD0bI/s4xoRt9ku5z0vqv6cmGhTewECD0eRiM0QZC1ZTVm5qZQX2UNHVMiw3Btmc
         tUQLYtU+vSING/+NkcRI935FVbTE/B82N8AteqE6Ta8s8VAsXJDkaiyO250ba24QZRPh
         4qtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GO4NuLroNOQHAFGy8okpcL7dvHtULB/L036T8NANI9M=;
        fh=uPR0L6lGLGrI53fX6wRwWlTVqrwJ4QSCynK9lL5Ih20=;
        b=UXoIbBAoQGnM/fOt4aJkjylCfo+af/qbz98VUgT/ksDtVNj6e9UF9WO2WnNl1kKmB5
         QL0iWv2YP6w/a63FPZ/Gcx0lAj1D8yjP/RZ5g94005AU6Eh7VbJz+X5koJK+1e5+7kc2
         lhlyL/ZVotLDpr9f12Yv0VvRfjFCiHOGg24azU3cu43dJptRnZr1nW17jowKBsEoKb5I
         kiSrG/5eCEINf8p+I96GwbZnGbC83a1VpW8Uyrk95j7nn4IodAD8Q9Nj1iX3a7bAL77S
         N//k1nBfwyXJx2yJwCQQmF/3QElXJTpyTkyReQEEvGStlWZ7T/NqHRYgOm8deO2yxguE
         vYfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785464154; x=1786068954; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GO4NuLroNOQHAFGy8okpcL7dvHtULB/L036T8NANI9M=;
        b=GV8gwe12wJ2vxmXrfKPZ6OmXyPANe5cm7KGunjFOP/hPUbuqOvc+86dFICPlGqmeg8
         e//j53NN7FsM9ixz1F2cOIaLQo7DjliSecV2Lxk7W0KEVgDXuUrpaPUOv/K9cD1uTYXS
         wkQ3vySD7joHu5C5LMLJvHDqs7Gyn2f/NN4DOBX5tsUUZt7HTr1THSqCoL+bjsRW5+SG
         qmLZWT93j9mJCkWM560l7hW8T2wjne8arIqniXlwaj/mxKEuZc6SdFXQ7kNam3CtjFb3
         4w2iBCUBUlIIGtii14Db6g3RXGa0xW0wxXMHJwEbnkqUJPb9U2nLn5f8/xOEdYxAmvQz
         Qfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785464154; x=1786068954;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GO4NuLroNOQHAFGy8okpcL7dvHtULB/L036T8NANI9M=;
        b=XJjXuLEnxAbrAUmoNhnJepBeq93fb7247sfCdcnfU4eNwmxQDMa/2xXgIF0hjAtJXM
         u8L7hRW0LhpgLBE5HBMxnHQW6ZEpfpPN1EVehBqr1rFem714T9cJjBVZZDIfS8AU7wZ3
         ETUNqFVRPE4EJv/1KRMnmoj2rmBpGH9HAISNcA/bKE7peETh8hWs7FPxq3sMgn37SUiN
         DG48lOyvH6LqOTmL95Ldjf77cV1wnNTEaPTqhalKJKlTb+R7cJlYjIQcd+HZlrRydInY
         gYECH7Xu5dbMvKGghEQ3+FunPQ4Eyz7kYrg5w/P1YDDHnjLqkW2cffREGExD3Lg+Gr/h
         VKVQ==
X-Gm-Message-State: AOJu0Yzi7XqBiDUe0HThfWFi89YndjwudbtLOFjArR7jjo/V/oMdnXOX
	Q9ZWXDQdW47oRyVd0/7w8hBnpQX0DQius8mw/f8zvl1ABbqAEUsQAK7wEUQy5CKNr9m924QAKv9
	JRJvWHUaOxvbppQXaEMVKRvqUBefw1C5zrfsMTR0Q4OsjF+YviC3CZQRvF+qnMFtLzy1kx4pPKT
	LlwbYIYJlvKYQqTWKo+6ijTNRuoWATp75KA3IpjbJdd30=
X-Gm-Gg: AR+sD110qB26tIQydEYi9+a+Jz0pVlA0EB/KfKa5YFsRuDD8kP+Ru8RW6P57QQ3yKy3
	QRO9LXlPo6Rr5lwiNxKKHnIVPSHguwMOGYOCx3BqHCu0KHfasHdz5UapCx+PI7lVI0NujoTonox
	9gwZrN44twGgOXhUAKqNoQg+OARz4vkMCipoPshWrqMA1QV0qbUNbMHw6Qlbvi6++E/h6FdP21h
	B8CdtBFXW8UjaAIkQ==
X-Received: by 2002:a05:6102:26c5:b0:74c:551:d7a with SMTP id ada2fe7eead31-758fe348fcbmr8288137.26.1785464153807;
        Thu, 30 Jul 2026 19:15:53 -0700 (PDT)
X-Received: by 2002:a05:6102:26c5:b0:74c:551:d7a with SMTP id
 ada2fe7eead31-758fe348fcbmr8271137.26.1785464153337; Thu, 30 Jul 2026
 19:15:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-knp-camera-v2-0-a21c3f0ecd55@oss.qualcomm.com>
 <20260720-knp-camera-v2-4-a21c3f0ecd55@oss.qualcomm.com> <e3de235c-e962-4882-b4ed-8001142c838d@oss.qualcomm.com>
In-Reply-To: <e3de235c-e962-4882-b4ed-8001142c838d@oss.qualcomm.com>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:15:42 +0800
X-Gm-Features: AUfX_mx2uqtzaDLPlcdhXc3xsBnuCIvxn_FgfBGtKePJ901IL02XQgcXYzZnFt0
Message-ID: <CACbMrhrF=jQ-vzAqOPQ6TR+CgJ_tZDc197zPkiTPHuF0RRD2Zg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: kaanapali-mtp: Add s5kjn5 image
 sensor on CSIPHY2
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=fL4JG5ae c=1 sm=1 tr=0 ts=6a6c055a cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=p_339t5VP85-RoGMPq4A:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAxMSBTYWx0ZWRfX1CRpCspIEkjd
 bHVHEPTz6K2+AE/mUytyLq1ewqA0fEgQ7kDHa6U6mp4jNq89ScxX0i0FwSwdmi14JmRj4u6wB8f
 OmOQiSl9RJ/HX1MXwtNzcKeT2ZPV7jo=
X-Proofpoint-ORIG-GUID: ce8vmVOp5IaWTCv-8rSiJm1SqY_BbpEG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAxMSBTYWx0ZWRfX/gCs/rvKxeXK
 JZUpPQO5JfE1Diw7G2++MLfnhZrF+p8Ru7dLGkUtLGw3HxX9wexNorkfjaSk101Gz4W2Xl/VMRj
 zwrHLbFSxdZY0Tj0LdIFcDHv2asxouVPI7GA/Fjlczfn5/Nj+laxPIOaO/9oSUXMoBfQ4A5H4kY
 yYNQ1TVOK2x/PkYwiPy/hqWxKy6fzj/yQX/q3MAhMjvTXRdJ/898hC9JvcSBVYa0w4mVt/sv9eD
 ua3TPJl0iAaxz3Tne+pDPhinJ63yyJFKjO3gkb8KfoHj/q572kS0QQhFvoRJQ5GXsWCtjE+UI2R
 b3f6Pa0Y+7LiIjwhkP0/gBQ7+i9OTJ52VKZJRlmz5Rh6JxW5UIfRFkwjAeoebxu7C/M7s574gVb
 AtTAOmqEN4Df07Ja5GC29yR3bnuAbF7lp9Bd6q7LSyFcDQoNdt04ifzig3nFgHORVwbKF2pVcJs
 AnGDgmF/Fl20bO3lK/Q==
X-Proofpoint-GUID: ce8vmVOp5IaWTCv-8rSiJm1SqY_BbpEG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310011

Ack. Thanks Konrad and Abel.

Best regards,
Hangxiang
On 7/24/2026 7:50 PM, Konrad Dybcio wrote:
> On 7/21/26 6:57 AM, Hangxiang Ma wrote:
>> Enable the S5KJN5 image sensor which connected to cci0_i2c1 on Kaanapali
>> MTP. The sensor appears on CCI pins connected to the CSIPHY2 interface
>> in four lane mode.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>
> [...]
>
>> +&camss {
>> +    status = "okay";
>> +
>> +    ports {
>> +            /*
>> +             * port0 => csiphy0
>> +             * port1 => csiphy1
>> +             * port2 => csiphy2
>> +             * port3 => csiphy3
>> +             * port4 => csiphy4
>> +             * port5 => csiphy5
>> +             */
>
> This comment is SoC-specific and is really not very useful, especially
> since it's an identity mapping
>
> Konrad
