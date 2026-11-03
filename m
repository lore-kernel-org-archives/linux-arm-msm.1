Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724461;
	b=cusNyDr039gM400UjeNr7U+viimZiHZJOWxvpiqo+m/X0AlNxUF81bFaOKWxLRbm59vL
	 djerZXEJDRT6Y1rtjpHgX/hAGenMrGwavGyTohivl1ZLFJwLefcZ6LHTNnXTBn5A+ivFw
	 P5xemib+4uXR4yYN6gTxQcRk/BZrRp9vuTUpb3caXU01l/31gCvB1zbeupWWGMhG0Q/Uy
	 Tsx4b0AK2pK2mV0YOh9A3J5V26usLymSUN9ssJelsEyYAUXaHOGz7eL2Xlonc0nnSjNO4
	 lRjtaS1Tc7z5DKlQdJjBV90xXH/uTqxKjbRPi7d47gMT/3vh9kuHt/o7jfXFO1g0vTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724461;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Paahz2cu5Q9vlGBYGrknkFs8wYwBWIJPZ66Zms3vNmU=;
	b=I1y98Gs0CTDHu4xudcSychXea6xNXehmthOrqiFlaTYO+qsc32D0XwaGCrSHHx3iCd+p
	 SEkSn57uiECzs+nJOSBP3GFZteEngoAvmwwKpSvz/PjtjyQxUb5gvqjZtjGbEe8XULfIy
	 z2liRNcoHVIDFmhdCAd5UeAQGMdNcJhahqeWnkwcPoNZO3WRfT2r6StR+4VBTBM7A5fx9
	 gdDcl72PB02SrsvSx8C8SxKH73csWdI4CmMhzmCFXoXOzWuHRLJ1B0VA2u7bJXGxteDmV
	 hum154MQ1w8LK8lnyOs22nV0argCxuqPKS62i4w8IRlRGDOp3DzwUOUyoTXcFVgYktQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bhn+6NiQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GustMljW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AC8606A327
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 16:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18AC8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bhn+6NiQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GustMljW
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EA3GW3048850
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 16:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Paahz2cu5Q9vlGBYGrknkFs8wYwBWIJPZ66Zms3vNmU=; b=bhn+6NiQkuOQKXG6
	XR2m53GsSTThmw+w27tl/BJmR4EFjS0irkF/k1h+e1fkw3OdIxc71YE3cT04Wnq5
	VLq5MfNX2Zogbp1rCP23LJcEhL0EYKx+1dg75LRngxkznojXxPkX9Ig6KJ4cvH5y
	CtETC/QVuj6CgNZt779t3+4DCN11aPXiv5ofMqy4ZZb/PPvQTC/ym35f16EOivP1
	d32nmGAA7DwvnGJmjnDZKSyU6jcP8Mr3liGyA04Hpw5fJaJXGObmClAcSKhSDdfd
	at+XJYYh9vg48qwb/U9YL8+VIUsDNHoX+q7yFDTZTFZWzUnlzhIdPuDcwHfNLbFe
	OiKh0Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5kqmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 16:47:40 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a086f5d91aso5649928b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 08:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793724460; x=1794329260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Paahz2cu5Q9vlGBYGrknkFs8wYwBWIJPZ66Zms3vNmU=;
        b=GustMljW74EyHYAGxYnZJlmz7VB6Z7HF6zWtTvun2Jan967g7FZKW+2SDHqbJnm7iY
         V2wG7rQpR75Et+VAP9DAfCP0cBX3XEH49+ro+fYD9u2SSewjW4hffIUe47m+ujzsq5Gz
         ROEjh6qyBbbEOLAcobLucguM4gaDJjITG/fReHcbEWYnFSo17nuW8VqgPy82rq+KCuvW
         uAj76L10GqPKH9lK5uV9rfm6Kx7NIux3rkW7bG1pu70mQiNEnXcA9VBFjyLnQ2xGZeIw
         jlfTSCe3d/h8M88U4Yozk7tqhJjasfsK0k+XPljafncPrK6FA0T5RZPAEKWN1qCDqGsv
         CTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793724460; x=1794329260;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Paahz2cu5Q9vlGBYGrknkFs8wYwBWIJPZ66Zms3vNmU=;
        b=e+cXi8lE/aobnS7HKYTTdswETId4kUywgvMAv6VRgdqqtfuRnPhjUkm5SQdt09l/o+
         DY9G6ITvzamDonqB7cl7++uLJY4ihCWlZA5Ml/fK/4A2uhYOBYKiovoV0n/3DnnYeuQs
         tZS/fU4i09K0d/0TyKYNJw5sYOR9ee1s7BWobWj8R2MreUBd+T1FuTwtnmvA6DsiwZ3D
         oV+ne6SCFrlaOO7ra0WF2wYOdsVJWWuOn+2hjWzbPZYTdWm0VYgcAJsmf6KEExPB2YGR
         mRo6o+6lAaUTqJzahCkmNLk2Es7W2kIjPZmGI66h71f/nleyZBvYvBiP8JpO1/Xy1YYZ
         2M3g==
X-Forwarded-Encrypted: i=1; AKwUvBzVMlRfsapUQiWufVQuIptk2chZHJIWjIG6egdk2d1VPy6xFHA0JG7zViiKk5a87qNnKim8qUKCVqgWBb3S@vger.kernel.org
X-Gm-Message-State: APuU4Z9GmhTn85oLOgHcpRJftgn3H5l2OjxXZVSdAAqvq2c7+KoGqkda
	qnWELBNfec1rWQ695IA7LUUzgV67/9YZfHp+6sBsR3acIGz48kUTI5+52FFa5VQMPuV25brl9Bm
	v1lHOe9qAHIXdAgaBmBl93IvOl4epGJFboLFkd4vbLXntXr8NQyBgkQNAzoIE55F4oYEt
X-Gm-Gg: AYBFou1DyqCQ72A2pzfJ0JOyXgS0z013xaantOrky+O9aB2earTP9PBr47Pedlwo+Ix
	Dtg7QRSLKJDsspH+uBKZo8TWzbNCVgY/sQrUr8iNk4VEAkRvAq9XXhm6Dgqxct45qoEAd4nLfSl
	r0aAIgl0ErOep0ZXQKya/l9uAws8RGFVgpLxi1MvP2+Ilslx7cC3/GAZvSZHpPxmfYck2MmxBQU
	nqWknEMP6JkZHZ3PYQDs/BhtDqFUddJTg2uwFPkoqVRcnsU5FQ07fAG18Zsid8Ye2QAzoURI2jd
	L6OZcc0IP0i/n5Ha91Or1NdyNIQr+6f2vK9EntQh0Yu+BJR498zTsv8Yy/R3aBKlXuFYMH4dSd8
	C12RarEzRRHLsjMFhdZxhFnW4nulELADdhhTtUkSly6hASWYJVMLTUexJ/DNYRNEjoP8OOSrCgv
	BP
X-Received: by 2002:a05:6a20:9145:b0:3e2:1160:6d20 with SMTP id adf61e73a8af0-3e928a80f31mr13008313637.3.1793724459638;
        Tue, 03 Nov 2026 08:47:39 -0800 (PST)
X-Received: by 2002:a05:6a20:9145:b0:3e2:1160:6d20 with SMTP id adf61e73a8af0-3e928a80f31mr13008297637.3.1793724459204;
        Tue, 03 Nov 2026 08:47:39 -0800 (PST)
Received: from [192.168.1.10] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada3d3603sm3400303b3a.37.2026.11.03.08.47.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:47:38 -0800 (PST)
Message-ID: <ef38c950-5fa4-4b57-b97c-8f306b2295e9@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 22:17:29 +0530
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
Subject: Re: [PATCH v12 8/9] arm64: dts: qcom: shikra: Add OPE node
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
 <20261102-camss-isp-ope-v12-8-702254689feb@oss.qualcomm.com>
 <bac09735-4136-442c-9208-556568d39967@oss.qualcomm.com>
 <zymjeclhd2ezemd6jeujtsu4y3gb26gi2v4vd3gmi7diuaa23m@aqr4blf32t5b>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <zymjeclhd2ezemd6jeujtsu4y3gb26gi2v4vd3gmi7diuaa23m@aqr4blf32t5b>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3VrvhEWKQPKIR6BTmwKiuUqdggJgX0gk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2NiBTYWx0ZWRfX8U8Xjo032mN5
 ciz2W6qXmxkmcEfNmpgjcuyeaBmAkC21V4kUDKGLU4wmsxI4MFhIiVgZWqVZbsYPip06ExJkIv4
 uI0H9vcIDCtI5BHbsvr1lC+8gR9rbzkt1lhO+GpAaOjWKXP173edxmLFtRsH3QgbdEcG402p4+A
 BC2YtHsEcLxsCAHBZ6J9vgu3M2JEVFs4hm587hmAWsrz4w4lzbIciMbYTP1uk3h+ye+8HK0in9l
 UKihw7W0UcRUFiXr+SJ0S8akFm/7FGg68IEd+pgidiwpMVwVMjQclYkchFp0IQKiinQ9f5uwIC5
 HiQYGIj/40N91xrCI/6mErzzjRUisTJ8X2grsDWz87xsG61TEiPw2+V7LuHaeqhm5omOvTMmwbY
 4FXPcogmR8Uy8hgJelPdmmm4EvErvDIVjAbiLGOzJ2fX1drtlFlr8l25qUPJbTQjD9qlLsoXqMI
 ExagBYDk1KAZlCdjBRA==
X-Proofpoint-GUID: 3VrvhEWKQPKIR6BTmwKiuUqdggJgX0gk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2NiBTYWx0ZWRfX+bbqj8ErtznL
 Zhvz0y37hyb6S3yJ6K6ZU7nlwFMjk1EH+BnzHbW7Evl1N+eDZ1i6dPhLI3cLiepI71sm5r4k3/m
 StxCAfsxq6Vcjyp6OaMmGhp3NIfinc8=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6aea102c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=DwxOReZszbjtibhM6OkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030066



On 03-11-2026 19:03, Abel Vesa wrote:
>>> OPE is a memory-to-memory block with no board-level dependencies, so
>>> the node is left enabled for all Shikra boards.
>>>
>>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>> Tested-By: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> #Shikra CQM
> This tag will probably not be picked up by b4 and it will probably confuse
> some of the scripts maintainers use. It needs to be "Tested-by:".

Thanks for pointing this out, sorry for the typo.

Please use:
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Shikra CQM

-- 
Regards,
Nihal Kumar Gupta

