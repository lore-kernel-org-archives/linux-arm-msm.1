Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473789;
	b=L2BxfAkfO1anbdUOQBFIAYKjzPEDZvwmjjUexM2q8CaT5ukWanQFQLQeh73rBIGiImxp
	 FkagpDvM1p4g2ibPQLZ1Db5AUVHK4pUIddIzNWeB0kx/2tpRJnmxkY5sjtNUKaIa5eMVl
	 db4we5sMX0TcxhoBIiD5weoI7Sjlo//NdX2pJf2PEy+nIdfdUQNrdMkI8B3J2v6csCr9j
	 0/eB5lfzUD/135cVPOMJ/URCeB/0YaDTx17LiX3wy726/s0AsKOahxaikuhdw2Rw4jnDL
	 pVyVd7Py4gVlnXDltl9L4UpO1fHumCAKMrNkZsEa22GPhL5v2a4z57exSb/iOldNIww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473789;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dUVtyLCTGUYG156kQ1fkWYumru+iqol7EbuNNIFYg3o=;
	b=vL1SKl/otIgNUsr3UteIVqtQPZTGRy6KxN6pzcd7vuzslecaHmB8vLK9MWj2DwI2rQ6t
	 3x/5ZjbD8v5ut6rfLBDKDO5hB+4E3Rl3X9adO3XEneCHHE4bN0PDR1Hj/V+SRWmNQbiFs
	 x/6XbKfxFYGNRZCwZkwZ2+7aKlaxiM45eB1mVIefQPXAi4ctDV+UeUWT/1kV1BSKm+7nr
	 q7UjoW5j83edEnKDswwzs/cCtP36UwtXu37Rsx7Ksy6T1HYPRf/ChK45S5dII7itnbNuU
	 07UHoM+mHqLmIWQKsk3+uz4GzTXWrOzGWaYI/tBMaxzfqvWJD+C873WPe4kYY5Z33tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dxL+38Ni;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GYOcpOf9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6FD606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E6FD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dxL+38Ni;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GYOcpOf9
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZcOT597383
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dUVtyLCTGUYG156kQ1fkWYumru+iqol7EbuNNIFYg3o=; b=dxL+38NiG8MbeOfn
	d6aS/acBV1QL2GM0cSBT2zvhDdgYEIyt9EU2f3iIMN1+5SC4YYfxKe22pT/21smo
	/vZuhgeiVy6ZHYe+qSNBzebYS8GepbNjSnA1Ofywm+BmCXcgjMalKwT97cwkiZp0
	5yU+v6xSGWtH6ZGX0vzl7m+lYs6469ZywnH8izxsAfV9KCzisA23ptHToE5ZKXr+
	JXCYsQrw9Yun+RlhJTUo+2eWHtCcttBUvv5nRt4wbiDufWNr8VXIxTeY0FLkfc2V
	NbGuugQQ4iaoBV5al8CwRSnaqK5Oq2a+2yUA8zDEcWWqEzi8nxJQn0X2+gsgmV3O
	huKwRg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt153xgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:56:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-54e4ecd1b4cso3903191cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 00:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794473787; x=1795078587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dUVtyLCTGUYG156kQ1fkWYumru+iqol7EbuNNIFYg3o=;
        b=GYOcpOf9uI++VBDT19ESYZanxh1dpt0eErTJk8bS3fNiR2lKvAcVNcdFSA3Lqs3lF2
         rmrnvNYmFnGoZF8c5DGl+k7QFsYuADqPqZwaklNZdC2y9QQ3ri1U4PwwNAHDR8erT1iy
         kk6mpDMkvsGh43yTkQzsr+j7eSkkf/8VJDcOcpjMwccoUwLlHSKyePpIW1noiGRvjcjF
         7nYNmwElzDoWplaPKYzXNK4f9ndDvwl/LPFehSwhR5fg9oIMFVkOYpRn7zuk6x1YmmXQ
         fKHf4kb/1JKlkwIug7eKMSC0BqhS7pw9s+IDKzQa91QR5RPOalL4+378v3dCaqkYFROB
         S76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794473787; x=1795078587;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dUVtyLCTGUYG156kQ1fkWYumru+iqol7EbuNNIFYg3o=;
        b=LQY/q9smMUghVsrpBs7IptBEjaPd7GKCDF29pjyh1kgai0QX+YNak+pIdTlFP7mAJK
         qDrQ4gxXXgacpwgPXrqa//JFNCV0xw13iIzeCweCJLhE7ll+Jz8Tkb3fR3/4oyVT2cPG
         22JTrs57aFqCrbtMUEJAJ1UI+/1RhiDrody22IPQ4aw6szHFHj4C3NbnZNQYwEPGH4B8
         fHEBg5gLtH6VGeNtF7Xo7eunBegLwOWOtOIiWYn9f0zH/Vb1HnsO9EFje08GmmVzc2UE
         bwyktZcYZFd8DZASKhoq1JBekndGf9RFddLs3UgVIRCfzu0hcfGi/z2x0KADUZEo7FWC
         Um1g==
X-Gm-Message-State: APuU4Z/qvT+9RKKJjg+r5LC6rEVFycl0+22vWm1iQMws5pz8Cb5LpBqF
	krHpIP60e5JLWB9nzIyQcNnHvCMStnuxTw+xUBRXfScznKwR7kkowuHNAHp0iv+iMPJQqgOLyPB
	vQlTXnOdfRCKF1jAnhzdOn0mFLWvuNMOMq+guD3sYZ6X6HRxIT1jc2f/qnk4grgiNhqGO
X-Gm-Gg: AYBFou2Z5YRwgEqFSV+P7sLeUJ8tknEOoKzJEtLHjPYAOGZu5lmDa6uGu8yqZWjngbS
	9BfsoljlNqwVG6Mj/unnVidwG6bBLbkGv6EEkLeeEkJSepB5S66wnuN6ULIWmeBmBK+XScV+h4c
	RCd/7mpvn0JYrPFJVQS8LEG+y+hf8Ht6s692amv7cnAirxvZYHszT9AlPrCJoDjQ7GdxzJZpGmO
	HOnuQobZr06Ul5giykYDzafChvhHbDDTBgsY8LKgoPWeVRmw9RnXRk5kgSuIax3BUklLmhJeGLK
	olaZual90HSvsSuNG1FbEafYI/X0d3tfxyh09ks/F/anmV3FXtLb7SzSDwQl0nQNwNEbHzGuqUm
	T/w5XvFrSy6CsbmM/nR0ZV+cFKTcaO0U9nbxFX7RwaGuTVV54wXUYKE29xTQXFmieHbwEo1U=
X-Received: by 2002:a05:622a:d0f:b0:54f:7ca7:1292 with SMTP id d75a77b69052e-556c1775341mr91984131cf.5.1794473787375;
        Thu, 12 Nov 2026 00:56:27 -0800 (PST)
X-Received: by 2002:a05:622a:d0f:b0:54f:7ca7:1292 with SMTP id d75a77b69052e-556c1775341mr91983821cf.5.1794473786802;
        Thu, 12 Nov 2026 00:56:26 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7834cdc23sm1471774a12.12.2026.11.12.00.56.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 00:56:26 -0800 (PST)
Message-ID: <141d09b6-8635-4e9b-ba50-3c5f352bf045@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 09:56:23 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a8xx: More nonctx list updates
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261110204732.531432-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261110204732.531432-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNSBTYWx0ZWRfX8Oq37tb/OQKb
 iWAfrgIiSf0HoZ2jQK9wAUf++r1JzBMGgFQyTxTyp8Jwo/Gw2BBl6J/T7HiykL23RaXuw005YlH
 4zOEFg4NcqmyVzBpeXpCFJrfytNgaIM=
X-Authority-Analysis: v=2.4 cv=Yrya1IYX c=1 sm=1 tr=0 ts=6af57f3c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=aXd3jGBJYShpFBMRRZUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: OWrcY-QCz9G0x98y8nkY8-X6jR8GWSaC
X-Proofpoint-ORIG-GUID: OWrcY-QCz9G0x98y8nkY8-X6jR8GWSaC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNSBTYWx0ZWRfX4wVwYxsQzlYW
 ynPYyhuDGMw79LUs1Kwuclv7MfazzTQAkz9LMPOQUzPqjn1y/ag6TfKepz97jZ9KnBmGAMmuN3X
 96LhkJwNNDNRNVEGKfU7qQVhM0PVg59DYwoyg4KhJQOUql06yEItuPVZaoItUiw+B5luwEvQ2F+
 LuHNJWKG4pLzwZdDpZRhrxRGk5sZlyGLlY2Z4ZT4DFjzi/Fhq++Ni4gr6mNrYfaPEwwQMsfVV1r
 zePMxyZy1TBjgXPBR5PER/JQj/akXPcZWBtjUcQ9nT4ZZIJsLENIinitMwcTRulpP5M4fJ7kZOq
 7xWgOth5nRxIimaOXOVpC+Ds6aGitRPNTNJH1XYX3y+T+O2lGBZkUBFhLmgQ+rREOXRV9hxtX3g
 RY6/hqCuRBPVvLGcNc3cIwpadNvw4WELcRkngL0wNewjjF7H25IvVrtQE1gt91IzrvxpmqVGjd7
 hWjot+1wwYbkPcHKEig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120035

On 11/10/26 9:47 PM, Rob Clark wrote:
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Any dependencies on mesa changes?

Konrad
