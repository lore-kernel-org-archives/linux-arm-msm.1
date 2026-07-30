Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEAA42DA56
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785420248; cv=none; b=Gm2vfa5A3fAtruLXhFUWzk66KMVcJs+W8J7mTKklycgiS9k+s/2GuHjDV3haWIY1O+r/TTTvT8Ay1A8tlVREew55GEh84aJsgecsiwb+2DdZg4fT9X38/NiiSG5QVYoU0eCdNj0fPrhy1m2XmDiodKI0NbRae+C57XGrxD2SV9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785420248; c=relaxed/simple;
	bh=/sugqThxycebEJKGOGGV8pEi/4MD8PGJcLifRQncemg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cv+0fN82w0IGCtNMnPmF/nJR6lPZuSI/N4DjTSbYtnPjeMCBub8VuUwxbtEp3xk3P08zP5GKH5z75vFJSQyqZ9gF98lOwqxXgc2t85w8Xoj9fCv48OFdosQ5W1k6ny6tIMNmREq2fgL8cPeHWUDx+Y/BDgTCM9CZFgbkfLlJcak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BazYTopo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=byDJXDmD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BazYTopo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="byDJXDmD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDDCo0715711
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GCvJ9L9ZYtovivivI8a6jhMhe6x5m9wxXaItaxXXBEY=; b=BazYTopoHT7TUCBW
	miYipGMrEf55G/zNxUSJpfxCSIMM4JgIlHEszjkHFHKRrep47FA1ZUox7oN7R0Jh
	P5RbKkT2POdYkHnC/o6+0+k2AyVxlRrG7DcRKG+9aN1YHun9kH4jv5LnHOhlrqVl
	pzQM2GgfVhn2U9+uTeyvSzZTrivq7dnOu94R7u4dM4ljRNbegLrP4ucnA35Ryb8l
	BgwYYrYOd7gxZ9S5QInGcka4eprO0zJn8L8tdUv+eFDX849RZ3Y2JkspH5wPudFF
	0NwmTgbwUp0R4C3yoZ77qty3dTY5CvPqT6/++whC02mZz/B1iInzcZGk1MSRCe88
	LolB2g==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6ucrbub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:04:05 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e6b5a8836bso695382a34.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 07:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785420244; x=1786025044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GCvJ9L9ZYtovivivI8a6jhMhe6x5m9wxXaItaxXXBEY=;
        b=byDJXDmDwazLT4lzMaGn44E2eejacjDLzdizZJo/yb+/4nc3XgB1Vb5IUXjD2VI4f7
         zf59IQz0xvuaDq5AhNNqKEkgzNqpb7Bvz39TFjj2DiSAsJuDqBXh5JlN/XYuyLCUM/yb
         74/89CX+gUTUuOnnQI7t0P95FVRImpudcxPRQghVT7QGevBJD2YdoHwlaDEpkiitTHZT
         5PwC/GqZJHhswU7DKIrBM1bB82o3sTfUnMonBOezvKFqUazb5w6CCoqdKhzxRno4bEAi
         qtbKoVNY/Oum6yRig6/W9m0yZrbtF20aYDf+mATRqyK08olG8s32MciUQZ8sVASq6g83
         IKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785420244; x=1786025044;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCvJ9L9ZYtovivivI8a6jhMhe6x5m9wxXaItaxXXBEY=;
        b=XAK3eYdpdvHiof/thm2XGokoRcFUWjoFTSNhmzytqLtOJADd7xl5HXsuR9QwPBbFpH
         4chHilsYih08iTLpTXQ/2jTk2rzperN/t4Qp1DzL2kyWU9ED04ea3RaktKERJaeLPfbn
         j18D2lqJe0N/BYREygFMrL+zGe5hDZ/SqwDvQgzoTfAmgUnCl/CV3LuKLeKmQ3CIJZav
         bTtwE88joGIdhvbNYI/53HRczxRfZHTzdKpysqPs5DL3KOu9o91WDTzZ4ztjKDszEmxS
         CxIUf2BVsQ0nxoNPuWRCuwHoZg/JXrCjD96cWxpaY8SHToYvKWiroAPFM4DGHpkjrzoI
         c1Ug==
X-Gm-Message-State: AOJu0YxUh6SE2WRYVSgW8TOGpHz2uwqO8gfZxWko5g/sMDjYyhU7XQLY
	mbBwy/zC6ArxX23uzNofjnT6QlSC99VaRhcmSh1ZJkZ9VRyfwLqZ8XvGOlizJMvZwLbesUDO0L5
	QgRDQiYrJu6UsRy5KJL3pqE1R8okr1zhuIjIHjUrp4jAe59WuomQn2KGzSWvuhqkHwAYZ
X-Gm-Gg: AR+sD119SX1FV7Uc+iDmF5gVXMl8JzsSWXUpdyT9f3UjZea6Ac3zrAzd8UUv/yGpeDg
	khanzel1orY0LUHFKkTQncmgR/qiJQmjOfchVVjsZN6rbzpvDjkskPIaStbEAngWm6mGZl0spVG
	hXgAnLajWgA55jUf2eLrmkBlOMSwx6AVPJ9Ju3pddDsETqb8mzpgEPdz13stSKM4a8NN6a6TS6h
	ctf+IkDZBlNuPhZ+xWK4bVszoiHBaXptbrMFkqUiAYsH9DrAb+iIQYBTi+BYTHkzKX3HON7+5Sc
	Hvd8dpEfjBJWL3HljVUsbjX6Yp+WsjlRrSHQxCBsrk46djbyxe3IcE1cs75phxbB0vminlYdyZI
	ltnlhNBABjgH9VIT6STjDvG6+
X-Received: by 2002:a05:6830:6617:b0:7e6:6ced:992f with SMTP id 46e09a7af769-7f03932d362mr606053a34.2.1785420244629;
        Thu, 30 Jul 2026 07:04:04 -0700 (PDT)
X-Received: by 2002:a05:6830:6617:b0:7e6:6ced:992f with SMTP id 46e09a7af769-7f03932d362mr606015a34.2.1785420244248;
        Thu, 30 Jul 2026 07:04:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db942df0sm363976e87.14.2026.07.30.07.04.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 07:04:03 -0700 (PDT)
Message-ID: <e0733431-f950-4703-b78a-544c60df6a17@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 16:04:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: qcom_stats: Replace CLIENT_VOTES_OFFSET
 macro with sizeof()
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260730-b4b4-removed-unused-macros-v1-0-2883fecb9e6e@oss.qualcomm.com>
 <20260730-b4b4-removed-unused-macros-v1-2-2883fecb9e6e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260730-b4b4-removed-unused-macros-v1-2-2883fecb9e6e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwNyBTYWx0ZWRfX+4rY9DfQN/Pg
 NprpMXklMjhUFcsdRs7Vate8mFOUBb73W6VU/FNc6HqOFb0HGsUbicL41JNGJFqL+MlTc4m+eXf
 xB2zyEbSekZvC5+AjUw4LxSocy1hjBA=
X-Proofpoint-GUID: nCw0ymwz2lKZb5nDx3hbsDkSPBAKIUUv
X-Proofpoint-ORIG-GUID: nCw0ymwz2lKZb5nDx3hbsDkSPBAKIUUv
X-Authority-Analysis: v=2.4 cv=W6QIkxWk c=1 sm=1 tr=0 ts=6a6b59d5 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=r3ooDbEwzApSe-nDNAkA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwNyBTYWx0ZWRfX/Rfcn/HW+Olk
 ZuJYSJ0fzfc6ngYUTMvkvX5L1wV+gV23ZWWvpKPa+uj2g0z9JYO6ZEQTJDM3xoJEyg4wo8EKzJI
 g4WnkygDgRqTvsR20V7ASvOHhDkyU5kHOmyiI1QgK0OUvHiz1prJVDvp2MFBGQm4LWBJH093fzc
 VMErm7gZ6h6SUXYBZ4iAAepaBvQI+aqmvTYNZLj8TnYxKfAwU4J90L6WlF29XPsaY7Mm7N9TPPf
 +cM6fmHBZZIkzc9iyByrXg3L7aNY9t979gl6TwulKe/7cBOnEejETGV/WCjXr/eIFAMyQe1AqK+
 /y7olrR0PTCuAovMGwyo9AwSJsGq90q0kAvWBfdo5GR0i2nEOExN5627D/neLOjE5jduI+e1trn
 vza//qbKXlpyenJfsCJh/pfFbJ4KGcY9+YQYlfn8IcpyU+HmJ6/O3Qt4tcU+yG4SUaKaL7JoE6D
 seHGD6IL3NeJKKkK/3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300107

On 7/30/26 10:46 AM, Maulik Shah wrote:
> CLIENT_VOTES_OFFSET (0x20) equals sizeof(struct sleep_stats), since
> appended_stats immediately follows sleep_stats in the memory layout.
> Replace the magic constant with sizeof(struct sleep_stats) to make
> the layout relationship self-documenting and drop the macro.
> 
> No functional impact.
> 
> Assisted-by: Claude:claude-sonnet-4-6
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
