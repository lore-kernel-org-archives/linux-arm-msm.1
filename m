Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740075;
	b=cZx6nyXCM1wC3XWHkmft8pfu+jH/mWaDlMqdHJXUc2UaHbnkQhMnDsLiHfWj98M1SrNp
	 aocij+SZLh2pQsLzvs9xBYMxOWnDq547NtEPJgkvFNXGdlGPUhIi3yFSCCfdRhIDMTwdH
	 UPQCTZM+b26E2T1bI/alNZ20qKPLYAb4cxjeK5KCOwlqTTPhb0mphVqpHNiORaq6DT0Fy
	 27w7wot8x1DLRY83AhE5j3RB0IUYf9Hej6kpHiCVjjTjMh289qPfSNuzUkr9IGrBXTpmo
	 F9fsO568aoiODrFXNloaV2Eo6+RsUfDr26ohE5BRczi3awdpKU0CjmcqlheNZFjDhXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740075;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3Stj3y7d2zjQ9nTgF2QbTYbeZnbVnfXOQ9Q7r1YW3jI=;
	b=m/ivqveqOk+qPPKbtGnMxadMDZeUOTn8Yb8SbcHef/cyFiffAPpr8son3hEr0/QQLRuU
	 kOV6WVsQztiYJRi8VqhApXKgW8qUOIZJx2yuhZ+VVY8HkEpve0S8FDNQIj9awXKVJgmax
	 amEtRYNNdkmR782kb7EkR3ByUo/sD7V8yeDtASTjafQqifTVi/9/IZ/ho9Y+1gpvTswoY
	 xH5fsRqM0RZarAg3xvrKQAJmh9Cd3QkKM9NhWjf0aU2lg3zH6EGRr6xgC+BUB9bkQ+XC6
	 cjnSfqcxLcJojEY2Xq7CVNaYtiMkK94+zsI3pmMV80w0/CaGtuE3sKtv5VTXRSdNoRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IEltu5Wj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cfyBHH5C;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA6E606A31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDA6E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IEltu5Wj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cfyBHH5C
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F8Af3154072
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3Stj3y7d2zjQ9nTgF2QbTYbe
	ZnbVnfXOQ9Q7r1YW3jI=; b=IEltu5Wj2EOEoYuMbU7Rp+yEdb5yEQO+oGDu7yLT
	bRNEcKHyufkkzCDVowcbhUqSUFKYTSYqeY9gvdi8IkIgJjoVhuzSqLDwp2lI9br3
	7wqzT4+vAj/YIX5gdZYNAO6z4GMy5kdH00HYKSYIbwt2KpItkAA8Fsl6YHD+xC4V
	erjT2+MHJkF7Kn4vK5fx9VLeqRG1EksYBRxZ+LDPr+T5ZE9OXaIA47mW1++QM4xC
	th8KAXMGyrsd4n0JHcNiYicFPRnKEm5PHYrTyX9Bd6NGMSakVPE/veuTxnvgmRRL
	LidPDb7hElvAW/wToBSUjUCElgTydbP/P8IYmxD3olhAWQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmraef4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:21:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2c0e6653so108425285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 00:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792740073; x=1793344873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Stj3y7d2zjQ9nTgF2QbTYbeZnbVnfXOQ9Q7r1YW3jI=;
        b=cfyBHH5C/u2TJJuBhpThjoMdAVlhknLN1mCb4bNplQaIHHxJSayDILGw0qJVtW8Rop
         GMkFHW0tIlyuBf52D6VoxGf9Xd9BbrUnclL7/HhqaKIfFYHxxWInSkOqQ4UckfRRe3jO
         4HuN3jWOO3p9YP8U0X9HloM87McjWp+0XAJkx2M/Pvl8dyIG729gAjxVghapkJVylmjI
         xqXK75/OkOxzl0mGlAo2m5ZAqYmFkRkEba9ZcFd7YnkMMRmmrOIwOf1EcQdQWb/lbqiI
         W+XlZf331fNwTmrX8fkAprrG2LE1o27a8AUi/IZ6F6XfaFybdnNwxO7FlwqlAFHxSsKQ
         2QRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740073; x=1793344873;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Stj3y7d2zjQ9nTgF2QbTYbeZnbVnfXOQ9Q7r1YW3jI=;
        b=0YYsKXiptSI/UD7uUK79Ncq6E8KVdMA6LxvTCsScXHx1Ui3rZSzPoHNRhMRkb0nhZB
         JagAcZjKTCv1srOK3owJj5djqPrq307FJ0fNwlijhlbP63IMPjs2BWYJfTsDptWQLwrp
         hR6EouIKDJnv6n5veg0HfSwdzh/TXnLwKVZThjyk/T/FWaCWNun4Vymhg7HpD9pnCu+z
         XN3GaifO/vZvk9EF4NMmRBg6jVzaDI0OoJd2SpSEUMdCKqOYpCAfLsdtlNO5/KOLBo9l
         Wk2jP7ChwfngFehCl81S2Ybk2Mdxt9QebyAGfFgLDQ+Sdo04EKzBLWwJbnL+Os/O9cx/
         aobQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3zGZ32zm4ouY4qgdy+fnQhSZtYdjOmG9lU4Np5xSW2xPa/yoBkPWnN1yhiFQqw1xfxzQPbVBxoSV2BaMl@vger.kernel.org
X-Gm-Message-State: AFq9FYLW19OpKOlarRkgDwLGXzr42PDcD0r5wua7V90FNnQbQq04yCfC
	THGB0bbtUP4XqCFW7pSPIruPPsDUGAqgIhdDhhV8fIDKNBjRrU3MQv6zhBlE0a4BvXbX8vjRwcW
	Cc7RyJYqo7sB1Y1A4Jg907PTELhO+olqGttXEqrjMStxhw7nL3AtlWhf7A03Tcf+7+UuT
X-Gm-Gg: AYBFou3hRl5zGcSAKWcMVtl0lBFVoW9WFNu6fTThng5NillW48gK9YBGpJ+8pShH/V+
	VDdEHqeUJAGMVgSe+Ir8+9hKsIc6KMUrkLLJY/9wHoPixXXtmPH7xTCNfTZRIaobQ2oJhRxMFy2
	tIe5LtVCSBWgL17eXtfa9AQcRbQA62uwzOZeZZ6aGxh7w0KyccQCH7bg8q0gxDezR4nNaPjWpM7
	vUoBDYSgsAy6G02+F+VluAUO0/4DrU/L8h1IV0JJtKxM49RTTmcFiwXLJ0B6zj4GDp7vjvWghYn
	Ql0zjiG6ZqMZMxd7vunjRSbTf2biAY7+gMJV1OW25dhxbPeHu22/tUkQYewuwW14/QU7p1GO+aA
	769ioYyiBjjTmJjJl
X-Received: by 2002:a05:620a:45a7:b0:93c:c4da:f46c with SMTP id af79cd13be357-93f6f824b06mr269984985a.56.1792740072747;
        Fri, 23 Oct 2026 00:21:12 -0700 (PDT)
X-Received: by 2002:a05:620a:45a7:b0:93c:c4da:f46c with SMTP id af79cd13be357-93f6f824b06mr269983085a.56.1792740072198;
        Fri, 23 Oct 2026 00:21:12 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21555fcd1sm15676145e9.4.2026.10.23.00.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:21:11 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:21:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 2/5] firmware: qcom_scm: Transition to the generic ICE
 service
Message-ID: <2bw26iiqyl3zo7s76hbpwotlowmeeecvqk33rhbcrb4as5blsk@q4yn52qpsieo>
References: <20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com>
 <20261021-ice-migrate-tee-svc-v1-2-b035be7aab0a@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021-ice-migrate-tee-svc-v1-2-b035be7aab0a@oss.qualcomm.com>
X-Proofpoint-GUID: sI3xpVFhV1qfsoLLxYQtyjoLvgxrXzss
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyOSBTYWx0ZWRfX88HtzYoCaLEX
 Q+5pZGMOiOYDcPzUWrbrMKVJwNj2FKIF/OHqL+ONiv174synNpvMDnZCc2SFAYdeylcenLuInkc
 Pj/9M3G5tjnKdmZvxYGDnbq8mJuHCvQ=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb0ae9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=i1ch1AlUq8TPK69w1s8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyOSBTYWx0ZWRfXzcyeYyZWSuYV
 OB6DC/1MiJkVwn2l4BLHCX79q3h9Ff0fFvaa6K/TARP1ZSNdCFHVBNDXlfWET443o1+5Q0/HbVo
 MpmNH/NAgUF9fWagZsRHD1KoSD7prr5jZ4KhxuHI3QMKLTiJBTnPP1WzFOQdGdGQHYMUdIkl0c6
 rRTUcddF3sRrI26aBbkToPHNiRVTRnIQetKQ0jqdK6/hn/+/9WUFdhrNwDbA6dJ3W6DYyHuxmT+
 AtJnoSOXH1Z8jgwF3Fneqd8u5WZkT3dv68MzDxkWP1OsPFfVftgqRnPBzbmrAL+FoMuk5jj29EC
 /kgGMXxMzZ2i+otEN5t+GsMM6aLZt0SHotlVfId4MRXcvuf3hbuzLLe/psz2q4drRqkI7aCeHvX
 6fxCsOmMQQ+J2c2qhursJPXxcGP4mZhd7YcugkyuJGxP++revHEMWy8h6LFTVb9aTqlRi1kVdmO
 HJdrobpBtjgn7UEoMIA==
X-Proofpoint-ORIG-GUID: sI3xpVFhV1qfsoLLxYQtyjoLvgxrXzss
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230029

On 26-10-21 21:13:08, Harshal Dev wrote:
> Transition the ICE related SCM APIs to the generic ICE service by
> registering them with the service's operations and wrapping them in
> exported functions with the same signature.
> 
> This prepares the ICE driver for eventual migration to the ICE
> service from the SCM driver once the TEE bus based back-end becomes
> available.
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
