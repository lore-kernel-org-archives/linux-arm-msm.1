Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2473F39D4
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 07:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421733; cv=none; b=RgCS1+zqeFk09ugoNIE/jsJJVSTWit+Y37wtL+Yi6zcoMPQac7JeIELirHNMREikTcsouXlQVdIHj5xVJkRDozfvDUkQeTRBpOPtDTsdQlKHbq4NYuWvmep3P1ilY0UJotrwlYqHtZhsMq029GZ3VoadSQ8v23TARFeZaaDgVIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421733; c=relaxed/simple;
	bh=7ijGiS2+wzo4PwNz/evt6IxgRjZZ4JMihlDGZHu76oM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TcMMc2h3Ipe3A0utYwiQVnnE37YmE6LFmllN8omcQ9EPNullUvcEghRi4E6Eq4mC1GRm1B/0o9/KHWdjlHFIWY2EbcgS13Oldo+eqOXP8HfVO8/IfOmG64GaTH4vNEbVWAzWT9VKc+NjcuxXDZl5qYpI7Uu9esMOD3jb/cZNDJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sco4QHmr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpQqp3yo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sco4QHmr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RpQqp3yo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lVe23749563
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 07:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mz1cnQxwXtL2p1I+qlbL81gs
	7OQn/pzuf5bl8EXskxA=; b=Sco4QHmrz6tuR1a2suvlpCxvgAALq1WPq9fZogAk
	w9dejBQ6ae32A1bNP0zTxORjwMchVn2JpmtvuJryBDIYts9tcXJhgt9Vbqz/gVjS
	xGgVDqjg2knRSJAGwrLKgrO3PAQXJz7lFzOlbd/8FKaTG26NGKPfZ2O1ldVKFuld
	sjL2tmJow04q3AD3JUDm6qVGNFSRhg+WsbaM+lhGzirlRE0MCN7MfywdBKpahdiu
	wxoGBXADc6cNmJ8HappuKRxNICRRcFfHcRpn4LBAJDhTdf46AVWKK2jPhW1FcMXH
	aqfWsv6kUp/1yiqCZLyvdMchNWvSLXsCBBqJtUbYSve2Pw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5ugx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 07:48:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930b571432fso124249085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 00:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788421730; x=1789026530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mz1cnQxwXtL2p1I+qlbL81gs7OQn/pzuf5bl8EXskxA=;
        b=RpQqp3yojvQJgzvfONzUkhquU50yn1k337SQNN2Qh45IPEieoyc1ej9dsKmLcdriw9
         x4q5ePnHs3mV0+vXTRX9kxbTPtZIsfhpOLeiW1zy7Wioi/L98g058k7CN1h7YUFxbecY
         vtIBs+HIonxWcX1RKOuRdUo2jHhzZwjhGEP2L3FOASbOsSuOOK3TkDvxjc48IEoes9GM
         S4DbXMTq7ehcMplxbCswj/799Gb8CuvsWuHXciB8ulIDlYGxvIhdhvrxj3vj7o9m55Xm
         kI/rpu/jQauHWlEyYsb8vpgTyqKkPHmdpSJtUkkwRREpbOhn0G9Qa96lMNltHJ6CZNfd
         cmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788421730; x=1789026530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mz1cnQxwXtL2p1I+qlbL81gs7OQn/pzuf5bl8EXskxA=;
        b=Jv+SOWf2T9TvyNC6t5VcbLGoMNunW2Z1h6j+CRsd/YRfUinpVeC8X/pCm/qRnbH4uz
         /332p7/5NGi+qKlVHjI5FuAXS7+U5Q0uHyecp1Qj3gHaQfHtyLJnUKdCvLC7uK1INzj4
         CVV3BRK1B6FkcUH8UEkJbciZ3IMROL+vbch4rTie44E2Te2I36A1GSnJ0jY+PStrStsK
         gbmIhLm/kPjEtIIdNevPdHPB+oht2ZxU3fv4h9ImQpYqyozGbQEyvAUoFO+iFXcPmO05
         JITERcK/LN2WP7Osd4ENeUnkLgPop1YpsE5WPebo+DkFcoCa5tWviW+qhIcd62sCSgq6
         88VA==
X-Forwarded-Encrypted: i=1; AKwUvBxQfPH10Q0YTS1dTZzgUNmXezDHyq9NdQFxpNFfmhe7G3QTR8lbp4yJ5CLLeQskxwbQFDTVeu+vocmXk7KC@vger.kernel.org
X-Gm-Message-State: AFuF++lcso2roc7heg8MXU1YeFem7eWf5Gx7uZWRTS53abmNOY0/94sG
	q86wehjN28ewmZBBxGWx2ecIChY5OCL7puLo7g3pe/3lQL9OkrD6a0Q8f5xDJ8Y/FPcIHiXsAaY
	FtMiAJBPe6PwYbaBRFrwpZ9taYYttEgn9ZkWccIFyCb4tA0pq60hHWEAIYh+LUb8qLObQ
X-Gm-Gg: AYBFou13Y2hsefI+8pxsOkhE/fpKzfRzONxPaqJndEewuwbAn7G4XdUB1tSZh/kFaMu
	XkvvqMFThufxvaNxPgwWBI38A+vJWyLgTY29ybZd+8Kpbn0d/eLfenFE5lE+28ehu+0p4PrdfAG
	xUhij5uD8+oXqjT48ifDkqfsq4ly9QxcWQjbAFkMZYSrfGx/uCKukAauWWKZmCrB4FH+3ZqoLtm
	pfr4ek2UsMjNpszyRL7zNy9ip4ew8nJJUQw8pYEhDyp+32COOsIeadeN3Mm32EvXTflW0Qgh0ft
	2TLmr3brI7IvXAm9q9Gcz4cr86SxpJEXMo4NYuscPCmr8RwGT9IpjplE1BpMMLj1iooGqFLy0tG
	D0ZAS379voIus
X-Received: by 2002:a05:620a:28d0:b0:939:72cb:bae6 with SMTP id af79cd13be357-93972cbbcc2mr145314785a.29.1788421729736;
        Thu, 03 Sep 2026 00:48:49 -0700 (PDT)
X-Received: by 2002:a05:620a:28d0:b0:939:72cb:bae6 with SMTP id af79cd13be357-93972cbbcc2mr145311785a.29.1788421729142;
        Thu, 03 Sep 2026 00:48:49 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed38cfsm10924848f8f.19.2026.09.03.00.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:48:48 -0700 (PDT)
Date: Thu, 3 Sep 2026 10:48:46 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: shikra: unreserve GPIOs 14-17
Message-ID: <d6l62gsplmvzip2cdoatgrz4dy2ko2e2kqc7ecdfcfuljwumpl@lxs4au7jhoqx>
References: <20260903-shikra-dtpm-v5-0-e8ea3ac8a135@oss.qualcomm.com>
 <20260903-shikra-dtpm-v5-1-e8ea3ac8a135@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-shikra-dtpm-v5-1-e8ea3ac8a135@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a992662 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=rJE1ynEhMgyPisKzH1EA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: oKbq2CG3Ma9VrDntj3aujveqnWWu6RfI
X-Proofpoint-ORIG-GUID: oKbq2CG3Ma9VrDntj3aujveqnWWu6RfI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OCBTYWx0ZWRfX4Uy+ospVD2Ok
 3w2cUQp8T2LUGPTZ1ARye854hCcEEEg35cZKAWZ+k65Qyx0cmm5JMSS+nJSQjAOpsaFKHxn+zNa
 NGrWbX/44eAHP03SzEneLVqIr+jkzscLfd6eOLbhWkYGFDLeGBTv80vbEkaGld2Sh9GUJF7TsUr
 lKLbMlhnF79/vXFkSPbb9jsK++zT9kB17QbBRYwO7Z3E2l7GQqUDA2IT3tzFgIQKd8VeCozkmAM
 0QrPg6VwETWFms+TihNVZLg1js32MTwEXnpOjkTK2BPow/fhPkNyzQM+u6ffkfMCExn8FF8v52c
 rdILX03rAUPKUJFuwTfk/dzHdSqJZXcq69dX3i0Mar1H/GzdvzHkuUETPC21r9nJKFwQ2Euu5HU
 HAeb8XQR/bPANUTX4vjvrUy7SliDRFKg6DETBcMyABB85uOyKw/PZZs7PwvNScZoW2mTzYETRbB
 5wm6+cnbZr8jKdc0Ixw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OCBTYWx0ZWRfXzNmvjKvQI+hq
 XNJYm9w9WqT41mS6W4Ksy1/N3R+8GuhTwx14x/8b2LEC7/+Ykw5Y0FAMeUB9R/HuMLuaEZWN8zr
 u3W7V3HmC0/4rWBJGHmj5HBwhCT1kXE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030068

On 26-09-03 12:48:53, Khalid Faisal Ansari wrote:
> GPIOs 14-17 were previously reserved in the tlmm gpio-reserved-ranges,
> preventing Linux from accessing SPI5. Removing them from the reserved
> list across all three Shikra EVK variants (CQM, CQS, IQS) enables it
> for dTPM usecase.
> 
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
