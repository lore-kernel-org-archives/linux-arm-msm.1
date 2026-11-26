Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703996;
	b=uAq/WkhB+C0J/EJJkT0Kvf/WSOqtHbnOWuaHbpvvTyBmBTNkjWHC7U5TI8PeFcOZNyHB
	 5jyVJs/uCWeJFIJbFoW1tNJP93DIy48ZtN9L9WCRf4J7UzIDvKmp5k5I/edf+K2fjUgel
	 PUV4Vj0oEr0bdSVQmoovdhXg6WpobB16lXAr4k1KCY69ph1tXJtLFrbHdJ3xS6XsmfZ2G
	 SaImQb+NuGk+1Q61F/fuPxXF6hbGED0KF05b/77mRerYRYt0sTJ1GmMiz8774/aAoVfdY
	 HIq0oRS5RfvwmDPvc0D2Tti7ekjDpCJQEmise6kVv3dxC+RaWkZcF1ebjDsefCAo+jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703996;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4o6hxaMULxHqbctzpcqZn0i4+vQqLZ7WDm3A2Ju/p4A=;
	b=sUNVnRC1VJ4RFt4KpwZlLOYqFmS/xoIzof7QyGTZ5KuamZFGsTW0Lx+XXzDc8QRSduCd
	 eMq17BRrC2eNOQHDE7yZtyzX3zi1RXfsNflBHil2ZDJOdeiFUAF2D76pYAleY6Tsx/INq
	 kZ15HjPjzc6SoLgS2Pml2PeAZjGyA5tVPaQ92PK+mjT2MndKfvGVgSpAkXvKHb7cXo6+A
	 NDpvhU3zW5yNnvdDoxW1Ig6aNdUkVPXTCdAYkQ4DVwrpTwSv8it6GCo2X+DtJeefVm/eQ
	 yqw3tqop6KZXFRJAU5WoQPy9Ru9HFgX9fkTPCYoyo3oxOW7xrdE7kjfdMcdm0Xl/AGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j+Yn3eps;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FKNJCzFG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EBC606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32EBC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j+Yn3eps;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FKNJCzFG
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEVJ9q3143635
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4o6hxaMULxHqbctzpcqZn0i4+vQqLZ7WDm3A2Ju/p4A=; b=j+Yn3epsXuvzCPA9
	f6uSvOK6O1ynXZLniq3rilBDaOAIjPc6utbZ4AKCo2J7TX/9mqFW+MXXrbp6q2yq
	nXKxFA4PlfnFURe+OV3GqBD6u21T8iE/Yo8kdu5QwCvriUZxIJ+7vYrtUy8DNoe0
	GlJdDmOqzdGVvocH838y4aQjz6tvtndnEofKc52pxQFC3pB+7Zaw9m5xYx8gF8un
	Vpp5hzlM42OfD5E1+1AZslQH5q0sO70x2UZmIHGCiyuxy9BPDy5Qgyu6XpS4+6wd
	nlsaVJZIoRP5sodiTeNhZLaOq8jx7H2Ye+opNXC9N1DPES8CRNi4eR0+R/fWDprO
	DZENYw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahvtgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:39:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-943fffbc5dbso52273185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795703994; x=1796308794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4o6hxaMULxHqbctzpcqZn0i4+vQqLZ7WDm3A2Ju/p4A=;
        b=FKNJCzFGq/BS8cFeSIE5nnxhh8pK+7skNRK118uSc6+Q8PjHYvV9HzCKFHu7Is+sio
         K8WkPJfZqKXncK6zf6ry8rPUolzLpM+oIZKfVQ6/f+mQm5B9ewLzHXelNnIm5vR60KVz
         n2Ks1bF6lRfuimih7a+SMQQtMDtzM2qGXALeisyLS6XwvHarrvYMLMVZ2AQByDQqfGO4
         IQGZdF3RN8zaLNXxNBpRo1JcOZetSi3JJvvvKB+50yvKDsSzviwv9u7xsvUBqNOnuuhP
         n9BkbCxU+NpI+0GZcQu2ljPshxftUvuHk30P99F0fvK/KT4eGP4JIvk5+WJoSDWyrDkH
         wPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703994; x=1796308794;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4o6hxaMULxHqbctzpcqZn0i4+vQqLZ7WDm3A2Ju/p4A=;
        b=ReRKdIBzgbfme96gWeL+rh+DokbKmFWw+TZzxZoT5IrseDcqFmz3CaA0nyICygqxV4
         Hz55lTDFSkrJdg/ExBZeMJCc5ZzeAosQyA6FeEbYFn0k4JPjtRuZpt16GSNsFM7SPuoM
         AP9Y4MkUimdZHSIN/j+3btEqCAfby4Z5MidLED/C3Nh5yL8zs3L+ux/RnYNTb9C7Mhf4
         2aqExDq0AKgvNhTQtIsasDQkOKhbIDMcfkBbMXqlr+a9FrklsiyVIMwOUaZLbIcaEP+d
         DW7sNOgUH3/Qg1JQj8M42ra1+Gh05dWkOwedYdg2eXDnskhOhXdK+agRO3XZmoBmq7/h
         pGGQ==
X-Forwarded-Encrypted: i=1; AL+hErHgzX4VR9OAah16FZV0gyfXC6UXIsej8EXIbaQia+vA9M2wI+fpNywJmN9tX4R6EOKcYX0Hv8J2BRIMW5AV@vger.kernel.org
X-Gm-Message-State: APuU4Z+7VgVxbsOwTpBZc1IbrLDKdVvVfTJ3rzFTsHFo9gKNFNzZ8Bos
	kTyRwmwAYzBHhJQoehwLGsCQl1NuSM7ZPCL5KwySHBVSqIYAmdqgBGJIFdbm3J7mMTOkXBP44Vi
	yQZs0kvTBjRc08WgVEfHBO3A8gD6M0I4B1gkWnj+fH39Rk3H59HFRDhnQiUu0u856YJDW
X-Gm-Gg: AZFdTZfG1APZ4Q84ysxgnK1EdoK6vytlHQhLo2sNfS8rFsTMA2p1NE9h64M84CtLgOT
	bQHV80YWZyvJBM+Z85Cic4A/+rETGmd8CPH/26bqaTuryG7RNPcNlBMmh80QKJbSZQCi6tJ8a/w
	uNXJ9Cd4R9jWwuNDwTQo0FOJ7gYUQPWTItzIUs0Sa5FHOgxcozRjVLIceuxVvZsAUZGltrwPK0E
	fRQ5A1s3vYIqNSuUYv8XxL+2nCyd+LT2cewQxYDyRdC298IDaLZnXyLdGC40s2+ws99wT2sQtqT
	jJxYY5pGm5KneWsuMUUM8hFu/OykfBtm5XSyyZRbUrNuqlLNVT/VmXAcX1z2jYJC8lrBEJzj5ZL
	0OIM0QeJ+RnZIVtenYQUEiQZnWCB47sh7g4fj7BnxnfT5g0TE8UAs9sEJafefaKXl2NoeTY4=
X-Received: by 2002:a05:620a:8719:20b0:949:b116:182c with SMTP id af79cd13be357-949bab698d9mr3428196185a.6.1795703994518;
        Thu, 26 Nov 2026 06:39:54 -0800 (PST)
X-Received: by 2002:a05:620a:8719:20b0:949:b116:182c with SMTP id af79cd13be357-949bab698d9mr3428192285a.6.1795703994052;
        Thu, 26 Nov 2026 06:39:54 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e355easm9326829a12.3.2026.11.26.06.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:39:53 -0800 (PST)
Message-ID: <bf91db79-ae88-4402-9b5d-bd797658d03e@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:39:50 +0100
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
Subject: Re: [PATCH] drm/msm/dsi: Fix double put of the PHY device on probe
 deferral
To: yzddmr6@gmail.com, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Miaoqian Lin <linmq006@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261120-upstream2-msm-dsi-phy-ref-v1-1-d267b87d545f@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261120-upstream2-msm-dsi-phy-ref-v1-1-d267b87d545f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yK7pvTphminR5fuLP4G_DiDqUAW4mofC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NyBTYWx0ZWRfX9Uz/iAYcoJty
 eBXDvkSl+7unoAxnSdfKMQnBOpC9M7LLee5soa9ZW9bOsWrMAZ8Zyj9QSem3liwnOqnDNoGL43Z
 Ci47E5YBkn3BCEwgU5+tN7NAYG9VDFI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NyBTYWx0ZWRfX2qj8HHEa50qN
 GioUR9rGGn7JLYYFKt/rbgvZe7nKGOdcrlMNJw8SXqUEc07t+VZ1HHS0Fse2xJvZFy/sqHscm7T
 wVX7e7/0Jjo64mEzbtSRUNZ0Ekc4sG0hZMHhfB70FjJSp2nT/jKalm47Digol1kzyiCi00g2WVW
 Z8ybeQ9qcnlZMx5rnXNANPPsTO6va/YKuk+kBHBnzJWWCLFORlftCQCZVVgtsi93iBKNlcc0t2s
 m+9ryOwcUaeDC/x1nAm5Iu9HmAQMrsFY0PB1AFLJLRwgnLqpqIOcCzoex0uGYC+GqJXwgBQjvAL
 uosl/XpZRg1e+vDXOmEa1Oo4jwmXjNqCoS6fzXsmV+8PC0pnlD+3imoF5HWscEtg1pz+zDdKORY
 /IQu6DUKIDmB37t0dJx88+PD5P+6rkAVy7DHW0puL7YZEJDm+O/mja1LHqoc4b6uDzMh8IMKRlB
 vNDNm6+cObTvg5LJY0g==
X-Proofpoint-ORIG-GUID: yK7pvTphminR5fuLP4G_DiDqUAW4mofC
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b0844bb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=Fn84FyJqvcQcrJAY-HMA:9 a=QEXdDO2ut3YA:10 a=JkYnuvabuEIA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260057

On 11/20/26 2:12 PM, yzddMr6 via B4 Relay wrote:
> From: yzddMr6 <yzddmr6@gmail.com>

Please set a valid git user.name, we can't take anonymous
contributions

Konrad
