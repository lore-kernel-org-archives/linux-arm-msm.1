Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB68B37998C
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 20:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784837370; cv=none; b=LUb5qaypjxykhx20VBshd+6lbXa5lL49wYvaxoAGgd9WA+6HyL7FrqUsASmq7Y1pEf8Y2dNJ1JtAqzTkvmaX2c6Y5CpZBM2eIhtb8siJ2szHvMT5Bm88fO49sIz/AUlSvjFpXzHF5YR3oHA2aaf4RPn65WYFTc5YehtV98LPo5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784837370; c=relaxed/simple;
	bh=H0AZCZgDyOvdK2zdRG3/lZrnk8hCVizgQMRAjseZ/DI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVFCWliKPLKuhDDTi+l54E1pe+9gN1lCzSDgR3slJtqh5TgDfDd5NYq3pDhboncybGdo9LCRgiJfXHl+cGhhCrC4HDTuOyEWkfJwDMF5zCVqI3AI/lIw26PrK5km6Ecv+nz2aBlELVFJlnPUqOHoMLs4VVWoMEs51x1UGxU8dtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m33+PG7o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h5Pcqn28; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m33+PG7o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h5Pcqn28"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NIm1WC1844351
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 20:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K7z/EglnG7R9Oaf1L7bayz/y
	cLeY0+/gd0W+4yHQeZs=; b=m33+PG7o55a7zRNuMKwDgAcuxYK3P+nScaRFrF1s
	QFji+hsd1T8PhSIVeix+lIVEe6/+ddKYgn8rbCA/Q1Av2Hz97/LKSofiQP7GZVKW
	YvZRQIYBZbQUZlXDZ4YXI3A+omgC2d3YNl6MEdz9G2Uz6XRUyTo9+BUlPi42GETc
	0IY+K28srN3fGn1DUXk9qNs306YmQgqCbRUsDzPvOH9EICkI4UkSMwUOIClks5O8
	ZiX1u0wNd9sr0ibenzt5xglY02VGNhf/hmYgptbe7CD07CYq44UUGOFqmXs3QoFP
	1BS8jmKwRz4EUUQEx8/pv+OPqwYUarCLS6q7wOOmHBY0wA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkn9a1cfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 20:09:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21c01cf3so17433651cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 13:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784837366; x=1785442166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K7z/EglnG7R9Oaf1L7bayz/ycLeY0+/gd0W+4yHQeZs=;
        b=h5Pcqn28jlKaQKh7cwWqjx/SOqHOD4k1SxcE1Xa2HkPkSPxJAMiTroPMMGKDJbqGg1
         huUM5dHfi2A+y4JtfFCR1oaV7fhKUWT7+zZv9cg/BDVncPh23CCnjhl1qfvlKUaoOgZ3
         XxK+7zpBs31LV70JGNoxACyy1sLfKno3YxThM0XXiA5y8AYrpVBEtXWpgxHhc4dy7i6r
         WsKzIiSi7Vg/IrNSqODrD0bhovkktSvYH+EPDgOZfcxLSxxvzITxkO4U+d2plozRlLji
         f2JTuV+noUytv3m1qbDOJDXrx/ExthqpGf21wPig4DyDV3NjHeeQ5WrBvH+CI3iywo+s
         bA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784837366; x=1785442166;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K7z/EglnG7R9Oaf1L7bayz/ycLeY0+/gd0W+4yHQeZs=;
        b=NnQsZKMuSbNzhZmj9ux9hhGM7oDjw8tNMf7M5Tpo8qhJIWldCsgG1ACqOYvF3xOPhF
         Mq8C1PFNZvTOJ5CUT00UE3Z96ID4DKGyyeCQBQ20ICoY4JspjrsotRSmTGh+OI9agOj8
         5RSihi/4Z/GOojIIsCL58hD+v9n5JrPsC128GcI/aCJuakb/422kMiSSINEXVizeh3tq
         BKnUQAoq7xPjSZx5p2fumHoDwek9fNVhL0r8iPkHMacfsVjOq5QBf1Es5VE8p1zClN0x
         1bjIjKD6J8mMQYEZF5zlRf5Uqs2nbTBRo1rGfyT0RLx6+eCtrlMKUCn2gMSGQmlRebbV
         kLkw==
X-Forwarded-Encrypted: i=1; AHgh+Rpqok8Cqt9GQ7+A8xuyy7fLv2Z+OBo3/pcLX07gAcmTRXCJfAxIVPMhD429aFUDZcpPEhjpZxuAc6vGypdh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz09MCkrUXhJfoB51KtTo8FU7grXxd6bf70VTJYT0j7Hm7BClwy
	y9MU2qcGnQL3CLq71ZPvGk3DRDPKCjjG2zDN/ZQN2qVau2Bcgmf7Vg9eRY8HXYVpfDJzY9DO/pd
	Rwvl0GortZ5MxrOX53tUh6lnpZAQKa3lMzgg7E8bC45EqSS3nvMVCrQUU1In6nMFRlNiS3XGoBd
	cC
X-Gm-Gg: AR+sD12KC2zlRJmDEU3LSEEqWisSAfhbRTcetV4sV61OZ4OQKjEZWDxrcG75AL3AlAg
	+HoU1l4PM5ZCP49cSy1OqjQVuLD4S3X6bC+FaQO+FcdWJUeRd0WyrpOfYTFg9ioSQZMUqP/QnN1
	K6SpzDYhlaX07JXDFpmALpa9figRig4yLzuVnElqzwRSwcELAEZtx0OibW6CYRpU2ckgsFMFJm9
	OPs1X1XTEH5lO2lUnP3BhyUcx4WqiATXKxveqE+1mLJicUwkYvAWxiV9ZRzfY9tKZEkGrhp/crK
	Ykz4Te6hJvfsOqDm5ALV10n1N7bXxdXrsEsZ1iDqjllqnq8KctJc0dSqt1Tla2ZkCCpBrx2YADy
	8j+g+m9h3DbCpY3KYnRJaGYUQw1gUJ0qjPKelrPZ4YKISyio+NM1IeOtxijrkJ4MIn9FpyR0oUQ
	DssN/w1KzMENwQug==
X-Received: by 2002:a05:622a:1354:b0:50f:b732:2025 with SMTP id d75a77b69052e-5283df4d019mr42749841cf.53.1784837366462;
        Thu, 23 Jul 2026 13:09:26 -0700 (PDT)
X-Received: by 2002:a05:622a:1354:b0:50f:b732:2025 with SMTP id d75a77b69052e-5283df4d019mr42749451cf.53.1784837365986;
        Thu, 23 Jul 2026 13:09:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6c41f59sm11872351fa.25.2026.07.23.13.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 13:09:23 -0700 (PDT)
Date: Thu, 23 Jul 2026 23:09:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: glymur: Configure USB controllers
 are wakeup-capable
Message-ID: <xf5yjjvxjiefpemfsehqo7snxf3lsvg23vw7pfse2gsmdsywvf@ccddobgn62po>
References: <20260723-glymur-usb-fixes-v1-0-816357d5319c@oss.qualcomm.com>
 <20260723-glymur-usb-fixes-v1-2-816357d5319c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-glymur-usb-fixes-v1-2-816357d5319c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE5NSBTYWx0ZWRfX67R6+SLwoX5P
 fEBnGyGBqeH7CxGpb4WMKMIy/J3RuUOWuSTFk5OPjhamg6UyN1ccXH/aOXe2z5V4KUq+xnCl4CM
 9KG7KAp/krgsrXb6WTmIo1P00x+zXe+SixioFaEWNvdIBegB2gV4W8ahWMQMhbVZx6LtMU04dNK
 8zs1T4YRzkiV95lkmPDk/Z639dCvHW4wRbjd5PPAoyD7YgI3eUUoH6MobSGcRjCF0Ew69o+BURG
 eXGbE1tO/QCK3D8u/AX8LFL3GUsmioJW/D1HB1RpAELnNNEAUgo6j9bbSiiiap/9T2iPVycjqUJ
 BpCSEG4tbeKkzNZJkX+qJg+8TmLY5wMQnJV7vKZ0MOEABBpLetgvxky9QsEHVTVT/XKKmnig/9e
 Iv5yhrIy/xqC4KJsFGhZSrCXaoT7R28DYUpnhb/aAxy88p016OZBYfpmPt3LRywB1bcpN5647uB
 bYtXYAd2KdnzX57KfNQ==
X-Proofpoint-ORIG-GUID: 0aMD8bNZ9Rg0Kg88A2M_CL06eoCyrlLt
X-Proofpoint-GUID: 0aMD8bNZ9Rg0Kg88A2M_CL06eoCyrlLt
X-Authority-Analysis: v=2.4 cv=WOdPmHsR c=1 sm=1 tr=0 ts=6a6274f7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=i8nJ_-aNT86P3f_d1rcA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE5NSBTYWx0ZWRfX5+nEa2yS66rJ
 nd47zHzJPOLCabqYni+shrSlskKljzsbfPz34UoyLVq2l4LlUb957WSjqqQhSTeA1V3Ap32Uxxn
 B58kCOaN9sUaAaSbn++I7khVrYgtVxs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230195

On Thu, Jul 23, 2026 at 11:02:26PM +0530, Krishna Kurapati wrote:
> All USB controller on Glymur are wakeup-capable device. Add wakeup-source
> property for each of them indicating the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
