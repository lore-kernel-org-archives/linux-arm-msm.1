Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487077;
	b=sxXfbKsb0hcZaRFLhzMJhVET5pd1Kg4QTqzo9WUkpYKPhc6zNzcUMoHgkkhdsvRsnL0b
	 3MJCTujHnTNlj4Frv0CAcLmDuhEPt341ewiC8hGpbdyixalCF1xX6x+uNru+AeCWDUVIr
	 NlieCm4xvpxFdkOTbv/JjY9kVPPwbuKQb00SdROsjIXNnT2H9q64btvABW9miB0rK4x5n
	 i1nDxrkaD0kFO6Q2wRCT9gaZOBStuuv/AN/2x8LAsJJnHqpi6azN7lA5ghiujmxChq6/4
	 XHTBQB951rivhejTTr+nsxNjviZvXBfmOO1Tj5y3zvzgZk8RnHkeSdObX28cvWqyOhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=klQOpf+HavRxRFNlSNefqEWhR0JJ4OucrEz4ZjfbFU8=;
	b=tdBxyH0axKaiLF+cn8cqo+xJeXjm3suAQb6oKxuan1Y5+e7bLxRyKSTezwYKM/CNaoq8
	 MSzzwXpl7cwarVPHrxudCiexW3rexuz+fMVC9g6LorQV2Kn3OgFAzu9zGNk8J3yPC+sqs
	 1iUUkjYDAZWwzEqh+VvzP1PWTEQ/ybkZ7QQdPTQ/2zZ+oPty25pLNACG8K6jgMZdon2qM
	 VoHp/WSS4bF2no0c0bbbS4EvzyWOBbdFDfJr/pneX7CGxlQyRVDncX6fwpWE0rvi0KB3d
	 ZFKOqWwz8phbr4QzLR9ONZ7GDPeXZuxMbxzeoBBqGkgJF6JCUAFHORvax/vSVc8BbZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPpIsLyF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EshcJ5Lx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92F0606A330
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 12:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E92F0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPpIsLyF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EshcJ5Lx
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAmiE32555145
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 12:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=klQOpf+HavR
	xRFNlSNefqEWhR0JJ4OucrEz4ZjfbFU8=; b=ZPpIsLyFlzvsrJvB0C/y4EP13Vv
	jgneVLSaabLJyzCH6rNkJlgm9eGncJsFY/RtZPkhNuEQWua/wJgwpZpfiTVLJ7x5
	9pjcIixWQbc4MMQ+wZG8xuYgp6L8V66mAynaToTuGARCLDgK7xQGGykq121oxzpj
	eDapA4FOLK3XpAQKU9FGw6Bebwdg4k0ei+MrnneuzAMeZKExWgaST6rt75xW9cW3
	0C90NbS//4FVlF9/1d7Q8IX1z8dO/RqVmZZQ+ARkeYcx9ywGKvzBZX9ApN/nn3lg
	WIYIzrUaqDXsx4Wxn78PRy2+TK4LiGMF9W0ZVNshJ8LhlhcOvjuKbCIw3bA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwc1j0bk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 12:37:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-943e8ff02d0so477030785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794487075; x=1795091875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klQOpf+HavRxRFNlSNefqEWhR0JJ4OucrEz4ZjfbFU8=;
        b=EshcJ5LxyFizzXWgeXmVqSGNlO1yogXHmur2ZJtqg+0v0mK43qYlPSDs/xN8CKisqI
         628fwRrXPo4IqdrVtkvThDf1tg0joDG7F7FhUiCX3p0NgjmT5AzGIVHKYUVrzrO1LxTA
         3ZJD2xUsNhEt1XyTmZ8r3QAKdx7GAsu/Yuipkqlmxyl6+BstYGlTqTIhmcYk2eMsHFze
         //JLHzZSLFAhlVAdd0Oq1O/Ny0h/FKf+idnBkQycXisbG6NSPyQpLXYEMpXSNOmiqpfl
         HYqEBgVwqv/DcGt9MYzZm7iZEmgTu80+ath5+9du6A/+wFyUoTGAS22nm48g/cmXqez5
         AOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794487075; x=1795091875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=klQOpf+HavRxRFNlSNefqEWhR0JJ4OucrEz4ZjfbFU8=;
        b=rgSEj5Id/ik0D8lamQMQrbNrPaHeDXrlE50HXPcBXNd62qpK7nUARtm/Cjy9XOonOZ
         KU2n/9uZRWrM27dewFYk4kzIdIOtojKMJCCS/whVwLakAClYkFjwfPT9rCAIDFPJH1A/
         JBFHA7E2Omn31s0c1aYXzWd6Aph1w8Gd5JdMzJ7GGcldkf2/ENzY0KKCQTxrtb8s3O5B
         Be9CD64ri3S3cS2OPmusG14tusnkDBS7T+sMNitYPchRsO+cfbJ4/932jdSUHa0M0O9V
         EBm6L3iK0HTKVK8jgkqd5ex8SbGUFmA1beuior5dxste47azsIfS94CxIT9o1Pw3n+iC
         tRZg==
X-Forwarded-Encrypted: i=1; AL+hErHaD/n+J7vm8zOin8ZOgu8rOEeUKcEU1XffgPvdOthCweuSgPuHdniyB8ugNNuhWeseWR2f4AWLIJ3FOIHA@vger.kernel.org
X-Gm-Message-State: APuU4Z+8NB+W6++9PDjgNWa1TlhC2EXLiTOz1hV8zURJPMzqgUe7nHDF
	M4/lRop5n+3ImJL1RW46puNrGtzcSayTL33greq/TeveuNhE9oVu5y+DBN+gNdrdholUSu3BJXq
	Q9J24xhDpl/3swORZEJGjQlwpesB+UaKMkZLK7GDmUSptyfHiCdqs1ap35MN9OJEiQx8p
X-Gm-Gg: AYBFou2muTHlunJ+gomGBFGmktMufDxmG/qNQIZdwD7qqH7ZYTnY7snQBWlcgI7nb3V
	lG38qQhqBbDwT8Ya6666VQSeg4b9tS1ENuFmShUYtxl5+kTh0I9RIUhWlJ0R9cGpHN981f/ltqK
	Sx0XfRHrB9PtWkvWuovyvnlBzuWeEAIILhHtQ4bzx76avAAynZ+1AyqSThbQcYoMlX8MgO9upg8
	gi+cfndpQWFQO16zS//5/00h01p6sfeCVDnOdnMBQKZ6uEIfaXVT3b4d/RuooyWH6QvsvSbtSkM
	IQ1O1Yx/4XSSUfEbH+srLvXpv5+JCWFgQSfUU7F4mM4Fxp+ar+lY4WmWPh6u9vHmGOXIhSkAWJi
	E1Oq0iO+WeH/GqmfcUmUYcNiVuyV9/meHx2a4CukwrG8ppgNyWRCD0BnOJMjAhzwqd/teqZYo6A
	==
X-Received: by 2002:a05:620a:2b8e:b0:93a:2221:5460 with SMTP id af79cd13be357-947affc0f5emr875240485a.40.1794487075211;
        Thu, 12 Nov 2026 04:37:55 -0800 (PST)
X-Received: by 2002:a05:620a:2b8e:b0:93a:2221:5460 with SMTP id af79cd13be357-947affc0f5emr875237285a.40.1794487074769;
        Thu, 12 Nov 2026 04:37:54 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a59437fsm331534766b.38.2026.11.12.04.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:37:53 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: Re: [PATCH v8 1/8] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Thu, 12 Nov 2026 14:37:52 +0200
Message-Id: <20261112123752.711726-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112-benevolent-discreet-warthog-1dbf04@quoll>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com> <20261110163909.78085-2-atanas.filipov@oss.qualcomm.com> <20261112-benevolent-discreet-warthog-1dbf04@quoll>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MCBTYWx0ZWRfX/pgtERE5CDUA
 8c/TylEwScXB9O6x8tyeLPGOA4JjmPHN/MSvBVtX1nSC2Ww2vlgv/Zr7GA8ABaVdLXyT84gyGtz
 Hypa2Bo8sxEek2GyHudlgwHdQU9pIJk=
X-Proofpoint-ORIG-GUID: SynQvwWvKmGVqZRKeuQAvDedjoj0Dl0k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MCBTYWx0ZWRfX/HCtbdRQJ0yS
 s2mrZ0eXLG8S3+AyxJWJwqO7mYjs3cDEINs1TzK/Ig8brfRs40xWYhzPsJMoIUpSjxoTwxvttRq
 GcL1JjIE2YWQ7eUH2HsTnhB19A4Q3aoVjd4//vQTvU4jKo1BH6ugXmdWZSXfzesq8j7jCknrc6p
 HkukkrPYxpvIGdMb45BkzJ7M+8tejG5l5ge8EvT6qXuxugc6d+SFuf5RsMlgdzTSBBn+osMHnfK
 9J2LErYPDYG5paCXdXf1jgRvdIPBJPaZi8eBfW40hxOnbaOVXUHUdfYOWUew56Rp8XxOJne8mMT
 rh9qNUuKuOOJiBfLOd/0/XfgkXwlTzN7dJzG7umELkmhbl2gOjHmxSx+ARC6CIwZdc5KdI7xjLT
 PAF0tgAur1JwLEBPgs8YTVnoM0SGtjM+t8dNjdpR7+fOYWOXHO/JCIjy0MNB3uOsRyT+G3OhRdC
 AIQI+gz3uR0Rb+hPWzg==
X-Proofpoint-GUID: SynQvwWvKmGVqZRKeuQAvDedjoj0Dl0k
X-Authority-Analysis: v=2.4 cv=Vqe2kO2n c=1 sm=1 tr=0 ts=6af5b323 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bWJBzm-gYxnYfWmHbWgA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120050

On Thu, Nov 12, 2026 at 11:02:13AM +0100, Krzysztof Kozlowski wrote:
> > +    then:
> > +      properties:
> > +        power-domains:
> > +          items:
> > +            - description: Titan top GDSC
> > +            - description: MX power domain
> > +            - description: MMCX power domain
>
> CX and MMCX are the same inputs, right? Then make MMCX second, unify the
> list at the top-level with minItems and here you only narrow
> min/maxItems.

Ok. In the next version there is one list at the top level: titan_top,
mx, cx, with minItems: 2. The per-SoC blocks only set minItems or
maxItems.

--
Best regards,
Atanas
