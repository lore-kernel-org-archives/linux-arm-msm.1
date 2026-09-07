Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B8D35A39D
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 07:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766116; cv=none; b=X1RdJIf6iSlRWt1IJ6nLNq2QtWPktfc4luoZsAm5wCEI4ZPN2ew4q9hlRRu3YewbrKy37aFYIjd3iN9eVVcf15veO4bkvCtAXA/3iaebPuJN9Dc/BJ31DZqKugZIcw9eHE8EP3ZVD5VzqPrCIlkf4CWAHLMJmFmdLhfRze08DDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766116; c=relaxed/simple;
	bh=MMlbb8+iKcRQ89PRsyjDwvellyFyFh2hBXKU0RweG40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SpKovkmvukHMJwOfvA7ibdL7sA7mxRe4ExzVF4viYVPfKymGPw9jgpOzX+R7zqYDfuNCA9ogqEg8LiRABoeA+5w+sk7xmRhVtkhTOeClr4sf9x4H2E6OJpLpIfKsRsqDNk+aWNmQ+/5v5NhLST70mTPCyL7/7+xnu7NxPxFCoJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j5pTLVVV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KPuNlGuS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j5pTLVVV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KPuNlGuS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777XHg2668281
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 07:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wK0WimAaK5oxosHNI2DDK3qbmaA2pkSmllJZE/y0tC4=; b=j5pTLVVVYiwzwqU7
	2CSQMFxwW3tCFOT1Z89pgTjJEHTnzYCNp8MUVcGxj55/fPvRujOv+I55/oaxWFAc
	buvqKufN7zIIfIhx6ntlRKlucg34OpqALOhETp9RBLie8gzzgScHlcUeFAK6nUFj
	g1bt/Vv3Kl5g7Os2TSnUrE7LRw7CEoIPR182UPuKk945+ZVxCRWXLXK6jPPFMfZc
	ZiT2bQeeL8VXinKrMDopMVYCcYuf71SebHQJ/XPad6xjw7/mJbqnxscjRSiq/y4h
	ntSmQC3QTwhWWKm753bekiky8V/cccfh3kdFuWWIXX0dMiZVPjv2juWRlzDW1BDV
	l/EPVQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggcca5ge1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 07:28:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93821883e26so58569985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 00:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788766113; x=1789370913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wK0WimAaK5oxosHNI2DDK3qbmaA2pkSmllJZE/y0tC4=;
        b=KPuNlGuSEgX7oUuyVZ6Qruyszg8aPKt95eRZySPguMZ0dZaqEgGTpqZy/DoVqg8/35
         o3jYjF98FgEbiMEbwz3s/0bJk1ZBbRgd5X7Xevj0qp16jC9XZSVA4z9uKoHskzbP10Fw
         NrQluinH2RXzR+j3GTE+ZDo+5FiqhZU8r8GrqXSL5rPIyb6KYcEr88ZDSZeadxDf2Jqa
         OhwpL/Tbp3wZBYewKyWE7ywdF8rfFsxUcOmg5NIwJZ7UBXQszv/J3VctnoLRypMG2GJu
         IkBpufyO+T87jJiZADXRiTsiMJEIJPL+oyjySfVVyK1P9rRs4OlFDIJBuAfs2e4FkF0i
         phQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788766113; x=1789370913;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wK0WimAaK5oxosHNI2DDK3qbmaA2pkSmllJZE/y0tC4=;
        b=hzChW80yi1rwwvQfTVEuFSYaM4S0IgtcpzsSsNg6bE47Ys2IVVZvik2hn5zJPp6hnb
         fgfBAU5zX+3bbeYn4X47iKERO2tQLtjZ/2te5oQPlaUt8u3QE6xEZPAiVIbBW+egOJt/
         We+dtNm5bQtMRP3gVHq0wENlS6uWN69VvSpyHJq84kmLjzPY/NLK+nxGUzP3RRJTWU4y
         MmFSgMU9CRDCo9NE6k43QPrKRZY0FxNpdWP8NUUiD/DveTkanpD7i1Db6lHcd5/mkbll
         DGdujXxw6FWhNM+QwE9dD8o5aFbwk9ByeHcGf07ddlsMaiG1K1dQKEgU1Xi6uuO7TL1S
         5zaQ==
X-Gm-Message-State: AFuF++n4lFSIXvTD6PeD9ZSt/Q+NKuweJzbNfVjt9Reu0gl+Rk+d6nH5
	t31g0cp1OdfWO857+eJpB3n18Xz5Me5dDXACk1n6sy30WWwXWcFv0H8xGz0MFxl6UJfTcM8CIQK
	M8Jf2LFtAm2/3h4nELQ+96mZ+dQ1lZaCvT3JgN4YJalokeujrvUBJ7X5wtFxwBcb/8ms6
X-Gm-Gg: AYBFou3fQBhwwKeu56DLi5T/AOM5Oc6yVIWqw2cPF4rE8Ys/eJ0KGQ5RKNjjFkLmO4/
	xFI8ZbJ1IyhghVadZFNNzpaD4N0cJvRbDKk4JT/wHyU/cjRS5yfvvKtXLyTRRn3tGZVcHEqA1Py
	SUH+qXa1M41vIQuuZtDrQNqf74VNcrupPwMjpFk2+3cbuHrtCirdhRUFIhgYfYeRJDEmPIr876Y
	5vUrr8pP1uzRUU9eZ7AcWUVPx/3dBgQvRqQUMN3M7Qo6ZdkNblevBn36yFwJhCXH8se4DwTPVas
	ivDGEcFsdpovjvu/BFw3X0bGNti4sEeB8HiGjaBRWFk+hBdoFMJfQo1/0vhXgiupV77bsLel/UW
	ApQALEklUwMDcWM7hKIo/rQ==
X-Received: by 2002:a05:620a:4623:b0:931:23a:83ca with SMTP id af79cd13be357-93980be17f4mr1720049485a.4.1788766113004;
        Mon, 07 Sep 2026 00:28:33 -0700 (PDT)
X-Received: by 2002:a05:620a:4623:b0:931:23a:83ca with SMTP id af79cd13be357-93980be17f4mr1720047585a.4.1788766112556;
        Mon, 07 Sep 2026 00:28:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d55b306sm432124566b.36.2026.09.07.00.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:28:31 -0700 (PDT)
Message-ID: <37203bf5-ed0f-40fb-96aa-19deb594e820@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 09:28:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] firmware: qcom: fix typo "uninterruptable" in comment
To: Hemanth Selam <hemanth.selam@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260907061742.10954-1-hemanth.selam@gmail.com>
 <20260907061742.10954-2-hemanth.selam@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260907061742.10954-2-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yQ1kBfKKlcrGc77cpxQlXno0FoVF6fsN
X-Authority-Analysis: v=2.4 cv=EJo2FVZC c=1 sm=1 tr=0 ts=6a9e67a1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=nOFz4O60ngek6UsjDhAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: yQ1kBfKKlcrGc77cpxQlXno0FoVF6fsN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA3OSBTYWx0ZWRfX/6g9yt39Bijc
 Df9KnASRKT7N2Jc5E/fogv4OfuoUThBya1E+gXQUnxHo6y2mG2ZFy0X5CQij3XkjF/JDkIknfNb
 SwULEfgIQHFBp3VukqiLs/lOlXvtJLe6WTGPviNPJnQ3OUy/qtxTFtSUa0a9k+8k1E9dCd4Wd9f
 g+yEsNDg8m2WV9PZK45ku7v2gXskx2YLbrLT+vaBAhn+JDbv9ep7Nuo+/K2A/ROl395CAkIMHzD
 +CY1jAyoAWedG2mOzrxPj/eLpDJrfa2oqdw/087UHdLMzD97FmABHt9fPs4px8U4FWlOOoXICr+
 ewDEOCZfVTol7bGrCkJUrxcTfd4fs+9XSKzbxRaavcl2KiF3PdfQ0KeeVDw7aASvYHQTH+WvV3M
 6LBSdvkJ/1ZCXfRPxj12ieCYX0fZl4xAWxSPPULYQZ7jn0cyWGGfW/gWPCsG6o54yp8ENmqL3Z7
 mlPsOsmH2pE2bQW/xSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA3OSBTYWx0ZWRfXy1AZ9l8M7Sn6
 eT/CIChtviH0zH7Ho0L2mlr30RU83/f7caN21yzgjFKyAcIWLMa1+E2zpbLe4RNOhw4qjhNCn/y
 f4Vmc5vwIKwAG/wRT+oKSlLPZRvIdAQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070079

On 9/7/26 8:17 AM, Hemanth Selam wrote:
> Correct "uninterruptable" to "uninterruptible", reported by
> scripts/checkpatch.pl using the misspelling list in scripts/spelling.txt.
> Only touches comments, no code changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
