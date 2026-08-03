Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04682E8B9B
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 01:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785721837; cv=none; b=Z9VCWGjspsfYfDLijIYrpJ2oxb+ioxrzT4mKqLOr03wwtcHhC4aVaxzz5L7KaoPuTeXQ5NyZRVlowf8ZmXnMi6KVC8Xxd90cFvneUWNEyWkYOxCJaRt+E5TE3J1r1OFwp1g1SJeCaMO8M9QArsd4W9vRqC6QEF9XcKoeBp45+Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785721837; c=relaxed/simple;
	bh=Ych7km7RzdMH+A8V9KC6uTYgA8GFtn3ofOlpfhw3vDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ga6RgaivgDSCCwvD4nbL5K7PsHbsDDuKVtZPj3oLJ2DER+XGJHPoEih29M5n8lr/E4mS5y1EzZbdEbE1fYttt8cq77CTyRCbC/HC4AYDC+mNTwoT7+PvlnFMHRBNLPI4UAnOIXpqQRMYRbUP6j6cXIemMs8F//ONrd8XVtj09nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9AwetZ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SBveNKPs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9AwetZ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SBveNKPs"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LWPvJ2211223
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 01:50:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xIFd94f6C79s+yG6r78sDfN4bOnzyywCIv/Jsn+QDnk=; b=d9AwetZ8/fOTLIiY
	j6iAnBCBv8kYHvnrZAYwo4H4nrQkV5V0q4XK2DcvPHsPbJkYQcmRYyXBm/kN7eaK
	Ra4QCcn1JLDlctnuA1PCScn7eCTk9zDhH5xDZYvX0uzhxeTOfPQMxusJIfrHyZw+
	El/cMF8vxUye1reD53tp7MC9gaIgibXXwmbnaWQt8FtBgjEzMDjcdCUumB7Qs0MJ
	xqP6R3HgS4LBAyNgYPuTZQdDd2lktWOPdTWGFjmVrl1KlufBoqs0FFMMaM0fZhTW
	/OliSamIcS20swslH260VNY/drV+RZRdhdp5Alcx9KMsIAC572qYUcZP9hxMACMd
	0JBCQg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftdmx8da2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 01:50:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa4e4684bso79146065ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 18:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785721834; x=1786326634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xIFd94f6C79s+yG6r78sDfN4bOnzyywCIv/Jsn+QDnk=;
        b=SBveNKPsq6H9Y9rPjdTIWdSIFofuegrKouOZc8vdSXXQkU0WeQ3puLGx9aMZY2qh+N
         NgcZxs16cz739Q7BcXBv3N/bRLa6Quyx2fFCL60tXV03dyHwD4O3XUz1VnyFjtOu4dnw
         j46NxBJTLNjF0p+0N6IqJN+9I3DyaR3x7srnPxbb5bIiZgqYky3cVqjmSk+NE2jxtGKh
         4TPMKjyNjHET3nHdoRvQVhnSBu8T/FdxE4ra2unS+sj0I4AdRHdrejPgq+LGDEMCKKBM
         4BeW86/f38l/UNPPFBvxVcNQafpbTR0SuSNk9PXMmTQ4UccMvgA8tPVGwVEeTSSbibyD
         g39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785721834; x=1786326634;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xIFd94f6C79s+yG6r78sDfN4bOnzyywCIv/Jsn+QDnk=;
        b=s+Q+njHmAC/ZltqedS+cMT8v2P5qgmT2NDCr5fWK+T9uy43+/0PZQIDLR2j03N0GQq
         AtUybKAyRThP/v5eU7fvsncjx1YqPyJSTIShgdTSZtHDtW58TsF+5g1PxGjTHqUjFCWt
         tBEXXwrxaqu8cntvNTx3zFNS8yeVoiA8f/od80Mo5WNc7UNNF1prQHKzSKUjf/8dEeiF
         4UtFTM+o14PIcSiYQ7bLXNBaGNWVCzIbkvSJHNQPrBlNLRBMC7k8R3bRrFqKdRrNqwiY
         cMwe3uycqtsoII13NEJSnQkFOrm+OuemQB/pmuJ95Ljy93qawZioPC8m673AWPYU+5p7
         ashA==
X-Forwarded-Encrypted: i=1; AHgh+Rox5iPYjhDqxf7Vq2WLrHJU+FS+y/apsSsFYr2kcZxPQVEaULGFQ+M3zdX1xrflXc3j8lUgcD/ALRS7AtsZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1SXd2ncoqHKP7yTAnNA0Zde6/Sflv9LppAJ3v/EQdCFeQVKyu
	N1w/RqCrYGVYOrM1fvXuvSWd3w6AaLy9tCChLes1gOq3jikxyJsuR5n0ahYxHop/5Eh5jaTm57n
	Cq8rYFsi9zssiUYeKAEAPSi+hMRhrBHfrcsYXp9W21eXz0VQ8s+O9Mvmxd/QWWnfujG4d
X-Gm-Gg: AR+sD12YaEUU61zgarciJdcSnATDAK4ejDuwFArsaRbRyQTklcSypIHEVCTimOprh+5
	PQBCh0Wa3LGESrdkXzz9wmDGAN0cqd8O79vYsdy+otYE0M0tXvpPGwtfzXz6Yt1xuSWr12GQUd3
	CArwM94uROhsIFEivYZuORXJHc06bwEBAl7qtX5UegtnKDWg6VVi+ML36pn4h4dKf6w2OAGT3pe
	PqaGPTmkphr8/yfc3HgeUEFvQAM9tpcj8XxU4Og9FXNMZ0rpL60t43uplgalZqCR4DrROKkCu1b
	QrLKlQWo2RMjH8D3Ei5QAF0Zh3D6PdeeSaO0FENlRVXhEBQxvzKPhBbsAIiu8HyXKq1V8VQtrh/
	s5gUqkLdAER7TB4wkjbP7dLS4k7ux75QapQh1hpQm3nHC4dRmCXUYNFtj5V7qN3AEZoYS
X-Received: by 2002:a17:90b:3c05:b0:38e:101f:c867 with SMTP id 98e67ed59e1d1-38fbc4896afmr7526779a91.18.1785721834346;
        Sun, 02 Aug 2026 18:50:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3c05:b0:38e:101f:c867 with SMTP id 98e67ed59e1d1-38fbc4896afmr7526760a91.18.1785721833849;
        Sun, 02 Aug 2026 18:50:33 -0700 (PDT)
Received: from [10.133.33.59] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2575819sm3263683a91.0.2026.08.02.18.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 18:50:33 -0700 (PDT)
Message-ID: <25e0797b-fdb3-44b2-8ea5-df0bc3355648@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 09:50:29 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Add PWM frequency mode support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260729-lpg-pwm-fm-support-v1-1-16d3c72a9921@oss.qualcomm.com>
 <7a0c4a70-b838-4c7c-9f16-d394ffef95ba@oss.qualcomm.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <7a0c4a70-b838-4c7c-9f16-d394ffef95ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WBNi5dTTsDhKikDohniu2q0niGI2Zhxd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAxMiBTYWx0ZWRfX8zpmXzGXfZEF
 Ihmn+l1HfngSoBuFza3Aj9kXm4sqpz6q1IEpzqA0utU2k5j6lAnUbVU3B3s6la5Id7gkpIWo0ua
 rClOWCEH2VYLWFYupFryX19+eIc3pcXaWIKFaWy5BCti2g34K/HwdTVeGPySn4aMQOaOqoy9lGv
 a/X0mnW6riwYW+1L2daLFA1LypfzyNgWIzOFc0oIlChKjXHWW4l6N0aDGSLsYFP17qF1X2wCnOE
 vZaO3dusdwcP6luUutlf0KtO28Hn6z9N5LwfX31EAQdBL4bH4R7ZNQ41mz7ZcyBIPV8LxiF0/Fc
 3MUcDygJ2ofxDaNVBAj/bczeo7xdG9QRyjfvQlUTgdRpCuLuBAI6s0bprQvfkZhgmEXTiZGPQ9q
 ZZaJX8cHv4+xFcEFB5TYgiKw2srcxL8zrxrvwX2BiJ/jpfraxyKdtipiEgKGsGbTmSdVkUdTw8k
 2sDeQiCgLYIg5PLxkeg==
X-Proofpoint-ORIG-GUID: WBNi5dTTsDhKikDohniu2q0niGI2Zhxd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAxMiBTYWx0ZWRfX+mLxvvBq1w+d
 LTCJ9Llx6vhQEPZBAK/gvtxR66cw8ip6pvHKndBpAOjeZWQPs2GA0SzWBO8dt5dCWs+pwDMiuqH
 t6FH4hVuj08yHl1CcdzmkSpB1Z+EHY4=
X-Authority-Analysis: v=2.4 cv=L7MtheT8 c=1 sm=1 tr=0 ts=6a6ff3eb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Jk1indnoN2tpaKD3vp0A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030012



On 7/31/2026 10:20 PM, Konrad Dybcio wrote:
>>  		regmap_read(lpg->map, chan->base + LPG_SUBTYPE_REG, &chan->subtype);
>> +		if (data->channels[i].fm_capable) {
>> +			ret = regmap_read(lpg->map, chan->base + PWM_STATUS1_REG, &status);
>> +			if (ret < 0)
>> +				return ret;
>> +
>> +			chan->fm_capable = !!(status & PWM_FM_PRESENT);
> Can we read this register blindly by chance and drop the match data?

It would result unnecessary read for the PWM channels which don't
support frequency mode. The register read here is actually just for
differentiating the HW revisions for pm8350c, where only the V2 support
frequency mode. And the newer variants of pm8350c PWM4 channel could
support frequency mode by default.

Thanks
Fenglin
