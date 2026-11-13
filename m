Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794575962;
	b=hmQQxoXW3jBIhLWNbDNGwA+wwP7yC0JrvTEzPIMq34Y8ez6HVCG+DXiSb09EU6bj2+6a
	 1draL9N5s9Db4IZRutknfIlh7CGrpQdQEYDw5TUz/UHFR+z+bR9uin2B4JHA4FsaCMz82
	 8EHnyn0PnsWFryiIfxJvlI9QuGxtJpgutBzJB/STHrdO3qRIRYB4Ewby9g/o5w/nC6N0S
	 XgHFkmxdr/xLgoxl2lSyJxHyYT9bbT0xjx61Hp7DNcvfxOKjdKsm+DqSUJkj2AxLdn64Z
	 toS3h2s5XZZFN1/R4VSmRON1HPnGUhVu+7U0+h6zOTGYYTpsJaBPlw2ifwIeY4im7rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575962;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=p9+kvjIHXZ14mZtQUS7aUqmnr3L7WL4yh3D1cUye5yA=;
	b=GSPuDTpv3Ytga99LtnzM2Ek+Ko6n276n52os0V7p7aWVZ9gftYWTDCQdjNFBk2sAwu11
	 /CLfndKVr1b/Mk8BNQgHE3VGt7PXi5m1nISOY1kCqYO+CBDTM1MSNOPP/O0Zi6DJUVkbM
	 rP8oirVo9aa/9ofhtnbl9pjmQwXbVyssYsJfPLdOCoVzfO8EbaBN+fAsokqFksRAOYVQO
	 eZQ4eaZrl45KwcJD7R9s40qHnRKZ5+03/KcLsdsX0SC8VWrag18nN+TBHnd4t8fq75xYy
	 QiYGA+dsM8CyRCRpiu26mpbBjLheDIky/0Eai4s3nNPl7ZhuqraP9soyw2Glm0UD6fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fkiSGV9o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="eoWtndR/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96100606B55C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 13:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96100606B55C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fkiSGV9o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eoWtndR/
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCKhuq584002
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 13:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p9+kvjIHXZ14mZtQUS7aUqmnr3L7WL4yh3D1cUye5yA=; b=fkiSGV9oMEBen73e
	3z3PXFbDHhaz+jN4Juhm/OAHGyzWR5THMgLV6/ep/4YcHrW3wBHscpFlSK5Fhdxh
	nIFazJ31SoXEVTJMorHr2ErEP+s8LrOPOUQYvsD4c5miz/yPNVQYx47NsvQycS9B
	VEnRCv8R39sk3fGti9QdSBV1F9E6KdVnhmmceFE7icoCcsEGGqS6UGp6WnyUXwLS
	FOKRYXbZavF1jbKoO8ENEoTAIkwsdxTG2V35l71vpgfXVg1z2H142jJGEr7UjzEZ
	0MyMmMCRHWAz/qDuUYaMXveDgAx8EzsNeSbnxbZ8ooSgnT6PPk8PHbonx2IRjXTp
	EEy5Ug==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0akvmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 13:19:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91e987a4099so25911626d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794575960; x=1795180760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p9+kvjIHXZ14mZtQUS7aUqmnr3L7WL4yh3D1cUye5yA=;
        b=eoWtndR/pXHgQ1aFoYbhBcQbb8HdXDBaOcfLERgPDIHEL3i30UFrfDnkZ5aiP52R/k
         Hev0E2E78bM5OEyeAB8Q4uQ6P/H43tjB9/wFrzoH0ukMhQJ2hm+PnqufIw1Ud210b6bd
         xkJQNf/fhiiwBa7daeAGdvhLdSVi/1WHkUfZjIyQVk7a8NkPdntus7V0Y4PTsJB5BuMl
         qdl0tJrZ3sDhUYoxX7rVGXwVv2zV/Fe1w+e+kKSpW0KNL+Ac7/MBsjSBiXgvhST2Jh3R
         4EVHujsxjHn9kGZD2KekSIXnSdhJblc9kJBjhC3tXDbCfrKiqfdCnNiqcOxpSlbs5OQx
         Vsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575960; x=1795180760;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p9+kvjIHXZ14mZtQUS7aUqmnr3L7WL4yh3D1cUye5yA=;
        b=Gm8/kgoWbVvhNbUZhRl6BTGbPTbcHMrSESw5kruFcUzSaNo4vg/JVaVivtb76aN3Zi
         nLJ0En5aILB2kT/QCi3olwqS5pMcWQjGgVsV6mM7Bb1MVuJRDoZu8giafDLmH1JiYZtS
         8pM6nXJ99HP6l2w58dZi4OcIUaSdi7kbkLTvX6POkXV5G5k1q5aNQZHK9v1zeDIKLWxQ
         odxDlAvH91np5qsjF1PXSEad88OBl9id+kBTboSBOVS0Ngfjy8LCMef2CeHedQLJDkQY
         GJYAJbgePIikSbJxl+wmCCppog8tNh3kt332+/PwNNfAOtEI2vI4jwqY713WjwwmXdN3
         D/xw==
X-Forwarded-Encrypted: i=1; AL+hErFrud9ApQhrcDeKDQqLN/RODZDpshfZ3stKKNqCwDDNtiM8/V4RPndPQ4Th7kOhwJtA6x816vePK7hPQsfO@vger.kernel.org
X-Gm-Message-State: APuU4Z9gS/hMlY6YzDnSAQyGpKyR/U/pGeDPO2BtOksnsnf1YddYUFF1
	N7Te2Bx+aitoc5ycv2FzwaadDo9hB/laYH7BTSQ+w8baEL0MLqdNYKCyOTFdB5cSbmLq6m7HEi3
	qF4J5xY2ravHEPp9kqa3XDbIf4AcVz2AgZQBCc8wRki9Pi+YmCcoKdxBBMq5aqf6SmkI4
X-Gm-Gg: AYBFou0M6GCYng7owvaYFNtA18Jucz1x+4h0Ig7Z+TUfD8VdpMEM37eiK/wiDEXPeHl
	6aOEl+OIPy1EGIryblYvvGGnID6Re+be7D3Q46ykUsC8mZidtBV817z5VN0mYM70e1mUnmDi/ZS
	qrSEnZ7KJ/4VJAQxK2uqf2OALcnQe7mIMTPVDCjRCirXCwpyKdOeQaw0p8nS0YHa3WOewm0Foc8
	kkeaaz/M9ud3H2RkZjRE6YEYXS94k3H3Xgr2CstKson/JfT0uFMH3iutcMx021DXUhQwvN6F/eN
	cDKcquZMCLfF+Qh2DrR4FWxUS5E6d5pwWFo56iJ6FiwBJsHOnQ5uPU4IvK/L0mtnDfxmL4v3xe+
	ezObg0yxEDERUbOVfgtpDt4M8W8Jfj9XWz6Wy3IwRntHnfauLlT3Mj7oU0Bvgh84Jfc5fb/5AhO
	Hch9/T
X-Received: by 2002:a05:622a:991:b0:542:d089:2060 with SMTP id d75a77b69052e-55ac8d8b5c1mr34890191cf.37.1794575959861;
        Fri, 13 Nov 2026 05:19:19 -0800 (PST)
X-Received: by 2002:a05:622a:991:b0:542:d089:2060 with SMTP id d75a77b69052e-55ac8d8b5c1mr34889651cf.37.1794575959180;
        Fri, 13 Nov 2026 05:19:19 -0800 (PST)
Received: from [10.218.9.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad1b11d9csm18250821cf.28.2026.11.13.05.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 05:19:18 -0800 (PST)
Message-ID: <146d6fcc-e977-41f6-b34d-f7a9a4283ee8@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 18:49:13 +0530
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
Subject: Re: [PATCH] i2c: qcom-geni: Prefer asynchronous probing
To: Wenwen Fu <wenwfu@qti.qualcomm.com>, andi.shyti@kernel.org
Cc: viken.dadhaniya@oss.qualcomm.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261111090955.3378623-1-wenwfu@qti.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261111090955.3378623-1-wenwfu@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1MiBTYWx0ZWRfX5LRuEUay0Hkf
 b3S6orc7A6uKfzJnHudIBq4BMcZqT9g3kjPKHhsbLHy5WPqzeCWnUKzKIJ6qGp0D0gyM9pQdcww
 Jgi9CgrcPuwTV83ENS5Yj4JJNjIQ1Do=
X-Proofpoint-GUID: w4zimVa5n3snjWn3CO8RFkZsSMq4hkbA
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af70e58 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=BP9H1aEygeDGrBmwyXcA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1MiBTYWx0ZWRfX0c739vXHl3dY
 VQdyZNIb6Y4kOOZl65i20oVkoLhSdQxa1iqYkAfsdQMHDW00tU5KEEzWsd+VL5vdbV7zE2vls9y
 4SzyYATb9CCHvsKEDUSbVZrT9ci0fDC0gocsKEyjwzg1KvoORbXTILQre+Du6g/c9hO+zpJX+PW
 qG9eAl/sLaOn44RWYmuGaC7d3lHeRKUPnz2RMnXt2FUlppQD2M29mWvyqFwVHQkoQNshwF1dj2V
 hFeyKNkK+n+Kxg5Qfda/lseoEi9htXqFOtn7iJR6WnwbPkni8YSI+UDX2ZP95JVrpe/LeHV7+an
 Hgm1yonh8vAEpPuFKi1G5qSR9GivgItuB3Tv89z9S5KiaidTo0863zvr7M8zU7Fa52k9wfNC5sa
 6NzBEN9GikXa/RrB4tP8nng4dItH09PDxz9u8avaNTHJe9aVoyCISFNLr9QoHfIdAB6yDeEYG58
 ilsrEso+SZnWoe0UDug==
X-Proofpoint-ORIG-GUID: w4zimVa5n3snjWn3CO8RFkZsSMq4hkbA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130052



On 11/11/2026 2:39 PM, Wenwen Fu wrote:
> When built in, GENI I2C can request serial-engine firmware during
> probe. If initramfs unpacking is still in progress, request_firmware()
> waits for it to complete, blocking subsequent driver initialization.
> 
> Prefer asynchronous probing so that other drivers can initialize in
> parallel while the firmware request waits for initramfs unpacking.
> 
> Assisted-by: Codex:GPT-6
> Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
