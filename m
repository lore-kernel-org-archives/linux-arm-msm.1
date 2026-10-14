Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56074F6484
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 11:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976835; cv=none; b=EKAe+QwX7N+RUY/L86wLfR1xHXRw2BKA27GZ1vEhAtyS8V+VZsv1GeFtIJfzuBKFFAinV/qLXvJ3fXS9GzSu6K5nqKePS4Qr1DGoLg8xfvrSyjLS2Kky76xKSMeHmaD7SyNBekWGaeiaLUknnLO9853RP/fZ9FnHSTX20nycsnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976835; c=relaxed/simple;
	bh=rzS9vmx15fJ4T2makE3vbQnf8L/sVJo1y8k+j/gnwY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtvv/ZxLAuznB5BfOHwoV86EsXZ36lzpGIRL4ATbFhzqclhp1OvURYeLjKimBdopVOM+9OboHXyZMhK32iEqsFa+z+gQLXHA9h+3+ZHccskUY5dh6hSkMC4pL2Qisd0rYOQ8EfjSzzDdesp74fzBcLtLFpGW0G1EyhmlK1FwMSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJJN1dOa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dx5qsGny; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJJN1dOa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dx5qsGny"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBFrcY3365499
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 11:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MASKzKLwGnsoqQoHSDALtQYa
	IWeFXubP9J79KlMYkjI=; b=aJJN1dOa+/bJS5zSy3vQCjVG9l6+1xy9ZGVtH6d4
	U9mX9Wnjn2TXlJ8oG0I3odzWVx7pFUItNyiXnwKw/WFyufmKlzY+LfLnxyZlGRq1
	Fqloo5JyiqSopTCGjpfrAbfvGcpZljOcjWa90qdpu8xK/26Qn7mdn1aRS9pj5JV0
	uXwbifh69QOSulms5FJkqtBKLaOrXqyfQ8LmQpPMotSQy1qMjsoVLeJRWwp7W1ew
	Tb/HJAu6aILiCIA9zeeseIUPG8tIhtQ1LMzxMUYLnmmUuh01H3lnxelJw2ZrBqho
	qrIC2MTVoOYWZyJXc/8FP4fwNu7DaAUEWsrjRkg30acYVA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46219kj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 11:20:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfc52ddc55so9581875ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 04:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791976832; x=1792581632; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MASKzKLwGnsoqQoHSDALtQYaIWeFXubP9J79KlMYkjI=;
        b=Dx5qsGny4zdi+D8LxuDbmSePJOatvWDNVAcZ7jTsuLwALbmTJ+7E+2f3h3nVk5fIPH
         e1raT0byG9NxTfDr201QyG7pvd7LCeg1ugI/HaMy+tQhR47O3/JdfCuJxyGDV+0WvSg+
         JTF7/1q5pUuD8xtJfH+SCvWnxAPq107EaK0J/wCsJY4BhdCVI2lEnpj1Oci476S/ivU8
         qnK9axaQyRky1wzziGI0wr81NDK7ntoQJL/PHEs9TiaXSwI5d5Uh9NrU6EbYOI/CrVsr
         FrdXdMFa9ro6nsZ8VnFfcRh42P9v8kg5QqDbGVMp0wKzdUVSmJeVcOh/1IsM9cswvk2M
         vdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791976832; x=1792581632;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MASKzKLwGnsoqQoHSDALtQYaIWeFXubP9J79KlMYkjI=;
        b=2WY4UONNTPWzgfmHR5oV65kzmyvtRoFXOws9+yDp3XM0fbQ0SrOJrOckez/KtO+iKk
         jJrWFrEW6b7neGJlQ7Izwxj275Y7TyycnOiqKX0FY5pZTwlsLCzf6zvwAAkO9WWdGnXa
         EEy8ovjsx7E3gldhHBxpfqSYsvcXp8lZEHUTjLLDqAf4Fey3rhNCsI9ygX+FdCgl30MQ
         iSJlQL4MM43NftIWTQyUf59okM8hyixX1xAxIvf8P6lXMa9E0bjaLG7Whg5E6TWyt9hY
         zv+BoDsf/BuTYXRMuPBqTDv7wEvJyxrW423C6NVphGWyBGCcq/kWsJfyRT8hZxImCJFL
         cOlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUA48LdqAUGb1iNIAg8i+4KPUvhsaAX171FS4/thQhx/sdiln/u8dfTrFOkNfhL0bK6U+CG9Nojn7tVygD@vger.kernel.org
X-Gm-Message-State: AFq9FYKwgcIwKaNWDjptEV0bRW51VY5E6mRRkyMpLgiGo+AzomFUyaFf
	GwGW2xQoH1h4cLqcRoAj/b0015Txlu5Pi/2zQZPsJoWe8XPU5UY3qKhu7xqVnECli4UJqmp1ucD
	6kf2xSQASTIT8Rbsvb2EfhXr7MqGl/d4Bylupe50Sl5FxhFouiSH9lnfjyDAj0NYwjOB6
X-Gm-Gg: AYBFou2XKiNusWi/YnsXLsp2wowxRukkVqMFDqXvzny0qkFCdbbqJyv5xRSMQE5eTqh
	rs4vy4yQIXarnESdXQM1lvqyuBErhqXHcV0H5FoanrrjciRVHxLkxM6P7dZBlQynij9XVsGr978
	WTMJVYOlSRLTRGMbajuh7axRh/ZDHlvgUumjP1/u3zJFlNyKRYvysq2PYyjuGkflmIqhTMgzueP
	BgY6dHdT1l1sFBY3knwfv2GHoOoEs1dhWaj4DwgWx+oroHyLiUqpQUdvvilPdltEQA340vWBK4p
	I1HepAtFxcLK7ZCqsuPPl4eDhcygGyfc/vrAahEC4isWwFZxmDPj3yLUZJ5vpdmxTJa/sK27Nj8
	9fvyPMpnPPiZ9Wu/MISUX91/Q0+Qf3bHIvXKD
X-Received: by 2002:a17:903:37c3:b0:2e4:9fbe:f72 with SMTP id d9443c01a7336-2e842cf91bfmr132144365ad.44.1791976832266;
        Wed, 14 Oct 2026 04:20:32 -0700 (PDT)
X-Received: by 2002:a17:903:37c3:b0:2e4:9fbe:f72 with SMTP id d9443c01a7336-2e842cf91bfmr132143945ad.44.1791976831754;
        Wed, 14 Oct 2026 04:20:31 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8202sm65198165ad.51.2026.10.14.04.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:20:30 -0700 (PDT)
Date: Wed, 14 Oct 2026 16:50:22 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v12 1/6] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
Message-ID: <as9ldk6a/44u4IB3@hu-arakshit-hyd.qualcomm.com>
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
 <20260824-enable-ice-clock-scaling-v12-1-09271f583dc6@oss.qualcomm.com>
 <d8304387-ecff-42d5-8cc6-d3b4526fb294@oss.qualcomm.com>
 <apCoDfzaQBGgJu4K@hu-arakshit-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apCoDfzaQBGgJu4K@hu-arakshit-hyd.qualcomm.com>
X-Proofpoint-ORIG-GUID: mLpnEFmyTn0ZtJPTHQtddRf06BnjPboM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0NSBTYWx0ZWRfX5iDtinrqOPpE
 5f3t3PT6gyREKwJuQ1ViQ0VxGxQjZ9VwNm9PzwcNa1OAekPFf85Nw8SZH+JQ2BqBmIHTYktxJf6
 plL7JMroiDcjLhPCQmB8HuFcnv1VJGPyjtA0mcd8qCz/5obPuq6xlTvmvbMNztx0hB3IIeDKvof
 0qPPS7GjD5YePTh106+sSufS22bDMlJuoBQDHQDWTCbSSa/e7ysUokuFtRIY4s/TWqRhYYhw1rS
 bw0q7wS8MuPb/HNDcVgrMSSk39bNOSVtlg3reX7jwggfoCugsmHYuLRxP8OUpqg0ZSPVI1w/pwp
 ChbZ6QlU8XhC/ggbG0F1YaaCNkyokIJ6P9SMgvVEdSYKeiEwFiMOCxr1MlIbVlKCb7J7cQkCDRK
 xMuGvNIXj5QS6BPhexm5iVu3MbGZFQGalps82d4/wD0T4psDVHFnFMk6tVxxp8yqvxEkxgyiU+g
 AE5p+VzcF8T/pK6pmbA==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf6581 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2_FpPSLQlo5LL2co86MA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0NSBTYWx0ZWRfXw84ieT8+l4SJ
 QRM4bWh6tngzAGc7ViP0xu3J79PeDbKXFd6XsnpQf2yEZozecWIXhHaI3v587deoI9G7x17WoTS
 JWKqnRcjOgQUmncv/90O66e71qZz4Zk=
X-Proofpoint-GUID: mLpnEFmyTn0ZtJPTHQtddRf06BnjPboM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140045

On Fri, Aug 28, 2026 at 02:41:50AM +0530, Abhinaba Rakshit wrote:
> On Thu, Aug 27, 2026 at 12:17:02PM +0530, Kuldeep Singh wrote:
> > On 24-08-2026 01:17, Abhinaba Rakshit wrote:
> > > Register optional operation-points-v2 table for ICE device
> > > during device probe. Attach the OPP-table with only the ICE
> > > core clock. Since, dtbinding is on a transition phase to include
> > > iface clock and clock-names, attaching the opp-table to core clock
> > > remains optional such that it does not cause probe failures.
> > 
> > iface clock and corresponding dtbindings are merged for v7.3 and your
> > change will land post that.
> > We can drop this from commit message?
> > 
> > I think we should scale only core clock and for iface clock should rely
> > on ufs/eMMC controller maitained frequency.
> > 
> 
> The idea here is to scale only the core clock and I am achieving it by using
> dev_pm_opp_set_clkname() API. However, for that clock-names needs to be as
> required property under DT bindings for qcom ICE.
> 
> As the comment mentioned here: https://lore.kernel.org/all/b32c7091-b2c4-443d-b58e-759b471f67db@oss.qualcomm.com/,
> the current dtbindings supports backward compatibility with iface being optional,
> hence it is expected that driver should be backward compatible as well.
> Once, we plan to break this backward compatibility and make iface clock and
> clock-names property as required, we can say its out of transitional phase.

Kuldeep, I hope this answers your query.
Can you please let me know, if anything pending in this patch?

Abhinaba Rakshit
