Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216405;
	b=Ucky0rIiysSdy8SeANXIpzCw4+xzhhB5faNh4nw6WfOR0/sJQWftbms5y3XccL5WV/tW
	 P3LBnjOVrdSkGqdAWv7h+THL0ObQAVT/BFiJg4N48BEj/8xoAKcFjIsPuMInYsgy7S2EW
	 fp6gihbuPJLiB6jIg7Ej50icz4fq/jG+rq2QeyTekKXxfmTwuJMEJZ35r3UL2ZlIwBxs2
	 QhdSxXsxenslzrQbraP6WwMyHpQ+Ztv3pvA9BCLttGh8XowRIpYtUdcHi5nN7mMz5RBcr
	 7tqSjVowkXdb0Oo/AJl/hqUaHlDCLjCXjQdsDtzJhcTcejF56OKvNFXbqhZN6tCltPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216405;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=L+gz2J/ZGi177mXkyUJST89Pwyo852hzkeYwHBsRBvY=;
	b=N3YPQJsy88H4aIZBYywPHnYNdPYP8wmIX69KuL+k7GienFiLTOiYN+lkV04x1TQzMD/d
	 qKWRB93je5gdOkXAvZjBxJ82n6XunxJJlaGDYMVHJEZ/R25OJcuYF7VxINHEv5yh2U+r3
	 JIqDqyZR35mCgB2nCr+pPxckYgt2Lk7ft2BIxm9/IZatsQsB7ZOgn1L+UBdnBvMHAip7k
	 nyCZnKCwvGqYinWupO7f6dtPvAxvHQoxrjvwGW305s+5eCP/kgbLBbJnoDUbYf20dTloZ
	 4XU4BHz+92dZiZmRzXViVwoaDLSHCSLK1aZFA+52qF5Cj2iCV6dPniWQVe2CChQQ9bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pwdU+FhC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QySonPPO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF424606A323
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 09:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF424606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pwdU+FhC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QySonPPO
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969sZC401333
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 09:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L+gz2J/ZGi177mXkyUJST89Pwyo852hzkeYwHBsRBvY=; b=pwdU+FhCCLc9mGTs
	zL5gW5iNmwWp31l7jET7VATfGm7Tkbd5RDGmczlA4JR/1qekae0jK649oCg9/WuJ
	dpW0pupK1or/1rHKlkLkkOeADJHUweRwZX3FF+QCCqcfFdU398NsqbvU2/fXq93T
	tTIJhMkyudAo6GDz+b2qfzwVJrWKgmQ3zFysp4KBAmm7AvWeuDwsisJslWdPCbjq
	YBICDJnADwKjmPoFlqQ3ubb/rEGacyPZ6Wm7Lw8ObDzGEpHDLZ6ThAVhT0CBaJEy
	JU5Pbsi5cTK45cV3H7dAKM3wFGF3kajnD6Lj/VD4XiUYlSCz8fz2tbdqCrR6lxqk
	McNxPg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf5yhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 09:26:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea6b66e53so16899285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 01:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794216403; x=1794821203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L+gz2J/ZGi177mXkyUJST89Pwyo852hzkeYwHBsRBvY=;
        b=QySonPPOLUMzUYRUrIdAv1pMKYmkkHWh4yQZAuu49lmoL2xoLymN6axSvXxnZbbjgo
         PW1ikPAW6By9yheab9zNHlGRSOJjedxah6JInCNYqtUZuvpmZq8taTj1nYWOwB/5kjEp
         GCgNC2CgGfqqaBWzeG3gjkFtP9KVlMvTT/doyKsjHzWKRmwOTfXJnRAJJRKYSgkDy/UW
         wksfJkPgI9Vu9/QhhaqIfRsif34u7sxOwiPTCuTRVTFQPBcIpqFA3rFM+Cfy83I2OkpA
         ufeFJhCx4Zw8VClp+VPBpJ3Ix1vYnyEakTQ7gv2X9wTeexBG6C/mmjJK5EHYvWZSv7aZ
         Endg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216403; x=1794821203;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+gz2J/ZGi177mXkyUJST89Pwyo852hzkeYwHBsRBvY=;
        b=eRAI6Op2boZaxqol2OahqJaDYKgVrScPyyIgmQIw7jOs7T45wSxRE74sgAw6D3jvH2
         C/IvsmW+f2mIZxEqeskD0k+rYzsWH/g8EMnO7vqJraEqiDv7SY/doUMkgWtACUkoxqnz
         3l4+66aJc1Q68JoQKCnuQxXezuOfumG32JfxieZp+lJTvb6jqSZWRh7E+/fTU6SjVIVI
         3qR1S6uv46/yZ1o6+PVC29UkdZrVP8td7AFkXcEJsbDA3FcZgJ+lVdLNyhTQQh62UXvW
         4m07FHQ3It4Yrr7NhHWY5e5p0KNcO7m2IpVYr4nCSODtxti2nvvTczwRaTb6ph8szsaj
         eT/A==
X-Gm-Message-State: APuU4Z+QaQKI7RjgGwLf8IGPSsz7YZGKkp91hrsfIXAFnDuA0vpvMuMJ
	vX7MRf4mJpqd50OgJKXnltST3zucA9PtCrmuvHae5Fbv8ihi3rtWhhULZZ5KzgAS7+8rX88LTKz
	bgif/iL6uEFaZw3t9EbwWbs5nMLq9+KgxZAEfs9ZBEU0/w+YhC8UWCLpzVhl5+hsDqF1q
X-Gm-Gg: AYBFou1877eXU8udmvYZsFnkOQe8OKxB7hwWkBC7g8hgfIWmlxE0eMLvKw81+0aOjI2
	oJEMDndjT/1ssP6WSJ20s83H1+q2UWe5AEkmk30TFUCLAhi6JrjaebJyol1VLZAoqOPKl2DeprH
	n6C/OXMDgfZmWoM13V9fRSRrStU+bh4knQT8n4rmBXk+Rnwmox14kyMC4ke36tZjp6Ur5RR7pKi
	qTZ5gOjyTMjn6s3Gm2sjUhAA6gx0mu9wdVbWI4A2705AV4a62fCpl/poCPHx8tGzv6nWTbqEBo3
	3R3E4VyqdkMFQqmxsR3W77mcMC9X32XWo/yuY05UWBpVRDpxDBniIRG38G2RZ+Woid5IZFFBHih
	q32jJc1Y/MulA2ypgDUOU+dbpkwjUbwqtFC+Jn64TilyclIoZKq85eijhHorwp6CVznMfvg==
X-Received: by 2002:a05:620a:a41b:10b0:939:9ef4:79eb with SMTP id af79cd13be357-947842c05b3mr512746685a.6.1794216403147;
        Mon, 09 Nov 2026 01:26:43 -0800 (PST)
X-Received: by 2002:a05:620a:a41b:10b0:939:9ef4:79eb with SMTP id af79cd13be357-947842c05b3mr512744285a.6.1794216402619;
        Mon, 09 Nov 2026 01:26:42 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ea4134sm1200061a12.9.2026.11.09.01.26.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 01:26:41 -0800 (PST)
Message-ID: <46b043bf-19f0-4b7f-8c6b-b8835838338c@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:26:39 +0100
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
Subject: Re: [PATCH 4/4] phy: qualcomm: qcom-m31: Do not request reset by
 index
To: Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261106-reset-deindex-phy-v1-0-6a9c9f428be8@pengutronix.de>
 <20261106-reset-deindex-phy-v1-4-6a9c9f428be8@pengutronix.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106-reset-deindex-phy-v1-4-6a9c9f428be8@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX10mC5FDtOQG5
 aV/vqW4Rtr2JuJosQwVO7ilQi6X6l+hSPG8vyNuPS0maoIwuQz6xqVLTa/oitXMx0OWMDS9B+z/
 itjm3R81lJmgKEdoHnUKMIcSYgo20pQ=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6af191d4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IWuRp9V-5v9cUcI_31kA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: NKSVOPghums9eMtGXpL3DS6ShGgknyEr
X-Proofpoint-ORIG-GUID: NKSVOPghums9eMtGXpL3DS6ShGgknyEr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX6+wSplxJYcz0
 e4RaoIPZvisF5xXKMka9mivWUhWmasfZAHCI3ckAEGQErH5oVm2Fje7/SC3ChPwxQNoeLrZYb3E
 Wcv4yrAajv2QWWLw+aU5gqhD04eQ2H4AtT4vSKi/f5CDDNxS2YiWL0QjHgvZsdgGJpoOZQeVm33
 FPLQRs+F7yxkOJIGkQeNdCtiHqU/bfEf5YV6VKjbikme5OYH8vaNYwhhUwXJLBjQPoJ86pkYRoq
 zp09YJhK/yGNafE213wwIdm84hf22uqVswQrKWn1Fd+CEoz2cZ/H9ZZPRz1+jq+xMuZzWBlnWLF
 /l+Gdcz9zjSkoKXH0ho3M/7+lyBfTkep97LeRcDIV5LfqFKT04fa6A4UgYm3KfxSAbNwIu6UX2j
 tJPFME2DlW1iOsnNduvzHGffToUIRaH6C1jQWfxtrv5rvk2diuYYQodlUc2ce2zEDMoeXx98hWW
 LK7Y0hjtQcHKOqYDjGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090037

On 11/6/26 4:01 PM, Philipp Zabel wrote:
> There is no need to request a single reset by index.
> Use devm_reset_control_get_exclusive() to request the first and only
> reset.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
