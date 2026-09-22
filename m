Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E50D4248DC
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081147; cv=none; b=Zg+klg9L45U+sy884vHjrvK+iPC8E+IWKdcYlhHTZP0/KO/ObZ/Sy1ZkCIBK37sue5qkaVVrTgVRE3XolZF3x3nu9kUnodtNmqjMEIQR8YL51JhXF5NbsXr+YrlfL8dNv9/Mk2l603SQgixPjlhphj8YIdyVOw9cqqtglfF+Tb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081147; c=relaxed/simple;
	bh=teH5ei3MBK+NMl4BXDarhxXz1RAQj80oEkiGD43HreU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KEeYc8aH4ofpjmTMvchDLhVGFCkWYCnG/8ZxL1Pq5hwgP2Wy5zs0gqsERorn4dOqOZswpIQgaUWkEM3mvkttU6O+66KcOkBrI0/LGQXy/Y7pYMnO0QyNa4PDajr/l0CRn5nNMYC3TOcFFbaL54ADota0xG7WzviUR8HYJ6SSB0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GBeoOfbf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ut66vD0P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GBeoOfbf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ut66vD0P"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPTKN3516035
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c2oXXnZSchD/J/9BfqsyDFGm
	NEvGeY7Is7L4w+xWaQk=; b=GBeoOfbfqUnEl6W4jGX6cfFGk31pY9sW9+sYL8HU
	1UZeijE3YYgWODKmIfFkoYD5arlMe5XkMx3i85xvlTemN3PNEgQnC/xKMcwaMUvQ
	t+HbZzQSIHlavc8y74o8tocgQiZweVeGKL+dUKMYCWLN1Jp73IPsLw/5dZVIWfIH
	tVzHPx6fipIh4kDy0X6Br/aDgwQnxJ/YNm4wSxPFp3eFTzqpu2UTvkBHAP8MPpI+
	m/8CTY6ysvjBe/XCExRLJdT8m1FGgHGuYKTKxQ0y6RtKPt3ECo4nTrWbSYkuBLUG
	0OCp0t5zzJcFaQe5dtR+kfTnviJ2neYOYjZhinb2OH0V3A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufsqades-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:45:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39533bb224cso7130093a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 05:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081144; x=1790685944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c2oXXnZSchD/J/9BfqsyDFGmNEvGeY7Is7L4w+xWaQk=;
        b=Ut66vD0Pz2e9UJsuEBemmgA5mgiwZp1eXCpBJo9kImHL7qTYyWip5KyzK5x4+x4Uir
         obaLJsfE9zatxvMtEMwC3ED0C2ufo0d9BJpUZ0Tun6Ln8If4vdIGyZwE/+8aGeegJS9v
         1Oh9dgDsgr+XPj+VG3Mq2Q9UNd8o4WMpawChtGlwjWYKKdBR/1zMRuzIRBnqXMbVgwpE
         1hmiZuWaVgcTdIDwWp8jEA1CqHx3elGD64q7hSlpr8vLPyj2mYpgoG31bxOODpqBtUEa
         HiD/LTKlE6uMieSrVl4vmDIBc2hbfWki5gcujm2Gmdq5s8/v7OQq3UxWA2HQZ4gvDxhD
         UKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081144; x=1790685944;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2oXXnZSchD/J/9BfqsyDFGmNEvGeY7Is7L4w+xWaQk=;
        b=yrP2SUHs2dx7bNvwAxRG8J1LRIxUpwK8pqQby2UtFBcXMyKlFhB9yFmiCDVQWFsjC2
         xH0o68aq3d/svQJejnvbO/xZwAzXtYkYgwQ5oszPsqXFQvIjpMTyBjEoborrXFs4hIvy
         nFwUFvCXKqEIoHZ8igOTGK+JhvW0eSTUgwCtUs6F/IdwSQB/josFQJpf/f1bmzH0ICMU
         3WvoRAWh+tz6Fw5k/7TurHbEK+52x2Njp1KrNVdnTp71J+ZP3uJBPELi/3/ThccPXzjb
         87PVCsRr1GjU2Hr/Wgy1gz5e9B2LeB/2zsVny+Pep6k9xN1bmIVc93f6qfNB6o16H1IO
         RYRg==
X-Forwarded-Encrypted: i=1; AKwUvByIvT3j2tMP5ZQeyqdYYpYbJD2Gm18Otz/mF0gFRYHMQF79KTRrOvgoEBa8zIbEjSExyy+aToPPuGw+/9iP@vger.kernel.org
X-Gm-Message-State: AFuF++l5fij21884neJgJTv3YXg6T1PKidVH2FfL7AgRSS+IEB37u8Tw
	dd5mJEqdKKe4g33BgWZFUpz9u1hyW6mdHIEHuAgQkQVpfzkYUZXFmOpIm23bjq7EhThhP3lUSEJ
	x/L6zm/bXWE7OU1lmgFe62NBF3Jn+gL7Cramqnr6AtfWHoN6hCzfD8ytk6oZ2WrdkHLyW
X-Gm-Gg: AYBFou10maRd69cuZjjKu6K0r40DlO5ecojeKNEI8Q0lAd4Jj/RphptbP/UKiEkr0rl
	N2F4laiacODR/io8/GAzrZHZLXEl+++8FwE3/cIv0CsfBfjPnJOv5ecJ3Qe19/2LrnU82K1a1M5
	S65QCa90d0RsogNuVaj+PYfotzmlNcZifiF0LmCVCJ7057MnjVCuKzCdhg2gqwc6tRXyHzuAquZ
	VjCkyzA9KBPdsasms/1NB8kZN9lwynxyIJcaHlSfTLUL8RBTu1jyG5TxAKPRQ3gcr12WzaSXT/Y
	+M+g7a84aBw0nUC0sF1R7Vwu3TPAuiFXZX/931/hOLLAHgoFumXbVdwRAzeCeeWAcFFpdouTl6K
	HWEFcrtw+2Uj7oYp7YVo8fwwpHm89qmPivqgCCjJdCQ==
X-Received: by 2002:a17:90a:bc8:b0:39e:6a7e:ee20 with SMTP id 98e67ed59e1d1-3a073202727mr852107a91.44.1790081144027;
        Tue, 22 Sep 2026 05:45:44 -0700 (PDT)
X-Received: by 2002:a17:90a:bc8:b0:39e:6a7e:ee20 with SMTP id 98e67ed59e1d1-3a073202727mr852079a91.44.1790081143453;
        Tue, 22 Sep 2026 05:45:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e574b5esm3204533a91.7.2026.09.22.05.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:45:43 -0700 (PDT)
Date: Tue, 22 Sep 2026 20:45:33 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v11 0/9] media: iris: Add support for glymur platform
Message-ID: <arJ4bUn7ZG5y51DA@QCOM-aGQu4IUr3Y>
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
 <20260917-dangerous-illegal-honeybee-cf479a@quoll>
 <ad32f584-ea27-4da9-9397-147b887a7d68@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad32f584-ea27-4da9-9397-147b887a7d68@kernel.org>
X-Proofpoint-ORIG-GUID: 3ZLBjiXtOET2ZoBya61kZm1gP3hoVGOZ
X-Proofpoint-GUID: 3ZLBjiXtOET2ZoBya61kZm1gP3hoVGOZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NSBTYWx0ZWRfX230IREvV1PCk
 SK4YOZPzr4PTsQQjISjJfq6OTJ9RTs80CBHdQ6MsTtoKOrUgLhWv6yhdFKp94uvzJsH7rvSRpwK
 PwOR8IVdoN15Mv2G8oLrs341cT/sxe0=
X-Authority-Analysis: v=2.4 cv=NKBAaE6g c=1 sm=1 tr=0 ts=6ab27879 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s8oyx3DkIhJI7QqzJRcA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NSBTYWx0ZWRfXy886mLC2/V88
 /ta6Ri0xYch4iyy1drqrYjNsbQ3UdNlYtuNX+wHV9/IXQSTdlKg2YUjULHlixbPKoxRDCmYzbxW
 A/j+6c3prAPnha8+fiMKS0919UbRKeH5THtgRWrigggC4G/1vcJxzGJtVCgilbESVkTSl26oFOw
 CjE734zXX3FUUT5934C6SOtODMygXt89pEtuuCcaTrZju8TBYugK7pRfSc3Htjeyb5OBU9TaEvE
 +l/u8UF8D6jBGYegkgVsvLClVRpqWBYBFF7kpTsZcteNEiMkX2xI969BwEaDdoO2HzLjQKSEe5P
 DBYEoks3No6zJihiqS6n6Jt3vhPJiFswrlXhqeV4sI57K4fNvA6ke6Os+tejRNChcuEuKm0ScFu
 J5WaTKzPbAMGpQzfXtMn9FgT3CHBfwY2lbSUzv0OaUOrfZRDutqmjzlq6jpOFyeZphmJ4PdeY97
 TbNgfoShaVry0WRA9xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220185

On Thu, Sep 17, 2026 at 09:11:50AM +0200, Krzysztof Kozlowski wrote:
> On 17/09/2026 09:09, Krzysztof Kozlowski wrote:
> > On Thu, Sep 17, 2026 at 10:30:19AM +0530, Vishnu Reddy wrote:
[...]
> >> ---
> >> base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
> >> change-id: 20260917-glymur-627d049900e0
> > 
> > Look here:
> > https://lore.kernel.org/all/20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com/
> > change-id: 20260601-glymur-4fcd4d832ecc
> > 
> > so now does this work?
> > 	b4 diff '20260917-glymur-v11-1-e0c8bc914742@oss.qualcomm.com'
> > 
> > No, it does not. You are sending bigger work, multi-version one, part of
> > even bigger work, so please get the process working correct to make
> > reviews easier.
> > 
> 
> And it is getting even better:
> v6 change id was:
> 	change-id: 20260515-glymur-6e69bc258fb0

It's funny that b4 processes the change-id in your replies like review/ack
tag, and so they appear in commit log of every patch that b4 shazam
applies to my branch :) Something like this:

[ commit log ]
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
change-id: 20260601-glymur-4fcd4d832ecc
change-id: 20260515-glymur-6e69bc258fb0

Shawn
