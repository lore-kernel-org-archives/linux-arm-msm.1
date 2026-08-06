Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AD63F4827
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 08:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786004795; cv=none; b=IDsBy2aM5INIgfEWe9hjrrBN40+pHL7Qtq+aCVVZxPBmxlcRl+Z9uciNYs1ojOPc9Rim49jhf8A9JI04BUflUktn1yzoTVZkg5OJeE1xUrR/ixHNH+7mYhTTqlcANQGMVTvuruyjKfXAjKfVk+7tZITKuWlsXQa9Glsj+zGsff4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786004795; c=relaxed/simple;
	bh=CAjqhcwHNRKbnaa42UOt+9U/v/DS7PZzAyfZXlMPn7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tFvhuPX/WttRbGRRQsMI92qNlc9+AmqFTTW1Wvdm5wYM0hnn9ImPccWs05JVKyYHICtZqqvUmbxur3FbGj7V9uhsLh1DtnTg4VIrGJgOoTQupRYtfTEbnWX+7xpnmRuYqwzrH+tSFaobUOd+i7l3etaLGBVW2g2pmIw4EMRTzFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V7T1gOB+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RZxOq59Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V7T1gOB+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RZxOq59Q"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6766hnFH1101761
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 08:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rjz4TdIkbhPe8Log7jOIfVb7
	EDRtwrsk5hrRZrQvDfY=; b=V7T1gOB+g8hmwNXEVaw11V5+GkSf4rEzG6wjXXBH
	vSrI735ls4c1tZCqvdASzqXBheTECE2BmTSKdchcDrC6CTiLfL6XVBGSTutg59d8
	9BGItOcKkNmKTP+bCKSQuGij9gT10KmZ2WFr2q1rpfmeFS91JvrrvxQy+VeGD+Fq
	YSyWhH5+/YqLX/d9t1VG7MgiLEXd64PGdJXkLtRLqLsS06kgGUt7M/xqMCelSv6A
	kVxWrIxQ44v14rytvM24Zr9hCknweeEA1m1rUV7NgjtPEscXUBgupNDexvYJBOkf
	uT5ny1qa4irqBbFvuyl2v4adSGMBtEnEbFgg//N6cBwSCg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvn8pre8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 08:26:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e62e3459fso191386685a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 01:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786004786; x=1786609586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rjz4TdIkbhPe8Log7jOIfVb7EDRtwrsk5hrRZrQvDfY=;
        b=RZxOq59Q4juQ/hcbZc8voghnTAc/xsmhHYbYMQdKNttrLLXoBPo21F8wLvFGyV4KZj
         gsOAEEct932H9Vdwr+VT3IwSkjmi8zjFYrCV0HdMGzpfmnMQJntTa8Ot7SB28RU/u/cT
         R0oY7QQ+m3uvQA3pvXiH4xOnaoQEDb0JquMfs0cyDs8hafNBOyIUG5wA1SrFkmTkTe/s
         JrbzsojvkCe8ajfaD2G3EDE7Etk0RJpgIhErYrZ68R24It3XQxR7SI52VGikE9DJacgV
         /gsOe58j1KkZwKxI8ULCODFaNgst5IOj3vjHV9lwBzi+xvCjG+UxgzLxICREgV0oYE4w
         ++wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786004786; x=1786609586;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rjz4TdIkbhPe8Log7jOIfVb7EDRtwrsk5hrRZrQvDfY=;
        b=W4r9wHiPE+95tUgDAz4/ammnMxHotqByyYHGBZJNSOOCpM30vecHMWWxJyCBY9Wb0B
         W1Kk85hBUsdkXnyZeuFN24e0WwGo7mi3fR+9XLg5lEwnB0yEOh8Pn+Anmxh28a2ZoNGp
         oj5Ggdbl5yQiLecnmi4wSfn5Jxi2Ucak1Xm5RDdOEeL5IzgrpTX01Twvrrgpm6FEB/vQ
         VsWN/dDOUA2kx9YOow5RyJnaPQc8MOZecNE4R3W6qc+LsvvFRGEEbWjRqFm88CpwaUHS
         ihvE7t/fS/EELnrJfaFDLUzfXSaEZUstey6s3tomoUOUXrEsbGLAQNxQAlSzrbeQYdT/
         ib6Q==
X-Forwarded-Encrypted: i=1; AHgh+RqcZDeg9vlR6KXcY70P7WO6VXc4s3VOO3V8shJXPlHDXWCOP5vWlHdAGZN7W7utpvN+MFhwWNnANZ/0vDRV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7IShbwjrYQWnFnAiMvIhEQdGzrzNvJl5EwFdecSkku3tl4yyf
	crWrnfFxBYmrCF94F3Zgi0bWMLoXvutdPl++Op8wqi4NFe4i88A5btDd7IjJa6oAsICpon3Zz5n
	R0FNR6KRumgYN1lBGsJJEYn9jSsqEmlkluSzc/hSitTQ1A1QA68XDCQWx3fqke37F61M9YzP9e9
	DU
X-Gm-Gg: AR+sD12Kq1jIGrQXhprD8Jhpv5ZvokCMxjiUpgjR553kgcdmzoSAmqjgvMU/JVI+Ts1
	9IRTJWlghAo2ITSFe90t0MAyXwMl9WSNFlCQS1btioLhxuAuXOrQzf8Jl3LI1Gv9RtohyYMrIFA
	/MGD67dljAKjmzYhgfqA2ES+RWvBj5HHjv2GWf6KTvKR9qw8L5xHLGnwy4j7m4y0Y6b8hAmZmib
	2RTDiIJeuCYWnioheUDma/ilhjfKrQu5sl4zyvQsBGd9H9xbVj+AfI7Eiu6khtDH1xiQ+o4dXXz
	YUs4DAb1zeg8byf5aMKd+pmKbU1yBECeku0POdeQpOnj+41Om0+rvMPIXYdsFU1FjGZF/ohblbg
	Kkww7H47QOsCnwWCSKMBBK7deU0powr4h6Y30YIGhDfp0viy1G+vyXBYNG5Dqq8c=
X-Received: by 2002:a05:620a:2620:b0:92b:c6cd:7f6c with SMTP id af79cd13be357-936491104c3mr1311811385a.34.1786004786308;
        Thu, 06 Aug 2026 01:26:26 -0700 (PDT)
X-Received: by 2002:a05:620a:2620:b0:92b:c6cd:7f6c with SMTP id af79cd13be357-936491104c3mr1311807885a.34.1786004785935;
        Thu, 06 Aug 2026 01:26:25 -0700 (PDT)
Received: from YUANJIEY2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9364a5662d5sm351902885a.35.2026.08.06.01.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:26:24 -0700 (PDT)
Date: Thu, 6 Aug 2026 16:26:15 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, yijie.yang@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: qcom: fix PURWA/HAMOA IOT SOM
 compatibles
Message-ID: <anRFJ8wZ12LxOUzm@YUANJIEY2.ap.qualcomm.com>
References: <20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com>
 <20260805-hamoa-come-v3-v3-1-20463c43eae1@oss.qualcomm.com>
 <20260806-angelic-translucent-shellfish-3307c8@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-angelic-translucent-shellfish-3307c8@quoll>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA2NSBTYWx0ZWRfX5YpCz5PCGpA6
 YurdVUbAw8mu+Itvl4TKaAAW1iuPjeTadhLv2ySI3Ig4O0cQ8S4hJ0gHEYND0Spgn8XImLaP2K5
 9vvbYQdFvcZV89x+1asSZMlJH+GhpJQ=
X-Authority-Analysis: v=2.4 cv=RPeD2Yi+ c=1 sm=1 tr=0 ts=6a744532 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=xBnWZG0RdbNwyBiSnqgA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: yv5LYomSE4w1FxdXc4yZkiotJX5SjaV5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA2NSBTYWx0ZWRfXzXuCXilBWayd
 bmHg5izFMZsmmDKsepGj0hNL3UqL1zRofNir/slO9cPDy1FknuAlK7gwCoWtNFiszlEb0GFHF8l
 87UnFf75cL/B9sTGYxiipaemjmqySYGZx3hzC/HxG8GXbzugRmucV5tz7ifLYBELyT06+yr04iy
 Fw+JN9zyl+1r89YxYxfjFRt6X0Y85amyBhIMwb29EpfmbawlBC7/VjClh3oNhjSuxfDt5iLYtyN
 stju/ctT6C89vi86pDfFrw7kdUWtWkud6ZXhSRoNOs00zEnAMRUzvsvARjn1IEeyxE5/vp/s+hF
 s27hv8dqf2oMH3wiTMnSvsSHW6iemVR3hxtrjEWwGLh8eTakvzq5s5dkMMsZq+OBH/vPu4QrSOc
 QvYKkaDniMmU4RMV6SSHqWxISeiEli01tDLdbXcHFBwdb3MqpeBvm3nkbwrDSQZlMfItSsg6/sR
 ya/vPSq9lGOZIoR3AxQ==
X-Proofpoint-ORIG-GUID: yv5LYomSE4w1FxdXc4yZkiotJX5SjaV5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060065

On Thu, Aug 06, 2026 at 10:04:23AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Aug 05, 2026 at 06:30:00PM +0800, Yuanjie Yang wrote:
> > The compatible strings for the Hamoa and Purwa IoT SOM platforms do not
> > match the naming used in the official hardware documentation.
> > 
> > The documentation identifies these SOMs using their IQ product names
> > rather than hamoa-iot-som or purwa-iot-som style names. In particular,
> > there are no SOM products documented with the names:
> > 
> >   - hamoa-iot-som
> >   - purwa-iot-som
> > 
> > Update the compatible strings to use the correct SOM names as described
> > in the hardware documentation:
> > 
> >   - hamoa-iot-som -> iq-x7181-evk-som
> >   - purwa-iot-som -> iq-x5121-evk-som
> > 
> > This aligns the DT compatible strings with the official product naming
> > and documentation.
> 
> These are already released, so marketing reasons are not enough to
> change the ABI.

Ok, will drop patch1 and patch2 in next series.

Thanks,
Yuanjue

> Best regards,
> Krzysztof
> 
