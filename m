Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584420;
	b=sPu7mwqPsx5yF/XyrnAwCHNFPadl6UjJSghRvKTLCp6M4dI3ZaTvzm1xTlDxQIgAxgV/
	 sImk2ajEM3+GFwaBmEEqJTb/BmZoc8nCpXh4BO+RRm5iEmDf7nBQnD6Cj70ny6rWVdl/K
	 54nBFC0nXw+HuI7UHkuYOzZdo90Kr2IYcPcu+EVSZoT+tVeOGlxwv3PIVX0VSycdq2kKJ
	 ZEF8kpoyV6OWwwQckzbdeL9EQkcPR4DW8/rqW4JnuLFlNDY+UfPpMx+hTfnmX3sTE7h9h
	 DrM3QPVFtzbb7tjGgYXAai3Ah3l7SOMtS+C35RAfie2lALItmbFdsIpnVkDPOuf6DHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584420;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aGOHFGwXEplUcb5J2jf7CstzoMTcJdUqxlOWwgjcfJE=;
	b=gq79qD7sy33KEUWUe4+/8NtJFj8NYr+rhOU626XiSNQ3HPOoi+H/oNxiDissJhnQ8I7J
	 xd+Z4hVRiONxSZoPEt+HFZSPG82xbl2oawbXOOBZl9Y5TXeB/goah/Gq2ndTEnaVThtBG
	 JltKO/R+qvM+TFDzjMHXVjW+0wj6gBA0fPioNG6A35O/451GK+8jTVrTIM0aLXEfwE+21
	 Np7YypAk4m/ye2IxK6YESeoUwQw6DKA/5pIpqcM6hGMwPaepkR4OOi6bzIf7Q9/ZMy7IJ
	 yrv88P6X/wXFzhvfVypd8j7J9VVa8/SDf9U2mMfwYulA7SFgYAtFZe3wSgFkHQsARWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MD23HlaD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ib+SavxI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9907A606A325
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9907A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MD23HlaD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ib+SavxI
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg8lG977423
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aGOHFGwXEplUcb5J2jf7Cstz
	oMTcJdUqxlOWwgjcfJE=; b=MD23HlaDSVQb49QWUaSge6Fsr+jj2y8+s4uZ5ofs
	wdbea/3wkM2RVtLU8ZARM953neSDhgXReXlI6ZjvbERyRs+Y6Ev1vsDp8sLEenJx
	ViDx0iH1+PEOdk0erc9LMdsZBkW4nRUqGJpi3qqGiYyiY1LjAjV2rNYFs+jR/QsN
	E+9isTxvVKTWb3gHbaVlWclR40BB7VdWVFeM0502wlV2ZKQduqDsHppGENmYXRKd
	WgUBl99H0Bqm6WsiC57D4KcEu29Lx3xEP8lZiS7a7H2QSnibQTpTDeo1bxqcN12e
	LqPZCMAt9rSRfLyVM/7DHosezOfsGsCWeL90xCXAEtnTaQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs030kf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:06:58 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-980b637ed69so146502241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792584418; x=1793189218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aGOHFGwXEplUcb5J2jf7CstzoMTcJdUqxlOWwgjcfJE=;
        b=ib+SavxIsSkR6+u2Y6xJGg0Prs6vWOnTRf47oqznSK9ZYcrVSiWN3MCEblUxh3fqaL
         7viLgBrUkG8r0HVlWMQ30Etlvl30X6EaTvuIN9FferRQxAADErN5IUH2qoAy4D3SKgFq
         R3d91/QIXHFJM8Sy/NF/r3/rvbDWWlLVrVWNyYhB/j/VnmVv3VtdX/d4eyf/RFWD8gNh
         HnjGnIkN5GYFcMnF49+viDkDbiNAdS9cXDTUK5yuDp8idvjkBQaymALZzV7i6OmjYg6Z
         eVDtSBUnnyOHGY1onTRU0TFCVWl0iyGiEoiqzFchkSzfCwNT++CMihteQUSXni3OSlOk
         nZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792584418; x=1793189218;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aGOHFGwXEplUcb5J2jf7CstzoMTcJdUqxlOWwgjcfJE=;
        b=G17KzDuLH0eR0f8MjOQNbhBxu1TqYG5ded5Nm53grhWMsLQoZqMDd+KiWG7mghAA9Z
         s95dt6Bc38HiCjti8ATMoQ091ylVSPi/leZtr65B/HTyuqxADR7sNTRnuOKbUb1A7O+d
         AVFekbrRLqVy0okC93fs7Vph6y2nibOSMnROg2tdcWNZjedS/oyXFOuARt2yfBzP2q+/
         me4DjYYljWcKEGUEknoD9kjI48+yV/WGM2xWBslKwufkMHJxij3KNL4zNhSz7qDOVNMU
         4VX3ubHKkwL8Y0BbjkPEOCb1adlIjdtaCV+ckSQJvrDSYZlRhyBEwOy9yABu16yTGxsG
         i1cQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTlLpJbJ7NbmwlIGajEO27eCnfrdtx1/p9aWFfXCWQGO9Lb1QiNoLh2RFyNd2wvhqUjWVCguRQksGYESaJ@vger.kernel.org
X-Gm-Message-State: AFq9FYLBTVeTpyXnk7l0p6bIx+FvOT0f9FMSqQEfkZyE9JL7dXOgvw7X
	P9vyYsbjpZRoXzkQ0+FwdRPUd4wKNEtEFdKIakOpUeGNnKPAcMVtPxc624xGYZyzyx7FVZ3BAeH
	LWrrfDyTQvjGE4Aojftvln4d2pz6UMsebRKt65xcXT5kTtywI0HS9uoZbfWHHeq3otorQ
X-Gm-Gg: AYBFou0UKpBsUVyelC0PtUgs1T+CKjPpNygL8NdJ+JDe/czCabLWmjvMSpRFMHpE2nB
	9GpqSbWOYXjyxjzCnioZwONw5vaIqp54r/cY2SoolOYxPzrxCKofvpBg0YEUQ0phVBYjW66Kkyo
	N98Iea4Ylpanh4sW2WLHivkJDjIxtU67sP3b83XdxpcV90lPQiTl4JQW6V21KdLhAv6MuxZr0kM
	eRzCASnAd4N+eHFP4vGehVnlb8XCo9IXaqU7k8dNUqhqWR1RShstdhClP4ssSQhMq2pTdDF3iZ0
	hWOOELgjpxqqW4LCR3h2gfExzMk4kmi+sFyCjX8xtWv8VRtccZMTZL9AB3sycE6hzK9+zVLijmw
	VKoF7zF7ozSRCT2nn
X-Received: by 2002:a05:6102:2b85:b0:7cc:32da:56e with SMTP id ada2fe7eead31-7cc92682ea5mr523971137.19.1792584417404;
        Wed, 21 Oct 2026 05:06:57 -0700 (PDT)
X-Received: by 2002:a05:6102:2b85:b0:7cc:32da:56e with SMTP id ada2fe7eead31-7cc92682ea5mr523951137.19.1792584416773;
        Wed, 21 Oct 2026 05:06:56 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb80e859sm76955785e9.4.2026.10.21.05.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:06:55 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:06:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Drop CPU critical trips
Message-ID: <crcwoq7atn7pkwt7cryixquqydyxtqezphq4cpq3cokxuxmkcu@axzmbxzf2mwg>
References: <20260924-shikra_crit_trip-v1-1-730c48fa998e@oss.qualcomm.com>
 <xa4gmzdccrububsmervkbtwqpddsbikubvgsqksypqmx5oih2q@q2hz6tadbmu5>
 <53c6b966-a6ff-4b91-a2b7-d7faee5a6605@oss.qualcomm.com>
 <3a87d077-8b8b-4bcb-9f5a-03920ef3d38b@oss.qualcomm.com>
 <e3de4383-f530-4968-a177-288162cd34c3@oss.qualcomm.com>
 <727ru4mlgn2bf7ta42ww7772mekk6bea7sni5b2h556pk3c6xw@4atjqo2ygylo>
 <194cdf44-059d-4d03-8cef-d674ba37006b@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <194cdf44-059d-4d03-8cef-d674ba37006b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8aae2 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NRCdo2LqAGfow365lYEA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX43wl4rB8X1Tm
 erRKxZ3JIiqh2gXsEw/TPq6eDKYwvRS4mzIvNYZfby5xtdolMV4huhXA1Oj737mi5Yk2xMKKido
 KnbfRWoMiTnthHnlz3F54Bc8ErKgLx5WWjKVGJ600zF0QBHFRGg5ITsLfSMvNjtK7nG1UerbH5J
 tLpMH9yDrf9B4649EnsWB0eL0XZxa7PEx6wvdixx0WRSBpQyriEz7NcYVM7I+JA/QRzKa1AbnKm
 Vpapsox4uDM2TGZK2Mm4x3DRd1aHCUQ63BOs0SSThEhc+Qee6RHwMqZObRc3lnGTYyXc1ax6RAi
 UlcITdJv8fYnDdOJrtY4Cllaw9f60u4gV5L2JZ9C4YeJRc2Mg91s6QvbeBl9FbeWmglGzepxt7/
 Mr5QsP7PrFFUm0kZJ1gk6LDDMa4c7SeUrRh2U1F4LkzRCPHHKqy4QXkCSvoPfzh5wP2JLiCMHdL
 mze2Y56fF5pf7k+uIeA==
X-Proofpoint-ORIG-GUID: barmYt8KgTbOwZPLzCZWy9ia5ETYfzTm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX+7Tp7GDE6+04
 dLfdy62vAw6FIH6Y3C6uU20wo4rM9/46p+yuU/AMcR51RIkvDFSlMRFBjFPKF9Gs5znLGEOsQf+
 kpmiUE0nvLfFQcnU1BDP5PdRrRYvtGo=
X-Proofpoint-GUID: barmYt8KgTbOwZPLzCZWy9ia5ETYfzTm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210048

On 26-10-21 17:12:11, Gaurav Kohli wrote:
> 
> 
> On 10/20/2026 6:26 PM, Abel Vesa wrote:
> > On 26-10-19 20:03:47, Gaurav Kohli wrote:
> > > 
> > > 
> > > On 10/15/2026 4:43 PM, Konrad Dybcio wrote:
> > > > On 9/25/26 12:24 PM, Gaurav Kohli wrote:
> > > > > 
> > > > > 
> > > > > On 9/25/2026 3:13 PM, Abel Vesa wrote:
> > > > > > On 26-09-24 19:52:32, Gaurav Kohli wrote:
> > > > > > > Shikra firmware handles CPU thermal mitigation up to 117 C, while
> > > > > > > Linux CPU critical trips trigger at 115 C. This can shut the system
> > > > > > > down before firmware reaches the end of its mitigation range.
> > > > > > > 
> > > > > > > Drop the critical trips from the CPU thermal zones and leave the hot
> > > > > > > trips, non-CPU critical trips and GPUSS passive cooling map unchanged.
> > > > > > 
> > > > > > I thought that was the whole point of having the critical trips set to
> > > > > > 115 C, so that the kernel can gracefully shut down before firmware cuts
> > > > > > it off.
> > > > > > 
> > > > > > What happens if CPU gets to 117 C and the critical trips are removed?
> > > > > > How will firmware thermal mitigation handle it?
> > > > > 
> > > > > Thanks Abel for review.
> > > > > 
> > > > > For the CPU thermal zones on this SoC, hardware-side mitigation is already available at 115 C and 117 C, and hardware shutdown is at 120 C. Because of that, a Linux critical trip at 115 C is not very useful. It overlaps with the hardware mitigation range and can trigger shutdown before the firmware thermal sequence has completed.
> > > > 
> > > > Does the hardware mitigation just pull the plug, or does it signal
> > > > to the OS that it's about to? We absolutely need the OS to be aware,
> > > > so that e.g. the filesystem will be synced.
> > > 
> > > Thanks Konrad for the review.
> > > 
> > > The OS is not notified before the final HW shutdown at 120 C. There is also
> > > no useful margin for a Linux critical trip here, firmware/HW mitigation
> > > starts at 115/117 C and hw shutdown is at 120.
> > > 
> > > So 115 C overlaps with firmware mitigation, while placing it higher is
> > > too close to HW shutdown to be useful.
> > 
> > But having the 115 C one will allow the kernel to take all the necessary
> > steps to bring the system down gracefully, while relying solely on the
> > firmware will just kill the system before kernel can do anything.
> 
> Thanks Abel for the review.
> 
> On this target, 115/117 C firmware mitigation is throttling/prevention, not
> shutdown. The final HW shutdown threshold is 120 C.
> 
> The 115 C Linux critical trip therefore starts shutdown exactly when
> firmware mitigation begins. Moving it higher also leaves too little margin
> before 120 C.
> 
> So this patch drops only the CPU critical trips. Would you prefer keeping a
> Linux critical trip at 118 C ?

Yes. Again, we don't want the firmware to crash the system before kernel
has a chance to bring it down gracefully.

But how does the firmware mitigation (throttling/prevention) is done?
Shouldn't kernel be aware of such thing ?
