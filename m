Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B84253340
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880679; cv=none; b=MqAJ2fl2SonyRHIe+ehU/2c+ZZu8mxAEf00jyEfXJHcDoFboMFQtC6aYrRTV/gkHu+qX9zNbTLAZPXbw+Y42lfIbGWlCX+HzHMcUGyWldIsj9e6crzOdR4rlryxCWZBdaWgfJYexdc9olDl6zjroduHHJY5eFqfxz+6JKSybZg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880679; c=relaxed/simple;
	bh=rF5sv84ctLmqd5y4HVpRAS+FDWqavUBsodpRj+ujkhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNlfkovrrVV1msYibNn5I1PofPVduydOHoiuIHOM9Q4sTwEEBdLdzEqhSbqgGXjDQoRXzAseIOhnnGURHyv+iMpwIGsihX5NgTpk8PiKbUgceVC2ttaY14bonu0vgI6NGgdRP64+xpZX9QxxingUUIbchMk0RwPft7unup9JNkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aILVzsuL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cRUvOHof; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aILVzsuL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cRUvOHof"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8OkhF989880
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/WeEwiHeFEl6PiN55KbmIGGA
	3/MPUVvtbXAitA+s6jk=; b=aILVzsuLPhVbKd+y1q9fECGgcSvy0GGsIMWj/Wjp
	IM0WtnNS0DwKDic7LJTZDnVDuypa0nV4zOtAeCji3gJalubR0AiujF0BpcnH4Isx
	heIZ8KiC9VDYooERWv78FcFP7W6GFogtoE6arvUUEAqBRUSpW/WOExfrJK7T/mBa
	sK4/KwCCJDZab6zAaeuIkubiRq4dVxpu6QuJoPXd8RSqbmVeL1C2EoHxA1fsohuc
	ch6z8NWt4Tz3w0/C0DDe4nJ9luekqm5L8LgHOvLUbkMCCnDLJgysqDJ/akLW3CGj
	hjLlkoN2khzaLnNw73bOg/aP2RYXJgQ7FhznRmdPx/ytbA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hc9ybh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:37:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93dea1b6c89so525309685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 01:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791880677; x=1792485477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/WeEwiHeFEl6PiN55KbmIGGA3/MPUVvtbXAitA+s6jk=;
        b=cRUvOHof3cHK5+tbagrgUxiATXSc+tLveRNjEpZoD3YrFNCH1fxB+r/UNj3iEa+gt+
         znGNUjsEjv5HSd14NgkNtQpGyTazOTI6VCtRKXkpL9CNHjFTCM9ysPqq/5iQtbhbTsxo
         X/o9pmNASagvx5P5Kz1z4Z8HdTXZ46ffvdyj7KFBZkch380dKcptKr+olt/SoyamHGVm
         BIJ8hIYEaRLdQ45Us/AwRWh6fdkyToHpHFWdkxQRXkf1UA0cY/56f+BojgJzLPD4zHNd
         ZRh89ZJo2pehrjyL5/+2CN7m2ApBBxj7z6Umbxz9ihtiYwpU5lvzqEzpW7Y6cj/opG7i
         1TmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791880677; x=1792485477;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WeEwiHeFEl6PiN55KbmIGGA3/MPUVvtbXAitA+s6jk=;
        b=qsf1EDhGUkJwj8FQpMY45/bTOp9vOe6gL6JCdBhjXMoZwl5EtgUoAwu7JqPXck0k5l
         UyErGpzdtQMYD+iIY9eA0kCeH68zEca1ZzdsXY8ATMUtlETFQ+Yzl5osu5/+3E1K3RzR
         n7JCUhWnOQKoeX6a+D3H0xP0k3gu5E/WIrbn+ICs+l6YHmnQViv9kh0y6IOQdNzga1br
         Ua3VhRlnMDj2dyFiYawPEDzQt4mIebdV/iqzQzjA9S4usX5PLjCyw9P+xDsxNRzIqHSh
         +8MPYnOtW4gUS+Hh821apjNtumTJuRZMCJuUiuKpPrXoOhljLT6FlYeymrT0iNnjZ9y8
         d/WA==
X-Forwarded-Encrypted: i=1; AKwUvBxTBvOFkOXSp+eYFIHSnnktu/HQakrJUi+c7t/EFDOmYOKsKIyeSQK1trnx9fM1StTsE4M4GGaGPdTPIktq@vger.kernel.org
X-Gm-Message-State: AFq9FYIk/xtyoCVXHB3OCW0cWB7lt5v4qiF/uyuiuO3RTd9jjVqNL3Wq
	nBjghsOLLF2kXTxMxLQoinzDg8vFZawimP6kLtSzjGl2xGTHn6RTGaDSGUbqHF1L78LrwSNQx9x
	LBwFl+7cYDpwdin53FgtYI3/gK5K+PrnihRWzxQvawqbNEhLxQsIaXZ1qReo8OoTnCftQ
X-Gm-Gg: AYBFou2rGfuYazfbeczRewz7zsSCvO8ot7/A5rrzk+GJvmerCJM+kMPyYT1m1J9/UtI
	Zv4ukVf5hN/uwrGdJNmj0dqtMRq2fLqxN20Nwr9lz1loIXto+Ciyyhws/lwokXC9Kc+ksXNaHE1
	o8KvZalQ5AwqJMAKMQYkuh9kNW+L10Obmu1kkLBnHJRqTDxY/szew+lCYbddmKdfQ9+y/nm4j4/
	g7x/OWK4NObR9CKc63JUuxLQ8+2BL5Q9vgkfulU292v4XMr2O92NyAiYszHwNmgalTA3rLS3bvu
	/j5Yf+K0LDjXLbuQo8DOZtJ7jBwn3JI0YAdUwraH2AvBUkwM+HMoNWGvDPJRsC1g91En4PgaUNW
	0K5bjjL//g89/SQA=
X-Received: by 2002:a05:620a:19a5:b0:93e:5016:e3a6 with SMTP id af79cd13be357-93ebd1eca74mr1859679485a.26.1791880676703;
        Tue, 13 Oct 2026 01:37:56 -0700 (PDT)
X-Received: by 2002:a05:620a:19a5:b0:93e:5016:e3a6 with SMTP id af79cd13be357-93ebd1eca74mr1859676685a.26.1791880676040;
        Tue, 13 Oct 2026 01:37:56 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4e8csm3675578f8f.23.2026.10.13.01.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:37:55 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:37:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH v3] soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4 bytes
 for read request
Message-ID: <n5g5pjgso5jdsr4hk22ezoui55325oxkytnxzq3h6wsk7kvgd5@qeogbpuo3qx7>
References: <20261007-rsc_read-v3-1-7501c014fb37@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-rsc_read-v3-1-7501c014fb37@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfXzrXPbAnIvSiX
 KIE754V3S1nKAdZ3430g1g8Q9CnLFQv8cwr6xxQIfWKEjbsXpTMMmO0JsDK2SZGzq7La8MjvSmi
 +DK29EduPwRyD5aT4dGNVDDncpLUs3dlyTa+apJUCcMzRAATtKIpAPx2EH3LY4saHqpmHHr6lQm
 Xd2XIyAghOiNvAXtj5YaKUWeQQwYJWgpmz3zw2CHyIKBAOTej6FnrvxVb1jat6Biw6tzsHoF3lJ
 4fsZprPvvo5lXnw7BRpV2IpPYbKTJtYKHEH8Ghvyx81ie5H7SH5ljIfpjhUuNDg5h2yFyYEGyNs
 X63Yv0EeNZKktDHrichGHsD++7nDxHLFoEmBQXPxAKSUo6mLwpn1TRu4v/ChfOtFp7rM57fYdtK
 1P8c1H4f7pnWwEE7oOwazdx0CGhB/NQXtEhEwNTy411VM3s79W3eIFKus0dT5uBFucgjWvyvJc6
 tfE24NQyj3AnO0ISI3A==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6acdede5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=LP7z94PLUN5IiuC4UgYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Z98g2ewddOZY-jpLIo3NrGf3j-1DvXKW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX/cEVCRvjx0Uw
 4irHK1h6lHvOSxEpbaQQsVTgKXb/lwFO5WuErczFVKY+MXzzoB5Hj3gyOrVOwzwYno7QJlU9FAT
 BwoRwDDISOZHcBavbnHFMrFSkogLWfo=
X-Proofpoint-GUID: Z98g2ewddOZY-jpLIo3NrGf3j-1DvXKW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034

On 26-10-07 15:35:49, Maulik Shah wrote:
> Newer SoC like hawi with RSC version v4.5 support 4 byte message read
> request instead of default 8 byte on older SoCs. The write request
> continues to be 8 bytes.
> 
> The CMD_MSGID_LEN field is [3:0] bits. Describe the length bits as a
> GENMASK() and use FIELD_PREP() when programming 4-byte or 8-byte message
> length.
> 
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> #Hawi
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
