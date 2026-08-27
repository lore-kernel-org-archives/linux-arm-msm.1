Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007D24418E6
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 11:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787830824; cv=none; b=sLJg158yxXiIpBCiB6jH360cEDRQ9rM0GfLWzauW5JHSligZqm7+gjLKzBqDH6zqiLx3FUNPQh+fpTdjryHc90M2+Tqhv1d4H8jv32YjTMYxLz4dYAlbjqsenD/3anK8Qi7deKlvKYzNrFkShBULeCsNtcg/lzrZGFR66fPoIig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787830824; c=relaxed/simple;
	bh=OAKm82vaMaMeu3/aB1+1/H8WkwsDwUkXROpGLq6zs3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FqhaycLtgxJsTzxeTPBDiHphgGsP3k71nyKg1mmrXyUjUWS6cWqS+8g9ebjbcBV0BDmHogXz33NdRRRCD2voKKfK9i1p1V0CpU+m75cANw4QmNjsxeQXbRhB+5WjmWW3Ld26eN3wfdh3uSUGeBGfNdpUsm6qZbkUHls3CVWpDW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6AN7QCd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKbZl1dN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6AN7QCd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKbZl1dN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RBEAhJ3912604
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 11:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/9K2OuhX2ub4vyYxG2pgMBrg
	twR0S0sr9MtCBKOh4LM=; b=N6AN7QCdHiz/dxrxUu8KV0VPvKaBZGoMzd7KWkJA
	9IA1Op630EJcxvWJOplFwHSnEOpNpI6Zzu4yjsZyBSohtxFgqsQsRJMwKWDOU9wS
	SGuhHlIcET/0i1pAGFy+jwo+Kxmnh938WUIPefBZwjOz9q5AYiv+/TPim6YoyZ0r
	ed6+xI+Mdw0ubvYQT5CKXEsCtPgas1slo7+rPLETuBTusXc59YubHL9qBly6gakD
	hlF9SIjiT8jOsGb+mgg/nG+xFaAY+FPjY1MpPvVrH02HUVn373Xm+L2jIAHFdK6b
	NUT1g9wJ5GwYl1pw4oYkqMc2T6vXqwWoQhy/Dj5Wg5OQWg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gam6fg2w6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 11:40:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52faa0dd18bso10721671cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 04:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787830821; x=1788435621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/9K2OuhX2ub4vyYxG2pgMBrgtwR0S0sr9MtCBKOh4LM=;
        b=OKbZl1dNgZFQPqPdYukyOu9l/kJOv+f1N7bXbSKJbJrud7X7nxWSooT5HUCPiafGsW
         13A/T4seoUdgOVZXXwxF85WdCR8Jv9GfQAvFUfqojPCpppr91S0LD6C858etq7mwnS3K
         Fqa/1ZEFhZ+uvJ1GN7+tNvswCZnzO5ZTLhVxTFC9lt4GAG710IdpTC9hpqusFUzhEtHP
         5EKgm+IgtgqnrviOziebSwIud4uYWHPxnxAHXvwHw8swW3I69yJnHw4CEas0B1YT+GjR
         quevBwJdRhKwjvma6W5HNuuJvgYyRCImQCZOMJSMKhMmqAvvb9MZhnLuFF03n8/PLt+q
         s4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787830821; x=1788435621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/9K2OuhX2ub4vyYxG2pgMBrgtwR0S0sr9MtCBKOh4LM=;
        b=S0Q61D5dvyld/J+IljprrdBgejT0kin0mLJHiPFFoNSBg1BfCEQRBnCGQKTXRR2/Po
         nBTwiFc2NwuPR2qLbCrfbea/aLqpvSYhReiz4jqh83UAdVySSGb7OIaCC23qRcOYiMm5
         eEmX1Qb79QqE0KXrJCjNnC16K+xs5Z83odwvhG3k9GrW+0qsEQftnLbT9S+UGmb1n/Ap
         ajwSBQqeCYUCI8+th/kzlHYOLp78AwvR0lQsDYdC1+u1FvkCdzpVqcodosBfI9VN0+t9
         erJ0XqsZAVTfh4fPeEI5HlNhhczQBjZZbjqAvHYqaF5H293JdHz9mY9JjOTAvd0d56aK
         EJSQ==
X-Forwarded-Encrypted: i=1; AHgh+RqvnAy9Is0fEJy9QJ553/htF9YPRWiDuZZmvxEF/d/E4hO/Viq91qE2xfyno9F8k+YtBkfHw1EibU1kOa2R@vger.kernel.org
X-Gm-Message-State: AFuF++n2VxCVuU/suIOPiPW1KxA6CFaILXx1Yi7Eewq3ev10zpKAMnIl
	VFKup+pV7+hfG1T+t6JSuxp/LqnMw9ER4r4rdDMyAmPY1Z5c6hB+nmeFWDQHIk6+pTJRYAmr1Pz
	kYtCNARqSUF/fcQgv+X/9lQ28UU1tYQDpl+2rwzcQLbjoRvYoVug9kYPv3WVqMkvXfvoC
X-Gm-Gg: AR+sD11ie3f6AXdoS80agsqLGgso1q4Zvav2cDpoF5HXeDmsMZaCJRRHyPCIc1Edl16
	aVnfkG/4fk+W9HHr67hHP4PlFFytVb7DsMu66hnWGAxEIv5NIznBHCSgGmbUvYUXX7IJUCZ145p
	ev2t5V2QmS5gddePzVIdj2PDWOMJ8R7n0n2pKAAd9CgdSJITiqkyR6CwkMLsAqK3/ecTZGu6p0/
	5Gbc0kGrnVZZZRxL/4c7qYo6q7EyEJsyTKuVmQqFhZ8Rc4p/BnDmZEFLLGbZYoLgfuuCjxWGrD/
	IgrRGO4SIZMhFufyJooGsza2+i3w4z5fJ0UfNg1IPYJVHPEdd+aL5qYrfs3WtrkC2fD/sEnqKbm
	VVAKiVEUKSKaJ
X-Received: by 2002:a05:622a:844a:20b0:52d:f484:eefe with SMTP id d75a77b69052e-52f9f9ce476mr55498261cf.35.1787830821115;
        Thu, 27 Aug 2026 04:40:21 -0700 (PDT)
X-Received: by 2002:a05:622a:844a:20b0:52d:f484:eefe with SMTP id d75a77b69052e-52f9f9ce476mr55497921cf.35.1787830820613;
        Thu, 27 Aug 2026 04:40:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4c321184sm57928725e9.11.2026.08.27.04.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 04:40:19 -0700 (PDT)
Date: Thu, 27 Aug 2026 14:40:18 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp-x13s: Enable HBR3 on
 external DPs
Message-ID: <kz3r6x77eo7547qwjcboajzhqdc45qo4p5ko5kntwrerwke4wz@bwcedtixhzbm>
References: <20260827-x13s-dpaudio-v1-0-da73414c6ab5@oldschoolsolutions.biz>
 <20260827-x13s-dpaudio-v1-1-da73414c6ab5@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827-x13s-dpaudio-v1-1-da73414c6ab5@oldschoolsolutions.biz>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA5NiBTYWx0ZWRfX4boeuKW7cEu8
 qqxOpOGh6QAWfsQsY7zdJjZK3vpuVIyEjMJ3RXpP0u8JGvWCFt9AN4AiziHrDc6mG8t3rGPD/VK
 ABzNTCtZgaHcW9UMcTjnAXDpb/IDrE4=
X-Proofpoint-GUID: 1w0_JGHurqICi5gFD1MJBAjlQlFYsshp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA5NiBTYWx0ZWRfX+RMo7IW0VUpb
 p5rDln0nWXgqDrwSIC/uN9jn5oVBzY26UAq5TfPMfGm5zOEr/h2/VoRDmOYZHuC3F5Indo+wjEf
 dJgv5nEA9hwMm0GnRqpUhS1HC2MMPsz6zl53ZSPVZA42IH/IsoO+Wdpp40IY5347K+xLWhBDogf
 z6sdyMMb6eG1ykwhZPimpr0RppFI9EEYUpvS4xQ+PgyEj/g41ZHOxGR2ScZaSoFQauANGwATaEI
 QIKJnf54NNY4r6c4+vMAS1TPHYjEUgo0bwxDkoSrjN10hDHfI9tESL7KRz3IXKx7zdpGfoLB7RF
 hjjpW0ChuOptHk8gUV8SgdEbB+1XDRhKR2db0pnYwsqqAFpdPiv8g09pA5ANIYCnEQHBP5FSM8l
 fCQqxaMXvJxCCCqK9JDbYtbqWg02dBqCFA6xrW7bF05+lBA7khpRv41x2T4HyYjN+FqEFOZIpXS
 y4uawqPBuvDdTBV5trg==
X-Authority-Analysis: v=2.4 cv=eIgjSnp1 c=1 sm=1 tr=0 ts=6a902225 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=Uer6SED5Sbd5OPh8DIMA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: 1w0_JGHurqICi5gFD1MJBAjlQlFYsshp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270096

On 26-08-27 09:52:48, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> When no link frequencies are set, the msm/dp driver defaults to HBR2.
> Explicitly list the supported rates including HBR3 (8.1 Gbps) on both
> USB-C DisplayPort endpoints so high-resolution docks and monitors can
> train above 5.4 Gbps.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
