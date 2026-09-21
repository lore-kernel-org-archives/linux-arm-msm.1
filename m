Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE8C495ACA
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993746; cv=none; b=cqaF2qxtNvTKqsB0FFBbDldu4xVRgm3ow4eKW4JQa4iNJcJiCaGHtPhGl2rcyDiBuAf6r/UUU7YELv/c6gUr+R/SrNg6Hz9NDwHIzZ1uDd0HhjHnoT88ry5yGcfZE95S4dxD7nWCFWEyl+13Dzg8kJQpTskQtiH30PyVseWWzw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993746; c=relaxed/simple;
	bh=OjmJ8SXu8xMfqjFBYQkETIoPpmfq9H6Ub7Xx9JvwWQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CFqoD6tCU5oO++uZEAPvnq5VnDnZ8KpaS41O70jjn2K6iTBZH8+luL8GT3+Fn0U+jvhkYJpDccdhPC1LWIoRN67bYazd8mJGCCeQbsri8I0Xgr5Sbg630qMC/FP1qvCt1E9M2El2PBvF9iD8JXRgbEKOvSVd3G/k1t46hw7jgqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K9GGWidx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XfiAlAqa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K9GGWidx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XfiAlAqa"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdut91926522
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uc+TNfqvfLkCqO0IUPurd5yf0xD9kPfhoXSWPe2gtbA=; b=K9GGWidx9dPwSV95
	GM4i9d34ZGYg8rtiqBH4HBPDcdi7/GJ16cDvfNJTMi5zHncH3PKLuVd+7oNFIFZh
	p4y8Cj9gnLZCVKT/bdRRt8AW3EZtzaUPTiv+AhqEOVyyF8qPSxVCG1iXhe9hQ5N3
	CIvoVg6oVyUtt+ZguhFMGXy/sX7oMuK1KhZ8WBwEjxkOOoseSdHserh7JdOwAXsR
	R3lXOZgj/TgM35D+Yc4ejgi0ELzy//hncX/vKORQaZRVxduKVGv2Aw8gg8W8fyHn
	5WXhyTRhCzJl9dtt14Z1GYOxoJne8RfJvFUwDsMA4TBJFy5Ra+CAliRA830s0fs6
	1IKPzg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3vabcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:29:00 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c97957d83bso89365e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789993740; x=1790598540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uc+TNfqvfLkCqO0IUPurd5yf0xD9kPfhoXSWPe2gtbA=;
        b=XfiAlAqajyi0ioEPDenx0FkdVcbqc3HirrZJCdj1xokpdmbLhwoYQqgmxWzB2ueRw5
         4aqzD2Q3KKO11BEUBr6W1x1XHjtuUMO+cwB0GNqeW04LsRWgFmWrBC7PJFaylAfFpCTq
         3ujHkQ/DnluKIv6ZcyYHEsKSuldS+ncDY+0yOIfAmPtId8yuJCRl3fa/r/bG86M9MOqa
         jVwWjvk88izm/GqoQc4MsaZlmjrAXdZbgIDr0AAi1ZW3QleKaZRCiteqfbiInOJ5hMUo
         Tb29dOGPAkViJPK6PV0OKYxOB5Slz2bsu/Q/1syWPKFhIDOw2ZaJpgH+2AGKl/CyUqd4
         weFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993740; x=1790598540;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uc+TNfqvfLkCqO0IUPurd5yf0xD9kPfhoXSWPe2gtbA=;
        b=bq8d+XZZFBs+wxms2jZ8/5fu2x+PIF081Hp/1VEhoIwMo6b2QzKnSXHJAGj5M2XW7P
         7mAdbOnFzoYXd8AJtVy7rRzNiBiWDXEVS3FCWbXZkgCZIfhTFr1Sq4xXiitPVgd+i7Qe
         bbLVs3cd8GPfvcDfoM8YJY0L3cDWpL26bMaqqt9niELU+AtZ27qrPCq/B2IUSkd5+o+a
         CI+MokYn0fjb5vJWi2Nl7yaHnYaSXkQB4O3VPOInFVTsvhK5ddqAwDFYf9eKE+Zb5wg0
         jeMU9ZGyT+w1ZGMwPglmQXhpAhdbPt2069GVp+BvBpIRT2CG7tZG7EFiiGViWkkBFd+p
         vh+w==
X-Gm-Message-State: AFuF++lk2KtMDb7gfd+55NglC9cva63/Um63kQSnsyS+3YBmGc4Y8xT3
	PvzMktF2tTGIvC+1R13v2WL+yb2EK28qk9a2CZYCcRfh9lFBh1TfYSkzQIEYtw2mV37k/6taELX
	vuPNUeb/5qIJnBXsx5p9OOLleQcLusvNH/adEC/UTnABVl4hSODqMNR5V10vDHdmbI+J+
X-Gm-Gg: AYBFou0ktjSMJ8esupd5Opmyz1kWgjqgnKoVGbGmwFqsHoLQ3wdKQDvukHfwrRsrKo7
	ScNydSR1FTmGEwudjvrmKxyBWUuV7y+MrwwzSjZaY+Uf7l0/qg7nIU5ebbiQ8BnolWB6jQKSdFI
	9I8bnwTtUX41qA4pmcMQ5N307xOi/Df1SqDyIyVjFVfd28kzEGTV5pyaxTyxrh+nvWSK22Xl9Nf
	qeBcmYb9rWQm7Roy6yjgCTCFcE1+cFXkG2FwmPWwSzxhy+6O84QLtwSyodHhvTTqange8aZRAiY
	uz9+DYcX5Q+QolK+Hk+KdvfRWrY/QprRldVZP7CH7midW0AyBQsjKqRTPEUwo0fWb4gytPP63w2
	gnQVGYIaAsLLjHYpDIS+BSw==
X-Received: by 2002:ac5:cdb2:0:b0:5c6:2128:7cf8 with SMTP id 71dfb90a1353d-5c9b8b8280amr3283570e0c.3.1789993739761;
        Mon, 21 Sep 2026 05:28:59 -0700 (PDT)
X-Received: by 2002:ac5:cdb2:0:b0:5c6:2128:7cf8 with SMTP id 71dfb90a1353d-5c9b8b8280amr3283541e0c.3.1789993739322;
        Mon, 21 Sep 2026 05:28:59 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8cb41984asm1317676e87.81.2026.09.21.05.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 05:28:58 -0700 (PDT)
Message-ID: <ec3e108c-72cd-4451-a0c0-0be14592e504@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:28:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] rpmsg: qcom_smd: reject interrupted channel waits
To: Slavin Liu <bolin.liu@seu.edu.cn>, andersson@kernel.org,
        mathieu.poirier@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260911060920.94363-1-bolin.liu@seu.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911060920.94363-1-bolin.liu@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ytia1IYX c=1 sm=1 tr=0 ts=6ab1230c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=s7OMwfEDKQn-nhOmWicA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: ZQVPcu7NJXJwzrvph72vNdMUPrxh--y5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4MCBTYWx0ZWRfXxzRWocN3fBGU
 sPtx1gFU2hCK6rJ6Qae+QZi8bkxK5lGFgCrQyUo8Yr9pXDgekBgKJrMttlG/6RNBoqsyPOAAPTJ
 ZHYyfx5BZYEymgERrKKZDvR3PQ/MZt4=
X-Proofpoint-GUID: ZQVPcu7NJXJwzrvph72vNdMUPrxh--y5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4MCBTYWx0ZWRfX46BsxBQHsfSI
 7ZAkyy0MEqS6npikwwojrEM7jiNrTiYFtArhfcyh6xEo7K4ROgfjLWjsAlySXurXwW/NXCCIdN1
 eHRCzagvKuEaJtN4xAhPygS0b9ziHWpzVxpij2GJ8h41+vrp3rsl69c16LUSTBTUMv4G5rPz6qa
 N72eDqZZsSLo2DAtlZqg9nFTuhoNtiSptiyS6OWawxR/SlqLVDXYr3xj2VgWKK2in/Z/J7Skp4L
 03Mf6DbpdraMbAq1mQ0Aoz3nfJakVE4RqFA4SYoBb3gl5UDiZ6B+qbDU93ONOs2cIUBHA+A7nk7
 /+YT8CpoBSwqNUZ5I+YCDUw8vMkWdKdyxjQwm1NjEXyIy7wmtLh+Jmd3cprmQclU4AGq5GVGZkq
 QaaKb8cZrFk36+GueW1jIfYw55nynRliKfTl1RlsFEr3ifAzCjlby7w/hHiy7PDcw1jH8LbSPTp
 y2CTE4r2Wk3211cBTHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210180

On 9/11/26 8:09 AM, Slavin Liu wrote:
> qcom_smd_create_ept() waits for a channel using
> wait_event_interruptible_timeout(). If a signal interrupts the wait
> before the named channel appears, the wait returns -ERESTARTSYS and
> channel is still NULL. The current zero-only test treats the negative
> return as success and then dereferences channel->state.
> 
> Require a positive wait result before using the channel. Return NULL for
> interruption as for a timeout, following the endpoint creation API's
> existing failure convention. No endpoint or channel resources have been
> acquired at this point, and the successful wait path is unchanged.
> 
> Detected by static analysis and reviewed with AI-assisted source auditing.
> 
> Fixes: 53e2822e56c7 ("rpmsg: Introduce Qualcomm SMD backend")
> Assisted-by: LLM
> Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
